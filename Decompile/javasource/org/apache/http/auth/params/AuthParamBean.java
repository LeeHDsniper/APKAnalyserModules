package org.apache.http.auth.params;

import org.apache.http.params.HttpAbstractParamBean;
import org.apache.http.params.HttpParams;

@Deprecated
public class AuthParamBean
  extends HttpAbstractParamBean
{
  public AuthParamBean(HttpParams paramHttpParams)
  {
    super(paramHttpParams);
  }
  
  public void setCredentialCharset(String paramString)
  {
    AuthParams.setCredentialCharset(params, paramString);
  }
}
