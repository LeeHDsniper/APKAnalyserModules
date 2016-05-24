package de.greenrobot.event;

import android.util.Log;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

class SubscriberMethodFinder
{
  private static final Map<String, List<SubscriberMethod>> methodCache = new HashMap();
  private final Map<Class<?>, Class<?>> skipMethodVerificationForClasses = new ConcurrentHashMap();
  
  SubscriberMethodFinder(List<Class<?>> paramList)
  {
    if (paramList != null)
    {
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        Class localClass = (Class)paramList.next();
        skipMethodVerificationForClasses.put(localClass, localClass);
      }
    }
  }
  
  List<SubscriberMethod> findSubscriberMethods(Class<?> arg1)
  {
    String str1 = ???.getName();
    synchronized (methodCache)
    {
      localObject3 = (List)methodCache.get(str1);
      if (localObject3 != null) {
        return localObject3;
      }
    }
    ArrayList localArrayList = new ArrayList();
    Object localObject3 = ???;
    HashSet localHashSet = new HashSet();
    StringBuilder localStringBuilder = new StringBuilder();
    for (;;)
    {
      if (localObject3 != null)
      {
        ??? = ((Class)localObject3).getName();
        if ((!((String)???).startsWith("java.")) && (!((String)???).startsWith("javax.")) && (!((String)???).startsWith("android."))) {}
      }
      else
      {
        if (!localArrayList.isEmpty()) {
          break;
        }
        throw new EventBusException("Subscriber " + ??? + " has no public methods called " + "onEvent");
      }
      Method[] arrayOfMethod = ((Class)localObject3).getDeclaredMethods();
      int j = arrayOfMethod.length;
      int i = 0;
      if (i < j)
      {
        Method localMethod = arrayOfMethod[i];
        String str2 = localMethod.getName();
        if (str2.startsWith("onEvent"))
        {
          int k = localMethod.getModifiers();
          if (((k & 0x1) == 0) || ((k & 0x1448) != 0)) {
            break label441;
          }
          Object localObject4 = localMethod.getParameterTypes();
          if (localObject4.length == 1)
          {
            ??? = str2.substring("onEvent".length());
            if (((String)???).length() != 0) {
              break label345;
            }
            ??? = ThreadMode.PostThread;
            label268:
            localObject4 = localObject4[0];
            localStringBuilder.setLength(0);
            localStringBuilder.append(str2);
            localStringBuilder.append('>').append(((Class)localObject4).getName());
            if (localHashSet.add(localStringBuilder.toString())) {
              localArrayList.add(new SubscriberMethod(localMethod, (ThreadMode)???, (Class)localObject4));
            }
          }
        }
        for (;;)
        {
          i += 1;
          break;
          label345:
          if (((String)???).equals("MainThread"))
          {
            ??? = ThreadMode.MainThread;
            break label268;
          }
          if (((String)???).equals("BackgroundThread"))
          {
            ??? = ThreadMode.BackgroundThread;
            break label268;
          }
          if (((String)???).equals("Async"))
          {
            ??? = ThreadMode.Async;
            break label268;
          }
          if (!skipMethodVerificationForClasses.containsKey(localObject3))
          {
            throw new EventBusException("Illegal onEvent method, check for typos: " + localMethod);
            label441:
            if (!skipMethodVerificationForClasses.containsKey(localObject3)) {
              Log.d(EventBus.TAG, "Skipping method (not public, static or abstract): " + localObject3 + "." + str2);
            }
          }
        }
      }
      localObject3 = ((Class)localObject3).getSuperclass();
    }
    synchronized (methodCache)
    {
      methodCache.put(str1, localArrayList);
      return localArrayList;
    }
  }
}
