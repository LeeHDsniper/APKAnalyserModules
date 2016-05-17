import com.tencent.mobileqq.activity.contact.troop.NotificationAdapter;
import com.tencent.mobileqq.activity.contact.troop.NotificationView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollToTopListener;
import com.tencent.widget.AbsListView;

public class ltg
  implements SlideDetectListView.OnScrollToTopListener
{
  public ltg(NotificationView paramNotificationView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a() {}
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter != null) && (paramInt == 0) && (a.r == a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.getCount())) {
      NotificationView.b(a);
    }
    a.q = paramInt;
    if (paramInt != 0)
    {
      a.jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
      a.jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
    }
    while (!a.jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    a.r = (paramInt1 + paramInt2 - 1);
    if (paramInt1 > 1) {
      GroupSystemMsgController.a().a();
    }
    while (!a.b) {
      return;
    }
    GroupSystemMsgController.a().f();
  }
}
