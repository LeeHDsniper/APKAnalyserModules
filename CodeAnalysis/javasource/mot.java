import android.media.MediaPlayer;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mot
  implements SeekBar.OnSeekBarChangeListener
{
  public mot(ShortVideoPlayActivity paramShortVideoPlayActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onProgressChanged(SeekBar paramSeekBar, int paramInt, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      paramSeekBar = a;
      s += 1;
    }
  }
  
  public void onStartTrackingTouch(SeekBar paramSeekBar)
  {
    int i = a.jdField_a_of_type_AndroidWidgetSeekBar.getProgress();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onStartTrackingTouch: progress = " + i);
    }
  }
  
  public void onStopTrackingTouch(SeekBar paramSeekBar)
  {
    int i = a.jdField_a_of_type_AndroidWidgetSeekBar.getProgress();
    int j = (int)(i / 100.0D * a.i);
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onStopTrackingTouch: seekProgress = " + i + ", mCacheProgress= " + ShortVideoPlayActivity.c(a) + ", timestamp = " + j);
    }
    if ((ShortVideoPlayActivity.a(a)) && (a.f == 1) && (i >= ShortVideoPlayActivity.c(a)))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "seek over!! seek to " + ShortVideoPlayActivity.c(a));
      }
      i = (int)((ShortVideoPlayActivity.c(a) - 2) * 1.0D / 100.0D * a.i);
      if (a.jdField_a_of_type_AndroidMediaMediaPlayer != null) {
        a.jdField_a_of_type_AndroidMediaMediaPlayer.seekTo(i);
      }
    }
    do
    {
      return;
      if ((a.f != 1) && (a.f != 2) && (a.f != 4)) {
        break;
      }
    } while (a.jdField_a_of_type_AndroidMediaMediaPlayer == null);
    a.jdField_a_of_type_AndroidMediaMediaPlayer.seekTo(j);
    return;
    a.b(j);
  }
}
