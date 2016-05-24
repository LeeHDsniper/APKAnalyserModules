package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.formats.NativeAd.Image;
import com.google.android.gms.ads.formats.NativeAppInstallAd;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zzd;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@zzgk
public class zzco
  extends NativeAppInstallAd
{
  private final zzcn zzwx;
  private final List<NativeAd.Image> zzwy = new ArrayList();
  private final zzck zzwz;
  
  public zzco(zzcn paramZzcn)
  {
    zzwx = paramZzcn;
    try
    {
      paramZzcn = zzwx.getImages().iterator();
      while (paramZzcn.hasNext())
      {
        zzcj localZzcj = zzd(paramZzcn.next());
        if (localZzcj != null) {
          zzwy.add(new zzck(localZzcj));
        }
      }
      try
      {
        paramZzcn = zzwx.zzds();
        if (paramZzcn == null) {
          break label123;
        }
        paramZzcn = new zzck(paramZzcn);
      }
      catch (RemoteException paramZzcn)
      {
        for (;;)
        {
          zzb.zzb("Failed to get icon.", paramZzcn);
          paramZzcn = null;
        }
      }
    }
    catch (RemoteException paramZzcn)
    {
      zzb.zzb("Failed to get image.", paramZzcn);
    }
    zzwz = paramZzcn;
  }
  
  public CharSequence getBody()
  {
    try
    {
      String str = zzwx.getBody();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get body.", localRemoteException);
    }
    return null;
  }
  
  public CharSequence getCallToAction()
  {
    try
    {
      String str = zzwx.getCallToAction();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get call to action.", localRemoteException);
    }
    return null;
  }
  
  public Bundle getExtras()
  {
    try
    {
      Bundle localBundle = zzwx.getExtras();
      return localBundle;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get extras", localRemoteException);
    }
    return null;
  }
  
  public CharSequence getHeadline()
  {
    try
    {
      String str = zzwx.getHeadline();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get headline.", localRemoteException);
    }
    return null;
  }
  
  public NativeAd.Image getIcon()
  {
    return zzwz;
  }
  
  public List<NativeAd.Image> getImages()
  {
    return zzwy;
  }
  
  public CharSequence getPrice()
  {
    try
    {
      String str = zzwx.getPrice();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get price.", localRemoteException);
    }
    return null;
  }
  
  public Double getStarRating()
  {
    try
    {
      double d = zzwx.getStarRating();
      if (d == -1.0D) {
        return null;
      }
      return Double.valueOf(d);
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get star rating.", localRemoteException);
    }
    return null;
  }
  
  public CharSequence getStore()
  {
    try
    {
      String str = zzwx.getStore();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get store", localRemoteException);
    }
    return null;
  }
  
  zzcj zzd(Object paramObject)
  {
    if ((paramObject instanceof IBinder)) {
      return zzcj.zza.zzt((IBinder)paramObject);
    }
    return null;
  }
  
  protected zzd zzdt()
  {
    try
    {
      zzd localZzd = zzwx.zzdt();
      return localZzd;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to retrieve native ad engine.", localRemoteException);
    }
    return null;
  }
}
