import android.view.View;
import android.widget.Toast;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.item.PttItemBuilder;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kzi
  implements ActionSheet.OnButtonClickListener
{
  public kzi(PttItemBuilder paramPttItemBuilder, MessageForPtt paramMessageForPtt, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt);
    paramView = ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt);
    if (paramView != null) {}
    try
    {
      c2cViaOffline = true;
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt.istroop, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt.getLocalFilePath(), uniseq, true, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt.voiceLength * 1000, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt.voiceType, true, jdField_a_of_type_ComTencentMobileqqDataMessageForPtt.voiceChangeFlag, 0, true);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.a();
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
    }
    catch (RuntimeException paramView)
    {
      for (;;)
      {
        paramView.printStackTrace();
        Toast.makeText(jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.jdField_a_of_type_AndroidContentContext, paramView.getMessage(), 0).show();
      }
    }
  }
}
