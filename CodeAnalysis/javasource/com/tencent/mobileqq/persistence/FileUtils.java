package com.tencent.mobileqq.persistence;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;

public class FileUtils
{
  public FileUtils()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static File[] a(String paramString)
  {
    paramString = new File(paramString);
    if ((paramString.exists()) && (paramString.isDirectory())) {
      return paramString.listFiles();
    }
    return null;
  }
}
