import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet.OnDismissListener;

public final class kra
  implements ActionSheet.OnDismissListener
{
  public kra(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss()
  {
    ReportController.b(a, "CliOper", "", "", "0X8004864", "0X8004864", 0, 0, "", "", "", "");
  }
}
