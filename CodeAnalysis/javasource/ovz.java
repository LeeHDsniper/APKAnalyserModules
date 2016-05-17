import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.Thumbnail;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class ovz
  implements IWyFileSystem.IWyCallback
{
  public ovz(WeiYunLogicCenter paramWeiYunLogicCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(IWyFileSystem.Thumbnail paramThumbnail)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "getWeiYunThumb onSucceed. filePath[" + filePath + "]");
    }
    a.a.a().a(true, 39, new Object[] { paramThumbnail });
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "getWeiYunThumb onFailed: errcode[" + errorCode + "], errmsg[" + errorMsg + "]");
    }
  }
}
