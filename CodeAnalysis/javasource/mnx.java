import com.tencent.mobileqq.activity.selectmember.TroopMemberListInnerFrame;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mnx
  extends TroopObserver
{
  public mnx(TroopMemberListInnerFrame paramTroopMemberListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString, boolean paramBoolean)
  {
    ThreadManager.a(new mny(this), 5, null, true);
  }
}
