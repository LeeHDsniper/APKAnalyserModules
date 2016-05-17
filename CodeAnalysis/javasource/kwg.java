import android.app.Activity;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.StrangerManageActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class kwg
  extends ClickableSpan
{
  public kwg(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, "Manage_stranger", "Manage_str_aio_clk", 0, 0, "", "", "", "");
    StrangerManageActivity.a((Activity)a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
