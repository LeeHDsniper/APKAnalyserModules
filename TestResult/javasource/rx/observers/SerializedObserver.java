package rx.observers;

import rx.Observer;
import rx.exceptions.Exceptions;

public class SerializedObserver<T>
  implements Observer<T>
{
  private static final Object COMPLETE_SENTINEL = new Object();
  private static final Object NULL_SENTINEL = new Object();
  private final Observer<? super T> actual;
  private boolean emitting = false;
  private FastList queue;
  private boolean terminated = false;
  
  public SerializedObserver(Observer<? super T> paramObserver)
  {
    actual = paramObserver;
  }
  
  void drainQueue(FastList paramFastList)
  {
    if ((paramFastList == null) || (size == 0)) {}
    int i;
    label22:
    Object localObject;
    do
    {
      return;
      paramFastList = array;
      int j = paramFastList.length;
      i = 0;
      if (i >= j) {
        break;
      }
      localObject = paramFastList[i];
    } while (localObject == null);
    if (localObject == NULL_SENTINEL) {
      actual.onNext(null);
    }
    for (;;)
    {
      i += 1;
      break label22;
      break;
      if (localObject == COMPLETE_SENTINEL) {
        actual.onCompleted();
      } else if (localObject.getClass() == ErrorSentinel.class) {
        actual.onError(e);
      } else {
        actual.onNext(localObject);
      }
    }
  }
  
  public void onCompleted()
  {
    try
    {
      if (terminated) {
        return;
      }
      terminated = true;
      if (emitting)
      {
        if (queue == null) {
          queue = new FastList();
        }
        queue.add(COMPLETE_SENTINEL);
        return;
      }
    }
    finally {}
    emitting = true;
    FastList localFastList = queue;
    queue = null;
    drainQueue(localFastList);
    actual.onCompleted();
  }
  
  public void onError(Throwable paramThrowable)
  {
    Exceptions.throwIfFatal(paramThrowable);
    try
    {
      if (terminated) {
        return;
      }
      if (emitting)
      {
        if (queue == null) {
          queue = new FastList();
        }
        queue.add(new ErrorSentinel(paramThrowable));
        return;
      }
    }
    finally {}
    emitting = true;
    FastList localFastList = queue;
    queue = null;
    drainQueue(localFastList);
    actual.onError(paramThrowable);
    try
    {
      emitting = false;
      return;
    }
    finally {}
  }
  
  /* Error */
  public void onNext(T paramT)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 39	rx/observers/SerializedObserver:terminated	Z
    //   6: ifeq +6 -> 12
    //   9: aload_0
    //   10: monitorexit
    //   11: return
    //   12: aload_0
    //   13: getfield 37	rx/observers/SerializedObserver:emitting	Z
    //   16: ifeq +52 -> 68
    //   19: aload_0
    //   20: getfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   23: ifnonnull +14 -> 37
    //   26: aload_0
    //   27: new 12	rx/observers/SerializedObserver$FastList
    //   30: dup
    //   31: invokespecial 75	rx/observers/SerializedObserver$FastList:<init>	()V
    //   34: putfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   37: aload_0
    //   38: getfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   41: astore 7
    //   43: aload_1
    //   44: ifnull +17 -> 61
    //   47: aload 7
    //   49: aload_1
    //   50: invokevirtual 78	rx/observers/SerializedObserver$FastList:add	(Ljava/lang/Object;)V
    //   53: aload_0
    //   54: monitorexit
    //   55: return
    //   56: astore_1
    //   57: aload_0
    //   58: monitorexit
    //   59: aload_1
    //   60: athrow
    //   61: getstatic 31	rx/observers/SerializedObserver:NULL_SENTINEL	Ljava/lang/Object;
    //   64: astore_1
    //   65: goto -18 -> 47
    //   68: aload_0
    //   69: iconst_1
    //   70: putfield 37	rx/observers/SerializedObserver:emitting	Z
    //   73: aload_0
    //   74: getfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   77: astore 8
    //   79: aload_0
    //   80: aconst_null
    //   81: putfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   84: aload_0
    //   85: monitorexit
    //   86: iconst_0
    //   87: istore 5
    //   89: iconst_0
    //   90: istore 4
    //   92: ldc 88
    //   94: istore_2
    //   95: iload 5
    //   97: istore_3
    //   98: aload_0
    //   99: aload 8
    //   101: invokevirtual 80	rx/observers/SerializedObserver:drainQueue	(Lrx/observers/SerializedObserver$FastList;)V
    //   104: iload_2
    //   105: ldc 88
    //   107: if_icmpne +16 -> 123
    //   110: iload 5
    //   112: istore_3
    //   113: aload_0
    //   114: getfield 41	rx/observers/SerializedObserver:actual	Lrx/Observer;
    //   117: aload_1
    //   118: invokeinterface 57 2 0
    //   123: iload_2
    //   124: iconst_1
    //   125: isub
    //   126: istore 6
    //   128: aload 8
    //   130: astore 7
    //   132: iload 6
    //   134: ifle +86 -> 220
    //   137: iload 5
    //   139: istore_3
    //   140: aload_0
    //   141: monitorenter
    //   142: iload 4
    //   144: istore_2
    //   145: aload_0
    //   146: getfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   149: astore 7
    //   151: iload 4
    //   153: istore_2
    //   154: aload_0
    //   155: aconst_null
    //   156: putfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   159: aload 7
    //   161: ifnonnull +54 -> 215
    //   164: iload 4
    //   166: istore_2
    //   167: aload_0
    //   168: iconst_0
    //   169: putfield 37	rx/observers/SerializedObserver:emitting	Z
    //   172: iconst_1
    //   173: istore_2
    //   174: aload_0
    //   175: monitorexit
    //   176: iconst_1
    //   177: ifne +153 -> 330
    //   180: aload_0
    //   181: monitorenter
    //   182: aload_0
    //   183: getfield 39	rx/observers/SerializedObserver:terminated	Z
    //   186: ifeq +21 -> 207
    //   189: aload_0
    //   190: getfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   193: astore_1
    //   194: aload_0
    //   195: aconst_null
    //   196: putfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   199: aload_0
    //   200: monitorexit
    //   201: return
    //   202: astore_1
    //   203: aload_0
    //   204: monitorexit
    //   205: aload_1
    //   206: athrow
    //   207: aload_0
    //   208: iconst_0
    //   209: putfield 37	rx/observers/SerializedObserver:emitting	Z
    //   212: goto -13 -> 199
    //   215: iload 4
    //   217: istore_2
    //   218: aload_0
    //   219: monitorexit
    //   220: iload 6
    //   222: istore_2
    //   223: aload 7
    //   225: astore 8
    //   227: iload 6
    //   229: ifgt -134 -> 95
    //   232: aload 7
    //   234: astore_1
    //   235: iconst_0
    //   236: ifne +24 -> 260
    //   239: aload_0
    //   240: monitorenter
    //   241: aload_0
    //   242: getfield 39	rx/observers/SerializedObserver:terminated	Z
    //   245: ifeq +57 -> 302
    //   248: aload_0
    //   249: getfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   252: astore_1
    //   253: aload_0
    //   254: aconst_null
    //   255: putfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   258: aload_0
    //   259: monitorexit
    //   260: aload_0
    //   261: aload_1
    //   262: invokevirtual 80	rx/observers/SerializedObserver:drainQueue	(Lrx/observers/SerializedObserver$FastList;)V
    //   265: return
    //   266: astore_1
    //   267: aload_0
    //   268: monitorexit
    //   269: iload_2
    //   270: istore_3
    //   271: aload_1
    //   272: athrow
    //   273: astore_1
    //   274: iload_3
    //   275: ifne +25 -> 300
    //   278: aload_0
    //   279: monitorenter
    //   280: aload_0
    //   281: getfield 39	rx/observers/SerializedObserver:terminated	Z
    //   284: ifeq +33 -> 317
    //   287: aload_0
    //   288: getfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   291: astore 7
    //   293: aload_0
    //   294: aconst_null
    //   295: putfield 74	rx/observers/SerializedObserver:queue	Lrx/observers/SerializedObserver$FastList;
    //   298: aload_0
    //   299: monitorexit
    //   300: aload_1
    //   301: athrow
    //   302: aload_0
    //   303: iconst_0
    //   304: putfield 37	rx/observers/SerializedObserver:emitting	Z
    //   307: aconst_null
    //   308: astore_1
    //   309: goto -51 -> 258
    //   312: astore_1
    //   313: aload_0
    //   314: monitorexit
    //   315: aload_1
    //   316: athrow
    //   317: aload_0
    //   318: iconst_0
    //   319: putfield 37	rx/observers/SerializedObserver:emitting	Z
    //   322: goto -24 -> 298
    //   325: astore_1
    //   326: aload_0
    //   327: monitorexit
    //   328: aload_1
    //   329: athrow
    //   330: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	331	0	this	SerializedObserver
    //   0	331	1	paramT	T
    //   94	176	2	i	int
    //   97	178	3	j	int
    //   90	126	4	k	int
    //   87	51	5	m	int
    //   126	102	6	n	int
    //   41	251	7	localObject1	Object
    //   77	149	8	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   2	11	56	finally
    //   12	37	56	finally
    //   37	43	56	finally
    //   47	55	56	finally
    //   57	59	56	finally
    //   61	65	56	finally
    //   68	86	56	finally
    //   182	199	202	finally
    //   199	201	202	finally
    //   203	205	202	finally
    //   207	212	202	finally
    //   145	151	266	finally
    //   154	159	266	finally
    //   167	172	266	finally
    //   174	176	266	finally
    //   218	220	266	finally
    //   267	269	266	finally
    //   98	104	273	finally
    //   113	123	273	finally
    //   140	142	273	finally
    //   271	273	273	finally
    //   241	258	312	finally
    //   258	260	312	finally
    //   302	307	312	finally
    //   313	315	312	finally
    //   280	298	325	finally
    //   298	300	325	finally
    //   317	322	325	finally
    //   326	328	325	finally
  }
  
  private static final class ErrorSentinel
  {
    final Throwable e;
    
    ErrorSentinel(Throwable paramThrowable)
    {
      e = paramThrowable;
    }
  }
  
  static final class FastList
  {
    Object[] array;
    int size;
    
    FastList() {}
    
    public void add(Object paramObject)
    {
      int i = size;
      Object[] arrayOfObject2 = array;
      Object[] arrayOfObject1;
      if (arrayOfObject2 == null)
      {
        arrayOfObject1 = new Object[16];
        array = arrayOfObject1;
      }
      for (;;)
      {
        arrayOfObject1[i] = paramObject;
        size = (i + 1);
        return;
        arrayOfObject1 = arrayOfObject2;
        if (i == arrayOfObject2.length)
        {
          arrayOfObject1 = new Object[(i >> 2) + i];
          System.arraycopy(arrayOfObject2, 0, arrayOfObject1, 0, i);
          array = arrayOfObject1;
        }
      }
    }
  }
}
