package com.google.android.gms.common.internal.safeparcel;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;

public class zza
{
  public static String[] zzA(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    String[] arrayOfString = paramParcel.createStringArray();
    paramParcel.setDataPosition(paramInt + i);
    return arrayOfString;
  }
  
  public static ArrayList<Integer> zzB(Parcel paramParcel, int paramInt)
  {
    int i = zza(paramParcel, paramInt);
    int j = paramParcel.dataPosition();
    if (i == 0) {
      return null;
    }
    ArrayList localArrayList = new ArrayList();
    int k = paramParcel.readInt();
    paramInt = 0;
    while (paramInt < k)
    {
      localArrayList.add(Integer.valueOf(paramParcel.readInt()));
      paramInt += 1;
    }
    paramParcel.setDataPosition(j + i);
    return localArrayList;
  }
  
  public static ArrayList<String> zzC(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    ArrayList localArrayList = paramParcel.createStringArrayList();
    paramParcel.setDataPosition(paramInt + i);
    return localArrayList;
  }
  
  public static Parcel zzD(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    Parcel localParcel = Parcel.obtain();
    localParcel.appendFrom(paramParcel, i, paramInt);
    paramParcel.setDataPosition(paramInt + i);
    return localParcel;
  }
  
  public static Parcel[] zzE(Parcel paramParcel, int paramInt)
  {
    int i = zza(paramParcel, paramInt);
    int j = paramParcel.dataPosition();
    if (i == 0) {
      return null;
    }
    int k = paramParcel.readInt();
    Parcel[] arrayOfParcel = new Parcel[k];
    paramInt = 0;
    if (paramInt < k)
    {
      int m = paramParcel.readInt();
      if (m != 0)
      {
        int n = paramParcel.dataPosition();
        Parcel localParcel = Parcel.obtain();
        localParcel.appendFrom(paramParcel, n, m);
        arrayOfParcel[paramInt] = localParcel;
        paramParcel.setDataPosition(m + n);
      }
      for (;;)
      {
        paramInt += 1;
        break;
        arrayOfParcel[paramInt] = null;
      }
    }
    paramParcel.setDataPosition(j + i);
    return arrayOfParcel;
  }
  
  public static int zza(Parcel paramParcel, int paramInt)
  {
    if ((paramInt & 0xFFFF0000) != -65536) {
      return paramInt >> 16 & 0xFFFF;
    }
    return paramParcel.readInt();
  }
  
