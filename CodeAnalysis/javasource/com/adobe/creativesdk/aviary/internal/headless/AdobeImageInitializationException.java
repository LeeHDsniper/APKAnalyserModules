package com.adobe.creativesdk.aviary.internal.headless;

public abstract class AdobeImageInitializationException
  extends Exception
{
  AdobeImageInitializationException(String paramString)
  {
    super(paramString);
  }
  
  public static AdobeImageInitializationException fromInt(int paramInt)
  {
    switch (paramInt)
    {
    case 0: 
    default: 
      return null;
    case 1: 
      return new AdobeImageInvalidContextException();
    }
    return new AdobeImageInvalidApiKeyException();
  }
  
  public static final class AdobeImageInvalidApiKeyException
    extends AdobeImageInitializationException
  {
    public AdobeImageInvalidApiKeyException()
    {
      super();
    }
  }
  
  public static final class AdobeImageInvalidContextException
    extends AdobeImageInitializationException
  {
    public AdobeImageInvalidContextException()
    {
      super();
    }
  }
}
