import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.statistics.ReportController;

public class mnb
  implements View.OnFocusChangeListener
{
  public mnb(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onFocusChange(View paramView, boolean paramBoolean)
  {
    int i;
    if ((paramBoolean) && ((a.U == 8) || (a.U == 9) || (a.U != a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a())))
    {
      paramView = ((SelectMemberInnerFrame)a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getCurrentView()).a();
      if (paramView != null)
      {
        paramView.a(SelectMemberActivity.a(a), a.h);
        FragmentTransaction localFragmentTransaction = a.getSupportFragmentManager().beginTransaction();
        if (a.jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment != null) {
          localFragmentTransaction.remove(a.jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment);
        }
        localFragmentTransaction.add(2131296985, paramView);
        localFragmentTransaction.commitAllowingStateLoss();
        a.jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment = paramView;
      }
      if ((a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() != 6) && (a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() != 4)) {
        break label209;
      }
      i = 1;
    }
    for (;;)
    {
      ReportController.b(a.app, "CliOper", "", "", "0X800543F", "0X800543F", 0, 0, String.valueOf(i), "", "", "");
      return;
      label209:
      if (a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 8) {
        i = 2;
      } else if (a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 4) {
        i = 3;
      } else {
        i = 0;
      }
    }
  }
}
