import android.app.Activity;
import android.graphics.Color;
import android.support.v4.app.FragmentActivity;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;

public class kxl
  extends ClickableSpan
{
  public kxl(GrayTipsItemBuilder paramGrayTipsItemBuilder, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.a instanceof Activity))
    {
      paramView = ActionSheet.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.a);
      paramView.a(2131369262);
      paramView.c(2131370473);
      paramView.d(2131366996);
      paramView.a(new kxm(this, paramView));
      paramView.show();
      BaseChatPie localBaseChatPie = ((FragmentActivity)jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.a).getChatFragment().a();
      if ((localBaseChatPie instanceof DiscussChatPie)) {
        a = paramView;
      }
    }
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
