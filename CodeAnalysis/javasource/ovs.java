import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class ovs
  implements IWyFileSystem.IWyCallback
{
  public ovs(WeiYunLogicCenter paramWeiYunLogicCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(Boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryNeedVerifyPwd, onSucceed  need pwd[" + paramBoolean + "]");
    }
    a.a.a().a(true, 44, new Object[] { Integer.valueOf(0), null, paramBoolean });
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryNeedVerifyPwd, onFailed. errorCode[" + String.valueOf(errorCode) + "],errorMsg[" + errorMsg + "]");
    }
    a.a.a().a(false, 44, new Object[] { Integer.valueOf(errorCode), errorMsg, null });
  }
}
