package com.tencent.commonsdk.zip;

import java.io.IOException;
import java.util.zip.ZipEntry;

public class QZipIOException
  extends IOException
{
  public QZipIOException() {}
  
  public static boolean isInvalidEntry(ZipEntry paramZipEntry)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramZipEntry != null)
    {
      paramZipEntry = paramZipEntry.getName();
      bool1 = bool2;
      if (paramZipEntry != null) {
        if (!paramZipEntry.contains("../"))
        {
          bool1 = bool2;
          if (!paramZipEntry.contains("..\\")) {}
        }
        else
        {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
}
