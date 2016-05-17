import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.TextView;
import com.tencent.av.utils.PstnUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.PhoneContactTabView;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;

class mlv
  implements View.OnClickListener
{
  mlv(mlu paramMlu)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    Object localObject1;
    Object localObject2;
    if (paramView.getId() == 2131297680)
    {
      paramView = PstnUtils.a(a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2);
      localObject1 = PstnUtils.b(a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2);
      localObject2 = PstnUtils.c(a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2);
      DialogUtil.a(a.a.jdField_a_of_type_AndroidContentContext, paramView, (String)localObject1, (String)localObject2, new mlw(this), a.a.jdField_a_of_type_AndroidContentContext.getString(2131363870), new mlx(this)).show();
    }
    do
    {
      do
      {
        return;
        localObject1 = (mly)paramView.getTag();
      } while ((localObject1 == null) || (jdField_a_of_type_AndroidWidgetCheckBox == null) || (jdField_a_of_type_ComTencentMobileqqDataPhoneContact == null));
      localObject2 = jdField_a_of_type_ComTencentMobileqqDataPhoneContact;
    } while (!jdField_a_of_type_AndroidWidgetCheckBox.isEnabled());
    boolean bool;
    if (jdField_a_of_type_Boolean) {
      bool = a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, name, 5, "-1", mobileNo);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
      if (!AppSetting.i) {
        break;
      }
      if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
        break label394;
      }
      if (!jdField_a_of_type_Boolean) {
        break label358;
      }
      paramView.setContentDescription(c.getText() + a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369866));
      return;
      if (b.startsWith("+")) {
        bool = a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, name, 4, "-1", mobileNo);
      } else {
        bool = a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, name, 0, "-1", mobileNo);
      }
    }
    label358:
    paramView.setContentDescription(c.getText().toString() + "已选中,双击取消");
    return;
    label394:
    if (jdField_a_of_type_Boolean) {}
    for (int i = a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b);; i = 0)
    {
      if ((jdField_a_of_type_Boolean) && (i != 0))
      {
        paramView.setContentDescription(c.getText() + a.a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(i));
        return;
      }
      paramView.setContentDescription(c.getText().toString() + "未选中,双击选中");
      return;
    }
  }
}
