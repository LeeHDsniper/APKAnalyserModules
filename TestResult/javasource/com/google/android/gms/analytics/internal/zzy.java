package com.google.android.gms.analytics.internal;

import com.google.android.gms.common.internal.zzd;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzkq;

public final class zzy
{
  public static zza<Boolean> zzMY = zza.zzd("analytics.service_enabled", false);
  public static zza<Boolean> zzMZ = zza.zzd("analytics.service_client_enabled", true);
  public static zza<Integer> zzNA = zza.zze("analytics.batch_retry_interval.seconds.k", 3600);
  public static zza<Long> zzNB = zza.zzc("analytics.service_monitor_interval", 86400000L);
  public static zza<Integer> zzNC = zza.zze("analytics.http_connection.connect_timeout_millis", 60000);
  public static zza<Integer> zzND = zza.zze("analytics.http_connection.read_timeout_millis", 61000);
  public static zza<Long> zzNE = zza.zzc("analytics.campaigns.time_limit", 86400000L);
  public static zza<String> zzNF = zza.zzn("analytics.first_party_experiment_id", "");
  public static zza<Integer> zzNG = zza.zze("analytics.first_party_experiment_variant", 0);
  public static zza<Boolean> zzNH = zza.zzd("analytics.test.disable_receiver", false);
  public static zza<Long> zzNI = zza.zza("analytics.service_client.idle_disconnect_millis", 10000L, 10000L);
  public static zza<Long> zzNJ = zza.zzc("analytics.service_client.connect_timeout_millis", 5000L);
  public static zza<Long> zzNK = zza.zzc("analytics.service_client.second_connect_delay_millis", 5000L);
  public static zza<Long> zzNL = zza.zzc("analytics.service_client.unexpected_reconnect_millis", 60000L);
  public static zza<Long> zzNM = zza.zzc("analytics.service_client.reconnect_throttle_millis", 1800000L);
  public static zza<Long> zzNN = zza.zzc("analytics.monitoring.sample_period_millis", 86400000L);
  public static zza<Long> zzNO = zza.zzc("analytics.initialization_warning_threshold", 5000L);
  public static zza<String> zzNa = zza.zzd("analytics.log_tag", "GAv4", "GAv4-SVC");
  public static zza<Long> zzNb = zza.zzc("analytics.max_tokens", 60L);
  public static zza<Float> zzNc = zza.zza("analytics.tokens_per_sec", 0.5F);
  public static zza<Integer> zzNd = zza.zza("analytics.max_stored_hits", 2000, 20000);
  public static zza<Integer> zzNe = zza.zze("analytics.max_stored_hits_per_app", 2000);
  public static zza<Integer> zzNf = zza.zze("analytics.max_stored_properties_per_app", 100);
  public static zza<Long> zzNg = zza.zza("analytics.local_dispatch_millis", 1800000L, 120000L);
  public static zza<Long> zzNh = zza.zza("analytics.initial_local_dispatch_millis", 5000L, 5000L);
  public static zza<Long> zzNi = zza.zzc("analytics.min_local_dispatch_millis", 120000L);
  public static zza<Long> zzNj = zza.zzc("analytics.max_local_dispatch_millis", 7200000L);
  public static zza<Long> zzNk = zza.zzc("analytics.dispatch_alarm_millis", 7200000L);
  public static zza<Long> zzNl = zza.zzc("analytics.max_dispatch_alarm_millis", 32400000L);
  public static zza<Integer> zzNm = zza.zze("analytics.max_hits_per_dispatch", 20);
  public static zza<Integer> zzNn = zza.zze("analytics.max_hits_per_batch", 20);
  public static zza<String> zzNo = zza.zzn("analytics.insecure_host", "http://www.google-analytics.com");
  public static zza<String> zzNp = zza.zzn("analytics.secure_host", "https://ssl.google-analytics.com");
  public static zza<String> zzNq = zza.zzn("analytics.simple_endpoint", "/collect");
  public static zza<String> zzNr = zza.zzn("analytics.batching_endpoint", "/batch");
  public static zza<Integer> zzNs = zza.zze("analytics.max_get_length", 2036);
  public static zza<String> zzNt = zza.zzd("analytics.batching_strategy.k", zzm.zzMD.name(), zzm.zzMD.name());
  public static zza<String> zzNu = zza.zzn("analytics.compression_strategy.k", zzo.zzMK.name());
  public static zza<Integer> zzNv = zza.zze("analytics.max_hits_per_request.k", 20);
  public static zza<Integer> zzNw = zza.zze("analytics.max_hit_length.k", 8192);
  public static zza<Integer> zzNx = zza.zze("analytics.max_post_length.k", 8192);
  public static zza<Integer> zzNy = zza.zze("analytics.max_batch_post_length", 8192);
  public static zza<String> zzNz = zza.zzn("analytics.fallback_responses.k", "404,502");
  
  public static final class zza<V>
  {
    private final V zzNP;
    private final zzkq<V> zzNQ;
    private V zzNR;
    
    private zza(zzkq<V> paramZzkq, V paramV)
    {
      zzx.zzv(paramZzkq);
      zzNQ = paramZzkq;
      zzNP = paramV;
    }
    
    static zza<Float> zza(String paramString, float paramFloat)
    {
      return zza(paramString, paramFloat, paramFloat);
    }
    
    static zza<Float> zza(String paramString, float paramFloat1, float paramFloat2)
    {
      return new zza(zzkq.zza(paramString, Float.valueOf(paramFloat2)), Float.valueOf(paramFloat1));
    }
    
    static zza<Integer> zza(String paramString, int paramInt1, int paramInt2)
    {
      return new zza(zzkq.zza(paramString, Integer.valueOf(paramInt2)), Integer.valueOf(paramInt1));
    }
    
    static zza<Long> zza(String paramString, long paramLong1, long paramLong2)
    {
      return new zza(zzkq.zza(paramString, Long.valueOf(paramLong2)), Long.valueOf(paramLong1));
    }
    
    static zza<Boolean> zza(String paramString, boolean paramBoolean1, boolean paramBoolean2)
    {
      return new zza(zzkq.zzg(paramString, paramBoolean2), Boolean.valueOf(paramBoolean1));
    }
    
    static zza<Long> zzc(String paramString, long paramLong)
    {
      return zza(paramString, paramLong, paramLong);
    }
    
    static zza<String> zzd(String paramString1, String paramString2, String paramString3)
    {
      return new zza(zzkq.zzu(paramString1, paramString3), paramString2);
    }
    
    static zza<Boolean> zzd(String paramString, boolean paramBoolean)
    {
      return zza(paramString, paramBoolean, paramBoolean);
    }
    
    static zza<Integer> zze(String paramString, int paramInt)
    {
      return zza(paramString, paramInt, paramInt);
    }
    
    static zza<String> zzn(String paramString1, String paramString2)
    {
      return zzd(paramString1, paramString2, paramString2);
    }
    
    public V get()
    {
      if (zzNR != null) {
        return zzNR;
      }
      if ((zzd.zzacF) && (zzkq.isInitialized())) {
        return zzNQ.zznN();
      }
      return zzNP;
    }
  }
}
