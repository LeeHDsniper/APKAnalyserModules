package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQUtils;
import com.tencent.qphone.base.util.BaseApplication;

public class UpdateIcon
  extends AsyncStep
{
  public UpdateIcon()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    SharedPreferences localSharedPreferences = a.b.a().getSharedPreferences("com.tencent.mobileqq_preferences", 0);
    if (localSharedPreferences.getBoolean("updateShortcutIcon6.3.3.2755", true))
    {
      QQUtils.a(a.b, "sid");
      localSharedPreferences.edit().putBoolean("updateShortcutIcon6.3.3.2755", false).commit();
    }
    return 7;
  }
}
