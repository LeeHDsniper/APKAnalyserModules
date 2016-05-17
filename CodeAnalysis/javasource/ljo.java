import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ljo
  implements DialogInterface.OnClickListener
{
  public ljo(PublicAccountChatPie paramPublicAccountChatPie, PublicAccountInfo paramPublicAccountInfo, PublicAccountDataManager paramPublicAccountDataManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.mIsAgreeSyncLbs = true;
    jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.mIsSyncLbsSelected = true;
    jdField_a_of_type_ComTencentMobileqqAppPublicAccountDataManager.a(jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo);
    jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.a(1, null);
    paramDialogInterface = new ljp(this);
    jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.a.a(paramDialogInterface);
    PublicAccountChatPie.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie);
  }
}
