package com.tencent.mqq.shared_file_accessor;

import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import java.util.Iterator;
import java.util.Set;

final class o
  implements SharedPreferences.Editor
{
  private o(n paramN) {}
  
  private void a(String paramString)
  {
    synchronized (a)
    {
      if (n.b(a) != null)
      {
        Iterator localIterator = n.b(a).iterator();
        if (localIterator.hasNext()) {
          ((SharedPreferences.OnSharedPreferenceChangeListener)localIterator.next()).onSharedPreferenceChanged(a, paramString);
        }
      }
    }
  }
  
  public final void apply() {}
  
  public final SharedPreferences.Editor clear()
  {
    n.a(a).b(null);
    return this;
  }
  
  public final boolean commit()
  {
    return true;
  }
  
  public final SharedPreferences.Editor putBoolean(String paramString, boolean paramBoolean)
  {
    n.a(a).a(paramString, Boolean.valueOf(paramBoolean), d.h);
    a(paramString);
    return this;
  }
  
  public final SharedPreferences.Editor putFloat(String paramString, float paramFloat)
  {
    n.a(a).a(paramString, Float.valueOf(paramFloat), d.f);
    a(paramString);
    return this;
  }
  
  public final SharedPreferences.Editor putInt(String paramString, int paramInt)
  {
    n.a(a).a(paramString, Integer.valueOf(paramInt), d.d);
    a(paramString);
    return this;
  }
  
  public final SharedPreferences.Editor putLong(String paramString, long paramLong)
  {
    n.a(a).a(paramString, Long.valueOf(paramLong), d.e);
    a(paramString);
    return this;
  }
  
  public final SharedPreferences.Editor putString(String paramString1, String paramString2)
  {
    n.a(a).a(paramString1, paramString2, d.g);
    a(paramString1);
    return this;
  }
  
  public final SharedPreferences.Editor putStringSet(String paramString, Set paramSet)
  {
    n.a(a).a(paramString, paramSet, d.i);
    a(paramString);
    return this;
  }
  
  public final SharedPreferences.Editor remove(String paramString)
  {
    n.a(a).a(paramString);
    a(paramString);
    return this;
  }
}
