package com.tencent.mobileqq.transfile;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;

public class DiskCache
{
  File a;
  
  public DiskCache(File paramFile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramFile;
  }
  
  DiskCache.Editor a(String paramString)
  {
    return new DiskCache.Editor(this, paramString);
  }
  
  File a(String paramString)
  {
    if (!a.exists()) {
      a.mkdirs();
    }
    return new File(a, paramString);
  }
}
