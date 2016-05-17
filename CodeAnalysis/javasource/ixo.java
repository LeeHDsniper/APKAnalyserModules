import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class ixo
  extends TroopObserver
{
  public ixo(ForwardRecentActivity paramForwardRecentActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, byte paramByte, TroopInfo paramTroopInfo, boolean paramBoolean2)
  {
    if (paramBoolean1) {
      ForwardRecentActivity.a(a);
    }
  }
  
  protected void a(boolean paramBoolean1, ArrayList paramArrayList, boolean paramBoolean2)
  {
    if ((paramBoolean1) && (paramArrayList != null) && (paramArrayList.size() > 0) && (paramBoolean2)) {
      ForwardRecentActivity.a(a);
    }
  }
}
