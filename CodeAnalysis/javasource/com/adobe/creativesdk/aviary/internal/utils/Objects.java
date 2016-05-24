package com.adobe.creativesdk.aviary.internal.utils;

public final class Objects
{
  public static boolean equal(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)));
  }
}
