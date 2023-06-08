package com.home.pooh.model.service.board;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.home.pooh.domain.Board;
import com.home.pooh.domain.BoardFiles;
import com.home.pooh.domain.BoardVO;
import com.home.pooh.domain.InputFiles;
import com.home.pooh.model.repository.board.BoardDAO;
import com.home.pooh.model.repository.common.file.FileManager;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDAO;	
	@Autowired
	private FileManager fileManager;
	
	public List selectAll() {
		return boardDAO.selectAll();
	}

	@Override
	@Transactional
	public Board detail(int board_id) {
		boardDAO.updateViewcnt(board_id);
		return boardDAO.detail(board_id);
	}

	@Override
	public void delete(int board_id) {
		boardDAO.delete(board_id);
	}

	@Override
	public void update(Board board) {
		boardDAO.update(board);
	}

	@Override
	public List selectList(String searchItem) {
		return boardDAO.selectList(searchItem);
	}

	@Override
	public int regist(Board board) {
		return boardDAO.insert(board);
	}

	@Override
	public List selectListAll(String writer) {
		return boardDAO.selectListAll(writer);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int regist(BoardFiles boardFiles, ServletContext context) {
		//0. 일반적인 파일 저장 
		//1. 파일 List 저장 , 
		//2. board에 저장 
		//3. boardfile에 저장 DAO에서 값이 건너온후 정상완료시 입력
		MultipartFile[] photos = boardFiles.getFiles();
		
		int result = boardDAO.insert(boardFiles);
		//이시점에 board_id 있음
		int board_id = boardFiles.getBoard_id();
	
			for(int i=0;i<photos.length;i++) {
				long time= System.currentTimeMillis();
				String originfilename = photos[i].getOriginalFilename();
				String refilename= time+i+"file."+fileManager.getExt(photos[i].getOriginalFilename());
				long filesize = photos[i].getSize();
				InputFiles inputFile= new InputFiles();
				inputFile.setBoard_id(board_id);
				inputFile.setOriginfilename(originfilename);
				inputFile.setRefilename(refilename);
				inputFile.setFilesize(filesize);
				fileManager.saveFile(context, refilename, photos[i]);
				boardDAO.insertFiles(inputFile);
				
				if(i==0) {
					boardDAO.updateThumnail(inputFile);
				}
			}
		
		return result;
	}

	// 게시판 별 게시물 
	public List selectAll(int type) {
		return boardDAO.selectAll(type);
	}
	public List selectFileList(int board_id) {
		return boardDAO.selectAllFiles(board_id);
	}

	@Transactional
	@Override
	public BoardVO detail2(int board_id) {
		BoardVO boardVO= new BoardVO();
		boardVO.setBoard(boardDAO.detail(board_id));
		boardVO.setInputFiles(boardDAO.selectAllFiles(board_id));
		System.out.println(boardVO);
		return boardVO;
	}
	
	
}
