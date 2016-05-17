package com.tencent.commonsdk.pool;

public class RecyclablePool
{
  int mCapacity = 0;
  int mCount = 0;
  private Recyclable mHead = new Recyclable();
  
  public RecyclablePool(Class<? extends Recyclable> paramClass, int paramInt)
  {
    for (;;)
    {
      int i;
      synchronized (mHead)
      {
        mCapacity = paramInt;
        mHead.inPool = true;
        i = 0;
        if (i >= paramInt) {}
      }
      try
      {
        Recyclable localRecyclable2 = (Recyclable)paramClass.newInstance();
        inPool = true;
        localRecyclable2.changeNext(mHead.getNext(), false);
        mHead.changeNext(localRecyclable2, false);
        mCount += 1;
        i += 1;
        continue;
        return;
        paramClass = finally;
        throw paramClass;
      }
      catch (Throwable localThrowable)
      {
        for (;;) {}
      }
    }
  }
  
  public Recyclable obtain(Class<? extends Recyclable> paramClass)
  {
    Object localObject1 = null;
    Object localObject2 = null;
    Recyclable localRecyclable;
    if (mCount > 0)
    {
      localRecyclable = mHead;
      localObject1 = localObject2;
    }
    for (;;)
    {
      try
      {
        if (mCount > 0)
        {
          localObject1 = mHead.getNext();
          if (localObject1 == null) {
            mCount = 0;
          }
        }
        else
        {
          localObject2 = localObject1;
          if (localObject1 != null) {}
        }
      }
      finally {}
      try
      {
        localObject2 = (Recyclable)paramClass.newInstance();
        return localObject2;
      }
      catch (Throwable paramClass) {}
      if (!inPool) {
        throw new RuntimeException("WTF");
      }
      mHead.changeNext(next, false);
      inPool = false;
      mCount -= 1;
    }
    return localObject1;
  }
  
  public void recycle(Recyclable paramRecyclable)
  {
    paramRecyclable.recycle();
    if (mCount < mCapacity)
    {
      synchronized (mHead)
      {
        if (inPool) {
          throw new RuntimeException("WTF");
        }
      }
      if (mCount < mCapacity)
      {
        paramRecyclable.changeNext(mHead.getNext(), false);
        mHead.changeNext(paramRecyclable, false);
        inPool = true;
        mCount += 1;
      }
    }
  }
  
  public static class Recyclable
  {
    public boolean inPool;
    private Recyclable next;
    
    public Recyclable() {}
    
    public void changeNext(Recyclable paramRecyclable, boolean paramBoolean)
    {
      if ((inPool) && (paramBoolean)) {
        throw new RuntimeException("WTF");
      }
      next = paramRecyclable;
    }
    
    public Recyclable getNext()
    {
      return next;
    }
    
    public void recycle()
    {
      next = null;
    }
  }
}
