package com.tencent.feedback.proguard;

import java.util.ArrayList;

public final class J
  extends j
  implements Cloneable
{
  private static ArrayList<String> c;
  private String a = "";
  private ArrayList<String> b = null;
  
  public J() {}
  
  public final void a(h paramH)
  {
    a = paramH.b(0, true);
    if (c == null)
    {
      c = new ArrayList();
      c.add("");
    }
    b = ((ArrayList)paramH.a(c, 1, false));
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    if (b != null) {
      paramI.a(b, 1);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
