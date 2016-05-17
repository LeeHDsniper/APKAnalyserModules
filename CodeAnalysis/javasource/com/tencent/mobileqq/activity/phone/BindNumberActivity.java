package com.tencent.mobileqq.activity.phone;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.text.Editable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.activity.PhoneUnityBindInfoActivity;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeManager;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.PhoneCodeUtils;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.TelephonyUtils;
import lxn;
import lxo;
import lxp;
import lxq;
import lxr;
import lxs;

public class BindNumberActivity
  extends DialogBaseActivity
  implements Handler.Callback, TextWatcher, View.OnClickListener, CompoundButton.OnCheckedChangeListener
{
  static final int jdField_a_of_type_Int = 2;
  public static final String a = "http://vac.qq.com/hall/phone/phone_tos.html?_wv=3";
  private static final int jdField_b_of_type_Int = 1;
  public static final String b = "key_is_modal_pop";
  private static final int jdField_c_of_type_Int = 0;
  public static final String c = "key_change_number";
  private static final int jdField_d_of_type_Int = 2;
  public static final String d = "key_is_qqwifi";
  private static final int jdField_e_of_type_Int = 3;
  public static final String e = "key_from_setting";
  private static final int jdField_f_of_type_Int = 4;
  public static final String f = "key_from_Tab";
  public static final String g = "k_is_block";
  public static final String h = "k_block_time";
  private static final int i = 0;
  public static final String i = "k_block_msg";
  private static final int j = 1;
  public static final String j = "key_is_from_qav_multi_call";
  private static final int k = 2;
  public static final String k = "key_is_from_qqhotspot";
  private static final int l = 3;
  public static final String l = "key_user_cancel";
  private Handler jdField_a_of_type_AndroidOsHandler;
  private View jdField_a_of_type_AndroidViewView;
  public Button a;
  private CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  public EditText a;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  public QQCustomDialog a;
  private boolean jdField_a_of_type_Boolean;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private ContactBindObserver jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  public QQCustomDialog b;
  private boolean jdField_b_of_type_Boolean;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  public QQCustomDialog c;
  private boolean jdField_c_of_type_Boolean;
  private TextView jdField_d_of_type_AndroidWidgetTextView;
  private boolean jdField_d_of_type_Boolean;
  private boolean jdField_e_of_type_Boolean;
  private boolean jdField_f_of_type_Boolean;
  private int jdField_g_of_type_Int;
  private boolean jdField_g_of_type_Boolean;
  private int h;
  public String m;
  public String n;
  private String o;
  
  public BindNumberActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    m = "+86";
    o = "中国";
    jdField_b_of_type_Boolean = false;
    jdField_g_of_type_Int = -100000;
    jdField_c_of_type_Boolean = false;
    d = false;
    e = false;
    f = false;
    h = -1;
    jdField_g_of_type_Boolean = false;
  }
  
  private void a()
  {
    n = jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    if ((m.equalsIgnoreCase("+86")) && (n.length() != 11))
    {
      b(2131362892);
      return;
    }
    if (!NetworkUtil.e(this))
    {
      b(2131368515);
      return;
    }
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(0);
      return;
    }
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(2);
  }
  
  private void a(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("IphoneTitleBarActivity", 2, "finish2, reason = " + paramInt + ", isReqBlock = " + jdField_b_of_type_Boolean);
    }
    PhoneContactManagerImp localPhoneContactManagerImp = (PhoneContactManagerImp)app.getManager(10);
    if ((paramInt == 0) && (!jdField_b_of_type_Boolean)) {}
    for (boolean bool = true;; bool = false)
    {
      localPhoneContactManagerImp.a(bool);
      super.finish();
      if (jdField_c_of_type_Boolean) {
        overridePendingTransition(2130968589, 2130968767);
      }
      return;
    }
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
    if ((paramInt1 == 1) && (paramInt2 == -1))
    {
      o = paramIntent.getStringExtra("k_name");
      m = ("+" + paramIntent.getStringExtra("k_code"));
      paramIntent = o + " " + m;
      localRect = new Rect();
      jdField_b_of_type_AndroidWidgetTextView.getPaint().getTextBounds(paramIntent, 0, paramIntent.length(), localRect);
      paramInt1 = getResources().getDimensionPixelSize(2131493687);
      paramInt2 = getResources().getDimensionPixelSize(2131493688);
      if (right > paramInt1 - paramInt2)
      {
        jdField_b_of_type_AndroidWidgetTextView.setText(m);
        if (AppSetting.i) {
          jdField_b_of_type_AndroidWidgetTextView.setContentDescription(jdField_b_of_type_AndroidWidgetTextView.getText() + "按钮");
        }
      }
    }
    while ((paramInt1 != 2) || (paramInt2 == 0)) {
      for (;;)
      {
        Rect localRect;
        return;
        jdField_b_of_type_AndroidWidgetTextView.setText(paramIntent);
      }
    }
    setResult(paramInt2, paramIntent);
    if (paramInt2 == -1)
    {
      if (!getIntent().getBooleanExtra("key_from_setting", false)) {
        break label349;
      }
      ReportController.b(app, "CliOper", "", "", "0X80053E2", "0X80053E2", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      if (f)
      {
        paramIntent = new Intent(this, PhoneUnityBindInfoActivity.class);
        paramIntent.putExtra("kSrouce", h);
        paramIntent.putExtra("kBindNew", true);
        startActivity(paramIntent);
      }
      if (getIntent().getExtras().containsKey("b_t_contacts")) {
        LoginWelcomeManager.a(app).a(this, false, false);
      }
      a(3);
      return;
      label349:
      if (getIntent().getBooleanExtra("key_from_Tab", false)) {
        ReportController.b(app, "CliOper", "", "", "0X80053DC", "0X80053DC", 0, 0, "", "", "", "");
      }
    }
  }
  
  public void doOnBackPressed()
  {
    if ((leftViewNotBack == null) || (leftView == null)) {
      super.doOnBackPressed();
    }
    while ((leftViewNotBack.getVisibility() != 0) && (leftView.getVisibility() != 0)) {
      return;
    }
    if (getIntent().getBooleanExtra("k_is_block", false)) {
      ReportController.b(app, "CliOper", "", "", "0X80053D4", "0X80053D4", 0, 0, "", "", "", "");
    }
    super.doOnBackPressed();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    h = getIntent().getIntExtra("kSrouce", -1);
    setContentView(2130903421);
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper(), this);
    jdField_a_of_type_Boolean = getIntent().getBooleanExtra("kNeedUnbind", false);
    jdField_c_of_type_Boolean = getIntent().getBooleanExtra("key_is_modal_pop", false);
    d = getIntent().getBooleanExtra("cmd_param_is_from_uni", false);
    e = getIntent().getBooleanExtra("cmd_param_is_from_change_bind", false);
    f = getIntent().getBooleanExtra("kUnityWebBind", false);
    jdField_g_of_type_Boolean = getIntent().getBooleanExtra("key_is_from_qav_multi_call", false);
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298484));
    if (getIntent().getBooleanExtra("key_change_number", false))
    {
      setTitle("更改手机号", "请输入手机号码");
      if (jdField_c_of_type_Boolean) {
        setLeftButton(2131368840, null);
      }
      if (!getIntent().getBooleanExtra("key_is_qqwifi", false)) {
        break label682;
      }
      jdField_c_of_type_AndroidWidgetTextView.setText("首次使用QQWiFi功能时，需要验证你的手机号码并推荐绑定通讯录。");
      label206:
      if (d)
      {
        setTitle("获取验证码", "请输入手机号码");
        jdField_c_of_type_AndroidWidgetTextView.setText("绑定手机号码需要通过短信验证。");
        jdField_c_of_type_AndroidWidgetTextView.setGravity(1);
        jdField_c_of_type_AndroidWidgetTextView.setTextColor(Color.rgb(74, 74, 74));
        leftView.setText(2131366418);
      }
      if (getIntent().getExtras().containsKey("b_t_contacts"))
      {
        leftView.setText(2131366418);
        LoginWelcomeManager.a(app).a(this, 0, findViewById(2131298485));
      }
      paramBundle = TelephonyUtils.a(this);
      if (paramBundle == null) {
        break label896;
      }
      o = "";
      m = ('+' + paramBundle[0]);
      n = paramBundle[1];
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298486));
      jdField_b_of_type_AndroidWidgetTextView.setText(o + " " + m);
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
      if (AppSetting.i) {
        jdField_b_of_type_AndroidWidgetTextView.setContentDescription(jdField_b_of_type_AndroidWidgetTextView.getText() + "按钮");
      }
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131297755));
      jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(this);
      jdField_a_of_type_AndroidWidgetCheckBox.setContentDescription("已同意");
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298488));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131298487));
      jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(this);
      jdField_a_of_type_AndroidWidgetEditText.setSingleLine();
      jdField_a_of_type_AndroidWidgetEditText.setText(n);
      if (!TextUtils.isEmpty(n)) {
        jdField_a_of_type_AndroidWidgetEditText.setSelection(n.length());
      }
      jdField_a_of_type_AndroidViewView = findViewById(2131298489);
      jdField_a_of_type_AndroidViewView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298490));
      jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
      if (jdField_g_of_type_Boolean) {
        ReportController.b(app, "CliOper", "", "", "0X8005D0D", "0X8005D0D", 0, 0, "", "", "", "");
      }
      return true;
      setTitle("验证手机号", "请输入手机号码");
      break;
      label682:
      if (getIntent().getBooleanExtra("k_is_block", false))
      {
        jdField_b_of_type_Boolean = true;
        leftViewNotBack.setVisibility(8);
        leftViewNotBack.setOnClickListener(new lxn(this));
        jdField_g_of_type_Int = getIntent().getIntExtra("k_block_time", -100000);
        jdField_c_of_type_AndroidWidgetTextView.setText(getIntent().getStringExtra("k_block_msg"));
        setRightButton(2131369553, this);
        break label206;
      }
      if (jdField_g_of_type_Boolean)
      {
        jdField_c_of_type_AndroidWidgetTextView.setText(2131363818);
        rightViewText.setVisibility(8);
        break label206;
      }
      if (getIntent().getBooleanExtra("key_is_from_qqhotspot", false))
      {
        jdField_c_of_type_AndroidWidgetTextView.setText("首次使用QQ Wi-Fi需要通过短信验证。");
        jdField_c_of_type_AndroidWidgetTextView.setGravity(1);
        break label206;
      }
      paramBundle = app.a().getSharedPreferences("contact_bind_info" + app.getAccount(), 0).getString("K_b_msg", "");
      if (StringUtil.b(paramBundle)) {
        break label206;
      }
      jdField_c_of_type_AndroidWidgetTextView.setText(paramBundle);
      break label206;
      label896:
      paramBundle = PhoneCodeUtils.b(this);
      if (!"86".equals(paramBundle))
      {
        o = "";
        m = ('+' + paramBundle);
      }
    }
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
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
    }
    if (jdField_b_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)
    {
      jdField_b_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      jdField_b_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
    }
    if (jdField_c_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)
    {
      jdField_c_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      jdField_c_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
    }
    super.doOnDestroy();
  }
  
  protected void doOnPause()
  {
    jdField_a_of_type_AndroidOsHandler.removeMessages(4);
    super.doOnPause();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (TextUtils.isEmpty(n)) {
      jdField_a_of_type_AndroidWidgetEditText.postDelayed(new lxo(this), 300L);
    }
    if (jdField_g_of_type_Int > 0) {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(4, 1000L);
    }
    while (jdField_g_of_type_Int == -100000) {
      return;
    }
    leftViewNotBack.setVisibility(0);
  }
  
  public void finish()
  {
    a(0);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    case 1: 
    default: 
      throw new RuntimeException("Unknown message: " + what);
    case 0: 
      jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lxr(this);
      app.registObserver(jdField_b_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      paramMessage = (PhoneContactManager)app.getManager(10);
      a(2131368360, 1000L, true);
      paramMessage.b(d, e);
    }
    do
    {
      do
      {
        return true;
        if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
        {
          jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lxs(this);
          app.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
        }
        jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
        jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(m, n, 0, d, e);
      } while (3 == what);
      a(2131368360, 1000L, true);
      return true;
      int i1 = jdField_g_of_type_Int - 1;
      jdField_g_of_type_Int = i1;
      if (i1 >= 0) {
        break;
      }
    } while (jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim().length() != 0);
    leftViewNotBack.setVisibility(0);
    return true;
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(4, 1000L);
    return true;
  }
  
  protected boolean onBackEvent()
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("key_user_cancel", 1);
    setResult(0, localIntent);
    if (jdField_a_of_type_AndroidWidgetEditText != null) {
      ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(jdField_a_of_type_AndroidWidgetEditText.getWindowToken(), 0);
    }
    finish();
    return false;
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
    switch (paramView.getId())
    {
    }
    label365:
    label462:
    do
    {
      app.logout(true);
      startActivity(new Intent(this, LoginActivity.class));
      a(1);
      ReportController.b(app, "CliOper", "", "", "0X80053D3", "0X80053D3", 0, 0, "", "", "", "");
      for (;;)
      {
        return;
        startActivityForResult(new Intent(this, CountryActivity.class), 1);
        return;
        if (jdField_a_of_type_Boolean)
        {
          if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog == null) {
            jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(this, 230, "更换手机号码", "QQ更换绑定新的手机号码前，需要将当前的绑定关系解除，请确定是否更换。", "确定", "取消", new lxp(this), new lxq(this));
          }
          if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (!jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing()) && (!isFinishing())) {
            jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
          }
          if (getIntent().getBooleanExtra("k_is_block", false)) {
            ReportController.b(app, "CliOper", "", "", "0X80053D6", "0X80053D6", 0, 0, "", "", "", "");
          }
          if (h != 0) {
            break label365;
          }
          ReportController.b(app, "CliOper", "", "", "0X8005B76", "0X8005B76", 1, 0, "", "", "", "");
        }
        for (;;)
        {
          if (!jdField_g_of_type_Boolean) {
            break label462;
          }
          ReportController.b(app, "CliOper", "", "", "0X8005D0E", "0X8005D0E", 0, 0, "", "", "", "");
          return;
          a();
          break;
          if (h == 1) {
            ReportController.b(app, "CliOper", "", "", "0X8005B76", "0X8005B76", 2, 0, "", "", "", "");
          } else if (h == 8) {
            ReportController.b(app, "dc00898", "", "", "0X800650C", "0X800650C", 1, 0, app.f(), "", "", "");
          }
        }
      }
      paramView = new Intent(this, QQBrowserActivity.class);
      paramView.putExtra("url", "http://vac.qq.com/hall/phone/phone_tos.html?_wv=3");
      startActivity(paramView);
      return;
      paramView = jdField_a_of_type_AndroidWidgetCheckBox;
      if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {}
      for (boolean bool = true;; bool = false)
      {
        paramView.setChecked(bool);
        return;
      }
    } while (!jdField_g_of_type_Boolean);
    finish();
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    if (jdField_g_of_type_Int == -1)
    {
      paramCharSequence = leftViewNotBack;
      if (jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim().length() <= 0) {
        break label41;
      }
    }
    label41:
    for (paramInt1 = 8;; paramInt1 = 0)
    {
      paramCharSequence.setVisibility(paramInt1);
      return;
    }
  }
}
