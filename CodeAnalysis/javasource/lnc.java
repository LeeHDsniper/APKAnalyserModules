import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.FriendHotTipsBar;
import com.tencent.mobileqq.activity.aio.tips.QQOperateTips;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.config.operation.QQOperationViopTipTask;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import java.lang.ref.WeakReference;

public class lnc
  implements View.OnClickListener
{
  public lnc(QQOperateTips paramQQOperateTips, QQOperationViopTipTask paramQQOperationViopTipTask)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips) == null) || (QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).get() == null)) {
      return;
    }
    FriendHotTipsBar.c(QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips), ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_JavaLangString);
    int i;
    if (jdField_a_of_type_ComTencentMobileqqConfigOperationQQOperationViopTipTask.url.startsWith("mqqapi")) {
      if ((jdField_a_of_type_ComTencentMobileqqConfigOperationQQOperationViopTipTask.url.contains("c2c")) && (ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_Int == 0))
      {
        ChatActivityUtils.a(QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips), (Context)QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).get(), ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_Int, ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_JavaLangString, ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).d, null, true, ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).b, true, true, null, "from_internal");
        i = 1;
      }
    }
    for (;;)
    {
      paramView = QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips);
      int j;
      if (ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_Int == 0)
      {
        j = 1;
        label183:
        ReportController.b(paramView, "CliOper", "", "", "0X800416C", "0X800416C", 0, 0, String.valueOf(j), String.valueOf(1), String.valueOf(i), String.valueOf(jdField_a_of_type_ComTencentMobileqqConfigOperationQQOperationViopTipTask.taskid));
        return;
        if ((!jdField_a_of_type_ComTencentMobileqqConfigOperationQQOperationViopTipTask.url.contains("discussion")) || (ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_Int != 3000)) {
          break label510;
        }
        ChatActivityUtils.a(QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips), (Context)QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).get(), ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_Int, ajdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).jdField_a_of_type_JavaLangString, true, true, null, null);
        i = 1;
        continue;
        if (!jdField_a_of_type_ComTencentMobileqqConfigOperationQQOperationViopTipTask.url.startsWith("http")) {
          break label505;
        }
        paramView = jdField_a_of_type_ComTencentMobileqqConfigOperationQQOperationViopTipTask.url;
        if (TextUtils.isEmpty(paramView)) {
          break label502;
        }
        if (paramView.contains("?")) {
          paramView = paramView + "&sid=" + QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).getSid();
        }
      }
      label502:
      for (;;)
      {
        Intent localIntent = new Intent((Context)QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).get(), QQBrowserActivity.class);
        localIntent.putExtra("url", paramView);
        localIntent.putExtra("hide_left_button", true);
        localIntent.putExtra("show_right_close_button", true);
        localIntent.putExtra("finish_animation_up_down", true);
        ((Context)QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).get()).startActivity(localIntent);
        i = 2;
        break;
        paramView = paramView + "?sid=" + QQOperateTips.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsQQOperateTips).getSid();
        continue;
        j = 2;
        break label183;
      }
      label505:
      i = 1;
      continue;
      label510:
      i = 1;
    }
  }
}
