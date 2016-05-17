import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.contact.troop.ShowExternalTroopListActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import java.net.URLEncoder;

public class lts
  implements View.OnClickListener
{
  public lts(ShowExternalTroopListActivity paramShowExternalTroopListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!NetworkUtil.g(a.jdField_a_of_type_AndroidAppActivity))
    {
      QQToast.a(a, 1, a.getString(2131364434), 0).b(a.getTitleBarHeight());
      return;
    }
    paramView = ((TextView)paramView).getText().toString();
    Object localObject = new Intent(a.jdField_a_of_type_AndroidAppActivity, QQBrowserActivity.class);
    ((Intent)localObject).putExtra("url", "http://qqweb.qq.com/m/relativegroup/index.html?_bid=165&source=qun_tag&keyword=" + URLEncoder.encode(paramView));
    ((Intent)localObject).putExtra("hide_operation_bar", true);
    ((Intent)localObject).putExtra("hide_more_button", true);
    a.startActivity((Intent)localObject);
    localObject = a.app;
    String str = a.f;
    if (a.jdField_a_of_type_Boolean) {}
    for (paramView = "0";; paramView = "1")
    {
      ReportController.b((QQAppInterface)localObject, "P_CliOper", "Grp_join", "", "person_data", "Clk_quntag", 0, 0, str, paramView, "", "");
      return;
    }
  }
}
