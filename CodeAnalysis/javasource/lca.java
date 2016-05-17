import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.TroopFileItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopFileItemOperation;
import com.tencent.mobileqq.troop.utils.TroopFileManager;
import java.util.UUID;

public class lca
  implements DialogInterface.OnClickListener
{
  public lca(TroopFileItemBuilder paramTroopFileItemBuilder, long paramLong, UUID paramUUID, ChatMessage paramChatMessage, Activity paramActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 0: 
      paramDialogInterface = TroopFileManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_Long);
      paramDialogInterface.b(paramDialogInterface.a(jdField_a_of_type_JavaUtilUUID));
      jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.d(jdField_a_of_type_ComTencentMobileqqDataChatMessage);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().f(jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      return;
    }
    new TroopFileItemOperation(jdField_a_of_type_Long, jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidAppActivity).a(jdField_a_of_type_JavaUtilUUID);
  }
}
