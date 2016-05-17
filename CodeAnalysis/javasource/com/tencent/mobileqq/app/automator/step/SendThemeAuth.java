package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.text.TextUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThemeHandler;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.theme.ThemeUtil;
import mqq.app.MobileQQ;

public class SendThemeAuth
  extends AsyncStep
{
  public SendThemeAuth()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ThemeHandler localThemeHandler = (ThemeHandler)a.b.a(14);
    if (localThemeHandler != null) {
      localThemeHandler.a(null, null);
    }
    Object localObject = a.b.getAccount();
    if (TextUtils.isEmpty((CharSequence)localObject)) {}
    do
    {
      return 7;
      localObject = a.b.getApplication().getSharedPreferences((String)localObject, 0);
    } while ((localThemeHandler == null) || (!((SharedPreferences)localObject).getBoolean("need_check_theme_ver", false)));
    localThemeHandler.b(ThemeUtil.getUserCurrentThemeId(a.b), ThemeUtil.getUserCurrentThemeVersion(a.b));
    return 7;
  }
}
