package com.squareup.okhttp.internal.spdy;

import java.util.Arrays;

public final class Settings
{
  private int persistValue;
  private int persisted;
  private int set;
  private final int[] values = new int[10];
  
  public Settings() {}
  
  void clear()
  {
    persisted = 0;
    persistValue = 0;
    set = 0;
    Arrays.fill(values, 0);
  }
  
  int flags(int paramInt)
  {
    int i = 0;
    if (isPersisted(paramInt)) {
      i = 0x0 | 0x2;
    }
    int j = i;
    if (persistValue(paramInt)) {
      j = i | 0x1;
    }
    return j;
  }
  
  int get(int paramInt)
  {
    return values[paramInt];
  }
  
  int getHeaderTableSize()
  {
    if ((set & 0x2) != 0) {
      return values[1];
    }
    return -1;
  }
  
  int getInitialWindowSize(int paramInt)
  {
    if ((set & 0x80) != 0) {
      paramInt = values[7];
    }
    return paramInt;
  }
  
  int getMaxFrameSize(int paramInt)
  {
    if ((set & 0x20) != 0) {
      paramInt = values[5];
    }
    return paramInt;
  }
  
  boolean isPersisted(int paramInt)
  {
    return (persisted & 1 << paramInt) != 0;
  }
  
  boolean isSet(int paramInt)
  {
    return (set & 1 << paramInt) != 0;
  }
  
  void merge(Settings paramSettings)
  {
    int i = 0;
    if (i < 10)
    {
      if (!paramSettings.isSet(i)) {}
      for (;;)
      {
        i += 1;
        break;
        set(i, paramSettings.flags(i), paramSettings.get(i));
      }
    }
  }
  
  boolean persistValue(int paramInt)
  {
    return (persistValue & 1 << paramInt) != 0;
  }
  
  Settings set(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt1 >= values.length) {
      return this;
    }
    int i = 1 << paramInt1;
    set |= i;
    if ((paramInt2 & 0x1) != 0)
    {
      persistValue |= i;
      if ((paramInt2 & 0x2) == 0) {
        break label86;
      }
    }
    label86:
    for (persisted |= i;; persisted &= (i ^ 0xFFFFFFFF))
    {
      values[paramInt1] = paramInt3;
      return this;
      persistValue &= (i ^ 0xFFFFFFFF);
      break;
    }
  }
  
  int size()
  {
    return Integer.bitCount(set);
  }
}
