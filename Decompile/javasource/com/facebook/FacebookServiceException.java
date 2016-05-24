package com.facebook;

public class FacebookServiceException
  extends FacebookException
{
  private static final long serialVersionUID = 1L;
  private final FacebookRequestError error;
  
  public FacebookServiceException(FacebookRequestError paramFacebookRequestError, String paramString)
  {
    super(paramString);
    error = paramFacebookRequestError;
  }
  
  public final FacebookRequestError getRequestError()
  {
    return error;
  }
  
  public final String toString()
  {
    return "{FacebookServiceException: " + "httpResponseCode: " + error.getRequestStatusCode() + ", facebookErrorCode: " + error.getErrorCode() + ", facebookErrorType: " + error.getErrorType() + ", message: " + error.getErrorMessage() + "}";
  }
}
