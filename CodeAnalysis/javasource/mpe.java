import android.media.MediaPlayer;
import android.media.MediaPlayer.OnPreparedListener;
import android.widget.SeekBar;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpe
  implements MediaPlayer.OnPreparedListener
{
  public mpe(ShortVideoPlayActivity paramShortVideoPlayActivity, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "[MediaPlayer] onPrepared: mDuration=" + jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.i);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.i <= 0) {
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.h();
    }
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.i();
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidMediaMediaPlayer.start();
    if (jdField_a_of_type_Int > 0)
    {
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidMediaMediaPlayer.seekTo(jdField_a_of_type_Int);
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidWidgetSeekBar.setProgress(jdField_a_of_type_Int);
    }
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.a(1);
    if (((jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidMediaMediaPlayer.getVideoWidth() == 0) || (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidMediaMediaPlayer.getVideoHeight() == 0)) && (!jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.c()))
    {
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.a(3);
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.k();
    }
    while (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.g != 2) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.a(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.c, 1, 1002, jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.d);
  }
}
