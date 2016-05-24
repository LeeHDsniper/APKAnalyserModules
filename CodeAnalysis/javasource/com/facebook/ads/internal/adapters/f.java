package com.facebook.ads.internal.adapters;

import com.facebook.ads.internal.server.AdPlacementType;
import com.facebook.ads.internal.util.t;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class f
{
  private static final Set<h> a = new HashSet();
  private static final Map<AdPlacementType, String> b = new ConcurrentHashMap();
  
  static
  {
    h[] arrayOfH = h.values();
    int j = arrayOfH.length;
    int i = 0;
    for (;;)
    {
      h localH;
      Object localObject;
      label82:
      Class localClass3;
      Class localClass1;
      if (i < j)
      {
        localH = arrayOfH[i];
        switch (1.a[g.ordinal()])
        {
        default: 
          localObject = null;
          if (localObject != null)
          {
            localClass3 = d;
            localClass1 = localClass3;
            if (localClass3 != null) {
              break;
            }
          }
          break;
        }
      }
      try
      {
        localClass1 = Class.forName(e);
        if ((localClass1 != null) && (((Class)localObject).isAssignableFrom(localClass1))) {
          a.add(localH);
        }
        i += 1;
        continue;
        localObject = BannerAdapter.class;
        break label82;
        localObject = InterstitialAdapter.class;
        break label82;
        localObject = p.class;
        break label82;
        return;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        for (;;)
        {
          Class localClass2 = localClass3;
        }
      }
    }
  }
  
  public static AdAdapter a(g paramG, AdPlacementType paramAdPlacementType)
  {
    try
    {
      h localH = b(paramG, paramAdPlacementType);
      if ((localH != null) && (a.contains(localH)))
      {
        paramAdPlacementType = d;
        paramG = paramAdPlacementType;
        if (paramAdPlacementType == null) {
          paramG = Class.forName(e);
        }
        paramG = (AdAdapter)paramG.newInstance();
        return paramG;
      }
    }
    catch (Exception paramG)
    {
      paramG.printStackTrace();
    }
    return null;
  }
  
  public static AdAdapter a(String paramString, AdPlacementType paramAdPlacementType)
  {
    return a(g.a(paramString), paramAdPlacementType);
  }
  
  public static String a(AdPlacementType paramAdPlacementType)
  {
    if (b.containsKey(paramAdPlacementType)) {
      return (String)b.get(paramAdPlacementType);
    }
    Object localObject = new HashSet();
    Iterator localIterator = a.iterator();
    while (localIterator.hasNext())
    {
      h localH = (h)localIterator.next();
      if (g == paramAdPlacementType) {
        ((Set)localObject).add(f.toString());
      }
    }
    localObject = t.a((Set)localObject, ",");
    b.put(paramAdPlacementType, localObject);
    return localObject;
  }
  
  private static h b(g paramG, AdPlacementType paramAdPlacementType)
  {
    Iterator localIterator = a.iterator();
    while (localIterator.hasNext())
    {
      h localH = (h)localIterator.next();
      if ((f == paramG) && (g == paramAdPlacementType)) {
        return localH;
      }
    }
    return null;
  }
}
