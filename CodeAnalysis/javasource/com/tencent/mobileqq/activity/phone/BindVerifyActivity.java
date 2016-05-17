package com.tencent.mobileqq.activity.phone;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
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
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.utils.SMSBodyObserver;
import com.tencent.mobileqq.app.utils.SmsContent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import lyb;
import lyc;
import lyd;

public class BindVerifyActivity
  extends DialogBaseActivity
  implements DialogInterface.OnClickListener, Handler.Callback, TextWatcher, View.OnClickListener, CompoundButton.OnCheckedChangeListener, SMSBodyObserver
{
  protected static final int a = 0;
  public static final String a = "k_number";
  public static final String b = "k_country_code";
  private static final int jdField_c_of_type_Int = 1;
  private static final int jdField_d_of_type_Int = 2;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private SmsContent jdField_a_of_type_ComTencentMobileqqAppUtilsSmsContent;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  boolean jdField_a_of_type_Boolean;
  public int b;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  private boolean jdField_b_of_type_Boolean;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  private String jdField_c_of_type_JavaLangString;
  private boolean jdField_c_of_type_Boolean;
  private String jdField_d_of_type_JavaLangString;
  
  public BindVerifyActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Int = 0;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
  }
  
  private void a(Intent paramIntent)
  {
    jdField_b_of_type_Int = paramIntent.getIntExtra("kBindType", 0);
    jdField_a_of_type_Boolean = getIntent().getBooleanExtra("kShowAgree", false);
    jdField_c_of_type_JavaLangString = paramIntent.getStringExtra("k_number");
    d = paramIntent.getStringExtra("k_country_code");
    if (jdField_b_of_type_Int == 0) {
      jdField_a_of_type_AndroidWidgetTextView.setText(getResources().getString(2131362893, new Object[] { jdField_c_of_type_JavaLangString }));
    }
    for (;;)
    {
      if (jdField_a_of_type_Boolean) {
        findViewById(2131298498).setVisibility(0);
      }
      jdField_c_of_type_AndroidWidgetTextView.setText("重新发送");
      jdField_c_of_type_AndroidWidgetTextView.setEnabled(false);
      jdField_a_of_type_AndroidOsHandler.removeMessages(1);
      jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(jdField_a_of_type_AndroidOsHandler.obtainMessage(1, 60, 0), 1000L);
      return;
      if (1 == jdField_b_of_type_Int) {
        jdField_a_of_type_AndroidWidgetTextView.setText(getResources().getString(2131362894, new Object[] { jdField_c_of_type_JavaLangString }));
      }
    }
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
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lyc(this);
      app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
    if (getIntent().getBooleanExtra("k_is_block", false)) {
      ReportController.b(app, "CliOper", "", "", "0X80056B5", "0X80056B5", 0, 0, "", "", "", "");
    }
    if ((getIntent() != null) && (getIntent().getBooleanExtra("key_is_from_qav_multi_call", false))) {
      ReportController.b(app, "CliOper", "", "", "0X8005D0F", "0X8005D0F", 0, 0, "", "", "", "");
    }
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(jdField_a_of_type_AndroidWidgetEditText.getText().toString(), jdField_b_of_type_Int, jdField_b_of_type_Boolean, jdField_c_of_type_Boolean);
    a(2131368360, 1000L, true);
  }
  
  public void a()
  {
    if ((jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) && (jdField_a_of_type_AndroidWidgetEditText.getText().toString().length() >= 4))
    {
      jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      return;
    }
    jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    a();
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt2 != 0)
    {
      setResult(paramInt2);
      finish();
    }
  }
  
  public void doOnBackPressed()
  {
    QQAppInterface localQQAppInterface;
    if (getIntent().getBooleanExtra("k_is_block", false))
    {
      localQQAppInterface = app;
      if (jdField_a_of_type_AndroidWidgetEditText.getText().toString().length() < 4) {
        break label66;
      }
    }
    label66:
    for (int i = 1;; i = 0)
    {
      ReportController.b(localQQAppInterface, "CliOper", "", "", "0X80056B6", "0X80056B6", i, 0, "", "", "", "");
      super.doOnBackPressed();
      return;
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    jdField_b_of_type_Boolean = getIntent().getBooleanExtra("cmd_param_is_from_uni", false);
    jdField_c_of_type_Boolean = getIntent().getBooleanExtra("cmd_param_is_from_change_bind", false);
    setContentView(2130903424);
    if (jdField_b_of_type_Boolean)
    {
      setTitle("填写验证码");
      ReportController.b(app, "CliOper", "", "", "0X8005B79", "0X8005B79", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298495));
      jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131298496));
      jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(this);
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298488));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131297755));
      jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298490));
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298497));
      jdField_c_of_type_AndroidWidgetTextView.setOnClickListener(this);
      jdField_a_of_type_AndroidOsHandler = new Handler(this);
      a(getIntent());
      jdField_a_of_type_ComTencentMobileqqAppUtilsSmsContent = new SmsContent(null, System.currentTimeMillis());
      jdField_a_of_type_ComTencentMobileqqAppUtilsSmsContent.a(this, this);
      return true;
      setTitle("验证手机号码");
    }
  }
  
  protected void doOnDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppUtilsSmsContent != null) {
      jdField_a_of_type_ComTencentMobileqqAppUtilsSmsContent.a();
    }
    jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
    super.doOnDestroy();
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    a(paramIntent);
  }
  
  public void handleMessage(String paramString1, String paramString2)
  {
    paramString1 = Utils.d(paramString1, paramString2);
    if (!TextUtils.isEmpty(paramString1)) {
      jdField_a_of_type_AndroidOsHandler.obtainMessage(2, paramString1).sendToTarget();
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return true;
    case 1: 
      int i = arg1 - 1;
      arg1 = i;
      if (i <= 0)
      {
        jdField_c_of_type_AndroidWidgetTextView.setEnabled(true);
        jdField_c_of_type_AndroidWidgetTextView.setText("重新发送");
        return true;
      }
      jdField_c_of_type_AndroidWidgetTextView.setText("重新发送(" + i + ")");
      jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(jdField_a_of_type_AndroidOsHandler.obtainMessage(1, i, 0), 1000L);
      return true;
    }
    paramMessage = (String)obj;
    jdField_a_of_type_AndroidWidgetEditText.setText(paramMessage);
    jdField_a_of_type_AndroidWidgetEditText.setSelection(paramMessage.length());
    return true;
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    if (paramCompoundButton == jdField_a_of_type_AndroidWidgetCheckBox) {
      a();
    }
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = new Intent();
    paramDialogInterface.putExtra("bind_mobile", jdField_a_of_type_AndroidWidgetTextView.getText().toString().trim());
    if (paramInt == 1)
    {
      ReportController.b(app, "CliOper", "", "", "0X8005B7A", "0X8005B7A", 0, 0, "", "", "", "");
      app.a(new lyd(this));
      ReportController.b(app, "CliOper", "", "", "0X8005B18", "0X8005B18", 0, 0, "", "", "", "");
      QQToast.a(BaseApplicationImpl.a, "特征码匹配中。", 0).a();
    }
    for (;;)
    {
      setResult(-1, paramDialogInterface);
      finish();
      return;
      if (paramInt == 0)
      {
        ReportController.b(app, "CliOper", "", "", "0X8005B7B", "0X8005B7B", 0, 0, "", "", "", "");
        paramDialogInterface.putExtra("refuse_upload", true);
      }
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131298488: 
      b();
      return;
    case 2131298497: 
      if (jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
      {
        jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lyb(this);
        app.registObserver(jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      }
      jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(d, jdField_c_of_type_JavaLangString);
      if (getIntent().getBooleanExtra("k_is_block", false)) {
        ReportController.b(app, "CliOper", "", "", "0X800568C", "0X800568C", 1, 0, "", "", "", "");
      }
      a(2131368360, 1000L, true);
      return;
    }
    paramView = new Intent(this, TosActivity.class);
    paramView.putExtra("frombusiness", 0);
    startActivity(paramView);
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
