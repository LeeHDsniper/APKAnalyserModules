package com.squareup.okhttp.internal.spdy;

import okio.ByteString;

public final class Header
{
  public static final ByteString RESPONSE_STATUS = ByteString.encodeUtf8(":status");
  public static final ByteString TARGET_AUTHORITY = ByteString.encodeUtf8(":authority");
  public static final ByteString TARGET_HOST = ByteString.encodeUtf8(":host");
  public static final ByteString TARGET_METHOD = ByteString.encodeUtf8(":method");
  public static final ByteString TARGET_PATH = ByteString.encodeUtf8(":path");
  public static final ByteString TARGET_SCHEME = ByteString.encodeUtf8(":scheme");
  public static final ByteString VERSION = ByteString.encodeUtf8(":version");
  final int hpackSize;
  public final ByteString name;
  public final ByteString value;
  
  public Header(String paramString1, String paramString2)
  {
    this(ByteString.encodeUtf8(paramString1), ByteString.encodeUtf8(paramString2));
  }
  
  public Header(ByteString paramByteString, String paramString)
  {
    this(paramByteString, ByteString.encodeUtf8(paramString));
  }
  
  public Header(ByteString paramByteString1, ByteString paramByteString2)
  {
    name = paramByteString1;
    value = paramByteString2;
    hpackSize = (paramByteString1.size() + 32 + paramByteString2.size());
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Header))
    {
      paramObject = (Header)paramObject;
      bool1 = bool2;
      if (name.equals(name))
      {
        bool1 = bool2;
        if (value.equals(value)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return (name.hashCode() + 527) * 31 + value.hashCode();
  }
  
  public String toString()
  {
    return String.format("%s: %s", new Object[] { name.utf8(), value.utf8() });
  }
}
