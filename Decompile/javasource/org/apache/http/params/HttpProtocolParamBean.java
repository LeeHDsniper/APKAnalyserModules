package org.apache.http.params;

import org.apache.http.HttpVersion;

@Deprecated
public class HttpProtocolParamBean
  extends HttpAbstractParamBean
{
  public HttpProtocolParamBean(HttpParams paramHttpParams)
  {
    super(paramHttpParams);
  }
  
  public void setContentCharset(String paramString)
  {
    HttpProtocolParams.setContentCharset(params, paramString);
  }
  
  public void setHttpElementCharset(String paramString)
  {
    HttpProtocolParams.setHttpElementCharset(params, paramString);
  }
  
  public void setUseExpectContinue(boolean paramBoolean)
  {
    HttpProtocolParams.setUseExpectContinue(params, paramBoolean);
  }
  
  public void setUserAgent(String paramString)
  {
    HttpProtocolParams.setUserAgent(params, paramString);
  }
  
  public void setVersion(HttpVersion paramHttpVersion)
  {
    HttpProtocolParams.setVersion(params, paramHttpVersion);
  }
}
