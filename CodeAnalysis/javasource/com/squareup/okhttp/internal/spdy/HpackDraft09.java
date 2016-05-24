package com.squareup.okhttp.internal.spdy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;
import okio.Source;

final class HpackDraft09
{
  private static final Map<ByteString, Integer> NAME_TO_FIRST_INDEX = nameToFirstIndex();
  private static final Header[] STATIC_HEADER_TABLE = { new Header(Header.TARGET_AUTHORITY, ""), new Header(Header.TARGET_METHOD, "GET"), new Header(Header.TARGET_METHOD, "POST"), new Header(Header.TARGET_PATH, "/"), new Header(Header.TARGET_PATH, "/index.html"), new Header(Header.TARGET_SCHEME, "http"), new Header(Header.TARGET_SCHEME, "https"), new Header(Header.RESPONSE_STATUS, "200"), new Header(Header.RESPONSE_STATUS, "204"), new Header(Header.RESPONSE_STATUS, "206"), new Header(Header.RESPONSE_STATUS, "304"), new Header(Header.RESPONSE_STATUS, "400"), new Header(Header.RESPONSE_STATUS, "404"), new Header(Header.RESPONSE_STATUS, "500"), new Header("accept-charset", ""), new Header("accept-encoding", "gzip, deflate"), new Header("accept-language", ""), new Header("accept-ranges", ""), new Header("accept", ""), new Header("access-control-allow-origin", ""), new Header("age", ""), new Header("allow", ""), new Header("authorization", ""), new Header("cache-control", ""), new Header("content-disposition", ""), new Header("content-encoding", ""), new Header("content-language", ""), new Header("content-length", ""), new Header("content-location", ""), new Header("content-range", ""), new Header("content-type", ""), new Header("cookie", ""), new Header("date", ""), new Header("etag", ""), new Header("expect", ""), new Header("expires", ""), new Header("from", ""), new Header("host", ""), new Header("if-match", ""), new Header("if-modified-since", ""), new Header("if-none-match", ""), new Header("if-range", ""), new Header("if-unmodified-since", ""), new Header("last-modified", ""), new Header("link", ""), new Header("location", ""), new Header("max-forwards", ""), new Header("proxy-authenticate", ""), new Header("proxy-authorization", ""), new Header("range", ""), new Header("referer", ""), new Header("refresh", ""), new Header("retry-after", ""), new Header("server", ""), new Header("set-cookie", ""), new Header("strict-transport-security", ""), new Header("transfer-encoding", ""), new Header("user-agent", ""), new Header("vary", ""), new Header("via", ""), new Header("www-authenticate", "") };
  
  private static ByteString checkLowercase(ByteString paramByteString)
    throws IOException
  {
    int i = 0;
    int j = paramByteString.size();
    while (i < j)
    {
      int k = paramByteString.getByte(i);
      if ((k >= 65) && (k <= 90)) {
        throw new IOException("PROTOCOL_ERROR response malformed: mixed case name: " + paramByteString.utf8());
      }
      i += 1;
    }
    return paramByteString;
  }
  
