import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.open.agent.report.ReportCenter;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.QZoneClickReport;
import cooperation.qzone.QZoneClickReport.ReportInfo;
import cooperation.qzone.QZoneShareManager;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

public class ixu
  implements View.OnClickListener
{
  public ixu(ForwardRecentActivity paramForwardRecentActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = a.getIntent();
    int i = paramView.getIntExtra("req_type", 0);
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardEntranceActivity", 2, "-->addQZoneEntry--onClick--req_type = " + i);
    }
    Bundle localBundle = paramView.getExtras();
    Object localObject = localBundle.getString("image_url_remote");
    paramView = (View)localObject;
    if (localObject == null) {
      paramView = localBundle.getString("image_url");
    }
    localObject = new ArrayList();
    if (!TextUtils.isEmpty(paramView))
    {
      paramView = paramView.split(";");
      i = 0;
      while (i < paramView.length)
      {
        ((ArrayList)localObject).add(URLDecoder.decode(paramView[i]));
        i += 1;
      }
    }
    localBundle.putStringArrayList("image_url", (ArrayList)localObject);
    localBundle.putString("share_action", "shareToQQ");
    com.tencent.mobileqq.app.PhoneContactManagerImp.f = true;
    paramView = new ixv(this);
    QZoneShareManager.a(a.app, a, localBundle, paramView);
    paramView = new QZoneClickReport.ReportInfo();
    c = "1";
    d = "0";
    b = 4;
    k = "5";
    l = "thirdApp";
    m = "activefeed";
    QZoneClickReport.a(a.app.getAccount(), paramView);
    paramView = new HashMap();
    paramView.put("source_type", "5");
    paramView.put("source_from", "thirdApp");
    paramView.put("source_to", "activefeed");
    StatisticCollector.a(a.getApplicationContext()).a(a.app.getAccount(), "actQZSourceDataReport", true, 0L, 0L, paramView, null);
    if (a.a) {
      ReportCenter.a().a(a.app.getAccount(), "", a.k, "1000", "33", "0", false);
    }
    a.finish();
  }
}
