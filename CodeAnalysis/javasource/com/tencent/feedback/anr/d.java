package com.tencent.feedback.anr;

import com.tencent.feedback.common.e;
import java.util.HashMap;
import java.util.Map;

final class d
  implements g
{
  d(f paramF, boolean paramBoolean) {}
  
  public final boolean a(long paramLong)
  {
    boolean bool = false;
    e.b("process end %d", new Object[] { Long.valueOf(paramLong) });
    if ((a.a <= 0L) || (a.c <= 0L) || (a.b == null)) {
      bool = true;
    }
    return bool;
  }
  
  public final boolean a(long paramLong1, long paramLong2, String paramString)
  {
    e.b("new process %s", new Object[] { paramString });
    if (!paramString.equals(paramString)) {}
    do
    {
      return true;
      a.a = paramLong1;
      a.b = paramString;
      a.c = paramLong2;
    } while (b);
    return false;
  }
  
  public final boolean a(String paramString1, int paramInt, String paramString2, String paramString3)
  {
    e.b("new thread %s", new Object[] { paramString1 });
    if ((a.a <= 0L) || (a.c <= 0L) || (a.b == null)) {
      return true;
    }
    if (a.d == null) {
      a.d = new HashMap();
    }
    a.d.put(paramString1, new String[] { paramString2, paramString3, paramInt });
    return true;
  }
}
