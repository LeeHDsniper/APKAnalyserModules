package com.google.android.gms.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import java.util.concurrent.Future;

@zzgk
public final class zzhs
{
  public static Future zza(Context paramContext, final int paramInt)
  {
    new zza(paramContext)
    {
      public void zzdG()
      {
        SharedPreferences.Editor localEditor = zzhs.zzH(zzrn).edit();
        localEditor.putInt("webview_cache_version", paramInt);
        localEditor.apply();
      }
    }.zzgn();
  }
  
  public static Future zza(Context paramContext, final zzb paramZzb)
  {
    new zza(paramContext)
    {
      public void zzdG()
      {
        SharedPreferences localSharedPreferences = zzhs.zzH(zzrn);
        Bundle localBundle = new Bundle();
        localBundle.putBoolean("use_https", localSharedPreferences.getBoolean("use_https", true));
        if (paramZzb != null) {
          paramZzb.zzd(localBundle);
        }
      }
    }.zzgn();
  }
  
  public static Future zza(Context paramContext, final boolean paramBoolean)
  {
    new zza(paramContext)
    {
      public void zzdG()
      {
        SharedPreferences.Editor localEditor = zzhs.zzH(zzrn).edit();
        localEditor.putBoolean("use_https", paramBoolean);
        localEditor.apply();
      }
    }.zzgn();
  }
  
  public static Future zzb(Context paramContext, final zzb paramZzb)
  {
    new zza(paramContext)
    {
      public void zzdG()
      {
        SharedPreferences localSharedPreferences = zzhs.zzH(zzrn);
        Bundle localBundle = new Bundle();
        localBundle.putInt("webview_cache_version", localSharedPreferences.getInt("webview_cache_version", 0));
        if (paramZzb != null) {
          paramZzb.zzd(localBundle);
        }
      }
    }.zzgn();
  }
  
  private static SharedPreferences zzv(Context paramContext)
  {
    return paramContext.getSharedPreferences("admob", 0);
  }
  
  private static abstract class zza
    extends zzhq
  {
    private zza() {}
    
    public void onStop() {}
  }
  
  public static abstract interface zzb
  {
    public abstract void zzd(Bundle paramBundle);
  }
}
