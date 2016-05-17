package com.tencent.commonsdk.soload;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteOrder;

class MyZipEntry
  implements MyZipConstants, Cloneable
{
  public static final int DEFLATED = 8;
  public static final int STORED = 0;
  String comment;
  int commentLength = -1;
  long compressedSize = -1L;
  int compressionMethod = -1;
  long crc = -1L;
  int diskNumbers = -1;
  long externalFileAttri = -1L;
  byte[] extra;
  int extraLength = -1;
  int flags = -1;
  boolean hasDD = false;
  int internalFileAttri = -1;
  long mLocContentSize = -1L;
  long mLocalHeaderRelOffset = -1L;
  int modDate = -1;
  String name;
  byte[] nameBytes;
  int nameLength = -1;
  long size = -1L;
  int time = -1;
  int version = -1;
  int versionMinimum = -1;
  
  MyZipEntry(byte[] paramArrayOfByte, InputStream paramInputStream)
    throws IOException
  {
    Streams.readFully(paramInputStream, paramArrayOfByte, 0, paramArrayOfByte.length);
    paramArrayOfByte = HeapBufferIterator.iterator(paramArrayOfByte, 0, paramArrayOfByte.length, ByteOrder.LITTLE_ENDIAN);
    if (paramArrayOfByte.readInt() != 33639248L) {}
    version = paramArrayOfByte.readShort();
    versionMinimum = paramArrayOfByte.readShort();
    flags = paramArrayOfByte.readShort();
    compressionMethod = paramArrayOfByte.readShort();
    time = paramArrayOfByte.readShort();
    modDate = paramArrayOfByte.readShort();
    crc = (paramArrayOfByte.readInt() & 0xFFFFFFFF);
    compressedSize = (paramArrayOfByte.readInt() & 0xFFFFFFFF);
    size = (paramArrayOfByte.readInt() & 0xFFFFFFFF);
    nameLength = paramArrayOfByte.readShort();
    extraLength = paramArrayOfByte.readShort();
    commentLength = paramArrayOfByte.readShort();
    diskNumbers = paramArrayOfByte.readShort();
    internalFileAttri = paramArrayOfByte.readShort();
    externalFileAttri = (paramArrayOfByte.readInt() & 0xFFFFFFFF);
    mLocalHeaderRelOffset = (paramArrayOfByte.readInt() & 0xFFFFFFFF);
    nameBytes = new byte[nameLength];
    Streams.readFully(paramInputStream, nameBytes, 0, nameBytes.length);
    name = new String(nameBytes, 0, nameBytes.length, "UTF-8");
    if (commentLength > 0)
    {
      paramArrayOfByte = new byte[commentLength];
      Streams.readFully(paramInputStream, paramArrayOfByte, 0, commentLength);
      comment = new String(paramArrayOfByte, 0, paramArrayOfByte.length, "UTF-8");
    }
    if (extraLength > 0)
    {
      extra = new byte[extraLength];
      Streams.readFully(paramInputStream, extra, 0, extraLength);
    }
  }
  
  public String getName()
  {
    return name;
  }
  
  public long getSize()
  {
    return size;
  }
  
  public String toString()
  {
    return name;
  }
}
