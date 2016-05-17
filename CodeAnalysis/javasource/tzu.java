import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.view.View;
import android.view.ViewConfiguration;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public final class tzu
  implements Runnable
{
  public tzu(AbsListView paramAbsListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject;
    int i;
    boolean bool;
    if (a.ag == 0)
    {
      a.ag = 1;
      localObject = a.getChildAt(a.ab - a.au);
      if ((localObject != null) && (!((View)localObject).hasFocusable()))
      {
        a.U = 0;
        if (a.r) {
          break label249;
        }
        ((View)localObject).setPressed(true);
        a.setPressed(true);
        a.b();
        a.a(a.ab, (View)localObject);
        a.refreshDrawableState();
        i = ViewConfiguration.getLongPressTimeout();
        bool = a.isLongClickable();
        if (a.c != null)
        {
          localObject = a.c.getCurrent();
          if ((localObject != null) && ((localObject instanceof TransitionDrawable)))
          {
            if (!bool) {
              break label230;
            }
            ((TransitionDrawable)localObject).startTransition(i);
          }
        }
      }
    }
    while (bool)
    {
      if (AbsListView.a(a) == null) {
        AbsListView.a(a, new tzt(a, null));
      }
      AbsListView.a(a).a();
      a.postDelayed(AbsListView.a(a), i);
      return;
      label230:
      ((TransitionDrawable)localObject).resetTransition();
    }
    a.ag = 2;
    return;
    label249:
    a.ag = 2;
  }
}
