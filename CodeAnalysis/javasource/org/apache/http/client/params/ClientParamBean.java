package org.apache.http.client.params;

import java.util.Collection;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.HttpAbstractParamBean;
import org.apache.http.params.HttpParams;

@Deprecated
@NotThreadSafe
public class ClientParamBean
  extends HttpAbstractParamBean
{
  public ClientParamBean(HttpParams paramHttpParams)
  {
    super(paramHttpParams);
  }
  
  public void setAllowCircularRedirects(boolean paramBoolean)
  {
    params.setBooleanParameter("http.protocol.allow-circular-redirects", paramBoolean);
  }
  
  @Deprecated
  public void setConnectionManagerFactoryClassName(String paramString)
  {
    params.setParameter("http.connection-manager.factory-class-name", paramString);
  }
  
  public void setConnectionManagerTimeout(long paramLong)
  {
    params.setLongParameter("http.conn-manager.timeout", paramLong);
  }
  
  public void setCookiePolicy(String paramString)
  {
    params.setParameter("http.protocol.cookie-policy", paramString);
  }
  
  public void setDefaultHeaders(Collection<Header> paramCollection)
  {
    params.setParameter("http.default-headers", paramCollection);
  }
  
  public void setDefaultHost(HttpHost paramHttpHost)
  {
    params.setParameter("http.default-host", paramHttpHost);
  }
  
  public void setHandleAuthentication(boolean paramBoolean)
  {
    params.setBooleanParameter("http.protocol.handle-authentication", paramBoolean);
  }
  
  public void setHandleRedirects(boolean paramBoolean)
  {
    params.setBooleanParameter("http.protocol.handle-redirects", paramBoolean);
  }
  
  public void setMaxRedirects(int paramInt)
  {
    params.setIntParameter("http.protocol.max-redirects", paramInt);
  }
  
  public void setRejectRelativeRedirect(boolean paramBoolean)
  {
    params.setBooleanParameter("http.protocol.reject-relative-redirect", paramBoolean);
  }
  
  public void setVirtualHost(HttpHost paramHttpHost)
  {
    params.setParameter("http.virtual-host", paramHttpHost);
  }
}
