import com.tencent.mobileqq.activity.aio.audiopanel.ChangeVoiceView;
import com.tencent.mobileqq.activity.aio.audiopanel.ListenChangeVoicePanel;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class kte
  implements Runnable
{
  public kte(ListenChangeVoicePanel paramListenChangeVoicePanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QQToast.a(ListenChangeVoicePanel.a(a).a(), "播放变音error", 0);
    a.a[ListenChangeVoicePanel.a(a)].a(1);
  }
}
