package oauth.signpost.commonshttp;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.HttpEntity;
import org.apache.http.StatusLine;

public class HttpResponseAdapter
  implements oauth.signpost.http.HttpResponse
{
  private org.apache.http.HttpResponse response;
  
  public HttpResponseAdapter(org.apache.http.HttpResponse paramHttpResponse)
  {
    response = paramHttpResponse;
  }
  
  public InputStream getContent()
    throws IOException
  {
    return response.getEntity().getContent();
  }
  
  public String getReasonPhrase()
    throws Exception
  {
    return response.getStatusLine().getReasonPhrase();
  }
  
  public int getStatusCode()
    throws IOException
  {
    return response.getStatusLine().getStatusCode();
  }
  
  public Object unwrap()
  {
    return response;
  }
}
