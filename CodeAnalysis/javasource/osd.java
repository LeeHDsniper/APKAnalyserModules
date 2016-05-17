import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class osd
  implements Runnable
{
  public osd(FileManagerNotifyCenter paramFileManagerNotifyCenter, FileManagerEntity paramFileManagerEntity, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 2;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.uniseq, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerType, 16, null, 14, null);
    for (;;)
    {
      if (jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fProgress >= 0.95F)
      {
        jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fProgress = 1.0F;
        jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.uniseq, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerType, 16, null, 14, null);
      }
      try
      {
        Thread.sleep(50L);
        if (jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fProgress < 1.0F) {
          continue;
        }
        jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fProgress = 1.0F;
        jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fProgress = 0.0F;
        jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 1;
        switch (jdField_a_of_type_Int)
        {
        default: 
          jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a.a().a(true, 3, null);
          FileManagerUtil.c(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId);
          jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a.a().c(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
          return;
          FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity;
          fProgress = ((float)(fProgress + 0.05D));
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
          continue;
          jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.setCloudType(3);
          jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 1;
          jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.uniseq, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerType, 14, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.getFilePath(), Long.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fileSize), Boolean.valueOf(true), jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strServerPath }, 0, null);
          continue;
          jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.uniseq, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerType, 14, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.getFilePath(), Long.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fileSize), Boolean.valueOf(true), jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strServerPath }, 0, null);
          continue;
          jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a.a().a(true, 34, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.WeiYunFileId, Long.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId) });
          continue;
          jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter.a.a().a(true, 33, new Object[] { jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid });
        }
      }
    }
  }
}
