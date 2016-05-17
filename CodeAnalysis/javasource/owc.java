import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.WeiYunFileInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class owc
  implements IWyFileSystem.IWyCallback
{
  public owc(WeiYunLogicCenter paramWeiYunLogicCenter, WeiYunFileInfo paramWeiYunFileInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(Void paramVoid)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "deleteWeiYunFile, onSucceed  strFileId[" + jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.a + "]strFileName[" + String.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.b) + "]");
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(true, 20, new Object[] { Integer.valueOf(0), null, jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.a, jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.b, Boolean.valueOf(false) });
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "deleteWeiYunFile, onFailed  strFileId[" + jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.a + "]strFileName[" + String.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.b) + "]errorCode[" + String.valueOf(errorCode) + "],errorMsg[" + errorMsg + "]");
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(false, 20, new Object[] { Integer.valueOf(errorCode), errorMsg, jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.a, jdField_a_of_type_ComTencentMobileqqFilemanagerDataWeiYunFileInfo.b, Boolean.valueOf(false) });
  }
}
