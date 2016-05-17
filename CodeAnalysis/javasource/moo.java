import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils.VideoFileSaveRunnable;
import mqq.os.MqqHandler;

class moo
  implements DialogInterface.OnClickListener
{
  moo(mon paramMon)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    ThreadManager.a().post(new ShortVideoUtils.VideoFileSaveRunnable(a.a.b, a.a.a, a.a.g + ".mp4", true));
  }
}
