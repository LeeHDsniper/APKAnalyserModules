import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.view.View;
import android.view.animation.TranslateAnimation;
import com.tencent.mobileqq.activity.phone.CountryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.IndexView;

public class lyq
  implements DialogInterface.OnDismissListener
{
  public lyq(CountryActivity paramCountryActivity, int paramInt, TranslateAnimation paramTranslateAnimation)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.b.offsetTopAndBottom(-jdField_a_of_type_Int);
    jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.jdField_a_of_type_AndroidViewView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.b.startAnimation(jdField_a_of_type_AndroidViewAnimationTranslateAnimation);
  }
}
