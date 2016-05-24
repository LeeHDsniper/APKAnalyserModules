package com.google.android.gms.ads.internal.overlay;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzgk;

@zzgk
public class zza
{
  public zza() {}
  
  public boolean zza(Context paramContext, AdLauncherIntentInfoParcel paramAdLauncherIntentInfoParcel, zzn paramZzn)
  {
    if (paramAdLauncherIntentInfoParcel == null)
    {
      zzb.zzaE("No intent data for launcher overlay.");
      return false;
    }
    Intent localIntent = new Intent();
    if (TextUtils.isEmpty(url))
    {
      zzb.zzaE("Open GMSG did not contain a URL.");
      return false;
    }
    if (!TextUtils.isEmpty(mimeType)) {
      localIntent.setDataAndType(Uri.parse(url), mimeType);
    }
    String[] arrayOfString;
    for (;;)
    {
      localIntent.setAction("android.intent.action.VIEW");
      if (!TextUtils.isEmpty(packageName)) {
        localIntent.setPackage(packageName);
      }
      if (TextUtils.isEmpty(zzzY)) {
        break label178;
      }
      arrayOfString = zzzY.split("/", 2);
      if (arrayOfString.length >= 2) {
        break;
      }
      zzb.zzaE("Could not parse component name from open GMSG: " + zzzY);
      return false;
      localIntent.setData(Uri.parse(url));
    }
    localIntent.setClassName(arrayOfString[0], arrayOfString[1]);
    label178:
    paramAdLauncherIntentInfoParcel = zzzZ;
    if (!TextUtils.isEmpty(paramAdLauncherIntentInfoParcel)) {}
    try
    {
      i = Integer.parseInt(paramAdLauncherIntentInfoParcel);
      localIntent.addFlags(i);
    }
    catch (NumberFormatException paramAdLauncherIntentInfoParcel)
    {
      for (;;)
      {
        try
        {
          zzb.v("Launching an intent: " + localIntent.toURI());
          paramContext.startActivity(localIntent);
          if (paramZzn != null) {
            paramZzn.zzaO();
          }
          return true;
        }
        catch (ActivityNotFoundException paramContext)
        {
          int i;
          zzb.zzaE(paramContext.getMessage());
        }
        paramAdLauncherIntentInfoParcel = paramAdLauncherIntentInfoParcel;
        zzb.zzaE("Could not parse intent flags.");
        i = 0;
      }
    }
    return false;
  }
}
