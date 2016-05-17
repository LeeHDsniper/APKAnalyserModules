import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;

public class kwq
  extends ClickableSpan
{
  public kwq(GrayTipsItemBuilder paramGrayTipsItemBuilder, String paramString1, String paramString2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    int j = 1;
    int i;
    if (jdField_a_of_type_JavaLangString.startsWith("mqqapi")) {
      if ((jdField_a_of_type_JavaLangString.contains("c2c")) && (jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a == 0))
      {
        paramView = ActionSheet.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext);
        paramView.c(2131367815);
        paramView.d(2131366996);
        paramView.a(new kwr(this));
        paramView.a(new kws(this, paramView));
        paramView.show();
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005973", "0X8005973", 0, 0, "", "", "", "");
        i = 1;
      }
    }
    for (;;)
    {
      paramView = jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a == 0) {}
      for (;;)
      {
        ReportController.b(paramView, "CliOper", "", "", "0X800416C", "0X800416C", 0, 0, String.valueOf(j), String.valueOf(2), String.valueOf(i), b);
        return;
        if ((!jdField_a_of_type_JavaLangString.contains("discussion")) || (jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a != 3000)) {
          break label478;
        }
        paramView = ActionSheet.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext);
        paramView.c(2131367816);
        paramView.d(2131366996);
        paramView.a(new kwt(this));
        paramView.a(new kwu(this, paramView));
        paramView.show();
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005975", "0X8005975", 0, 0, "", "", "", "");
        i = 1;
        break;
        if (!jdField_a_of_type_JavaLangString.startsWith("http")) {
          break label478;
        }
        Object localObject = jdField_a_of_type_JavaLangString;
        paramView = (View)localObject;
        if (!TextUtils.isEmpty((CharSequence)localObject)) {
          if (!((String)localObject).contains("?")) {
            break label436;
          }
        }
        label436:
        for (paramView = (String)localObject + "&sid=" + jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid();; paramView = (String)localObject + "?sid=" + jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid())
        {
          localObject = new Intent(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
          ((Intent)localObject).putExtra("url", paramView);
          ((Intent)localObject).putExtra("hide_left_button", true);
          ((Intent)localObject).putExtra("show_right_close_button", true);
          ((Intent)localObject).putExtra("finish_animation_up_down", true);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext.startActivity((Intent)localObject);
          i = 2;
          break;
        }
        j = 2;
      }
      label478:
      i = 1;
    }
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    paramTextPaint.setColor(Color.rgb(26, 144, 240));
  }
}
