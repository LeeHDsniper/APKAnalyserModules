import com.tencent.mobileqq.activity.selectmember.TroopListInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollGroupFloatingListener;
import com.tencent.widget.AbsListView;

public class mnu
  extends SlideDetectListView.OnScrollGroupFloatingListener
{
  public mnu(TroopListInnerFrame paramTroopListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt) {}
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if (TroopListInnerFrame.a(a) != null) {
      TroopListInnerFrame.a(a, paramInt1);
    }
  }
}
