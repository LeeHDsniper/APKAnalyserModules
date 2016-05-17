package com.tencent.mobileqq.msf.core.net.b;

public abstract class n
{
  protected h[] f = { new i("http://sqimg.qq.com/qq_product_operations/nettest/index.html", "MobileQQ1"), new i("http://sqimg.qq.com/qq_product_operations/nettest/index2.html", "MobileQQ2") };
  
  public n() {}
  
  protected a a(h paramH, int paramInt, a.a paramA)
  {
    switch (d)
    {
    case 0: 
    case 1: 
    default: 
      return null;
    }
    return new b(paramInt, f, e, 10000, paramA);
  }
  
  public abstract void a();
  
  public abstract void a(String paramString);
  
  public abstract void b();
  
  public abstract void b(String paramString);
  
  public abstract void c();
}
