package com.tencent.mqq.shared_file_accessor;

import android.os.Handler;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

abstract class a
  implements h
{
  protected volatile boolean a = false;
  protected boolean b = true;
  protected String c = null;
  private Handler d = null;
  private List e = new ArrayList();
  private volatile boolean f = false;
  private Map g = new HashMap();
  private Map h = null;
  private volatile boolean i = false;
  private int j = 300;
  
  public a() {}
  
  private void c()
  {
    if (d.hasMessages(0)) {
      if (e.size() <= 1000) {}
    }
    while (d.sendEmptyMessageDelayed(0, j))
    {
      return;
      d.removeMessages(0);
    }
    d = new c(this, SharedPreferencesProxyManager.getInstance().b());
    d.sendEmptyMessageDelayed(0, j);
  }
  
  public final Object a(String paramString, e paramE, Object paramObject)
  {
    for (;;)
    {
      try
      {
        Object localObject2;
        if (!b)
        {
          localObject2 = b(paramString, paramE, paramObject);
          return localObject2;
        }
        Object localObject1 = (i)g.get(paramString);
        if (localObject1 != null) {
          localObject2 = paramObject;
        }
        switch (a)
        {
        case 2: 
        case 0: 
          localObject2 = b(paramString, paramE, paramObject);
          continue;
          if (f)
          {
            localObject1 = d.a;
          }
          else
          {
            if (a)
            {
              localObject2 = (i)h.get(paramString);
              localObject1 = localObject2;
              if (localObject2 != null) {
                continue;
              }
              if (i)
              {
                localObject1 = d.a;
                continue;
              }
            }
            localObject1 = d.b;
          }
          break;
        case 1: 
          if (b.getClass().getName().equals(b))
          {
            localObject2 = b;
          }
          else
          {
            localObject2 = paramObject;
            if (a == 0) {
              localObject2 = Boolean.valueOf(true);
            }
          }
          break;
        default: 
          localObject2 = paramObject;
        }
      }
      finally {}
    }
  }
  
  public final void a()
  {
    try
    {
      a(e);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(String paramString)
  {
    try
    {
      if (b)
      {
        e.add(new b(1, paramString, null, d.c));
        g.put(paramString, d.a);
      }
      c();
      return;
    }
    finally {}
  }
  
  public final void a(String paramString, Object paramObject, e paramE)
  {
    if (paramObject == null) {}
    for (;;)
    {
      try
      {
        a(paramString);
        return;
      }
      finally {}
      if (b)
      {
        e.add(new b(0, paramString, paramObject, paramE));
        g.put(paramString, new i(1, paramObject));
      }
      c();
    }
  }
  
  protected abstract void a(List paramList);
  
  protected abstract Object b(String paramString, e paramE, Object paramObject);
  
  public final void b(String paramString)
  {
    try
    {
      if (b)
      {
        f = true;
        e.clear();
        e.add(new b(2, null, null, d.c));
        g.clear();
        if (a)
        {
          i = true;
          h.clear();
        }
      }
      c();
      return;
    }
    finally {}
  }
}
