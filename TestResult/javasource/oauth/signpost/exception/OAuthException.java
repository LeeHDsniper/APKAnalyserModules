package oauth.signpost.exception;

public abstract class OAuthException
  extends Exception
{
  public OAuthException(String paramString)
  {
    super(paramString);
  }
  
  public OAuthException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public OAuthException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}
