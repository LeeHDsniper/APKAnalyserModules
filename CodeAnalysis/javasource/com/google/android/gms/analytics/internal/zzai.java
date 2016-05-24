package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import android.util.Pair;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;
import java.util.UUID;

public class zzai
  extends zzd
{
  private SharedPreferences zzOw;
  private long zzOx;
  private long zzOy = -1L;
  private final zza zzOz = new zza("monitoring", zzif().zzjQ(), null);
  
  protected zzai(zzf paramZzf)
  {
    super(paramZzf);
  }
  
  public void zzbk(String paramString)
  {
    zzic();
    zzio();
    SharedPreferences.Editor localEditor = zzOw.edit();
    if (TextUtils.isEmpty(paramString)) {
      localEditor.remove("installation_campaign");
    }
    for (;;)
    {
      if (!localEditor.commit()) {
        zzbb("Failed to commit campaign data");
      }
      return;
      localEditor.putString("installation_campaign", paramString);
    }
  }
  
  protected void zzhB()
  {
    zzOw = getContext().getSharedPreferences("com.google.android.gms.analytics.prefs", 0);
  }
  
  public long zzkA()
  {
    zzic();
    zzio();
    if (zzOy == -1L) {
      zzOy = zzOw.getLong("last_dispatch", 0L);
    }
    return zzOy;
  }
  
  public void zzkB()
  {
    zzic();
    zzio();
    long l = zzid().currentTimeMillis();
    SharedPreferences.Editor localEditor = zzOw.edit();
    localEditor.putLong("last_dispatch", l);
    localEditor.apply();
    zzOy = l;
  }
  
  public String zzkC()
  {
    zzic();
    zzio();
    String str = zzOw.getString("installation_campaign", null);
    if (TextUtils.isEmpty(str)) {
      return null;
    }
    return str;
  }
  
  public zza zzkD()
  {
    return zzOz;
  }
  
  public long zzky()
  {
    zzic();
    zzio();
    long l;
    if (zzOx == 0L)
    {
      l = zzOw.getLong("first_run", 0L);
      if (l == 0L) {
        break label46;
      }
    }
    for (zzOx = l;; zzOx = l)
    {
      return zzOx;
      label46:
      l = zzid().currentTimeMillis();
      SharedPreferences.Editor localEditor = zzOw.edit();
      localEditor.putLong("first_run", l);
      if (!localEditor.commit()) {
        zzbb("Failed to commit first run time");
      }
    }
  }
  
  public zzaj zzkz()
  {
    return new zzaj(zzid(), zzky());
  }
  
  public final class zza
  {
    private final String mName;
    private final long zzOA;
    
    private zza(String paramString, long paramLong)
    {
      zzx.zzcs(paramString);
      if (paramLong > 0L) {}
      for (boolean bool = true;; bool = false)
      {
        zzx.zzZ(bool);
        mName = paramString;
        zzOA = paramLong;
        return;
      }
    }
    
    private void zzkE()
    {
      long l = zzid().currentTimeMillis();
      SharedPreferences.Editor localEditor = zzai.zza(zzai.this).edit();
      localEditor.remove(zzkJ());
      localEditor.remove(zzkK());
      localEditor.putLong(zzkI(), l);
      localEditor.commit();
    }
    
    private long zzkF()
    {
      long l = zzkH();
      if (l == 0L) {
        return 0L;
      }
      return Math.abs(l - zzid().currentTimeMillis());
    }
    
    private long zzkH()
    {
      return zzai.zza(zzai.this).getLong(zzkI(), 0L);
    }
    
    private String zzkI()
    {
      return mName + ":start";
    }
    
    private String zzkJ()
    {
      return mName + ":count";
    }
    
    public void zzbl(String paramString)
    {
      if (zzkH() == 0L) {
        zzkE();
      }
      String str = paramString;
      if (paramString == null) {
        str = "";
      }
      for (;;)
      {
        try
        {
          long l = zzai.zza(zzai.this).getLong(zzkJ(), 0L);
          if (l <= 0L)
          {
            paramString = zzai.zza(zzai.this).edit();
            paramString.putString(zzkK(), str);
            paramString.putLong(zzkJ(), 1L);
            paramString.apply();
            return;
          }
          if ((UUID.randomUUID().getLeastSignificantBits() & 0x7FFFFFFFFFFFFFFF) < Long.MAX_VALUE / (l + 1L))
          {
            i = 1;
            paramString = zzai.zza(zzai.this).edit();
            if (i != 0) {
              paramString.putString(zzkK(), str);
            }
            paramString.putLong(zzkJ(), l + 1L);
            paramString.apply();
            return;
          }
        }
        finally {}
        int i = 0;
      }
    }
    
    public Pair<String, Long> zzkG()
    {
      long l = zzkF();
      if (l < zzOA) {}
      String str;
      do
      {
        return null;
        if (l > zzOA * 2L)
        {
          zzkE();
          return null;
        }
        str = zzai.zza(zzai.this).getString(zzkK(), null);
        l = zzai.zza(zzai.this).getLong(zzkJ(), 0L);
        zzkE();
      } while ((str == null) || (l <= 0L));
      return new Pair(str, Long.valueOf(l));
    }
    
    protected String zzkK()
    {
      return mName + ":value";
    }
  }
}
