import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet.OnDismissListener;

class lfx
  implements ActionSheet.OnDismissListener
{
  lfx(lfw paramLfw)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss()
  {
    ReportController.b(a.a.a, "CliOper", "", "", "0X8004862", "0X8004862", 0, 0, "", "", "", "");
  }
}
