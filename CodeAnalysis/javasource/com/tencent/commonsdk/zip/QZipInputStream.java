package com.tencent.commonsdk.zip;

import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class QZipInputStream
  extends ZipInputStream
{
  public QZipInputStream(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public ZipEntry getNextEntry()
    throws IOException
  {
    ZipEntry localZipEntry = super.getNextEntry();
    if (QZipIOException.isInvalidEntry(localZipEntry)) {
      throw new QZipIOException();
    }
    return localZipEntry;
  }
}
