package com.adobe.creativesdk.aviary.internal.services;

import android.util.Log;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.ConcurrentHashMap;

public class ServiceLoader<T extends BaseContextService>
{
  AdobeImageEditorController mContext;
  final ConcurrentHashMap<String, Class<T>> mMap = new ConcurrentHashMap();
  final ConcurrentHashMap<String, T> mServices = new ConcurrentHashMap();
  
  public ServiceLoader(AdobeImageEditorController paramAdobeImageEditorController)
  {
    mContext = paramAdobeImageEditorController;
  }
  
  private T createService(Class<T> paramClass, AdobeImageEditorController paramAdobeImageEditorController)
    throws IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException
  {
    return (BaseContextService)paramClass.getConstructor(new Class[] { AdobeImageEditorController.class }).newInstance(new Object[] { paramAdobeImageEditorController });
  }
  
  private T get(String paramString, AdobeImageEditorController paramAdobeImageEditorController)
    throws IllegalAccessException, InstantiationException
  {
    Log.i("ServiceLoader", "get: " + paramString);
    if (mMap.containsKey(paramString))
    {
      paramString = (Class)mMap.get(paramString);
      try
      {
        paramString = createService(paramString, paramAdobeImageEditorController);
        return paramString;
      }
      catch (Exception paramString)
      {
        paramString.printStackTrace();
      }
    }
    for (;;)
    {
      return null;
      Log.w("ServiceLoader", paramString + " not registered");
    }
  }
  
  /* Error */
  public void dispose()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 24	com/adobe/creativesdk/aviary/internal/services/ServiceLoader:mServices	Ljava/util/concurrent/ConcurrentHashMap;
    //   4: invokevirtual 104	java/util/concurrent/ConcurrentHashMap:keySet	()Ljava/util/Set;
    //   7: invokeinterface 110 1 0
    //   12: astore_1
    //   13: aload_1
    //   14: invokeinterface 116 1 0
    //   19: ifeq +38 -> 57
    //   22: aload_0
    //   23: getfield 24	com/adobe/creativesdk/aviary/internal/services/ServiceLoader:mServices	Ljava/util/concurrent/ConcurrentHashMap;
    //   26: aload_1
    //   27: invokeinterface 120 1 0
    //   32: invokevirtual 88	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   35: checkcast 53	com/adobe/creativesdk/aviary/internal/services/BaseContextService
    //   38: invokevirtual 123	com/adobe/creativesdk/aviary/internal/services/BaseContextService:internalDispose	()V
    //   41: goto -28 -> 13
    //   44: astore_1
    //   45: aload_1
    //   46: invokevirtual 93	java/lang/Exception:printStackTrace	()V
    //   49: aload_0
    //   50: getfield 24	com/adobe/creativesdk/aviary/internal/services/ServiceLoader:mServices	Ljava/util/concurrent/ConcurrentHashMap;
    //   53: invokevirtual 126	java/util/concurrent/ConcurrentHashMap:clear	()V
    //   56: return
    //   57: aload_0
    //   58: getfield 24	com/adobe/creativesdk/aviary/internal/services/ServiceLoader:mServices	Ljava/util/concurrent/ConcurrentHashMap;
    //   61: invokevirtual 126	java/util/concurrent/ConcurrentHashMap:clear	()V
    //   64: return
    //   65: astore_1
    //   66: aload_0
    //   67: getfield 24	com/adobe/creativesdk/aviary/internal/services/ServiceLoader:mServices	Ljava/util/concurrent/ConcurrentHashMap;
    //   70: invokevirtual 126	java/util/concurrent/ConcurrentHashMap:clear	()V
    //   73: aload_1
    //   74: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	75	0	this	ServiceLoader
    //   12	15	1	localIterator	java.util.Iterator
    //   44	2	1	localException	Exception
    //   65	9	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   0	13	44	java/lang/Exception
    //   13	41	44	java/lang/Exception
    //   0	13	65	finally
    //   13	41	65	finally
    //   45	49	65	finally
  }
  
  public T getService(Class<T> paramClass)
    throws IllegalAccessException
  {
    String str = paramClass.getName();
    if (mServices.containsKey(str)) {
      return (BaseContextService)mServices.get(str);
    }
    if (!mMap.containsKey(str))
    {
      Log.v("ServiceLoader", "class not yet registered, register it...");
      register(paramClass);
    }
    try
    {
      paramClass = get(str, mContext);
      if (paramClass != null)
      {
        register(paramClass);
        return paramClass;
      }
    }
    catch (Exception paramClass)
    {
      paramClass.printStackTrace();
      throw new IllegalAccessException(paramClass.getMessage());
    }
    Log.w("ServiceLoader", "service is not registered!");
    return null;
  }
  
  public T register(T paramT)
  {
    String str = paramT.getClass().getName();
    Log.i("ServiceLoader", "register: " + str);
    return (BaseContextService)mServices.put(str, paramT);
  }
  
  public Class<T> register(Class<?> paramClass)
  {
    return (Class)mMap.put(paramClass.getName(), paramClass);
  }
}
