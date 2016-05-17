import android.content.Context;
import android.view.ViewParent;
import android.widget.FrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ucb
  extends FrameLayout
{
  public ucb(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void a(ViewParent paramViewParent)
  {
    mParent = paramViewParent;
  }
}
