package com.tencent.mobileqq.activity.phone;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import lze;
import lzf;

public class PhoneLaunchActivity
  extends DialogBaseActivity
  implements View.OnClickListener
{
  private static final int jdField_a_of_type_Int = 1;
  public static final String a = "needAlert";
  private static final int jdField_b_of_type_Int = 2;
  public static final String b = "fromStopAndMatch";
  public static final String c = "fromCall";
  public static final String d = "fromPermiPriv";
  public static final String e = "fromAVCallInvite";
  public static final String f = "returnAndFinish";
  public static final String g = "key_is_first_activity";
  public static final String h = "k_start_number";
  private Button jdField_a_of_type_AndroidWidgetButton;
  public ContactBindObserver a;
  private boolean jdField_a_of_type_Boolean;
  private boolean jdField_b_of_type_Boolean;
  private boolean c;
  private boolean d;
  private boolean e;
  
  public PhoneLaunchActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    b = false;
    c = false;
    d = false;
    e = false;
  }
  
  private void b()
  {
    Intent localIntent = new Intent(this, BindNumberActivity.class);
    if (getIntent().getIntExtra("kSrouce", -1) == 8) {
      localIntent.putExtra("kSrouce", 8);
    }
    startActivityForResult(localIntent, 1);
  }
  
  public void a()
  {
    if (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.e())
    {
      startActivity(new Intent(this, GuideBindPhoneActivity.class));
      jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      return;
    }
    if (!NetworkUtil.e(this))
    {
      b(2131368515);
      jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lze(this);
      app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
    app.a(new lzf(this));
    a(2131368360, 1000L, true);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == 1) {
      if (paramInt2 != 0) {
        finish();
      }
    }
    while ((paramInt2 != 2) || (!jdField_a_of_type_Boolean) || (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.c())) {
      return;
    }
    finish();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    getIntent().putExtra("fling_action_key", 0);
    super.doOnCreate(paramBundle);
    boolean bool = getIntent().hasExtra("needAlert");
    jdField_a_of_type_Boolean = getIntent().getBooleanExtra("fromStopAndMatch", false);
    b = getIntent().getBooleanExtra("fromCall", false);
    c = getIntent().getBooleanExtra("fromPermiPriv", false);
    d = getIntent().getBooleanExtra("fromAVCallInvite", false);
    e = getIntent().getBooleanExtra("returnAndFinish", false);
    if ((!bool) && (paramBundle == null) && (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.b()))
    {
      finish();
      return false;
    }
    if (bool)
    {
      paramBundle = ContactUtils.a(app, null);
      int i = Integer.valueOf(paramBundle[1]).intValue();
      int j = Integer.valueOf(paramBundle[2]).intValue();
      ContactUtils.a(app, System.currentTimeMillis(), i + 1, j);
    }
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.i();
    if (!jdField_a_of_type_Boolean) {
      if (getIntent().getStringExtra("leftViewText") == null) {
        getIntent().putExtra("leftViewText", "联系人");
      }
    }
    for (;;)
    {
      setContentView(2130903432);
      setTitle("启用通讯录");
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298535));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      if (getIntent().getBooleanExtra("k_start_number", false)) {
        b();
      }
      return true;
      getIntent().putExtra("leftViewText", "关闭");
    }
  }
  
  public void finish()
  {
    super.finish();
    if (!jdField_a_of_type_Boolean) {
      overridePendingTransition(2130968589, 2130968767);
    }
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetButton)
    {
      int i = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
      if (i == 1) {
        b();
      }
      for (;;)
      {
        paramView = app.a().getSharedPreferences("contact_bind_info" + app.getAccount(), 0).edit();
        paramView.putLong("contact_bind_strategy_user_closecount", 0L);
        paramView.commit();
        if (d) {
          ReportController.b(app, "CliOper", "", "", "0X8005D10", "0X8005D10", 0, 0, "", "", "", "");
        }
        return;
        if (i == 2)
        {
          paramView = new Intent(this, BindNumberFromPcActivity.class);
          paramView.putExtra("key_is_first_activity", false);
          startActivityForResult(paramView, 1);
        }
        else if (i == 4)
        {
          jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
          a();
        }
        else
        {
          a("请求出错", "请稍后重试");
        }
      }
    }
    paramView = app.a().getSharedPreferences("contact_bind_info" + app.getAccount(), 0);
    long l = paramView.getLong("contact_bind_strategy_user_closecount", 0L);
    if (QLog.isColorLevel()) {
      QLog.d("PhoneLaunchActivity", 2, "UserCloseCount=" + l);
    }
    paramView = paramView.edit();
    paramView.putLong("contact_bind_strategy_user_closecount", l + 1L);
    paramView.commit();
    finish();
  }
}
