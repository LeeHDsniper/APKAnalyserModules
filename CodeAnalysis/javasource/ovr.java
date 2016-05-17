import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.WeiYunClassificationType;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;
import com.weiyun.sdk.data.WyCategoryInfo;
import java.util.Iterator;
import java.util.List;

public class ovr
  implements IWyFileSystem.IWyCallback
{
  public ovr(WeiYunLogicCenter paramWeiYunLogicCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunTypeList onSucceed, num[" + paramList.size() + "]");
    }
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      WyCategoryInfo localWyCategoryInfo = (WyCategoryInfo)paramList.next();
      WeiYunClassificationType localWeiYunClassificationType = new WeiYunClassificationType();
      jdField_a_of_type_JavaLangString = categoryId;
      b = name;
      jdField_a_of_type_Long = timestamp;
      jdField_a_of_type_Int = totalNum;
      a.jdField_a_of_type_JavaUtilList.add(localWeiYunClassificationType);
    }
    a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(true, 30, a.jdField_a_of_type_JavaUtilList);
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunTypeList onFailed: errcode[" + errorCode + "], errmsg[" + errorMsg + "]");
    }
    a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 30, new Object[] { Integer.valueOf(errorCode), errorMsg });
  }
}
