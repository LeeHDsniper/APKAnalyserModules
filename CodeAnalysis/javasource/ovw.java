import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.OfflineFileInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.ListOfflineFile;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;
import com.weiyun.sdk.data.WyOfflineFileInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ovw
  implements IWyFileSystem.IWyCallback
{
  public ovw(WeiYunLogicCenter paramWeiYunLogicCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(IWyFileSystem.ListOfflineFile paramListOfflineFile)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "queryOfflineFileList onSucceed, num[" + files.size() + "]");
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = files.iterator();
    while (localIterator.hasNext())
    {
      WyOfflineFileInfo localWyOfflineFileInfo = (WyOfflineFileInfo)localIterator.next();
      OfflineFileInfo localOfflineFileInfo = new OfflineFileInfo();
      jdField_a_of_type_Boolean = bSend;
      jdField_a_of_type_Int = dangerLevel;
      jdField_b_of_type_Long = fileSize;
      c = (MessageCache.a() * 1000L + lifeTime);
      d = uploadTime;
      jdField_b_of_type_JavaLangString = fileName;
      jdField_a_of_type_JavaLangString = guid;
      jdField_a_of_type_Long = uin;
      localArrayList.add(localOfflineFileInfo);
      if (QLog.isColorLevel()) {
        QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "OfflineFileInfo[" + localOfflineFileInfo.toString() + "]");
      }
    }
    a.a.a().a(true, 32, new Object[] { Boolean.valueOf(isEnd), localArrayList });
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryOfflineFileList onFailed: errcode[" + errorCode + "], errmsg[" + errorMsg + "]");
    }
    a.a.a().a(false, 32, new Object[] { Integer.valueOf(errorCode), errorMsg });
  }
}
