package com.tencent.theme;

public abstract interface SkinEngineHandler
{
  public abstract boolean onDecodeOOM(OutOfMemoryError paramOutOfMemoryError, String paramString, boolean paramBoolean);
  
  public abstract boolean onDecodeReturnNullBitmap(String paramString, boolean paramBoolean);
  
  public abstract boolean onSecondDecodeOOM(OutOfMemoryError paramOutOfMemoryError, String paramString, boolean paramBoolean);
}
