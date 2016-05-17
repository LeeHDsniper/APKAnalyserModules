import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lfj
  implements DialogInterface.OnClickListener
{
  public lfj(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie, PublicAccountInfo paramPublicAccountInfo, PublicAccountDataManager paramPublicAccountDataManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.mIsAgreeSyncLbs = true;
    jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.mIsSyncLbsSelected = true;
    jdField_a_of_type_ComTencentMobileqqAppPublicAccountDataManager.a(jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo);
    BusinessCmrTmpChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildBusinessCmrTmpChatPie, 1, null);
    paramDialogInterface = new lfk(this);
    jdField_a_of_type_ComTencentMobileqqActivityAioRebuildBusinessCmrTmpChatPie.a.a(paramDialogInterface);
    BusinessCmrTmpChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildBusinessCmrTmpChatPie);
  }
}
