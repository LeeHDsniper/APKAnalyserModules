package com.tencent.mobileqq.activity.richmedia.state;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.DisplayMetrics;
import android.widget.Toast;
import com.tencent.common.app.AppInterface;
import com.tencent.maxvideo.common.MessageStruct;
import com.tencent.maxvideo.mediadevice.AVCodec;
import com.tencent.maxvideo.mediadevice.AVCodec.AVCodecCallback;
import com.tencent.mobileqq.activity.richmedia.FlowCameraConstant;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.VideoEnvironment;
import com.tencent.mobileqq.shortvideo.common.GloableValue;
import com.tencent.mobileqq.shortvideo.common.TCTimer;
import com.tencent.mobileqq.shortvideo.common.TCTimer.TCTimerCallback;
import com.tencent.mobileqq.shortvideo.error.ErrorCenter;
import com.tencent.mobileqq.shortvideo.error.ErrorCenter.ErrorHandleCallback;
import com.tencent.mobileqq.shortvideo.hwcodec.HwEnvData;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture.OnAudioRecordListener;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraCompatibleList;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraProxy;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraProxy.CameraPreviewObservable;
import com.tencent.mobileqq.shortvideo.mediadevice.CodecParam;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext;
import com.tencent.mobileqq.shortvideo.mediadevice.RecordManager;
import com.tencent.mobileqq.shortvideo.util.storage.StorageManager;
import com.tencent.mobileqq.shortvideo.util.storage.StorageManager.OnSdCardChangedListener;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.qphone.base.util.QLog;
import com.tencent.video.decode.ShortVideoSoLoad;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import mjh;
import mjj;
import mjk;
import mjq;

