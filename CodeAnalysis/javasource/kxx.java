import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.widget.BaseAdapter;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.item.LocationItemBuilder;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kxx
  implements DialogInterface.OnClickListener
{
  public kxx(LocationItemBuilder paramLocationItemBuilder, MessageForText paramMessageForText)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataMessageForText);
    ChatActivityFacade.c(jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqDataMessageForText.msg);
    jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder.jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
  }
}
