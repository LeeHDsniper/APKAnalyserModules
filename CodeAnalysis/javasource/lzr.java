import android.view.View;
import android.view.View.OnLongClickListener;
import com.tencent.mobileqq.activity.phone.TosActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lzr
  implements View.OnLongClickListener
{
  public lzr(TosActivity paramTosActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onLongClick(View paramView)
  {
    return true;
  }
}
