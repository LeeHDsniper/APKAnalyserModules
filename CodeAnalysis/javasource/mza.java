import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mza
  implements View.OnClickListener
{
  public mza(IphoneTitleBarActivity paramIphoneTitleBarActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.onBackEvent();
  }
}
