import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lfu
  extends PublicAccountObserver
{
  public lfu(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, PublicAccountInfo paramPublicAccountInfo)
  {
    if (paramInt == 0) {
      a.c(a.a.getIntent());
    }
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean) {
      a.c(a.a.getIntent());
    }
  }
  
  public void b(int paramInt, PublicAccountInfo paramPublicAccountInfo)
  {
    if (paramInt == 0) {
      a.c(a.a.getIntent());
    }
  }
}
