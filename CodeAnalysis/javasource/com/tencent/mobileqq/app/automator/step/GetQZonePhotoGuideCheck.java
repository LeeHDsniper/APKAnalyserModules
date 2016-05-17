package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qzonealbumreddot.QzoneAlbumRedTouchManager;
import com.tencent.qphone.base.util.QLog;

public class GetQZonePhotoGuideCheck
  extends AsyncStep
{
  public static boolean b = false;
  public static final String c = "GetQZonePhotoGuideCheck";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public GetQZonePhotoGuideCheck() {}
  
  protected int a()
  {
    b = true;
    if (QLog.isColorLevel()) {
      QLog.d("GetQZonePhotoGuideCheck", 2, "GetQZonePhotoGuideCheck doStep");
    }
    QzoneAlbumRedTouchManager localQzoneAlbumRedTouchManager = (QzoneAlbumRedTouchManager)a.b.getManager(103);
    if (localQzoneAlbumRedTouchManager != null) {
      localQzoneAlbumRedTouchManager.c();
    }
    return super.a();
  }
}
