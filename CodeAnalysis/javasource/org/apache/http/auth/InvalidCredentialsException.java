package org.apache.http.auth;

import org.apache.http.annotation.Immutable;

@Immutable
public class InvalidCredentialsException
  extends AuthenticationException
{
  private static final long serialVersionUID = -4834003835215460648L;
  
  public InvalidCredentialsException() {}
  
  public InvalidCredentialsException(String paramString)
  {
    super(paramString);
  }
  
  public InvalidCredentialsException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
}
