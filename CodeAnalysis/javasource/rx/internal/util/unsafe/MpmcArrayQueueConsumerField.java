package rx.internal.util.unsafe;

import sun.misc.Unsafe;

abstract class MpmcArrayQueueConsumerField<E>
  extends MpmcArrayQueueL2Pad<E>
{
  private static final long C_INDEX_OFFSET;
  private volatile long consumerIndex;
  
  static
  {
    try
    {
      C_INDEX_OFFSET = UnsafeAccess.UNSAFE.objectFieldOffset(MpmcArrayQueueConsumerField.class.getDeclaredField("consumerIndex"));
      return;
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      throw new RuntimeException(localNoSuchFieldException);
    }
  }
  
  public MpmcArrayQueueConsumerField(int paramInt)
  {
    super(paramInt);
  }
  
  protected final boolean casConsumerIndex(long paramLong1, long paramLong2)
  {
    return UnsafeAccess.UNSAFE.compareAndSwapLong(this, C_INDEX_OFFSET, paramLong1, paramLong2);
  }
  
  protected final long lvConsumerIndex()
  {
    return consumerIndex;
  }
}
