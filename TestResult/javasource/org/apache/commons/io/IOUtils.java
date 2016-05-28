package org.apache.commons.io;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.commons.io.output.StringBuilderWriter;

public class IOUtils
{
  public static final char DIR_SEPARATOR = File.separatorChar;
  public static final String LINE_SEPARATOR;
  
  static
  {
    StringBuilderWriter localStringBuilderWriter = new StringBuilderWriter(4);
    PrintWriter localPrintWriter = new PrintWriter(localStringBuilderWriter);
    localPrintWriter.println();
    LINE_SEPARATOR = localStringBuilderWriter.toString();
    localPrintWriter.close();
  }
  
  public static void closeQuietly(Closeable paramCloseable)
  {
    if (paramCloseable != null) {}
    try
    {
      paramCloseable.close();
      return;
    }
    catch (IOException paramCloseable) {}
  }
  
  public static void closeQuietly(InputStream paramInputStream)
  {
    closeQuietly(paramInputStream);
  }
  
  public static void closeQuietly(OutputStream paramOutputStream)
  {
    closeQuietly(paramOutputStream);
  }
  
  public static int copy(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    long l = copyLarge(paramInputStream, paramOutputStream);
    if (l > 2147483647L) {
      return -1;
    }
    return (int)l;
  }
  
  public static long copyLarge(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    return copyLarge(paramInputStream, paramOutputStream, new byte['က']);
  }
  
  public static long copyLarge(InputStream paramInputStream, OutputStream paramOutputStream, byte[] paramArrayOfByte)
    throws IOException
  {
    int i;
    for (long l = 0L;; l += i)
    {
      i = paramInputStream.read(paramArrayOfByte);
      if (-1 == i) {
        break;
      }
      paramOutputStream.write(paramArrayOfByte, 0, i);
    }
    return l;
  }
  
  public static byte[] toByteArray(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    copy(paramInputStream, localByteArrayOutputStream);
    return localByteArrayOutputStream.toByteArray();
  }
}
