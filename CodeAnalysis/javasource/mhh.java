import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.EditText;
import com.tencent.mobileqq.activity.recent.RecentT9SearchActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mhh
  implements View.OnTouchListener
{
  public mhh(RecentT9SearchActivity paramRecentT9SearchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    paramView = (EditText)paramView;
    int i = paramView.getInputType();
    paramView.setInputType(0);
    paramView.onTouchEvent(paramMotionEvent);
    paramView.setInputType(i);
    return true;
  }
}
