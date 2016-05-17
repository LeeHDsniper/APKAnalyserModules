package com.tencent.mobileqq.activity.contact.addcontact;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.biz.pubaccount.util.PADetailReportUtil;
import com.tencent.mobileqq.activity.MainFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeManager;
import com.tencent.mobileqq.widget.RedDotTextView;
import com.tencent.mobileqq.widget.TabBarView;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;
import com.tencent.widget.immersive.ImmersiveUtils;
import lpm;
import lpp;
import lpq;

public class AddContactsActivity
  extends BaseActivity
  implements View.OnClickListener
{
  public static final int a = 0;
  public static final String a = "tab_index_key";
  public static final int b = 1;
  private static final String b = "http://find.qq.com/m/index.html?_wv=1026";
  public static final int c = 2;
  public static final int d = 1;
  public static final int e = 0;
  public static final int f = 1;
  private static final int g = 250;
  Handler jdField_a_of_type_AndroidOsHandler;
  private FrameLayout jdField_a_of_type_AndroidWidgetFrameLayout;
  public LinearLayout a;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private AddContactsView jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView;
  public ContactBaseView.IAddContactContext a;
  private ContactBaseView jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView;
  private PublicView jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactPublicView;
  private TroopView jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView;
  private TabBarView.OnTabChangeListener jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener;
  private TabBarView jdField_a_of_type_ComTencentMobileqqWidgetTabBarView;
  public boolean a;
  
  public AddContactsActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext = new lpm(this);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener = new lpp(this);
    jdField_a_of_type_AndroidOsHandler = new lpq(this);
  }
  
  private void a()
  {
    ((TextView)findViewById(2131297034)).setText(2131368389);
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131296923));
    if (ImmersiveUtils.isSupporImmersive() == 1)
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.setFitsSystemWindows(true);
      jdField_a_of_type_AndroidWidgetLinearLayout.setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    String str2 = getIntent().getStringExtra("leftViewText");
    String str1 = str2;
    if (str2 == null) {
      str1 = "联系人";
    }
    jdField_a_of_type_AndroidWidgetTextView.setText(str1);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView = ((TabBarView)findViewById(2131300799));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setOnTabChangeListener(jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0, getString(2131368323));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0).setContentDescription("已选定" + getString(2131368323));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1, getString(2131368324));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1).setContentDescription(getString(2131368324));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(2, getString(2131368325));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(2).setContentDescription(getString(2131368325));
    jdField_a_of_type_AndroidWidgetFrameLayout = ((FrameLayout)findViewById(2131300800));
  }
  
  public static void a(Activity paramActivity)
  {
    paramActivity.startActivity(new Intent(paramActivity, AddContactsActivity.class));
  }
  
  public static void a(Activity paramActivity, int paramInt)
  {
    Intent localIntent = new Intent(paramActivity, AddContactsActivity.class);
    localIntent.putExtra("tab_index_key", paramInt);
    paramActivity.startActivity(localIntent);
  }
  
  private void a(ContactBaseView paramContactBaseView)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != paramContactBaseView)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != null)
      {
        if (isResume()) {
          jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.f();
        }
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.g();
      }
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView = paramContactBaseView;
      if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.e();
        if (isResume()) {
          jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.b();
        }
        jdField_a_of_type_AndroidWidgetFrameLayout.removeAllViews();
        jdField_a_of_type_AndroidWidgetFrameLayout.addView(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView);
      }
    }
  }
  
  private void b()
  {
    int i = getIntent().getIntExtra("tab_index_key", 0);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(i, true);
  }
  
  public static void b(Activity paramActivity)
  {
    Intent localIntent = new Intent(paramActivity, PublicAccountBrowser.class);
    if ((paramActivity instanceof BaseActivity)) {
      localIntent.putExtra("uin", ((QQAppInterface)((BaseActivity)paramActivity).getAppRuntime()).a());
    }
    localIntent.putExtra("fromLocalUrl", true);
    localIntent.putExtra("hide_operation_bar", true);
    localIntent.putExtra("url", "http://find.qq.com/m/index.html?_wv=1026");
    paramActivity.startActivity(localIntent);
  }
  
  private void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView == null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView = new AddContactsView(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext);
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView.a();
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView);
  }
  
  private void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView == null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView = new TroopView(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext);
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView.a();
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView);
  }
  
  private void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactPublicView == null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactPublicView = new PublicView(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext);
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactPublicView.a();
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactPublicView);
  }
  
  public int a()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView instanceof AddContactsView)) {
      return 0;
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView instanceof TroopView)) {
      return 1;
    }
    return 2;
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130903981);
    getWindow().setBackgroundDrawable(null);
    a();
    b();
    return true;
  }
  
  protected void doOnDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView.c();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView.c();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactPublicView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactPublicView.c();
    }
    super.doOnDestroy();
    PADetailReportUtil.a().a();
  }
  
  protected void doOnPause()
  {
    super.doOnPause();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.f();
    }
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.b();
    }
    if (jdField_a_of_type_Boolean) {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(0);
    }
  }
  
  protected void doOnStart()
  {
    super.doOnStart();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.e();
    }
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1);
  }
  
  protected void doOnStop()
  {
    super.doOnResume();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView.g();
    }
  }
  
  protected boolean onBackEvent()
  {
    LoginWelcomeManager.a(app).b(2);
    if (getIntent().getBooleanExtra("b_t_contacts", false))
    {
      Intent localIntent = new Intent(this, SplashActivity.class);
      localIntent.putExtra("tab_index", MainFragment.c);
      localIntent.putExtra("b_t_c_s_anim", true);
      localIntent.setFlags(603979776);
      startActivity(localIntent);
    }
    finish();
    return true;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    }
    onBackEvent();
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
