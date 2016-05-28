package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.TreeSet;

public final class PasswordSpecification
  implements SafeParcelable
{
  public static final zze CREATOR = new zze();
  public static final PasswordSpecification zzRo = new zza().zzh(12, 16).zzbD("abcdefghijkmnopqrstxyzABCDEFGHJKLMNPQRSTXY3456789").zzf("abcdefghijkmnopqrstxyz", 1).zzf("ABCDEFGHJKLMNPQRSTXY", 1).zzf("3456789", 1).zzlx();
  public static final PasswordSpecification zzRp = new zza().zzh(12, 16).zzbD("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890").zzf("abcdefghijklmnopqrstuvwxyz", 1).zzf("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 1).zzf("1234567890", 1).zzlx();
  final int mVersionCode;
  final String zzRq;
  final List<String> zzRr;
  final List<Integer> zzRs;
  final int zzRt;
  final int zzRu;
  private final int[] zzRv;
  private final Random zzsT;
  
  PasswordSpecification(int paramInt1, String paramString, List<String> paramList, List<Integer> paramList1, int paramInt2, int paramInt3)
  {
    mVersionCode = paramInt1;
    zzRq = paramString;
    zzRr = Collections.unmodifiableList(paramList);
    zzRs = Collections.unmodifiableList(paramList1);
    zzRt = paramInt2;
    zzRu = paramInt3;
    zzRv = zzlw();
    zzsT = new SecureRandom();
  }
  
  private int zza(char paramChar)
  {
    return paramChar - ' ';
  }
  
  private static String zzb(Collection<Character> paramCollection)
  {
    char[] arrayOfChar = new char[paramCollection.size()];
    paramCollection = paramCollection.iterator();
    int i = 0;
    while (paramCollection.hasNext())
    {
      arrayOfChar[i] = ((Character)paramCollection.next()).charValue();
      i += 1;
    }
    return new String(arrayOfChar);
  }
  
  private static boolean zzb(int paramInt1, int paramInt2, int paramInt3)
  {
    return (paramInt1 < paramInt2) || (paramInt1 > paramInt3);
  }
  
  private int[] zzlw()
  {
    int[] arrayOfInt = new int[95];
    Arrays.fill(arrayOfInt, -1);
    Iterator localIterator = zzRr.iterator();
    int i = 0;
    while (localIterator.hasNext())
    {
      char[] arrayOfChar = ((String)localIterator.next()).toCharArray();
      int k = arrayOfChar.length;
      int j = 0;
      while (j < k)
      {
        arrayOfInt[zza(arrayOfChar[j])] = i;
        j += 1;
      }
      i += 1;
    }
    return arrayOfInt;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }
  
  public static class zza
  {
    private final List<String> zzRr = new ArrayList();
    private final List<Integer> zzRs = new ArrayList();
    private int zzRt = 12;
    private int zzRu = 16;
    private final TreeSet<Character> zzRw = new TreeSet();
    
    public zza() {}
    
    private void zzly()
    {
      Iterator localIterator = zzRs.iterator();
      for (int i = 0; localIterator.hasNext(); i = ((Integer)localIterator.next()).intValue() + i) {}
      if (i > zzRu) {
        throw new PasswordSpecification.zzb("required character count cannot be greater than the max password size");
      }
    }
    
    private void zzlz()
    {
      boolean[] arrayOfBoolean = new boolean[95];
      Iterator localIterator = zzRr.iterator();
      while (localIterator.hasNext())
      {
        char[] arrayOfChar = ((String)localIterator.next()).toCharArray();
        int j = arrayOfChar.length;
        int i = 0;
        while (i < j)
        {
          char c = arrayOfChar[i];
          if (arrayOfBoolean[(c - ' ')] != 0) {
            throw new PasswordSpecification.zzb("character " + c + " occurs in more than one required character set");
          }
          arrayOfBoolean[(c - ' ')] = true;
          i += 1;
        }
      }
    }
    
    private TreeSet<Character> zzr(String paramString1, String paramString2)
    {
      if (TextUtils.isEmpty(paramString1)) {
        throw new PasswordSpecification.zzb(paramString2 + " cannot be null or empty");
      }
      TreeSet localTreeSet = new TreeSet();
      paramString1 = paramString1.toCharArray();
      int j = paramString1.length;
      int i = 0;
      while (i < j)
      {
        char c = paramString1[i];
        if (PasswordSpecification.zzc(c, 32, 126)) {
          throw new PasswordSpecification.zzb(paramString2 + " must only contain ASCII printable characters");
        }
        localTreeSet.add(Character.valueOf(c));
        i += 1;
      }
      return localTreeSet;
    }
    
    public zza zzbD(String paramString)
    {
      zzRw.addAll(zzr(paramString, "allowedChars"));
      return this;
    }
    
    public zza zzf(String paramString, int paramInt)
    {
      if (paramInt < 1) {
        throw new PasswordSpecification.zzb("count must be at least 1");
      }
      paramString = zzr(paramString, "requiredChars");
      zzRr.add(PasswordSpecification.zzc(paramString));
      zzRs.add(Integer.valueOf(paramInt));
      return this;
    }
    
    public zza zzh(int paramInt1, int paramInt2)
    {
      if (paramInt1 < 1) {
        throw new PasswordSpecification.zzb("minimumSize must be at least 1");
      }
      if (paramInt1 > paramInt2) {
        throw new PasswordSpecification.zzb("maximumSize must be greater than or equal to minimumSize");
      }
      zzRt = paramInt1;
      zzRu = paramInt2;
      return this;
    }
    
    public PasswordSpecification zzlx()
    {
      if (zzRw.isEmpty()) {
        throw new PasswordSpecification.zzb("no allowed characters specified");
      }
      zzly();
      zzlz();
      return new PasswordSpecification(1, PasswordSpecification.zzc(zzRw), zzRr, zzRs, zzRt, zzRu);
    }
  }
  
  public static class zzb
    extends Error
  {
    public zzb(String paramString)
    {
      super();
    }
  }
}
