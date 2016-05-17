package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeView;

public class LoginWelcomeViewBuilder
  extends RecentItemBaseBuilder
{
  public LoginWelcomeViewBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramObject = paramView;
    if (paramView == null)
    {
      if ((paramContext instanceof SplashActivity)) {
        paramObject = LoginWelcomeView.a(paramContext, (QQAppInterface)((SplashActivity)paramContext).getAppRuntime(), 1);
      }
    }
    else {
      return paramObject;
    }
    return null;
  }
}
