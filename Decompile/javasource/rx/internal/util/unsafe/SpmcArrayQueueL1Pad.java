package rx.internal.util.unsafe;

abstract class SpmcArrayQueueL1Pad<E>
  extends ConcurrentCircularArrayQueue<E>
{
  public SpmcArrayQueueL1Pad(int paramInt)
  {
    super(paramInt);
  }
}
