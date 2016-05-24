package rx.internal.util.unsafe;

abstract class MpmcArrayQueueL1Pad<E>
  extends ConcurrentSequencedCircularArrayQueue<E>
{
  public MpmcArrayQueueL1Pad(int paramInt)
  {
    super(paramInt);
  }
}
