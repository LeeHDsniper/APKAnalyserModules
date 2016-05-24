package com.google.android.gms.analytics.internal;

import com.google.android.gms.common.GoogleApiAvailability;

public class zze
{
  public static final String VERSION = String.valueOf(GoogleApiAvailability.GOOGLE_PLAY_SERVICES_VERSION_CODE / 1000).replaceAll("(\\d+)(\\d)(\\d\\d)", "$1.$2.$3");
  public static final String zzLB = "ma" + VERSION;
}
