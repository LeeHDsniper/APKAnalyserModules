package com.google.android.gms.tagmanager;

class zzde
  extends Number
  implements Comparable<zzde>
{
  private double zzaSK;
  private long zzaSL;
  private boolean zzaSM;
  
  private zzde(double paramDouble)
  {
    zzaSK = paramDouble;
    zzaSM = false;
  }
  
  private zzde(long paramLong)
  {
    zzaSL = paramLong;
    zzaSM = true;
  }
  
  public static zzde zzT(long paramLong)
  {
    return new zzde(paramLong);
  }
  
  public static zzde zza(Double paramDouble)
  {
    return new zzde(paramDouble.doubleValue());
  }
  
  public static zzde zzeX(String paramString)
    throws NumberFormatException
  {
    try
    {
      zzde localZzde1 = new zzde(Long.parseLong(paramString));
      return localZzde1;
    }
    catch (NumberFormatException localNumberFormatException1)
    {
      try
      {
        zzde localZzde2 = new zzde(Double.parseDouble(paramString));
        return localZzde2;
      }
      catch (NumberFormatException localNumberFormatException2)
      {
        throw new NumberFormatException(paramString + " is not a valid TypedNumber");
      }
    }
  }
  
  public byte byteValue()
  {
    return (byte)(int)longValue();
  }
  
  public double doubleValue()
  {
    if (zzAW()) {
      return zzaSL;
    }
    return zzaSK;
  }
  
  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof zzde)) && (zza((zzde)paramObject) == 0);
  }
  
  public float floatValue()
  {
    return (float)doubleValue();
  }
  
  public int hashCode()
  {
    return new Long(longValue()).hashCode();
  }
  
  public int intValue()
  {
    return zzAY();
  }
  
  public long longValue()
  {
    return zzAX();
  }
  
  public short shortValue()
  {
    return zzAZ();
  }
  
  public String toString()
  {
    if (zzAW()) {
      return Long.toString(zzaSL);
    }
    return Double.toString(zzaSK);
  }
  
  public boolean zzAV()
  {
    return !zzAW();
  }
  
  public boolean zzAW()
  {
    return zzaSM;
  }
  
  public long zzAX()
  {
    if (zzAW()) {
      return zzaSL;
    }
    return zzaSK;
  }
  
  public int zzAY()
  {
    return (int)longValue();
  }
  
  public short zzAZ()
  {
    return (short)(int)longValue();
  }
  
  public int zza(zzde paramZzde)
  {
    if ((zzAW()) && (paramZzde.zzAW())) {
      return new Long(zzaSL).compareTo(Long.valueOf(zzaSL));
    }
    return Double.compare(doubleValue(), paramZzde.doubleValue());
  }
}
