import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vipgift.VipGiftDownloadInfo;
import com.tencent.mobileqq.vipgift.VipGiftManager;

public class laz
  implements Runnable
{
  public laz(StructingMsgItemBuilder paramStructingMsgItemBuilder, VipGiftDownloadInfo paramVipGiftDownloadInfo, VipGiftManager paramVipGiftManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((jdField_a_of_type_ComTencentMobileqqVipgiftVipGiftDownloadInfo.d == 1L) && (jdField_a_of_type_ComTencentMobileqqVipgiftVipGiftDownloadInfo.b.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)))
    {
      jdField_a_of_type_ComTencentMobileqqVipgiftVipGiftManager.a(6L, jdField_a_of_type_ComTencentMobileqqVipgiftVipGiftDownloadInfo.a);
      ((BaseActivity)jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder.jdField_a_of_type_AndroidContentContext).runOnUiThread(new lba(this));
    }
  }
}
