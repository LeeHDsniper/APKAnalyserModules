package org.apache.http.auth;

import org.apache.http.protocol.HttpContext;

public abstract interface AuthSchemeProvider
{
  public abstract AuthScheme create(HttpContext paramHttpContext);
}
