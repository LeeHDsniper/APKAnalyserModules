import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class tzp
  implements Runnable
{
  public tzp(AbsListView paramAbsListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.g)
    {
      AbsListView localAbsListView = a;
      a.h = false;
      g = false;
      AbsListView.a(a, false);
      if ((AbsListView.n(a) & 0x2) == 0) {
        AbsListView.b(a, false);
      }
      if (!a.isAlwaysDrawnWithCacheEnabled()) {
        a.invalidate();
      }
    }
  }
}
