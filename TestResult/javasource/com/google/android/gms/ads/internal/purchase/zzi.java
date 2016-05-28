package com.google.android.gms.ads.internal.purchase;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhl;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzi
{
  public zzi() {}
  
  public void zza(Context paramContext, boolean paramBoolean, GInAppPurchaseManagerInfoParcel paramGInAppPurchaseManagerInfoParcel)
  {
    Intent localIntent = new Intent();
    localIntent.setClassName(paramContext, "com.google.android.gms.ads.purchase.InAppPurchaseActivity");
    localIntent.putExtra("com.google.android.gms.ads.internal.purchase.useClientJar", paramBoolean);
    GInAppPurchaseManagerInfoParcel.zza(localIntent, paramGInAppPurchaseManagerInfoParcel);
    paramContext.startActivity(localIntent);
  }
  
  public String zzal(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    try
    {
      paramString = new JSONObject(paramString).getString("developerPayload");
      return paramString;
    }
    catch (JSONException paramString)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Fail to parse purchase data");
    }
    return null;
  }
  
  public String zzam(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    try
    {
      paramString = new JSONObject(paramString).getString("purchaseToken");
      return paramString;
    }
    catch (JSONException paramString)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Fail to parse purchase data");
    }
    return null;
  }
  
  public int zzc(Bundle paramBundle)
  {
    paramBundle = paramBundle.get("RESPONSE_CODE");
    if (paramBundle == null)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Bundle with null response code, assuming OK (known issue)");
      return 0;
    }
    if ((paramBundle instanceof Integer)) {
      return ((Integer)paramBundle).intValue();
    }
    if ((paramBundle instanceof Long)) {
      return (int)((Long)paramBundle).longValue();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaE("Unexpected type for intent response code. " + paramBundle.getClass().getName());
    return 5;
  }
  
  public int zzd(Intent paramIntent)
  {
    if (paramIntent == null) {
      return 5;
    }
    paramIntent = paramIntent.getExtras().get("RESPONSE_CODE");
    if (paramIntent == null)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Intent with no response code, assuming OK (known issue)");
      return 0;
    }
    if ((paramIntent instanceof Integer)) {
      return ((Integer)paramIntent).intValue();
    }
    if ((paramIntent instanceof Long)) {
      return (int)((Long)paramIntent).longValue();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaE("Unexpected type for intent response code. " + paramIntent.getClass().getName());
    return 5;
  }
  
  public String zze(Intent paramIntent)
  {
    if (paramIntent == null) {
      return null;
    }
    return paramIntent.getStringExtra("INAPP_PURCHASE_DATA");
  }
  
  public String zzf(Intent paramIntent)
  {
    if (paramIntent == null) {
      return null;
    }
    return paramIntent.getStringExtra("INAPP_DATA_SIGNATURE");
  }
  
  public void zzy(final Context paramContext)
  {
    ServiceConnection local1 = new ServiceConnection()
    {
      public void onServiceConnected(ComponentName paramAnonymousComponentName, IBinder paramAnonymousIBinder)
      {
        boolean bool = false;
        paramAnonymousComponentName = new zzb(paramContext.getApplicationContext(), false);
        paramAnonymousComponentName.zzM(paramAnonymousIBinder);
        int i = paramAnonymousComponentName.zza(3, paramContext.getPackageName(), "inapp");
        paramAnonymousIBinder = zzp.zzbA();
        if (i == 0) {
          bool = true;
        }
        paramAnonymousIBinder.zzB(bool);
        paramContext.unbindService(this);
        paramAnonymousComponentName.destroy();
      }
      
      public void onServiceDisconnected(ComponentName paramAnonymousComponentName) {}
    };
    Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
    localIntent.setPackage("com.android.vending");
    paramContext.bindService(localIntent, local1, 1);
  }
}
