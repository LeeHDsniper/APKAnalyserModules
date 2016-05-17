package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qzonestatus.QzoneContactsFeedManager;
import com.tencent.qphone.base.util.QLog;

public class GetQZoneFeeds
  extends AsyncStep
{
  public static boolean b = false;
  public static final String c = "GetQZoneFeeds";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public GetQZoneFeeds() {}
  
  protected int a()
  {
    b = true;
    if (QLog.isColorLevel()) {
      QLog.d("GetQZoneFeeds", 2, "GetQZoneFeeds doStep");
    }
    ((QzoneContactsFeedManager)a.b.getManager(90)).a();
    return super.a();
  }
}
