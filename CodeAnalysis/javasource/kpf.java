import android.widget.EditText;
import com.tencent.mobileqq.activity.activateFriend.SendBirthdayWishesActivity;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XPanelContainer;
import mqq.os.MqqHandler;

public class kpf
  extends ActivateFriendsObserver
{
  public kpf(SendBirthdayWishesActivity paramSendBirthdayWishesActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    a.e();
    SendBirthdayWishesActivity.a(a, paramInt);
    a.jdField_a_of_type_AndroidWidgetEditText.removeTextChangedListener(a);
    a.jdField_a_of_type_AndroidWidgetEditText.setText("");
    if (a.jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 0) {
      a.jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
    }
    if (paramInt != 2)
    {
      SendBirthdayWishesActivity.a(a).removeCallbacks(SendBirthdayWishesActivity.a(a));
      SendBirthdayWishesActivity.a(a).postDelayed(SendBirthdayWishesActivity.a(a), 600L);
    }
  }
}
