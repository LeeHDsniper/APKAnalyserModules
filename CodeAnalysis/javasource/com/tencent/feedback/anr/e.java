package com.tencent.feedback.anr;

import java.util.HashMap;
import java.util.Map;

final class e
  implements g
{
  e(f paramF, boolean paramBoolean) {}
  
  public final boolean a(long paramLong)
  {
    com.tencent.feedback.common.e.b("process end %d", new Object[] { Long.valueOf(paramLong) });
    return false;
  }
  
  public final boolean a(long paramLong1, long paramLong2, String paramString)
  {
    com.tencent.feedback.common.e.b("new process %s", new Object[] { paramString });
    a.a = paramLong1;
    a.b = paramString;
    a.c = paramLong2;
    return b;
  }
  
  public final boolean a(String paramString1, int paramInt, String paramString2, String paramString3)
  {
    com.tencent.feedback.common.e.b("new thread %s", new Object[] { paramString1 });
    if (a.d == null) {
      a.d = new HashMap();
    }
    a.d.put(paramString1, new String[] { paramString2, paramString3, paramInt });
    return true;
  }
}
