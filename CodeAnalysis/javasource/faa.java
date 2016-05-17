import com.rookery.asyncHttpClient.AsyncHttpClient;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.protocol.HttpContext;

public class faa
  implements HttpResponseInterceptor
{
  public faa(AsyncHttpClient paramAsyncHttpClient)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    paramHttpContext = paramHttpResponse.getEntity();
    if (paramHttpContext == null) {}
    for (;;)
    {
      return;
      paramHttpContext = paramHttpContext.getContentEncoding();
      if (paramHttpContext != null)
      {
        paramHttpContext = paramHttpContext.getElements();
        int j = paramHttpContext.length;
        int i = 0;
        while (i < j)
        {
          if (paramHttpContext[i].getName().equalsIgnoreCase("gzip"))
          {
            paramHttpResponse.setEntity(new fab(paramHttpResponse.getEntity()));
            return;
          }
          i += 1;
        }
      }
    }
  }
}
