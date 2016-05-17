import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class ovt
  implements IWyFileSystem.IWyCallback
{
  public ovt(WeiYunLogicCenter paramWeiYunLogicCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "verifyPwd, onSucceed");
    }
    a.a.a().a(true, 45, new Object[] { Integer.valueOf(0), null, paramString });
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "verifyPwd, onFailed. errorCode[" + String.valueOf(errorCode) + "],errorMsg[" + errorMsg + "]");
    }
    a.a.a().a(false, 45, new Object[] { Integer.valueOf(errorCode), errorMsg, null });
  }
}