public class RMVideoStateMgr
  implements AVCodec.AVCodecCallback, TCTimer.TCTimerCallback, ErrorCenter.ErrorHandleCallback, AudioCapture.OnAudioRecordListener, StorageManager.OnSdCardChangedListener
{
  private static RMVideoStateMgr jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr;
  public static boolean a = false;
  private static final int[] jdField_a_of_type_ArrayOfInt = { 850, 780, 650, 480 };
  public static final int b = 1;
  private static final String jdField_b_of_type_JavaLangString = "RMVideoStateMgr";
  public static boolean b = false;
  public static final int c = 2;
  public static final int e = 1;
  public static final int f = 2;
  public static final int g = 3;
  public static final int h = 4;
  public static final int i = 1;
  public static final int j = 2;
  public static final int k = 3;
  public static final int l = 4;
  public static final int m = 5;
  public static final int n = 6;
  public static final int o = 4;
  public double a;
  public int a;
  public Context a;
  public Handler a;
  public RMVideoClipSpec a;
  final RMVideoPreviewState jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoPreviewState = new RMVideoPreviewState();
  public RMVideoStateMgr.ForceReleaseLockOnPause a;
  public final RMVideoSwitchCameraPicMgr a;
  public final RMVideoThumbGenMgr a;
  public RMViewSTInterface a;
  public AudioCapture.OnAudioRecordListener a;
  public AudioCapture a;
  public CameraProxy a;
  public PreviewContext a;
  private Object jdField_a_of_type_JavaLangObject = new Object();
  public String a;
  public AtomicBoolean a;
  public AtomicInteger a;
  public mjh a;
  final mjj jdField_a_of_type_Mjj = new mjj();
  final mjk jdField_a_of_type_Mjk = new mjk();
  final mjq jdField_a_of_type_Mjq = new mjq();
  public AtomicInteger b;
  private int[] jdField_b_of_type_ArrayOfInt = new int[8];
  public boolean c = false;
  public int d;
  public boolean d;
  public boolean e = true;
  public boolean f = false;
  private boolean g = false;
  private boolean h = false;
  private volatile boolean i = false;
  private int y = 1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = true;
  }
  
  private RMVideoStateMgr()
  {
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(0);
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr = new RMVideoThumbGenMgr();
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr = new RMVideoSwitchCameraPicMgr();
    jdField_a_of_type_Mjh = null;
    jdField_d_of_type_Boolean = false;
    jdField_a_of_type_Int = 0;
    jdField_d_of_type_Int = 480;
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause = new RMVideoStateMgr.ForceReleaseLockOnPause();
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(1);
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
    jdField_a_of_type_AndroidOsHandler = new Handler();
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec = new RMVideoClipSpec();
  }
  
  private int a(int[] paramArrayOfInt)
  {
    int i2 = GloableValue.h.length;
    int i1 = 0;
    while (i1 < i2)
    {
      if (paramArrayOfInt[1] == GloableValue.h[i1])
      {
        paramArrayOfInt[0] = GloableValue.g[i1];
        return i1;
      }
      i1 += 1;
    }
    return -1;
  }
  
  public static RMVideoStateMgr a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr == null) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr = new RMVideoStateMgr();
    }
    return jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr;
  }
  
  private void a(int paramInt1, int paramInt2)
  {
    int i2 = GloableValue.jdField_c_of_type_ArrayOfInt.length / 2;
    int i1 = 0;
    if (i1 < i2)
    {
      int i3 = a(GloableValue.jdField_c_of_type_ArrayOfInt[(i1 * 2 + 1)]);
      if ((GloableValue.jdField_c_of_type_ArrayOfInt[(i1 * 2)] != paramInt1) || (i3 != paramInt2)) {}
    }
    for (;;)
    {
      if ((i1 >= 0) && (jdField_a_of_type_ArrayOfInt[i1] != jdField_d_of_type_Int)) {
        jdField_d_of_type_Int = jdField_a_of_type_ArrayOfInt[i1];
      }
      return;
      i1 += 1;
      break;
      i1 = -1;
    }
  }
  
  private boolean a(Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    boolean bool3 = false;
    boolean bool1 = false;
    if (QLog.isColorLevel()) {
      QLog.e("RMVideoStateMgr", 2, "initTMMEngine[begin]");
    }
    for (;;)
    {
      long l1;
      boolean bool2;
      try
      {
        l1 = Long.valueOf(paramString).longValue();
        if (l1 == -1L)
        {
          bool2 = bool1;
          if (QLog.isColorLevel())
          {
            QLog.e("RMVideoStateMgr", 2, "initTMMEngine mLongUnin is invalid. mLongUnin=" + l1);
            bool2 = bool1;
          }
          return bool2;
        }
      }
      catch (NumberFormatException paramString)
      {
        l1 = -1L;
        continue;
      }
      try
      {
        bool1 = GloableValue.a(l1, paramContext, paramInt1, paramInt2);
        bool2 = false;
        if (bool2)
        {
          if (QLog.isColorLevel()) {
            QLog.e("RMVideoStateMgr", 2, "crashed=" + bool2 + " soLoadStatus=" + ShortVideoSoLoad.VIDEO_SO_LOAD_STATUS);
          }
          ShortVideoSoLoad.VIDEO_SO_LOAD_STATUS = -4;
          VideoEnvironment.a("AVCodec", paramContext, true);
        }
      }
      catch (UnsatisfiedLinkError paramString)
      {
        for (;;)
        {
          try
          {
            bool1 = GloableValue.a(l1, paramContext, paramInt1, paramInt2);
            bool2 = bool1;
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.e("RMVideoStateMgr", 2, "initTMMEngine[end]");
            return bool1;
            paramString = paramString;
            paramString.printStackTrace();
            GloableValue.a = -1L;
            bool2 = true;
            bool1 = false;
          }
          catch (UnsatisfiedLinkError paramContext)
          {
            paramContext.printStackTrace();
            bool1 = bool3;
            if (QLog.isColorLevel())
            {
              QLog.e("RMVideoStateMgr", 2, "[SecondCrash]crashed=" + bool2 + " soLoadStatus=" + ShortVideoSoLoad.VIDEO_SO_LOAD_STATUS);
              bool1 = bool3;
            }
          }
        }
      }
    }
  }
  
  private void c(int paramInt)
  {
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.getAndSet(paramInt);
  }
  
  private void d(int paramInt)
  {
    if ((paramInt != -1) && (paramInt < GloableValue.h.length))
    {
      paramInt *= 4;
      CodecParam.i = GloableValue.jdField_c_of_type_ArrayOfInt[paramInt];
      CodecParam.j = GloableValue.jdField_c_of_type_ArrayOfInt[(paramInt + 1)];
      CodecParam.k = GloableValue.jdField_c_of_type_ArrayOfInt[(paramInt + 2)];
      CodecParam.l = GloableValue.jdField_c_of_type_ArrayOfInt[(paramInt + 3)];
      return;
    }
    CodecParam.i = GloableValue.f;
    CodecParam.j = GloableValue.f * 3 / 4;
    CodecParam.k = CodecParam.i * CodecParam.g / CodecParam.h;
    CodecParam.l = CodecParam.j * CodecParam.g / CodecParam.h;
  }
  
  private native void setBeautyLevelNative(int paramInt);
  
  private native void setResolutionAlignedByteNative(int paramInt);
  
  private native void setVideoClipSpec(int[] paramArrayOfInt);
  
  public float a()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.f <= 0) || (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.e <= 0)) {
      return 1.3333334F;
    }
    return jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.e * 1.0F / jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.f;
  }
  
  int a(int paramInt)
  {
    int i1 = paramInt;
    if (HwEnvData.a())
    {
      int i2 = paramInt % 16;
      i1 = paramInt;
      if (i2 > 0) {
        i1 = paramInt + (16 - i2);
      }
    }
    return i1;
  }
  
  public int a(TCTimer.TCTimerCallback paramTCTimerCallback, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    int i1 = -1;
    if (paramTCTimerCallback == this)
    {
      a().a(paramTCTimerCallback, paramBoolean, paramInt1, paramInt2);
      i1 = 0;
    }
    return i1;
  }
  
  public RMVideoState a()
  {
    int i1 = jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.get();
    mjk localMjk = jdField_a_of_type_Mjk;
    switch (i1)
    {
    default: 
      return localMjk;
    case 2: 
      return jdField_a_of_type_Mjj;
    case 3: 
      return jdField_a_of_type_Mjq;
    }
    return jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoPreviewState;
  }
  
  public void a()
  {
    GloableValue.a();
    StorageManager.a().a(this);
    a().a();
    if ((jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null) && (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy != null) && (!jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy.jdField_a_of_type_Boolean)) {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_b_of_type_Boolean = true;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_a_of_type_Boolean = false;
  }
  
  public void a(int paramInt)
  {
    c(paramInt);
    a().a();
  }
  
  public void a(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    j();
    int i1 = 0;
    while (i1 < paramInt2)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.h();
      if (paramBoolean) {
        AVCodec.get().removeLastCapture();
      }
      i1 += 1;
    }
    jdField_a_of_type_Double = paramInt1;
    RecordManager.a().a().b(paramInt1);
    if (jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.getAndAdd(0) < 3) {
      i();
    }
  }
  
  public void a(int paramInt1, RMVideoClipSpec paramRMVideoClipSpec, int paramInt2)
  {
    switch (paramInt1)
    {
    case 3: 
    default: 
      return;
    case 1: 
    case 2: 
      jdField_a_of_type_Int = paramInt2;
      b = 0;
      return;
    }
    jdField_a_of_type_Int = (e - jdField_d_of_type_Int - paramInt2);
    b = 0;
  }
  
  public void a(int paramInt, String paramString)
  {
    try
    {
      GloableValue.c();
      a().f();
      if (paramInt == 0) {
        a(0, "SD卡被移除，短视频将退出", false);
      }
      return;
    }
    catch (UnsatisfiedLinkError paramString)
    {
      for (;;) {}
    }
  }
  
  public void a(int paramInt, String paramString, boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.a(paramInt, paramString, paramBoolean);
    }
  }
  
  public void a(AppInterface paramAppInterface, boolean paramBoolean1, String paramString, boolean paramBoolean2, int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramBoolean1)
    {
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "initVideoParams(): ptvMaxTime=" + paramInt3);
      }
      CodecParam.jdField_c_of_type_Int = paramInt3 * 1000;
      VideoEnvironment.b();
      if (CameraCompatibleList.a(CameraCompatibleList.l))
      {
        GloableValue.e = 640;
        GloableValue.f = 480;
        if (QLog.isColorLevel()) {
          QLog.e("RMVideoStateMgr", 2, "isFoundProductFeature:true[640*480]");
        }
      }
      for (;;)
      {
        y = 1;
        AudioCapture.jdField_d_of_type_Int = 4000;
        return;
        GloableValue.e = 320;
        GloableValue.f = 240;
      }
    }
    AudioCapture.jdField_d_of_type_Int = 4000;
    AudioCapture.e = 1;
    try
    {
      VideoEnvironment.a(paramAppInterface, paramString, paramBoolean2);
      VideoEnvironment.a();
      paramAppInterface = VideoEnvironment.a(paramInt1);
      if (a(paramAppInterface))
      {
        i2 = a(paramAppInterface);
        GloableValue.e = paramAppInterface[0];
        GloableValue.f = paramAppInterface[1];
        i1 = paramAppInterface[2];
        paramInt3 = paramAppInterface[3];
        d(i2);
        paramAppInterface = VideoEnvironment.b(paramInt1);
        if (paramInt2 != 1) {
          break label271;
        }
        paramInt1 = paramAppInterface[0];
        if (paramInt1 != 0) {
          break label299;
        }
        if (i1 > 0)
        {
          VideoEnvironment.b(i1);
          VideoEnvironment.a(i1);
          jdField_d_of_type_Int = i1;
        }
        y = 2;
      }
    }
    catch (Throwable paramAppInterface)
    {
      for (;;)
      {
        paramAppInterface.printStackTrace();
        continue;
        GloableValue.e = GloableValue.g[1];
        GloableValue.f = GloableValue.h[1];
        int i1 = 450;
        paramInt3 = 750;
        int i2 = 1;
        continue;
        label271:
        if ((paramInt2 == 4) || (paramInt2 == 3))
        {
          paramInt1 = paramAppInterface[1];
        }
        else
        {
          paramInt1 = paramAppInterface[2];
          continue;
          label299:
          i1 = paramInt3;
        }
      }
    }
  }
  
  public void a(RMVideoClipSpec paramRMVideoClipSpec)
  {
    for (int i1 = 1;; i1 = 0)
    {
      try
      {
        jdField_b_of_type_ArrayOfInt[0] = jdField_a_of_type_Int;
        jdField_b_of_type_ArrayOfInt[1] = b;
        jdField_b_of_type_ArrayOfInt[2] = jdField_c_of_type_Int;
        jdField_b_of_type_ArrayOfInt[3] = jdField_d_of_type_Int;
        jdField_b_of_type_ArrayOfInt[4] = e;
        jdField_b_of_type_ArrayOfInt[5] = f;
        paramRMVideoClipSpec = jdField_b_of_type_ArrayOfInt;
        if (FlowCameraConstant.jdField_d_of_type_Int != 1) {
          continue;
        }
        paramRMVideoClipSpec[6] = i1;
        setVideoClipSpec(jdField_b_of_type_ArrayOfInt);
      }
      catch (UnsatisfiedLinkError paramRMVideoClipSpec)
      {
        for (;;)
        {
          paramRMVideoClipSpec.printStackTrace();
        }
      }
      a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.e, jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.f);
      return;
    }
  }
  
  public void a(CameraProxy paramCameraProxy)
  {
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy = paramCameraProxy;
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy != null) {
      paramCameraProxy.a(this);
    }
  }
  
  public void a(PreviewContext paramPreviewContext)
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy.jdField_a_of_type_Int = y;
    }
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext = paramPreviewContext;
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_b_of_type_Boolean = true;
  }
  
  public void a(Object paramObject, int paramInt, Object... paramVarArgs)
  {
    switch (paramInt)
    {
    default: 
      a().a(paramObject, paramInt, paramVarArgs);
    }
    do
    {
      return;
    } while ((!CameraProxy.CameraPreviewObservable.class.isInstance(paramObject)) || (jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext == null));
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_b_of_type_Boolean = true;
  }
  
  public void a(Runnable paramRunnable)
  {
    jdField_a_of_type_AndroidOsHandler.post(paramRunnable);
  }
  
  public void a(String paramString)
  {
    j();
    if (QLog.isColorLevel()) {
      QLog.d("" + paramString, 2, "[@][deleteCacheFile] [RMFileEventNotify]stopWatching");
    }
    if (jdField_a_of_type_JavaLangString != null) {
      FileUtils.a(jdField_a_of_type_JavaLangString, false);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    h = paramBoolean;
  }
  
  public boolean a()
  {
    return h;
  }
  
  public boolean a(int paramInt)
  {
    boolean bool = false;
    if (paramInt == 4) {
      bool = a().a();
    }
    return bool;
  }
  
  public boolean a(Context paramContext, String paramString, RMViewSTInterface paramRMViewSTInterface)
  {
    c(1);
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    GloableValue.jdField_c_of_type_Int = widthPixels;
    GloableValue.jdField_d_of_type_Int = heightPixels;
    g = false;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_Double = 0.0D;
    f = false;
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext = null;
    c = false;
    jdField_d_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture = null;
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface = paramRMViewSTInterface;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
    if (!a(paramContext, paramString, GloableValue.jdField_c_of_type_ArrayOfInt[4], GloableValue.jdField_c_of_type_ArrayOfInt[5]))
    {
      if (QLog.isColorLevel()) {
        QLog.e("RMVideoStateMgr", 2, "initTMMEngine[failed]");
      }
      return false;
    }
    b(2);
    try
    {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a = ((RMVideoSwitchCameraPicMgr.ViewBitmapSource)paramContext);
      RecordManager.a().a().addCodecCallback(this);
      RecordManager.a().a().a(this);
      StorageManager.a();
      if ((jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.getAndIncrement() > 0) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface != null))
      {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.k();
        RecordManager.a().a().b();
        RecordManager.a().a();
      }
      RecordManager.a().a().a(this);
      RecordManager.a().a().a();
      return true;
    }
    catch (ClassCastException paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
  }
  
  public boolean a(int[] paramArrayOfInt)
  {
    return (paramArrayOfInt != null) && (paramArrayOfInt.length == 4) && (paramArrayOfInt[0] > 0) && (paramArrayOfInt[1] > 0);
  }
  
  public void b()
  {
    GloableValue.b();
    a().f();
    StorageManager.a().a(null);
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_a_of_type_Boolean = true;
  }
  
  public void b(int paramInt)
  {
    try
    {
      setBeautyLevelNative(paramInt);
      return;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError) {}
  }
  
  public void b(int paramInt1, RMVideoClipSpec paramRMVideoClipSpec, int paramInt2)
  {
    switch (paramInt1)
    {
    case 3: 
    default: 
      return;
    case 1: 
      jdField_a_of_type_Int = paramInt2;
      b = (f - jdField_c_of_type_Int);
      return;
    case 2: 
      jdField_a_of_type_Int = paramInt2;
      b = 0;
      return;
    case 4: 
      jdField_a_of_type_Int = (e - jdField_d_of_type_Int - paramInt2);
      b = (f - jdField_c_of_type_Int);
      return;
    }
    jdField_a_of_type_Int = (e - jdField_d_of_type_Int - paramInt2);
    b = 0;
  }
  
  public void b(int paramInt, String paramString, boolean paramBoolean)
  {
    Toast.makeText(VideoEnvironment.a(), "" + paramString, 0).show();
  }
  
  public void b(boolean paramBoolean)
  {
    c(1);
    a().a(paramBoolean);
    a().a();
    if ((jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_b_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_a_of_type_Boolean)) {
      a().f();
    }
  }
  
  public boolean b()
  {
    int i1 = jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.get();
    if (i1 == 3) {
      a().b();
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.e("RMVideoStateMgr", 2, "[exitRecordMode]currentState = " + i1 + " mCurrentSegInvalid=" + h);
      }
      return h;
      if (i1 == 2)
      {
        if (QLog.isColorLevel()) {
          QLog.e("RMVideoStateMgr", 2, "current = G_STATUS_IDLE ,so do not change state...");
        }
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_b_of_type_Boolean = true;
      }
    }
  }
  
  public boolean b(int paramInt)
  {
    try
    {
      setResolutionAlignedByteNative(paramInt);
      return true;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError) {}
    return false;
  }
  
  public void c()
  {
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.decrementAndGet() == 0)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext = null;
      jdField_a_of_type_AndroidContentContext = null;
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.k();
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface = null;
      jdField_a_of_type_Mjk.f();
      jdField_a_of_type_Mjk.g();
      jdField_a_of_type_Mjj.f();
      jdField_a_of_type_Mjj.g();
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture = null;
      j();
      jdField_a_of_type_Mjh = null;
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a = null;
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture$OnAudioRecordListener = null;
      f();
    }
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy = null;
  }
  
  public void c(boolean paramBoolean)
  {
    c = paramBoolean;
  }
  
  public boolean c()
  {
    long l1 = StorageManager.a(ad);
    if (l1 <= StorageManager.c)
    {
      if (QLog.isColorLevel()) {
        QLog.d("RMVideoStateMgr", 2, "[@] checkDiskSpaceIsOK,freeSpace <= FREESPACE_LIMIT_EXIT freeSpace=" + l1);
      }
      a(0, "手机剩余存储空间不足,清理外部存储空间后再试", false);
      return false;
    }
    return true;
  }
  
  public void d()
  {
    jdField_a_of_type_Double = 0.0D;
    RecordManager.a().a().c();
    if (aaa.getState() == Thread.State.TERMINATED)
    {
      RecordManager.a().a();
      RecordManager.a().a().a(this);
      RecordManager.a().a().a();
    }
  }
  
  public boolean d()
  {
    if (!i) {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        boolean bool = i;
        if (!bool) {}
        try
        {
          jdField_a_of_type_JavaLangObject.wait(300L);
        }
        catch (InterruptedException localInterruptedException)
        {
          for (;;)
          {
            localInterruptedException.printStackTrace();
          }
        }
      }
    }
    return true;
  }
  
  public void e()
  {
    g();
    h = false;
    if (QLog.isColorLevel()) {
      QLog.e("RMVideoStateMgr", 2, "[enterRecordMode]currentState = " + jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.get() + " mCurrentSegInvalid=" + h);
    }
    a().b();
  }
  
  public boolean e()
  {
    return (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) && (c);
  }
  
  public void f()
  {
    if (g) {
      return;
    }
    RecordManager.a().a().b();
    RecordManager.a().a().a(null);
    RecordManager.a().a().removeCodecCallback(this);
    RecordManager.a().a().recycle();
    RecordManager.a().a().a();
    RecordManager.a().a();
    try
    {
      GloableValue.c();
      StorageManager.a().a();
      g = true;
      return;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
    {
      for (;;)
      {
        localUnsatisfiedLinkError.printStackTrace();
      }
    }
  }
  
  public void g()
  {
    i = false;
  }
  
  public void h()
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      i = true;
      jdField_a_of_type_JavaLangObject.notifyAll();
      return;
    }
  }
  
  public void i()
  {
    if ((jdField_a_of_type_Mjh != null) && (jdField_a_of_type_Double > 0.0D)) {
      jdField_a_of_type_Mjh.startWatching();
    }
  }
  
  public void j()
  {
    if (jdField_a_of_type_Mjh != null) {
      jdField_a_of_type_Mjh.stopWatching();
    }
  }
  
  public void k()
  {
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoStateMgr", 2, "[@][initAudioRecord]mIsAudioReady=" + c + " mAI=" + jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture);
    }
    if (!e())
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture = new AudioCapture(jdField_a_of_type_AndroidContentContext);
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.a(this);
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.a();
    }
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoStateMgr", 2, "[@][initAudioRecord]");
    }
  }
  
  public void l()
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.c();
    }
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.d();
    }
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoStateMgr", 2, "[@][openAudioRecord]");
    }
  }
  
  public void m()
  {
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoStateMgr", 2, "[@][closeAudioRecord]mIsAudioReady=" + c + " mAI=" + jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture);
    }
    if (e())
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.b(jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture$OnAudioRecordListener);
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.g();
      if (QLog.isColorLevel()) {
        QLog.d("RMVideoStateMgr", 2, "[@][closeAudioRecord]");
      }
    }
    c = false;
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture = null;
    jdField_d_of_type_Boolean = false;
  }
  
  public void onAVCodecEvent(AVCodec.AVCodecCallback arg1, MessageStruct paramMessageStruct)
  {
    a().a(???, paramMessageStruct);
    if (mId == 33554451)
    {
      if (QLog.isColorLevel()) {
        QLog.d("RMVideoStateMgr", 2, "[@] onAVCodecEvent, MSG_RECORD_SUBMIT_FINISH_CALLBACK");
      }
      synchronized (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean)
      {
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.notifyAll();
        if (QLog.isColorLevel()) {
          QLog.d("RMVideoStateMgr", 2, "[@] onAVCodecEvent, MSG_RECORD_SUBMIT_FINISH_CALLBACK ,notifyAll");
        }
        return;
      }
    }
  }
}
