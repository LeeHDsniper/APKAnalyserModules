package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.RemoteException;
import com.google.android.gms.ads.formats.NativeAd.Image;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zze;

@zzgk
public class zzck
  implements NativeAd.Image
{
  private final Drawable mDrawable;
  private final Uri mUri;
  private final zzcj zzww;
  
  public zzck(zzcj paramZzcj)
  {
    zzww = paramZzcj;
    try
    {
      paramZzcj = zzww.zzdr();
      if (paramZzcj == null) {
        break label61;
      }
      paramZzcj = (Drawable)zze.zzp(paramZzcj);
    }
    catch (RemoteException paramZzcj)
    {
      try
      {
        paramZzcj = zzww.getUri();
        mUri = paramZzcj;
        return;
        paramZzcj = paramZzcj;
        zzb.zzb("Failed to get drawable.", paramZzcj);
        paramZzcj = null;
      }
      catch (RemoteException paramZzcj)
      {
        for (;;)
        {
          zzb.zzb("Failed to get uri.", paramZzcj);
          paramZzcj = localObject;
        }
      }
    }
    mDrawable = paramZzcj;
  }
  
  public Drawable getDrawable()
  {
    return mDrawable;
  }
  
  public Uri getUri()
  {
    return mUri;
  }
}
