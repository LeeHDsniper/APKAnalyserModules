package com.tencent.mqq.shared_file_accessor;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

final class k
  extends a
{
  private WeakReference d = null;
  private SharedPreferences e = null;
  
  static
  {
    new Object();
  }
  
  public k(Context paramContext, String paramString, int paramInt)
  {
    b = true;
    c = paramString;
    d = new WeakReference(paramContext);
    paramContext = localContext;
    if (d != null) {
      paramContext = (Context)d.get();
    }
    localContext = paramContext;
    if (paramContext == null)
    {
      localContext = SharedPreferencesProxyManager.getInstance().a();
      d = new WeakReference(localContext);
    }
    if (localContext != null) {
      e = p.a(localContext, paramString, paramInt);
    }
    c = paramString;
  }
  
  private static SharedPreferences.Editor a(SharedPreferences.Editor paramEditor, b paramB)
  {
    String str = a;
    Object localObject = c;
    try
    {
      switch (d.a)
      {
      case 5: 
        paramEditor.putBoolean(str, ((Boolean)localObject).booleanValue());
        return paramEditor;
      case 3: 
        paramEditor.putFloat(str, ((Float)localObject).floatValue());
        return paramEditor;
      case 1: 
        paramEditor.putInt(str, ((Integer)localObject).intValue());
        return paramEditor;
      case 2: 
        paramEditor.putLong(str, ((Long)localObject).longValue());
        return paramEditor;
      case 4: 
        paramEditor.putString(str, (String)localObject);
        return paramEditor;
      case 6: 
        int i = Build.VERSION.SDK_INT;
        if (i >= 11) {
          try
          {
            paramEditor.putStringSet(str, (Set)localObject);
            return paramEditor;
          }
          catch (Exception paramB)
          {
            return paramEditor;
          }
        }
        break;
      }
      return paramEditor;
    }
    catch (ClassCastException paramB) {}
    return paramEditor;
  }
  
  protected final void a(List paramList)
  {
    if ((paramList == null) || (paramList.size() == 0)) {
      return;
    }
    SharedPreferences.Editor localEditor = e.edit();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      b localB = (b)paramList.next();
      switch (b)
      {
      default: 
        break;
      case 0: 
        a(localEditor, localB);
        break;
      case 2: 
        localEditor.clear();
        break;
      case 1: 
        localEditor.remove(a);
      }
    }
    localEditor.commit();
  }
  
  protected final Object b(String paramString, e paramE, Object paramObject)
  {
    SharedPreferences localSharedPreferences2 = null;
    SharedPreferences localSharedPreferences1 = null;
    boolean bool = false;
    if (e == null) {}
    for (;;)
    {
      return paramObject;
      try
      {
        switch (a)
        {
        case 0: 
          if (e.contains(paramString)) {
            return Boolean.valueOf(true);
          }
          break;
        }
      }
      catch (ClassCastException paramString)
      {
        try
        {
          localSharedPreferences1 = e;
          paramE = localSharedPreferences2;
          if (paramObject != null) {
            paramE = (Set)paramObject;
          }
          paramString = localSharedPreferences1.getStringSet(paramString, paramE);
          return paramString;
        }
        catch (Exception paramString)
        {
          return paramObject;
        }
        paramString = paramString;
        return paramObject;
      }
    }
    paramE = e;
    if (paramObject != null) {
      bool = ((Boolean)paramObject).booleanValue();
    }
    return Boolean.valueOf(paramE.getBoolean(paramString, bool));
    paramE = e;
    float f;
    label131:
    int i;
    if (paramObject != null)
    {
      f = ((Float)paramObject).floatValue();
      return Float.valueOf(paramE.getFloat(paramString, f));
      paramE = e;
      if (paramObject == null) {
        break label290;
      }
      i = ((Integer)paramObject).intValue();
      label162:
      return Integer.valueOf(paramE.getInt(paramString, i));
      paramE = e;
      if (paramObject == null) {
        break label296;
      }
    }
    label290:
    label296:
    for (long l = ((Long)paramObject).longValue();; l = 0L)
    {
      return Long.valueOf(paramE.getLong(paramString, l));
      localSharedPreferences2 = e;
      paramE = localSharedPreferences1;
      if (paramObject != null) {
        paramE = (String)paramObject;
      }
      return localSharedPreferences2.getString(paramString, paramE);
      i = Build.VERSION.SDK_INT;
      if (i < 11) {
        break;
      }
      return paramObject;
      f = 0.0F;
      break label131;
      i = 0;
      break label162;
    }
  }
  
  /* Error */
  public final java.util.Map b()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 220	com/tencent/mqq/shared_file_accessor/k:a	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +10 -> 18
    //   11: aload_0
    //   12: ldc2_w 221
    //   15: invokevirtual 226	java/lang/Object:wait	(J)V
    //   18: aload_0
    //   19: monitorexit
    //   20: aload_0
    //   21: invokevirtual 228	com/tencent/mqq/shared_file_accessor/k:a	()V
    //   24: aload_0
    //   25: getfield 22	com/tencent/mqq/shared_file_accessor/k:e	Landroid/content/SharedPreferences;
    //   28: invokeinterface 231 1 0
    //   33: areturn
    //   34: astore_2
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_2
    //   38: athrow
    //   39: astore_2
    //   40: goto -22 -> 18
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	43	0	this	k
    //   6	2	1	bool	boolean
    //   34	4	2	localObject	Object
    //   39	1	2	localInterruptedException	InterruptedException
    // Exception table:
    //   from	to	target	type
    //   2	7	34	finally
    //   11	18	34	finally
    //   18	20	34	finally
    //   11	18	39	java/lang/InterruptedException
  }
}
