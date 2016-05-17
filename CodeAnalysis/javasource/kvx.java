import android.view.View;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.item.FileItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kvx
  implements ActionSheet.OnButtonClickListener
{
  public kvx(FileItemBuilder paramFileItemBuilder, MessageForFile paramMessageForFile, BaseChatItemLayout paramBaseChatItemLayout, kvy paramKvy, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    paramView = jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageForFile.uniseq, jdField_a_of_type_ComTencentMobileqqDataMessageForFile.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageForFile.istroop);
    if (paramView != null) {
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_AndroidContentContext, paramView, jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout, jdField_a_of_type_ComTencentMobileqqDataMessageForFile, jdField_a_of_type_Kvy, jdField_a_of_type_ComTencentMobileqqDataMessageForFile.status, false);
    jdField_a_of_type_ComTencentWidgetActionSheet.cancel();
  }
}
