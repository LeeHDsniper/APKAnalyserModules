import android.os.Build;
import android.view.LayoutInflater;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanelAdapter;
import com.tencent.mobileqq.activity.aio.audiopanel.ListenChangeVoicePanel;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.preop.PttPreSendManager;
import com.tencent.qphone.base.util.QLog;

public class ksq
  implements Runnable
{
  public ksq(AudioPanelAdapter paramAudioPanelAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.b == null) {}
    try
    {
      ListenChangeVoicePanel localListenChangeVoicePanel = (ListenChangeVoicePanel)LayoutInflater.from(AudioPanelAdapter.a(a).a()).inflate(2130903995, null);
      if (a.b == null) {
        a.b = localListenChangeVoicePanel;
      }
      PttPreSendManager.a(AudioPanelAdapter.a(a));
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "inflate ListenPanel on subthread get exception " + localException + " model=" + Build.MANUFACTURER + Build.MODEL);
        }
      }
    }
  }
}
