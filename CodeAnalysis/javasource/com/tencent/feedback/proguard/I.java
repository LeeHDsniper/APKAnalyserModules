package com.tencent.feedback.proguard;

public final class I
  extends j
  implements Cloneable
{
  public String a = "";
  public String b = "";
  public String c = "";
  public String d = "";
  private String e = "";
  
  public I() {}
  
  public final void a(h paramH)
  {
    a = paramH.b(0, true);
    b = paramH.b(1, false);
    c = paramH.b(2, false);
    e = paramH.b(3, false);
    d = paramH.b(4, false);
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    if (b != null) {
      paramI.a(b, 1);
    }
    if (c != null) {
      paramI.a(c, 2);
    }
    if (e != null) {
      paramI.a(e, 3);
    }
    if (d != null) {
      paramI.a(d, 4);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
