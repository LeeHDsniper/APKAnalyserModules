package rx.internal.util.unsafe;

import sun.misc.Unsafe;

abstract class SpmcArrayQueueProducerField<E>
  extends SpmcArrayQueueL1Pad<E>
{
  protected static final long P_INDEX_OFFSET;
  private volatile long producerIndex;
  
  static
  {
    try
    {
      P_INDEX_OFFSET = UnsafeAccess.UNSAFE.objectFieldOffset(SpmcArrayQueueProducerField.class.getDeclaredField("producerIndex"));
      return;
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      throw new RuntimeException(localNoSuchFieldException);
    }
  }
  
  public SpmcArrayQueueProducerField(int paramInt)
  {
    super(paramInt);
  }
  
  protected final long lvProducerIndex()
  {
    return producerIndex;
  }
  
  protected final void soTail(long paramLong)
  {
    UnsafeAccess.UNSAFE.putOrderedLong(this, P_INDEX_OFFSET, paramLong);
  }
}
