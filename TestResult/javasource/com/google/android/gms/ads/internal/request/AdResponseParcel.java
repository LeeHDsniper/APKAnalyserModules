package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;
import java.util.Collections;
import java.util.List;

@zzgk
public final class AdResponseParcel
  implements SafeParcelable
{
  public static final zzh CREATOR = new zzh();
  public String body;
  public final int errorCode;
  public final int orientation;
  public final int versionCode;
  public final String zzAT;
  public final boolean zzDG;
  public final long zzDW;
  public final boolean zzDX;
  public final long zzDY;
  public final List<String> zzDZ;
  public final String zzEa;
  public final long zzEb;
  public final String zzEc;
  public final boolean zzEd;
  public final String zzEe;
  public final String zzEf;
  public final boolean zzEg;
  public final boolean zzEh;
  public final boolean zzEi;
  public final int zzEj;
  public LargeParcelTeleporter zzEk;
  public String zzEl;
  public final boolean zzsJ;
  public final long zzyA;
  private AdRequestInfoParcel zzyd;
  public final List<String> zzyw;
  public final List<String> zzyx;
  
  public AdResponseParcel(int paramInt)
  {
    this(13, null, null, null, paramInt, null, -1L, false, -1L, null, -1L, -1, null, -1L, null, false, null, null, false, false, false, true, false, 0, null, null);
  }
  
  public AdResponseParcel(int paramInt, long paramLong)
  {
    this(13, null, null, null, paramInt, null, -1L, false, -1L, null, paramLong, -1, null, -1L, null, false, null, null, false, false, false, true, false, 0, null, null);
  }
  
  AdResponseParcel(int paramInt1, String paramString1, String paramString2, List<String> paramList1, int paramInt2, List<String> paramList2, long paramLong1, boolean paramBoolean1, long paramLong2, List<String> paramList3, long paramLong3, int paramInt3, String paramString3, long paramLong4, String paramString4, boolean paramBoolean2, String paramString5, String paramString6, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, boolean paramBoolean7, int paramInt4, LargeParcelTeleporter paramLargeParcelTeleporter, String paramString7)
  {
    versionCode = paramInt1;
    zzAT = paramString1;
    body = paramString2;
    if (paramList1 != null)
    {
      paramString1 = Collections.unmodifiableList(paramList1);
      zzyw = paramString1;
      errorCode = paramInt2;
      if (paramList2 == null) {
        break label243;
      }
      paramString1 = Collections.unmodifiableList(paramList2);
      label52:
      zzyx = paramString1;
      zzDW = paramLong1;
      zzDX = paramBoolean1;
      zzDY = paramLong2;
      if (paramList3 == null) {
        break label248;
      }
    }
    label243:
    label248:
    for (paramString1 = Collections.unmodifiableList(paramList3);; paramString1 = null)
    {
      zzDZ = paramString1;
      zzyA = paramLong3;
      orientation = paramInt3;
      zzEa = paramString3;
      zzEb = paramLong4;
      zzEc = paramString4;
      zzEd = paramBoolean2;
      zzEe = paramString5;
      zzEf = paramString6;
      zzEg = paramBoolean3;
      zzsJ = paramBoolean4;
      zzDG = paramBoolean5;
      zzEh = paramBoolean6;
      zzEi = paramBoolean7;
      zzEj = paramInt4;
      zzEk = paramLargeParcelTeleporter;
      zzEl = paramString7;
      if ((body == null) && (zzEk != null))
      {
        paramString1 = (StringParcel)zzEk.zza(StringParcel.CREATOR);
        if ((paramString1 != null) && (!TextUtils.isEmpty(paramString1.zzfF()))) {
          body = paramString1.zzfF();
        }
      }
      return;
      paramString1 = null;
      break;
      paramString1 = null;
      break label52;
    }
  }
  
  public AdResponseParcel(AdRequestInfoParcel paramAdRequestInfoParcel, String paramString1, String paramString2, List<String> paramList1, List<String> paramList2, long paramLong1, boolean paramBoolean1, long paramLong2, List<String> paramList3, long paramLong3, int paramInt1, String paramString3, long paramLong4, String paramString4, String paramString5, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, int paramInt2)
  {
    this(13, paramString1, paramString2, paramList1, -2, paramList2, paramLong1, paramBoolean1, paramLong2, paramList3, paramLong3, paramInt1, paramString3, paramLong4, paramString4, false, null, paramString5, paramBoolean2, paramBoolean3, paramBoolean4, paramBoolean5, paramBoolean6, paramInt2, null, null);
    zzyd = paramAdRequestInfoParcel;
  }
  
  public AdResponseParcel(AdRequestInfoParcel paramAdRequestInfoParcel, String paramString1, String paramString2, List<String> paramList1, List<String> paramList2, long paramLong1, boolean paramBoolean1, long paramLong2, List<String> paramList3, long paramLong3, int paramInt1, String paramString3, long paramLong4, String paramString4, boolean paramBoolean2, String paramString5, String paramString6, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, boolean paramBoolean7, int paramInt2)
  {
    this(13, paramString1, paramString2, paramList1, -2, paramList2, paramLong1, paramBoolean1, paramLong2, paramList3, paramLong3, paramInt1, paramString3, paramLong4, paramString4, paramBoolean2, paramString5, paramString6, paramBoolean3, paramBoolean4, paramBoolean5, paramBoolean6, paramBoolean7, paramInt2, null, null);
    zzyd = paramAdRequestInfoParcel;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if ((zzyd != null) && (zzyd.versionCode >= 9) && (!TextUtils.isEmpty(body)))
    {
      zzEk = new LargeParcelTeleporter(new StringParcel(body));
      body = null;
    }
    zzh.zza(this, paramParcel, paramInt);
  }
}
