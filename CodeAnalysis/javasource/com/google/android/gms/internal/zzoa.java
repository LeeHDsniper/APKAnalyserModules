package com.google.android.gms.internal;

import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import android.util.LogPrinter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public final class zzoa
  implements zzoh
{
  private static final Uri zzaHN;
  private final LogPrinter zzaHO = new LogPrinter(4, "GA/LogCatTransport");
  
  static
  {
    Uri.Builder localBuilder = new Uri.Builder();
    localBuilder.scheme("uri");
    localBuilder.authority("local");
    zzaHN = localBuilder.build();
  }
  
  public zzoa() {}
  
  public void zzb(zzob paramZzob)
  {
    Object localObject = new ArrayList(paramZzob.zzxi());
    Collections.sort((List)localObject, new Comparator()
    {
      public int zza(zzod paramAnonymousZzod1, zzod paramAnonymousZzod2)
      {
        return paramAnonymousZzod1.getClass().getCanonicalName().compareTo(paramAnonymousZzod2.getClass().getCanonicalName());
      }
    });
    paramZzob = new StringBuilder();
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      String str = ((zzod)((Iterator)localObject).next()).toString();
      if (!TextUtils.isEmpty(str))
      {
        if (paramZzob.length() != 0) {
          paramZzob.append(", ");
        }
        paramZzob.append(str);
      }
    }
    zzaHO.println(paramZzob.toString());
  }
  
  public Uri zzhs()
  {
    return zzaHN;
  }
}
