package okio;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class Buffer
  implements Cloneable, BufferedSink, BufferedSource
{
  Segment head;
  long size;
  
  public Buffer() {}
  
  public Buffer buffer()
  {
    return this;
  }
  
  public void clear()
  {
    try
    {
      skip(size);
      return;
    }
    catch (EOFException localEOFException)
    {
      throw new AssertionError(localEOFException);
    }
  }
  
  public Buffer clone()
  {
    Buffer localBuffer = new Buffer();
    if (size == 0L) {}
    for (;;)
    {
      return localBuffer;
      localBuffer.write(head.data, head.pos, head.limit - head.pos);
      for (Segment localSegment = head.next; localSegment != head; localSegment = next) {
        localBuffer.write(data, pos, limit - pos);
      }
    }
  }
  
  public void close() {}
  
  public long completeSegmentByteCount()
  {
    long l2 = size;
    if (l2 == 0L) {
      return 0L;
    }
    Segment localSegment = head.prev;
    long l1 = l2;
    if (limit < 2048) {
      l1 = l2 - (limit - pos);
    }
    return l1;
  }
  
  public Buffer emitCompleteSegments()
  {
    return this;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if (!(paramObject instanceof Buffer)) {
      return false;
    }
    paramObject = (Buffer)paramObject;
    if (size != size) {
      return false;
    }
    if (size == 0L) {
      return true;
    }
    Segment localSegment = head;
    paramObject = head;
    int i = pos;
    int j = pos;
    long l1 = 0L;
    long l2;
    int k;
    if (l1 < size)
    {
      l2 = Math.min(limit - i, limit - j);
      int m = 0;
      k = i;
      i = j;
      j = k;
      k = m;
      while (k < l2)
      {
        if (data[j] != data[i]) {
          return false;
        }
        k += 1;
        i += 1;
        j += 1;
      }
      if (j != limit) {
        break label223;
      }
      localSegment = next;
      j = pos;
    }
    label223:
    for (;;)
    {
      if (i == limit) {
        paramObject = next;
      }
      for (k = pos;; k = i)
      {
        l1 += l2;
        i = j;
        j = k;
        break;
        return true;
      }
    }
  }
  
  public boolean exhausted()
  {
    return size == 0L;
  }
  
  public void flush() {}
  
  public byte getByte(long paramLong)
  {
    Util.checkOffsetAndCount(size, paramLong, 1L);
    for (Segment localSegment = head;; localSegment = next)
    {
      int i = limit - pos;
      if (paramLong < i) {
        return data[(pos + (int)paramLong)];
      }
      paramLong -= i;
    }
  }
  
  public int hashCode()
  {
    Object localObject = head;
    if (localObject == null) {
      return 0;
    }
    int j = 1;
    int i;
    Segment localSegment;
    do
    {
      int k = pos;
      int m = limit;
      i = j;
      j = k;
      while (j < m)
      {
        i = i * 31 + data[j];
        j += 1;
      }
      localSegment = next;
      j = i;
      localObject = localSegment;
    } while (localSegment != head);
    return i;
  }
  
  public long indexOf(byte paramByte)
  {
    return indexOf(paramByte, 0L);
  }
  
  public long indexOf(byte paramByte, long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("fromIndex < 0");
    }
    Object localObject1 = head;
    if (localObject1 == null) {
      return -1L;
    }
    long l1 = 0L;
    int i = limit - pos;
    if (paramLong >= i) {}
    for (paramLong -= i;; paramLong = 0L)
    {
      l1 += i;
      Object localObject2 = next;
      localObject1 = localObject2;
      if (localObject2 != head) {
        break;
      }
      return -1L;
      localObject2 = data;
      paramLong = pos + paramLong;
      long l2 = limit;
      while (paramLong < l2)
      {
        if (localObject2[((int)paramLong)] == paramByte) {
          return l1 + paramLong - pos;
        }
        paramLong += 1L;
      }
    }
  }
  
  public InputStream inputStream()
  {
    new InputStream()
    {
      public int available()
      {
        return (int)Math.min(size, 2147483647L);
      }
      
      public void close() {}
      
      public int read()
      {
        if (size > 0L) {
          return readByte() & 0xFF;
        }
        return -1;
      }
      
      public int read(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        return Buffer.this.read(paramAnonymousArrayOfByte, paramAnonymousInt1, paramAnonymousInt2);
      }
      
      public String toString()
      {
        return Buffer.this + ".inputStream()";
      }
    };
  }
  
  public OutputStream outputStream()
  {
    new OutputStream()
    {
      public void close() {}
      
      public void flush() {}
      
      public String toString()
      {
        return this + ".outputStream()";
      }
      
      public void write(int paramAnonymousInt)
      {
        writeByte((byte)paramAnonymousInt);
      }
      
      public void write(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        write(paramAnonymousArrayOfByte, paramAnonymousInt1, paramAnonymousInt2);
      }
    };
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    Util.checkOffsetAndCount(paramArrayOfByte.length, paramInt1, paramInt2);
    Segment localSegment = head;
    if (localSegment == null) {
      paramInt1 = -1;
    }
    do
    {
      return paramInt1;
      paramInt2 = Math.min(paramInt2, limit - pos);
      System.arraycopy(data, pos, paramArrayOfByte, paramInt1, paramInt2);
      pos += paramInt2;
      size -= paramInt2;
      paramInt1 = paramInt2;
    } while (pos != limit);
    head = localSegment.pop();
    SegmentPool.INSTANCE.recycle(localSegment);
    return paramInt2;
  }
  
  public long read(Buffer paramBuffer, long paramLong)
  {
    if (paramBuffer == null) {
      throw new IllegalArgumentException("sink == null");
    }
    if (paramLong < 0L) {
      throw new IllegalArgumentException("byteCount < 0: " + paramLong);
    }
    if (size == 0L) {
      return -1L;
    }
    long l = paramLong;
    if (paramLong > size) {
      l = size;
    }
    paramBuffer.write(this, l);
    return l;
  }
  
  public byte readByte()
  {
    if (size == 0L) {
      throw new IllegalStateException("size == 0");
    }
    Segment localSegment = head;
    int i = pos;
    int j = limit;
    byte[] arrayOfByte = data;
    int k = i + 1;
    byte b = arrayOfByte[i];
    size -= 1L;
    if (k == j)
    {
      head = localSegment.pop();
      SegmentPool.INSTANCE.recycle(localSegment);
      return b;
    }
    pos = k;
    return b;
  }
  
  public byte[] readByteArray()
  {
    try
    {
      byte[] arrayOfByte = readByteArray(size);
      return arrayOfByte;
    }
    catch (EOFException localEOFException)
    {
      throw new AssertionError(localEOFException);
    }
  }
  
  public byte[] readByteArray(long paramLong)
    throws EOFException
  {
    Util.checkOffsetAndCount(size, 0L, paramLong);
    if (paramLong > 2147483647L) {
      throw new IllegalArgumentException("byteCount > Integer.MAX_VALUE: " + paramLong);
    }
    byte[] arrayOfByte = new byte[(int)paramLong];
    readFully(arrayOfByte);
    return arrayOfByte;
  }
  
  public ByteString readByteString()
  {
    return new ByteString(readByteArray());
  }
  
  public ByteString readByteString(long paramLong)
    throws EOFException
  {
    return new ByteString(readByteArray(paramLong));
  }
  
  public void readFully(byte[] paramArrayOfByte)
    throws EOFException
  {
    int i = 0;
    while (i < paramArrayOfByte.length)
    {
      int j = read(paramArrayOfByte, i, paramArrayOfByte.length - i);
      if (j == -1) {
        throw new EOFException();
      }
      i += j;
    }
  }
  
  public int readInt()
  {
    if (size < 4L) {
      throw new IllegalStateException("size < 4: " + size);
    }
    Segment localSegment = head;
    int j = pos;
    int i = limit;
    if (i - j < 4) {
      return (readByte() & 0xFF) << 24 | (readByte() & 0xFF) << 16 | (readByte() & 0xFF) << 8 | readByte() & 0xFF;
    }
    byte[] arrayOfByte = data;
    int k = j + 1;
    j = arrayOfByte[j];
    int n = k + 1;
    k = arrayOfByte[k];
    int m = n + 1;
    int i1 = arrayOfByte[n];
    n = m + 1;
    j = (j & 0xFF) << 24 | (k & 0xFF) << 16 | (i1 & 0xFF) << 8 | arrayOfByte[m] & 0xFF;
    size -= 4L;
    if (n == i)
    {
      head = localSegment.pop();
      SegmentPool.INSTANCE.recycle(localSegment);
      return j;
    }
    pos = n;
    return j;
  }
  
  public int readIntLe()
  {
    return Util.reverseBytesInt(readInt());
  }
  
  public short readShort()
  {
    if (size < 2L) {
      throw new IllegalStateException("size < 2: " + size);
    }
    Segment localSegment = head;
    int k = pos;
    int i = limit;
    if (i - k < 2) {
      return (short)((readByte() & 0xFF) << 8 | readByte() & 0xFF);
    }
    byte[] arrayOfByte = data;
    int j = k + 1;
    k = arrayOfByte[k];
    int m = j + 1;
    j = arrayOfByte[j];
    size -= 2L;
    if (m == i)
    {
      head = localSegment.pop();
      SegmentPool.INSTANCE.recycle(localSegment);
    }
    for (;;)
    {
      return (short)((k & 0xFF) << 8 | j & 0xFF);
      pos = m;
    }
  }
  
  public short readShortLe()
  {
    return Util.reverseBytesShort(readShort());
  }
  
  public String readString(long paramLong, Charset paramCharset)
    throws EOFException
  {
    Util.checkOffsetAndCount(size, 0L, paramLong);
    if (paramCharset == null) {
      throw new IllegalArgumentException("charset == null");
    }
    if (paramLong > 2147483647L) {
      throw new IllegalArgumentException("byteCount > Integer.MAX_VALUE: " + paramLong);
    }
    if (paramLong == 0L) {
      paramCharset = "";
    }
    Segment localSegment;
    String str;
    do
    {
      return paramCharset;
      localSegment = head;
      if (pos + paramLong > limit) {
        return new String(readByteArray(paramLong), paramCharset);
      }
      str = new String(data, pos, (int)paramLong, paramCharset);
      pos = ((int)(pos + paramLong));
      size -= paramLong;
      paramCharset = str;
    } while (pos != limit);
    head = localSegment.pop();
    SegmentPool.INSTANCE.recycle(localSegment);
    return str;
  }
  
  public String readUtf8(long paramLong)
    throws EOFException
  {
    return readString(paramLong, Util.UTF_8);
  }
  
  String readUtf8Line(long paramLong)
    throws EOFException
  {
    if ((paramLong > 0L) && (getByte(paramLong - 1L) == 13))
    {
      str = readUtf8(paramLong - 1L);
      skip(2L);
      return str;
    }
    String str = readUtf8(paramLong);
    skip(1L);
    return str;
  }
  
  public String readUtf8LineStrict()
    throws EOFException
  {
    long l = indexOf((byte)10);
    if (l == -1L) {
      throw new EOFException();
    }
    return readUtf8Line(l);
  }
  
  public void require(long paramLong)
    throws EOFException
  {
    if (size < paramLong) {
      throw new EOFException();
    }
  }
  
  public long size()
  {
    return size;
  }
  
  public void skip(long paramLong)
    throws EOFException
  {
    while (paramLong > 0L)
    {
      if (head == null) {
        throw new EOFException();
      }
      int i = (int)Math.min(paramLong, head.limit - head.pos);
      size -= i;
      long l = paramLong - i;
      Segment localSegment = head;
      pos += i;
      paramLong = l;
      if (head.pos == head.limit)
      {
        localSegment = head;
        head = localSegment.pop();
        SegmentPool.INSTANCE.recycle(localSegment);
        paramLong = l;
      }
    }
  }
  
  public Timeout timeout()
  {
    return Timeout.NONE;
  }
  
  public String toString()
  {
    if (size == 0L) {
      return "Buffer[size=0]";
    }
    Object localObject;
    if (size <= 16L)
    {
      localObject = clone().readByteString();
      return String.format("Buffer[size=%s data=%s]", new Object[] { Long.valueOf(size), ((ByteString)localObject).hex() });
    }
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
      localMessageDigest.update(head.data, head.pos, head.limit - head.pos);
      for (localObject = head.next; localObject != head; localObject = next) {
        localMessageDigest.update(data, pos, limit - pos);
      }
      localObject = String.format("Buffer[size=%s md5=%s]", new Object[] { Long.valueOf(size), ByteString.of(localMessageDigest.digest()).hex() });
      return localObject;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new AssertionError();
    }
  }
  
  Segment writableSegment(int paramInt)
  {
    if ((paramInt < 1) || (paramInt > 2048)) {
      throw new IllegalArgumentException();
    }
    Segment localSegment2;
    Segment localSegment1;
    if (head == null)
    {
      head = SegmentPool.INSTANCE.take();
      localSegment2 = head;
      Segment localSegment3 = head;
      localSegment1 = head;
      prev = localSegment1;
      next = localSegment1;
    }
    do
    {
      return localSegment1;
      localSegment2 = head.prev;
      localSegment1 = localSegment2;
    } while (limit + paramInt <= 2048);
    return localSegment2.push(SegmentPool.INSTANCE.take());
  }
  
  public Buffer write(ByteString paramByteString)
  {
    if (paramByteString == null) {
      throw new IllegalArgumentException("byteString == null");
    }
    return write(data, 0, data.length);
  }
  
  public Buffer write(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      throw new IllegalArgumentException("source == null");
    }
    return write(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public Buffer write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramArrayOfByte == null) {
      throw new IllegalArgumentException("source == null");
    }
    Util.checkOffsetAndCount(paramArrayOfByte.length, paramInt1, paramInt2);
    int i = paramInt1 + paramInt2;
    while (paramInt1 < i)
    {
      Segment localSegment = writableSegment(1);
      int j = Math.min(i - paramInt1, 2048 - limit);
      System.arraycopy(paramArrayOfByte, paramInt1, data, limit, j);
      paramInt1 += j;
      limit += j;
    }
    size += paramInt2;
    return this;
  }
  
  public void write(Buffer paramBuffer, long paramLong)
  {
    if (paramBuffer == null) {
      throw new IllegalArgumentException("source == null");
    }
    if (paramBuffer == this) {
      throw new IllegalArgumentException("source == this");
    }
    Util.checkOffsetAndCount(size, 0L, paramLong);
    Segment localSegment1;
    label83:
    long l;
    if (paramLong > 0L) {
      if (paramLong < head.limit - head.pos)
      {
        if (head != null)
        {
          localSegment1 = head.prev;
          if ((localSegment1 != null) && (limit - pos + paramLong <= 2048L)) {
            break label232;
          }
          head = head.split((int)paramLong);
        }
      }
      else
      {
        localSegment1 = head;
        l = limit - pos;
        head = localSegment1.pop();
        if (head != null) {
          break label264;
        }
        head = localSegment1;
        localSegment1 = head;
        Segment localSegment2 = head;
        Segment localSegment3 = head;
        prev = localSegment3;
        next = localSegment3;
      }
    }
    for (;;)
    {
      size -= l;
      size += l;
      paramLong -= l;
      break;
      localSegment1 = null;
      break label83;
      label232:
      head.writeTo(localSegment1, (int)paramLong);
      size -= paramLong;
      size += paramLong;
      return;
      label264:
      head.prev.push(localSegment1).compact();
    }
  }
  
  public long writeAll(Source paramSource)
    throws IOException
  {
    if (paramSource == null) {
      throw new IllegalArgumentException("source == null");
    }
    long l2;
    for (long l1 = 0L;; l1 += l2)
    {
      l2 = paramSource.read(this, 2048L);
      if (l2 == -1L) {
        break;
      }
    }
    return l1;
  }
  
  public Buffer writeByte(int paramInt)
  {
    Segment localSegment = writableSegment(1);
    byte[] arrayOfByte = data;
    int i = limit;
    limit = (i + 1);
    arrayOfByte[i] = ((byte)paramInt);
    size += 1L;
    return this;
  }
  
  public Buffer writeInt(int paramInt)
  {
    Segment localSegment = writableSegment(4);
    byte[] arrayOfByte = data;
    int j = limit;
    int i = j + 1;
    arrayOfByte[j] = ((byte)(paramInt >>> 24 & 0xFF));
    j = i + 1;
    arrayOfByte[i] = ((byte)(paramInt >>> 16 & 0xFF));
    i = j + 1;
    arrayOfByte[j] = ((byte)(paramInt >>> 8 & 0xFF));
    arrayOfByte[i] = ((byte)(paramInt & 0xFF));
    limit = (i + 1);
    size += 4L;
    return this;
  }
  
  public Buffer writeShort(int paramInt)
  {
    Segment localSegment = writableSegment(2);
    byte[] arrayOfByte = data;
    int i = limit;
    int j = i + 1;
    arrayOfByte[i] = ((byte)(paramInt >>> 8 & 0xFF));
    arrayOfByte[j] = ((byte)(paramInt & 0xFF));
    limit = (j + 1);
    size += 2L;
    return this;
  }
  
  public Buffer writeString(String paramString, Charset paramCharset)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("string == null");
    }
    if (paramCharset == null) {
      throw new IllegalArgumentException("charset == null");
    }
    paramString = paramString.getBytes(paramCharset);
    return write(paramString, 0, paramString.length);
  }
  
  public Buffer writeUtf8(String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("string == null");
    }
    return writeString(paramString, Util.UTF_8);
  }
}
