package com.nostra13.universalimageloader.utils;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public final class IoUtils
{
  public static void closeSilently(Closeable paramCloseable)
  {
    try
    {
      paramCloseable.close();
      return;
    }
    catch (Exception paramCloseable) {}
  }
  
  public static boolean copyStream(InputStream paramInputStream, OutputStream paramOutputStream, CopyListener paramCopyListener, int paramInt)
    throws IOException
  {
    int i = 0;
    int k = paramInputStream.available();
    byte[] arrayOfByte = new byte[paramInt];
    if (shouldStopLoading(paramCopyListener, 0, k)) {
      return false;
    }
    int j;
    do
    {
      j = paramInputStream.read(arrayOfByte, 0, paramInt);
      if (j == -1) {
        break;
      }
      paramOutputStream.write(arrayOfByte, 0, j);
      j = i + j;
      i = j;
    } while (!shouldStopLoading(paramCopyListener, j, k));
    return false;
    paramOutputStream.flush();
    return true;
  }
  
  public static void readAndCloseStream(InputStream paramInputStream)
  {
    byte[] arrayOfByte = new byte[32768];
    try
    {
      int i;
      do
      {
        i = paramInputStream.read(arrayOfByte, 0, 32768);
      } while (i != -1);
      closeSilently(paramInputStream);
      return;
    }
    catch (IOException localIOException)
    {
      localIOException = localIOException;
      closeSilently(paramInputStream);
      return;
    }
    finally
    {
      localObject = finally;
      closeSilently(paramInputStream);
      throw localObject;
    }
  }
  
  private static boolean shouldStopLoading(CopyListener paramCopyListener, int paramInt1, int paramInt2)
  {
    return (paramCopyListener != null) && (!paramCopyListener.onBytesCopied(paramInt1, paramInt2)) && (paramInt1 * 100 / paramInt2 < 75);
  }
  
  public static abstract interface CopyListener
  {
    public abstract boolean onBytesCopied(int paramInt1, int paramInt2);
  }
}
