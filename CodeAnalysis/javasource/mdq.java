import android.view.View;
import android.view.View.OnFocusChangeListener;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdq
  implements View.OnFocusChangeListener
{
  public mdq(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onFocusChange(View paramView, boolean paramBoolean)
  {
    if (paramBoolean) {
      SendHbActivity.a(a).postDelayed(new mdr(this), 200L);
    }
  }
}
