package com.tencent.feedback.proguard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public final class L
  extends j
  implements Cloneable
{
  private static Map<String, String> A;
  private static Map<String, String> t;
  private static J u;
  private static I v;
  private static ArrayList<I> w;
  private static ArrayList<I> x;
  private static ArrayList<K> y;
  private static Map<String, String> z;
  public String a = "";
  public long b = 0L;
  public String c = "";
  public String d = "";
  public String e = "";
  public String f = "";
  public String g = "";
  public Map<String, String> h = null;
  public String i = "";
  public int j = 0;
  public String k = "";
  public String l = "";
  public ArrayList<I> m = null;
  public ArrayList<I> n = null;
  public ArrayList<K> o = null;
  public Map<String, String> p = null;
  private J q = null;
  private I r = null;
  private Map<String, String> s = null;
  
  public L() {}
  
  public final void a(h paramH)
  {
    a = paramH.b(0, true);
    b = paramH.a(b, 1, true);
    c = paramH.b(2, true);
    d = paramH.b(3, false);
    e = paramH.b(4, false);
    f = paramH.b(5, false);
    g = paramH.b(6, false);
    if (t == null)
    {
      t = new HashMap();
      t.put("", "");
    }
    h = ((Map)paramH.a(t, 7, false));
    i = paramH.b(8, false);
    if (u == null) {
      u = new J();
    }
    q = ((J)paramH.a(u, 9, false));
    j = paramH.a(j, 10, false);
    k = paramH.b(11, false);
    l = paramH.b(12, false);
    if (v == null) {
      v = new I();
    }
    r = ((I)paramH.a(v, 13, false));
    Object localObject;
    if (w == null)
    {
      w = new ArrayList();
      localObject = new I();
      w.add(localObject);
    }
    m = ((ArrayList)paramH.a(w, 14, false));
    if (x == null)
    {
      x = new ArrayList();
      localObject = new I();
      x.add(localObject);
    }
    n = ((ArrayList)paramH.a(x, 15, false));
    if (y == null)
    {
      y = new ArrayList();
      localObject = new K();
      y.add(localObject);
    }
    o = ((ArrayList)paramH.a(y, 16, false));
    if (z == null)
    {
      z = new HashMap();
      z.put("", "");
    }
    p = ((Map)paramH.a(z, 17, false));
    if (A == null)
    {
      A = new HashMap();
      A.put("", "");
    }
    s = ((Map)paramH.a(A, 18, false));
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    paramI.a(b, 1);
    paramI.a(c, 2);
    if (d != null) {
      paramI.a(d, 3);
    }
    if (e != null) {
      paramI.a(e, 4);
    }
    if (f != null) {
      paramI.a(f, 5);
    }
    if (g != null) {
      paramI.a(g, 6);
    }
    if (h != null) {
      paramI.a(h, 7);
    }
    if (i != null) {
      paramI.a(i, 8);
    }
    if (q != null) {
      paramI.a(q, 9);
    }
    paramI.a(j, 10);
    if (k != null) {
      paramI.a(k, 11);
    }
    if (l != null) {
      paramI.a(l, 12);
    }
    if (r != null) {
      paramI.a(r, 13);
    }
    if (m != null) {
      paramI.a(m, 14);
    }
    if (n != null) {
      paramI.a(n, 15);
    }
    if (o != null) {
      paramI.a(o, 16);
    }
    if (p != null) {
      paramI.a(p, 17);
    }
    if (s != null) {
      paramI.a(s, 18);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
