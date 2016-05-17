import android.media.AudioManager;
import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.AudioPlayer;
import com.tencent.mobileqq.activity.aio.AudioPlayer.AudioPlayerListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AudioHelper.AudioPlayerParameter;

public class kpm
  extends Handler
{
  public kpm(AudioPlayer paramAudioPlayer)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if ((what == 1000) && (AudioPlayer.a(a) == 0) && (a.a()))
    {
      int i = AudioPlayer.a(a).getStreamVolume(aa).b);
      int j = AudioPlayer.a(a).getStreamMaxVolume(aa).b);
      if (i / j <= 0.1F) {
        break label126;
      }
      AudioPlayer.a(a, 1);
      if (AudioPlayer.a(a) != null) {
        AudioPlayer.a(a).c(a, AudioPlayer.a(a));
      }
    }
    return;
    label126:
    AudioPlayer.a(a).sendEmptyMessageDelayed(1000, 200L);
  }
}
