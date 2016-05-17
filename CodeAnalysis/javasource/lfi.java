import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.EnterpriseQQObserver;
import com.tencent.mobileqq.enterpriseqq.EnterpriseQQManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.List;

public class lfi
  extends EnterpriseQQObserver
{
  public lfi(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    if (paramBoolean)
    {
      a.b = EnterpriseQQManager.a(a.a).a(a.a, a.a());
      BusinessCmrTmpChatPie.a(a, a.b);
      if ((a.b != null) && (!a.b.isEmpty())) {
        BusinessCmrTmpChatPie.a(a, false);
      }
    }
  }
  
  protected void b(boolean paramBoolean, Object paramObject) {}
}
