package com.tencent.mobileqq.activity.phone;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQProgressDialog;
import lxy;
import lxz;

public class BindNumberDialogActivity
  extends DialogBaseActivity
{
  static final int jdField_a_of_type_Int = 2;
  protected static final String a = "BindNumberBusinessActivity";
  Handler jdField_a_of_type_AndroidOsHandler;
  public ContactBindObserver a;
  boolean jdField_a_of_type_Boolean;
  public int b;
  public String b;
  public boolean b;
  public String c;
  
  public BindNumberDialogActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidOsHandler = null;
    jdField_b_of_type_JavaLangString = "+86";
  }
  
  private void a()
  {
    if (!NetworkUtil.e(this))
    {
      b(2131368515);
      finish();
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lxz(this);
      app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(jdField_b_of_type_JavaLangString, c, 1, false, false);
    a(2131368360, 1000L, true);
  }
  
  public static void a(Activity paramActivity, String paramString, boolean paramBoolean, int paramInt)
  {
    Intent localIntent = new Intent(paramActivity, BindNumberDialogActivity.class);
    localIntent.putExtra("phone_number", paramString);
    localIntent.putExtra("cmd_param_bind_type", 1);
    localIntent.putExtra("unbind", paramBoolean);
    paramActivity.startActivityForResult(localIntent, paramInt);
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    paramBundle = getIntent();
    if (paramBundle != null)
    {
      jdField_b_of_type_Boolean = paramBundle.getBooleanExtra("unbind", false);
      c = paramBundle.getStringExtra("phone_number");
      jdField_b_of_type_Int = paramBundle.getIntExtra("cmd_param_bind_type", 0);
      paramBundle = (PhoneContactManager)app.getManager(10);
      if (jdField_b_of_type_Boolean) {
        break label148;
      }
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lxy(this, paramBundle);
      app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      paramBundle = (PhoneContactManager)app.getManager(10);
      if (NetworkUtil.e(this)) {
        break label123;
      }
      b(2131368515);
      finish();
    }
    label123:
    do
    {
      return true;
      a(2131367051, 0L, true);
    } while (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null);
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCancelable(false);
    return true;
    label148:
    BindNumberBusinessActivity.a(this, c, jdField_b_of_type_Boolean);
    finish();
    return true;
  }
  
  protected void doOnDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    super.doOnDestroy();
  }
  
  public void finish()
  {
    super.finish();
    if (jdField_a_of_type_Boolean) {
      overridePendingTransition(2130968589, 2130968767);
    }
  }
}
