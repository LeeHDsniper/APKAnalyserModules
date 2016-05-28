package de.greenrobot.event;

import java.lang.reflect.Method;

final class SubscriberMethod
{
  final Class<?> eventType;
  final Method method;
  String methodString;
  final ThreadMode threadMode;
  
  SubscriberMethod(Method paramMethod, ThreadMode paramThreadMode, Class<?> paramClass)
  {
    method = paramMethod;
    threadMode = paramThreadMode;
    eventType = paramClass;
  }
  
  private void checkMethodString()
  {
    try
    {
      if (methodString == null)
      {
        StringBuilder localStringBuilder = new StringBuilder(64);
        localStringBuilder.append(method.getDeclaringClass().getName());
        localStringBuilder.append('#').append(method.getName());
        localStringBuilder.append('(').append(eventType.getName());
        methodString = localStringBuilder.toString();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof SubscriberMethod))
    {
      checkMethodString();
      paramObject = (SubscriberMethod)paramObject;
      paramObject.checkMethodString();
      return methodString.equals(methodString);
    }
    return false;
  }
  
  public int hashCode()
  {
    return method.hashCode();
  }
}
