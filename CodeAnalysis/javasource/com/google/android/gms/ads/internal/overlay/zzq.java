package com.google.android.gms.ads.internal.overlay;

import android.os.Handler;
import com.google.android.gms.internal.zzhu;

class zzq
  implements Runnable
{
  private boolean mCancelled = false;
  private zzk zzAy;
  
  zzq(zzk paramZzk)
  {
    zzAy = paramZzk;
  }
  
  public void cancel()
  {
    mCancelled = true;
    zzhu.zzHK.removeCallbacks(this);
  }
  
  public void run()
  {
    if (!mCancelled)
    {
      zzAy.zzeR();
      zzfa();
    }
  }
  
  public void zzfa()
  {
    zzhu.zzHK.postDelayed(this, 250L);
  }
}
