import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.item.ShakeItemBuilder;
import com.tencent.mobileqq.data.MessageForShakeWindow;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lac
  implements DialogInterface.OnClickListener
{
  public lac(ShakeItemBuilder paramShakeItemBuilder, MessageForShakeWindow paramMessageForShakeWindow)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemShakeItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemShakeItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemShakeItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqDataMessageForShakeWindow.uniseq);
  }
}
