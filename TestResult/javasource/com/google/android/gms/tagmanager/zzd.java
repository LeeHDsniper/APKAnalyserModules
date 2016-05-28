package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.Uri;
import java.util.Map;

class zzd
  implements DataLayer.zzb
{
  private final Context context;
  
  public zzd(Context paramContext)
  {
    context = paramContext;
  }
  
  public void zzH(Map<String, Object> paramMap)
  {
    Object localObject = paramMap.get("gtm.url");
    if (localObject == null)
    {
      paramMap = paramMap.get("gtm");
      if ((paramMap == null) || (!(paramMap instanceof Map))) {}
    }
    for (paramMap = ((Map)paramMap).get("url");; paramMap = localObject)
    {
      if ((paramMap == null) || (!(paramMap instanceof String))) {}
      do
      {
        return;
        paramMap = Uri.parse((String)paramMap).getQueryParameter("referrer");
      } while (paramMap == null);
      zzax.zzl(context, paramMap);
      return;
    }
  }
}
