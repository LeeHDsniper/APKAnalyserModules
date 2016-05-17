import com.tencent.mobileqq.activity.contact.troop.TroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollGroupFloatingListener;
import com.tencent.widget.AbsListView;

public class lue
  extends SlideDetectListView.OnScrollGroupFloatingListener
{
  public lue(TroopView paramTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt) {}
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if (a.a != null) {
      TroopView.a(a, paramInt1);
    }
  }
}
