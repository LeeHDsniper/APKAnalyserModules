import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.phone.PhoneFrame;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lzb
  implements View.OnClickListener
{
  public lzb(PhoneFrameActivity paramPhoneFrameActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = a.a.a();
    if (paramView != null) {
      paramView.a(false);
    }
    com.tencent.mobileqq.app.PhoneContactManagerImp.f = false;
    a.setResult(1);
    a.finish();
  }
}
