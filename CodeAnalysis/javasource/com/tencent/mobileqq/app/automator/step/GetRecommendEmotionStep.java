package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.EmosmHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;

public class GetRecommendEmotionStep
  extends AsyncStep
{
  public GetRecommendEmotionStep()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    SharedPreferences localSharedPreferences = a.b.a().getSharedPreferences("mobileQQ", 0);
    long l = localSharedPreferences.getLong("last_get_recommendemotion_time_" + a.b.f(), 0L);
    if (QLog.isColorLevel()) {
      QLog.d("GetRecommendEmotionStep", 2, "lastRequestTime = " + l);
    }
    if (System.currentTimeMillis() - l > 43200000L)
    {
      ((EmosmHandler)a.b.a(12)).a();
      localSharedPreferences.edit().putLong("last_get_recommendemotion_time_" + a.b.f(), System.currentTimeMillis()).commit();
    }
    return 7;
  }
}
