package com.adobe.creativesdk.aviary.internal.utils;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public final class StringUtils
{
  public static String hashCode(Collection<String> paramCollection)
  {
    int i = 1;
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext()) {
      i = i * 31 + ((String)paramCollection.next()).hashCode();
    }
    return String.valueOf(i);
  }
  
  public static <T> String join(List<T> paramList, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("");
    int i = 0;
    while (i < paramList.size())
    {
      localStringBuilder.append(paramList.get(i).toString());
      if (i < paramList.size() - 1) {
        localStringBuilder.append(paramString);
      }
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static <T> String join(T[] paramArrayOfT, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("");
    int i = 0;
    while (i < paramArrayOfT.length)
    {
      localStringBuilder.append(paramArrayOfT[i].toString());
      if (i < paramArrayOfT.length - 1) {
        localStringBuilder.append(paramString);
      }
      i += 1;
    }
    return localStringBuilder.toString();
  }
}
