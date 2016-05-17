package com.tencent.mobileqq.filemanager.core;

import com.tencent.mobileqq.filemanager.activity.FilePreviewActivity.ControlerCallback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class FilePreViewControllerBase
{
  public FilePreviewActivity.ControlerCallback a;
  
  public FilePreViewControllerBase()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public abstract int a();
  
  public void a(FilePreviewActivity.ControlerCallback paramControlerCallback)
  {
    a = paramControlerCallback;
  }
  
  public abstract boolean a();
  
  public abstract void b();
}
