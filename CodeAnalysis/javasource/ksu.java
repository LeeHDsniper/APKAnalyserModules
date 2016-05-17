import android.view.Window;
import com.tencent.mobileqq.activity.aio.audiopanel.CommonRecordSoundPanel;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class ksu
  implements Runnable
{
  public ksu(CommonRecordSoundPanel paramCommonRecordSoundPanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    a.setRequestedOrientation4Recording(true);
    a.a.getWindow().clearFlags(128);
    QQToast.a(a.a, 2131367774, 1).b(a.a.getTitleBarHeight());
  }
}
