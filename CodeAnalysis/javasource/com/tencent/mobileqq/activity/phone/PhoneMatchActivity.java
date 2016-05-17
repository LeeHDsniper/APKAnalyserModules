package com.tencent.mobileqq.activity.phone;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import lzg;
import lzh;

public class PhoneMatchActivity
  extends DialogBaseActivity
  implements View.OnClickListener
{
  public static final String a = "key_from_Tab";
  public static final String b = "key_from_l_w";
  private Button a;
  public ContactBindObserver a;
  
  public PhoneMatchActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.i();
    setContentViewB(2130903433);
    centerView.setText("通讯录");
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298539));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    setLeftButton(2131368840, this);
    return true;
  }
  
  protected void doOnStop()
  {
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    super.doOnStop();
  }
  
  public void finish()
  {
    super.finish();
    overridePendingTransition(0, 2130968584);
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetButton)
    {
      if (!NetworkUtil.e(this))
      {
        b(2131368515);
        return;
      }
      if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
      {
        jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lzg(this);
        app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      }
      app.a(new lzh(this));
      QQToast.a(BaseApplicationImpl.a, "特征码匹配中。", 0).a();
      if (getIntent().getBooleanExtra("key_from_Tab", false)) {
        ReportController.b(app, "CliOper", "", "", "0X80053DE", "0X80053DE", 0, 0, "", "", "", "");
      }
      if (getIntent().getBooleanExtra("key_from_l_w", false)) {
        ReportController.b(app, "dc00898", "", "", "0X800650C", "0X800650C", 2, 0, app.f(), "", "", "");
      }
      a(2131368360, 1000L, true);
      return;
    }
    finish();
  }
}
