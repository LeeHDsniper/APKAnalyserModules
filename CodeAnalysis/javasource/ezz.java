import com.rookery.asyncHttpClient.AsyncHttpClient;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.protocol.HttpContext;
public class ezz
  implements HttpRequestInterceptor
{
  public ezz(AsyncHttpClient paramAsyncHttpClient)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
  {
    if (!paramHttpRequest.containsHeader("Accept-Encoding")) {
      paramHttpRequest.addHeader("Accept-Encoding", "gzip");
    }
    paramHttpContext = AsyncHttpClient.a(a).keySet().iterator();
    while (paramHttpContext.hasNext())
    {
      String str = (String)paramHttpContext.next();
      paramHttpRequest.addHeader(str, (String)AsyncHttpClient.a(a).get(str));
    }
  }
}
