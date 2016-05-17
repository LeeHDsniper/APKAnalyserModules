package com.tencent.mobileqq.app.automator.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import cooperation.weiyun.albumstatus.AlbumStatus;

public class WeiyunCheckAlbum
  extends AsyncStep
{
  public WeiyunCheckAlbum()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (QLog.isColorLevel()) {
      QLog.i("Weiyun.AlbumBackup", 2, "weiyun album status check step begins at doStep()");
    }
    AlbumStatus.a(BaseApplicationImpl.a);
    return 7;
  }
}
