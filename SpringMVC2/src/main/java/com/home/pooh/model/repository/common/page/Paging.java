package com.home.pooh.model.repository.common.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
@Component
public class Paging {
	private List list;
	private int totalRecord; //총 게시글 수
	private int currentPage; // 현재 페이지
	private int pageSize; //페이지에 보여줄 게시글 개수
	private int totalPage; //링크로 표시될 페이지 개수
	private int blockSize; // 번호 링크를 눌러서 크게 움직일 때 쓰이는 사이즈
	
	private int currentBlockSize; // 지금이 몇번째 블록인지 알려주는 변수
	private int minBlock; //블록사이즈만큼 빼는 변수
	private int addBlock;//블록사이즈만큼 더하는 변수
	
	public void pagingInit(HttpServletRequest request, List list, int blockSize, int pageSize) {
		if(request.getParameter("currentPage")==null){
			currentPage =1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalRecord = list.size();
		totalPage = (int)Math.ceil(((float)totalRecord/pageSize));
		currentBlockSize = (currentPage-1)*pageSize;
		minBlock = currentPage-blockSize<1? 1: currentPage-blockSize;
		addBlock = currentPage+blockSize>totalPage? totalPage : currentPage+blockSize;
		
		this.pageSize = pageSize;
		this.blockSize= blockSize;
	}


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}


	public int getTotalRecord() {
		return totalRecord;
	}


	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getBlockSize() {
		return blockSize;
	}


	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}


	public int getCurrentBlockSize() {
		return currentBlockSize;
	}


	public void setCurrentBlockSize(int currentBlockSize) {
		this.currentBlockSize = currentBlockSize;
	}


	public int getMinBlock() {
		return minBlock;
	}


	public void setMinBlock(int minBlock) {
		this.minBlock = minBlock;
	}


	public int getAddBlock() {
		return addBlock;
	}


	public void setAddBlock(int addBlock) {
		this.addBlock = addBlock;
	}
	
	
	
}
