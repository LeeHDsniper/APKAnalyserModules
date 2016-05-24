package android.support.v4.app;

import android.os.Build.VERSION;
import android.os.Bundle;

public class RemoteInput
  extends RemoteInputCompatBase.RemoteInput
{
  public static final RemoteInputCompatBase.RemoteInput.Factory FACTORY;
  private static final Impl IMPL;
  private final boolean mAllowFreeFormInput;
  private final CharSequence[] mChoices;
  private final Bundle mExtras;
  private final CharSequence mLabel;
  private final String mResultKey;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 20) {
      IMPL = new ImplApi20();
    }
    for (;;)
    {
      FACTORY = new RemoteInputCompatBase.RemoteInput.Factory() {};
      return;
      if (Build.VERSION.SDK_INT >= 16) {
        IMPL = new ImplJellybean();
      } else {
        IMPL = new ImplBase();
      }
    }
  }
  
  public boolean getAllowFreeFormInput()
  {
    return mAllowFreeFormInput;
  }
  
  public CharSequence[] getChoices()
  {
    return mChoices;
  }
  
  public Bundle getExtras()
  {
    return mExtras;
  }
  
  public CharSequence getLabel()
  {
    return mLabel;
  }
  
  public String getResultKey()
  {
    return mResultKey;
  }
  
  static abstract interface Impl {}
  
  static class ImplApi20
    implements RemoteInput.Impl
  {
    ImplApi20() {}
  }
  
  static class ImplBase
    implements RemoteInput.Impl
  {
    ImplBase() {}
  }
  
  static class ImplJellybean
    implements RemoteInput.Impl
  {
    ImplJellybean() {}
  }
}
