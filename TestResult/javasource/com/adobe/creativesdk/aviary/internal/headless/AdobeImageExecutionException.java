package com.adobe.creativesdk.aviary.internal.headless;

public class AdobeImageExecutionException
  extends Exception
{
  private int code;
  
  public AdobeImageExecutionException(String paramString, int paramInt)
  {
    super(paramString);
    code = paramInt;
  }
  
  public static AdobeImageExecutionException fromInt(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return new AdobeImageExecutionException("Unknown error", 11);
    case 0: 
      return null;
    case 1: 
      return new AdobeImageExecutionException("File not found", 1);
    case 2: 
      return new AdobeImageExecutionException("File too large", 2);
    case 3: 
      return new AdobeImageExecutionException("File not loaded", 3);
    case 4: 
      return new AdobeImageExecutionException("Invalid Context", 4);
    case 5: 
      return new AdobeImageExecutionException("File already loaded", 5);
    case 6: 
      return new AdobeImageExecutionException("Decoder not found for the specified file", 6);
    case 7: 
      return new AdobeImageExecutionException("Encoder not found for the specified file", 7);
    case 8: 
      return new AdobeImageExecutionException("Decode error", 8);
    }
    return new AdobeImageExecutionException("Encode error", 9);
  }
  
  public int getCode()
  {
    return code;
  }
}
