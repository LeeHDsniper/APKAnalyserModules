package com.google.android.gms.auth.api.proxy;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ProxyGrpcRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<ProxyGrpcRequest> CREATOR = new zza();
  public final byte[] body;
  public final String hostname;
  public final String method;
  public final int port;
  public final long timeoutMillis;
  final int versionCode;
  
  ProxyGrpcRequest(int paramInt1, String paramString1, int paramInt2, long paramLong, byte[] paramArrayOfByte, String paramString2)
  {
    versionCode = paramInt1;
    hostname = paramString1;
    port = paramInt2;
    timeoutMillis = paramLong;
    body = paramArrayOfByte;
    method = paramString2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}
