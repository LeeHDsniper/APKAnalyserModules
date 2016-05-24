package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.graphics.Bitmap;

public class MoaResult
{
  public volatile int active = 1;
  public Bitmap inputBitmap;
  public String inputString;
  public Bitmap outputBitmap;
  public String outputString;
  
  public MoaResult() {}
  
  public void cancel()
  {
    active = 0;
  }
  
  public void execute()
  {
    try
    {
      Moa.applyActions(this);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
