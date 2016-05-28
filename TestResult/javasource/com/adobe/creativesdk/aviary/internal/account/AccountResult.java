package com.adobe.creativesdk.aviary.internal.account;

import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import java.util.Locale;

public class AccountResult
{
  public final String errorMessage;
  public final AdobeAuthErrorCode resultCode;
  
  public AccountResult()
  {
    this(AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_NO_ERROR, null);
  }
  
  public AccountResult(AdobeAuthErrorCode paramAdobeAuthErrorCode, String paramString)
  {
    resultCode = paramAdobeAuthErrorCode;
    errorMessage = paramString;
  }
  
  public String toString()
  {
    return String.format(Locale.ROOT, "AccountResult{resultCode: %s, errorMessage: %s}", new Object[] { resultCode, errorMessage });
  }
}
