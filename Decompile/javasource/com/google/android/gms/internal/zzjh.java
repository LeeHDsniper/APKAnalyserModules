package com.google.android.gms.internal;

import com.google.android.gms.appdatasearch.GetRecentContextCall.Request;
import com.google.android.gms.appdatasearch.GetRecentContextCall.Response;
import com.google.android.gms.appdatasearch.GetRecentContextCall.zza;
import com.google.android.gms.appdatasearch.zzk;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;

public final class zzjh
  implements zzk
{
  public zzjh() {}
  
  public PendingResult<GetRecentContextCall.Response> zza(GoogleApiClient paramGoogleApiClient, GetRecentContextCall.Request paramRequest)
  {
    return paramGoogleApiClient.zza(new GetRecentContextCall.zza(paramRequest, paramGoogleApiClient));
  }
}
