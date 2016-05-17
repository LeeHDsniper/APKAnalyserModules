import android.app.Activity;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;

public class kwk
  extends ClickableSpan
{
  public kwk(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((a.jdField_a_of_type_AndroidContentContext instanceof Activity))
    {
      paramView = ActionSheet.a(a.jdField_a_of_type_AndroidContentContext);
      paramView.c(2131367815);
      paramView.d(2131366996);
      paramView.a(new kwl(this));
      paramView.a(new kwm(this, paramView));
      paramView.show();
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005973", "0X8005973", 0, 0, "", "", "", "");
    }
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
