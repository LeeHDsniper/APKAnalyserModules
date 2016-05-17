import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.FriendTabView;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mkz
  implements View.OnClickListener
{
  public mkz(FriendTabView paramFriendTabView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    QLog.d("FriendTabView", 2, "----->onBuddyListClick");
    mno localMno = (mno)paramView.getTag();
    String str;
    boolean bool;
    if ((localMno != null) && (jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_JavaLangObject != null))
    {
      str = "";
      if (!(jdField_a_of_type_JavaLangObject instanceof Friends)) {
        break label233;
      }
      str = ((Friends)jdField_a_of_type_JavaLangObject).getFriendNickWithAlias();
      if (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled())
      {
        if (!b.startsWith("+")) {
          break label259;
        }
        bool = a.a.a(b, str, 4, "-1", "");
        label110:
        if (QLog.isDevelopLevel()) {
          QLog.d("FriendTabView", 2, "----->onBuddyListClick = " + bool);
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
        if (AppSetting.i)
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label284;
          }
          paramView.setContentDescription(d.getText().toString() + "已选中,双击取消");
        }
      }
    }
    for (;;)
    {
      a.c();
      if (AppSetting.i) {
        paramView.postDelayed(new mla(this, paramView), 2000L);
      }
      return;
      label233:
      if (!(jdField_a_of_type_JavaLangObject instanceof PhoneContact)) {
        break;
      }
      str = jdField_a_of_type_JavaLangObject).name;
      break;
      label259:
      bool = a.a.a(b, str, 0, "-1", "");
      break label110;
      label284:
      paramView.setContentDescription(d.getText().toString() + "未选中,双击选中");
    }
  }
}
