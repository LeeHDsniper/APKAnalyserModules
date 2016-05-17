import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.audiopanel.ListenChangeVoicePanel;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.data.NoC2CExtensionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.PttVoiceChangePreSender;

public class kta
  implements Runnable
{
  public kta(ListenChangeVoicePanel paramListenChangeVoicePanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = (FriendsManager)ListenChangeVoicePanel.a(a).getManager(50);
    int i;
    if (!a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.j())
    {
      localObject = ((FriendsManager)localObject).a(a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_JavaLangString, a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_Int, true);
      if (localObject == null) {
        break label148;
      }
      i = pttChangeVoiceType;
    }
    for (;;)
    {
      if (i != -1)
      {
        ListenChangeVoicePanel.a(a, i);
        ListenChangeVoicePanel.a(a)[ListenChangeVoicePanel.a(a)] = 1;
      }
      if (ListenChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender == null) {
        ListenChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender = new PttVoiceChangePreSender();
      }
      return;
      localObject = ((FriendsManager)localObject).a(a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_JavaLangString, true);
      if (localObject != null) {
        i = pttChangeVoiceType;
      } else {
        label148:
        i = -1;
      }
    }
  }
}
