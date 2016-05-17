import android.content.Context;
import com.tencent.mobileqq.activity.aio.item.FileItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.util.FMDialogUtil.FMDialogInterface;
import com.tencent.mobileqq.filemanager.util.FMToastUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class kvs
  implements FMDialogUtil.FMDialogInterface
{
  public kvs(FileItemBuilder paramFileItemBuilder, MessageForFile paramMessageForFile, Context paramContext, FileManagerEntity paramFileManagerEntity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    FMToastUtil.b(FileManagerUtil.d(jdField_a_of_type_ComTencentMobileqqDataMessageForFile.fileName) + jdField_a_of_type_AndroidContentContext.getString(2131362754));
    if (jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity == null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity = jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.getFilePath(), null, jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0, false);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nRelatedSessionId = jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId;
      jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
      if (QLog.isColorLevel()) {
        QLog.i("@-@", 1, "mEntity[" + String.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId) + "]'s relateId[" + String.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nRelatedSessionId) + "] reInit");
      }
      return;
      jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId);
    }
  }
  
  public void b() {}
}
