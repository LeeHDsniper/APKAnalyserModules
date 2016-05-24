package oauth.signpost.http;

import java.io.IOException;
import java.io.InputStream;

public abstract interface HttpResponse
{
  public abstract InputStream getContent()
    throws IOException;
  
  public abstract String getReasonPhrase()
    throws Exception;
  
  public abstract int getStatusCode()
    throws IOException;
  
  public abstract Object unwrap();
}