  public static <T extends Parcelable> T zza(Parcel paramParcel, int paramInt, Parcelable.Creator<T> paramCreator)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    paramCreator = (Parcelable)paramCreator.createFromParcel(paramParcel);
    paramParcel.setDataPosition(paramInt + i);
    return paramCreator;
  }
  
  private static void zza(Parcel paramParcel, int paramInt1, int paramInt2)
  {
    paramInt1 = zza(paramParcel, paramInt1);
    if (paramInt1 != paramInt2) {
      throw new zza("Expected size " + paramInt2 + " got " + paramInt1 + " (0x" + Integer.toHexString(paramInt1) + ")", paramParcel);
    }
  }
  
  public static int zzai(Parcel paramParcel)
  {
    return paramParcel.readInt();
  }
  
  public static int zzaj(Parcel paramParcel)
  {
    int j = zzai(paramParcel);
    int k = zza(paramParcel, j);
    int i = paramParcel.dataPosition();
    if (zzbH(j) != 20293) {
      throw new zza("Expected object header. Got 0x" + Integer.toHexString(j), paramParcel);
    }
    j = i + k;
    if ((j < i) || (j > paramParcel.dataSize())) {
      throw new zza("Size read is invalid start=" + i + " end=" + j, paramParcel);
    }
    return j;
  }
  
  public static void zzb(Parcel paramParcel, int paramInt)
  {
    paramParcel.setDataPosition(zza(paramParcel, paramInt) + paramParcel.dataPosition());
  }
  
  public static <T> T[] zzb(Parcel paramParcel, int paramInt, Parcelable.Creator<T> paramCreator)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    paramCreator = paramParcel.createTypedArray(paramCreator);
    paramParcel.setDataPosition(paramInt + i);
    return paramCreator;
  }
  
  public static int zzbH(int paramInt)
  {
    return 0xFFFF & paramInt;
  }
  
  public static <T> ArrayList<T> zzc(Parcel paramParcel, int paramInt, Parcelable.Creator<T> paramCreator)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    paramCreator = paramParcel.createTypedArrayList(paramCreator);
    paramParcel.setDataPosition(paramInt + i);
    return paramCreator;
  }
  
  public static boolean zzc(Parcel paramParcel, int paramInt)
  {
    zza(paramParcel, paramInt, 4);
    return paramParcel.readInt() != 0;
  }
  
  public static int zzg(Parcel paramParcel, int paramInt)
  {
    zza(paramParcel, paramInt, 4);
    return paramParcel.readInt();
  }
  
  public static long zzi(Parcel paramParcel, int paramInt)
  {
    zza(paramParcel, paramInt, 8);
    return paramParcel.readLong();
  }
  
  public static BigInteger zzk(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    byte[] arrayOfByte = paramParcel.createByteArray();
    paramParcel.setDataPosition(paramInt + i);
    return new BigInteger(arrayOfByte);
  }
  
  public static float zzl(Parcel paramParcel, int paramInt)
  {
    zza(paramParcel, paramInt, 4);
    return paramParcel.readFloat();
  }
  
  public static double zzm(Parcel paramParcel, int paramInt)
  {
    zza(paramParcel, paramInt, 8);
    return paramParcel.readDouble();
  }
  
  public static BigDecimal zzn(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    byte[] arrayOfByte = paramParcel.createByteArray();
    int j = paramParcel.readInt();
    paramParcel.setDataPosition(paramInt + i);
    return new BigDecimal(new BigInteger(arrayOfByte), j);
  }
  
  public static String zzo(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    String str = paramParcel.readString();
    paramParcel.setDataPosition(paramInt + i);
    return str;
  }
  
  public static IBinder zzp(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    IBinder localIBinder = paramParcel.readStrongBinder();
    paramParcel.setDataPosition(paramInt + i);
    return localIBinder;
  }
  
  public static Bundle zzq(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    Bundle localBundle = paramParcel.readBundle();
    paramParcel.setDataPosition(paramInt + i);
    return localBundle;
  }
  
  public static byte[] zzr(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    byte[] arrayOfByte = paramParcel.createByteArray();
    paramParcel.setDataPosition(paramInt + i);
    return arrayOfByte;
  }
  
  public static boolean[] zzt(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    boolean[] arrayOfBoolean = paramParcel.createBooleanArray();
    paramParcel.setDataPosition(paramInt + i);
    return arrayOfBoolean;
  }
  
  public static int[] zzu(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    int[] arrayOfInt = paramParcel.createIntArray();
    paramParcel.setDataPosition(paramInt + i);
    return arrayOfInt;
  }
  
  public static long[] zzv(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    long[] arrayOfLong = paramParcel.createLongArray();
    paramParcel.setDataPosition(paramInt + i);
    return arrayOfLong;
  }
  
  public static BigInteger[] zzw(Parcel paramParcel, int paramInt)
  {
    int i = zza(paramParcel, paramInt);
    int j = paramParcel.dataPosition();
    if (i == 0) {
      return null;
    }
    int k = paramParcel.readInt();
    BigInteger[] arrayOfBigInteger = new BigInteger[k];
    paramInt = 0;
    while (paramInt < k)
    {
      arrayOfBigInteger[paramInt] = new BigInteger(paramParcel.createByteArray());
      paramInt += 1;
    }
    paramParcel.setDataPosition(j + i);
    return arrayOfBigInteger;
  }
  
  public static float[] zzx(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    float[] arrayOfFloat = paramParcel.createFloatArray();
    paramParcel.setDataPosition(paramInt + i);
    return arrayOfFloat;
  }
  
  public static double[] zzy(Parcel paramParcel, int paramInt)
  {
    paramInt = zza(paramParcel, paramInt);
    int i = paramParcel.dataPosition();
    if (paramInt == 0) {
      return null;
    }
    double[] arrayOfDouble = paramParcel.createDoubleArray();
    paramParcel.setDataPosition(paramInt + i);
    return arrayOfDouble;
  }
  
  public static BigDecimal[] zzz(Parcel paramParcel, int paramInt)
  {
    int i = zza(paramParcel, paramInt);
    int j = paramParcel.dataPosition();
    if (i == 0) {
      return null;
    }
    int k = paramParcel.readInt();
    BigDecimal[] arrayOfBigDecimal = new BigDecimal[k];
    paramInt = 0;
    while (paramInt < k)
    {
      byte[] arrayOfByte = paramParcel.createByteArray();
      int m = paramParcel.readInt();
      arrayOfBigDecimal[paramInt] = new BigDecimal(new BigInteger(arrayOfByte), m);
      paramInt += 1;
    }
    paramParcel.setDataPosition(j + i);
    return arrayOfBigDecimal;
  }
  
  public static class zza
    extends RuntimeException
  {
    public zza(String paramString, Parcel paramParcel)
    {
      super();
    }
  }
}
