import com.rookery.asyncHttpClient.AsyncHttpResponseHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.io.IOException;
import java.net.ConnectException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.protocol.HttpContext;

public class fac
  implements Runnable
{
  private int jdField_a_of_type_Int;
  private final AsyncHttpResponseHandler jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler;
  private final HttpUriRequest jdField_a_of_type_OrgApacheHttpClientMethodsHttpUriRequest;
  private final AbstractHttpClient jdField_a_of_type_OrgApacheHttpImplClientAbstractHttpClient;
  private final HttpContext jdField_a_of_type_OrgApacheHttpProtocolHttpContext;
  private boolean jdField_a_of_type_Boolean;
  
  public fac(AbstractHttpClient paramAbstractHttpClient, HttpContext paramHttpContext, HttpUriRequest paramHttpUriRequest, AsyncHttpResponseHandler paramAsyncHttpResponseHandler)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_OrgApacheHttpImplClientAbstractHttpClient = paramAbstractHttpClient;
    jdField_a_of_type_OrgApacheHttpProtocolHttpContext = paramHttpContext;
    jdField_a_of_type_OrgApacheHttpClientMethodsHttpUriRequest = paramHttpUriRequest;
    jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler = paramAsyncHttpResponseHandler;
  }
  
  private void a()
  {
    if (!Thread.currentThread().isInterrupted()) {}
    try
    {
      HttpResponse localHttpResponse = jdField_a_of_type_OrgApacheHttpImplClientAbstractHttpClient.execute(jdField_a_of_type_OrgApacheHttpClientMethodsHttpUriRequest, jdField_a_of_type_OrgApacheHttpProtocolHttpContext);
      if ((!Thread.currentThread().isInterrupted()) && (jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler != null)) {
        jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.a(localHttpResponse);
      }
      return;
    }
    catch (IOException localIOException)
    {
      do
      {
        if (QLog.isColorLevel()) {
          QLog.e("Translator", 2, "[makeRequest]IOException:" + localIOException);
        }
      } while (Thread.currentThread().isInterrupted());
      throw localIOException;
    }
  }
  
  private void b()
  {
    boolean bool = true;
    Object localObject1 = null;
    Object localObject2 = jdField_a_of_type_OrgApacheHttpImplClientAbstractHttpClient.getHttpRequestRetryHandler();
    IOException localIOException2;
    while (bool) {
      try
      {
        a();
        return;
      }
      catch (UnknownHostException localUnknownHostException)
      {
        while (jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler == null) {}
        jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.b(localUnknownHostException, "can't resolve host");
        return;
      }
      catch (SocketException localSocketException)
      {
        while (jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler == null) {}
        jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.b(localSocketException, "can't resolve host");
        return;
      }
      catch (SocketTimeoutException localSocketTimeoutException)
      {
        while (jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler == null) {}
        jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.b(localSocketTimeoutException, "socket time out");
        return;
      }
      catch (IOException localIOException1)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Translator", 2, "[makeRequestWithRetries]IOException:" + localIOException1);
        }
        i = jdField_a_of_type_Int + 1;
        jdField_a_of_type_Int = i;
        bool = ((HttpRequestRetryHandler)localObject2).retryRequest(localIOException1, i, jdField_a_of_type_OrgApacheHttpProtocolHttpContext);
      }
      catch (NullPointerException localNullPointerException)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Translator", 2, "[makeRequestWithRetries]NullPointerException:" + localNullPointerException);
        }
        localIOException2 = new IOException("NPE in HttpClient" + localNullPointerException.getMessage());
        int i = jdField_a_of_type_Int + 1;
        jdField_a_of_type_Int = i;
        bool = ((HttpRequestRetryHandler)localObject2).retryRequest(localIOException2, i, jdField_a_of_type_OrgApacheHttpProtocolHttpContext);
      }
    }
    localObject2 = new ConnectException();
    ((ConnectException)localObject2).initCause(localIOException2);
    if (QLog.isColorLevel()) {
      QLog.e("Translator", 2, "[makeRequestWithRetries] end function. Execption:" + localObject2);
    }
    throw ((Throwable)localObject2);
  }
  
  public void run()
  {
    try
    {
      if (jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler != null) {
        jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.c();
      }
      b();
      if (jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler != null) {
        jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.d();
      }
      return;
    }
    catch (IOException localIOException)
    {
      while (jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler == null) {}
      jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.d();
      if (jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.a(localIOException, (byte[])null);
        return;
      }
      jdField_a_of_type_ComRookeryAsyncHttpClientAsyncHttpResponseHandler.b(localIOException, (String)null);
    }
  }
}
