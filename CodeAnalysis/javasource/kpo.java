import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.os.SystemClock;
import com.tencent.mobileqq.activity.aio.AudioPlayer;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.player.IPttPlayer;
import com.tencent.qphone.base.util.QLog;

public class kpo
  extends BroadcastReceiver
{
  int jdField_a_of_type_Int;
  long jdField_a_of_type_Long;
  String jdField_a_of_type_JavaLangString;
  boolean jdField_a_of_type_Boolean;
  long b;
  
  public kpo(AudioPlayer paramAudioPlayer, String paramString, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
    b = 0L;
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Int = paramInt;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    long l = SystemClock.uptimeMillis();
    int i = paramIntent.getIntExtra("android.media.extra.SCO_AUDIO_STATE", -1);
    if (QLog.isColorLevel()) {
      QLog.d(AudioPlayer.jdField_a_of_type_JavaLangString, 2, "onReceive ACTION_SCO_AUDIO_STATE_UPDATED = " + i + " " + jdField_a_of_type_JavaLangString + ", time=" + l);
    }
    if (1 == i) {
      if (b == 0L)
      {
        b = l;
        AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer, AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer));
        if (!jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a()) {
          AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer, jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
        }
      }
    }
    do
    {
      do
      {
        return;
        if (2 == i)
        {
          jdField_a_of_type_Boolean = true;
          return;
        }
      } while (i != 0);
      if (jdField_a_of_type_Long == 0L)
      {
        jdField_a_of_type_Long = l;
        return;
      }
      if (jdField_a_of_type_Boolean) {
        jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.d();
      }
      if (((b != 0L) && (l - b <= 2000L)) || (l - jdField_a_of_type_Long <= 1000L))
      {
        if (QLog.isColorLevel()) {
          QLog.d(AudioPlayer.jdField_a_of_type_JavaLangString, 2, "sco disconnected quickly.");
        }
        AudioPlayer.b(true);
        if ((AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer)) && (!AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer).isBluetoothA2dpOn())) {
          AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer, false);
        }
        if (!jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a())
        {
          AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer, jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
          return;
        }
        AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer, 0);
        return;
      }
    } while (!jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a());
    AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer, AudioPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer).a());
  }
}
