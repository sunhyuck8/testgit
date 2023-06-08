package com.home.pooh.exception;

public class FileHandlerException extends RuntimeException{
	public FileHandlerException(String msg) {
		super(msg);
	}
	
	public FileHandlerException(Throwable e) {
		super(e);
	}
	
	public FileHandlerException(String msg, Throwable e) {
		super(msg, e);
	}
}
