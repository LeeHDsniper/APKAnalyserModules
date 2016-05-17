import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.qqlive.mediaplayer.api.TVK_SDKMgr.OnLogListener;

public class lmm
  implements TVK_SDKMgr.OnLogListener
{
  private lmm()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int d(String paramString1, String paramString2)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(paramString1, 4, paramString2);
    }
    return 0;
  }
  
  public int e(String paramString1, String paramString2)
  {
    if (QLog.isDevelopLevel()) {
      QLog.e(paramString1, 4, paramString2);
    }
    return 0;
  }
  
  public int i(String paramString1, String paramString2)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i(paramString1, 4, paramString2);
    }
    return 0;
  }
  
  public int v(String paramString1, String paramString2)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(paramString1, 4, paramString2);
    }
    return 0;
  }
  
  public int w(String paramString1, String paramString2)
  {
    if (QLog.isDevelopLevel()) {
      QLog.w(paramString1, 4, paramString2);
    }
    return 0;
  }
}
