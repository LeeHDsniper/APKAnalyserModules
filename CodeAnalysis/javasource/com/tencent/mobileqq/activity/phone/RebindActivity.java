package com.tencent.mobileqq.activity.phone;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.utils.NetworkUtil;
import lzk;

public class RebindActivity
  extends DialogBaseActivity
  implements View.OnClickListener
{
  protected static final int a = 1;
  protected static final String a = "k_uin";
  protected static final String b = "k_number";
  protected static final String c = "k_country_code";
  private Button jdField_a_of_type_AndroidWidgetButton;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  private boolean jdField_a_of_type_Boolean;
  private int jdField_b_of_type_Int;
  private Button jdField_b_of_type_AndroidWidgetButton;
  private boolean jdField_b_of_type_Boolean;
  public String d;
  private String e;
  
  public RebindActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Int = 0;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130903434);
    jdField_a_of_type_Boolean = getIntent().getBooleanExtra("cmd_param_is_from_uni", false);
    jdField_b_of_type_Boolean = getIntent().getBooleanExtra("cmd_param_is_from_change_bind", false);
    e = getIntent().getStringExtra("k_country_code");
    d = getIntent().getStringExtra("k_number");
    jdField_b_of_type_Int = getIntent().getIntExtra("kBindType", 0);
    setTitle("验证手机号码");
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298540));
    jdField_a_of_type_AndroidWidgetTextView.setText(getResources().getString(2131362891, new Object[] { d, getIntent().getStringExtra("k_uin"), app.a() }));
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298541));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131298542));
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
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
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 1) && (paramInt2 != 0))
    {
      setResult(paramInt2);
      finish();
    }
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetButton) {
      if (!NetworkUtil.e(this)) {
        b(2131368515);
      }
    }
    while (paramView != jdField_b_of_type_AndroidWidgetButton)
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
      {
        jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lzk(this);
        app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      }
      jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.b(e, d, jdField_b_of_type_Int, jdField_a_of_type_Boolean, jdField_b_of_type_Boolean);
      a(2131368360, 1000L, true);
      return;
    }
    finish();
  }
}
