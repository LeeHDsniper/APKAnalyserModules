package okio;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public final class ByteString
  implements Serializable
{
  public static final ByteString EMPTY = of(new byte[0]);
  private static final char[] HEX_DIGITS = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102 };
  private static final long serialVersionUID = 1L;
  final byte[] data;
  private transient int hashCode;
  private transient String utf8;
  
  ByteString(byte[] paramArrayOfByte)
  {
    data = paramArrayOfByte;
  }
  
  public static ByteString decodeBase64(String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("base64 == null");
    }
    paramString = Base64.decode(paramString);
    if (paramString != null) {
      return new ByteString(paramString);
    }
    return null;
  }
  
  public static ByteString encodeUtf8(String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("s == null");
    }
    ByteString localByteString = new ByteString(paramString.getBytes(Util.UTF_8));
    utf8 = paramString;
    return localByteString;
  }
  
  public static ByteString of(byte... paramVarArgs)
  {
    if (paramVarArgs == null) {
      throw new IllegalArgumentException("data == null");
    }
    return new ByteString((byte[])paramVarArgs.clone());
  }
  
  public static ByteString read(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    if (paramInputStream == null) {
      throw new IllegalArgumentException("in == null");
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("byteCount < 0: " + paramInt);
    }
    byte[] arrayOfByte = new byte[paramInt];
    int i = 0;
    while (i < paramInt)
    {
      int j = paramInputStream.read(arrayOfByte, i, paramInt - i);
      if (j == -1) {
        throw new EOFException();
      }
      i += j;
    }
    return new ByteString(arrayOfByte);
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException
  {
    paramObjectInputStream = read(paramObjectInputStream, paramObjectInputStream.readInt());
    try
    {
      Field localField = ByteString.class.getDeclaredField("data");
      localField.setAccessible(true);
      localField.set(this, data);
      return;
    }
    catch (NoSuchFieldException paramObjectInputStream)
    {
      throw new AssertionError();
    }
    catch (IllegalAccessException paramObjectInputStream)
    {
      throw new AssertionError();
    }
  }
  
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeInt(data.length);
    paramObjectOutputStream.write(data);
  }
  
  public String base64()
  {
    return Base64.encode(data);
  }
  
  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof ByteString)) && (Arrays.equals(data, data)));
  }
  
  public byte getByte(int paramInt)
  {
    return data[paramInt];
  }
  
  public int hashCode()
  {
    int i = hashCode;
    if (i != 0) {
      return i;
    }
    i = Arrays.hashCode(data);
    hashCode = i;
    return i;
  }
  
  public String hex()
  {
    char[] arrayOfChar = new char[data.length * 2];
    byte[] arrayOfByte = data;
    int k = arrayOfByte.length;
    int i = 0;
    int j = 0;
    while (i < k)
    {
      int m = arrayOfByte[i];
      int n = j + 1;
      arrayOfChar[j] = HEX_DIGITS[(m >> 4 & 0xF)];
      j = n + 1;
      arrayOfChar[n] = HEX_DIGITS[(m & 0xF)];
      i += 1;
    }
    return new String(arrayOfChar);
  }
  
  public int size()
  {
    return data.length;
  }
  
  public ByteString toAsciiLowercase()
  {
    int i = 0;
    int j;
    for (;;)
    {
      localObject = this;
      if (i >= data.length) {
        return localObject;
      }
      j = data[i];
      if ((j >= 65) && (j <= 90)) {
        break;
      }
      i += 1;
    }
    Object localObject = (byte[])data.clone();
    localObject[i] = ((byte)(j + 32));
    i += 1;
    if (i < localObject.length)
    {
      j = localObject[i];
      if ((j < 65) || (j > 90)) {}
      for (;;)
      {
        i += 1;
        break;
        localObject[i] = ((byte)(j + 32));
      }
    }
    localObject = new ByteString((byte[])localObject);
    return localObject;
  }
  
  public byte[] toByteArray()
  {
    return (byte[])data.clone();
  }
  
  public String toString()
  {
    if (data.length == 0) {
      return "ByteString[size=0]";
    }
    if (data.length <= 16) {
      return String.format("ByteString[size=%s data=%s]", new Object[] { Integer.valueOf(data.length), hex() });
    }
    try
    {
      String str = String.format("ByteString[size=%s md5=%s]", new Object[] { Integer.valueOf(data.length), of(MessageDigest.getInstance("MD5").digest(data)).hex() });
      return str;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new AssertionError();
    }
  }
  
  public String utf8()
  {
    String str = utf8;
    if (str != null) {
      return str;
    }
    str = new String(data, Util.UTF_8);
    utf8 = str;
    return str;
  }
}
