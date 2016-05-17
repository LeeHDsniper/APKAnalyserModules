import com.tencent.mobileqq.activity.aio.item.FileItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.util.FMDialogUtil.FMDialogInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kvt
  implements FMDialogUtil.FMDialogInterface
{
  public kvt(FileItemBuilder paramFileItemBuilder, FileManagerEntity paramFileManagerEntity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.getCloudType() == 0)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.a.a().a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder.a.a().b(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
  }
  
  public void b() {}
}
