package com.google.android.gms.tagmanager;

import android.net.Uri;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

class zzcb
{
  private static zzcb zzaQY;
  private volatile String zzaOS;
  private volatile zza zzaQZ;
  private volatile String zzaRa;
  private volatile String zzaRb;
  
  zzcb()
  {
    clear();
  }
  
  static zzcb zzAv()
  {
    try
    {
      if (zzaQY == null) {
        zzaQY = new zzcb();
      }
      zzcb localZzcb = zzaQY;
      return localZzcb;
    }
    finally {}
  }
  
  private String zzeP(String paramString)
  {
    return paramString.split("&")[0].split("=")[1];
  }
  
  private String zzn(Uri paramUri)
  {
    return paramUri.getQuery().replace("&gtm_debug=x", "");
  }
  
  void clear()
  {
    zzaQZ = zza.zzaRc;
    zzaRa = null;
    zzaOS = null;
    zzaRb = null;
  }
  
  String getContainerId()
  {
    return zzaOS;
  }
  
  zza zzAw()
  {
    return zzaQZ;
  }
  
  String zzAx()
  {
    return zzaRa;
  }
  
  boolean zzm(Uri paramUri)
  {
    boolean bool = true;
    String str;
    try
    {
      str = URLDecoder.decode(paramUri.toString(), "UTF-8");
      if (!str.matches("^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_auth=\\S+&gtm_preview=\\d+(&gtm_debug=x)?$")) {
        break label153;
      }
      zzbg.v("Container preview url: " + str);
      if (!str.matches(".*?&gtm_debug=x$")) {
        break label138;
      }
      zzaQZ = zza.zzaRe;
    }
    catch (UnsupportedEncodingException paramUri)
    {
      for (;;)
      {
        bool = false;
        continue;
        zzaQZ = zza.zzaRd;
      }
    }
    finally {}
    zzaRb = zzn(paramUri);
    if ((zzaQZ == zza.zzaRd) || (zzaQZ == zza.zzaRe)) {
      zzaRa = ("/r?" + zzaRb);
    }
    zzaOS = zzeP(zzaRb);
    for (;;)
    {
      return bool;
      label138:
      label153:
      if (str.matches("^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_preview=$"))
      {
        if (zzeP(paramUri.getQuery()).equals(zzaOS))
        {
          zzbg.v("Exit preview mode for container: " + zzaOS);
          zzaQZ = zza.zzaRc;
          zzaRa = null;
        }
      }
      else
      {
        zzbg.zzaE("Invalid preview uri: " + str);
        bool = false;
        continue;
      }
      bool = false;
    }
  }
  
  static enum zza
  {
    private zza() {}
  }
}
