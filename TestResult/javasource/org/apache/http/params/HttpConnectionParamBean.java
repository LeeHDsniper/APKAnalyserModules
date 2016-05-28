package org.apache.http.params;

@Deprecated
public class HttpConnectionParamBean
  extends HttpAbstractParamBean
{
  public HttpConnectionParamBean(HttpParams paramHttpParams)
  {
    super(paramHttpParams);
  }
  
  public void setConnectionTimeout(int paramInt)
  {
    HttpConnectionParams.setConnectionTimeout(params, paramInt);
  }
  
  public void setLinger(int paramInt)
  {
    HttpConnectionParams.setLinger(params, paramInt);
  }
  
  public void setSoTimeout(int paramInt)
  {
    HttpConnectionParams.setSoTimeout(params, paramInt);
  }
  
  public void setSocketBufferSize(int paramInt)
  {
    HttpConnectionParams.setSocketBufferSize(params, paramInt);
  }
  
  public void setStaleCheckingEnabled(boolean paramBoolean)
  {
    HttpConnectionParams.setStaleCheckingEnabled(params, paramBoolean);
  }
  
  public void setTcpNoDelay(boolean paramBoolean)
  {
    HttpConnectionParams.setTcpNoDelay(params, paramBoolean);
  }
}
