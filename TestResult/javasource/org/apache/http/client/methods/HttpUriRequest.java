package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.HttpRequest;

public abstract interface HttpUriRequest
  extends HttpRequest
{
  public abstract void abort()
    throws UnsupportedOperationException;
  
  public abstract String getMethod();
  
  public abstract URI getURI();
  
  public abstract boolean isAborted();
}
