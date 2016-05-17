import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lrv
  implements View.OnClickListener
{
  public lrv(NewFriendActivity paramNewFriendActivity, SharedPreferences paramSharedPreferences)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_AndroidContentSharedPreferences.edit().putLong("newfriend_enter_time", System.currentTimeMillis()).commit();
    NewFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendNewFriendActivity, false, true);
  }
}
