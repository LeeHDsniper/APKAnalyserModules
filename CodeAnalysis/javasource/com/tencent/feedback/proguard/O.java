package com.tencent.feedback.proguard;

public final class O
  extends j
  implements Cloneable
{
  private static byte[] f;
  public byte a = 0;
  public int b = 0;
  public byte[] c = null;
  public String d = "";
  public long e = 0L;
  
  public O() {}
  
  public final void a(h paramH)
  {
    a = paramH.a(a, 0, true);
    b = paramH.a(b, 1, true);
    if (f == null)
    {
      arrayOfByte = (byte[])new byte[1];
      f = arrayOfByte;
      ((byte[])arrayOfByte)[0] = 0;
    }
    byte[] arrayOfByte = f;
    c = ((byte[])paramH.c(2, false));
    d = paramH.b(3, false);
    e = paramH.a(e, 4, false);
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    paramI.a(b, 1);
    if (c != null) {
      paramI.a(c, 2);
    }
    if (d != null) {
      paramI.a(d, 3);
    }
    paramI.a(e, 4);
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
