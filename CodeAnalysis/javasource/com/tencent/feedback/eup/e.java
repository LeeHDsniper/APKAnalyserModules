package com.tencent.feedback.eup;

import com.tencent.feedback.common.PlugInInfo;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class e
  implements Serializable
{
  private long A = -1L;
  private long B = -1L;
  private long C = -1L;
  private long D = -1L;
  private String E;
  private byte[] F;
  private Map<String, PlugInInfo> G;
  private String H;
  private boolean I;
  private String J;
  private String K = "";
  private String L = "";
  private String M = "unknown";
  private String N = "";
  private String O = "";
  private String P = "";
  private final Map<String, String> Q = new HashMap();
  private long R = -1L;
  public int a = -1;
  public int b = -1;
  public Map<String, String> c = null;
  public Map<String, String> d = null;
  private long e = -1L;
  private byte f = 0;
  private boolean g = false;
  private boolean h = false;
  private int i = 0;
  private String j = "";
  private String k;
  private String l;
  private String m;
  private String n;
  private long o;
  private String p;
  private int q;
  private byte[] r;
  private String s;
  private String t;
  private String u;
  private String v;
  private long w = -1L;
  private long x = -1L;
  private long y = -1L;
  private long z = -1L;
  
  public e()
  {
    try
    {
      H = UUID.randomUUID().toString();
      return;
    }
    catch (Throwable localThrowable)
    {
      if ((!com.tencent.feedback.common.e.a(localThrowable)) && (!com.tencent.feedback.common.e.a(localThrowable))) {
        localThrowable.printStackTrace();
      }
      H = "unknown";
    }
  }
  
  public final String A()
  {
    return L;
  }
  
  public final String B()
  {
    return M;
  }
  
  public final Map<String, String> C()
  {
    return Q;
  }
  
  public final String D()
  {
    return N;
  }
  
  public final boolean E()
  {
    return h;
  }
  
  public final long F()
  {
    return w;
  }
  
  public final long G()
  {
    return x;
  }
  
  public final long H()
  {
    return y;
  }
  
  public final long I()
  {
    return z;
  }
  
  public final long J()
  {
    return A;
  }
  
  public final long K()
  {
    return B;
  }
  
  public final long L()
  {
    return C;
  }
  
  public final long M()
  {
    return D;
  }
  
  public final String N()
  {
    return O;
  }
  
  public final String O()
  {
    return P;
  }
  
  public final byte P()
  {
    return f;
  }
  
  public final long Q()
  {
    return R;
  }
  
  public final int R()
  {
    return a;
  }
  
  public final int S()
  {
    return b;
  }
  
  public final Map<String, String> T()
  {
    return c;
  }
  
  public final Map<String, String> U()
  {
    return d;
  }
  
  public final long a()
  {
    return e;
  }
  
  public final void a(byte paramByte)
  {
    f = paramByte;
  }
  
  public final void a(float paramFloat) {}
  
  public final void a(int paramInt)
  {
    i = paramInt;
  }
  
  public final void a(long paramLong)
  {
    e = paramLong;
  }
  
  public final void a(String paramString)
  {
    k = paramString;
  }
  
  public final void a(Map<String, PlugInInfo> paramMap)
  {
    G = paramMap;
  }
  
  public final void a(boolean paramBoolean)
  {
    g = true;
  }
  
  public final void a(byte[] paramArrayOfByte)
  {
    r = paramArrayOfByte;
  }
  
  public final void b(int paramInt)
  {
    q = paramInt;
  }
  
  public final void b(long paramLong)
  {
    o = paramLong;
  }
  
  public final void b(String paramString)
  {
    l = paramString;
  }
  
  public final void b(Map<String, String> paramMap)
  {
    c = paramMap;
  }
  
  public final void b(boolean paramBoolean)
  {
    I = true;
  }
  
  public final void b(byte[] paramArrayOfByte)
  {
    F = paramArrayOfByte;
  }
  
  public final boolean b()
  {
    return f == 0;
  }
  
  public final void c(int paramInt)
  {
    a = paramInt;
  }
  
  public final void c(long paramLong)
  {
    w = paramLong;
  }
  
  public final void c(String paramString)
  {
    m = paramString;
  }
  
  public final void c(Map<String, String> paramMap)
  {
    d = paramMap;
  }
  
  public final void c(boolean paramBoolean)
  {
    h = true;
  }
  
  public final boolean c()
  {
    return g;
  }
  
  public final void d(int paramInt)
  {
    b = paramInt;
  }
  
  public final void d(long paramLong)
  {
    x = paramLong;
  }
  
  public final void d(String paramString)
  {
    n = paramString;
  }
  
  public final boolean d()
  {
    return f == 2;
  }
  
  public final String e()
  {
    return k;
  }
  
  public final void e(long paramLong)
  {
    y = paramLong;
  }
  
  public final void e(String paramString)
  {
    j = paramString;
  }
  
  public final String f()
  {
    return l;
  }
  
  public final void f(long paramLong)
  {
    z = paramLong;
  }
  
  public final void f(String paramString)
  {
    p = paramString;
  }
  
  public final String g()
  {
    return m;
  }
  
  public final void g(long paramLong)
  {
    A = paramLong;
  }
  
  public final void g(String paramString)
  {
    s = paramString;
  }
  
  public final String h()
  {
    return n;
  }
  
  public final void h(long paramLong)
  {
    B = paramLong;
  }
  
  public final void h(String paramString)
  {
    t = paramString;
  }
  
  public final long i()
  {
    return o;
  }
  
  public final void i(long paramLong)
  {
    C = paramLong;
  }
  
  public final void i(String paramString)
  {
    u = paramString;
  }
  
  public final int j()
  {
    return i;
  }
  
  public final void j(long paramLong)
  {
    D = paramLong;
  }
  
  public final void j(String paramString)
  {
    v = paramString;
  }
  
  public final String k()
  {
    return j;
  }
  
  public final void k(long paramLong)
  {
    R = paramLong;
  }
  
  public final void k(String paramString)
  {
    E = paramString;
  }
  
  public final String l()
  {
    return p;
  }
  
  public final void l(String paramString)
  {
    H = paramString;
  }
  
  public final int m()
  {
    return q;
  }
  
  public final void m(String paramString)
  {
    J = paramString;
  }
  
  public final void n(String paramString)
  {
    K = paramString;
  }
  
  public final byte[] n()
  {
    return r;
  }
  
  public final String o()
  {
    return s;
  }
  
  public final void o(String paramString)
  {
    L = paramString;
  }
  
  public final String p()
  {
    return t;
  }
  
  public final void p(String paramString)
  {
    M = paramString;
  }
  
  public final String q()
  {
    return u;
  }
  
  public final void q(String paramString)
  {
    N = paramString;
  }
  
  public final String r()
  {
    return v;
  }
  
  public final void r(String paramString)
  {
    O = paramString;
  }
  
  public final String s()
  {
    return E;
  }
  
  public final void s(String paramString)
  {
    P = paramString;
  }
  
  public final byte[] t()
  {
    return F;
  }
  
  public final Map<String, PlugInInfo> u()
  {
    return G;
  }
  
  public final String v()
  {
    return H;
  }
  
  public final boolean w()
  {
    return I;
  }
  
  public final boolean x()
  {
    return f == 3;
  }
  
  public final String y()
  {
    return J;
  }
  
  public final String z()
  {
    return K;
  }
}
