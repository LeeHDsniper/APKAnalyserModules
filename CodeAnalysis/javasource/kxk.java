import android.app.Activity;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.data.MessageForGrayTips;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.dingdong.DingdongPluginHelper;

public class kxk
  extends ClickableSpan
{
  public kxk(GrayTipsItemBuilder paramGrayTipsItemBuilder, String paramString, MessageForGrayTips paramMessageForGrayTips)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    int i = Integer.parseInt(jdField_a_of_type_JavaLangString);
    DingdongPluginHelper.a((Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.a, i, jdField_a_of_type_ComTencentMobileqqDataMessageForGrayTips.getExtInfoFromExtStr("approval_workid"));
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
    paramTextPaint.setUnderlineText(false);
  }
}
