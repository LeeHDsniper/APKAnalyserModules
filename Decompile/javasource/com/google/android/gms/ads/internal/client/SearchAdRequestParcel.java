package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class SearchAdRequestParcel
  implements SafeParcelable
{
  public static final zzae CREATOR = new zzae();
  public final int backgroundColor;
  public final int versionCode;
  public final int zztA;
  public final int zztB;
  public final int zztC;
  public final int zztD;
  public final int zztE;
  public final int zztF;
  public final int zztG;
  public final String zztH;
  public final int zztI;
  public final String zztJ;
  public final int zztK;
  public final int zztL;
  public final String zztM;
  
  SearchAdRequestParcel(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, String paramString1, int paramInt10, String paramString2, int paramInt11, int paramInt12, String paramString3)
  {
    versionCode = paramInt1;
    zztA = paramInt2;
    backgroundColor = paramInt3;
    zztB = paramInt4;
    zztC = paramInt5;
    zztD = paramInt6;
    zztE = paramInt7;
    zztF = paramInt8;
    zztG = paramInt9;
    zztH = paramString1;
    zztI = paramInt10;
    zztJ = paramString2;
    zztK = paramInt11;
    zztL = paramInt12;
    zztM = paramString3;
  }
  
  public SearchAdRequestParcel(SearchAdRequest paramSearchAdRequest)
  {
    versionCode = 1;
    zztA = paramSearchAdRequest.getAnchorTextColor();
    backgroundColor = paramSearchAdRequest.getBackgroundColor();
    zztB = paramSearchAdRequest.getBackgroundGradientBottom();
    zztC = paramSearchAdRequest.getBackgroundGradientTop();
    zztD = paramSearchAdRequest.getBorderColor();
    zztE = paramSearchAdRequest.getBorderThickness();
    zztF = paramSearchAdRequest.getBorderType();
    zztG = paramSearchAdRequest.getCallButtonColor();
    zztH = paramSearchAdRequest.getCustomChannels();
    zztI = paramSearchAdRequest.getDescriptionTextColor();
    zztJ = paramSearchAdRequest.getFontFace();
    zztK = paramSearchAdRequest.getHeaderTextColor();
    zztL = paramSearchAdRequest.getHeaderTextSize();
    zztM = paramSearchAdRequest.getQuery();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzae.zza(this, paramParcel, paramInt);
  }
}
