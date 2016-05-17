package com.tencent.mobileqq.activity.phone;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import lzi;
import lzj;

public class PhoneMatchView
  extends BaseActivityView
  implements View.OnClickListener
{
  private static final int g = 1;
  private Button a;
  public ContactBindObserver a;
  
  public PhoneMatchView(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a(2130903433, true);
    j();
  }
  
  private void j()
  {
    jdField_a_of_type_AndroidWidgetButton = ((Button)a(2131298539));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
  }
  
  private void k()
  {
    if (!NetworkUtil.e(getContext()))
    {
      b(2131368515);
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lzi(this);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lzj(this));
    QQToast.a(BaseApplicationImpl.a, "特征码匹配中。", 0).a();
    a(2131368360, 1000L, true);
  }
  
  protected void a()
  {
    super.a();
    b.setText("通讯录");
    if (jdField_a_of_type_Int == 2)
    {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
      jdField_a_of_type_AndroidWidgetTextView.setText(2131370958);
      return;
    }
    if (jdField_a_of_type_Int == 3)
    {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
    if ((paramInt1 == 1) && (paramInt2 != 0))
    {
      if (paramInt2 == 2)
      {
        paramIntent = new Intent(getContext(), BindNumberActivity.class);
        paramIntent.putExtra("kNeedUnbind", true);
        a(paramIntent);
      }
    }
    else {
      return;
    }
    a(new Intent(getContext(), PhoneLaunchActivity.class));
  }
  
  protected void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    super.d();
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetButton)
    {
      k();
      return;
    }
    b(new Intent(getContext(), SettingActivity2.class), 1);
  }
}
