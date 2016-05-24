package okio;

import java.nio.charset.Charset;

final class Util
{
  public static final Charset UTF_8 = Charset.forName("UTF-8");
  
  public static void checkOffsetAndCount(long paramLong1, long paramLong2, long paramLong3)
  {
    if (((paramLong2 | paramLong3) < 0L) || (paramLong2 > paramLong1) || (paramLong1 - paramLong2 < paramLong3)) {
      throw new ArrayIndexOutOfBoundsException(String.format("size=%s offset=%s byteCount=%s", new Object[] { Long.valueOf(paramLong1), Long.valueOf(paramLong2), Long.valueOf(paramLong3) }));
    }
  }
  
  public static int reverseBytesInt(int paramInt)
  {
    return (0xFF000000 & paramInt) >>> 24 | (0xFF0000 & paramInt) >>> 8 | (0xFF00 & paramInt) << 8 | (paramInt & 0xFF) << 24;
  }
  
  public static short reverseBytesShort(short paramShort)
  {
    paramShort &= 0xFFFF;
    return (short)((0xFF00 & paramShort) >>> 8 | (paramShort & 0xFF) << 8);
  }
  
  public static void sneakyRethrow(Throwable paramThrowable)
  {
    sneakyThrow2(paramThrowable);
  }
  
  private static <T extends Throwable> void sneakyThrow2(Throwable paramThrowable)
    throws Throwable
  {
    throw paramThrowable;
  }
}
