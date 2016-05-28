package com.facebook.ads.internal.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;

public class c
{
  private static final List<b> a = new ArrayList();
  
  public static String a()
  {
    synchronized (a)
    {
      if (a.isEmpty()) {
        return "";
      }
      Object localObject2 = new ArrayList(a);
      a.clear();
      ??? = new JSONArray();
      localObject2 = ((List)localObject2).iterator();
      if (((Iterator)localObject2).hasNext()) {
        ((JSONArray)???).put(((b)((Iterator)localObject2).next()).a());
      }
    }
    return ((JSONArray)???).toString();
  }
  
  public static void a(b paramB)
  {
    synchronized (a)
    {
      a.add(paramB);
      return;
    }
  }
}
