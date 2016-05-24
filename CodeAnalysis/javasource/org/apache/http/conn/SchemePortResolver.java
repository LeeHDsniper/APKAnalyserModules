package org.apache.http.conn;

import org.apache.http.HttpHost;

public abstract interface SchemePortResolver
{
  public abstract int resolve(HttpHost paramHttpHost)
    throws UnsupportedSchemeException;
}
