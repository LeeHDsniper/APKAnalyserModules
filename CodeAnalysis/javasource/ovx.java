import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter.fileAssistantReportData;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.CommonFtnFile;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class ovx
  implements IWyFileSystem.IWyCallback
{
  public ovx(WeiYunLogicCenter paramWeiYunLogicCenter, FileManagerEntity paramFileManagerEntity, int paramInt)
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
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(false, 33, new Object[] { Integer.valueOf(13), "", Long.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId) });
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, "actFileWy2Of", 0L, "", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, "", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strFileMd5, 9001L, "onSucceed but guid null", 0L, 0L, 0L, "", "", 0, "onSucceed but guid null", null);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "sendWyFile2QqOffline onSucceed, Uuid[" + paramCommonFtnFile + "]");
    }
    int i;
    String str;
    if (!FileUtils.b(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strThumbPath))
    {
      i = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fileName);
      if (i != 0) {
        break label465;
      }
      str = jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a(paramCommonFtnFile, 3, true, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
      if (str != null) {
        jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strThumbPath = str;
      }
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid = paramCommonFtnFile;
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.setCloudType(1);
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 1;
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.isReaded = false;
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.bSend = true;
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fProgress = 0.0F;
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid = paramCommonFtnFile;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a();
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().c(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 2;
    FileManagerUtil.b(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId);
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity, 8, "");
    if (jdField_a_of_type_Int == 3000) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a(), jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fileName, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.fileSize, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.Uuid, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.uniseq, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.msgUid, null);
    }
    for (;;)
    {
      paramCommonFtnFile = new FileManagerReporter.fileAssistantReportData();
      b = "send_file_suc";
      jdField_a_of_type_Int = 1;
      FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a(), paramCommonFtnFile);
      return;
      label465:
      if (i != 2) {
        break;
      }
      str = jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().b(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity, 2);
      if (str == null) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.strThumbPath = str;
      break;
      paramCommonFtnFile = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin.replace("+", "");
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(paramCommonFtnFile, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity, null);
    }
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "sendWyFile2QqOffline onFailed: errcode[" + errorCode + "], errmsg[" + errorMsg + "]");
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.status = 0;
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.isReaded = false;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a();
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().c(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity);
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, 1005);
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a.a().a(false, 33, new Object[] { Integer.valueOf(errorCode), errorMsg, Long.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId) });
    FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.a, jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId, "actFileWy2Of", 0L, "", jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.peerUin, "", "", errorCode, errorMsg, 0L, 0L, 0L, "", "", 0, errorMsg, null);
  }
}
