import android.support.v4.app.FragmentActivity;
import android.view.View;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.item.TextItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.AnimationTextView.OnDoubleClick;

public class lbm
  implements AnimationTextView.OnDoubleClick
{
  public lbm(TextItemBuilder paramTextItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    if (TextItemBuilder.b(a)) {
      return;
    }
    ChatActivityUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView, (FragmentActivity)a.jdField_a_of_type_AndroidContentContext);
  }
}
