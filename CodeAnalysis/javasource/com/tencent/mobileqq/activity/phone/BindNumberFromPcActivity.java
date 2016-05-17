package com.tencent.mobileqq.activity.phone;

import SecurityAccountServer.RespondQueryQQBindingStat;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import lya;

public class BindNumberFromPcActivity
  extends DialogBaseActivity
  implements View.OnClickListener
{
  protected static final int a = 1;
  public Button a;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  public String a;
  private boolean jdField_a_of_type_Boolean;
  private Button jdField_b_of_type_AndroidWidgetButton;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  public String b;
  private String c;
  
  public BindNumberFromPcActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void a()
  {
    setTitle("验证手机号码");
    if (jdField_a_of_type_Boolean) {
      setLeftButton(2131368840, null);
    }
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298492));
    int i = jdField_a_of_type_JavaLangString.length();
    String str = jdField_a_of_type_JavaLangString.substring(0, i - 5) + "****" + jdField_a_of_type_JavaLangString.substring(i - 1);
    jdField_a_of_type_AndroidWidgetTextView.setText(jdField_b_of_type_JavaLangString + " " + str);
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298491));
    jdField_b_of_type_AndroidWidgetTextView.setText(getResources().getString(2131362896, new Object[] { c }));
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298493));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131298494));
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
  }
  
  private void b()
  {
    if (!NetworkUtil.e(this))
    {
      b(2131368515);
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lya(this);
      app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
    jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(jdField_b_of_type_JavaLangString, jdField_a_of_type_JavaLangString);
    a(2131368360, 1000L, true);
  }
  
  private void c()
  {
    Intent localIntent = new Intent(this, BindNumberActivity.class);
    localIntent.putExtra("key_change_number", true);
    startActivityForResult(localIntent, 1);
  }
  
  public void finish()
  {
    super.finish();
    if (jdField_a_of_type_Boolean) {
      overridePendingTransition(2130968589, 2130968767);
    }
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
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131298493: 
      b();
      return;
    }
    c();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903423);
    int i = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
    paramBundle = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a();
    if ((i != 2) || (paramBundle == null))
    {
      a("请求错误", "请稍后重试");
      return;
    }
    jdField_b_of_type_JavaLangString = nationCode;
    jdField_a_of_type_JavaLangString = mobileNo;
    c = new SimpleDateFormat("yyyy-MM-dd").format(new Date(bindingTime * 1000L));
    jdField_a_of_type_Boolean = getIntent().getBooleanExtra("key_is_first_activity", true);
    a();
  }
  
  protected void onDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    if (jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      app.unRegistObserver(jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    super.onDestroy();
  }
}
