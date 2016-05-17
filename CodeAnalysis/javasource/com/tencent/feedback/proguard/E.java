package com.tencent.feedback.proguard;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public final class E
  implements C
{
  public E() {}
  
  public final byte[] a(byte[] paramArrayOfByte)
    throws Exception
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    ZipOutputStream localZipOutputStream = new ZipOutputStream(localByteArrayOutputStream);
    ZipEntry localZipEntry = new ZipEntry("zip");
    localZipEntry.setSize(paramArrayOfByte.length);
    localZipOutputStream.putNextEntry(localZipEntry);
    localZipOutputStream.write(paramArrayOfByte);
    localZipOutputStream.closeEntry();
    localZipOutputStream.close();
    paramArrayOfByte = localByteArrayOutputStream.toByteArray();
    localByteArrayOutputStream.close();
    return paramArrayOfByte;
  }
  
  public final byte[] b(byte[] paramArrayOfByte)
    throws Exception
  {
    ByteArrayOutputStream localByteArrayOutputStream = null;
    ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(paramArrayOfByte);
    ZipInputStream localZipInputStream = new ZipInputStream(localByteArrayInputStream);
    paramArrayOfByte = localByteArrayOutputStream;
    while (localZipInputStream.getNextEntry() != null)
    {
      paramArrayOfByte = new byte['Ѐ'];
      localByteArrayOutputStream = new ByteArrayOutputStream();
      for (;;)
      {
        int i = localZipInputStream.read(paramArrayOfByte, 0, paramArrayOfByte.length);
        if (i == -1) {
          break;
        }
        localByteArrayOutputStream.write(paramArrayOfByte, 0, i);
      }
      paramArrayOfByte = localByteArrayOutputStream.toByteArray();
      localByteArrayOutputStream.flush();
      localByteArrayOutputStream.close();
    }
    localZipInputStream.close();
    localByteArrayInputStream.close();
    return paramArrayOfByte;
  }
}
