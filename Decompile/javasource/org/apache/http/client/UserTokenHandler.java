package org.apache.http.client;

import org.apache.http.protocol.HttpContext;

public abstract interface UserTokenHandler
{
  public abstract Object getUserToken(HttpContext paramHttpContext);
}
