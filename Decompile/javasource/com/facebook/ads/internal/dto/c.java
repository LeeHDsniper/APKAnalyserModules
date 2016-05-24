package com.facebook.ads.internal.dto;

import java.util.ArrayList;
import java.util.List;

public class c
{
  private List<a> a = new ArrayList();
  private int b = 0;
  private d c;
  
  public c(d paramD)
  {
    c = paramD;
  }
  
  public d a()
  {
    return c;
  }
  
  public void a(a paramA)
  {
    a.add(paramA);
  }
  
  public a c()
  {
    if (b < a.size())
    {
      b += 1;
      return (a)a.get(b - 1);
    }
    return null;
  }
}
