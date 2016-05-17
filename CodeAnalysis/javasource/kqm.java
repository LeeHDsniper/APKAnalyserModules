import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kqm
  implements MediaPlayer.OnCompletionListener
{
  public kqm(MediaPlayerManager paramMediaPlayerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    if (paramMediaPlayer != null) {
      paramMediaPlayer.release();
    }
    com.tencent.mobileqq.utils.AudioUtil.a = null;
    if (MediaPlayerManager.a(a)) {}
    for (paramMediaPlayer = MediaPlayerManager.a(a); (paramMediaPlayer != null) && (MediaPlayerManager.b(a)); paramMediaPlayer = MediaPlayerManager.a(a)) {
      return;
    }
    a.c();
  }
}
