package it.sephiroth.android.library.exif2;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

class OrderedDataOutputStream
  extends FilterOutputStream
{
  private final ByteBuffer mByteBuffer = ByteBuffer.allocate(4);
  
  public OrderedDataOutputStream(OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }
  
  public OrderedDataOutputStream setByteOrder(ByteOrder paramByteOrder)
  {
    mByteBuffer.order(paramByteOrder);
    return this;
  }
  
  public OrderedDataOutputStream writeInt(int paramInt)
    throws IOException
  {
    mByteBuffer.rewind();
    mByteBuffer.putInt(paramInt);
    out.write(mByteBuffer.array());
    return this;
  }
  
  public OrderedDataOutputStream writeRational(Rational paramRational)
    throws IOException
  {
    writeInt((int)paramRational.getNumerator());
    writeInt((int)paramRational.getDenominator());
    return this;
  }
  
  public OrderedDataOutputStream writeShort(short paramShort)
    throws IOException
  {
    mByteBuffer.rewind();
    mByteBuffer.putShort(paramShort);
    out.write(mByteBuffer.array(), 0, 2);
    return this;
  }
}
