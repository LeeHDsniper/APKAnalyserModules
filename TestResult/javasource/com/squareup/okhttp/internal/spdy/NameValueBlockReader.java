package com.squareup.okhttp.internal.spdy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.ForwardingSource;
import okio.InflaterSource;
import okio.Okio;
import okio.Source;

class NameValueBlockReader
{
  private int compressedLimit;
  private final InflaterSource inflaterSource = new InflaterSource(new ForwardingSource(paramBufferedSource)new Inflater
  {
    public long read(Buffer paramAnonymousBuffer, long paramAnonymousLong)
      throws IOException
    {
      if (compressedLimit == 0) {
        return -1L;
      }
      paramAnonymousLong = super.read(paramAnonymousBuffer, Math.min(paramAnonymousLong, compressedLimit));
      if (paramAnonymousLong == -1L) {
        return -1L;
      }
      NameValueBlockReader.access$022(NameValueBlockReader.this, paramAnonymousLong);
      return paramAnonymousLong;
    }
  }, new Inflater()
  {
    public int inflate(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
      throws DataFormatException
    {
      int j = super.inflate(paramAnonymousArrayOfByte, paramAnonymousInt1, paramAnonymousInt2);
      int i = j;
      if (j == 0)
      {
        i = j;
        if (needsDictionary())
        {
          setDictionary(Spdy3.DICTIONARY);
          i = super.inflate(paramAnonymousArrayOfByte, paramAnonymousInt1, paramAnonymousInt2);
        }
      }
      return i;
    }
  });
  private final BufferedSource source = Okio.buffer(inflaterSource);
  
  public NameValueBlockReader(BufferedSource paramBufferedSource) {}
  
  private void doneReading()
    throws IOException
  {
    if (compressedLimit > 0)
    {
      inflaterSource.refill();
      if (compressedLimit != 0) {
        throw new IOException("compressedLimit > 0: " + compressedLimit);
      }
    }
  }
  
  private ByteString readByteString()
    throws IOException
  {
    int i = source.readInt();
    return source.readByteString(i);
  }
  
  public void close()
    throws IOException
  {
    source.close();
  }
  
  public List<Header> readNameValueBlock(int paramInt)
    throws IOException
  {
    compressedLimit += paramInt;
    int i = source.readInt();
    if (i < 0) {
      throw new IOException("numberOfPairs < 0: " + i);
    }
    if (i > 1024) {
      throw new IOException("numberOfPairs > 1024: " + i);
    }
    ArrayList localArrayList = new ArrayList(i);
    paramInt = 0;
    while (paramInt < i)
    {
      ByteString localByteString1 = readByteString().toAsciiLowercase();
      ByteString localByteString2 = readByteString();
      if (localByteString1.size() == 0) {
        throw new IOException("name.size == 0");
      }
      localArrayList.add(new Header(localByteString1, localByteString2));
      paramInt += 1;
    }
    doneReading();
    return localArrayList;
  }
}
