import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.RichStatItemBuilder;
import com.tencent.mobileqq.activity.aio.item.RichStatItemBuilder.Holder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SignatureHandler;
import com.tencent.mobileqq.app.SignatureManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;

public class kzy
  implements View.OnClickListener
{
  private static final long jdField_a_of_type_Long = 200L;
  private long b;
  
  public kzy(RichStatItemBuilder paramRichStatItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = 0L;
  }
  
  public void onClick(View paramView)
  {
    Object localObject = a.jdField_a_of_type_AndroidContentContext.getResources();
    if (!NetworkUtil.e(a.jdField_a_of_type_AndroidContentContext)) {
      QQToast.a(a.jdField_a_of_type_AndroidContentContext, ((Resources)localObject).getString(2131366990), 0).b(((BaseActivity)a.jdField_a_of_type_AndroidContentContext).getTitleBarHeight());
    }
    for (;;)
    {
      return;
      long l = System.currentTimeMillis();
      if (Math.abs(l - b) < 200L)
      {
        QQToast.a(a.jdField_a_of_type_AndroidContentContext, ((Resources)localObject).getString(2131371640), 0).b(((BaseActivity)a.jdField_a_of_type_AndroidContentContext).getTitleBarHeight());
        return;
      }
      b = l;
      localObject = (RichStatItemBuilder.Holder)paramView.getTag();
      try
      {
        if (jdField_d_of_type_AndroidWidgetTextView.getText() == null) {}
        int j;
        int k;
        for (paramView = "0";; paramView = jdField_d_of_type_AndroidWidgetTextView.getText().toString())
        {
          j = Integer.parseInt(paramView);
          if (jdField_d_of_type_Int != 0) {
            break label353;
          }
          jdField_d_of_type_Int = 1;
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "signiture", "aio_act_on", 0, 0, "", "", "", "");
          i = 8;
          j += 1;
          k = 1;
          jdField_d_of_type_AndroidWidgetTextView.setText(j + "");
          paramView = RichStatItemBuilder.a(a).a(jdField_c_of_type_Int, i, DisplayUtil.a(a.jdField_a_of_type_AndroidContentContext, 14.0F), DisplayUtil.a(a.jdField_a_of_type_AndroidContentContext, 19.0F));
          if (paramView != null) {
            jdField_d_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(paramView, null, null, null);
          }
          paramView = (SignatureHandler)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(41);
          if (paramView == null) {
            break;
          }
          paramView.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, jdField_c_of_type_JavaLangString, 255, k);
          return;
        }
        label353:
        jdField_d_of_type_Int = 0;
        int i = j - 1;
        if (i > 0) {}
        for (;;)
        {
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "signiture", "aio_act_off", 0, 0, "", "", "", "");
          int m = 7;
          j = i;
          k = 0;
          i = m;
          break;
          i = 0;
        }
        return;
      }
      catch (Exception paramView) {}
    }
  }
}
