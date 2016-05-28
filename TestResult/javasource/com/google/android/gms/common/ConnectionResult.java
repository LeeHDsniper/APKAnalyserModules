package com.google.android.gms.common;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.IntentSender.SendIntentException;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class ConnectionResult
  implements SafeParcelable
{
  public static final Parcelable.Creator<ConnectionResult> CREATOR = new zzb();
  public static final ConnectionResult zzYi = new ConnectionResult(0, null);
  private final PendingIntent mPendingIntent;
  final int mVersionCode;
  private final int zzWu;
  
  ConnectionResult(int paramInt1, int paramInt2, PendingIntent paramPendingIntent)
  {
    mVersionCode = paramInt1;
    zzWu = paramInt2;
    mPendingIntent = paramPendingIntent;
  }
  
  public ConnectionResult(int paramInt, PendingIntent paramPendingIntent)
  {
    this(1, paramInt, paramPendingIntent);
  }
  
  static String getStatusString(int paramInt)
  {
    switch (paramInt)
    {
    case 12: 
    default: 
      return "UNKNOWN_ERROR_CODE(" + paramInt + ")";
    case 0: 
      return "SUCCESS";
    case 1: 
      return "SERVICE_MISSING";
    case 2: 
      return "SERVICE_VERSION_UPDATE_REQUIRED";
    case 3: 
      return "SERVICE_DISABLED";
    case 4: 
      return "SIGN_IN_REQUIRED";
    case 5: 
      return "INVALID_ACCOUNT";
    case 6: 
      return "RESOLUTION_REQUIRED";
    case 7: 
      return "NETWORK_ERROR";
    case 8: 
      return "INTERNAL_ERROR";
    case 9: 
      return "SERVICE_INVALID";
    case 10: 
      return "DEVELOPER_ERROR";
    case 11: 
      return "LICENSE_CHECK_FAILED";
    case 13: 
      return "CANCELED";
    case 14: 
      return "TIMEOUT";
    case 15: 
      return "INTERRUPTED";
    case 16: 
      return "API_UNAVAILABLE";
    case 17: 
      return "SIGN_IN_FAILED";
    }
    return "SERVICE_UPDATING";
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof ConnectionResult)) {
        return false;
      }
      paramObject = (ConnectionResult)paramObject;
    } while ((zzWu == zzWu) && (zzw.equal(mPendingIntent, mPendingIntent)));
    return false;
  }
  
  public int getErrorCode()
  {
    return zzWu;
  }
  
  public PendingIntent getResolution()
  {
    return mPendingIntent;
  }
  
  public boolean hasResolution()
  {
    return (zzWu != 0) && (mPendingIntent != null);
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { Integer.valueOf(zzWu), mPendingIntent });
  }
  
  public boolean isSuccess()
  {
    return zzWu == 0;
  }
  
  public void startResolutionForResult(Activity paramActivity, int paramInt)
    throws IntentSender.SendIntentException
  {
    if (!hasResolution()) {
      return;
    }
    paramActivity.startIntentSenderForResult(mPendingIntent.getIntentSender(), paramInt, null, 0, 0, 0);
  }
  
  public String toString()
  {
    return zzw.zzu(this).zzg("statusCode", getStatusString(zzWu)).zzg("resolution", mPendingIntent).toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}
