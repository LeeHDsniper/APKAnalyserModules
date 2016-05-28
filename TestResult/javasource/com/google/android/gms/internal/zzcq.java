package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.formats.NativeAd.Image;
import com.google.android.gms.ads.formats.NativeContentAd;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zzd;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@zzgk
public class zzcq
  extends NativeContentAd
{
  private final zzcp zzwA;
  private final zzck zzwB;
  private final List<NativeAd.Image> zzwy = new ArrayList();
  
  public zzcq(zzcp paramZzcp)
  {
    zzwA = paramZzcp;
    try
    {
      paramZzcp = zzwA.getImages().iterator();
      while (paramZzcp.hasNext())
      {
        zzcj localZzcj = zzd(paramZzcp.next());
        if (localZzcj != null) {
          zzwy.add(new zzck(localZzcj));
        }
      }
      try
      {
        paramZzcp = zzwA.zzdw();
        if (paramZzcp == null) {
          break label123;
        }
        paramZzcp = new zzck(paramZzcp);
      }
      catch (RemoteException paramZzcp)
      {
        for (;;)
        {
          zzb.zzb("Failed to get icon.", paramZzcp);
          paramZzcp = null;
        }
      }
    }
    catch (RemoteException paramZzcp)
    {
      zzb.zzb("Failed to get image.", paramZzcp);
    }
    zzwB = paramZzcp;
  }
  
  public CharSequence getAdvertiser()
  {
    try
    {
      String str = zzwA.getAdvertiser();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get attribution.", localRemoteException);
    }
    return null;
  }
  
  public CharSequence getBody()
  {
    try
    {
      String str = zzwA.getBody();
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
      String str = zzwA.getCallToAction();
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
      Bundle localBundle = zzwA.getExtras();
      return localBundle;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Failed to get extras", localRemoteException);
    }
    return null;
  }
  
  public CharSequence getHeadline()
  {
    try
    {
      String str = zzwA.getHeadline();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get headline.", localRemoteException);
    }
    return null;
  }
  
  public List<NativeAd.Image> getImages()
  {
    return zzwy;
  }
  
  public NativeAd.Image getLogo()
  {
    return zzwB;
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
      zzd localZzd = zzwA.zzdt();
      return localZzd;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to retrieve native ad engine.", localRemoteException);
    }
    return null;
  }
}
