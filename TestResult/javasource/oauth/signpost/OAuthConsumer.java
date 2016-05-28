package oauth.signpost;

import java.io.Serializable;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;

public abstract interface OAuthConsumer
  extends Serializable
{
  public abstract String getConsumerKey();
  
  public abstract String getConsumerSecret();
  
  public abstract String getToken();
  
  public abstract String getTokenSecret();
  
  public abstract void setAdditionalParameters(HttpParameters paramHttpParameters);
  
  public abstract void setTokenWithSecret(String paramString1, String paramString2);
  
  public abstract HttpRequest sign(Object paramObject)
    throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException;
  
  public abstract HttpRequest sign(HttpRequest paramHttpRequest)
    throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException;
}
