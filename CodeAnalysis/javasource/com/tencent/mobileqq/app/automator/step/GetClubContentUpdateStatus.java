package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.ClubContentUpdateHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vas.ClubContentJsonTask;
import com.tencent.mobileqq.vas.IndividuationMarketUrlUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;

public class GetClubContentUpdateStatus
  extends AsyncStep
{
  public GetClubContentUpdateStatus()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ClubContentJsonTask.b(a.b);
    ClubContentJsonTask.a(a.b);
    SharedPreferences localSharedPreferences = a.b.a().getSharedPreferences("mobileQQ", 0);
    long l = localSharedPreferences.getLong("last_pull_club_content_update_time", 0L);
    if ((System.currentTimeMillis() - l > 43200000L) || (System.currentTimeMillis() < l))
    {
      ClubContentUpdateHandler localClubContentUpdateHandler = (ClubContentUpdateHandler)a.b.a(16);
      if (localClubContentUpdateHandler != null)
      {
        localClubContentUpdateHandler.a();
        localSharedPreferences.edit().putLong("last_pull_club_content_update_time", System.currentTimeMillis()).commit();
      }
    }
    for (;;)
    {
      IndividuationMarketUrlUtils.a(a.b);
      return 7;
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, "system time" + System.currentTimeMillis() + ",last update time:" + l);
      }
    }
  }
}
