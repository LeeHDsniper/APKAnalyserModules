package de.greenrobot.event;

import android.os.Looper;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;

public class EventBus
{
  private static final EventBusBuilder DEFAULT_BUILDER = new EventBusBuilder();
  public static String TAG = "Event";
  static volatile EventBus defaultInstance;
  private static final Map<Class<?>, List<Class<?>>> eventTypesCache = new HashMap();
  private final AsyncPoster asyncPoster = new AsyncPoster(this);
  private final BackgroundPoster backgroundPoster = new BackgroundPoster(this);
  private final ThreadLocal<PostingThreadState> currentPostingThreadState = new ThreadLocal()
  {
    protected EventBus.PostingThreadState initialValue()
    {
      return new EventBus.PostingThreadState();
    }
  };
  private final boolean eventInheritance;
  private final ExecutorService executorService;
  private final boolean logNoSubscriberMessages;
  private final boolean logSubscriberExceptions;
  private final HandlerPoster mainThreadPoster = new HandlerPoster(this, Looper.getMainLooper(), 10);
  private final boolean sendNoSubscriberEvent;
  private final boolean sendSubscriberExceptionEvent;
  private final Map<Class<?>, Object> stickyEvents = new ConcurrentHashMap();
  private final SubscriberMethodFinder subscriberMethodFinder;
  private final Map<Class<?>, CopyOnWriteArrayList<Subscription>> subscriptionsByEventType = new HashMap();
  private final boolean throwSubscriberException;
  private final Map<Object, List<Class<?>>> typesBySubscriber = new HashMap();
  
  public EventBus()
  {
    this(DEFAULT_BUILDER);
  }
  
  EventBus(EventBusBuilder paramEventBusBuilder)
  {
    subscriberMethodFinder = new SubscriberMethodFinder(skipMethodVerificationForClasses);
    logSubscriberExceptions = logSubscriberExceptions;
    logNoSubscriberMessages = logNoSubscriberMessages;
    sendSubscriberExceptionEvent = sendSubscriberExceptionEvent;
    sendNoSubscriberEvent = sendNoSubscriberEvent;
    throwSubscriberException = throwSubscriberException;
    eventInheritance = eventInheritance;
    executorService = executorService;
  }
  
  static void addInterfaces(List<Class<?>> paramList, Class<?>[] paramArrayOfClass)
  {
    int j = paramArrayOfClass.length;
    int i = 0;
    while (i < j)
    {
      Class<?> localClass = paramArrayOfClass[i];
      if (!paramList.contains(localClass))
      {
        paramList.add(localClass);
        addInterfaces(paramList, localClass.getInterfaces());
      }
      i += 1;
    }
  }
  
  public static EventBus getDefault()
  {
    if (defaultInstance == null) {}
    try
    {
      if (defaultInstance == null) {
        defaultInstance = new EventBus();
      }
      return defaultInstance;
    }
    finally {}
  }
  
  private void handleSubscriberException(Subscription paramSubscription, Object paramObject, Throwable paramThrowable)
  {
    if ((paramObject instanceof SubscriberExceptionEvent)) {
      if (logSubscriberExceptions)
      {
        Log.e(TAG, "SubscriberExceptionEvent subscriber " + subscriber.getClass() + " threw an exception", paramThrowable);
        paramSubscription = (SubscriberExceptionEvent)paramObject;
        Log.e(TAG, "Initial event " + causingEvent + " caused exception in " + causingSubscriber, throwable);
      }
    }
    do
    {
      return;
      if (throwSubscriberException) {
        throw new EventBusException("Invoking subscriber failed", paramThrowable);
      }
      if (logSubscriberExceptions) {
        Log.e(TAG, "Could not dispatch event: " + paramObject.getClass() + " to subscribing class " + subscriber.getClass(), paramThrowable);
      }
    } while (!sendSubscriberExceptionEvent);
    post(new SubscriberExceptionEvent(this, paramThrowable, paramObject, subscriber));
  }
  
