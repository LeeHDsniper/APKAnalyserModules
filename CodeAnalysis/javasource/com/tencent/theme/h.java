package com.tencent.theme;

import android.annotation.TargetApi;
import android.graphics.drawable.Drawable.ConstantState;
import android.util.LongSparseArray;

@TargetApi(16)
public class h
  extends LongSparseArray<Drawable.ConstantState>
{
  private int a;
  private g b;
  
  public h(int paramInt, g paramG)
  {
    a = paramInt;
    b = paramG;
  }
  
  public Drawable.ConstantState a(int paramInt)
  {
    return (Drawable.ConstantState)b.b[a].valueAt(paramInt);
  }
  
  public Drawable.ConstantState a(long paramLong)
  {
    return b.a(a, paramLong);
  }
  
  public void a(long paramLong, Drawable.ConstantState paramConstantState)
  {
    b.b[a].put(paramLong, paramConstantState);
  }
  
  public int size()
  {
    return b.b[a].size();
  }
}
