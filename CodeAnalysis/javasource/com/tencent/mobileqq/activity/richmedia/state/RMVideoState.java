package com.tencent.mobileqq.activity.richmedia.state;

import com.tencent.maxvideo.common.MessageStruct;
import com.tencent.maxvideo.mediadevice.AVCodec.AVCodecCallback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.common.TCTimer.TCTimerCallback;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraControl.CustomSize;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraProxy.CameraPreviewObservable;
import com.tencent.qphone.base.util.QLog;

public abstract class RMVideoState
{
  public RMVideoState()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public abstract void a();
  
  public void a(AVCodec.AVCodecCallback paramAVCodecCallback, MessageStruct paramMessageStruct) {}
  
  public void a(TCTimer.TCTimerCallback paramTCTimerCallback, boolean paramBoolean, int paramInt1, int paramInt2) {}
  
  public void a(Object paramObject, int paramInt, Object... paramVarArgs)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoState", 2, "[@] notify called eventId=" + paramInt);
    }
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if ((paramObject instanceof AudioCapture)) {
      switch (paramInt)
      {
      }
    }
    for (;;)
    {
      return;
      localRMVideoStateMgr.h();
      return;
      if ((!(paramObject instanceof CameraProxy.CameraPreviewObservable)) || (localRMVideoStateMgr == null)) {
        continue;
      }
      switch (paramInt)
      {
      default: 
        
      case 2: 
        if ((paramVarArgs == null) || (a == null) || (!(paramVarArgs[0] instanceof CameraControl.CustomSize))) {
          continue;
        }
        paramObject = (CameraControl.CustomSize)paramVarArgs[0];
      case 10: 
        try
        {
          a.a(a, b);
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("RMVideoState", 2, "[@] EVENT_SET_CAMERA_PARAM[success]");
          return;
          if (a == null) {
            continue;
          }
          a.n();
          return;
        }
        catch (NullPointerException paramObject)
        {
          for (;;)
          {
            paramObject.printStackTrace();
          }
        }
      }
    }
  }
  
  public void a(boolean paramBoolean) {}
  
  public boolean a()
  {
    return false;
  }
  
  public abstract void b();
  
  public void f() {}
  
  public void g() {}
}
