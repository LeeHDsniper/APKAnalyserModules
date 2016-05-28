package org.apache.http.conn.params;

import org.apache.http.params.HttpAbstractParamBean;
import org.apache.http.params.HttpParams;

@Deprecated
public class ConnConnectionParamBean
  extends HttpAbstractParamBean
{
  public ConnConnectionParamBean(HttpParams paramHttpParams)
  {
    super(paramHttpParams);
  }
  
  @Deprecated
  public void setMaxStatusLineGarbage(int paramInt)
  {
    params.setIntParameter("http.connection.max-status-line-garbage", paramInt);
  }
}
