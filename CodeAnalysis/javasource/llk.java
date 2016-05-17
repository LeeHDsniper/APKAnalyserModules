import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.TroopLowCreditLevelNotifyActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class llk
  implements DialogInterface.OnClickListener
{
  public llk(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = new Intent(a.jdField_a_of_type_AndroidContentContext, TroopLowCreditLevelNotifyActivity.class);
    paramDialogInterface.putExtra("troopUin", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    a.jdField_a_of_type_AndroidContentContext.startActivity(paramDialogInterface);
  }
}
