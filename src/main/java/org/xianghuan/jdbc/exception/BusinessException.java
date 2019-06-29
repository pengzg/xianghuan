package org.xianghuan.jdbc.exception;

public final class BusinessException extends RuntimeException {
	
	protected String errorCode;

	protected String messageArgs[];

	protected RuntimeException orgException;
	
	public static final String ERROR_UTIL_CODE="99";
	
	public BusinessException() {
		errorCode = null;
		messageArgs = null;
		orgException = null;
	}

	public BusinessException(String sErrorCode) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = null;
		orgException = null;
	}

	public BusinessException(String sErrorCode, RuntimeException exception) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = null;
		orgException = exception;
	}

	public BusinessException(String sErrorCode, String sMessageArgs) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = new String[1];
		messageArgs[0] = sMessageArgs;
		orgException = null;
	}

	public BusinessException(String sErrorCode, String sMessageArgs1,
			String sMessageArgs2) {
		super(sErrorCode);
		errorCode = sErrorCode;
		messageArgs = new String[2];
		messageArgs[0] = sMessageArgs1;
		messageArgs[1] = sMessageArgs2;
		orgException = null;
	}

	public BusinessException(String sErrorCode, String sMessageArgs[]) {
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
