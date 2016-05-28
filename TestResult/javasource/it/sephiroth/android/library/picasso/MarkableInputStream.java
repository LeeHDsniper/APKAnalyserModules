package it.sephiroth.android.library.picasso;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

final class MarkableInputStream
  extends InputStream
{
  private boolean allowExpire = true;
  private long defaultMark = -1L;
  private final InputStream in;
  private long limit;
  private int limitIncrement = -1;
  private long offset;
  private long reset;
  
  public MarkableInputStream(InputStream paramInputStream)
  {
    this(paramInputStream, 4096);
  }
  
  public MarkableInputStream(InputStream paramInputStream, int paramInt)
  {
    this(paramInputStream, paramInt, 1024);
  }
  
  private MarkableInputStream(InputStream paramInputStream, int paramInt1, int paramInt2)
  {
    Object localObject = paramInputStream;
    if (!paramInputStream.markSupported()) {
      localObject = new BufferedInputStream(paramInputStream, paramInt1);
    }
    in = ((InputStream)localObject);
    limitIncrement = paramInt2;
  }
  
  /* Error */
  private void setLimit(long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 50	it/sephiroth/android/library/picasso/MarkableInputStream:reset	J
    //   4: aload_0
    //   5: getfield 52	it/sephiroth/android/library/picasso/MarkableInputStream:offset	J
    //   8: lcmp
    //   9: ifge +54 -> 63
    //   12: aload_0
    //   13: getfield 52	it/sephiroth/android/library/picasso/MarkableInputStream:offset	J
    //   16: aload_0
    //   17: getfield 54	it/sephiroth/android/library/picasso/MarkableInputStream:limit	J
    //   20: lcmp
    //   21: ifgt +42 -> 63
    //   24: aload_0
    //   25: getfield 44	it/sephiroth/android/library/picasso/MarkableInputStream:in	Ljava/io/InputStream;
    //   28: invokevirtual 56	java/io/InputStream:reset	()V
    //   31: aload_0
    //   32: getfield 44	it/sephiroth/android/library/picasso/MarkableInputStream:in	Ljava/io/InputStream;
    //   35: lload_1
    //   36: aload_0
    //   37: getfield 50	it/sephiroth/android/library/picasso/MarkableInputStream:reset	J
    //   40: lsub
    //   41: l2i
    //   42: invokevirtual 60	java/io/InputStream:mark	(I)V
    //   45: aload_0
    //   46: aload_0
    //   47: getfield 50	it/sephiroth/android/library/picasso/MarkableInputStream:reset	J
    //   50: aload_0
    //   51: getfield 52	it/sephiroth/android/library/picasso/MarkableInputStream:offset	J
    //   54: invokespecial 64	it/sephiroth/android/library/picasso/MarkableInputStream:skip	(JJ)V
    //   57: aload_0
    //   58: lload_1
    //   59: putfield 54	it/sephiroth/android/library/picasso/MarkableInputStream:limit	J
    //   62: return
    //   63: aload_0
    //   64: aload_0
    //   65: getfield 52	it/sephiroth/android/library/picasso/MarkableInputStream:offset	J
    //   68: putfield 50	it/sephiroth/android/library/picasso/MarkableInputStream:reset	J
    //   71: aload_0
    //   72: getfield 44	it/sephiroth/android/library/picasso/MarkableInputStream:in	Ljava/io/InputStream;
    //   75: lload_1
    //   76: aload_0
    //   77: getfield 52	it/sephiroth/android/library/picasso/MarkableInputStream:offset	J
    //   80: lsub
    //   81: l2i
    //   82: invokevirtual 60	java/io/InputStream:mark	(I)V
    //   85: goto -28 -> 57
    //   88: astore_3
    //   89: new 66	java/lang/IllegalStateException
    //   92: dup
    //   93: new 68	java/lang/StringBuilder
    //   96: dup
    //   97: invokespecial 69	java/lang/StringBuilder:<init>	()V
    //   100: ldc 71
    //   102: invokevirtual 75	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   105: aload_3
    //   106: invokevirtual 78	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   109: invokevirtual 82	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   112: invokespecial 85	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   115: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	116	0	this	MarkableInputStream
    //   0	116	1	paramLong	long
    //   88	18	3	localIOException	IOException
    // Exception table:
    //   from	to	target	type
    //   0	57	88	java/io/IOException
    //   57	62	88	java/io/IOException
    //   63	85	88	java/io/IOException
  }
  
  private void skip(long paramLong1, long paramLong2)
    throws IOException
  {
    for (;;)
    {
      if (paramLong1 < paramLong2)
      {
        long l2 = in.skip(paramLong2 - paramLong1);
        l1 = l2;
        if (l2 != 0L) {
          break label41;
        }
        if (read() != -1) {}
      }
      else
      {
        return;
      }
      long l1 = 1L;
      label41:
      paramLong1 += l1;
    }
  }
  
  public void allowMarksToExpire(boolean paramBoolean)
  {
    allowExpire = paramBoolean;
  }
  
  public int available()
    throws IOException
  {
    return in.available();
  }
  
  public void close()
    throws IOException
  {
    in.close();
  }
  
  public void mark(int paramInt)
  {
    defaultMark = savePosition(paramInt);
  }
  
  public boolean markSupported()
  {
    return in.markSupported();
  }
  
  public int read()
    throws IOException
  {
    if ((!allowExpire) && (offset + 1L > limit)) {
      setLimit(limit + limitIncrement);
    }
    int i = in.read();
    if (i != -1) {
      offset += 1L;
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    if ((!allowExpire) && (offset + paramArrayOfByte.length > limit)) {
      setLimit(offset + paramArrayOfByte.length + limitIncrement);
    }
    int i = in.read(paramArrayOfByte);
    if (i != -1) {
      offset += i;
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if ((!allowExpire) && (offset + paramInt2 > limit)) {
      setLimit(offset + paramInt2 + limitIncrement);
    }
    paramInt1 = in.read(paramArrayOfByte, paramInt1, paramInt2);
    if (paramInt1 != -1) {
      offset += paramInt1;
    }
    return paramInt1;
  }
  
  public void reset()
    throws IOException
  {
    reset(defaultMark);
  }
  
  public void reset(long paramLong)
    throws IOException
  {
    if ((offset > limit) || (paramLong < reset)) {
      throw new IOException("Cannot reset");
    }
    in.reset();
    skip(reset, paramLong);
    offset = paramLong;
  }
  
  public long savePosition(int paramInt)
  {
    long l = offset + paramInt;
    if (limit < l) {
      setLimit(l);
    }
    return offset;
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    if ((!allowExpire) && (offset + paramLong > limit)) {
      setLimit(offset + paramLong + limitIncrement);
    }
    paramLong = in.skip(paramLong);
    offset += paramLong;
    return paramLong;
  }
}
