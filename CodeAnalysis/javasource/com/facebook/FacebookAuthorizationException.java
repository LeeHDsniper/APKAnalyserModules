package com.facebook;

public class FacebookAuthorizationException
  extends FacebookException
{
  static final long serialVersionUID = 1L;
  
  public FacebookAuthorizationException() {}
  
  public FacebookAuthorizationException(String paramString)
  {
    super(paramString);
  }
}
