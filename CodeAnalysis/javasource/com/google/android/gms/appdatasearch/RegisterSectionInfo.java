package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;

public class RegisterSectionInfo
  implements SafeParcelable
{
  public static final zzi CREATOR = new zzi();
  final int mVersionCode;
  public final String name;
  public final int weight;
  public final String zzPA;
  public final boolean zzPB;
  public final boolean zzPC;
  public final String zzPD;
  public final Feature[] zzPE;
  final int[] zzPF;
  public final String zzPG;
  
  RegisterSectionInfo(int paramInt1, String paramString1, String paramString2, boolean paramBoolean1, int paramInt2, boolean paramBoolean2, String paramString3, Feature[] paramArrayOfFeature, int[] paramArrayOfInt, String paramString4)
  {
    mVersionCode = paramInt1;
    name = paramString1;
    zzPA = paramString2;
    zzPB = paramBoolean1;
    weight = paramInt2;
    zzPC = paramBoolean2;
    zzPD = paramString3;
    zzPE = paramArrayOfFeature;
    zzPF = paramArrayOfInt;
    zzPG = paramString4;
  }
  
  RegisterSectionInfo(String paramString1, String paramString2, boolean paramBoolean1, int paramInt, boolean paramBoolean2, String paramString3, Feature[] paramArrayOfFeature, int[] paramArrayOfInt, String paramString4)
  {
    this(2, paramString1, paramString2, paramBoolean1, paramInt, paramBoolean2, paramString3, paramArrayOfFeature, paramArrayOfInt, paramString4);
  }
  
  public int describeContents()
  {
    zzi localZzi = CREATOR;
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi localZzi = CREATOR;
    zzi.zza(this, paramParcel, paramInt);
  }
  
  public static final class zza
  {
    private final String mName;
    private String zzPH;
    private boolean zzPI;
    private int zzPJ;
    private boolean zzPK;
    private String zzPL;
    private final List<Feature> zzPM;
    private BitSet zzPN;
    private String zzPO;
    
    public zza(String paramString)
    {
      mName = paramString;
      zzPJ = 1;
      zzPM = new ArrayList();
    }
    
    public zza zzM(boolean paramBoolean)
    {
      zzPI = paramBoolean;
      return this;
    }
    
    public zza zzby(String paramString)
    {
      zzPH = paramString;
      return this;
    }
    
    public RegisterSectionInfo zzld()
    {
      int i = 0;
      Object localObject = null;
      if (zzPN != null)
      {
        int[] arrayOfInt = new int[zzPN.cardinality()];
        int j = zzPN.nextSetBit(0);
        for (;;)
        {
          localObject = arrayOfInt;
          if (j < 0) {
            break;
          }
          arrayOfInt[i] = j;
          j = zzPN.nextSetBit(j + 1);
          i += 1;
        }
      }
      return new RegisterSectionInfo(mName, zzPH, zzPI, zzPJ, zzPK, zzPL, (Feature[])zzPM.toArray(new Feature[zzPM.size()]), localObject, zzPO);
    }
  }
}
