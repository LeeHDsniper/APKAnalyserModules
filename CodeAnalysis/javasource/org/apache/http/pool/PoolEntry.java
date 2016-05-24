package org.apache.http.pool;

import java.util.concurrent.TimeUnit;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@ThreadSafe
public abstract class PoolEntry<T, C>
{
  private final C conn;
  private final long created;
  @GuardedBy("this")
  private long expiry;
  private final String id;
  private final T route;
  private volatile Object state;
  @GuardedBy("this")
  private long updated;
  private final long validUnit;
  
  public PoolEntry(String paramString, T paramT, C paramC)
  {
    this(paramString, paramT, paramC, 0L, TimeUnit.MILLISECONDS);
  }
  
  public PoolEntry(String paramString, T paramT, C paramC, long paramLong, TimeUnit paramTimeUnit)
  {
    Args.notNull(paramT, "Route");
    Args.notNull(paramC, "Connection");
    Args.notNull(paramTimeUnit, "Time unit");
    id = paramString;
    route = paramT;
    conn = paramC;
    created = System.currentTimeMillis();
    if (paramLong > 0L) {}
    for (validUnit = (created + paramTimeUnit.toMillis(paramLong));; validUnit = Long.MAX_VALUE)
    {
      expiry = validUnit;
      return;
    }
  }
  
  public abstract void close();
  
  public C getConnection()
  {
    return conn;
  }
  
  public long getCreated()
  {
    return created;
  }
  
  public long getExpiry()
  {
    try
    {
      long l = expiry;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public String getId()
  {
    return id;
  }
  
  public T getRoute()
  {
    return route;
  }
  
  public Object getState()
  {
    return state;
  }
  
  public long getUpdated()
  {
    try
    {
      long l = updated;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public long getValidUnit()
  {
    return validUnit;
  }
  
  public abstract boolean isClosed();
  
  /* Error */
  public boolean isExpired(long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 73	org/apache/http/pool/PoolEntry:expiry	J
    //   6: lstore_3
    //   7: lload_1
    //   8: lload_3
    //   9: lcmp
    //   10: iflt +11 -> 21
    //   13: iconst_1
    //   14: istore 5
    //   16: aload_0
    //   17: monitorexit
    //   18: iload 5
    //   20: ireturn
    //   21: iconst_0
    //   22: istore 5
    //   24: goto -8 -> 16
    //   27: astore 6
    //   29: aload_0
    //   30: monitorexit
    //   31: aload 6
    //   33: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	34	0	this	PoolEntry
    //   0	34	1	paramLong	long
    //   6	3	3	l	long
    //   14	9	5	bool	boolean
    //   27	5	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	27	finally
  }
  
  public void setState(Object paramObject)
  {
    state = paramObject;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[id:");
    localStringBuilder.append(id);
    localStringBuilder.append("][route:");
    localStringBuilder.append(route);
    localStringBuilder.append("][state:");
    localStringBuilder.append(state);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
  
  /* Error */
  public void updateExpiry(long paramLong, TimeUnit paramTimeUnit)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_3
    //   3: ldc 51
    //   5: invokestatic 47	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   8: pop
    //   9: aload_0
    //   10: invokestatic 63	java/lang/System:currentTimeMillis	()J
    //   13: putfield 92	org/apache/http/pool/PoolEntry:updated	J
    //   16: lload_1
    //   17: lconst_0
    //   18: lcmp
    //   19: ifle +29 -> 48
    //   22: aload_0
    //   23: getfield 92	org/apache/http/pool/PoolEntry:updated	J
    //   26: aload_3
    //   27: lload_1
    //   28: invokevirtual 69	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   31: ladd
    //   32: lstore_1
    //   33: aload_0
    //   34: lload_1
    //   35: aload_0
    //   36: getfield 71	org/apache/http/pool/PoolEntry:validUnit	J
    //   39: invokestatic 128	java/lang/Math:min	(JJ)J
    //   42: putfield 73	org/apache/http/pool/PoolEntry:expiry	J
    //   45: aload_0
    //   46: monitorexit
    //   47: return
    //   48: ldc2_w 74
    //   51: lstore_1
    //   52: goto -19 -> 33
    //   55: astore_3
    //   56: aload_0
    //   57: monitorexit
    //   58: aload_3
    //   59: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	60	0	this	PoolEntry
    //   0	60	1	paramLong	long
    //   0	60	3	paramTimeUnit	TimeUnit
    // Exception table:
    //   from	to	target	type
    //   2	16	55	finally
    //   22	33	55	finally
    //   33	45	55	finally
  }
}
