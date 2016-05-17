import android.view.View;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class tzs
  extends uad
  implements Runnable
{
  private tzs(AbsListView paramAbsListView)
  {
    super(paramAbsListView, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    View localView;
    if ((a.isPressed()) && (a.aF >= 0))
    {
      int i = a.aF;
      int j = a.au;
      localView = a.getChildAt(i - j);
      if (a.r) {
        break label108;
      }
      if (!a()) {
        break label128;
      }
    }
    label108:
    label128:
    for (boolean bool = a.b(localView, a.aF, a.d);; bool = false)
    {
      if (bool)
      {
        a.setPressed(false);
        localView.setPressed(false);
      }
      do
      {
        return;
        a.setPressed(false);
      } while (localView == null);
      localView.setPressed(false);
      return;
    }
  }
}
