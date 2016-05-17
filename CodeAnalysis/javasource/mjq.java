import android.os.Handler;
import com.tencent.maxvideo.mediadevice.AVCodec;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoState;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMViewSTInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.common.TCTimer;
import com.tencent.mobileqq.shortvideo.common.TCTimer.TCTimerCallback;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture;
import com.tencent.mobileqq.shortvideo.mediadevice.CodecParam;
import com.tencent.mobileqq.shortvideo.mediadevice.Lock;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext;
import com.tencent.mobileqq.shortvideo.mediadevice.RecordManager;
import com.tencent.mobileqq.shortvideo.tools.QzoneBaseThread;
import com.tencent.mobileqq.shortvideo.tools.QzoneHandlerThreadFactory;
import com.tencent.qphone.base.util.QLog;

public class mjq
  extends RMVideoState
{
  private static final String jdField_a_of_type_JavaLangString = "RMRecordState";
  private long jdField_a_of_type_Long;
  private boolean jdField_a_of_type_Boolean;
  
  public mjq()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
  }
  
  private void d()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (QLog.isColorLevel()) {
      QLog.d("RMRecordState", 2, "[@] [startRecordVideo]Lock.CAPTURE_LOCK=" + Lock.jdField_a_of_type_Boolean);
    }
    if (!Lock.jdField_a_of_type_Boolean) {}
    synchronized (Lock.jdField_a_of_type_JavaLangObject)
    {
      Lock.jdField_a_of_type_Boolean = true;
      Lock.jdField_a_of_type_JavaLangObject.notifyAll();
      if (QLog.isColorLevel()) {
        QLog.d("RMRecordState", 2, "[@] [startRecordVideo]Lock.CAPTURE_LOCK=" + Lock.jdField_a_of_type_Boolean);
      }
      AVCodec.get().startCapture();
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.e();
      if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) {
        jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.h();
      }
      jdField_a_of_type_Long = System.currentTimeMillis();
      return;
    }
  }
  
  public void a()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.e();
    localRMVideoStateMgr.j();
    if (QLog.isColorLevel()) {
      QLog.d("RMRecordState", 2, "[@] [RMFileEventNotify]stopWatching");
    }
    jdField_a_of_type_Boolean = false;
    d();
    if (QLog.isColorLevel()) {
      QLog.d("RMRecordState", 2, "[@] initState end");
    }
  }
  
  public void a(TCTimer.TCTimerCallback paramTCTimerCallback, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    paramTCTimerCallback = RMVideoStateMgr.a();
    jdField_a_of_type_Double = (RecordManager.a().a().a() + paramInt1);
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = paramBoolean;
      if ((paramTCTimerCallback.e()) && (!jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.e) && (!f)) {
        jdField_a_of_type_AndroidOsHandler.post(new mjs(this));
      }
      if (QLog.isColorLevel()) {
        QLog.d("RMRecordState", 2, "[@] timeExpire: mIsRecordOver=" + jdField_a_of_type_Boolean + " mStateMgr.mTotalTime=" + jdField_a_of_type_Double);
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.a((int)jdField_a_of_type_Double, jdField_a_of_type_Boolean);
      if (jdField_a_of_type_Boolean) {
        jdField_a_of_type_AndroidOsHandler.postAtFrontOfQueue(new mjt(this));
      }
    }
  }
  
  public void b()
  {
    c();
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    localRMVideoStateMgr.a(2);
    localRMVideoStateMgr.i();
    if (QLog.isColorLevel()) {
      QLog.d("RMRecordState", 2, "[@] [RMFileEventNotify]startWatching");
    }
  }
  
  public void c()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (QLog.isColorLevel()) {
      QLog.d("RMRecordState", 2, "[@] [stopRecordVideo]Lock.CAPTURE_LOCK = " + Lock.jdField_a_of_type_Boolean);
    }
    if (Lock.jdField_a_of_type_Boolean)
    {
      Lock.jdField_a_of_type_Boolean = false;
      long l = System.currentTimeMillis();
      jdField_a_of_type_Long = (l - jdField_a_of_type_Long);
      if (QLog.isColorLevel()) {
        QLog.d("RMRecordState", 2, "[@] [stopRecordVideo] current=" + l + " timestamp=" + jdField_a_of_type_Long);
      }
      if (jdField_a_of_type_Boolean) {
        jdField_a_of_type_Double = CodecParam.c;
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.i();
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.f();
      if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) {
        jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.i();
      }
      QzoneHandlerThreadFactory.a("Normal_HandlerThread", false).a(new mjr(this, localRMVideoStateMgr));
      AVCodec.get().stopCapture();
      if ((jdField_a_of_type_Long < 500L) && (!jdField_a_of_type_Boolean))
      {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.c(true);
        localRMVideoStateMgr.a(true);
      }
      if (QLog.isColorLevel()) {
        QLog.d("RMRecordState", 2, "[@] stopRecordVideo end Lock.CAPTURE_LOCK = " + Lock.jdField_a_of_type_Boolean);
      }
    }
  }
  
  public void f()
  {
    b();
  }
}
