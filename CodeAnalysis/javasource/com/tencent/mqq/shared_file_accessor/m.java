package com.tencent.mqq.shared_file_accessor;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import java.lang.ref.WeakReference;
import java.util.Set;

final class m
  implements SharedPreferences.Editor
{
  private SharedPreferences.Editor a = null;
  
  public m(l paramL)
  {
    a = l.a(paramL).edit();
  }
  
  public final void apply()
  {
    if ((Context)l.b(b).get() != null) {
      a.apply();
    }
  }
  
  public final SharedPreferences.Editor clear()
  {
    if ((Context)l.b(b).get() != null) {
      a.clear();
    }
    return this;
  }
  
  public final boolean commit()
  {
    if ((Context)l.b(b).get() != null) {
      a.commit();
    }
    return false;
  }
  
  public final SharedPreferences.Editor putBoolean(String paramString, boolean paramBoolean)
  {
    if ((Context)l.b(b).get() != null) {
      a.putBoolean(paramString, paramBoolean);
    }
    return this;
  }
  
  public final SharedPreferences.Editor putFloat(String paramString, float paramFloat)
  {
    if ((Context)l.b(b).get() != null) {
      a.putFloat(paramString, paramFloat);
    }
    return this;
  }
  
  public final SharedPreferences.Editor putInt(String paramString, int paramInt)
  {
    if ((Context)l.b(b).get() != null) {
      a.putInt(paramString, paramInt);
    }
    return this;
  }
  
  public final SharedPreferences.Editor putLong(String paramString, long paramLong)
  {
    if ((Context)l.b(b).get() != null) {
      a.putLong(paramString, paramLong);
    }
    return this;
  }
  
  public final SharedPreferences.Editor putString(String paramString1, String paramString2)
  {
    if ((Context)l.b(b).get() != null) {
      a.putString(paramString1, paramString2);
    }
    return this;
  }
  
  public final SharedPreferences.Editor putStringSet(String paramString, Set paramSet)
  {
    if (Build.VERSION.SDK_INT >= 11) {
      a.putStringSet(paramString, paramSet);
    }
    return this;
  }
  
  public final SharedPreferences.Editor remove(String paramString)
  {
    if ((Context)l.b(b).get() != null) {
      a.remove(paramString);
    }
    return this;
  }
}
