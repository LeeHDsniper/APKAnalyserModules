import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyFileSystem.IWyCallback;
import com.weiyun.sdk.IWyFileSystem.PreviewAdderss;
import com.weiyun.sdk.IWyFileSystem.WyErrorStatus;

public class ovu
  implements IWyFileSystem.IWyCallback
{
  public ovu(WeiYunLogicCenter paramWeiYunLogicCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(IWyFileSystem.PreviewAdderss paramPreviewAdderss)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "get weiyun file PreviewAddress onSucceed");
    }
    String str2 = HexUtil.a(downloadKey);
    String str1 = str2;
    if (str2 == null) {
      str1 = "";
    }
    a.a.a().a(true, 278, new Object[] { Integer.valueOf(0), "", str1, cookie, downloadIp, downloadHost, Integer.valueOf(downloadPort) });
  }
  
  public void onFailed(IWyFileSystem.WyErrorStatus paramWyErrorStatus)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "get weiyun file PreviewAddress onFailed,errCode[" + errorCode + "],errMsg[" + errorMsg + "]");
    }
    a.a.a().a(false, 278, new Object[] { Integer.valueOf(errorCode), errorMsg, "", "", "", "", Integer.valueOf(0) });
  }
}
