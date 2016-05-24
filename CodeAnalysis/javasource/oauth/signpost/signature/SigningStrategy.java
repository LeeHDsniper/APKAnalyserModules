package oauth.signpost.signature;

import java.io.Serializable;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;

public abstract interface SigningStrategy
  extends Serializable
{
  public abstract String writeSignature(String paramString, HttpRequest paramHttpRequest, HttpParameters paramHttpParameters);
}
