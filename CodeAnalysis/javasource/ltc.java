import android.os.Message;
import com.tencent.mobileqq.activity.contact.troop.NotificationAdapter;
import com.tencent.mobileqq.activity.contact.troop.NotificationView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import mqq.os.MqqHandler;

public class ltc
  extends MqqHandler
{
  public ltc(NotificationView paramNotificationView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    case 1013: 
    default: 
    case 1012: 
      do
      {
        return;
      } while (a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter == null);
      a.k();
      a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.a = GroupSystemMsgController.a().a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.notifyDataSetChanged();
      return;
    }
    a.l();
  }
}
