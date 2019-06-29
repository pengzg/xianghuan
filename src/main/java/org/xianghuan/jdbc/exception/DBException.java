package org.xianghuan.jdbc.exception;

public final class DBException extends RuntimeException {
	
	protected String errorCode;

	protected String messageArgs[];

	protected RuntimeException orgException;

	public DBException() {
		errorCode = null;
		messageArgs = null;
		orgException = null;
	}

	public DBException(String sErrorCode) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = null;
		orgException = null;
	}

	public DBException(String sErrorCode, RuntimeException exception) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = null;
		orgException = exception;
	}

	public DBException(String sErrorCode, String sMessageArgs) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = new String[1];
		messageArgs[0] = sMessageArgs;
		orgException = null;
	}

	public DBException(String sErrorCode, String sMessageArgs1,
			String sMessageArgs2) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = new String[2];
		messageArgs[0] = sMessageArgs1;
		messageArgs[1] = sMessageArgs2;
		orgException = null;
	}

	public DBException(String sErrorCode, String sMessageArgs[]) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = new String[2];
		messageArgs = sMessageArgs;
		orgException = null;
	}

	public String getMessage() {
		return super.getMessage();
	}

	public String getErrorCode() {
		return errorCode;
	}

	public String[] getMessageArgs() {
		return messageArgs;
	}

	public Exception getOrgException() {
		return orgException;
	}

}
