package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.ArrayList;
import java.util.List;

public class zzhx
{
  private final String[] zzHU;
  private final double[] zzHV;
  private final double[] zzHW;
  private final int[] zzHX;
  private int zzHY;
  
  private zzhx(zzb paramZzb)
  {
    int i = zzb.zza(paramZzb).size();
    zzHU = ((String[])zzb.zzb(paramZzb).toArray(new String[i]));
    zzHV = zzc(zzb.zza(paramZzb));
    zzHW = zzc(zzb.zzc(paramZzb));
    zzHX = new int[i];
    zzHY = 0;
  }
  
  private double[] zzc(List<Double> paramList)
  {
    double[] arrayOfDouble = new double[paramList.size()];
    int i = 0;
    while (i < arrayOfDouble.length)
    {
      arrayOfDouble[i] = ((Double)paramList.get(i)).doubleValue();
      i += 1;
    }
    return arrayOfDouble;
  }
  
  public List<zza> getBuckets()
  {
    ArrayList localArrayList = new ArrayList(zzHU.length);
    int i = 0;
    while (i < zzHU.length)
    {
      localArrayList.add(new zza(zzHU[i], zzHW[i], zzHV[i], zzHX[i] / zzHY, zzHX[i]));
      i += 1;
    }
    return localArrayList;
  }
  
  public void zza(double paramDouble)
  {
    zzHY += 1;
    int i = 0;
    for (;;)
    {
      if (i < zzHW.length)
      {
        if ((zzHW[i] <= paramDouble) && (paramDouble < zzHV[i]))
        {
          int[] arrayOfInt = zzHX;
          arrayOfInt[i] += 1;
        }
        if (paramDouble >= zzHW[i]) {}
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  public static class zza
  {
    public final int count;
    public final String name;
    public final double zzHZ;
    public final double zzIa;
    public final double zzIb;
    
    public zza(String paramString, double paramDouble1, double paramDouble2, double paramDouble3, int paramInt)
    {
      name = paramString;
      zzIa = paramDouble1;
      zzHZ = paramDouble2;
      zzIb = paramDouble3;
      count = paramInt;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zza)) {}
      do
      {
        return false;
        paramObject = (zza)paramObject;
      } while ((!zzw.equal(name, name)) || (zzHZ != zzHZ) || (zzIa != zzIa) || (count != count) || (Double.compare(zzIb, zzIb) != 0));
      return true;
    }
    
    public int hashCode()
    {
      return zzw.hashCode(new Object[] { name, Double.valueOf(zzHZ), Double.valueOf(zzIa), Double.valueOf(zzIb), Integer.valueOf(count) });
    }
    
    public String toString()
    {
      return zzw.zzu(this).zzg("name", name).zzg("minBound", Double.valueOf(zzIa)).zzg("maxBound", Double.valueOf(zzHZ)).zzg("percent", Double.valueOf(zzIb)).zzg("count", Integer.valueOf(count)).toString();
    }
  }
  
  public static class zzb
  {
    private final List<String> zzIc = new ArrayList();
    private final List<Double> zzId = new ArrayList();
    private final List<Double> zzIe = new ArrayList();
    
    public zzb() {}
    
    public zzb zza(String paramString, double paramDouble1, double paramDouble2)
    {
      int i = 0;
      for (;;)
      {
        double d1;
        double d2;
        if (i < zzIc.size())
        {
          d1 = ((Double)zzIe.get(i)).doubleValue();
          d2 = ((Double)zzId.get(i)).doubleValue();
          if (paramDouble1 >= d1) {
            break label107;
          }
        }
        label107:
        while ((d1 == paramDouble1) && (paramDouble2 < d2))
        {
          zzIc.add(i, paramString);
          zzIe.add(i, Double.valueOf(paramDouble1));
          zzId.add(i, Double.valueOf(paramDouble2));
          return this;
        }
        i += 1;
      }
    }
    
    public zzhx zzgz()
    {
      return new zzhx(this, null);
    }
  }
}
