package com.tencent.feedback.proguard;

import java.util.ArrayList;

public final class M
  extends j
  implements Cloneable
{
  private static ArrayList<L> b;
  public ArrayList<L> a = null;
  
  public M() {}
  
  public final void a(h paramH)
  {
    if (b == null)
    {
      b = new ArrayList();
      L localL = new L();
      b.add(localL);
    }
    a = ((ArrayList)paramH.a(b, 0, true));
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