  private List<Class<?>> lookupAllEventTypes(Class<?> paramClass)
  {
    synchronized (eventTypesCache)
    {
      Object localObject2 = (List)eventTypesCache.get(paramClass);
      Object localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject2 = new ArrayList();
        for (localObject1 = paramClass; localObject1 != null; localObject1 = ((Class)localObject1).getSuperclass())
        {
          ((List)localObject2).add(localObject1);
          addInterfaces((List)localObject2, ((Class)localObject1).getInterfaces());
        }
        eventTypesCache.put(paramClass, localObject2);
        localObject1 = localObject2;
      }
      return localObject1;
    }
  }
  
  private void postSingleEvent(Object paramObject, PostingThreadState paramPostingThreadState)
    throws Error
  {
    Class localClass = paramObject.getClass();
    boolean bool1 = false;
    if (eventInheritance)
    {
      List localList = lookupAllEventTypes(localClass);
      int j = localList.size();
      int i = 0;
      for (;;)
      {
        bool2 = bool1;
        if (i >= j) {
          break;
        }
        bool1 |= postSingleEventForEventType(paramObject, paramPostingThreadState, (Class)localList.get(i));
        i += 1;
      }
    }
    boolean bool2 = postSingleEventForEventType(paramObject, paramPostingThreadState, localClass);
    if (!bool2)
    {
      if (logNoSubscriberMessages) {
        Log.d(TAG, "No subscribers registered for event " + localClass);
      }
      if ((sendNoSubscriberEvent) && (localClass != NoSubscriberEvent.class) && (localClass != SubscriberExceptionEvent.class)) {
        post(new NoSubscriberEvent(this, paramObject));
      }
    }
  }
  
  private boolean postSingleEventForEventType(Object paramObject, PostingThreadState paramPostingThreadState, Class<?> paramClass)
  {
    boolean bool2 = false;
    try
    {
      paramClass = (CopyOnWriteArrayList)subscriptionsByEventType.get(paramClass);
      bool1 = bool2;
      if (paramClass == null) {
        break label116;
      }
      bool1 = bool2;
      if (paramClass.isEmpty()) {
        break label116;
      }
      paramClass = paramClass.iterator();
    }
    finally
    {
      try
      {
        do
        {
          Subscription localSubscription;
          postToSubscription(localSubscription, paramObject, isMainThread);
          bool1 = canceled;
          event = null;
          subscription = null;
          canceled = false;
        } while (!bool1);
        boolean bool1 = true;
        return bool1;
      }
      finally
      {
        event = null;
        subscription = null;
        canceled = false;
      }
      paramObject = finally;
    }
    if (paramClass.hasNext())
    {
      localSubscription = (Subscription)paramClass.next();
      event = paramObject;
      subscription = localSubscription;
    }
  }
  
  private void postToSubscription(Subscription paramSubscription, Object paramObject, boolean paramBoolean)
  {
    switch (2.$SwitchMap$de$greenrobot$event$ThreadMode[subscriberMethod.threadMode.ordinal()])
    {
    default: 
      throw new IllegalStateException("Unknown thread mode: " + subscriberMethod.threadMode);
    case 1: 
      invokeSubscriber(paramSubscription, paramObject);
      return;
    case 2: 
      if (paramBoolean)
      {
        invokeSubscriber(paramSubscription, paramObject);
        return;
      }
      mainThreadPoster.enqueue(paramSubscription, paramObject);
      return;
    case 3: 
      if (paramBoolean)
      {
        backgroundPoster.enqueue(paramSubscription, paramObject);
        return;
      }
      invokeSubscriber(paramSubscription, paramObject);
      return;
    }
    asyncPoster.enqueue(paramSubscription, paramObject);
  }
  
  private void register(Object paramObject, boolean paramBoolean, int paramInt)
  {
    try
    {
      Iterator localIterator = subscriberMethodFinder.findSubscriberMethods(paramObject.getClass()).iterator();
      while (localIterator.hasNext()) {
        subscribe(paramObject, (SubscriberMethod)localIterator.next(), paramBoolean, paramInt);
      }
    }
    finally {}
  }
  
  private void subscribe(Object arg1, SubscriberMethod paramSubscriberMethod, boolean paramBoolean, int paramInt)
  {
    Class localClass = eventType;
    Object localObject = (CopyOnWriteArrayList)subscriptionsByEventType.get(localClass);
    Subscription localSubscription = new Subscription(???, paramSubscriberMethod, paramInt);
    if (localObject == null)
    {
      paramSubscriberMethod = new CopyOnWriteArrayList();
      subscriptionsByEventType.put(localClass, paramSubscriberMethod);
      int i = paramSubscriberMethod.size();
      paramInt = 0;
      if (paramInt <= i)
      {
        if ((paramInt != i) && (priority <= getpriority)) {
          break label268;
        }
        paramSubscriberMethod.add(paramInt, localSubscription);
      }
      localObject = (List)typesBySubscriber.get(???);
      paramSubscriberMethod = (SubscriberMethod)localObject;
      if (localObject == null)
      {
        paramSubscriberMethod = new ArrayList();
        typesBySubscriber.put(???, paramSubscriberMethod);
      }
      paramSubscriberMethod.add(localClass);
      if (!paramBoolean) {}
    }
    for (;;)
    {
      synchronized (stickyEvents)
      {
        paramSubscriberMethod = stickyEvents.get(localClass);
        if (paramSubscriberMethod != null)
        {
          if (Looper.getMainLooper() == Looper.myLooper())
          {
            paramBoolean = true;
            postToSubscription(localSubscription, paramSubscriberMethod, paramBoolean);
          }
        }
        else
        {
          return;
          paramSubscriberMethod = (SubscriberMethod)localObject;
          if (!((CopyOnWriteArrayList)localObject).contains(localSubscription)) {
            break;
          }
          throw new EventBusException("Subscriber " + ???.getClass() + " already registered to event " + localClass);
          label268:
          paramInt += 1;
        }
      }
      paramBoolean = false;
    }
  }
  
  private void unubscribeByEventType(Object paramObject, Class<?> paramClass)
  {
    paramClass = (List)subscriptionsByEventType.get(paramClass);
    if (paramClass != null)
    {
      int j = paramClass.size();
      int i = 0;
      while (i < j)
      {
        Subscription localSubscription = (Subscription)paramClass.get(i);
        int m = i;
        int k = j;
        if (subscriber == paramObject)
        {
          active = false;
          paramClass.remove(i);
          m = i - 1;
          k = j - 1;
        }
        i = m + 1;
        j = k;
      }
    }
  }
  
  ExecutorService getExecutorService()
  {
    return executorService;
  }
  
  void invokeSubscriber(PendingPost paramPendingPost)
  {
    Object localObject = event;
    Subscription localSubscription = subscription;
    PendingPost.releasePendingPost(paramPendingPost);
    if (active) {
      invokeSubscriber(localSubscription, localObject);
    }
  }
  
  void invokeSubscriber(Subscription paramSubscription, Object paramObject)
  {
    try
    {
      subscriberMethod.method.invoke(subscriber, new Object[] { paramObject });
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      handleSubscriberException(paramSubscription, paramObject, localInvocationTargetException.getCause());
      return;
    }
    catch (IllegalAccessException paramSubscription)
    {
      throw new IllegalStateException("Unexpected exception", paramSubscription);
    }
  }
  
  public boolean isRegistered(Object paramObject)
  {
    try
    {
      boolean bool = typesBySubscriber.containsKey(paramObject);
      return bool;
    }
    finally
    {
      paramObject = finally;
      throw paramObject;
    }
  }
  
  public void post(Object paramObject)
  {
    PostingThreadState localPostingThreadState = (PostingThreadState)currentPostingThreadState.get();
    List localList = eventQueue;
    localList.add(paramObject);
    if (!isPosting)
    {
      if (Looper.getMainLooper() == Looper.myLooper()) {}
      for (boolean bool = true;; bool = false)
      {
        isMainThread = bool;
        isPosting = true;
        if (!canceled) {
          break;
        }
        throw new EventBusException("Internal error. Abort state was not reset");
      }
      try
      {
        if (!localList.isEmpty()) {}
        return;
      }
      finally
      {
        isPosting = false;
        isMainThread = false;
      }
    }
  }
  
  public void register(Object paramObject)
  {
    register(paramObject, false, 0);
  }
  
  public void unregister(Object paramObject)
  {
    try
    {
      Object localObject = (List)typesBySubscriber.get(paramObject);
      if (localObject != null)
      {
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext()) {
          unubscribeByEventType(paramObject, (Class)((Iterator)localObject).next());
        }
        typesBySubscriber.remove(paramObject);
      }
    }
    finally {}
    for (;;)
    {
      return;
      Log.w(TAG, "Subscriber to unregister was not registered before: " + paramObject.getClass());
    }
  }
  
  static final class PostingThreadState
  {
    boolean canceled;
    Object event;
    final List<Object> eventQueue = new ArrayList();
    boolean isMainThread;
    boolean isPosting;
    Subscription subscription;
    
    PostingThreadState() {}
  }
}
