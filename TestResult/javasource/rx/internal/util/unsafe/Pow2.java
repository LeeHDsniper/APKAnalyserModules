package rx.internal.util.unsafe;

public final class Pow2
{
  public static int roundToPowerOfTwo(int paramInt)
  {
    return 1 << 32 - Integer.numberOfLeadingZeros(paramInt - 1);
  }
}
