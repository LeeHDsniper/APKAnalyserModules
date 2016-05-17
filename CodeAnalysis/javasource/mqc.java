import android.os.Handler;
import android.os.Message;
import android.widget.Button;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqc
  extends Handler
{
  public mqc(QvipSpecialSoundActivity paramQvipSpecialSoundActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
    case 0: 
      do
      {
        return;
        a.stopTitleProgress();
        QvipSpecialSoundActivity.a(a).removeMessages(2);
      } while (((Boolean)obj).booleanValue());
      QvipSpecialSoundActivity.a(a, a.getString(2131370670));
      return;
    case 1: 
      QvipSpecialSoundActivity.a(a).setText(a.getString(2131370660));
      return;
    }
    a.stopTitleProgress();
    QvipSpecialSoundActivity.a(a, a.getString(2131370673));
  }
}
