import android.os.Handler;
import android.widget.TextView;
import com.tencent.mobileqq.activity.contact.troop.ShowExternalTroopListActivity;
import com.tencent.mobileqq.adapter.ShowExternalTroopListAdapter;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.List;

public class ltq
  extends TroopObserver
{
  public ltq(ShowExternalTroopListActivity paramShowExternalTroopListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt, List paramList1, List paramList2)
  {
    a.b = false;
    if ((!paramBoolean) || (paramList1 == null) || (paramList1.size() == 0) || (paramInt != 0))
    {
      a.c = 0;
      if (a.jdField_a_of_type_ComTencentWidgetXListView.c())
      {
        a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(100, 800L);
        ShowExternalTroopListActivity.a(a);
      }
      if (!a.jdField_a_of_type_Boolean)
      {
        paramList1 = new ArrayList();
        a.jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter.a(paramList1);
        paramInt = a.getTitleBarHeight();
        QQToast.a(a, 1, a.getString(2131364745), 0).b(paramInt);
        return;
      }
      a.a();
      return;
    }
    if (a.jdField_a_of_type_ComTencentWidgetXListView.c())
    {
      a.jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0);
      a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(100, 800L);
      ShowExternalTroopListActivity.a(a);
    }
    a.d.setVisibility(0);
    if (a.jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter != null)
    {
      a.c = paramList1.size();
      a.jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter.a(paramList1);
    }
    a.a(paramList2, true);
  }
}
