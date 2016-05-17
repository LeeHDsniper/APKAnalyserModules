import com.tencent.mobileqq.activity.selectmember.TroopDiscussionTroop;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollGroupFloatingListener;
import com.tencent.widget.AbsListView;

public class mnt
  extends SlideDetectListView.OnScrollGroupFloatingListener
{
  public mnt(TroopDiscussionTroop paramTroopDiscussionTroop)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt) {}
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if (TroopDiscussionTroop.a(a) != null) {
      TroopDiscussionTroop.a(a, paramInt1);
    }
  }
}
