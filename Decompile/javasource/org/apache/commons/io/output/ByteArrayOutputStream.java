package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class ByteArrayOutputStream
  extends OutputStream
{
  private static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
  private final List<byte[]> buffers = new ArrayList();
  private int count;
  private byte[] currentBuffer;
  private int currentBufferIndex;
  private int filledBufferSum;
  
  public ByteArrayOutputStream()
  {
    this(1024);
  }
  
  public ByteArrayOutputStream(int paramInt)
  {
    if (paramInt < 0) {
      throw new IllegalArgumentException("Negative initial size: " + paramInt);
    }
    try
    {
      needNewBuffer(paramInt);
      return;
    }
    finally {}
  }
  
  private void needNewBuffer(int paramInt)
  {
    if (currentBufferIndex < buffers.size() - 1)
    {
      filledBufferSum += currentBuffer.length;
      currentBufferIndex += 1;
      currentBuffer = ((byte[])buffers.get(currentBufferIndex));
      return;
    }
    if (currentBuffer == null) {}
    for (filledBufferSum = 0;; filledBufferSum += currentBuffer.length)
    {
      currentBufferIndex += 1;
      currentBuffer = new byte[paramInt];
      buffers.add(currentBuffer);
      return;
      paramInt = Math.max(currentBuffer.length << 1, paramInt - filledBufferSum);
    }
  }
  
  public void close()
    throws IOException
  {}
  
  /* Error */
  public byte[] toByteArray()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 89	org/apache/commons/io/output/ByteArrayOutputStream:count	I
    //   6: istore_1
    //   7: iload_1
    //   8: ifne +13 -> 21
    //   11: getstatic 18	org/apache/commons/io/output/ByteArrayOutputStream:EMPTY_BYTE_ARRAY	[B
    //   14: astore 4
    //   16: aload_0
    //   17: monitorexit
    //   18: aload 4
    //   20: areturn
    //   21: iload_1
    //   22: newarray byte
    //   24: astore 5
    //   26: iconst_0
    //   27: istore_2
    //   28: aload_0
    //   29: getfield 30	org/apache/commons/io/output/ByteArrayOutputStream:buffers	Ljava/util/List;
    //   32: invokeinterface 93 1 0
    //   37: astore 6
    //   39: aload 5
    //   41: astore 4
    //   43: aload 6
    //   45: invokeinterface 99 1 0
    //   50: ifeq -34 -> 16
    //   53: aload 6
    //   55: invokeinterface 103 1 0
    //   60: checkcast 71	[B
    //   63: astore 4
    //   65: aload 4
    //   67: arraylength
    //   68: iload_1
    //   69: invokestatic 106	java/lang/Math:min	(II)I
    //   72: istore_3
    //   73: aload 4
    //   75: iconst_0
    //   76: aload 5
    //   78: iload_2
    //   79: iload_3
    //   80: invokestatic 112	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   83: iload_2
    //   84: iload_3
    //   85: iadd
    //   86: istore_2
    //   87: iload_1
    //   88: iload_3
    //   89: isub
    //   90: istore_3
    //   91: iload_3
    //   92: istore_1
    //   93: iload_3
    //   94: ifne -55 -> 39
    //   97: aload 5
    //   99: astore 4
    //   101: goto -85 -> 16
    //   104: astore 4
    //   106: aload_0
    //   107: monitorexit
    //   108: aload 4
    //   110: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	111	0	this	ByteArrayOutputStream
    //   6	87	1	i	int
    //   27	60	2	j	int
    //   72	22	3	k	int
    //   14	86	4	localObject1	Object
    //   104	5	4	localObject2	Object
    //   24	74	5	arrayOfByte	byte[]
    //   37	17	6	localIterator	java.util.Iterator
    // Exception table:
    //   from	to	target	type
    //   2	7	104	finally
    //   11	16	104	finally
    //   21	26	104	finally
    //   28	39	104	finally
    //   43	83	104	finally
  }
  
  public String toString()
  {
    return new String(toByteArray());
  }
  
  public void write(int paramInt)
  {
    try
    {
      int j = count - filledBufferSum;
      int i = j;
      if (j == currentBuffer.length)
      {
        needNewBuffer(count + 1);
        i = 0;
      }
      currentBuffer[i] = ((byte)paramInt);
      count += 1;
      return;
    }
    finally {}
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if ((paramInt1 < 0) || (paramInt1 > paramArrayOfByte.length) || (paramInt2 < 0) || (paramInt1 + paramInt2 > paramArrayOfByte.length) || (paramInt1 + paramInt2 < 0)) {
      throw new IndexOutOfBoundsException();
    }
    if (paramInt2 == 0) {
      return;
    }
    try
    {
      int m = count + paramInt2;
      int i = paramInt2;
      int j = count - filledBufferSum;
      while (i > 0)
      {
        int k = Math.min(i, currentBuffer.length - j);
        System.arraycopy(paramArrayOfByte, paramInt1 + paramInt2 - i, currentBuffer, j, k);
        k = i - k;
        i = k;
        if (k > 0)
        {
          needNewBuffer(m);
          j = 0;
          i = k;
        }
      }
      count = m;
      return;
    }
    finally {}
  }
}
