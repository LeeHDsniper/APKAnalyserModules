package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.net.Uri.Builder;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzj
  extends zzdd
{
  private static final String ID = zzad.zzco.toString();
  private static final String URL = zzae.zzhx.toString();
  private static final String zzaOL = zzae.zzdn.toString();
  private static final String zzaOM = zzae.zzhw.toString();
  static final String zzaON = "gtm_" + ID + "_unrepeatable";
  private static final Set<String> zzaOO = new HashSet();
  private final Context mContext;
  private final zza zzaOP;
  
  public zzj(Context paramContext)
  {
    this(paramContext, new zza()
    {
      public zzar zzzy()
      {
        return zzz.zzaM(zzj.this);
      }
    });
  }
  
  zzj(Context paramContext, zza paramZza)
  {
    super(ID, new String[] { URL });
    zzaOP = paramZza;
    mContext = paramContext;
  }
  
  private boolean zzeq(String paramString)
  {
    boolean bool1 = true;
    for (;;)
    {
      try
      {
        boolean bool2 = zzes(paramString);
        if (bool2) {
          return bool1;
        }
        if (zzer(paramString)) {
          zzaOO.add(paramString);
        } else {
          bool1 = false;
        }
      }
      finally {}
    }
  }
  
  public void zzI(Map<String, zzag.zza> paramMap)
  {
    String str;
    if (paramMap.get(zzaOM) != null)
    {
      str = zzdf.zzg((zzag.zza)paramMap.get(zzaOM));
      if ((str == null) || (!zzeq(str))) {
        break label46;
      }
    }
    label46:
    do
    {
      return;
      str = null;
      break;
      Uri.Builder localBuilder = Uri.parse(zzdf.zzg((zzag.zza)paramMap.get(URL))).buildUpon();
      paramMap = (zzag.zza)paramMap.get(zzaOL);
      if (paramMap != null)
      {
        paramMap = zzdf.zzl(paramMap);
        if (!(paramMap instanceof List))
        {
          zzbg.e("ArbitraryPixel: additional params not a list: not sending partial hit: " + localBuilder.build().toString());
          return;
        }
        paramMap = ((List)paramMap).iterator();
        while (paramMap.hasNext())
        {
          Object localObject = paramMap.next();
          if (!(localObject instanceof Map))
          {
            zzbg.e("ArbitraryPixel: additional params contains non-map: not sending partial hit: " + localBuilder.build().toString());
            return;
          }
          localObject = ((Map)localObject).entrySet().iterator();
          while (((Iterator)localObject).hasNext())
          {
            Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
            localBuilder.appendQueryParameter(localEntry.getKey().toString(), localEntry.getValue().toString());
          }
        }
      }
      paramMap = localBuilder.build().toString();
      zzaOP.zzzy().zzeH(paramMap);
      zzbg.v("ArbitraryPixel: url = " + paramMap);
    } while (str == null);
    try
    {
      zzaOO.add(str);
      zzcv.zzb(mContext, zzaON, str, "true");
      return;
    }
    finally {}
  }
  
  boolean zzer(String paramString)
  {
    return mContext.getSharedPreferences(zzaON, 0).contains(paramString);
  }
  
  boolean zzes(String paramString)
  {
    return zzaOO.contains(paramString);
  }
  
  public static abstract interface zza
  {
    public abstract zzar zzzy();
  }
}
