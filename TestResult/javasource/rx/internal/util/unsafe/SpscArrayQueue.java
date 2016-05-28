package rx.internal.util.unsafe;

import sun.misc.Unsafe;

public final class SpscArrayQueue<E>
  extends SpscArrayQueueL3Pad<E>
{
  public SpscArrayQueue(int paramInt)
  {
    super(paramInt);
  }
  
  private long lvConsumerIndex()
  {
    return UnsafeAccess.UNSAFE.getLongVolatile(this, C_INDEX_OFFSET);
  }
  
  private long lvProducerIndex()
  {
    return UnsafeAccess.UNSAFE.getLongVolatile(this, P_INDEX_OFFSET);
  }
  
  private void soConsumerIndex(long paramLong)
  {
    UnsafeAccess.UNSAFE.putOrderedLong(this, C_INDEX_OFFSET, paramLong);
  }
  
  private void soProducerIndex(long paramLong)
  {
    UnsafeAccess.UNSAFE.putOrderedLong(this, P_INDEX_OFFSET, paramLong);
  }
  
  public boolean offer(E paramE)
  {
    Object[] arrayOfObject = buffer;
    long l1 = producerIndex;
    long l2 = calcElementOffset(l1);
    if (lvElement(arrayOfObject, l2) != null) {
      return false;
    }
    soProducerIndex(1L + l1);
    soElement(arrayOfObject, l2, paramE);
    return true;
  }
  
  public E peek()
  {
    return lvElement(calcElementOffset(consumerIndex));
  }
  
  public E poll()
  {
    long l1 = consumerIndex;
    long l2 = calcElementOffset(l1);
    Object[] arrayOfObject = buffer;
    Object localObject = lvElement(arrayOfObject, l2);
    if (localObject == null) {
      return null;
    }
    soConsumerIndex(1L + l1);
    soElement(arrayOfObject, l2, null);
    return localObject;
  }
  
  public int size()
  {
    long l1 = lvConsumerIndex();
    long l2;
    long l4;
    long l3;
    do
    {
      l2 = l1;
      l4 = lvProducerIndex();
      l3 = lvConsumerIndex();
      l1 = l3;
    } while (l2 != l3);
    return (int)(l4 - l3);
  }
}
