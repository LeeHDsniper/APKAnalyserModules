import android.media.MediaPlayer;
import android.widget.SeekBar;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class mox
  implements Runnable
{
  public mox(ShortVideoPlayActivity paramShortVideoPlayActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.a())
    {
      if (a.i <= 0) {
        a.h();
      }
      ShortVideoPlayActivity.a(a, a.jdField_a_of_type_AndroidMediaMediaPlayer.getCurrentPosition());
      ShortVideoPlayActivity.b(a, (int)(ShortVideoPlayActivity.a(a) * 100.0D / a.i * 1.0D));
      a.jdField_a_of_type_AndroidWidgetSeekBar.setProgress(ShortVideoPlayActivity.b(a));
      a.c(ShortVideoPlayActivity.a(a));
    }
    if (a.b())
    {
      long l1 = System.currentTimeMillis();
      if ((ShortVideoPlayActivity.a(a) == 0L) || (l1 - ShortVideoPlayActivity.a(a) > 500L))
      {
        long l2 = (a.c - ShortVideoPlayActivity.b(a)) / (l1 - ShortVideoPlayActivity.a(a));
        a.a(l2 * 1000L);
        ShortVideoPlayActivity.a(a, a.c);
        ShortVideoPlayActivity.b(a, l1);
      }
    }
    int i;
    if (ShortVideoPlayActivity.a(a))
    {
      if (ShortVideoPlayActivity.c(a) < 100) {
        break label315;
      }
      i = 0;
      if (i == 0) {
        break label411;
      }
      if (a.a())
      {
        a.jdField_a_of_type_AndroidMediaMediaPlayer.pause();
        a.a(4);
        ShortVideoPlayActivity.a(a, true);
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoPlayActivity", 2, "播放中 ==> 缓冲...");
        }
      }
    }
    for (;;)
    {
      a.jdField_a_of_type_MqqOsMqqHandler.postDelayed(a.jdField_a_of_type_JavaLangRunnable, 100L);
      return;
      label315:
      if (ShortVideoPlayActivity.c(a) > ShortVideoPlayActivity.b(a))
      {
        if ((ShortVideoPlayActivity.c(a) - ShortVideoPlayActivity.b(a)) / 100.0D * a.d < 512000.0D)
        {
          if (QLog.isColorLevel()) {
            QLog.d("ShortVideoPlayActivity", 2, "mProgressChecker=> 1 need pause for buffering...");
          }
          i = 1;
          break;
        }
        i = 0;
        break;
      }
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "mProgressChecker=> 2 need pause for buffering...");
      }
      i = 1;
      break;
      label411:
      if ((a.b()) && (ShortVideoPlayActivity.b(a)) && (ShortVideoPlayActivity.c(a)))
      {
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoPlayActivity", 2, "缓冲中 ==> 播放...");
        }
        a.jdField_a_of_type_AndroidMediaMediaPlayer.start();
        a.a(1);
        ShortVideoPlayActivity.a(a, false);
      }
    }
  }
}
