import android.media.MediaPlayer;
import android.media.MediaPlayer.OnPreparedListener;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpn
  implements MediaPlayer.OnPreparedListener
{
  public mpn(ShortVideoPreviewActivity paramShortVideoPreviewActivity, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "mMediaPlayer onPrepared: mDuration=" + jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPreviewActivity.b);
    }
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPreviewActivity.g();
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPreviewActivity.a.start();
    if (jdField_a_of_type_Int > 0) {
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPreviewActivity.a.seekTo(jdField_a_of_type_Int);
    }
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPreviewActivity.b(1);
  }
}
