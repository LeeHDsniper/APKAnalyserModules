package rx.internal.util.unsafe;

import sun.misc.Unsafe;

abstract class SpmcArrayQueueConsumerField<E>
  extends SpmcArrayQueueL2Pad<E>
{
  protected static final long C_INDEX_OFFSET;
  private volatile long consumerIndex;
  
  static
  {
    try
    {
      C_INDEX_OFFSET = UnsafeAccess.UNSAFE.objectFieldOffset(SpmcArrayQueueConsumerField.class.getDeclaredField("consumerIndex"));
      return;
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      throw new RuntimeException(localNoSuchFieldException);
    }
  }
  
  public SpmcArrayQueueConsumerField(int paramInt)
  {
    super(paramInt);
  }
  
  protected final boolean casHead(long paramLong1, long paramLong2)
  {
    return UnsafeAccess.UNSAFE.compareAndSwapLong(this, C_INDEX_OFFSET, paramLong1, paramLong2);
  }
  
  protected final long lvConsumerIndex()
  {
    return consumerIndex;
  }
}
