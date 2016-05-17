import android.os.Handler;
import android.view.View;
import com.tencent.biz.ui.CustomMenuBar.OnMenuItemClickListener;
import com.tencent.crmqq.structmsg.StructMsg.ButtonInfo;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.enterpriseqq.EnterpriseQQManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lfg
  implements CustomMenuBar.OnMenuItemClickListener
{
  public lfg(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    BusinessCmrTmpChatPie.a(a).setVisibility(0);
    BusinessCmrTmpChatPie.a(a).sendEmptyMessageDelayed(0, 10000L);
    StructMsg.ButtonInfo localButtonInfo = BusinessCmrTmpChatPie.a(a, paramInt1);
    EnterpriseQQManager.a(a.a).a(paramString, a.a(), a.a, a.a(), localButtonInfo);
    ReportController.b(a.a, "P_CliOper", "Bqq_Crm", "", "Aio_menu", "Clk_menu", 0, 0, a.a(), paramInt1 + "", "", "");
  }
}
