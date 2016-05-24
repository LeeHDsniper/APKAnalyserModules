package com.google.android.gms.auth.api.proxy;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ProxyRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<ProxyRequest> CREATOR = new zzb();
  public static final int HTTP_METHOD_DELETE;
  public static final int HTTP_METHOD_GET = 0;
  public static final int HTTP_METHOD_HEAD;
  public static final int HTTP_METHOD_OPTIONS;
  public static final int HTTP_METHOD_PATCH = 7;
  public static final int HTTP_METHOD_POST = 1;
  public static final int HTTP_METHOD_PUT = 2;
  public static final int HTTP_METHOD_TRACE;
  public static final int LAST_CODE = 7;
  public final byte[] body;
  public final int httpMethod;
  public final long timeoutMillis;
  public final String url;
  final int versionCode;
  Bundle zzRE;
  
  static
  {
    HTTP_METHOD_DELETE = 3;
    HTTP_METHOD_HEAD = 4;
    HTTP_METHOD_OPTIONS = 5;
    HTTP_METHOD_TRACE = 6;
  }
  
  ProxyRequest(int paramInt1, String paramString, int paramInt2, long paramLong, byte[] paramArrayOfByte, Bundle paramBundle)
  {
    versionCode = paramInt1;
    url = paramString;
    httpMethod = paramInt2;
    timeoutMillis = paramLong;
    body = paramArrayOfByte;
    zzRE = paramBundle;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String toString()
  {
    return "ProxyRequest[ url: " + url + ", method: " + httpMethod + " ]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}
