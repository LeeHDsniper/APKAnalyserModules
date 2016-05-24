package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.ads.formats.NativeAd.Image;
import com.google.android.gms.ads.formats.NativeCustomTemplateAd;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.List;

@zzgk
public class zzcs
  implements NativeCustomTemplateAd
{
  private final zzcr zzwC;
  
  public zzcs(zzcr paramZzcr)
  {
    zzwC = paramZzcr;
  }
  
  public List<String> getAvailableAssetNames()
  {
    try
    {
      List localList = zzwC.getAvailableAssetNames();
      return localList;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get available asset names.", localRemoteException);
    }
    return null;
  }
  
  public String getCustomTemplateId()
  {
    try
    {
      String str = zzwC.getCustomTemplateId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to get custom template id.", localRemoteException);
    }
    return null;
  }
  
  public NativeAd.Image getImage(String paramString)
  {
    try
    {
      paramString = zzwC.zzT(paramString);
      if (paramString != null)
      {
        paramString = new zzck(paramString);
        return paramString;
      }
    }
    catch (RemoteException paramString)
    {
      zzb.zzb("Failed to get image.", paramString);
    }
    return null;
  }
  
  public CharSequence getText(String paramString)
  {
    try
    {
      paramString = zzwC.zzS(paramString);
      return paramString;
    }
    catch (RemoteException paramString)
    {
      zzb.zzb("Failed to get string.", paramString);
    }
    return null;
  }
  
  public void performClick(String paramString)
  {
    try
    {
      zzwC.performClick(paramString);
      return;
    }
    catch (RemoteException paramString)
    {
      zzb.zzb("Failed to perform click.", paramString);
    }
  }
  
  public void recordImpression()
  {
    try
    {
      zzwC.recordImpression();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzb("Failed to record impression.", localRemoteException);
    }
  }
}
