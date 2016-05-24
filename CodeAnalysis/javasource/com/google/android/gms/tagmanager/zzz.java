package com.google.android.gms.tagmanager;

import android.content.Context;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

class zzz
  implements zzar
{
  private static final Object zzaOF = new Object();
  private static zzz zzaPU;
  private String zzaPV;
  private String zzaPW;
  private zzas zzaPX;
  private zzcd zzaPi;
  
  private zzz(Context paramContext)
  {
    this(zzat.zzaO(paramContext), new zzcs());
  }
  
  zzz(zzas paramZzas, zzcd paramZzcd)
  {
    zzaPX = paramZzas;
    zzaPi = paramZzcd;
  }
  
  public static zzar zzaM(Context paramContext)
  {
    synchronized (zzaOF)
    {
      if (zzaPU == null) {
        zzaPU = new zzz(paramContext);
      }
      paramContext = zzaPU;
      return paramContext;
    }
  }
  
  public boolean zzeH(String paramString)
  {
    if (!zzaPi.zzkp())
    {
      zzbg.zzaE("Too many urls sent too quickly with the TagManagerSender, rate limiting invoked.");
      return false;
    }
    String str = paramString;
    if (zzaPV != null)
    {
      str = paramString;
      if (zzaPW == null) {}
    }
    try
    {
      str = zzaPV + "?" + zzaPW + "=" + URLEncoder.encode(paramString, "UTF-8");
      zzbg.v("Sending wrapped url hit: " + str);
      zzaPX.zzeL(str);
      return true;
    }
    catch (UnsupportedEncodingException paramString)
    {
      zzbg.zzd("Error wrapping URL for testing.", paramString);
    }
    return false;
  }
}
