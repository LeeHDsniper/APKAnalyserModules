package org.apache.http.pool;

import java.io.IOException;

public abstract interface ConnFactory<T, C>
{
  public abstract C create(T paramT)
    throws IOException;
}
