package com.google.android.gms.analytics;

import android.net.Uri;
import android.text.TextUtils;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzk;
import com.google.android.gms.analytics.internal.zzn;
import com.google.android.gms.analytics.internal.zzu;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzjb;
import com.google.android.gms.internal.zzob;
import com.google.android.gms.internal.zzoe;
import com.google.android.gms.internal.zzoh;
import java.util.List;
import java.util.ListIterator;

public class zza
  extends zzoe<zza>
{
  private final zzf zzKa;
  private boolean zzKb;
  
  public zza(zzf paramZzf)
  {
    super(paramZzf.zzig(), paramZzf.zzid());
    zzKa = paramZzf;
  }
  
  public void enableAdvertisingIdCollection(boolean paramBoolean)
  {
    zzKb = paramBoolean;
  }
  
  protected void zza(zzob paramZzob)
  {
    paramZzob = (zzjb)paramZzob.zze(zzjb.class);
    if (TextUtils.isEmpty(paramZzob.getClientId())) {
      paramZzob.setClientId(zzKa.zziv().zzjd());
    }
    if ((zzKb) && (TextUtils.isEmpty(paramZzob.zzhL())))
    {
      com.google.android.gms.analytics.internal.zza localZza = zzKa.zziu();
      paramZzob.zzaT(localZza.zzhQ());
      paramZzob.zzG(localZza.zzhM());
    }
  }
  
  public void zzaN(String paramString)
  {
    zzx.zzcs(paramString);
    zzaO(paramString);
    zzxt().add(new zzb(zzKa, paramString));
  }
  
  public void zzaO(String paramString)
  {
    paramString = zzb.zzaP(paramString);
    ListIterator localListIterator = zzxt().listIterator();
    while (localListIterator.hasNext()) {
      if (paramString.equals(((zzoh)localListIterator.next()).zzhs())) {
        localListIterator.remove();
      }
    }
  }
  
  zzf zzhp()
  {
    return zzKa;
  }
  
  public zzob zzhq()
  {
    zzob localZzob = zzxs().zzxh();
    localZzob.zzb(zzKa.zzil().zziL());
    localZzob.zzb(zzKa.zzim().zzjS());
    zzd(localZzob);
    return localZzob;
  }
}
