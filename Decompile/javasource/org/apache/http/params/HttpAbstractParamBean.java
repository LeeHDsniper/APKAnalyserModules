package org.apache.http.params;

import org.apache.http.util.Args;

@Deprecated
public abstract class HttpAbstractParamBean
{
  protected final HttpParams params;
  
  public HttpAbstractParamBean(HttpParams paramHttpParams)
  {
    params = ((HttpParams)Args.notNull(paramHttpParams, "HTTP parameters"));
  }
}
