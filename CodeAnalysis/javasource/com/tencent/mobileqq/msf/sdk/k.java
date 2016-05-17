package com.tencent.mobileqq.msf.sdk;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.AbstractQueue;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class k
  extends AbstractQueue
  implements Serializable
{
  private static final long d = -387911632671998426L;
  transient d a;
  transient d b;
  final ReentrantLock c = new ReentrantLock();
  private transient int e;
  private final int f;
  private final Condition g = c.newCondition();
  private final Condition h = c.newCondition();
  
  public k()
  {
    this(Integer.MAX_VALUE);
  }
  
  public k(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException();
    }
    f = paramInt;
  }
  
  public k(Collection paramCollection)
  {
    this(Integer.MAX_VALUE);
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    Object localObject;
    do
    {
      try
      {
        paramCollection = paramCollection.iterator();
        if (!paramCollection.hasNext()) {
          break;
        }
        localObject = paramCollection.next();
        if (localObject == null) {
          throw new NullPointerException();
        }
      }
      finally
      {
        localReentrantLock.unlock();
      }
    } while (c(new d(localObject)));
    throw new IllegalStateException("Deque full");
    localReentrantLock.unlock();
  }
  
  private void a(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    e = 0;
    a = null;
    b = null;
    for (;;)
    {
      Object localObject = paramObjectInputStream.readObject();
      if (localObject == null) {
        return;
      }
      add(localObject);
    }
  }
  
  private void a(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      paramObjectOutputStream.defaultWriteObject();
      for (d localD = a; localD != null; localD = c) {
        paramObjectOutputStream.writeObject(a);
      }
      paramObjectOutputStream.writeObject(null);
      return;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  private boolean b(d paramD)
  {
    if (e >= f) {
      return false;
    }
    d localD = a;
    c = localD;
    a = paramD;
    if (b == null) {
      b = paramD;
    }
    for (;;)
    {
      e += 1;
      g.signal();
      return true;
      b = paramD;
    }
  }
  
  private boolean c(d paramD)
  {
    if (e >= f) {
      return false;
    }
    d localD = b;
    b = localD;
    b = paramD;
    if (a == null) {
      a = paramD;
    }
    for (;;)
    {
      e += 1;
      g.signal();
      return true;
      c = paramD;
    }
  }
  
  private Object o()
  {
    d localD1 = a;
    if (localD1 == null) {
      return null;
    }
    d localD2 = c;
    Object localObject = a;
    a = null;
    c = localD1;
    a = localD2;
    if (localD2 == null) {
      b = null;
    }
    for (;;)
    {
      e -= 1;
      h.signal();
      return localObject;
      b = null;
    }
  }
  
  private Object p()
  {
    d localD1 = b;
    if (localD1 == null) {
      return null;
    }
    d localD2 = b;
    Object localObject = a;
    a = null;
    b = localD1;
    b = localD2;
    if (localD2 == null) {
      a = null;
    }
    for (;;)
    {
      e -= 1;
      h.signal();
      return localObject;
      c = null;
    }
  }
  
  public int a(Collection paramCollection)
  {
    return a(paramCollection, Integer.MAX_VALUE);
  }
  
  public int a(Collection paramCollection, int paramInt)
  {
    int i = 0;
    if (paramCollection == null) {
      throw new NullPointerException();
    }
    if (paramCollection == this) {
      throw new IllegalArgumentException();
    }
    if (paramInt <= 0) {
      return 0;
    }
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      int j = Math.min(paramInt, e);
      paramInt = i;
      while (paramInt < j)
      {
        paramCollection.add(a.a);
        o();
        paramInt += 1;
      }
      return j;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  public Object a()
  {
    Object localObject = c();
    if (localObject == null) {
      throw new NoSuchElementException();
    }
    return localObject;
  }
  
  /* Error */
  public Object a(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    // Byte code:
    //   0: aload_3
    //   1: lload_1
    //   2: invokevirtual 170	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   5: lstore_1
    //   6: aload_0
    //   7: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   10: astore 5
    //   12: aload 5
    //   14: invokevirtual 173	java/util/concurrent/locks/ReentrantLock:lockInterruptibly	()V
    //   17: aload_0
    //   18: invokespecial 156	com/tencent/mobileqq/msf/sdk/k:o	()Ljava/lang/Object;
    //   21: astore_3
    //   22: aload_3
    //   23: astore 4
    //   25: aload_3
    //   26: ifnonnull +12 -> 38
    //   29: lload_1
    //   30: lconst_0
    //   31: lcmp
    //   32: ifgt +14 -> 46
    //   35: aconst_null
    //   36: astore 4
    //   38: aload 5
    //   40: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   43: aload 4
    //   45: areturn
    //   46: aload_0
    //   47: getfield 51	com/tencent/mobileqq/msf/sdk/k:g	Ljava/util/concurrent/locks/Condition;
    //   50: lload_1
    //   51: invokeinterface 176 3 0
    //   56: lstore_1
    //   57: goto -40 -> 17
    //   60: astore_3
    //   61: aload 5
    //   63: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   66: aload_3
    //   67: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	68	0	this	k
    //   0	68	1	paramLong	long
    //   0	68	3	paramTimeUnit	TimeUnit
    //   23	21	4	localTimeUnit	TimeUnit
    //   10	52	5	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   17	22	60	finally
    //   46	57	60	finally
  }
  
  void a(d paramD)
  {
    d localD1 = b;
    d localD2 = c;
    if (localD1 == null)
    {
      o();
      return;
    }
    if (localD2 == null)
    {
      p();
      return;
    }
    c = localD2;
    b = localD1;
    a = null;
    e -= 1;
    h.signal();
  }
  
  public void a(Object paramObject)
  {
    if (!c(paramObject)) {
      throw new IllegalStateException("Deque full");
    }
  }
  
  /* Error */
  public boolean a(Object paramObject, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +11 -> 12
    //   4: new 80	java/lang/NullPointerException
    //   7: dup
    //   8: invokespecial 81	java/lang/NullPointerException:<init>	()V
    //   11: athrow
    //   12: new 19	com/tencent/mobileqq/msf/sdk/k$d
    //   15: dup
    //   16: aload_1
    //   17: invokespecial 87	com/tencent/mobileqq/msf/sdk/k$d:<init>	(Ljava/lang/Object;)V
    //   20: astore_1
    //   21: aload 4
    //   23: lload_2
    //   24: invokevirtual 170	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   27: lstore_2
    //   28: aload_0
    //   29: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   32: astore 4
    //   34: aload 4
    //   36: invokevirtual 173	java/util/concurrent/locks/ReentrantLock:lockInterruptibly	()V
    //   39: aload_0
    //   40: aload_1
    //   41: invokespecial 184	com/tencent/mobileqq/msf/sdk/k:b	(Lcom/tencent/mobileqq/msf/sdk/k$d;)Z
    //   44: istore 5
    //   46: iload 5
    //   48: ifne +34 -> 82
    //   51: lload_2
    //   52: lconst_0
    //   53: lcmp
    //   54: ifgt +14 -> 68
    //   57: iconst_0
    //   58: istore 5
    //   60: aload 4
    //   62: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   65: iload 5
    //   67: ireturn
    //   68: aload_0
    //   69: getfield 53	com/tencent/mobileqq/msf/sdk/k:h	Ljava/util/concurrent/locks/Condition;
    //   72: lload_2
    //   73: invokeinterface 176 3 0
    //   78: lstore_2
    //   79: goto -40 -> 39
    //   82: iconst_1
    //   83: istore 5
    //   85: goto -25 -> 60
    //   88: astore_1
    //   89: aload 4
    //   91: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   94: aload_1
    //   95: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	96	0	this	k
    //   0	96	1	paramObject	Object
    //   0	96	2	paramLong	long
    //   0	96	4	paramTimeUnit	TimeUnit
    //   44	40	5	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   39	46	88	finally
    //   68	79	88	finally
  }
  
  public boolean add(Object paramObject)
  {
    b(paramObject);
    return true;
  }
  
  public Object b()
  {
    Object localObject = d();
    if (localObject == null) {
      throw new NoSuchElementException();
    }
    return localObject;
  }
  
  /* Error */
  public Object b(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    // Byte code:
    //   0: aload_3
    //   1: lload_1
    //   2: invokevirtual 170	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   5: lstore_1
    //   6: aload_0
    //   7: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   10: astore 5
    //   12: aload 5
    //   14: invokevirtual 173	java/util/concurrent/locks/ReentrantLock:lockInterruptibly	()V
    //   17: aload_0
    //   18: invokespecial 179	com/tencent/mobileqq/msf/sdk/k:p	()Ljava/lang/Object;
    //   21: astore_3
    //   22: aload_3
    //   23: astore 4
    //   25: aload_3
    //   26: ifnonnull +12 -> 38
    //   29: lload_1
    //   30: lconst_0
    //   31: lcmp
    //   32: ifgt +14 -> 46
    //   35: aconst_null
    //   36: astore 4
    //   38: aload 5
    //   40: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   43: aload 4
    //   45: areturn
    //   46: aload_0
    //   47: getfield 51	com/tencent/mobileqq/msf/sdk/k:g	Ljava/util/concurrent/locks/Condition;
    //   50: lload_1
    //   51: invokeinterface 176 3 0
    //   56: lstore_1
    //   57: goto -40 -> 17
    //   60: astore_3
    //   61: aload 5
    //   63: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   66: aload_3
    //   67: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	68	0	this	k
    //   0	68	1	paramLong	long
    //   0	68	3	paramTimeUnit	TimeUnit
    //   23	21	4	localTimeUnit	TimeUnit
    //   10	52	5	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   17	22	60	finally
    //   46	57	60	finally
  }
  
  public void b(Object paramObject)
  {
    if (!d(paramObject)) {
      throw new IllegalStateException("Deque full");
    }
  }
  
  /* Error */
  public boolean b(Object paramObject, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +11 -> 12
    //   4: new 80	java/lang/NullPointerException
    //   7: dup
    //   8: invokespecial 81	java/lang/NullPointerException:<init>	()V
    //   11: athrow
    //   12: new 19	com/tencent/mobileqq/msf/sdk/k$d
    //   15: dup
    //   16: aload_1
    //   17: invokespecial 87	com/tencent/mobileqq/msf/sdk/k$d:<init>	(Ljava/lang/Object;)V
    //   20: astore_1
    //   21: aload 4
    //   23: lload_2
    //   24: invokevirtual 170	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   27: lstore_2
    //   28: aload_0
    //   29: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   32: astore 4
    //   34: aload 4
    //   36: invokevirtual 173	java/util/concurrent/locks/ReentrantLock:lockInterruptibly	()V
    //   39: aload_0
    //   40: aload_1
    //   41: invokespecial 90	com/tencent/mobileqq/msf/sdk/k:c	(Lcom/tencent/mobileqq/msf/sdk/k$d;)Z
    //   44: istore 5
    //   46: iload 5
    //   48: ifne +34 -> 82
    //   51: lload_2
    //   52: lconst_0
    //   53: lcmp
    //   54: ifgt +14 -> 68
    //   57: iconst_0
    //   58: istore 5
    //   60: aload 4
    //   62: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   65: iload 5
    //   67: ireturn
    //   68: aload_0
    //   69: getfield 53	com/tencent/mobileqq/msf/sdk/k:h	Ljava/util/concurrent/locks/Condition;
    //   72: lload_2
    //   73: invokeinterface 176 3 0
    //   78: lstore_2
    //   79: goto -40 -> 39
    //   82: iconst_1
    //   83: istore 5
    //   85: goto -25 -> 60
    //   88: astore_1
    //   89: aload 4
    //   91: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   94: aload_1
    //   95: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	96	0	this	k
    //   0	96	1	paramObject	Object
    //   0	96	2	paramLong	long
    //   0	96	4	paramTimeUnit	TimeUnit
    //   44	40	5	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   39	46	88	finally
    //   68	79	88	finally
  }
  
  public Object c()
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      Object localObject1 = o();
      return localObject1;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  public Object c(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return a(paramLong, paramTimeUnit);
  }
  
  public boolean c(Object paramObject)
  {
    if (paramObject == null) {
      throw new NullPointerException();
    }
    d localD = new d(paramObject);
    paramObject = c;
    paramObject.lock();
    try
    {
      boolean bool = b(localD);
      return bool;
    }
    finally
    {
      paramObject.unlock();
    }
  }
  
  public boolean c(Object paramObject, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return b(paramObject, paramLong, paramTimeUnit);
  }
  
  public void clear()
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      d localD;
      for (Object localObject1 = a; localObject1 != null; localObject1 = localD)
      {
        a = null;
        localD = c;
        b = null;
        c = null;
      }
      b = null;
      a = null;
      e = 0;
      h.signalAll();
      return;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  /* Error */
  public boolean contains(Object paramObject)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_3
    //   2: aload_1
    //   3: ifnonnull +5 -> 8
    //   6: iconst_0
    //   7: ireturn
    //   8: aload_0
    //   9: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   12: astore 5
    //   14: aload 5
    //   16: invokevirtual 62	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   19: aload_0
    //   20: getfield 111	com/tencent/mobileqq/msf/sdk/k:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   23: astore 4
    //   25: iload_3
    //   26: istore_2
    //   27: aload 4
    //   29: ifnull +19 -> 48
    //   32: aload_1
    //   33: aload 4
    //   35: getfield 130	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
    //   38: invokevirtual 204	java/lang/Object:equals	(Ljava/lang/Object;)Z
    //   41: istore_2
    //   42: iload_2
    //   43: ifeq +12 -> 55
    //   46: iconst_1
    //   47: istore_2
    //   48: aload 5
    //   50: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   53: iload_2
    //   54: ireturn
    //   55: aload 4
    //   57: getfield 135	com/tencent/mobileqq/msf/sdk/k$d:c	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   60: astore 4
    //   62: goto -37 -> 25
    //   65: astore_1
    //   66: aload 5
    //   68: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   71: aload_1
    //   72: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	73	0	this	k
    //   0	73	1	paramObject	Object
    //   26	28	2	bool1	boolean
    //   1	25	3	bool2	boolean
    //   23	38	4	localD	d
    //   12	55	5	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   19	25	65	finally
    //   32	42	65	finally
    //   55	62	65	finally
  }
  
  public Object d()
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      Object localObject1 = p();
      return localObject1;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  public boolean d(Object paramObject)
  {
    if (paramObject == null) {
      throw new NullPointerException();
    }
    d localD = new d(paramObject);
    paramObject = c;
    paramObject.lock();
    try
    {
      boolean bool = c(localD);
      return bool;
    }
    finally
    {
      paramObject.unlock();
    }
  }
  
  public Object e()
    throws InterruptedException
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      for (;;)
      {
        Object localObject1 = o();
        if (localObject1 != null) {
          break;
        }
        g.await();
      }
    }
    finally
    {
      localReentrantLock.unlock();
    }
    return localObject2;
  }
  
  public void e(Object paramObject)
    throws InterruptedException
  {
    if (paramObject == null) {
      throw new NullPointerException();
    }
    d localD = new d(paramObject);
    paramObject = c;
    paramObject.lock();
    try
    {
      if (!b(localD)) {
        h.await();
      }
      return;
    }
    finally
    {
      paramObject.unlock();
    }
  }
  
  public Object element()
  {
    return g();
  }
  
  public Object f()
    throws InterruptedException
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      for (;;)
      {
        Object localObject1 = p();
        if (localObject1 != null) {
          break;
        }
        g.await();
      }
    }
    finally
    {
      localReentrantLock.unlock();
    }
    return localObject2;
  }
  
  public void f(Object paramObject)
    throws InterruptedException
  {
    if (paramObject == null) {
      throw new NullPointerException();
    }
    d localD = new d(paramObject);
    paramObject = c;
    paramObject.lock();
    try
    {
      if (!c(localD)) {
        h.await();
      }
      return;
    }
    finally
    {
      paramObject.unlock();
    }
  }
  
  public Object g()
  {
    Object localObject = i();
    if (localObject == null) {
      throw new NoSuchElementException();
    }
    return localObject;
  }
  
  /* Error */
  public boolean g(Object paramObject)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_3
    //   2: aload_1
    //   3: ifnonnull +5 -> 8
    //   6: iconst_0
    //   7: ireturn
    //   8: aload_0
    //   9: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   12: astore 5
    //   14: aload 5
    //   16: invokevirtual 62	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   19: aload_0
    //   20: getfield 111	com/tencent/mobileqq/msf/sdk/k:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   23: astore 4
    //   25: iload_3
    //   26: istore_2
    //   27: aload 4
    //   29: ifnull +23 -> 52
    //   32: aload_1
    //   33: aload 4
    //   35: getfield 130	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
    //   38: invokevirtual 204	java/lang/Object:equals	(Ljava/lang/Object;)Z
    //   41: ifeq +18 -> 59
    //   44: aload_0
    //   45: aload 4
    //   47: invokevirtual 215	com/tencent/mobileqq/msf/sdk/k:a	(Lcom/tencent/mobileqq/msf/sdk/k$d;)V
    //   50: iconst_1
    //   51: istore_2
    //   52: aload 5
    //   54: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   57: iload_2
    //   58: ireturn
    //   59: aload 4
    //   61: getfield 135	com/tencent/mobileqq/msf/sdk/k$d:c	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   64: astore 4
    //   66: goto -41 -> 25
    //   69: astore_1
    //   70: aload 5
    //   72: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   75: aload_1
    //   76: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	77	0	this	k
    //   0	77	1	paramObject	Object
    //   26	32	2	bool1	boolean
    //   1	25	3	bool2	boolean
    //   23	42	4	localD	d
    //   12	59	5	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   19	25	69	finally
    //   32	50	69	finally
    //   59	66	69	finally
  }
  
  public Object h()
  {
    Object localObject = j();
    if (localObject == null) {
      throw new NoSuchElementException();
    }
    return localObject;
  }
  
  /* Error */
  public boolean h(Object paramObject)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_3
    //   2: aload_1
    //   3: ifnonnull +5 -> 8
    //   6: iconst_0
    //   7: ireturn
    //   8: aload_0
    //   9: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   12: astore 5
    //   14: aload 5
    //   16: invokevirtual 62	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   19: aload_0
    //   20: getfield 113	com/tencent/mobileqq/msf/sdk/k:b	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   23: astore 4
    //   25: iload_3
    //   26: istore_2
    //   27: aload 4
    //   29: ifnull +23 -> 52
    //   32: aload_1
    //   33: aload 4
    //   35: getfield 130	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
    //   38: invokevirtual 204	java/lang/Object:equals	(Ljava/lang/Object;)Z
    //   41: ifeq +18 -> 59
    //   44: aload_0
    //   45: aload 4
    //   47: invokevirtual 215	com/tencent/mobileqq/msf/sdk/k:a	(Lcom/tencent/mobileqq/msf/sdk/k$d;)V
    //   50: iconst_1
    //   51: istore_2
    //   52: aload 5
    //   54: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   57: iload_2
    //   58: ireturn
    //   59: aload 4
    //   61: getfield 141	com/tencent/mobileqq/msf/sdk/k$d:b	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   64: astore 4
    //   66: goto -41 -> 25
    //   69: astore_1
    //   70: aload 5
    //   72: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   75: aload_1
    //   76: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	77	0	this	k
    //   0	77	1	paramObject	Object
    //   26	32	2	bool1	boolean
    //   1	25	3	bool2	boolean
    //   23	42	4	localD	d
    //   12	59	5	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   19	25	69	finally
    //   32	50	69	finally
    //   59	66	69	finally
  }
  
  /* Error */
  public Object i()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   4: astore_2
    //   5: aload_2
    //   6: invokevirtual 62	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   9: aload_0
    //   10: getfield 111	com/tencent/mobileqq/msf/sdk/k:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   13: astore_1
    //   14: aload_1
    //   15: ifnonnull +11 -> 26
    //   18: aconst_null
    //   19: astore_1
    //   20: aload_2
    //   21: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   24: aload_1
    //   25: areturn
    //   26: aload_0
    //   27: getfield 111	com/tencent/mobileqq/msf/sdk/k:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   30: getfield 130	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
    //   33: astore_1
    //   34: goto -14 -> 20
    //   37: astore_1
    //   38: aload_2
    //   39: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   42: aload_1
    //   43: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	44	0	this	k
    //   13	21	1	localObject1	Object
    //   37	6	1	localObject2	Object
    //   4	35	2	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   9	14	37	finally
    //   26	34	37	finally
  }
  
  public void i(Object paramObject)
    throws InterruptedException
  {
    f(paramObject);
  }
  
  public Iterator iterator()
  {
    return new c(null);
  }
  
  /* Error */
  public Object j()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   4: astore_2
    //   5: aload_2
    //   6: invokevirtual 62	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   9: aload_0
    //   10: getfield 113	com/tencent/mobileqq/msf/sdk/k:b	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   13: astore_1
    //   14: aload_1
    //   15: ifnonnull +11 -> 26
    //   18: aconst_null
    //   19: astore_1
    //   20: aload_2
    //   21: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   24: aload_1
    //   25: areturn
    //   26: aload_0
    //   27: getfield 113	com/tencent/mobileqq/msf/sdk/k:b	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   30: getfield 130	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
    //   33: astore_1
    //   34: goto -14 -> 20
    //   37: astore_1
    //   38: aload_2
    //   39: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   42: aload_1
    //   43: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	44	0	this	k
    //   13	21	1	localObject1	Object
    //   37	6	1	localObject2	Object
    //   4	35	2	localReentrantLock	ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   9	14	37	finally
    //   26	34	37	finally
  }
  
  public void j(Object paramObject)
  {
    a(paramObject);
  }
  
  public Object k()
    throws InterruptedException
  {
    return e();
  }
  
  public int l()
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      int i = f;
      int j = e;
      return i - j;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  public Object m()
  {
    return a();
  }
  
  public Iterator n()
  {
    return new b(null);
  }
  
  public boolean offer(Object paramObject)
  {
    return d(paramObject);
  }
  
  public Object peek()
  {
    return i();
  }
  
  public Object poll()
  {
    return c();
  }
  
  public Object remove()
  {
    return a();
  }
  
  public boolean remove(Object paramObject)
  {
    return g(paramObject);
  }
  
  public int size()
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    try
    {
      int i = e;
      return i;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  public Object[] toArray()
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    Object[] arrayOfObject;
    try
    {
      arrayOfObject = new Object[e];
      int i = 0;
      d localD = a;
      while (localD != null)
      {
        arrayOfObject[i] = a;
        localD = c;
        i += 1;
      }
    }
    finally
    {
      localReentrantLock.unlock();
    }
    return arrayOfObject;
  }
  
  public Object[] toArray(Object[] paramArrayOfObject)
  {
    ReentrantLock localReentrantLock = c;
    localReentrantLock.lock();
    Object[] arrayOfObject = paramArrayOfObject;
    try
    {
      if (paramArrayOfObject.length < e) {
        arrayOfObject = (Object[])Array.newInstance(paramArrayOfObject.getClass().getComponentType(), e);
      }
      int i = 0;
      paramArrayOfObject = a;
      while (paramArrayOfObject != null)
      {
        arrayOfObject[i] = a;
        paramArrayOfObject = c;
        i += 1;
      }
      if (arrayOfObject.length > i) {
        arrayOfObject[i] = null;
      }
      return arrayOfObject;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }
  
  /* Error */
  public String toString()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 45	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
    //   4: astore 4
    //   6: aload 4
    //   8: invokevirtual 62	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   11: aload_0
    //   12: getfield 111	com/tencent/mobileqq/msf/sdk/k:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   15: astore_1
    //   16: aload_1
    //   17: ifnonnull +14 -> 31
    //   20: ldc_w 266
    //   23: astore_1
    //   24: aload 4
    //   26: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   29: aload_1
    //   30: areturn
    //   31: new 268	java/lang/StringBuilder
    //   34: dup
    //   35: invokespecial 269	java/lang/StringBuilder:<init>	()V
    //   38: astore 5
    //   40: aload 5
    //   42: bipush 91
    //   44: invokevirtual 273	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   47: pop
    //   48: aload_1
    //   49: getfield 130	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
    //   52: astore_3
    //   53: aload_3
    //   54: astore_2
    //   55: aload_3
    //   56: aload_0
    //   57: if_acmpne +7 -> 64
    //   60: ldc_w 275
    //   63: astore_2
    //   64: aload 5
    //   66: aload_2
    //   67: invokevirtual 278	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   70: pop
    //   71: aload_1
    //   72: getfield 135	com/tencent/mobileqq/msf/sdk/k$d:c	Lcom/tencent/mobileqq/msf/sdk/k$d;
    //   75: astore_1
    //   76: aload_1
    //   77: ifnonnull +17 -> 94
    //   80: aload 5
    //   82: bipush 93
    //   84: invokevirtual 273	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   87: invokevirtual 280	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   90: astore_1
    //   91: goto -67 -> 24
    //   94: aload 5
    //   96: bipush 44
    //   98: invokevirtual 273	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   101: bipush 32
    //   103: invokevirtual 273	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   106: pop
    //   107: goto -59 -> 48
    //   110: astore_1
    //   111: aload 4
    //   113: invokevirtual 84	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   116: aload_1
    //   117: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	118	0	this	k
    //   15	76	1	localObject1	Object
    //   110	7	1	localObject2	Object
    //   54	13	2	localObject3	Object
    //   52	4	3	localObject4	Object
    //   4	108	4	localReentrantLock	ReentrantLock
    //   38	57	5	localStringBuilder	StringBuilder
    // Exception table:
    //   from	to	target	type
    //   11	16	110	finally
    //   31	48	110	finally
    //   48	53	110	finally
    //   64	76	110	finally
    //   80	91	110	finally
    //   94	107	110	finally
  }
  
  private abstract class a
    implements Iterator
  {
    k.d a;
    Object b;
    private k.d d;
    
    /* Error */
    a()
    {
      // Byte code:
      //   0: aload_0
      //   1: aload_1
      //   2: putfield 19	com/tencent/mobileqq/msf/sdk/k$a:c	Lcom/tencent/mobileqq/msf/sdk/k;
      //   5: aload_0
      //   6: invokespecial 22	java/lang/Object:<init>	()V
      //   9: aload_1
      //   10: getfield 25	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
      //   13: astore_2
      //   14: aload_2
      //   15: invokevirtual 30	java/util/concurrent/locks/ReentrantLock:lock	()V
      //   18: aload_0
      //   19: aload_0
      //   20: invokevirtual 33	com/tencent/mobileqq/msf/sdk/k$a:a	()Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   23: putfield 35	com/tencent/mobileqq/msf/sdk/k$a:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   26: aload_0
      //   27: getfield 35	com/tencent/mobileqq/msf/sdk/k$a:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   30: ifnonnull +15 -> 45
      //   33: aconst_null
      //   34: astore_1
      //   35: aload_0
      //   36: aload_1
      //   37: putfield 37	com/tencent/mobileqq/msf/sdk/k$a:b	Ljava/lang/Object;
      //   40: aload_2
      //   41: invokevirtual 40	java/util/concurrent/locks/ReentrantLock:unlock	()V
      //   44: return
      //   45: aload_0
      //   46: getfield 35	com/tencent/mobileqq/msf/sdk/k$a:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   49: getfield 44	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
      //   52: astore_1
      //   53: goto -18 -> 35
      //   56: astore_1
      //   57: aload_2
      //   58: invokevirtual 40	java/util/concurrent/locks/ReentrantLock:unlock	()V
      //   61: aload_1
      //   62: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	63	0	this	a
      //   0	63	1	this$1	k
      //   13	45	2	localReentrantLock	ReentrantLock
      // Exception table:
      //   from	to	target	type
      //   18	33	56	finally
      //   35	40	56	finally
      //   45	53	56	finally
    }
    
    private k.d b(k.d paramD)
    {
      for (;;)
      {
        k.d localD1 = a(paramD);
        k.d localD2;
        if (localD1 == null) {
          localD2 = null;
        }
        do
        {
          return localD2;
          localD2 = localD1;
        } while (a != null);
        if (localD1 == paramD) {
          return a();
        }
        paramD = localD1;
      }
    }
    
    abstract k.d a();
    
    abstract k.d a(k.d paramD);
    
    /* Error */
    void b()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 19	com/tencent/mobileqq/msf/sdk/k$a:c	Lcom/tencent/mobileqq/msf/sdk/k;
      //   4: getfield 25	com/tencent/mobileqq/msf/sdk/k:c	Ljava/util/concurrent/locks/ReentrantLock;
      //   7: astore_2
      //   8: aload_2
      //   9: invokevirtual 30	java/util/concurrent/locks/ReentrantLock:lock	()V
      //   12: aload_0
      //   13: aload_0
      //   14: aload_0
      //   15: getfield 35	com/tencent/mobileqq/msf/sdk/k$a:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   18: invokespecial 50	com/tencent/mobileqq/msf/sdk/k$a:b	(Lcom/tencent/mobileqq/msf/sdk/k$d;)Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   21: putfield 35	com/tencent/mobileqq/msf/sdk/k$a:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   24: aload_0
      //   25: getfield 35	com/tencent/mobileqq/msf/sdk/k$a:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   28: ifnonnull +15 -> 43
      //   31: aconst_null
      //   32: astore_1
      //   33: aload_0
      //   34: aload_1
      //   35: putfield 37	com/tencent/mobileqq/msf/sdk/k$a:b	Ljava/lang/Object;
      //   38: aload_2
      //   39: invokevirtual 40	java/util/concurrent/locks/ReentrantLock:unlock	()V
      //   42: return
      //   43: aload_0
      //   44: getfield 35	com/tencent/mobileqq/msf/sdk/k$a:a	Lcom/tencent/mobileqq/msf/sdk/k$d;
      //   47: getfield 44	com/tencent/mobileqq/msf/sdk/k$d:a	Ljava/lang/Object;
      //   50: astore_1
      //   51: goto -18 -> 33
      //   54: astore_1
      //   55: aload_2
      //   56: invokevirtual 40	java/util/concurrent/locks/ReentrantLock:unlock	()V
      //   59: aload_1
      //   60: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	61	0	this	a
      //   32	19	1	localObject1	Object
      //   54	6	1	localObject2	Object
      //   7	49	2	localReentrantLock	ReentrantLock
      // Exception table:
      //   from	to	target	type
      //   12	31	54	finally
      //   33	38	54	finally
      //   43	51	54	finally
    }
    
    public boolean hasNext()
    {
      return a != null;
    }
    
    public Object next()
    {
      if (a == null) {
        throw new NoSuchElementException();
      }
      d = a;
      Object localObject = b;
      b();
      return localObject;
    }
    
    public void remove()
    {
      k.d localD = d;
      if (localD == null) {
        throw new IllegalStateException();
      }
      d = null;
      ReentrantLock localReentrantLock = c;
      localReentrantLock.lock();
      try
      {
        if (a != null) {
          a(localD);
        }
        return;
      }
      finally
      {
        localReentrantLock.unlock();
      }
    }
  }
  
  private class b
    extends k.a
  {
    private b()
    {
      super();
    }
    
    k.d a()
    {
      return b;
    }
    
    k.d a(k.d paramD)
    {
      return b;
    }
  }
  
  private class c
    extends k.a
  {
    private c()
    {
      super();
    }
    
    k.d a()
    {
      return a;
    }
    
    k.d a(k.d paramD)
    {
      return c;
    }
  }
  
  static final class d
  {
    Object a;
    d b;
    d c;
    
    d(Object paramObject)
    {
      a = paramObject;
    }
  }
}
