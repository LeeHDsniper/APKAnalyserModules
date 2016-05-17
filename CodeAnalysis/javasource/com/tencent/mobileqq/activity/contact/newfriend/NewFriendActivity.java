package com.tencent.mobileqq.activity.contact.newfriend;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseForwardSelectionActivity;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.newfriend.NewFriendMessage;
import com.tencent.mobileqq.service.circle.ISwitchObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.RedDotTextView;
import com.tencent.mobileqq.widget.TabBarView;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.util.Observable;
import java.util.Observer;
import lrp;
import lrq;
import lrs;
import lrt;
import lru;
import lrv;
import lrw;
import lrx;

public class NewFriendActivity
  extends BaseForwardSelectionActivity
  implements View.OnClickListener, BaseNewFriendView.INewFriendContext, Observer
{
  public static final int d = 0;
  public static final int e = 1;
  public static final String e = "_key_mode";
  public static final int f = 2;
  public static final String f = "enter_cricle_view";
  public static final int g = 3;
  private static final String g = "NewFriendManager";
  public static final int h = 0;
  private static final String h = "newfriend_";
  public static final int i = 1;
  public static final int j = -1000;
  static final int k = 1;
  static final int l = 2;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private View jdField_a_of_type_AndroidViewView;
  private FrameLayout jdField_a_of_type_AndroidWidgetFrameLayout;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private BaseNewFriendView jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView;
  private CircleGroupListView jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView;
  private RecommendListView jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView;
  private SystemMsgListView jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView;
  CircleManager jdField_a_of_type_ComTencentMobileqqAppCircleManager;
  private ISwitchObserver jdField_a_of_type_ComTencentMobileqqServiceCircleISwitchObserver;
  public QQProgressDialog a;
  private TabBarView.OnTabChangeListener jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener;
  private TabBarView jdField_a_of_type_ComTencentMobileqqWidgetTabBarView;
  private lrx jdField_a_of_type_Lrx;
  private Drawable[] jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable;
  private RelativeLayout jdField_b_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  public boolean b;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  boolean jdField_c_of_type_Boolean;
  private boolean d;
  private int m;
  private int n;
  private int o;
  private int p;
  
  public NewFriendActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    m = 0;
    n = 0;
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener = new lrp(this);
    o = 3;
    jdField_a_of_type_ComTencentMobileqqServiceCircleISwitchObserver = new lrs(this);
  }
  
  private void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (jdField_a_of_type_AndroidViewView == null) {}
    Object localObject;
    do
    {
      do
      {
        do
        {
          return;
          localObject = getWindow().getDecorView().findViewById(2131296923);
        } while (localObject == null);
        localObject = ((View)localObject).getParent();
      } while ((localObject == null) || (!(localObject instanceof FrameLayout)));
      localObject = (FrameLayout)localObject;
      if (paramBoolean1) {
        ((FrameLayout)localObject).addView(jdField_a_of_type_AndroidViewView, new FrameLayout.LayoutParams(-1, -1));
      }
    } while (!paramBoolean2);
    ((FrameLayout)localObject).removeView(jdField_a_of_type_AndroidViewView);
    jdField_a_of_type_AndroidViewView = null;
  }
  
  private void b(boolean paramBoolean)
  {
    NewFriendManager localNewFriendManager = (NewFriendManager)app.getManager(33);
    if (paramBoolean)
    {
      app.a().addObserver(this);
      localNewFriendManager.addObserver(this);
    }
    do
    {
      return;
      localNewFriendManager.deleteObserver(this);
    } while (app.a() == null);
    app.a().deleteObserver(this);
  }
  
  private void c(boolean paramBoolean)
  {
    if ((jdField_a_of_type_Boolean) || (!paramBoolean)) {
      a(false, true);
    }
    SharedPreferences localSharedPreferences;
    long l1;
    do
    {
      return;
      localSharedPreferences = getSharedPreferences(app.a(), 0);
      l1 = localSharedPreferences.getLong("newfriend_enter_time", -100L);
      if (QLog.isColorLevel()) {
        QLog.i("NewFriendManager", 2, "enterTime: " + l1);
      }
    } while ((l1 != -100L) || ((jdField_a_of_type_AndroidViewView != null) && (paramBoolean)));
    jdField_a_of_type_AndroidViewView = LayoutInflater.from(getApplicationContext()).inflate(2130904211, null);
    jdField_a_of_type_AndroidViewView.setOnClickListener(new lrv(this, localSharedPreferences));
    a(true, false);
  }
  
  private void h()
  {
    Object localObject = app.a();
    NewFriendManager localNewFriendManager = (NewFriendManager)app.getManager(33);
    if (localNewFriendManager != null) {}
    for (int i1 = localNewFriendManager.a();; i1 = 0)
    {
      if (localObject != null)
      {
        i1 = ((QQMessageFacade)localObject).e() - i1;
        if (i1 > 0) {
          if (i1 > 99)
          {
            localObject = "99+";
            jdField_b_of_type_AndroidWidgetTextView.setText(getString(2131367297) + "(" + (String)localObject + ")");
          }
        }
      }
      for (;;)
      {
        if (AppSetting.i) {
          jdField_b_of_type_AndroidWidgetTextView.setContentDescription(jdField_b_of_type_AndroidWidgetTextView.getText() + " 返回按钮");
        }
        return;
        localObject = "" + i1;
        break;
        jdField_b_of_type_AndroidWidgetTextView.setText(getString(2131367297));
        continue;
        jdField_b_of_type_AndroidWidgetTextView.setText(getString(2131367297));
      }
    }
  }
  
  private void i()
  {
    c(true);
    d();
  }
  
  private void j()
  {
    boolean bool2 = true;
    Object localObject = (NewFriendManager)app.getManager(33);
    m = ((NewFriendManager)localObject).a(0);
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView == null) || (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView))
    {
      RedDotTextView localRedDotTextView = jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1);
      if (m > 0)
      {
        bool1 = true;
        localRedDotTextView.a(bool1);
      }
    }
    else
    {
      n = ((NewFriendManager)localObject).a(1);
      if ((jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView == null) || (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView))
      {
        localObject = jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0);
        if (n <= 0) {
          break label123;
        }
      }
    }
    label123:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      ((RedDotTextView)localObject).a(bool1);
      return;
      bool1 = false;
      break;
    }
  }
  
  private void k()
  {
    if (d)
    {
      i();
      return;
    }
    switch (getIntent().getIntExtra("_key_mode", 64536))
    {
    }
    do
    {
      switch (getSharedPreferences("newfriend_" + app.a(), 0).getInt("_key_mode", 64536))
      {
      default: 
        jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
        return;
        jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
        return;
        if (n > 0)
        {
          jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
          n = 0;
          return;
        }
        break;
      }
    } while (m <= 0);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(1, true);
    m = 0;
    return;
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
  }
  
  public View a()
  {
    return jdField_a_of_type_AndroidWidgetLinearLayout;
  }
  
  public View a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView;
    case 0: 
      return jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView;
    }
    return jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView;
  }
  
  public QQAppInterface a()
  {
    return app;
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null)
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130838193);
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable = jdField_a_of_type_AndroidWidgetTextView.getCompoundDrawables();
      p = jdField_a_of_type_AndroidWidgetTextView.getCompoundDrawablePadding();
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(10);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_AndroidGraphicsDrawableDrawable, jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3]);
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).start();
    }
  }
  
  public void a(int paramInt)
  {
    if ((!isFinishing()) && (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getTitleBarHeight());
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setOnDismissListener(new lrw(this));
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(paramInt);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCanceledOnTouchOutside(false);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCancelable(false);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
    }
  }
  
  public void a(int paramInt, View.OnClickListener paramOnClickListener) {}
  
  public void a(int paramInt, boolean paramBoolean)
  {
    switch (paramInt)
    {
    default: 
      paramInt = -1;
    }
    for (;;)
    {
      if (paramInt != -1) {
        jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(paramInt).a(paramBoolean);
      }
      return;
      paramInt = 1;
      continue;
      paramInt = 0;
    }
  }
  
  void a(BaseNewFriendView paramBaseNewFriendView)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != paramBaseNewFriendView)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != null)
      {
        if (isResume()) {
          jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.f();
        }
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.g();
      }
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView = paramBaseNewFriendView;
      if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.d();
        if (isResume()) {
          jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.e();
        }
        jdField_a_of_type_AndroidWidgetFrameLayout.removeAllViews();
        jdField_a_of_type_AndroidWidgetFrameLayout.addView(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView);
      }
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    QQToast.a(getActivity(), paramInt, paramString, 0).b(getTitleBarHeight());
  }
  
  public void a(boolean paramBoolean)
  {
    ImageView localImageView = jdField_a_of_type_AndroidWidgetImageView;
    if (paramBoolean) {}
    for (int i1 = 0;; i1 = 8)
    {
      localImageView.setVisibility(i1);
      return;
    }
  }
  
  public boolean a()
  {
    boolean bool = false;
    if (jdField_a_of_type_Lrx.hasMessages(1))
    {
      jdField_a_of_type_Lrx.removeMessages(1);
      bool = true;
    }
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.cancel();
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = null;
      return true;
    }
    return bool;
  }
  
  public View b()
  {
    return jdField_a_of_type_AndroidWidgetRelativeLayout;
  }
  
  public void b()
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null)
    {
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(p);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[0], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3]);
    }
  }
  
  public View c()
  {
    return jdField_a_of_type_ComTencentMobileqqWidgetTabBarView;
  }
  
  public void c()
  {
    Message localMessage = jdField_a_of_type_Lrx.obtainMessage(1, 2131368360, 0);
    jdField_a_of_type_Lrx.sendMessageDelayed(localMessage, 1000L);
  }
  
  void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView == null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView = new CircleGroupListView(this, jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption);
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView.a(getIntent(), this);
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void doOnBackPressed()
  {
    if (jdField_a_of_type_AndroidViewView != null) {
      getSharedPreferences(app.a(), 0).edit().putLong("newfriend_enter_time", System.currentTimeMillis()).commit();
    }
    super.doOnBackPressed();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    if (Build.VERSION.SDK_INT >= 11) {
      getWindow().setFlags(16777216, 16777216);
    }
    jdField_a_of_type_Lrx = new lrx(this);
    setContentView(2130904210);
    setContentBackgroundResource(2130837739);
    setContentView(2130904210);
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131296923));
    if (ImmersiveUtils.isSupporImmersive() == 1)
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.setFitsSystemWindows(true);
      jdField_a_of_type_AndroidWidgetLinearLayout.setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    jdField_b_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131299387));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView = ((TabBarView)findViewById(2131297593));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setOnTabChangeListener(jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener);
    jdField_a_of_type_AndroidWidgetFrameLayout = ((FrameLayout)findViewById(2131299388));
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131297591));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297034));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131297324));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297081));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0, getString(2131367316));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1, getString(2131367315));
    jdField_a_of_type_ComTencentMobileqqAppCircleManager = ((CircleManager)app.getManager(34));
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText("人脉圈");
      jdField_b_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setText(2131367694);
      jdField_c_of_type_AndroidWidgetTextView.setText(2131366996);
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_c_of_type_AndroidWidgetTextView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      i();
      jdField_b_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(true);
      jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqServiceCircleISwitchObserver);
      if (AppSetting.i)
      {
        jdField_a_of_type_AndroidWidgetTextView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText());
        if (jdField_a_of_type_Boolean) {
          jdField_c_of_type_AndroidWidgetTextView.setContentDescription("取消本次转发");
        }
        jdField_a_of_type_AndroidWidgetImageView.setContentDescription(getString(2131362090));
        jdField_b_of_type_AndroidWidgetTextView.setContentDescription(jdField_b_of_type_AndroidWidgetTextView.getText() + " 返回按钮");
      }
      return true;
    }
    d = getIntent().getBooleanExtra("enter_cricle_view", false);
    if (d)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText("人脉圈");
      jdField_b_of_type_AndroidWidgetTextView.setText("联系人");
      jdField_b_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(true);
      jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqServiceCircleISwitchObserver);
      ReportController.b(app, "CliOper", "", "", "Network_circle", "Circle_grplist_exp", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundResource(2130838440);
      jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
      k();
      break;
      jdField_a_of_type_AndroidWidgetTextView.setText("新朋友");
      h();
      b(true);
      j();
    }
  }
  
  protected void doOnDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView.h();
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendCircleGroupListView = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.h();
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.h();
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppCircleManager != null) {
      jdField_a_of_type_ComTencentMobileqqAppCircleManager.b(jdField_a_of_type_ComTencentMobileqqServiceCircleISwitchObserver);
    }
    b(false);
    super.doOnDestroy();
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    k();
  }
  
  protected void doOnPause()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.f();
    }
    jdField_c_of_type_Boolean = false;
    if (!d) {
      getSharedPreferences("newfriend_" + app.a(), 0).edit().putInt("_key_mode", o).commit();
    }
    super.doOnPause();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.e();
    }
    jdField_c_of_type_Boolean = true;
  }
  
  protected void doOnStart()
  {
    super.doOnStart();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.d();
    }
  }
  
  protected void doOnStop()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView.g();
    }
    super.doOnStop();
  }
  
  public void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView == null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView = new RecommendListView(this);
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.a(getIntent(), this);
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView);
  }
  
  public void f()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView == null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView = new SystemMsgListView(this);
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView.a(getIntent(), this);
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgListView);
  }
  
  void g()
  {
    boolean bool = false;
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(this, null);
    if (!d) {
      localActionSheet.a(getString(2131368031), 0, false, false);
    }
    for (;;)
    {
      localActionSheet.a(new lrq(this, localActionSheet));
      localActionSheet.d(2131366996);
      localActionSheet.show();
      return;
      String str = getString(2131368032);
      if (!jdField_b_of_type_Boolean) {
        bool = true;
      }
      localActionSheet.a(str, bool);
    }
  }
  
  public Activity getActivity()
  {
    return this;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      g();
    }
    do
    {
      return;
      finish();
      return;
    } while (!jdField_a_of_type_Boolean);
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(false);
    com.tencent.mobileqq.app.PhoneContactManagerImp.f = false;
    setResult(1);
    finish();
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    if ((paramObject instanceof NewFriendMessage)) {
      runOnUiThread(new lrt(this, paramObject));
    }
    int i1;
    do
    {
      do
      {
        return;
      } while (!(paramObject instanceof MessageRecord));
      int i2 = 1;
      i1 = i2;
      if ((paramObject instanceof ChatMessage))
      {
        i1 = i2;
        if (((MessageRecord)paramObject).isSendFromLocal()) {
          i1 = 0;
        }
      }
    } while (i1 == 0);
    runOnUiThread(new lru(this));
  }
}
