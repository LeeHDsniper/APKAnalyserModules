import android.os.Handler;
import android.view.View;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qzonestatus.QzoneContactsFeedManager;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.widget.ListView;
import com.tencent.widget.OverScrollViewListener;

public class mqv
  implements OverScrollViewListener
{
  public mqv(SpecailCareListActivity paramSpecailCareListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    a.jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0L);
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    a.jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(0L);
    if (NetworkUtil.e(a))
    {
      a.jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a(true);
      a.jdField_a_of_type_Boolean = true;
      ((QzoneContactsFeedManager)a.app.getManager(90)).a();
      return true;
    }
    paramView = a.jdField_a_of_type_AndroidOsHandler.obtainMessage(2000, 0, 0);
    a.jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(paramView, 1000L);
    return true;
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    a.jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(0L);
  }
  
  public void c(int paramInt, View paramView, ListView paramListView) {}
}
