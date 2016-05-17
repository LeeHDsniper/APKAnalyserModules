package com.tencent.commonsdk.soload;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.ByteOrder;
import java.util.LinkedHashMap;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipException;

class MyZipFile
  implements MyZipConstants
{
  static final int GPBF_DATA_DESCRIPTOR_FLAG = 8;
  static final int GPBF_UTF8_FLAG = 2048;
  public static final int OPEN_DELETE = 4;
  public static final int OPEN_READ = 1;
  private MyZipEntry desentry = null;
  private final String fileName;
  private File fileToDeleteOnClose;
  private String libname;
  private final LinkedHashMap<String, MyZipEntry> mEntries = new LinkedHashMap();
  private RandomAccessFile mRaf;
  
  public MyZipFile(File paramFile, int paramInt, String paramString)
    throws IOException
  {
    libname = paramString;
    fileName = paramFile.getPath();
    if ((paramInt != 1) && (paramInt != 5)) {
      throw new IllegalArgumentException();
    }
    if ((paramInt & 0x4) != 0) {}
    for (fileToDeleteOnClose = paramFile;; fileToDeleteOnClose = null)
    {
      mRaf = new RandomAccessFile(fileName, "r");
      readCentralDir();
      return;
    }
  }
  
  public MyZipFile(File paramFile, String paramString)
    throws ZipException, IOException
  {
    this(paramFile, 1, paramString);
  }
  
  public MyZipFile(String paramString1, String paramString2)
    throws IOException
  {
    this(new File(paramString1), 1, paramString2);
  }
  
  private void checkNotClosed()
  {
    if (mRaf == null) {
      throw new IllegalStateException("Zip file closed");
    }
  }
  
  private void readCentralDir()
    throws IOException
  {
    long l2 = mRaf.length() - 22L;
    if (l2 < 0L) {
      throw new ZipException("too short to be Zip");
    }
    long l3 = l2 - 65536L;
    long l1 = l3;
    if (l3 < 0L) {
      l1 = 0L;
    }
    int j;
    int n;
    do
    {
      mRaf.seek(l2);
      if (Integer.reverseBytes(mRaf.readInt()) == 101010256)
      {
        localObject = new byte[18];
        mRaf.readFully((byte[])localObject);
        localObject = HeapBufferIterator.iterator((byte[])localObject, 0, localObject.length, ByteOrder.LITTLE_ENDIAN);
        i = ((BufferIterator)localObject).readShort();
        int k = ((BufferIterator)localObject).readShort();
        j = ((BufferIterator)localObject).readShort();
        int m = ((BufferIterator)localObject).readShort();
        ((BufferIterator)localObject).skip(4);
        n = ((BufferIterator)localObject).readInt();
        if ((j == m) && (i == 0) && (k == 0)) {
          break;
        }
        throw new ZipException("spanned archives not supported");
      }
      l3 = l2 - 1L;
      l2 = l3;
    } while (l3 >= l1);
    throw new ZipException("EOCD not found; not a Zip archive?");
    Object localObject = new BufferedInputStream(new RAFStream(mRaf, n), 4096);
    byte[] arrayOfByte = new byte[46];
    int i = 0;
    for (;;)
    {
      MyZipEntry localMyZipEntry;
      if (i < j)
      {
        localMyZipEntry = new MyZipEntry(arrayOfByte, (InputStream)localObject);
        mEntries.put(localMyZipEntry.getName(), localMyZipEntry);
        if (localMyZipEntry.getName().equals(libname)) {
          desentry = localMyZipEntry;
        }
      }
      else
      {
        return;
      }
      if (!localMyZipEntry.getName().contains("lib")) {}
      i += 1;
    }
  }
  
  public MyZipEntry getDesEntry()
  {
    return desentry;
  }
  
  public MyZipEntry getEntry(String paramString)
  {
    checkNotClosed();
    if (paramString == null) {
      throw new NullPointerException();
    }
    MyZipEntry localMyZipEntry2 = (MyZipEntry)mEntries.get(paramString);
    MyZipEntry localMyZipEntry1 = localMyZipEntry2;
    if (localMyZipEntry2 == null) {
      localMyZipEntry1 = (MyZipEntry)mEntries.get(paramString + "/");
    }
    return localMyZipEntry1;
  }
  
  public InputStream getInputStream(MyZipEntry arg1)
    throws IOException
  {
    Object localObject1 = getEntry(???.getName());
    if (localObject1 == null) {
      return null;
    }
    synchronized (mRaf)
    {
      RAFStream localRAFStream = new RAFStream(???, mLocalHeaderRelOffset + 28L);
      DataInputStream localDataInputStream = new DataInputStream(localRAFStream);
      int i = Short.reverseBytes(localDataInputStream.readShort());
      localDataInputStream.close();
      localRAFStream.skip(nameLength + i);
      mLength = (mOffset + compressedSize);
      if (compressionMethod == 8)
      {
        i = Math.max(1024, (int)Math.min(((MyZipEntry)localObject1).getSize(), 65535L));
        localObject1 = new ZipInflaterInputStream(localRAFStream, new Inflater(true), i, (MyZipEntry)localObject1);
        return localObject1;
      }
      return localRAFStream;
    }
  }
  
  public String getName()
  {
    return fileName;
  }
  
  static class RAFStream
    extends InputStream
  {
    long mLength;
    long mOffset;
    RandomAccessFile mSharedRaf;
    
    public RAFStream(RandomAccessFile paramRandomAccessFile, long paramLong)
      throws IOException
    {
      mSharedRaf = paramRandomAccessFile;
      mOffset = paramLong;
      mLength = paramRandomAccessFile.length();
    }
    
    public int available()
      throws IOException
    {
      if (mOffset < mLength) {
        return 1;
      }
      return 0;
    }
    
    public int read()
      throws IOException
    {
      return Streams.readSingleByte(this);
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      synchronized (mSharedRaf)
      {
        mSharedRaf.seek(mOffset);
        int i = paramInt2;
        if (paramInt2 > mLength - mOffset) {
          i = (int)(mLength - mOffset);
        }
        paramInt1 = mSharedRaf.read(paramArrayOfByte, paramInt1, i);
        if (paramInt1 > 0)
        {
          mOffset += paramInt1;
          return paramInt1;
        }
        return -1;
      }
    }
    
    public long skip(long paramLong)
      throws IOException
    {
      long l = paramLong;
      if (paramLong > mLength - mOffset) {
        l = mLength - mOffset;
      }
      mOffset += l;
      return l;
    }
  }
  
  static class ZipInflaterInputStream
    extends InflaterInputStream
  {
    long bytesRead = 0L;
    MyZipEntry entry;
    
    public ZipInflaterInputStream(InputStream paramInputStream, Inflater paramInflater, int paramInt, MyZipEntry paramMyZipEntry)
    {
      super(paramInflater, paramInt);
      entry = paramMyZipEntry;
    }
    
    public int available()
      throws IOException
    {
      if (super.available() == 0) {
        return 0;
      }
      return (int)(entry.getSize() - bytesRead);
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      paramInt1 = super.read(paramArrayOfByte, paramInt1, paramInt2);
      if (paramInt1 != -1) {
        bytesRead += paramInt1;
      }
      return paramInt1;
    }
  }
}
