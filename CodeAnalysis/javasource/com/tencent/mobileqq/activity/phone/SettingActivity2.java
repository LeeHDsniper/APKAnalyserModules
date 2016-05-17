package com.tencent.mobileqq.activity.phone;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import lzl;
import lzp;
import lzq;

public class SettingActivity2
  extends DialogBaseActivity
  implements View.OnClickListener
{
  public static final int a = 1001;
  public static final String a = "SettingActivity2";
  public Button a;
  public TextView a;
  public ContactBindObserver a;
  public boolean a;
  public int b;
  public Button b;
  public TextView b;
  public ContactBindObserver b;
  public String b;
  public int c;
  public ContactBindObserver c;
  
  public SettingActivity2()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_Int = -1;
  }
  
  public void a()
  {
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(this, null);
    localActionSheet.setCanceledOnTouchOutside(true);
    localActionSheet.a("停用", 3);
    localActionSheet.d(2131366996);
    localActionSheet.a(new lzl(this, localActionSheet));
    localActionSheet.d(2131366996);
    localActionSheet.show();
  }
  
  public boolean a()
  {
    jdField_b_of_type_Int = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
    RespondQueryQQBindingStat localRespondQueryQQBindingStat = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a();
    if ((1 != jdField_b_of_type_Int) && (2 != jdField_b_of_type_Int)) {}
    try
    {
      jdField_b_of_type_JavaLangString = (nationCode + " " + mobileNo);
      if (TextUtils.isEmpty(jdField_b_of_type_JavaLangString))
      {
        super.finish();
        return false;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("SettingActivity2", 2, "" + jdField_b_of_type_Int, localException);
        }
      }
      if (QLog.isColorLevel()) {
        QLog.d("SettingActivity2", 2, "updateStateLayout mNumber = " + jdField_b_of_type_JavaLangString + ", mState = " + jdField_b_of_type_Int);
      }
      super.setTitle("手机通讯录");
      if (jdField_b_of_type_Int != 4) {
        break label318;
      }
    }
    Object localObject = "启用手机通讯录匹配。如果你的通讯录中有朋友开通此功能，系统会通知你。可在QQ直接给朋友发消息、图片等。";
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298558));
    jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131298559));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton = ((Button)findViewById(2131298560));
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    if (jdField_b_of_type_Int == 4)
    {
      jdField_b_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
    }
    for (;;)
    {
      localObject = (ImageView)findViewById(2131297324);
      ((ImageView)localObject).setVisibility(0);
      if (AppSetting.i) {
        ((ImageView)localObject).setContentDescription(getString(2131370639));
      }
      ((ImageView)localObject).setBackgroundResource(2130838440);
      ((ImageView)localObject).setOnClickListener(this);
      return true;
      label318:
      localObject = "已启用手机通讯录匹配。如果你的通讯录中有朋友开通此功能，系统会通知你。可在QQ直接给朋友发消息、图片等。";
      break;
      jdField_b_of_type_AndroidWidgetButton.setVisibility(0);
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
    }
  }
  
  public void b()
  {
    if (!NetworkUtil.e(this))
    {
      b(2131368515);
      return;
    }
    if (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.e())
    {
      startActivity(new Intent(this, GuideBindPhoneActivity.class));
      return;
    }
    int i = getResources().getDimensionPixelSize(2131492908);
    if (jdField_c_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
    {
      jdField_c_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lzp(this);
      app.registObserver(jdField_c_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
    app.a(new lzq(this));
    QQToast.a(BaseApplicationImpl.a, "特征码匹配中。", 0).b(i);
    a(2131368360, 1000L, true);
  }
  
  public void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    a();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    paramBundle = super.getIntent();
    if (paramBundle == null) {
      super.finish();
    }
    do
    {
      return true;
      jdField_c_of_type_Int = paramBundle.getIntExtra("kSrouce", -1);
      super.setContentView(2130903437);
    } while (a());
    super.finish();
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
    app.a(SettingActivity2.class);
    super.doOnDestroy();
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    switch (i)
    {
    default: 
      throw new RuntimeException("unknown id: " + i);
    case 2131297324: 
      a();
      return;
    case 2131298561: 
      if (!NetworkUtil.e(this))
      {
        b(2131368515);
        return;
      }
      paramView = new Intent(this, BindNumberActivity.class);
      paramView.putExtra("kNeedUnbind", true);
      paramView.putExtra("cmd_param_is_from_uni", true);
      paramView.putExtra("cmd_param_is_from_change_bind", true);
      startActivity(paramView);
      return;
    case 2131298559: 
      ReportController.b(app, "CliOper", "", "", "0X8005B89", "0X8005B89", 0, 0, "", "", "", "");
      b();
      return;
    }
    if (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.e())
    {
      startActivity(new Intent(this, GuideBindPhoneActivity.class));
      return;
    }
    if (jdField_c_of_type_Int == 6)
    {
      super.finish();
      return;
    }
    paramView = new Intent(getActivity(), PhoneFrameActivity.class);
    paramView.putExtra("key_req_type", 5);
    getActivity().startActivity(paramView);
  }
}
