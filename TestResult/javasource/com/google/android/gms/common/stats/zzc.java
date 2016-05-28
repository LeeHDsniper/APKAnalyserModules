package com.google.android.gms.common.stats;

import com.google.android.gms.internal.zzkq;

public final class zzc
{
  public static zzkq<Integer> zzafC = zzkq.zza("gms:common:stats:max_num_of_events", Integer.valueOf(100));
  
  public static final class zza
  {
    public static zzkq<Integer> zzafD = zzkq.zza("gms:common:stats:connections:level", Integer.valueOf(zzd.LOG_LEVEL_OFF));
    public static zzkq<String> zzafE = zzkq.zzu("gms:common:stats:connections:ignored_calling_processes", "");
    public static zzkq<String> zzafF = zzkq.zzu("gms:common:stats:connections:ignored_calling_services", "");
    public static zzkq<String> zzafG = zzkq.zzu("gms:common:stats:connections:ignored_target_processes", "");
    public static zzkq<String> zzafH = zzkq.zzu("gms:common:stats:connections:ignored_target_services", "com.google.android.gms.auth.GetToken");
    public static zzkq<Long> zzafI = zzkq.zza("gms:common:stats:connections:time_out_duration", Long.valueOf(600000L));
  }
  
  public static final class zzb
  {
    public static zzkq<Integer> zzafD = zzkq.zza("gms:common:stats:wakeLocks:level", Integer.valueOf(zzd.LOG_LEVEL_OFF));
    public static zzkq<Long> zzafI = zzkq.zza("gms:common:stats:wakelocks:time_out_duration", Long.valueOf(600000L));
  }
}
