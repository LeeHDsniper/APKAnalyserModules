package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.ChatBackgroundAuthHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.ChatBackgroundManager;
import com.tencent.qphone.base.util.BaseApplication;
import java.util.List;

public class ChatBackgroundAuth
  extends AsyncStep
{
  public ChatBackgroundAuth()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    SharedPreferences localSharedPreferences = a.b.a().getSharedPreferences("mobileQQ", 0);
    long l = localSharedPreferences.getLong("lastChabgAuthTime", 0L);
    if (System.currentTimeMillis() - l > 86400000L)
    {
      List localList = ((ChatBackgroundManager)a.b.getManager(62)).a();
      if ((localList != null) && (localList.size() > 0)) {
        ((ChatBackgroundAuthHandler)a.b.a(54)).a(localList);
      }
      localSharedPreferences.edit().putLong("lastChabgAuthTime", System.currentTimeMillis()).commit();
    }
    return 7;
  }
}
