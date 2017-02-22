package exception;

public class LoginException extends Exception{
	public static final int NAMEEXISTED = 0;
	public static final int WRONGNAMEORPASSWORD = 1;
	
	private String message;
	private int type;

	public LoginException(int type, String message){
		this.type = type;
		this.message = message;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}	
}
