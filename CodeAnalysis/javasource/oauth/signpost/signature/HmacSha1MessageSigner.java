package oauth.signpost.signature;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import oauth.signpost.OAuth;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;

public class HmacSha1MessageSigner
  extends OAuthMessageSigner
{
  public HmacSha1MessageSigner() {}
  
  public String getSignatureMethod()
  {
    return "HMAC-SHA1";
  }
  
  public String sign(HttpRequest paramHttpRequest, HttpParameters paramHttpParameters)
    throws OAuthMessageSignerException
  {
    try
    {
      SecretKeySpec localSecretKeySpec = new SecretKeySpec((OAuth.percentEncode(getConsumerSecret()) + '&' + OAuth.percentEncode(getTokenSecret())).getBytes("UTF-8"), "HmacSHA1");
      Mac localMac = Mac.getInstance("HmacSHA1");
      localMac.init(localSecretKeySpec);
      paramHttpRequest = new SignatureBaseString(paramHttpRequest, paramHttpParameters).generate();
      OAuth.debugOut("SBS", paramHttpRequest);
      paramHttpRequest = base64Encode(localMac.doFinal(paramHttpRequest.getBytes("UTF-8"))).trim();
      return paramHttpRequest;
    }
    catch (GeneralSecurityException paramHttpRequest)
    {
      throw new OAuthMessageSignerException(paramHttpRequest);
    }
    catch (UnsupportedEncodingException paramHttpRequest)
    {
      throw new OAuthMessageSignerException(paramHttpRequest);
    }
  }
}
