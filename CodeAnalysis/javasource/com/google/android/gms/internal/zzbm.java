package com.google.android.gms.internal;

import android.util.Base64OutputStream;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Locale;
import java.util.PriorityQueue;

public class zzbm
{
  private final int zzse;
  private final int zzsf;
  private final int zzsg;
  private final zzbl zzsh = new zzbo();
  
  public zzbm(int paramInt)
  {
    zzsf = paramInt;
    zzse = 6;
    zzsg = 0;
  }
  
  private String zzA(String paramString)
  {
    String[] arrayOfString = paramString.split("\n");
    if (arrayOfString.length == 0) {
      return "";
    }
    paramString = zzcz();
    Arrays.sort(arrayOfString, new Comparator()
    {
      public int compare(String paramAnonymousString1, String paramAnonymousString2)
      {
        return paramAnonymousString2.length() - paramAnonymousString1.length();
      }
    });
    int i = 0;
    if ((i < arrayOfString.length) && (i < zzsf))
    {
      if (arrayOfString[i].trim().length() == 0) {}
      for (;;)
      {
        i += 1;
        break;
        try
        {
          paramString.write(zzsh.zzz(arrayOfString[i]));
        }
        catch (IOException localIOException)
        {
          zzb.zzb("Error while writing hash to byteStream", localIOException);
        }
      }
    }
    return paramString.toString();
  }
  
  String zzB(String paramString)
  {
    Object localObject1 = paramString.split("\n");
    if (localObject1.length == 0) {
      return "";
    }
    paramString = zzcz();
    Object localObject2 = new PriorityQueue(zzsf, new Comparator()
    {
      public int zza(zzbp.zza paramAnonymousZza1, zzbp.zza paramAnonymousZza2)
      {
        return (int)(value - value);
      }
    });
    int i = 0;
    if (i < localObject1.length)
    {
      String[] arrayOfString = zzbn.zzD(localObject1[i]);
      if (arrayOfString.length < zzse) {}
      for (;;)
      {
        i += 1;
        break;
        zzbp.zza(arrayOfString, zzsf, zzse, (PriorityQueue)localObject2);
      }
    }
    localObject1 = ((PriorityQueue)localObject2).iterator();
    for (;;)
    {
      if (((Iterator)localObject1).hasNext())
      {
        localObject2 = (zzbp.zza)((Iterator)localObject1).next();
        try
        {
          paramString.write(zzsh.zzz(zzsm));
        }
        catch (IOException localIOException)
        {
          zzb.zzb("Error while writing hash to byteStream", localIOException);
        }
      }
    }
    return paramString.toString();
  }
  
  public String zza(ArrayList<String> paramArrayList)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      localStringBuffer.append(((String)paramArrayList.next()).toLowerCase(Locale.US));
      localStringBuffer.append('\n');
    }
    switch (zzsg)
    {
    default: 
      return "";
    case 0: 
      return zzB(localStringBuffer.toString());
    }
    return zzA(localStringBuffer.toString());
  }
  
  zza zzcz()
  {
    return new zza();
  }
  
  static class zza
  {
    ByteArrayOutputStream zzsj = new ByteArrayOutputStream(4096);
    Base64OutputStream zzsk = new Base64OutputStream(zzsj, 10);
    
    public zza() {}
    
    public String toString()
    {
      try
      {
        zzsk.close();
      }
      catch (IOException localIOException1)
      {
        for (;;)
        {
          try
          {
            zzsj.close();
            String str = zzsj.toString();
            return str;
          }
          catch (IOException localIOException2)
          {
            zzb.zzb("HashManager: Unable to convert to Base64.", localIOException2);
            return "";
          }
          finally
          {
            zzsj = null;
            zzsk = null;
          }
          localIOException1 = localIOException1;
          zzb.zzb("HashManager: Unable to convert to Base64.", localIOException1);
        }
      }
    }
    
    public void write(byte[] paramArrayOfByte)
      throws IOException
    {
      zzsk.write(paramArrayOfByte);
    }
  }
}
