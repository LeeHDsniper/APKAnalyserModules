import android.app.ProgressDialog;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.log.ReportLog;
import com.tencent.mobileqq.utils.DialogUtil;
import mqq.manager.ServerConfigManager.ConfigType;

public class jkx
  implements View.OnClickListener
{
  public jkx(NotificationActivity paramNotificationActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ProgressDialog localProgressDialog = DialogUtil.a(a, a.getResources().getDrawable(2130842371), 2131368956);
    localProgressDialog.setOnDismissListener(new jky(this));
    ReportLog.a(a.app.getAccount());
    paramView = null;
    if (a.app.getSid() != null) {
      paramView = a.app.getSid().getBytes();
    }
    ReportLog.a(paramView);
    paramView = a.app.a(ServerConfigManager.ConfigType.app, "log_upload");
    if ((!TextUtils.isEmpty(paramView)) && (paramView.equals("1")))
    {
      ReportLog.a(a.app.a(), a.app.a(), localProgressDialog);
      return;
    }
    ReportLog.a(a.app.a(), a.app.a(), localProgressDialog);
  }
}
