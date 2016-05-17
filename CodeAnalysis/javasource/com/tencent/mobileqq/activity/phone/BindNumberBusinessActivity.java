package com.tencent.mobileqq.activity.phone;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.utils.NetworkUtil;
import lxv;
import lxw;
import lxx;

public class BindNumberBusinessActivity
  extends DialogBaseActivity
  implements Handler.Callback, TextWatcher, View.OnClickListener, CompoundButton.OnCheckedChangeListener
{
  static final int jdField_a_of_type_Int = 1;
  protected static final String a = "BindNumberBusinessActivity";
  static final int jdField_b_of_type_Int = 2;
  static final int jdField_c_of_type_Int = 3;
  static final int jdField_d_of_type_Int = 4;
  static final int e = 5;
  static final int f = 6;
  static final int g = 2;
  public Handler a;
  private View jdField_a_of_type_AndroidViewView;
  public Button a;
  private CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  public EditText a;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  boolean jdField_a_of_type_Boolean;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  public String b;
  private boolean jdField_b_of_type_Boolean;
  public String c;
  private boolean jdField_c_of_type_Boolean;
  private String jdField_d_of_type_JavaLangString;
  private int h;
  
  public BindNumberBusinessActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidOsHandler = null;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_JavaLangString = "+86";
    d = "中国";
  }
  
  private void a()
  {
    if (jdField_c_of_type_Boolean) {
      setTitle("更换手机号码");
    }
    for (;;)
    {
      if (jdField_b_of_type_Boolean) {
        setLeftButton(2131366996, null);
      }
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298486));
      jdField_b_of_type_AndroidWidgetTextView.setText(d + " " + jdField_b_of_type_JavaLangString);
      if (AppSetting.i) {
        jdField_b_of_type_AndroidWidgetTextView.setContentDescription(jdField_b_of_type_AndroidWidgetTextView.getText() + "按钮");
      }
      jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131298487));
      jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(this);
      jdField_a_of_type_AndroidWidgetEditText.setSingleLine();
      jdField_a_of_type_AndroidViewView = findViewById(2131298489);
      jdField_a_of_type_AndroidViewView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131297755));
      jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
      jdField_a_of_type_AndroidWidgetCheckBox.setContentDescription("已同意");
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298490));
      jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298488));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
      if (jdField_c_of_type_JavaLangString != null) {
        jdField_a_of_type_AndroidWidgetEditText.setText(jdField_c_of_type_JavaLangString);
      }
      return;
      setTitle("绑定手机号码");
    }
  }
  
  public static void a(Activity paramActivity, String paramString, boolean paramBoolean)
  {
    Intent localIntent = new Intent(paramActivity, BindNumberBusinessActivity.class);
    localIntent.putExtra("phone_number", paramString);
    localIntent.putExtra("cmd_param_bind_type", 1);
    localIntent.putExtra("unbind", paramBoolean);
    paramActivity.startActivity(localIntent);
  }
  
  private void b()
  {
    jdField_c_of_type_JavaLangString = jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    RespondQueryQQBindingStat localRespondQueryQQBindingStat = ((PhoneContactManager)app.getManager(10)).a();
    if ((jdField_c_of_type_Boolean) && (localRespondQueryQQBindingStat != null) && (TextUtils.equals(jdField_c_of_type_JavaLangString, mobileNo)))
    {
      b(2131362895);
      return;
    }
    if ((jdField_b_of_type_JavaLangString.equalsIgnoreCase("+86")) && (jdField_c_of_type_JavaLangString.length() != 11))
    {
      b(2131362892);
      return;
    }
    c();
  }
  
  private void c()
  {
    if (!NetworkUtil.e(this))
    {
      b(2131368515);
      return;
    }
    jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
    if (jdField_c_of_type_Boolean)
    {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(3);
      return;
    }
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(5);
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    Button localButton = jdField_a_of_type_AndroidWidgetButton;
    if ((paramEditable.length() > 0) && (jdField_a_of_type_AndroidWidgetCheckBox.isChecked())) {}
    for (boolean bool = true;; bool = false)
    {
      localButton.setEnabled(bool);
      return;
    }
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 2) && (paramInt2 != 0))
    {
      setResult(paramInt2);
      finish();
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper(), this);
    paramBundle = getIntent();
    if (paramBundle != null)
    {
      jdField_c_of_type_Boolean = paramBundle.getBooleanExtra("unbind", false);
      jdField_c_of_type_JavaLangString = getIntent().getStringExtra("phone_number");
      jdField_b_of_type_Boolean = getIntent().getBooleanExtra("key_is_first_activity", false);
      h = getIntent().getIntExtra("cmd_param_bind_type", 1);
    }
    setContentView(2130903422);
    a();
    return true;
  }
  
  protected void doOnDestroy()
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
    super.doOnDestroy();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (jdField_a_of_type_AndroidWidgetEditText == null) {
      return;
    }
    jdField_a_of_type_AndroidWidgetEditText.postDelayed(new lxv(this), 300L);
  }
  
  public void finish()
  {
    super.finish();
    if (jdField_b_of_type_Boolean) {
      overridePendingTransition(2130968589, 2130968767);
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      throw new RuntimeException("Unknown message: " + what);
    case 3: 
      jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lxw(this);
      app.registObserver(jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      paramMessage = (PhoneContactManager)app.getManager(10);
      a(2131368360, 1000L, true);
      paramMessage.b(jdField_b_of_type_JavaLangString, jdField_c_of_type_JavaLangString, h, false, false);
    }
    do
    {
      return true;
      paramMessage = new Intent(this, BindVerifyActivity.class);
      paramMessage.putExtra("kBindType", h);
      paramMessage.putExtra("k_number", jdField_c_of_type_JavaLangString);
      paramMessage.putExtra("kShowAgree", false);
      paramMessage.putExtra("k_country_code", jdField_b_of_type_JavaLangString);
      if ((paramMessage != null) && (!isFinishing()))
      {
        paramMessage.addFlags(536870912);
        startActivityForResult(paramMessage, 2);
      }
      finish();
      return true;
      if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
      {
        jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lxx(this);
        app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      }
      jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(jdField_b_of_type_JavaLangString, jdField_c_of_type_JavaLangString, 1, false, false);
    } while (5 != what);
    a(2131368360, 1000L, true);
    return true;
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    paramCompoundButton = jdField_a_of_type_AndroidWidgetButton;
    if ((jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim().length() > 0) && (jdField_a_of_type_AndroidWidgetCheckBox.isChecked())) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      paramCompoundButton.setEnabled(paramBoolean);
      if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
        break;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setContentDescription("已同意");
      return;
    }
    jdField_a_of_type_AndroidWidgetCheckBox.setContentDescription("未同意");
  }
  
  public void onClick(View paramView)
  {
    boolean bool = false;
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131298488: 
      b();
      return;
    case 2131298490: 
      paramView = new Intent(this, TosActivity.class);
      paramView.putExtra("frombusiness", 0);
      startActivity(paramView);
      return;
    }
    paramView = jdField_a_of_type_AndroidWidgetCheckBox;
    if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
      bool = true;
    }
    paramView.setChecked(bool);
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
