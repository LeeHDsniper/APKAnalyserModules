package com.tencent.beacon.c;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

final class c
{
  private int a;
  private int b;
  private int c;
  private List<d> d = Collections.synchronizedList(new ArrayList());
  
  public c() {}
  
  public final int a()
  {
    try
    {
      int i = b;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(int paramInt)
  {
    try
    {
      a = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final int b()
  {
    try
    {
      int i = c;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void b(int paramInt)
  {
    try
    {
      b = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final List<d> c()
  {
    return d;
  }
  
  public final void c(int paramInt)
  {
    try
    {
      c = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final boolean equals(Object paramObject)
  {
    if (paramObject == null) {}
    while ((getClass() != paramObject.getClass()) || (!(paramObject instanceof c)) || (a != a)) {
      return false;
    }
    return true;
  }
}
