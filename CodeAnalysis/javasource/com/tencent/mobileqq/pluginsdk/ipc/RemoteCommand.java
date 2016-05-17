package com.tencent.mobileqq.pluginsdk.ipc;

import android.os.Bundle;

public abstract class RemoteCommand
{
  public static final String RESULT_KEY = "result_key";
  private String a;
  
  public RemoteCommand(String paramString)
  {
    a = paramString;
  }
  
  public String getCmd()
  {
    return a;
  }
  
  public abstract Bundle invoke(Bundle paramBundle, OnInvokeFinishLinstener paramOnInvokeFinishLinstener);
  
  public boolean isSynchronized()
  {
    return true;
  }
  
  public String toString()
  {
    return "[cmd:" + a + ", sync:" + isSynchronized() + "]";
  }
  
  public static abstract interface OnInvokeFinishLinstener
  {
    public abstract void onInvokeFinish(Bundle paramBundle);
  }
}
