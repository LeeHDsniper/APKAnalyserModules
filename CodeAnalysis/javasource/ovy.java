import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopFileStatusInfo;
import com.tencent.mobileqq.troop.utils.TroopFileTransferManager;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.CommonFtnFile;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class ovy
  implements IWyFileSystem.IWyCallback
{
  public ovy(WeiYunLogicCenter paramWeiYunLogicCenter, FileManagerEntity paramFileManagerEntity, TroopFileTransferManager paramTroopFileTransferManager, TroopFileStatusInfo paramTroopFileStatusInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(IWyFileSystem.CommonFtnFile paramCommonFtnFile)
  {
    paramCommonFtnFile = guid;
    if ((paramCommonFtnFile == null) || (paramCommonFtnFile.length() < 1))
    {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "sendWyFile2QqOffline onSucceed,But uuid is null!!!");
      }
      if (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileTransferManager != null) {
        jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqTroopDataTroopFileStatusInfo.a, -1, null, "转存失败,请稍后重试");
      }
    }
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "sendWyFile2QqOffline onSucceed, Uuid[" + paramCommonFtnFile + "]");
      }
    } while (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileTransferManager == null);
    jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqTroopDataTroopFileStatusInfo.a, 0, paramCommonFtnFile, null);
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "sendWeiYun2Troop onFailed: errcode[" + errorCode + "], errmsg[" + errorMsg + "]");
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 0;
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.isReaded = false;
    jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqTroopDataTroopFileStatusInfo.a, errorCode, null, errorMsg);
  }
}
