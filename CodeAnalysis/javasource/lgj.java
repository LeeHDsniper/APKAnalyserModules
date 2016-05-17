import android.app.Dialog;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;

public class lgj
  implements View.OnClickListener
{
  public lgj(DiscussChatPie paramDiscussChatPie, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((DiscussChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie) != null) && (DiscussChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie).isShowing())) {
      DiscussChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie).dismiss();
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie.a != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie.a.isShowing()))
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie.a.dismiss();
      jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie.a = null;
    }
    DiscussChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie, jdField_a_of_type_JavaLangString);
  }
}
