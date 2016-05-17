package com.tencent.mobileqq.activity.main;

import android.content.Intent;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.GesturePWDUnlockActivity;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.SystemUtil;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.qphone.base.util.QLog;
import lvp;
import lvq;

public class MainUtils
{
  public MainUtils()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static void a(BaseActivity paramBaseActivity)
  {
    if (GesturePWDUtils.getStartFromSplash(paramBaseActivity))
    {
      if (QLog.isColorLevel()) {
        QLog.d("qqBaseActivity", 2, "gesturepwd auto islock true.");
      }
      localObject = new Intent(paramBaseActivity, GesturePWDUnlockActivity.class);
      ((Intent)localObject).putExtra("key_gesture_from_splash", true);
      paramBaseActivity.startActivity((Intent)localObject);
    }
    GesturePWDUtils.setStartFromSplash(paramBaseActivity, false);
    String str;
    if ((app != null) && (GesturePWDUtils.getGestureUnlockFailed(paramBaseActivity, app.a())))
    {
      str = paramBaseActivity.getString(2131369919);
      if (GesturePWDUtils.getGestureUnlockFailedType(paramBaseActivity) != 1) {
        break label125;
      }
    }
    label125:
    for (Object localObject = paramBaseActivity.getString(2131369920);; localObject = paramBaseActivity.getString(2131369921))
    {
      DialogUtil.a(paramBaseActivity, 230, str, (String)localObject, 2131366996, 2131369918, new lvp(paramBaseActivity), new lvq()).show();
      return;
    }
  }
  
  public static boolean a(QQAppInterface paramQQAppInterface, BaseActivity paramBaseActivity)
  {
    SystemUtil.a(BaseApplicationImpl.getContext());
    if ((NotificationActivity.a != null) && (!NotificationActivity.a.isFinishing()))
    {
      paramQQAppInterface = NotificationActivity.a.getIntent();
      NotificationActivity.a.finish();
      paramBaseActivity.startActivity(paramQQAppInterface);
      return false;
    }
    if (paramQQAppInterface.isLogin())
    {
      if (GesturePWDUtils.getSplashLock(paramBaseActivity, paramQQAppInterface.getAccount()))
      {
        GesturePWDUtils.setStartFromSplash(paramBaseActivity, true);
        return false;
      }
      GesturePWDUtils.mEnterFromSplash = false;
      return false;
    }
    GesturePWDUtils.mEnterFromSplash = false;
    paramBaseActivity.startActivity(new Intent(paramBaseActivity, LoginActivity.class));
    return true;
  }
}
