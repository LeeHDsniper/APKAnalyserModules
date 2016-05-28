package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.mediation.MediationServerParameters;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import java.util.Map;

@zzgk
public final class zzeg
  extends zzeh.zza
{
  private Map<Class<? extends com.google.android.gms.ads.mediation.NetworkExtras>, com.google.android.gms.ads.mediation.NetworkExtras> zzyU;
  
  public zzeg() {}
  
  private <NETWORK_EXTRAS extends com.google.ads.mediation.NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> zzei zzad(String paramString)
    throws RemoteException
  {
    try
    {
      Object localObject = Class.forName(paramString, false, zzeg.class.getClassLoader());
      if (com.google.ads.mediation.MediationAdapter.class.isAssignableFrom((Class)localObject))
      {
        localObject = (com.google.ads.mediation.MediationAdapter)((Class)localObject).newInstance();
        return new zzes((com.google.ads.mediation.MediationAdapter)localObject, (com.google.ads.mediation.NetworkExtras)zzyU.get(((com.google.ads.mediation.MediationAdapter)localObject).getAdditionalParametersType()));
      }
      if (com.google.android.gms.ads.mediation.MediationAdapter.class.isAssignableFrom((Class)localObject)) {
        return new zzen((com.google.android.gms.ads.mediation.MediationAdapter)((Class)localObject).newInstance());
      }
      zzb.zzaE("Could not instantiate mediation adapter: " + paramString + " (not a valid adapter).");
      throw new RemoteException();
    }
    catch (Throwable localThrowable)
    {
      zzb.zzaE("Could not instantiate mediation adapter: " + paramString + ". " + localThrowable.getMessage());
      throw new RemoteException();
    }
  }
  
  public zzei zzab(String paramString)
    throws RemoteException
  {
    return zzad(paramString);
  }
  
  public boolean zzac(String paramString)
    throws RemoteException
  {
    try
    {
      boolean bool = CustomEvent.class.isAssignableFrom(Class.forName(paramString, false, zzeg.class.getClassLoader()));
      return bool;
    }
    catch (Throwable localThrowable)
    {
      zzb.zzaE("Could not load custom event implementation class: " + paramString + ", assuming old implementation.");
    }
    return false;
  }
  
  public void zze(Map<Class<? extends com.google.android.gms.ads.mediation.NetworkExtras>, com.google.android.gms.ads.mediation.NetworkExtras> paramMap)
  {
    zzyU = paramMap;
  }
}
