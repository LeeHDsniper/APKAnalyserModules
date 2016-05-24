package oauth.signpost.commonshttp;

import java.io.IOException;
import oauth.signpost.AbstractOAuthProvider;
import oauth.signpost.http.HttpRequest;
import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;

public class CommonsHttpOAuthProvider
  extends AbstractOAuthProvider
{
  private static final long serialVersionUID = 1L;
  private transient HttpClient httpClient = new DefaultHttpClient();
  
  public CommonsHttpOAuthProvider(String paramString1, String paramString2, String paramString3)
  {
    super(paramString1, paramString2, paramString3);
  }
  
  protected void closeConnection(HttpRequest paramHttpRequest, oauth.signpost.http.HttpResponse paramHttpResponse)
    throws Exception
  {
    if (paramHttpResponse != null)
    {
      paramHttpRequest = ((org.apache.http.HttpResponse)paramHttpResponse.unwrap()).getEntity();
      if (paramHttpRequest == null) {}
    }
    try
    {
      paramHttpRequest.consumeContent();
      return;
    }
    catch (IOException paramHttpRequest)
    {
      paramHttpRequest.printStackTrace();
    }
  }
  
  protected HttpRequest createRequest(String paramString)
    throws Exception
  {
    return new HttpRequestAdapter(new HttpPost(paramString));
  }
  
  protected oauth.signpost.http.HttpResponse sendRequest(HttpRequest paramHttpRequest)
    throws Exception
  {
    return new HttpResponseAdapter(httpClient.execute((HttpUriRequest)paramHttpRequest.unwrap()));
  }
}
