import com.tencent.mobileqq.activity.contact.troop.BaseTroopView.ITroopContext;
import com.tencent.mobileqq.activity.contact.troop.RecommendTroopView;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.MqqWeakReferenceHandler;
import java.util.List;

public class ltl
  extends TroopObserver
{
  public ltl(RecommendTroopView paramRecommendTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void b(boolean paramBoolean, List paramList)
  {
    if ((paramBoolean) && (paramList != null))
    {
      a.a.a().sendEmptyMessage(105);
      RecommendTroopView.a(a);
    }
  }
}
