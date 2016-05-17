package com.tencent.feedback.proguard;

public final class P
  extends j
  implements Cloneable
{
  private String a = "";
  private String b = "";
  
  public P() {}
  
  public final void a(h paramH)
  {
    a = paramH.b(0, true);
    b = paramH.b(1, true);
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    paramI.a(b, 1);
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
