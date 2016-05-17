import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpd
  implements MediaPlayer.OnBufferingUpdateListener
{
  public mpd(ShortVideoPlayActivity paramShortVideoPlayActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onBufferingUpdate(MediaPlayer paramMediaPlayer, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onBufferingUpdate percent = " + paramInt);
    }
  }
}
