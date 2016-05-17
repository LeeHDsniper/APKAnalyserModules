import android.view.View;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class ljc
  implements ActionSheet.OnButtonClickListener
{
  public ljc(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if (a.T) {
      return;
    }
    a.T = true;
    if ((a.jdField_a_of_type_ArrayOfInt != null) && (a.jdField_a_of_type_ArrayOfInt.length > 0))
    {
      a.q(2131364333);
      paramInt = a.jdField_a_of_type_ArrayOfInt[0];
      if (paramInt == 0) {
        a.a(true, 0);
      }
    }
    for (;;)
    {
      a.jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
      a.a(false, paramInt);
      continue;
      a.q(2131364333);
      a.a(true, 0);
    }
  }
}
