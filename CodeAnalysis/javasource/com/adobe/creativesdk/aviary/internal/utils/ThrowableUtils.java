package com.adobe.creativesdk.aviary.internal.utils;

import java.util.Collection;
import java.util.Iterator;

public final class ThrowableUtils
{
  public static String getLocalizedMessage(Collection<Throwable> paramCollection, CharSequence paramCharSequence)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      localStringBuilder.append(((Throwable)paramCollection.next()).getLocalizedMessage());
      if (paramCollection.hasNext()) {
        localStringBuilder.append(paramCharSequence);
      }
    }
    return localStringBuilder.toString();
  }
}
