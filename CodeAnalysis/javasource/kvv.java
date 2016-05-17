import android.os.Handler;
import android.view.View;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.FileItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.filemanager.core.FileManagerRSCenter;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kvv
  implements ActionSheet.OnButtonClickListener
{
  public kvv(FileItemBuilder paramFileItemBuilder, MessageForFile paramMessageForFile, BaseChatItemLayout paramBaseChatItemLayout, kvy paramKvy, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageForFile.uniseq, jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, -1L) != -1) {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_AndroidOsHandler.post(new kvw(this));
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.cancel();
      return;
      jdField_a_of_type_ComTencentMobileqqDataMessageForFile.status = 1002;
      paramView = jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.a(jdField_a_of_type_ComTencentMobileqqDataMessageForFile);
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_AndroidContentContext, paramView, jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout, jdField_a_of_type_ComTencentMobileqqDataMessageForFile, jdField_a_of_type_Kvy, jdField_a_of_type_ComTencentMobileqqDataMessageForFile.status, false);
    }
  }
}
