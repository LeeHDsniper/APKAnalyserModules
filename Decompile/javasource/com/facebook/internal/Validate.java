package com.facebook.internal;

import java.util.Collection;
import java.util.Iterator;

public final class Validate
{
  public static <T> void containsNoNulls(Collection<T> paramCollection, String paramString)
  {
    notNull(paramCollection, paramString);
    paramCollection = paramCollection.iterator();
    do
    {
      if (!paramCollection.hasNext()) {
        return;
      }
    } while ((Object)paramCollection.next() != null);
    throw new NullPointerException("Container '" + paramString + "' cannot contain null values");
  }
  
  public static <T> void notEmpty(Collection<T> paramCollection, String paramString)
  {
    if (paramCollection.isEmpty()) {
      throw new IllegalArgumentException("Container '" + paramString + "' cannot be empty");
    }
  }
  
  public static <T> void notEmptyAndContainsNoNulls(Collection<T> paramCollection, String paramString)
  {
    containsNoNulls(paramCollection, paramString);
    notEmpty(paramCollection, paramString);
  }
  
  public static void notNull(Object paramObject, String paramString)
  {
    if (paramObject == null) {
      throw new NullPointerException("Argument '" + paramString + "' cannot be null");
    }
  }
  
  public static void notNullOrEmpty(String paramString1, String paramString2)
  {
    if (Utility.isNullOrEmpty(paramString1)) {
      throw new IllegalArgumentException("Argument '" + paramString2 + "' cannot be null or empty");
    }
  }
}
