import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.Thumbnail;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class owa
  implements IWyFileSystem.IWyCallback
{
  public owa(WeiYunLogicCenter paramWeiYunLogicCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(IWyFileSystem.Thumbnail paramThumbnail)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "getOfflinePicThumb onSucceed.");
    }
    a.a.a().a(true, 39, new Object[] { paramThumbnail });
    FileManagerEntity localFileManagerEntity;
    if ((context instanceof FileManagerEntity))
    {
      localFileManagerEntity = (FileManagerEntity)context;
      if ((filePath != null) && (filePath.length() >= 1)) {}
    }
    else
    {
      return;
    }
    strThumbPath = filePath;
    a.a.a().c(localFileManagerEntity);
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "getOfflinePicThumb onFailed: errcode[" + errorCode + "], errmsg[" + errorMsg + "]");
    }
  }
}
