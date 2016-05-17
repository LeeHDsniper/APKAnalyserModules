package com.tencent.mobileqq.app.automator.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.QZoneManager;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.QZoneHelper;

public class GetQZoneFeedCount
  extends AsyncStep
{
  private static final String c = GetQZoneFeedCount.class.getSimpleName();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public GetQZoneFeedCount() {}
  
  protected int a()
  {
    QZoneManager localQZoneManager;
    if ((a != null) && (a.b != null))
    {
      if (BaseApplicationImpl.c) {
        QZoneHelper.a(a.b, c);
      }
      localQZoneManager = (QZoneManager)a.b.getManager(9);
      if (localQZoneManager != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d(c, 2, "GetQZoneFeedCount isFirstGetUnread:" + localQZoneManager.a() + ",isBackground_Pause:" + a.b.isBackground_Pause);
        }
        if (!localQZoneManager.a()) {
          break label149;
        }
        localQZoneManager.a(a.b.getAccount(), a.b.getSid());
      }
    }
    for (;;)
    {
      return 7;
      label149:
      if (a.b.isBackground_Pause) {
        localQZoneManager.c(6);
      } else {
        localQZoneManager.b(5);
      }
    }
  }
}
