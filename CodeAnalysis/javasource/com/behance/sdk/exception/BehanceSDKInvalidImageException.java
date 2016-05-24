package com.behance.sdk.exception;

import java.io.File;

public class BehanceSDKInvalidImageException
  extends BehanceSDKException
{
  private static final long serialVersionUID = -5241909962790945027L;
  private File invalidImage;
  
  public BehanceSDKInvalidImageException() {}
  
  public BehanceSDKInvalidImageException(File paramFile)
  {
    setInvalidImage(paramFile);
  }
  
  public void setInvalidImage(File paramFile)
  {
    invalidImage = paramFile;
  }
}
