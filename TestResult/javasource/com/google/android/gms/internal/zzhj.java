package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.zzh.zza;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

@zzgk
public class zzhj
{
  public final int errorCode;
  public final int orientation;
  public final zzip zzAR;
  public final String zzDB;
  public final String zzDO;
  public final long zzDW;
  public final boolean zzDX;
  public final long zzDY;
  public final List<String> zzDZ;
  public final AdRequestParcel zzDy;
  public final String zzEc;
  public final JSONObject zzGF;
  public final zzea zzGG;
  public final AdSizeParcel zzGH;
  public final long zzGI;
  public final long zzGJ;
  public final zzh.zza zzGK;
  public final long zzyA;
  public final zzdz zzyQ;
  public final zzei zzyR;
  public final String zzyS;
  public final zzec zzyT;
  public final List<String> zzyw;
  public final List<String> zzyx;
  
  public zzhj(AdRequestParcel paramAdRequestParcel, zzip paramZzip, List<String> paramList1, int paramInt1, List<String> paramList2, List<String> paramList3, int paramInt2, long paramLong1, String paramString1, boolean paramBoolean, zzdz paramZzdz, zzei paramZzei, String paramString2, zzea paramZzea, zzec paramZzec, long paramLong2, AdSizeParcel paramAdSizeParcel, long paramLong3, long paramLong4, long paramLong5, String paramString3, JSONObject paramJSONObject, zzh.zza paramZza, String paramString4)
  {
    zzDy = paramAdRequestParcel;
    zzAR = paramZzip;
    if (paramList1 != null)
    {
      paramAdRequestParcel = Collections.unmodifiableList(paramList1);
      zzyw = paramAdRequestParcel;
      errorCode = paramInt1;
      if (paramList2 == null) {
        break label180;
      }
      paramAdRequestParcel = Collections.unmodifiableList(paramList2);
      label45:
      zzyx = paramAdRequestParcel;
      if (paramList3 == null) {
        break label185;
      }
    }
    label180:
    label185:
    for (paramAdRequestParcel = Collections.unmodifiableList(paramList3);; paramAdRequestParcel = null)
    {
      zzDZ = paramAdRequestParcel;
      orientation = paramInt2;
      zzyA = paramLong1;
      zzDB = paramString1;
      zzDX = paramBoolean;
      zzyQ = paramZzdz;
      zzyR = paramZzei;
      zzyS = paramString2;
      zzGG = paramZzea;
      zzyT = paramZzec;
      zzDY = paramLong2;
      zzGH = paramAdSizeParcel;
      zzDW = paramLong3;
      zzGI = paramLong4;
      zzGJ = paramLong5;
      zzEc = paramString3;
      zzGF = paramJSONObject;
      zzGK = paramZza;
      zzDO = paramString4;
      return;
      paramAdRequestParcel = null;
      break;
      paramAdRequestParcel = null;
      break label45;
    }
  }
  
  public zzhj(zza paramZza, zzip paramZzip, zzdz paramZzdz, zzei paramZzei, String paramString, zzec paramZzec, zzh.zza paramZza1)
  {
    this(zzGL.zzDy, paramZzip, zzGM.zzyw, errorCode, zzGM.zzyx, zzGM.zzDZ, zzGM.orientation, zzGM.zzyA, zzGL.zzDB, zzGM.zzDX, paramZzdz, paramZzei, paramString, zzGG, paramZzec, zzGM.zzDY, zzqf, zzGM.zzDW, zzGI, zzGJ, zzGM.zzEc, zzGF, paramZza1, zzGL.zzDO);
  }
  
  public boolean zzbY()
  {
    if ((zzAR == null) || (zzAR.zzgS() == null)) {
      return false;
    }
    return zzAR.zzgS().zzbY();
  }
  
  @zzgk
  public static final class zza
  {
    public final int errorCode;
    public final JSONObject zzGF;
    public final zzea zzGG;
    public final long zzGI;
    public final long zzGJ;
    public final AdRequestInfoParcel zzGL;
    public final AdResponseParcel zzGM;
    public final AdSizeParcel zzqf;
    
    public zza(AdRequestInfoParcel paramAdRequestInfoParcel, AdResponseParcel paramAdResponseParcel, zzea paramZzea, AdSizeParcel paramAdSizeParcel, int paramInt, long paramLong1, long paramLong2, JSONObject paramJSONObject)
    {
      zzGL = paramAdRequestInfoParcel;
      zzGM = paramAdResponseParcel;
      zzGG = paramZzea;
      zzqf = paramAdSizeParcel;
      errorCode = paramInt;
      zzGI = paramLong1;
      zzGJ = paramLong2;
      zzGF = paramJSONObject;
    }
  }
}
