package com.tencent.feedback.proguard;

public final class K
  extends j
  implements Cloneable
{
  private static byte[] d;
  public byte a = 0;
  public String b = "";
  public byte[] c = null;
  
  public K() {}
  
  public K(byte paramByte, String paramString, byte[] paramArrayOfByte)
  {
    a = paramByte;
    b = paramString;
    c = paramArrayOfByte;
  }
  
  public final void a(h paramH)
  {
    a = paramH.a(a, 0, true);
    b = paramH.b(1, true);
    if (d == null)
    {
      arrayOfByte = (byte[])new byte[1];
      d = arrayOfByte;
      ((byte[])arrayOfByte)[0] = 0;
    }
    byte[] arrayOfByte = d;
    c = ((byte[])paramH.c(2, false));
  }
  
  public final void a(i paramI)
  {
    paramI.a(a, 0);
    paramI.a(b, 1);
    if (c != null) {
      paramI.a(c, 2);
    }
  }
  
  public final void a(StringBuilder paramStringBuilder, int paramInt) {}
}
