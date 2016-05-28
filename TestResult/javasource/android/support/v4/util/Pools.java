package android.support.v4.util;

public final class Pools
{
  public static abstract interface Pool<T>
  {
    public abstract T acquire();
    
    public abstract boolean release(T paramT);
  }
  
  public static class SimplePool<T>
    implements Pools.Pool<T>
  {
    private final Object[] mPool;
    private int mPoolSize;
    
    public SimplePool(int paramInt)
    {
      if (paramInt <= 0) {
        throw new IllegalArgumentException("The max pool size must be > 0");
      }
      mPool = new Object[paramInt];
    }
    
    private boolean isInPool(T paramT)
    {
      int i = 0;
      while (i < mPoolSize)
      {
        if (mPool[i] == paramT) {
          return true;
        }
        i += 1;
      }
      return false;
    }
    
    public T acquire()
    {
      if (mPoolSize > 0)
      {
        int i = mPoolSize - 1;
        Object localObject = mPool[i];
        mPool[i] = null;
        mPoolSize -= 1;
        return localObject;
      }
      return null;
    }
    
    public boolean release(T paramT)
    {
      if (isInPool(paramT)) {
        throw new IllegalStateException("Already in the pool!");
      }
      if (mPoolSize < mPool.length)
      {
        mPool[mPoolSize] = paramT;
        mPoolSize += 1;
        return true;
      }
      return false;
    }
  }
}
