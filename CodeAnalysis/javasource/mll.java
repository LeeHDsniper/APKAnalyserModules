import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mll
  implements View.OnFocusChangeListener
{
  public mll(PhoneContactSelectActivity paramPhoneContactSelectActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onFocusChange(View paramView, boolean paramBoolean)
  {
    if ((paramBoolean) && ((a.U == 0) || (a.U == 1) || (a.U == 2) || (a.U == 3) || (a.U != a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a())))
    {
      paramView = ((SelectMemberInnerFrame)a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getCurrentView()).a();
      if (paramView != null)
      {
        FragmentTransaction localFragmentTransaction = a.getSupportFragmentManager().beginTransaction();
        if (a.jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment != null) {
          localFragmentTransaction.remove(a.jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment);
        }
        localFragmentTransaction.add(2131296985, paramView);
        localFragmentTransaction.commit();
        a.jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment = paramView;
      }
    }
  }
}
