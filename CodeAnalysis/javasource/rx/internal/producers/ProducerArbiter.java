package rx.internal.producers;

import rx.Producer;

public final class ProducerArbiter
  implements Producer
{
  static final Producer NULL_PRODUCER = new Producer()
  {
    public void request(long paramAnonymousLong) {}
  };
  Producer currentProducer;
  boolean emitting;
  long missedProduced;
  Producer missedProducer;
  long missedRequested;
  long requested;
  
  public ProducerArbiter() {}
  
  public void emitLoop()
  {
    for (;;)
    {
      long l3;
      long l1;
      for (;;)
      {
        long l4;
        try
        {
          l3 = missedRequested;
          l4 = missedProduced;
          Producer localProducer1 = missedProducer;
          if ((l3 == 0L) && (l4 == 0L) && (localProducer1 == null))
          {
            emitting = false;
            return;
          }
          missedRequested = 0L;
          missedProduced = 0L;
          missedProducer = null;
          l2 = requested;
          l1 = l2;
          if (l2 != Long.MAX_VALUE)
          {
            l1 = l2 + l3;
            if ((l1 < 0L) || (l1 == Long.MAX_VALUE))
            {
              l1 = Long.MAX_VALUE;
              requested = Long.MAX_VALUE;
            }
          }
          else
          {
            if (localProducer1 == null) {
              break label185;
            }
            if (localProducer1 != NULL_PRODUCER) {
              break label168;
            }
            currentProducer = null;
            break;
          }
        }
        finally {}
        long l2 = l1 - l4;
        if (l2 < 0L) {
          throw new IllegalStateException("more produced than requested");
        }
        l1 = l2;
        requested = l2;
      }
      label168:
      currentProducer = localObject;
      localObject.request(l1);
      continue;
      label185:
      Producer localProducer2 = currentProducer;
      if ((localProducer2 != null) && (l3 != 0L)) {
        localProducer2.request(l3);
      }
    }
  }
  
  /* Error */
  public void produced(long paramLong)
  {
    // Byte code:
    //   0: lload_1
    //   1: lconst_0
    //   2: lcmp
    //   3: ifgt +13 -> 16
    //   6: new 56	java/lang/IllegalArgumentException
    //   9: dup
    //   10: ldc 58
    //   12: invokespecial 59	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   15: athrow
    //   16: aload_0
    //   17: monitorenter
    //   18: aload_0
    //   19: getfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   22: ifeq +16 -> 38
    //   25: aload_0
    //   26: aload_0
    //   27: getfield 32	rx/internal/producers/ProducerArbiter:missedProduced	J
    //   30: lload_1
    //   31: ladd
    //   32: putfield 32	rx/internal/producers/ProducerArbiter:missedProduced	J
    //   35: aload_0
    //   36: monitorexit
    //   37: return
    //   38: aload_0
    //   39: iconst_1
    //   40: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   43: aload_0
    //   44: monitorexit
    //   45: aload_0
    //   46: getfield 38	rx/internal/producers/ProducerArbiter:requested	J
    //   49: lstore_3
    //   50: lload_3
    //   51: ldc2_w 39
    //   54: lcmp
    //   55: ifeq +53 -> 108
    //   58: lload_3
    //   59: lload_1
    //   60: lsub
    //   61: lstore_1
    //   62: lload_1
    //   63: lconst_0
    //   64: lcmp
    //   65: ifge +38 -> 103
    //   68: new 44	java/lang/IllegalStateException
    //   71: dup
    //   72: ldc 61
    //   74: invokespecial 49	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   77: athrow
    //   78: astore 5
    //   80: iconst_0
    //   81: ifne +12 -> 93
    //   84: aload_0
    //   85: monitorenter
    //   86: aload_0
    //   87: iconst_0
    //   88: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   91: aload_0
    //   92: monitorexit
    //   93: aload 5
    //   95: athrow
    //   96: astore 5
    //   98: aload_0
    //   99: monitorexit
    //   100: aload 5
    //   102: athrow
    //   103: aload_0
    //   104: lload_1
    //   105: putfield 38	rx/internal/producers/ProducerArbiter:requested	J
    //   108: aload_0
    //   109: invokevirtual 63	rx/internal/producers/ProducerArbiter:emitLoop	()V
    //   112: iconst_1
    //   113: ifne +27 -> 140
    //   116: aload_0
    //   117: monitorenter
    //   118: aload_0
    //   119: iconst_0
    //   120: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   123: aload_0
    //   124: monitorexit
    //   125: return
    //   126: astore 5
    //   128: aload_0
    //   129: monitorexit
    //   130: aload 5
    //   132: athrow
    //   133: astore 5
    //   135: aload_0
    //   136: monitorexit
    //   137: aload 5
    //   139: athrow
    //   140: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	141	0	this	ProducerArbiter
    //   0	141	1	paramLong	long
    //   49	10	3	l	long
    //   78	16	5	localObject1	Object
    //   96	5	5	localObject2	Object
    //   126	5	5	localObject3	Object
    //   133	5	5	localObject4	Object
    // Exception table:
    //   from	to	target	type
    //   45	50	78	finally
    //   68	78	78	finally
    //   103	108	78	finally
    //   108	112	78	finally
    //   18	37	96	finally
    //   38	45	96	finally
    //   98	100	96	finally
    //   118	125	126	finally
    //   128	130	126	finally
    //   86	93	133	finally
    //   135	137	133	finally
  }
  
  /* Error */
  public void request(long paramLong)
  {
    // Byte code:
    //   0: lload_1
    //   1: lconst_0
    //   2: lcmp
    //   3: ifge +13 -> 16
    //   6: new 56	java/lang/IllegalArgumentException
    //   9: dup
    //   10: ldc 65
    //   12: invokespecial 59	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   15: athrow
    //   16: lload_1
    //   17: lconst_0
    //   18: lcmp
    //   19: ifne +4 -> 23
    //   22: return
    //   23: aload_0
    //   24: monitorenter
    //   25: aload_0
    //   26: getfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   29: ifeq +23 -> 52
    //   32: aload_0
    //   33: aload_0
    //   34: getfield 30	rx/internal/producers/ProducerArbiter:missedRequested	J
    //   37: lload_1
    //   38: ladd
    //   39: putfield 30	rx/internal/producers/ProducerArbiter:missedRequested	J
    //   42: aload_0
    //   43: monitorexit
    //   44: return
    //   45: astore 7
    //   47: aload_0
    //   48: monitorexit
    //   49: aload 7
    //   51: athrow
    //   52: aload_0
    //   53: iconst_1
    //   54: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   57: aload_0
    //   58: monitorexit
    //   59: aload_0
    //   60: getfield 38	rx/internal/producers/ProducerArbiter:requested	J
    //   63: lload_1
    //   64: ladd
    //   65: lstore 5
    //   67: lload 5
    //   69: lstore_3
    //   70: lload 5
    //   72: lconst_0
    //   73: lcmp
    //   74: ifge +7 -> 81
    //   77: ldc2_w 39
    //   80: lstore_3
    //   81: aload_0
    //   82: lload_3
    //   83: putfield 38	rx/internal/producers/ProducerArbiter:requested	J
    //   86: aload_0
    //   87: getfield 42	rx/internal/producers/ProducerArbiter:currentProducer	Lrx/Producer;
    //   90: astore 7
    //   92: aload 7
    //   94: ifnull +11 -> 105
    //   97: aload 7
    //   99: lload_1
    //   100: invokeinterface 53 3 0
    //   105: aload_0
    //   106: invokevirtual 63	rx/internal/producers/ProducerArbiter:emitLoop	()V
    //   109: iconst_1
    //   110: ifne -88 -> 22
    //   113: aload_0
    //   114: monitorenter
    //   115: aload_0
    //   116: iconst_0
    //   117: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   120: aload_0
    //   121: monitorexit
    //   122: return
    //   123: astore 7
    //   125: aload_0
    //   126: monitorexit
    //   127: aload 7
    //   129: athrow
    //   130: astore 7
    //   132: iconst_0
    //   133: ifne +12 -> 145
    //   136: aload_0
    //   137: monitorenter
    //   138: aload_0
    //   139: iconst_0
    //   140: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   143: aload_0
    //   144: monitorexit
    //   145: aload 7
    //   147: athrow
    //   148: astore 7
    //   150: aload_0
    //   151: monitorexit
    //   152: aload 7
    //   154: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	155	0	this	ProducerArbiter
    //   0	155	1	paramLong	long
    //   69	14	3	l1	long
    //   65	6	5	l2	long
    //   45	5	7	localObject1	Object
    //   90	8	7	localProducer	Producer
    //   123	5	7	localObject2	Object
    //   130	16	7	localObject3	Object
    //   148	5	7	localObject4	Object
    // Exception table:
    //   from	to	target	type
    //   25	44	45	finally
    //   47	49	45	finally
    //   52	59	45	finally
    //   115	122	123	finally
    //   125	127	123	finally
    //   59	67	130	finally
    //   81	92	130	finally
    //   97	105	130	finally
    //   105	109	130	finally
    //   138	145	148	finally
    //   150	152	148	finally
  }
  
  /* Error */
  public void setProducer(Producer paramProducer)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   6: ifeq +21 -> 27
    //   9: aload_1
    //   10: astore_2
    //   11: aload_1
    //   12: ifnonnull +7 -> 19
    //   15: getstatic 25	rx/internal/producers/ProducerArbiter:NULL_PRODUCER	Lrx/Producer;
    //   18: astore_2
    //   19: aload_0
    //   20: aload_2
    //   21: putfield 34	rx/internal/producers/ProducerArbiter:missedProducer	Lrx/Producer;
    //   24: aload_0
    //   25: monitorexit
    //   26: return
    //   27: aload_0
    //   28: iconst_1
    //   29: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   32: aload_0
    //   33: monitorexit
    //   34: aload_0
    //   35: aload_1
    //   36: putfield 42	rx/internal/producers/ProducerArbiter:currentProducer	Lrx/Producer;
    //   39: aload_1
    //   40: ifnull +13 -> 53
    //   43: aload_1
    //   44: aload_0
    //   45: getfield 38	rx/internal/producers/ProducerArbiter:requested	J
    //   48: invokeinterface 53 3 0
    //   53: aload_0
    //   54: invokevirtual 63	rx/internal/producers/ProducerArbiter:emitLoop	()V
    //   57: iconst_1
    //   58: ifne +44 -> 102
    //   61: aload_0
    //   62: monitorenter
    //   63: aload_0
    //   64: iconst_0
    //   65: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   68: aload_0
    //   69: monitorexit
    //   70: return
    //   71: astore_1
    //   72: aload_0
    //   73: monitorexit
    //   74: aload_1
    //   75: athrow
    //   76: astore_1
    //   77: aload_0
    //   78: monitorexit
    //   79: aload_1
    //   80: athrow
    //   81: astore_1
    //   82: iconst_0
    //   83: ifne +12 -> 95
    //   86: aload_0
    //   87: monitorenter
    //   88: aload_0
    //   89: iconst_0
    //   90: putfield 36	rx/internal/producers/ProducerArbiter:emitting	Z
    //   93: aload_0
    //   94: monitorexit
    //   95: aload_1
    //   96: athrow
    //   97: astore_1
    //   98: aload_0
    //   99: monitorexit
    //   100: aload_1
    //   101: athrow
    //   102: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	103	0	this	ProducerArbiter
    //   0	103	1	paramProducer	Producer
    //   10	11	2	localProducer	Producer
    // Exception table:
    //   from	to	target	type
    //   63	70	71	finally
    //   72	74	71	finally
    //   2	9	76	finally
    //   15	19	76	finally
    //   19	26	76	finally
    //   27	34	76	finally
    //   77	79	76	finally
    //   34	39	81	finally
    //   43	53	81	finally
    //   53	57	81	finally
    //   88	95	97	finally
    //   98	100	97	finally
  }
}
