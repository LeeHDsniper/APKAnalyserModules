import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class lli
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  public lli(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onGlobalLayout()
  {
    if (a.J)
    {
      a.J = false;
      TroopChatPie.a(a).sendEmptyMessageDelayed(23, 100L);
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.TroopChatPie", 2, " doOnCreate_initUI onGlobalLayout");
      }
    }
  }
}
