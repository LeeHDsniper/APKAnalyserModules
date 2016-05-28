package rx.internal.util.unsafe;

abstract class SpscArrayQueueColdField<E>
  extends ConcurrentCircularArrayQueue<E>
{
  private static final Integer MAX_LOOK_AHEAD_STEP = Integer.getInteger("jctools.spsc.max.lookahead.step", 4096);
  protected final int lookAheadStep;
  
  public SpscArrayQueueColdField(int paramInt)
  {
    super(paramInt);
    lookAheadStep = Math.min(paramInt / 4, MAX_LOOK_AHEAD_STEP.intValue());
  }
}
