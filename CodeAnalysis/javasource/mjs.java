import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture;
import com.tencent.qphone.base.util.QLog;

class mjs
  implements Runnable
{
  mjs(mjq paramMjq)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (QLog.isColorLevel()) {
      QLog.d("RMRecordState", 2, "[@] EVENT_READ_MIC [error]麦克风读取数据错误...");
    }
    f = true;
    d = false;
    if (a != null)
    {
      if (a.o != -1) {
        break label92;
      }
      localRMVideoStateMgr.b(0, "麦克风被禁用", false);
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("RMRecordState", 2, "[@] EVENT_READ_MIC [error]麦克风被禁用,音频录制失败 errorcode=" + a.o);
      }
      return;
      label92:
      if (a.o == -2) {
        localRMVideoStateMgr.b(0, "麦克风可能被禁用", false);
      } else if (a.o == -3) {
        localRMVideoStateMgr.b(0, "麦克风可能被禁用", false);
      } else {
        localRMVideoStateMgr.b(0, "麦克风可能被禁用", false);
      }
    }
  }
}
