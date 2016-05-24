package com.google.android.gms.common.images;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public final class WebImage
  implements SafeParcelable
{
  public static final Parcelable.Creator<WebImage> CREATOR = new zzb();
  private final int mVersionCode;
  private final Uri zzacb;
  private final int zznP;
  private final int zznQ;
  
  WebImage(int paramInt1, Uri paramUri, int paramInt2, int paramInt3)
  {
    mVersionCode = paramInt1;
    zzacb = paramUri;
    zznP = paramInt2;
    zznQ = paramInt3;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if ((paramObject == null) || (!(paramObject instanceof WebImage))) {
        return false;
      }
      paramObject = (WebImage)paramObject;
    } while ((zzw.equal(zzacb, zzacb)) && (zznP == zznP) && (zznQ == zznQ));
    return false;
  }
  
  public int getHeight()
  {
    return zznQ;
  }
  
  public Uri getUrl()
  {
    return zzacb;
  }
  
  int getVersionCode()
  {
    return mVersionCode;
  }
  
  public int getWidth()
  {
    return zznP;
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { zzacb, Integer.valueOf(zznP), Integer.valueOf(zznQ) });
  }
  
  public String toString()
  {
    return String.format("Image %dx%d %s", new Object[] { Integer.valueOf(zznP), Integer.valueOf(zznQ), zzacb.toString() });
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}
