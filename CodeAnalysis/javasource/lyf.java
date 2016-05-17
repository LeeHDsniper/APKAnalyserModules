import MyCarrier.Carrier;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.activity.phone.MyBusinessActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.utils.QQPimUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mybusiness.MyBusinessManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.XListView;

public class lyf
  implements View.OnClickListener
{
  public lyf(ContactListView paramContactListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void a()
  {
    Context localContext = a.getContext();
    Object localObject = ((MyBusinessManager)a.a.getManager(48)).a();
    if ((localObject == null) || (TextUtils.isEmpty(carrierURL))) {
      return;
    }
    if ((carrierURL.indexOf("&") > -1) || (carrierURL.indexOf("?") > -1)) {}
    for (localObject = carrierURL + "&sid=" + a.a.getSid();; localObject = carrierURL + "?sid=" + a.a.getSid())
    {
      Intent localIntent = new Intent(localContext, MyBusinessActivity.class);
      localIntent.putExtra("hide_operation_bar", true);
      localIntent.putExtra("uin", a.a.a());
      localIntent.putExtra("title", localContext.getString(2131370916));
      localIntent.putExtra("url", (String)localObject);
      localIntent.putExtra("hideRightButton", true);
      a.b(localIntent, 1000);
      return;
    }
  }
  
  private void b()
  {
    if (QQPimUtil.a(a.getContext()))
    {
      ReportController.b(a.a, "CliOper", "", "", "0X8005B0B", "0X8005B0B", 0, 0, "", "", "", "");
      localIntent = QQPimUtil.a(a.getContext());
      if (localIntent != null) {
        a.getContext().startActivity(localIntent);
      }
      return;
    }
    ReportController.b(a.a, "CliOper", "", "", "0X8005B0C", "0X8005B0C", 0, 0, "", "", "", "");
    Intent localIntent = new Intent(a.getContext(), PublicAccountBrowser.class);
    localIntent.putExtra("url", "http://zblm.qq.com/downHelper/index.jsp");
    localIntent.putExtra("hideRightButton", true);
    a.getContext().startActivity(localIntent);
  }
  
  private void c()
  {
    if (ContactListView.a(a) != null)
    {
      ContactListView.a(a).setVisibility(8);
      ContactListView.a(a).a(ContactListView.a(a));
      ContactListView.a(a, null);
    }
  }
  
  public void onClick(View paramView)
  {
    c();
    switch (paramView.getId())
    {
    case 2131301038: 
    case 2131301041: 
    case 2131301042: 
    case 2131301043: 
    default: 
      return;
    case 2131301039: 
      ContactListView.a(a, true);
      ContactListView.a(a, "P_CliOper", "QQwangting", "txl_close_bluebar", "close_bluebar");
      return;
    case 2131301037: 
      ContactListView.a(a, true);
      ContactListView.a(a, "P_CliOper", "QQwangting", "txl_clk_bluebar", "clk_bluebar");
      a();
      return;
    }
    ReportController.b(a.a, "CliOper", "", "", "0X800568A", "0X800568A", 0, 0, "", "", "", "");
    b();
  }
}
