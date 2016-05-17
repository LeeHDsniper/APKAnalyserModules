import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.FriendTeamListInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mlc
  implements View.OnClickListener
{
  public mlc(FriendTeamListInnerFrame paramFriendTeamListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    QLog.d("FriendTeamListInnerFrameNew", 2, "----->onBuddyListClick");
    mno localMno = (mno)paramView.getTag();
    String str;
    boolean bool;
    if ((localMno != null) && (jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_JavaLangObject != null))
    {
      str = "";
      if (!(jdField_a_of_type_JavaLangObject instanceof Friends)) {
        break label231;
      }
      str = ((Friends)jdField_a_of_type_JavaLangObject).getFriendNickWithAlias();
      if (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled())
      {
        if (!b.startsWith("+")) {
          break label257;
        }
        bool = a.a.a(b, str, 4, "-1");
        label108:
        if (QLog.isDevelopLevel()) {
          QLog.d("FriendTeamListInnerFrameNew", 2, "----->onBuddyListClick = " + bool);
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
        if (AppSetting.i)
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label280;
          }
          paramView.setContentDescription(d.getText().toString() + "已选中");
        }
      }
    }
    for (;;)
    {
      a.f();
      if (AppSetting.i) {
        paramView.postDelayed(new mld(this, paramView), 2000L);
      }
      return;
      label231:
      if (!(jdField_a_of_type_JavaLangObject instanceof PhoneContact)) {
        break;
      }
      str = jdField_a_of_type_JavaLangObject).name;
      break;
      label257:
      bool = a.a.a(b, str, 0, "-1");
      break label108;
      label280:
      paramView.setContentDescription(d.getText().toString() + "未选中");
    }
  }
}
