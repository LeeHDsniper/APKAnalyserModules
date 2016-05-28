package com.google.android.gms.tagmanager;

import android.util.Log;

public class zzy
  implements zzbh
{
  private int zzMQ = 5;
  
  public zzy() {}
  
  public void e(String paramString)
  {
    if (zzMQ <= 6) {
      Log.e("GoogleTagManager", paramString);
    }
  }
  
  public void v(String paramString)
  {
    if (zzMQ <= 2) {
      Log.v("GoogleTagManager", paramString);
    }
  }
  
  public void zzaC(String paramString)
  {
    if (zzMQ <= 3) {
      Log.d("GoogleTagManager", paramString);
    }
  }
  
  public void zzaD(String paramString)
  {
    if (zzMQ <= 4) {
      Log.i("GoogleTagManager", paramString);
    }
  }
  
  public void zzaE(String paramString)
  {
    if (zzMQ <= 5) {
      Log.w("GoogleTagManager", paramString);
    }
  }
  
  public void zzb(String paramString, Throwable paramThrowable)
  {
    if (zzMQ <= 6) {
      Log.e("GoogleTagManager", paramString, paramThrowable);
    }
  }
  
  public void zzd(String paramString, Throwable paramThrowable)
  {
    if (zzMQ <= 5) {
      Log.w("GoogleTagManager", paramString, paramThrowable);
    }
  }
}
