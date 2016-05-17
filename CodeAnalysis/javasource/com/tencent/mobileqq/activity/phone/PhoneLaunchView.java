package com.tencent.mobileqq.activity.phone;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class PhoneLaunchView
  extends BaseActivityView
  implements View.OnClickListener
{
  private static final int g = 1;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private boolean jdField_a_of_type_Boolean;
  
  public PhoneLaunchView(Activity paramActivity, int paramInt)
  {
    super(paramActivity, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a(2130903432);
    jdField_a_of_type_AndroidWidgetButton = ((Button)a(2131298535));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
  }
  
  private void j()
  {
    Intent localIntent = new Intent(getContext(), BindNumberActivity.class);
    localIntent.putExtra("key_is_modal_pop", true);
    b(localIntent, 1);
    a(2130968765, 2130968589);
  }
  
  protected void a()
  {
    super.a();
    if (jdField_a_of_type_Int == 3) {
      b.setText("通讯录");
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      if (jdField_a_of_type_Boolean) {
        j();
      }
      return;
      b.setText("启用通讯录");
    }
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == 1)
    {
      if (jdField_a_of_type_Int != 1) {
        break label26;
      }
      jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setResult(paramInt2);
      f();
    }
    label26:
    do
    {
      return;
      if (paramInt2 == -1)
      {
        if ((paramIntent != null) && (paramIntent.getBooleanExtra("refuse_upload", false)))
        {
          f();
          return;
        }
        a(new Intent(getContext(), ContactListView.class));
        return;
      }
    } while (paramInt2 != 1);
    f();
  }
  
  protected void a(Intent paramIntent, PhoneInnerFrame paramPhoneInnerFrame)
  {
    if ((paramIntent != null) && (paramIntent.getBooleanExtra("k_start_number", false))) {
      jdField_a_of_type_Boolean = true;
    }
    super.a(paramIntent, paramPhoneInnerFrame);
    if (jdField_a_of_type_Int == 3)
    {
      ((ImageView)a(2131298533)).setImageResource(2130838571);
      ((TextView)a(2131298534)).setText(2131369399);
    }
  }
  
  public void onClick(View paramView)
  {
    int i;
    if (paramView == jdField_a_of_type_AndroidWidgetButton)
    {
      i = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "QQPim", "Clk_address_on", 0, 0, "", "", "", "");
      if (i == 1) {
        j();
      }
    }
    else
    {
      return;
    }
    if (i == 2)
    {
      b(new Intent(getContext(), BindNumberFromPcActivity.class), 1);
      a(2130968765, 2130968589);
      return;
    }
    a("请求出错", "请稍后重试");
  }
}
