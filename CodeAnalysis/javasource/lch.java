import android.view.View;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForTroopGift;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopGiftManager;
import com.tencent.mobileqq.troop.utils.TroopGiftManager.DownloadGftData;
import com.tencent.qphone.base.util.QLog;

class lch
  implements Runnable
{
  lch(lcg paramLcg, TroopGiftManager.DownloadGftData paramDownloadGftData)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopGiftManager$DownloadGftData.a)
    {
      jdField_a_of_type_Lcg.a.isLoading = false;
      if (QLog.isColorLevel()) {
        QLog.d(ChatItemBuilder.a, 2, "GONE uniseq = " + jdField_a_of_type_Lcg.a.uniseq);
      }
      ((TroopGiftManager)lcg.a(jdField_a_of_type_Lcg).getManager(112)).b(jdField_a_of_type_Lcg);
      jdField_a_of_type_Lcg.c.setVisibility(8);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d(ChatItemBuilder.a, 2, "VISIBLE uniseq = " + jdField_a_of_type_Lcg.a.uniseq);
    }
    jdField_a_of_type_Lcg.a.isLoading = true;
    jdField_a_of_type_Lcg.c.setVisibility(0);
  }
}
