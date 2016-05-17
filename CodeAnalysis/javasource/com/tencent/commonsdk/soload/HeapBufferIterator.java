package com.tencent.commonsdk.soload;

import java.nio.ByteOrder;

public final class HeapBufferIterator
  extends BufferIterator
{
  private final byte[] buffer;
  private final int byteCount;
  private final int offset;
  private final ByteOrder order;
  private int position;
  
  HeapBufferIterator(byte[] paramArrayOfByte, int paramInt1, int paramInt2, ByteOrder paramByteOrder)
  {
    buffer = paramArrayOfByte;
    offset = paramInt1;
    byteCount = paramInt2;
    order = paramByteOrder;
  }
  
  public static HeapBufferIterator iterator(byte[] paramArrayOfByte, int paramInt1, int paramInt2, ByteOrder paramByteOrder)
  {
    return new HeapBufferIterator(paramArrayOfByte, paramInt1, paramInt2, paramByteOrder);
  }
  
  public int readInt()
  {
    int i = Memory.peekInt(buffer, offset + position, order);
    position += 4;
    return i;
  }
  
  public short readShort()
  {
    short s = Memory.peekShort(buffer, offset + position, order);
    position += 2;
    return s;
  }
  
  public void seek(int paramInt)
  {
    position = paramInt;
  }
  
  public void skip(int paramInt)
  {
    position += paramInt;
  }
  
  public final class SizeOf
  {
    public static final int CHAR = 2;
    public static final int DOUBLE = 8;
    public static final int FLOAT = 4;
    public static final int INT = 4;
    public static final int LONG = 8;
    public static final int SHORT = 2;
    
    private SizeOf() {}
  }
}
