package com.tencent.feedback.proguard;

import java.io.Serializable;

public abstract class j
  implements Serializable
{
  public j() {}
  
  public abstract void a(h paramH);
  
  public abstract void a(i paramI);
  
  public abstract void a(StringBuilder paramStringBuilder, int paramInt);
  
  public final byte[] a()
  {
    i localI = new i();
    a(localI);
    return localI.b();
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    a(localStringBuilder, 0);
    return localStringBuilder.toString();
  }
}
