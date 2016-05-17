import android.os.Handler;
import com.tencent.maxvideo.mediadevice.AVCodec;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.common.GloableValue;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.IOException;

class mjl
  implements Runnable
{
  mjl(mjk paramMjk)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (!localRMVideoStateMgr.c()) {}
    for (;;)
    {
      return;
      File localFile = new File(GloableValue.c + File.separator + ".nomedia");
      if (!localFile.exists()) {}
      try
      {
        localFile.createNewFile();
        a.postDelayed(a.a, 10000L);
        localRMVideoStateMgr.k();
        localRMVideoStateMgr.l();
        localRMVideoStateMgr.j();
        try
        {
          AVCodec.get().init();
          a.c = true;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("RMVideoInitState", 2, "[@] delayInit,run finish");
          return;
        }
        catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
        {
          for (;;)
          {
            localUnsatisfiedLinkError.printStackTrace();
            a.c = false;
          }
        }
      }
      catch (IOException localIOException)
      {
        for (;;) {}
      }
    }
  }
}
