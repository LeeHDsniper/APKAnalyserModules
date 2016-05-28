package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.ArrayList;
import java.util.Iterator;

@zzgk
public class zzbh
{
  private final Object zzpc = new Object();
  private final int zzrC;
  private final int zzrD;
  private final int zzrE;
  private final zzbm zzrF;
  private ArrayList<String> zzrG = new ArrayList();
  private int zzrH = 0;
  private int zzrI = 0;
  private int zzrJ = 0;
  private int zzrK;
  private String zzrL = "";
  
  public zzbh(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    zzrC = paramInt1;
    zzrD = paramInt2;
    zzrE = paramInt3;
    zzrF = new zzbm(paramInt4);
  }
  
  private String zza(ArrayList<String> paramArrayList, int paramInt)
  {
    if (paramArrayList.isEmpty()) {
      paramArrayList = "";
    }
    Object localObject;
    do
    {
      return paramArrayList;
      localObject = new StringBuffer();
      paramArrayList = paramArrayList.iterator();
      do
      {
        if (!paramArrayList.hasNext()) {
          break;
        }
        ((StringBuffer)localObject).append((String)paramArrayList.next());
        ((StringBuffer)localObject).append(' ');
      } while (((StringBuffer)localObject).length() <= paramInt);
      ((StringBuffer)localObject).deleteCharAt(((StringBuffer)localObject).length() - 1);
      localObject = ((StringBuffer)localObject).toString();
      paramArrayList = (ArrayList<String>)localObject;
    } while (((String)localObject).length() < paramInt);
    return ((String)localObject).substring(0, paramInt);
  }
  
  private void zzx(String paramString)
  {
    if ((paramString == null) || (paramString.length() < zzrE)) {
      return;
    }
    synchronized (zzpc)
    {
      zzrG.add(paramString);
      zzrH += paramString.length();
      return;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzbh)) {}
    do
    {
      return false;
      if (paramObject == this) {
        return true;
      }
      paramObject = (zzbh)paramObject;
    } while ((paramObject.zzcm() == null) || (!paramObject.zzcm().equals(zzcm())));
    return true;
  }
  
  public int getScore()
  {
    return zzrK;
  }
  
  public int hashCode()
  {
    return zzcm().hashCode();
  }
  
  public String toString()
  {
    return "ActivityContent fetchId: " + zzrI + " score:" + zzrK + " total_length:" + zzrH + "\n text: " + zza(zzrG, 200) + "\n signture: " + zzrL;
  }
  
  int zza(int paramInt1, int paramInt2)
  {
    return zzrC * paramInt1 + zzrD * paramInt2;
  }
  
  public boolean zzcl()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzrJ == 0)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public String zzcm()
  {
    return zzrL;
  }
  
  public void zzcn()
  {
    synchronized (zzpc)
    {
      zzrK -= 100;
      return;
    }
  }
  
  public void zzco()
  {
    synchronized (zzpc)
    {
      zzrJ -= 1;
      return;
    }
  }
  
  public void zzcp()
  {
    synchronized (zzpc)
    {
      zzrJ += 1;
      return;
    }
  }
  
  public void zzcq()
  {
    synchronized (zzpc)
    {
      int i = zza(zzrH, zzrI);
      if (i > zzrK)
      {
        zzrK = i;
        zzrL = zzrF.zza(zzrG);
      }
      return;
    }
  }
  
  int zzcr()
  {
    return zzrH;
  }
  
  public void zzg(int paramInt)
  {
    zzrI = paramInt;
  }
  
  public void zzv(String arg1)
  {
    zzx(???);
    synchronized (zzpc)
    {
      if (zzrJ < 0) {
        zzb.zzaC("ActivityContent: negative number of WebViews.");
      }
      zzcq();
      return;
    }
  }
  
  public void zzw(String paramString)
  {
    zzx(paramString);
  }
}
