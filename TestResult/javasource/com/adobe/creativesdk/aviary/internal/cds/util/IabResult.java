package com.adobe.creativesdk.aviary.internal.cds.util;

public class IabResult
{
  String mMessage;
  int mResponse;
  
  public IabResult(int paramInt, String paramString)
  {
    mResponse = paramInt;
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      mMessage = IabHelper.getResponseDesc(paramInt);
      return;
    }
    mMessage = (paramString + " (response: " + IabHelper.getResponseDesc(paramInt) + ")");
  }
  
  public String getMessage()
  {
    return mMessage;
  }
  
  public int getResponse()
  {
    return mResponse;
  }
  
  public boolean isFailure()
  {
    return !isSuccess();
  }
  
  public boolean isSuccess()
  {
    return mResponse == 0;
  }
  
  public String toString()
  {
    return "IabResult: " + getMessage();
  }
}
