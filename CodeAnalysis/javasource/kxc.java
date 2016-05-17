import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.TroopMemberListActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class kxc
  extends ClickableSpan
{
  public kxc(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((a.jdField_a_of_type_AndroidContentContext instanceof Activity))
    {
      paramView = new Intent(a.jdField_a_of_type_AndroidContentContext, TroopMemberListActivity.class);
      paramView.putExtra("troop_uin", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      paramView.putExtra("selfSet_leftViewText", a.jdField_a_of_type_AndroidContentContext.getString(2131367694));
      paramView.putExtra("param_from", 0);
      a.jdField_a_of_type_AndroidContentContext.startActivity(paramView);
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800559A", "0X800559A", 0, 0, "", "", "", "");
    }
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
