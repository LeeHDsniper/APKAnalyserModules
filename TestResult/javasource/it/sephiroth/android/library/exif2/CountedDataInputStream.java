package it.sephiroth.android.library.exif2;

import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;

class CountedDataInputStream
  extends FilterInputStream
{
  private final byte[] mByteArray = new byte[8];
  private final ByteBuffer mByteBuffer = ByteBuffer.wrap(mByteArray);
  private int mCount = 0;
  private int mEnd = 0;
  
  static
  {
    if (!CountedDataInputStream.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  protected CountedDataInputStream(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public ByteOrder getByteOrder()
  {
    return mByteBuffer.order();
  }
  
  public int getEnd()
  {
    return mEnd;
  }
  
  public int getReadByteCount()
  {
    return mCount;
  }
  
  public int read()
    throws IOException
  {
    int j = in.read();
    int k = mCount;
    if (j >= 0) {}
    for (int i = 1;; i = 0)
    {
      mCount = (i + k);
      return j;
    }
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    int j = in.read(paramArrayOfByte);
    int k = mCount;
    if (j >= 0) {}
    for (int i = j;; i = 0)
    {
      mCount = (i + k);
      return j;
    }
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    paramInt2 = in.read(paramArrayOfByte, paramInt1, paramInt2);
    int i = mCount;
    if (paramInt2 >= 0) {}
    for (paramInt1 = paramInt2;; paramInt1 = 0)
    {
      mCount = (paramInt1 + i);
      return paramInt2;
    }
  }
  
  public byte readByte()
    throws IOException
  {
    readOrThrow(mByteArray, 0, 1);
    mByteBuffer.rewind();
    return mByteBuffer.get();
  }
  
  public int readInt()
    throws IOException
  {
    readOrThrow(mByteArray, 0, 4);
    mByteBuffer.rewind();
    return mByteBuffer.getInt();
  }
  
  public void readOrThrow(byte[] paramArrayOfByte)
    throws IOException
  {
    readOrThrow(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public void readOrThrow(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (read(paramArrayOfByte, paramInt1, paramInt2) != paramInt2) {
      throw new EOFException();
    }
  }
  
  public short readShort()
    throws IOException
  {
    readOrThrow(mByteArray, 0, 2);
    mByteBuffer.rewind();
    return mByteBuffer.getShort();
  }
  
  public String readString(int paramInt, Charset paramCharset)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInt];
    readOrThrow(arrayOfByte);
    return new String(arrayOfByte, paramCharset);
  }
  
  public int readUnsignedByte()
    throws IOException
  {
    readOrThrow(mByteArray, 0, 1);
    mByteBuffer.rewind();
    return mByteBuffer.get() & 0xFF;
  }
  
  public long readUnsignedInt()
    throws IOException
  {
    return readInt() & 0xFFFFFFFF;
  }
  
  public int readUnsignedShort()
    throws IOException
  {
    return readShort() & 0xFFFF;
  }
  
  public void setByteOrder(ByteOrder paramByteOrder)
  {
    mByteBuffer.order(paramByteOrder);
  }
  
  public void setEnd(int paramInt)
  {
    mEnd = paramInt;
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    paramLong = in.skip(paramLong);
    mCount = ((int)(mCount + paramLong));
    return paramLong;
  }
  
  public void skipOrThrow(long paramLong)
    throws IOException
  {
    if (skip(paramLong) != paramLong) {
      throw new EOFException();
    }
  }
  
  public void skipTo(long paramLong)
    throws IOException
  {
    paramLong -= mCount;
    assert (paramLong >= 0L);
    skipOrThrow(paramLong);
  }
}
