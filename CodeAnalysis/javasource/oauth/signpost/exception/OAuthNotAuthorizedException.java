package oauth.signpost.exception;

public class OAuthNotAuthorizedException
  extends OAuthException
{
  private String responseBody;
  
  public OAuthNotAuthorizedException()
  {
    super("Authorization failed (server replied with a 401). This can happen if the consumer key was not correct or the signatures did not match.");
  }
  
  public OAuthNotAuthorizedException(String paramString)
  {
    super("Authorization failed (server replied with a 401). This can happen if the consumer key was not correct or the signatures did not match.");
    responseBody = paramString;
  }
}
