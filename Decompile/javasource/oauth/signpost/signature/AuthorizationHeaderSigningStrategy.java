package oauth.signpost.signature;

import java.util.Iterator;
import java.util.Set;
import oauth.signpost.OAuth;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;

public class AuthorizationHeaderSigningStrategy
  implements SigningStrategy
{
  private static final long serialVersionUID = 1L;
  
  public AuthorizationHeaderSigningStrategy() {}
  
  public String writeSignature(String paramString, HttpRequest paramHttpRequest, HttpParameters paramHttpParameters)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("OAuth ");
    if (paramHttpParameters.containsKey("realm"))
    {
      localStringBuilder.append(paramHttpParameters.getAsHeaderElement("realm"));
      localStringBuilder.append(", ");
    }
    paramHttpParameters = paramHttpParameters.getOAuthParameters();
    paramHttpParameters.put("oauth_signature", paramString, true);
    paramString = paramHttpParameters.keySet().iterator();
    while (paramString.hasNext())
    {
      localStringBuilder.append(paramHttpParameters.getAsHeaderElement((String)paramString.next()));
      if (paramString.hasNext()) {
        localStringBuilder.append(", ");
      }
    }
    paramString = localStringBuilder.toString();
    OAuth.debugOut("Auth Header", paramString);
    paramHttpRequest.setHeader("Authorization", paramString);
    return paramString;
  }
}
