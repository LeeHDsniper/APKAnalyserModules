package com.tencent.feedback.upload;

public abstract interface UploadHandleListener
{
  public abstract void onUploadEnd(int paramInt1, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, String paramString);
  
  public abstract void onUploadStart(int paramInt);
}
