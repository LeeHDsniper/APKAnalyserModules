import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.WeiYunFileInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.ListFiles;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;
import com.weiyun.sdk.data.WyFileInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

public class ovv
  implements IWyFileSystem.IWyCallback
{
  public ovv(WeiYunLogicCenter paramWeiYunLogicCenter, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(IWyFileSystem.ListFiles paramListFiles)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunFileList onSucceed, num[" + files.size() + "]");
    }
    Object localObject = files;
    ArrayList localArrayList = new ArrayList();
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      WyFileInfo localWyFileInfo = (WyFileInfo)((Iterator)localObject).next();
      WeiYunFileInfo localWeiYunFileInfo = new WeiYunFileInfo();
      jdField_b_of_type_Long = mtime;
      jdField_a_of_type_Long = fileSize;
      jdField_c_of_type_Int = source;
      jdField_a_of_type_JavaLangString = fileId;
      jdField_b_of_type_JavaLangString = fileName;
      e = cookieName;
      f = cookieValue;
      jdField_d_of_type_JavaLangString = encodeUrl;
      jdField_c_of_type_JavaLangString = hostName;
      jdField_d_of_type_Int = serverPort;
      h = md5;
      if (!jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.jdField_a_of_type_JavaUtilLinkedHashMap.containsKey(jdField_a_of_type_JavaLangString))
      {
        jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.jdField_a_of_type_JavaUtilLinkedHashMap.put(jdField_a_of_type_JavaLangString, localWeiYunFileInfo);
        localArrayList.add(localWeiYunFileInfo);
      }
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(true, 31, new Object[] { categoryId, Boolean.valueOf(isEnd), Integer.valueOf(totalNum), Long.valueOf(timestamp), localArrayList, Integer.valueOf(jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.jdField_a_of_type_Int) });
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunFileList onFailed: errcode[" + errorCode + "], errmsg[" + errorMsg + "]");
    }
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 31, new Object[] { Integer.valueOf(errorCode), errorMsg, jdField_a_of_type_JavaLangString });
  }
}
