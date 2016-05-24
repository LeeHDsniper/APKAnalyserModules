package com.google.android.gms.internal;

import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public final class zzoq
  extends zzod<zzoq>
{
  private String zzaIF;
  private int zzaIG;
  private int zzaIH;
  private String zzaII;
  private String zzaIJ;
  private boolean zzaIK;
  private boolean zzaIL;
  private boolean zzaIM;
  
  public zzoq()
  {
    this(false);
  }
  
  public zzoq(boolean paramBoolean)
  {
    this(paramBoolean, zzxS());
  }
  
  public zzoq(boolean paramBoolean, int paramInt)
  {
    zzx.zzbD(paramInt);
    zzaIG = paramInt;
    zzaIL = paramBoolean;
  }
  
  static int zzxS()
  {
    UUID localUUID = UUID.randomUUID();
    int i = (int)(localUUID.getLeastSignificantBits() & 0x7FFFFFFF);
    if (i != 0) {}
    int j;
    do
    {
      return i;
      j = (int)(localUUID.getMostSignificantBits() & 0x7FFFFFFF);
      i = j;
    } while (j != 0);
    Log.e("GAv4", "UUID.randomUUID() returned 0.");
    return Integer.MAX_VALUE;
  }
  
  private void zzxZ()
  {
    if (zzaIM) {
      throw new IllegalStateException("ScreenViewInfo is immutable");
    }
  }
  
  public boolean isMutable()
  {
    return !zzaIM;
  }
  
  public void setScreenName(String paramString)
  {
    zzxZ();
    zzaIF = paramString;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("screenName", zzaIF);
    localHashMap.put("interstitial", Boolean.valueOf(zzaIK));
    localHashMap.put("automatic", Boolean.valueOf(zzaIL));
    localHashMap.put("screenId", Integer.valueOf(zzaIG));
    localHashMap.put("referrerScreenId", Integer.valueOf(zzaIH));
    localHashMap.put("referrerScreenName", zzaII);
    localHashMap.put("referrerUri", zzaIJ);
    return zzA(localHashMap);
  }
  
  public void zzal(boolean paramBoolean)
  {
    zzxZ();
    zzaIL = paramBoolean;
  }
  
  public void zzam(boolean paramBoolean)
  {
    zzxZ();
    zzaIK = paramBoolean;
  }
  
  public int zzbp()
  {
    return zzaIG;
  }
  
  public void zzc(zzoq paramZzoq)
  {
    if (!TextUtils.isEmpty(zzaIF)) {
      paramZzoq.setScreenName(zzaIF);
    }
    if (zzaIG != 0) {
      paramZzoq.zzhS(zzaIG);
    }
    if (zzaIH != 0) {
      paramZzoq.zzhT(zzaIH);
    }
    if (!TextUtils.isEmpty(zzaII)) {
      paramZzoq.zzdU(zzaII);
    }
    if (!TextUtils.isEmpty(zzaIJ)) {
      paramZzoq.zzdV(zzaIJ);
    }
    if (zzaIK) {
      paramZzoq.zzam(zzaIK);
    }
    if (zzaIL) {
      paramZzoq.zzal(zzaIL);
    }
  }
  
  public void zzdU(String paramString)
  {
    zzxZ();
    zzaII = paramString;
  }
  
  public void zzdV(String paramString)
  {
    zzxZ();
    if (TextUtils.isEmpty(paramString))
    {
      zzaIJ = null;
      return;
    }
    zzaIJ = paramString;
  }
  
  public void zzhS(int paramInt)
  {
    zzxZ();
    zzaIG = paramInt;
  }
  
  public void zzhT(int paramInt)
  {
    zzxZ();
    zzaIH = paramInt;
  }
  
  public String zzxT()
  {
    return zzaIF;
  }
  
  public int zzxU()
  {
    return zzaIH;
  }
  
  public String zzxV()
  {
    return zzaII;
  }
  
  public String zzxW()
  {
    return zzaIJ;
  }
  
  public void zzxX()
  {
    zzaIM = true;
  }
  
  public boolean zzxY()
  {
    return zzaIK;
  }
}
