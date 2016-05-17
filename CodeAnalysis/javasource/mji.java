import android.widget.Toast;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMViewSTInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.VideoEnvironment;
import com.tencent.qphone.base.util.QLog;

class mji
  implements Runnable
{
  mji(mjh paramMjh)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d(mjh.a, 2, "RMFileEventNotify[runOnUIThread][stopWatching-delete-quit]");
    }
    Toast.makeText(VideoEnvironment.a(), "视频缓存被恶意篡改了", 1).show();
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    localRMVideoStateMgr.a(mjh.a);
    if (a != null) {
      a.o();
    }
  }
}
