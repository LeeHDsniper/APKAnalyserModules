package oauth.signpost.http;

import java.io.IOException;
import java.io.InputStream;

public abstract interface HttpRequest
{
  public abstract String getContentType();
  
  public abstract String getHeader(String paramString);
  
  public abstract InputStream getMessagePayload()
    throws IOException;
  
  public abstract String getMethod();
  
  public abstract String getRequestUrl();
  
  public abstract void setHeader(String paramString1, String paramString2);
  
  public abstract Object unwrap();
}
