package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.zzp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

@zzgk
public class zzhk
{
  private boolean zzFm = false;
  private final LinkedList<zza> zzGN;
  private final String zzGO;
  private final String zzGP;
  private long zzGQ = -1L;
  private long zzGR = -1L;
  private long zzGS = -1L;
  private long zzGT = 0L;
  private long zzGU = -1L;
  private long zzGV = -1L;
  private final zzhl zzpN;
  private final Object zzpc = new Object();
  
  public zzhk(zzhl paramZzhl, String paramString1, String paramString2)
  {
    zzpN = paramZzhl;
    zzGO = paramString1;
    zzGP = paramString2;
    zzGN = new LinkedList();
  }
  
  public zzhk(String paramString1, String paramString2)
  {
    this(zzp.zzbA(), paramString1, paramString2);
  }
  
  public Bundle toBundle()
  {
    ArrayList localArrayList;
    synchronized (zzpc)
    {
      Bundle localBundle1 = new Bundle();
      localBundle1.putString("seq_num", zzGO);
      localBundle1.putString("slotid", zzGP);
      localBundle1.putBoolean("ismediation", zzFm);
      localBundle1.putLong("treq", zzGU);
      localBundle1.putLong("tresponse", zzGV);
      localBundle1.putLong("timp", zzGR);
      localBundle1.putLong("tload", zzGS);
      localBundle1.putLong("pcc", zzGT);
      localBundle1.putLong("tfetch", zzGQ);
      localArrayList = new ArrayList();
      Iterator localIterator = zzGN.iterator();
      if (localIterator.hasNext()) {
        localArrayList.add(((zza)localIterator.next()).toBundle());
      }
    }
    localBundle2.putParcelableArrayList("tclick", localArrayList);
    return localBundle2;
  }
  
  public void zzfT()
  {
    synchronized (zzpc)
    {
      if ((zzGV != -1L) && (zzGR == -1L))
      {
        zzGR = SystemClock.elapsedRealtime();
        zzpN.zza(this);
      }
      zzpN.zzgb().zzfT();
      return;
    }
  }
  
  public void zzfU()
  {
    synchronized (zzpc)
    {
      if (zzGV != -1L)
      {
        zza localZza = new zza();
        localZza.zzfY();
        zzGN.add(localZza);
        zzGT += 1L;
        zzpN.zzgb().zzfU();
        zzpN.zza(this);
      }
      return;
    }
  }
  
  public void zzfV()
  {
    synchronized (zzpc)
    {
      if ((zzGV != -1L) && (!zzGN.isEmpty()))
      {
        zza localZza = (zza)zzGN.getLast();
        if (localZza.zzfW() == -1L)
        {
          localZza.zzfX();
          zzpN.zza(this);
        }
      }
      return;
    }
  }
  
  public void zzh(AdRequestParcel paramAdRequestParcel)
  {
    synchronized (zzpc)
    {
      zzGU = SystemClock.elapsedRealtime();
      zzpN.zzgb().zzb(paramAdRequestParcel, zzGU);
      return;
    }
  }
  
  public void zzl(long paramLong)
  {
    synchronized (zzpc)
    {
      zzGV = paramLong;
      if (zzGV != -1L) {
        zzpN.zza(this);
      }
      return;
    }
  }
  
  public void zzm(long paramLong)
  {
    synchronized (zzpc)
    {
      if (zzGV != -1L)
      {
        zzGQ = paramLong;
        zzpN.zza(this);
      }
      return;
    }
  }
  
  public void zzy(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      if (zzGV != -1L)
      {
        zzGS = SystemClock.elapsedRealtime();
        if (!paramBoolean)
        {
          zzGR = zzGS;
          zzpN.zza(this);
        }
      }
      return;
    }
  }
  
  public void zzz(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      if (zzGV != -1L)
      {
        zzFm = paramBoolean;
        zzpN.zza(this);
      }
      return;
    }
  }
  
  @zzgk
  private static final class zza
  {
    private long zzGW = -1L;
    private long zzGX = -1L;
    
    public zza() {}
    
    public Bundle toBundle()
    {
      Bundle localBundle = new Bundle();
      localBundle.putLong("topen", zzGW);
      localBundle.putLong("tclose", zzGX);
      return localBundle;
    }
    
    public long zzfW()
    {
      return zzGX;
    }
    
    public void zzfX()
    {
      zzGX = SystemClock.elapsedRealtime();
    }
    
    public void zzfY()
    {
      zzGW = SystemClock.elapsedRealtime();
    }
  }
}
