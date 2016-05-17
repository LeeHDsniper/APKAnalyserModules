import com.rookery.asyncHttpClient.AsyncHttpClient;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.X509HostnameVerifier;

public class ezy
  implements X509HostnameVerifier
{
  private X509HostnameVerifier jdField_a_of_type_OrgApacheHttpConnSslX509HostnameVerifier;
  
  public ezy(AsyncHttpClient paramAsyncHttpClient)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_OrgApacheHttpConnSslX509HostnameVerifier = SSLSocketFactory.STRICT_HOSTNAME_VERIFIER;
  }
  
  public void verify(String paramString, X509Certificate paramX509Certificate)
  {
    String str = paramString;
    if (paramString.equalsIgnoreCase("datamarket.accesscontrol.windows.net")) {
      str = "accesscontrol.windows.net";
    }
    jdField_a_of_type_OrgApacheHttpConnSslX509HostnameVerifier.verify(str, paramX509Certificate);
  }
  
  public void verify(String paramString, SSLSocket paramSSLSocket)
  {
    String str = paramString;
    if (paramString.equalsIgnoreCase("datamarket.accesscontrol.windows.net")) {
      str = "accesscontrol.windows.net";
    }
    jdField_a_of_type_OrgApacheHttpConnSslX509HostnameVerifier.verify(str, paramSSLSocket);
  }
  
  public void verify(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    String str = paramString;
    if (paramString.equalsIgnoreCase("datamarket.accesscontrol.windows.net")) {
      str = "accesscontrol.windows.net";
    }
    jdField_a_of_type_OrgApacheHttpConnSslX509HostnameVerifier.verify(str, paramArrayOfString1, paramArrayOfString2);
  }
  
  public boolean verify(String paramString, SSLSession paramSSLSession)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Translator", 2, "[AsyncHttpClient] host:" + paramString);
    }
    String str = paramString;
    if (paramString.equalsIgnoreCase("datamarket.accesscontrol.windows.net")) {
      str = "accesscontrol.windows.net";
    }
    return jdField_a_of_type_OrgApacheHttpConnSslX509HostnameVerifier.verify(str, paramSSLSession);
  }
}
