package org.apache.http.conn.params;

import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.HttpAbstractParamBean;
import org.apache.http.params.HttpParams;

@Deprecated
@NotThreadSafe
public class ConnManagerParamBean
  extends HttpAbstractParamBean
{
  public ConnManagerParamBean(HttpParams paramHttpParams)
  {
    super(paramHttpParams);
  }
  
  public void setConnectionsPerRoute(ConnPerRouteBean paramConnPerRouteBean)
  {
    params.setParameter("http.conn-manager.max-per-route", paramConnPerRouteBean);
  }
  
  public void setMaxTotalConnections(int paramInt)
  {
    params.setIntParameter("http.conn-manager.max-total", paramInt);
  }
  
  public void setTimeout(long paramLong)
  {
    params.setLongParameter("http.conn-manager.timeout", paramLong);
  }
}
