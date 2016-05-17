import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.item.TroopFileItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopFileItemOperation;
import com.tencent.mobileqq.troop.utils.TroopFileTransferManager;
import java.util.UUID;

public class lbz
  implements DialogInterface.OnClickListener
{
  public lbz(TroopFileItemBuilder paramTroopFileItemBuilder, long paramLong, UUID paramUUID, Activity paramActivity)
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
      TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.a, jdField_a_of_type_Long).a(jdField_a_of_type_JavaUtilUUID);
      return;
    }
    new TroopFileItemOperation(jdField_a_of_type_Long, jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder.a, jdField_a_of_type_AndroidAppActivity).b(jdField_a_of_type_JavaUtilUUID);
  }
}
