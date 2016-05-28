package org.apache.http.auth;

import org.apache.http.params.HttpParams;

@Deprecated
public abstract interface AuthSchemeFactory
{
  public abstract AuthScheme newInstance(HttpParams paramHttpParams);
}
