package org.apache.http.client;

import org.apache.http.annotation.Immutable;

@Immutable
public class CircularRedirectException
  extends RedirectException
{
  private static final long serialVersionUID = 6830063487001091803L;
  
  public CircularRedirectException() {}
  
  public CircularRedirectException(String paramString)
  {
    super(paramString);
  }
  
  public CircularRedirectException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
}
