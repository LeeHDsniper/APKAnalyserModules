import com.tencent.mobileqq.activity.contact.newfriend.CircleGroupListView;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.circle.IGroupObserver;
import java.util.ArrayList;

public class lrk
  implements IGroupObserver
{
  public lrk(CircleGroupListView paramCircleGroupListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    boolean bool = true;
    if (paramBoolean)
    {
      a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(a.jdField_a_of_type_JavaUtilArrayList);
      a.jdField_a_of_type_Lrl.notifyDataSetChanged();
    }
    CircleGroupListView localCircleGroupListView;
    if (paramInt == 2)
    {
      a.c();
      if (a.jdField_a_of_type_JavaUtilArrayList.size() == 0)
      {
        if (!paramBoolean) {
          break label96;
        }
        localCircleGroupListView = a;
        if (a.jdField_a_of_type_JavaUtilArrayList.size() != 0) {
          break label91;
        }
      }
    }
    label91:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      CircleGroupListView.a(localCircleGroupListView, paramBoolean);
      return;
    }
    label96:
    a.a(2131367313, 1);
  }
}
