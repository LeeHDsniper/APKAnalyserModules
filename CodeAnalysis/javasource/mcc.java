import android.content.Intent;
import com.dataline.activities.LiteActivity;
import com.dataline.util.DataLineReportUtil;
import com.tencent.mobileqq.activity.qfileJumpActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;

public class mcc
  implements Runnable
{
  public mcc(qfileJumpActivity paramQfileJumpActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    DataLineReportUtil.r(a.app);
    Intent localIntent = new Intent(a, LiteActivity.class);
    localIntent.addFlags(67108864);
    localIntent.putExtra("targetUin", a.a);
    localIntent.putExtra("leftViewText", a.app.a().getString(2131367694));
    a.startActivity(localIntent);
    a.finish();
  }
}
