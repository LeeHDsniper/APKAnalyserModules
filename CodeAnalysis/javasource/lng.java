import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.activity.aio.tips.TroopAssistTipsBar;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;

public class lng
  implements Runnable
{
  public lng(TroopAssistTipsBar paramTroopAssistTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (!TroopAssistantManager.a().e(TroopAssistTipsBar.a(a))) {
      if (QLog.isColorLevel()) {
        QLog.d(TroopAssistTipsBar.a(), 2, "getTroopAssistTipInRange false, return ");
      }
    }
    for (;;)
    {
      return;
      if (TroopAssistTipsBar.a(a).getIntent() != null)
      {
        boolean bool = ((HotChatManager)TroopAssistTipsBar.a(a).getManager(59)).b(aa).jdField_a_of_type_JavaLangString);
        int i = TroopAssistTipsBar.a(a).a().a(aa).jdField_a_of_type_JavaLangString, aa).jdField_a_of_type_Int);
        if ((i > 99) && (!TroopAssistantManager.a().b(TroopAssistTipsBar.a(a), aa).jdField_a_of_type_JavaLangString)) && (TroopAssistTipsBar.a(a).b(aa).jdField_a_of_type_JavaLangString) == 1) && (!bool)) {
          if (i <= 200) {}
        }
        for (i = 1; (i != 0) && (TroopAssistTipsBar.a(a).a(a, new Object[0])); i = 0)
        {
          TroopAssistantManager.a().i(TroopAssistTipsBar.a(a));
          ReportController.b(TroopAssistTipsBar.a(a), "CliOper", "", "", "Grp_helper", "Aio_grp_banner", 0, 0, "", "", "", "");
          return;
          TroopAssistTipsBar.a(a, true);
        }
      }
    }
  }
}
