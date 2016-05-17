import android.os.Handler;
import com.tencent.maxvideo.common.MessageStruct;
import com.tencent.maxvideo.mediadevice.AVCodec;
import com.tencent.maxvideo.mediadevice.AVCodec.AVCodecCallback;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoState;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMViewSTInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.common.TCTimer;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraProxy.CameraPreviewObservable;
import com.tencent.mobileqq.shortvideo.mediadevice.CodecParam;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext;
import com.tencent.mobileqq.shortvideo.mediadevice.RecordManager;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.Arrays;

public class mjk
  extends RMVideoState
{
  static final long jdField_a_of_type_Long = 50L;
  static final String jdField_a_of_type_JavaLangString = "RMVideoInitState";
  static final long jdField_b_of_type_Long = 10000L;
  final Runnable jdField_a_of_type_JavaLangRunnable;
  boolean jdField_a_of_type_Boolean;
  boolean jdField_b_of_type_Boolean;
  boolean c;
  boolean d;
  boolean e;
  
  public mjk()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    b = false;
    c = false;
    d = false;
    e = true;
    jdField_a_of_type_JavaLangRunnable = new mjm(this);
  }
  
  public void a()
  {
    d = false;
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (localRMVideoStateMgr != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.d();
      }
      if (!c) {
        c = false;
      }
      if (!c) {
        d();
      }
    }
    else
    {
      return;
    }
    localRMVideoStateMgr.l();
    c();
  }
  
  public void a(AVCodec.AVCodecCallback paramAVCodecCallback, MessageStruct paramMessageStruct)
  {
    paramAVCodecCallback = RMVideoStateMgr.a();
    switch (mId)
    {
    default: 
      return;
    }
    jdField_a_of_type_JavaLangString = ((String)mObj0);
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Mjh = null;
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoInitState", 2, "[@] onAVCodecEvent[RMFileEventNotify] path=" + jdField_a_of_type_JavaLangString + ",files : " + Arrays.toString(new File(jdField_a_of_type_JavaLangString).list()));
    }
    jdField_a_of_type_AndroidOsHandler.post(new mjo(this));
    e();
  }
  
  public void a(Object paramObject, int paramInt, Object... paramVarArgs)
  {
    if ((paramObject instanceof CameraProxy.CameraPreviewObservable)) {
      switch (paramInt)
      {
      }
    }
    label719:
    for (;;)
    {
      super.a(paramObject, paramInt, paramVarArgs);
      return;
      if (paramVarArgs != null) {
        if ((paramVarArgs[0] instanceof Boolean))
        {
          b = true;
          e();
          if (QLog.isColorLevel()) {
            QLog.d("RMVideoInitState", 2, "[@] EVENT_CREATE_CAMERA[success] obj= " + paramVarArgs[0]);
          }
        }
        else if ((paramVarArgs[0] instanceof String))
        {
          if (!d)
          {
            d = true;
            RMVideoStateMgr.a().a(2002, "抱歉，初始化摄像头失败", false);
          }
          if (QLog.isColorLevel())
          {
            QLog.d("RMVideoInitState", 2, "[@] EVENT_CREATE_CAMERA, error = " + paramVarArgs[0]);
            continue;
            if ((paramVarArgs != null) && ((paramVarArgs[0] instanceof String)))
            {
              if (!d)
              {
                d = true;
                RMVideoStateMgr.a().a(2003, "抱歉，初始化摄像头参数失败", false);
              }
              if (QLog.isColorLevel())
              {
                QLog.d("RMVideoInitState", 2, "[@] EVENT_SET_CAMERA_PARAM error, error = " + paramVarArgs[0]);
                continue;
                if (!d)
                {
                  d = true;
                  RMVideoStateMgr.a().a(2002, "抱歉，摄像头被禁止了", false);
                }
                if (QLog.isColorLevel())
                {
                  QLog.d("RMVideoInitState", 2, "[@] EVENT_CAMERA_DISABLED error");
                  continue;
                  if ((paramObject instanceof AudioCapture))
                  {
                    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
                    switch (paramInt)
                    {
                    case 4: 
                    default: 
                      break;
                    case 3: 
                      if ((paramVarArgs != null) && ((paramVarArgs[0] instanceof Boolean)) && (((Boolean)paramVarArgs[0]).booleanValue()))
                      {
                        if (QLog.isColorLevel()) {
                          QLog.d("RMVideoInitState", 2, "[@] EVENT_INIT [OK]");
                        }
                      }
                      else
                      {
                        if (QLog.isColorLevel())
                        {
                          QLog.d("RMVideoInitState", 2, "[@] EVENT_INIT [error]麦克风初始化参数失败...");
                          QLog.d("RMVideoInitState", 2, "[@] EVENT_INIT [error]mAudioSampleRate=" + CodecParam.s + " mAudioChannel=" + CodecParam.n + " mAudioFormat=" + CodecParam.o);
                        }
                        jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture = null;
                        d = false;
                        localRMVideoStateMgr.c(false);
                        if (jdField_a_of_type_AndroidOsHandler != null) {
                          jdField_a_of_type_AndroidOsHandler.post(new mjp(this));
                        } else if (QLog.isColorLevel()) {
                          QLog.d("RMVideoInitState", 2, "[@] EVENT_INIT [Error]麦克风参数初始化失败 ,rmStateMgr.mHandler = null");
                        }
                      }
                      break;
                    case 5: 
                      if (QLog.isColorLevel()) {
                        QLog.d("RMVideoInitState", 2, "[@] EVENT_OPEN_MIC [error]麦克风打开失败...");
                      }
                      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture = null;
                      d = false;
                      if (RMVideoStateMgr.b)
                      {
                        localRMVideoStateMgr.c(true);
                        e();
                      }
                      while (!f)
                      {
                        RMVideoStateMgr.a().b(0, "麦克风被禁用", false);
                        f = true;
                        break;
                        localRMVideoStateMgr.c(false);
                      }
                    case 6: 
                      if ((paramVarArgs != null) && ((paramVarArgs[0] instanceof Boolean)) && (((Boolean)paramVarArgs[0]).booleanValue()))
                      {
                        if (QLog.isColorLevel()) {
                          QLog.d("RMVideoInitState", 2, "[@] EVENT_START_MIC [OK]");
                        }
                        localRMVideoStateMgr.c(true);
                        e();
                        d = true;
                      }
                      else
                      {
                        if (QLog.isColorLevel()) {
                          QLog.d("RMVideoInitState", 2, "[@] EVENT_START_MIC [error]麦克风启动录制失败...");
                        }
                        jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture = null;
                        d = false;
                        if (RMVideoStateMgr.b)
                        {
                          localRMVideoStateMgr.c(true);
                          e();
                        }
                        for (;;)
                        {
                          if (f) {
                            break label719;
                          }
                          RMVideoStateMgr.a().b(0, "麦克风被禁用", false);
                          f = true;
                          break;
                          localRMVideoStateMgr.c(false);
                        }
                      }
                      break;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
  public void a(boolean paramBoolean)
  {
    e = paramBoolean;
  }
  
  public boolean a()
  {
    RMVideoStateMgr.a().a("RMVideoInitState");
    return false;
  }
  
  public void b()
  {
    if (b()) {
      RMVideoStateMgr.a().a(3);
    }
  }
  
  boolean b()
  {
    return (ac) && (jdField_a_of_type_Boolean) && (b);
  }
  
  void c()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoInitState", 2, "[@] retake called");
    }
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.a();
    }
    for (;;)
    {
      try
      {
        localRMVideoStateMgr.j();
        if (!e) {
          continue;
        }
        if (QLog.isColorLevel()) {
          QLog.d("RMVideoInitState", 2, "[@] retake call AVCodec.get().retake()");
        }
        AVCodec.get().retake();
      }
      catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
      {
        localUnsatisfiedLinkError.printStackTrace();
        continue;
      }
      if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null) {
        jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.g();
      }
      RecordManager.a().a().a(0);
      return;
      if (QLog.isColorLevel()) {
        QLog.d("RMVideoInitState", 2, "[@] retake call AVCodec.get().init()");
      }
      AVCodec.get().init();
      e = true;
    }
  }
  
  void d()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoInitState", 2, "[@] delayInit called");
    }
    jdField_a_of_type_AndroidOsHandler.postDelayed(new mjl(this), 50L);
  }
  
  void e()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (b())
    {
      jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      jdField_a_of_type_AndroidOsHandler.post(new mjn(this));
    }
  }
  
  public void f()
  {
    RMVideoStateMgr.a().m();
    c = false;
  }
  
  public void g()
  {
    RMVideoStateMgr.a().m();
    c = false;
    jdField_a_of_type_Boolean = false;
    b = false;
  }
}
