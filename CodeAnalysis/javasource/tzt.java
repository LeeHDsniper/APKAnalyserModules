import android.view.View;
import android.widget.ListAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class tzt
  extends uad
  implements Runnable
{
  private tzt(AbsListView paramAbsListView)
  {
    super(paramAbsListView, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = a.ab;
    View localView = a.getChildAt(i - a.au);
    long l;
    if (localView != null)
    {
      i = a.ab;
      l = a.a.getItemId(a.ab);
      if ((!a()) || (a.r)) {
        break label126;
      }
    }
    label126:
    for (boolean bool = a.b(localView, i, l);; bool = false)
    {
      if (bool)
      {
        a.ag = -1;
        a.setPressed(false);
        localView.setPressed(false);
        return;
      }
      a.ag = 2;
      return;
    }
  }
}
