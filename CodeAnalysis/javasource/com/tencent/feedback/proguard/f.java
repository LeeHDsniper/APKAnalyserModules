package com.tencent.feedback.proguard;

import com.tencent.feedback.eup.b;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

public final class f
  extends j
{
  private static byte[] k;
  private static Map<String, String> l;
  public short a = 0;
  public int b = 0;
  public String c = null;
  public String d = null;
  public byte[] e;
  private byte f = 0;
  private int g = 0;
  private int h = 0;
  private Map<String, String> i;
  private Map<String, String> j;
  
  static
  {
    if (!f.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      m = bool;
      k = null;
      l = null;
      return;
    }
  }
  
  public f() {}
  
  public final void a(h paramH)
  {
    try
    {
      a = paramH.a(a, 1, true);
      f = paramH.a(f, 2, true);
      g = paramH.a(g, 3, true);
      b = paramH.a(b, 4, true);
      c = paramH.b(5, true);
      d = paramH.b(6, true);
      if (k == null) {
        k = new byte[] { 0 };
      }
      Object localObject = k;
      e = ((byte[])paramH.c(7, true));
      h = paramH.a(h, 8, true);
      if (l == null)
      {
        localObject = new HashMap();
        l = (Map)localObject;
        ((Map)localObject).put("", "");
      }
      i = ((Map)paramH.a(l, 9, true));
      if (l == null)
      {
        localObject = new HashMap();
        l = (Map)localObject;
        ((Map)localObject).put("", "");
      }
      j = ((Map)paramH.a(l, 10, true));
      return;
    }
    catch (Exception paramH)
    {
      paramH.printStackTrace();
      System.out.println("RequestPacket decode error " + e.a(e));
      throw new RuntimeException(paramH);
    }
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 1);
    paramI.a(f, 2);
    paramI.a(g, 3);
    paramI.a(b, 4);
    paramI.a(c, 5);
    paramI.a(d, 6);
    paramI.a(e, 7);
    paramI.a(h, 8);
    paramI.a(i, 9);
    paramI.a(j, 10);
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt)
  {
    paramStringBuilder = new b(paramStringBuilder, paramInt);
    paramStringBuilder.a(a, "iVersion");
    paramStringBuilder.a(f, "cPacketType");
    paramStringBuilder.a(g, "iMessageType");
    paramStringBuilder.a(b, "iRequestId");
    paramStringBuilder.a(c, "sServantName");
    paramStringBuilder.a(d, "sFuncName");
    paramStringBuilder.a(e, "sBuffer");
    paramStringBuilder.a(h, "iTimeout");
    paramStringBuilder.a(i, "context");
    paramStringBuilder.a(j, "status");
  }
  
  public final Object clone()
  {
    Object localObject1 = null;
    try
    {
      Object localObject2 = super.clone();
      localObject1 = localObject2;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      while (m) {}
      throw new AssertionError();
    }
    return localObject1;
  }
  
  public final boolean equals(Object paramObject)
  {
    paramObject = (f)paramObject;
    return (k.a(1, a)) && (k.a(1, f)) && (k.a(1, g)) && (k.a(1, b)) && (k.a(Integer.valueOf(1), c)) && (k.a(Integer.valueOf(1), d)) && (k.a(Integer.valueOf(1), e)) && (k.a(1, h)) && (k.a(Integer.valueOf(1), i)) && (k.a(Integer.valueOf(1), j));
  }
}