  private static Map<ByteString, Integer> nameToFirstIndex()
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap(STATIC_HEADER_TABLE.length);
    int i = 0;
    while (i < STATIC_HEADER_TABLE.length)
    {
      if (!localLinkedHashMap.containsKey(STATIC_HEADER_TABLEname)) {
        localLinkedHashMap.put(STATIC_HEADER_TABLEname, Integer.valueOf(i));
      }
      i += 1;
    }
    return Collections.unmodifiableMap(localLinkedHashMap);
  }
  
  static final class Reader
  {
    int headerCount = 0;
    private final List<Header> headerList = new ArrayList();
    Header[] headerTable = new Header[8];
    int headerTableByteCount = 0;
    private int maxHeaderTableByteCount;
    private int maxHeaderTableByteCountSetting;
    int nextHeaderIndex = headerTable.length - 1;
    private final BufferedSource source;
    
    Reader(int paramInt, Source paramSource)
    {
      maxHeaderTableByteCountSetting = paramInt;
      maxHeaderTableByteCount = paramInt;
      source = Okio.buffer(paramSource);
    }
    
    private void adjustHeaderTableByteCount()
    {
      if (maxHeaderTableByteCount < headerTableByteCount)
      {
        if (maxHeaderTableByteCount == 0) {
          clearHeaderTable();
        }
      }
      else {
        return;
      }
      evictToRecoverBytes(headerTableByteCount - maxHeaderTableByteCount);
    }
    
    private void clearHeaderTable()
    {
      headerList.clear();
      Arrays.fill(headerTable, null);
      nextHeaderIndex = (headerTable.length - 1);
      headerCount = 0;
      headerTableByteCount = 0;
    }
    
    private int evictToRecoverBytes(int paramInt)
    {
      int i = 0;
      int k = 0;
      if (paramInt > 0)
      {
        i = headerTable.length - 1;
        int j = paramInt;
        paramInt = k;
        while ((i >= nextHeaderIndex) && (j > 0))
        {
          j -= headerTable[i].hpackSize;
          headerTableByteCount -= headerTable[i].hpackSize;
          headerCount -= 1;
          paramInt += 1;
          i -= 1;
        }
        System.arraycopy(headerTable, nextHeaderIndex + 1, headerTable, nextHeaderIndex + 1 + paramInt, headerCount);
        nextHeaderIndex += paramInt;
        i = paramInt;
      }
      return i;
    }
    
    private ByteString getName(int paramInt)
    {
      if (isStaticHeader(paramInt)) {
        return STATIC_HEADER_TABLEname;
      }
      return headerTable[headerTableIndex(paramInt - HpackDraft09.STATIC_HEADER_TABLE.length)].name;
    }
    
    private int headerTableIndex(int paramInt)
    {
      return nextHeaderIndex + 1 + paramInt;
    }
    
    private void insertIntoHeaderTable(int paramInt, Header paramHeader)
    {
      headerList.add(paramHeader);
      int j = hpackSize;
      int i = j;
      if (paramInt != -1) {
        i = j - headerTable[headerTableIndex(paramInt)].hpackSize;
      }
      if (i > maxHeaderTableByteCount)
      {
        clearHeaderTable();
        return;
      }
      j = evictToRecoverBytes(headerTableByteCount + i - maxHeaderTableByteCount);
      if (paramInt == -1)
      {
        if (headerCount + 1 > headerTable.length)
        {
          Header[] arrayOfHeader = new Header[headerTable.length * 2];
          System.arraycopy(headerTable, 0, arrayOfHeader, headerTable.length, headerTable.length);
          nextHeaderIndex = (headerTable.length - 1);
          headerTable = arrayOfHeader;
        }
        paramInt = nextHeaderIndex;
        nextHeaderIndex = (paramInt - 1);
        headerTable[paramInt] = paramHeader;
        headerCount += 1;
      }
      for (;;)
      {
        headerTableByteCount += i;
        return;
        int k = headerTableIndex(paramInt);
        headerTable[(paramInt + (k + j))] = paramHeader;
      }
    }
    
    private boolean isStaticHeader(int paramInt)
    {
      return (paramInt >= 0) && (paramInt <= HpackDraft09.STATIC_HEADER_TABLE.length - 1);
    }
    
    private int readByte()
      throws IOException
    {
      return source.readByte() & 0xFF;
    }
    
    private void readIndexedHeader(int paramInt)
      throws IOException
    {
      if (isStaticHeader(paramInt))
      {
        Header localHeader = HpackDraft09.STATIC_HEADER_TABLE[paramInt];
        headerList.add(localHeader);
        return;
      }
      int i = headerTableIndex(paramInt - HpackDraft09.STATIC_HEADER_TABLE.length);
      if ((i < 0) || (i > headerTable.length - 1)) {
        throw new IOException("Header index too large " + (paramInt + 1));
      }
      headerList.add(headerTable[i]);
    }
    
    private void readLiteralHeaderWithIncrementalIndexingIndexedName(int paramInt)
      throws IOException
    {
      insertIntoHeaderTable(-1, new Header(getName(paramInt), readByteString()));
    }
    
    private void readLiteralHeaderWithIncrementalIndexingNewName()
      throws IOException
    {
      insertIntoHeaderTable(-1, new Header(HpackDraft09.checkLowercase(readByteString()), readByteString()));
    }
    
    private void readLiteralHeaderWithoutIndexingIndexedName(int paramInt)
      throws IOException
    {
      ByteString localByteString1 = getName(paramInt);
      ByteString localByteString2 = readByteString();
      headerList.add(new Header(localByteString1, localByteString2));
    }
    
    private void readLiteralHeaderWithoutIndexingNewName()
      throws IOException
    {
      ByteString localByteString1 = HpackDraft09.checkLowercase(readByteString());
      ByteString localByteString2 = readByteString();
      headerList.add(new Header(localByteString1, localByteString2));
    }
    
    public List<Header> getAndResetHeaderList()
    {
      ArrayList localArrayList = new ArrayList(headerList);
      headerList.clear();
      return localArrayList;
    }
    
    void maxHeaderTableByteCountSetting(int paramInt)
    {
      maxHeaderTableByteCountSetting = paramInt;
      maxHeaderTableByteCount = maxHeaderTableByteCountSetting;
      adjustHeaderTableByteCount();
    }
    
    ByteString readByteString()
      throws IOException
    {
      int j = readByte();
      if ((j & 0x80) == 128) {}
      for (int i = 1;; i = 0)
      {
        j = readInt(j, 127);
        if (i == 0) {
          break;
        }
        return ByteString.of(Huffman.get().decode(source.readByteArray(j)));
      }
      return source.readByteString(j);
    }
    
    void readHeaders()
      throws IOException
    {
      while (!source.exhausted())
      {
        int i = source.readByte() & 0xFF;
        if (i == 128) {
          throw new IOException("index == 0");
        }
        if ((i & 0x80) == 128)
        {
          readIndexedHeader(readInt(i, 127) - 1);
        }
        else if (i == 64)
        {
          readLiteralHeaderWithIncrementalIndexingNewName();
        }
        else if ((i & 0x40) == 64)
        {
          readLiteralHeaderWithIncrementalIndexingIndexedName(readInt(i, 63) - 1);
        }
        else if ((i & 0x20) == 32)
        {
          maxHeaderTableByteCount = readInt(i, 31);
          if ((maxHeaderTableByteCount < 0) || (maxHeaderTableByteCount > maxHeaderTableByteCountSetting)) {
            throw new IOException("Invalid header table byte count " + maxHeaderTableByteCount);
          }
          adjustHeaderTableByteCount();
        }
        else if ((i == 16) || (i == 0))
        {
          readLiteralHeaderWithoutIndexingNewName();
        }
        else
        {
          readLiteralHeaderWithoutIndexingIndexedName(readInt(i, 15) - 1);
        }
      }
    }
    
    int readInt(int paramInt1, int paramInt2)
      throws IOException
    {
      paramInt1 &= paramInt2;
      if (paramInt1 < paramInt2) {
        return paramInt1;
      }
      paramInt1 = 0;
      int i;
      for (;;)
      {
        i = readByte();
        if ((i & 0x80) == 0) {
          break;
        }
        paramInt2 += ((i & 0x7F) << paramInt1);
        paramInt1 += 7;
      }
      return paramInt2 + (i << paramInt1);
    }
  }
  
  static final class Writer
  {
    private final Buffer out;
    
    Writer(Buffer paramBuffer)
    {
      out = paramBuffer;
    }
    
    void writeByteString(ByteString paramByteString)
      throws IOException
    {
      writeInt(paramByteString.size(), 127, 0);
      out.write(paramByteString);
    }
    
    void writeHeaders(List<Header> paramList)
      throws IOException
    {
      int i = 0;
      int j = paramList.size();
      if (i < j)
      {
        ByteString localByteString = getname.toAsciiLowercase();
        Integer localInteger = (Integer)HpackDraft09.NAME_TO_FIRST_INDEX.get(localByteString);
        if (localInteger != null)
        {
          writeInt(localInteger.intValue() + 1, 15, 0);
          writeByteString(getvalue);
        }
        for (;;)
        {
          i += 1;
          break;
          out.writeByte(0);
          writeByteString(localByteString);
          writeByteString(getvalue);
        }
      }
    }
    
    void writeInt(int paramInt1, int paramInt2, int paramInt3)
      throws IOException
    {
      if (paramInt1 < paramInt2)
      {
        out.writeByte(paramInt3 | paramInt1);
        return;
      }
      out.writeByte(paramInt3 | paramInt2);
      paramInt1 -= paramInt2;
      while (paramInt1 >= 128)
      {
        out.writeByte(paramInt1 & 0x7F | 0x80);
        paramInt1 >>>= 7;
      }
      out.writeByte(paramInt1);
    }
  }
}
