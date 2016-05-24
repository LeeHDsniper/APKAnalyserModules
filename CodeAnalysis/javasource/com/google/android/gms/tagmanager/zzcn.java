package com.google.android.gms.tagmanager;

import android.content.Context;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

class zzcn
  implements zzp.zzf
{
  private final Context mContext;
  private final String zzaOS;
  private final ExecutorService zzaRv;
  
  zzcn(Context paramContext, String paramString)
  {
    mContext = paramContext;
    zzaOS = paramString;
    zzaRv = Executors.newSingleThreadExecutor();
  }
  
  public void release()
  {
    try
    {
      zzaRv.shutdown();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
