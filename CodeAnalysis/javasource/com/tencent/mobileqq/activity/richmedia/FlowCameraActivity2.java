package com.tencent.mobileqq.activity.richmedia;

import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.app.ActivityManager;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ConfigurationInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.hardware.Camera;
import android.hardware.Camera.CameraInfo;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.MessageQueue;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.TextureView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewStub;
import android.widget.Button;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.app.AppInterface;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoClipSpec;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoState;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr.ForceReleaseLockOnPause;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoSwitchCameraPicMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoSwitchCameraPicMgr.ViewBitmapSource;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoThumbGenMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoThumbGenMgr.ThumbGenItem;
import com.tencent.mobileqq.activity.richmedia.state.RMViewSTInterface;
import com.tencent.mobileqq.activity.richmedia.view.CameraCover;
import com.tencent.mobileqq.activity.richmedia.view.CameraGLSurfaceView;
import com.tencent.mobileqq.activity.richmedia.view.CameraTextureView;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.CompoundProcessor;
import com.tencent.mobileqq.richmedia.RichmediaClient;
import com.tencent.mobileqq.richmedia.VideoCompoundController;
import com.tencent.mobileqq.richmedia.dc.DCShortVideo;
import com.tencent.mobileqq.shortvideo.VideoEnvironment;
import com.tencent.mobileqq.shortvideo.common.GloableValue;
import com.tencent.mobileqq.shortvideo.hwcodec.HwEnvData;
import com.tencent.mobileqq.shortvideo.hwcodec.SVHwAutoSegmentMgr;
import com.tencent.mobileqq.shortvideo.hwcodec.SVHwEncoder;
import com.tencent.mobileqq.shortvideo.hwcodec.SVHwOutputNotify;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraAbility;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraCompatibleList;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraControl;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraExceptionHandler;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraExceptionHandler.Callback;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraPreview;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraProxy;
import com.tencent.mobileqq.shortvideo.mediadevice.CodecParam;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext;
import com.tencent.mobileqq.shortvideo.mediadevice.SurfacePreviewContext;
import com.tencent.mobileqq.shortvideo.mediadevice.TexturePreviewContext;
import com.tencent.mobileqq.shortvideo.tools.QzoneBaseThread;
import com.tencent.mobileqq.shortvideo.tools.QzoneHandlerThreadFactory;
import com.tencent.mobileqq.shortvideo.util.ScreenUtil;
import com.tencent.mobileqq.shortvideo.util.VideoAnimation;
import com.tencent.mobileqq.shortvideo.widget.ImageViewVideoPlayer;
import com.tencent.mobileqq.shortvideo.widget.ImageViewVideoPlayer.IMPlayerEndListener;
import com.tencent.mobileqq.shortvideo.widget.SimpleProgressBar;
import com.tencent.mobileqq.shortvideo.widget.TCProgressBar;
import com.tencent.mobileqq.shortvideo.widget.TCProgressBar.DelEvent;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.LogTag;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.HorizontalItemIndicator;
import com.tencent.mobileqq.widget.TransCircleMaskView;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.video.decode.ShortVideoSoLoad;
import com.tencent.widget.ActionSheet;
import cooperation.qzone.report.QzoneOnlineTimeCollectRptService;
import cooperation.qzone.util.PerfTracer;
import java.io.File;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import mic;
import mid;
import mie;
import mif;
import mig;
import mih;
import mii;
import mij;
import mik;
import mil;
import mim;
import min;
import mio;
import mip;
import miq;
import mir;
import mit;
import miu;
import miv;
import miw;
import mix;
import miy;
import miz;
import mjb;
import mjc;
import mjd;

public class FlowCameraActivity2
  extends FlowActivity
  implements View.OnClickListener, View.OnLongClickListener, RMVideoSwitchCameraPicMgr.ViewBitmapSource, RMViewSTInterface, ImageViewVideoPlayer.IMPlayerEndListener, TCProgressBar.DelEvent
{
  public static final String a = "FlowCameraActivity";
  public static final int l = 300000;
  static final int m = 8;
  public static final int n = 2000;
  static final boolean n = false;
  public static final int o = 16698675;
  public double a;
  float jdField_a_of_type_Float = 0.0F;
  long jdField_a_of_type_Long;
  ProgressDialog jdField_a_of_type_AndroidAppProgressDialog;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = new miu(this);
  Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  Handler jdField_a_of_type_AndroidOsHandler = new Handler();
  GestureDetector jdField_a_of_type_AndroidViewGestureDetector;
  OrientationEventListener jdField_a_of_type_AndroidViewOrientationEventListener;
  public View.OnTouchListener a;
  public View a;
  Button jdField_a_of_type_AndroidWidgetButton;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  public TextView a;
  private FlowComponentInterface jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface = null;
  public FlowPlusPanel a;
  public RMVideoStateMgr a;
  public CameraCover a;
  public CameraGLSurfaceView a;
  SosoInterface.OnLocationListener jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener;
  private SVHwAutoSegmentMgr jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwAutoSegmentMgr = new SVHwAutoSegmentMgr();
  private volatile SVHwEncoder jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = null;
  CameraExceptionHandler.Callback jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraExceptionHandler$Callback = new min(this);
  CameraProxy jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy;
  private ImageViewVideoPlayer jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer;
  SimpleProgressBar jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar;
  public TCProgressBar a;
  public QQCustomDialog a;
  HorizontalItemIndicator jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator;
  TransCircleMaskView jdField_a_of_type_ComTencentMobileqqWidgetTransCircleMaskView;
  ActionSheet jdField_a_of_type_ComTencentWidgetActionSheet;
  Runnable jdField_a_of_type_JavaLangRunnable = new mic(this);
  public double b;
  float jdField_b_of_type_Float = 0.0F;
  public int b;
  View.OnTouchListener jdField_b_of_type_AndroidViewView$OnTouchListener = new mig(this);
  public View b;
  public Button b;
  ImageView jdField_b_of_type_AndroidWidgetImageView;
  public TextView b;
  Runnable jdField_b_of_type_JavaLangRunnable = new miw(this);
  public String b;
  public boolean b;
  float jdField_c_of_type_Float = 0.0F;
  int jdField_c_of_type_Int;
  public View c;
  public Button c;
  ImageView jdField_c_of_type_AndroidWidgetImageView;
  TextView jdField_c_of_type_AndroidWidgetTextView;
  Runnable jdField_c_of_type_JavaLangRunnable = new miq(this);
  public String c;
  public boolean c;
  public int d;
  View jdField_d_of_type_AndroidViewView;
  Button jdField_d_of_type_AndroidWidgetButton;
  boolean jdField_d_of_type_Boolean;
  public int e;
  public View e;
  public boolean e;
  int f;
  public View f;
  public boolean f;
  int jdField_g_of_type_Int = 0;
  public View g;
  boolean jdField_g_of_type_Boolean;
  int jdField_h_of_type_Int = 0;
  View jdField_h_of_type_AndroidViewView;
  public boolean h;
  int i;
  public View i;
  public boolean i;
  int jdField_j_of_type_Int = 0;
  public View j;
  boolean jdField_j_of_type_Boolean;
  public int k;
  View k;
  public boolean k;
  public boolean l;
  public boolean m = true;
  boolean o = false;
  private int jdField_p_of_type_Int = 0;
  private boolean jdField_p_of_type_Boolean = true;
  private int jdField_q_of_type_Int = 0;
  private boolean jdField_q_of_type_Boolean = false;
  private int jdField_r_of_type_Int = 1;
  private boolean jdField_r_of_type_Boolean = false;
  private int jdField_s_of_type_Int = 0;
  private boolean jdField_s_of_type_Boolean = false;
  private boolean t = false;
  private boolean u = false;
  private boolean v = false;
  private boolean w = false;
  private boolean x = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "LoadExtractedShortVideoSo :soLoadStatus=" + ShortVideoSoLoad.VIDEO_SO_LOAD_STATUS);
      }
      int i1 = VideoEnvironment.a("AVCodec", null, true);
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "LoadExtractedShortVideoSo :code=" + i1);
      }
      return;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
    }
  }
  
  public FlowCameraActivity2()
  {
    jdField_k_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr = RMVideoStateMgr.a();
    jdField_d_of_type_Int = -1;
    jdField_e_of_type_Int = -1;
    jdField_f_of_type_Int = 0;
    jdField_i_of_type_Int = 0;
    jdField_a_of_type_Double = 0.0D;
    jdField_b_of_type_Double = 0.0D;
    jdField_a_of_type_AndroidViewView$OnTouchListener = new mif(this);
  }
  
  private void C()
  {
    if (jdField_s_of_type_Int == 1) {
      return;
    }
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("tencent.av.v2q.StartVideoChat");
    localIntentFilter.addAction("tencent.av.v2q.StopVideoChat");
    try
    {
      registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
      jdField_s_of_type_Int = 1;
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private void D()
  {
    float f1 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a();
    if (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null)
    {
      RMVideoClipSpec localRMVideoClipSpec = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a(jdField_a_of_type_Double, jdField_b_of_type_Double, f1, jdField_e_of_type_Int);
    }
  }
  
  private void E()
  {
    int i2 = 1;
    int i1 = i2;
    if (jdField_a_of_type_Long > 0L) {
      if (System.currentTimeMillis() - jdField_a_of_type_Long >= 1000L)
      {
        i1 = i2;
        if (jdField_b_of_type_Boolean) {}
      }
      else
      {
        i1 = 0;
      }
    }
    RMVideoClipSpec localRMVideoClipSpec = null;
    if (jdField_f_of_type_Boolean) {
      localRMVideoClipSpec = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
    }
    if (i1 != 0) {
      jdField_a_of_type_AndroidGraphicsBitmap = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a(jdField_d_of_type_Int, jdField_e_of_type_Int, m, jdField_f_of_type_Boolean, localRMVideoClipSpec);
    }
    if (jdField_a_of_type_AndroidGraphicsBitmap != null) {
      jdField_b_of_type_AndroidWidgetImageView.setImageBitmap(jdField_a_of_type_AndroidGraphicsBitmap);
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetImageView.setAlpha(0.2F);
      return;
      jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130838245);
    }
  }
  
  private void F()
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "handleQQVideo(): onSendVideoClick mHwEncoder=" + jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder);
    }
    QzoneHandlerThreadFactory.a("Normal_HandlerThread", false).a(new mjc(this, jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder));
  }
  
  private void G()
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar != null)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setEnabled(true);
    }
    jdField_j_of_type_AndroidViewView.setEnabled(true);
    VideoAnimation.a(jdField_c_of_type_AndroidWidgetImageView, false, 250);
    if (jdField_i_of_type_AndroidViewView.isEnabled()) {
      jdField_i_of_type_AndroidViewView.setEnabled(false);
    }
    jdField_i_of_type_AndroidViewView.setBackgroundResource(2130840917);
    a(1002, 0, null);
    if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b();
    }
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a().b();
    jdField_i_of_type_AndroidViewView.setEnabled(true);
  }
  
  private void H()
  {
    int i2 = 1;
    int i3 = 2;
    Object localObject1 = (SessionInfo)super.getIntent().getParcelableExtra("PhotoConst.SEND_SESSION_INFO");
    Object localObject2;
    int i1;
    if ((localObject1 != null) && (HwEnvData.b()) && (jdField_s_of_type_Boolean) && (jdField_q_of_type_Int == 0) && (VideoEnvironment.b(2)))
    {
      localObject2 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = new SVHwEncoder();
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_JavaLangString, jdField_e_of_type_Int, jdField_f_of_type_Int);
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a(-1, jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_d_of_type_Int * 1000);
      if (CodecParam.n != 16) {
        break label296;
      }
      i1 = 1;
    }
    for (;;)
    {
      if (CodecParam.o == 2) {
        i2 = 2;
      }
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a(CodecParam.jdField_s_of_type_Int, i1, 64000, i2);
        if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext == null) {
          break label321;
        }
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.a.getAndSet(jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder);
        if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) {
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.a.getAndSet(jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder);
        }
        jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwAutoSegmentMgr.a.getAndSet(jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder);
        localObject2 = RichmediaClient.a().a();
        D();
        i1 = i3;
        if (jdField_f_of_type_Boolean) {
          i1 = 3;
        }
        localObject1 = ((VideoCompoundController)localObject2).a(jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder, (SessionInfo)localObject1, i1);
        jdField_b_of_type_JavaLangString = ((CompoundProcessor)localObject1).a();
        LogTag.a(jdField_b_of_type_JavaLangString, "start", "[peak]");
        jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a((SVHwOutputNotify)localObject1, null, jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_d_of_type_Boolean);
        return;
        label296:
        if (CodecParam.n != 12) {
          break label342;
        }
        i1 = 2;
        break;
        if (CodecParam.o != 3) {
          i2 = 2;
        }
      }
      label321:
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "[@] previewSizeAdjustUI: rmStateMgr.videoContext=null,do not hwencode...");
      }
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = null;
      return;
      label342:
      i1 = 1;
    }
  }
  
  private void a(int paramInt, float paramFloat)
  {
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a(paramInt, paramFloat, true, ScreenUtil.a(5.0F));
    int i1 = (int)(paramInt * paramFloat);
    ViewGroup.LayoutParams localLayoutParams = jdField_c_of_type_AndroidWidgetImageView.getLayoutParams();
    width = paramInt;
    height = i1;
    jdField_c_of_type_AndroidWidgetImageView.setLayoutParams(localLayoutParams);
  }
  
  private void b(Bundle paramBundle)
  {
    w = paramBundle.getBoolean("enable_local_video", false);
    x = paramBundle.getBoolean("enable_front", false);
    jdField_p_of_type_Int = paramBundle.getInt("set_sdcard_min_size", 0);
    jdField_q_of_type_Int = paramBundle.getInt("from_type", 0);
    jdField_r_of_type_Int = paramBundle.getInt("clip_strategy", 1);
    FlowCameraMqqAction.jdField_a_of_type_Int = jdField_q_of_type_Int;
    if ((jdField_p_of_type_Int >= 57671680L) && (jdField_p_of_type_Int <= 314572800L)) {
      com.tencent.mobileqq.shortvideo.util.storage.StorageManager.c = jdField_p_of_type_Int;
    }
    paramBundle = paramBundle.getString("set_user_callback");
    if (paramBundle == null) {}
    do
    {
      for (;;)
      {
        return;
        try
        {
          paramBundle = Class.forName(paramBundle).newInstance();
          if ((paramBundle instanceof FlowComponentInterface))
          {
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface = ((FlowComponentInterface)paramBundle);
            return;
          }
        }
        catch (Throwable paramBundle)
        {
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface = null;
        }
      }
    } while (!QLog.isColorLevel());
    QLog.d("FlowCameraActivity", 2, "initComponentParamData:exp =" + paramBundle);
  }
  
  private void c(Bundle paramBundle)
  {
    if (paramBundle == null) {
      return;
    }
    HwEnvData.jdField_c_of_type_Boolean = paramBundle.getBoolean("key_video_presend_enable", false);
    HwEnvData.jdField_b_of_type_Boolean = paramBundle.getBoolean("key_video_hard_encode_enable", false);
    float f1 = paramBundle.getFloat("key_video_presend_slice_duration", 1.5F);
    if (f1 > 0.0F) {
      HwEnvData.jdField_a_of_type_Int = (int)(f1 * 1000.0F);
    }
    if (HwEnvData.a())
    {
      jdField_s_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b(16);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b(4);
  }
  
  private boolean d()
  {
    if ((jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null) && (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a())) {
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = null;
    }
    int i1;
    int i2;
    do
    {
      return false;
      i1 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b();
      i2 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.c();
    } while ((i1 > 0) || (i2 > 0) || (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder == null) || (jdField_c_of_type_AndroidWidgetButton.isEnabled()));
    return true;
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
  
  int a(int paramInt1, int paramInt2, int[] paramArrayOfInt, boolean paramBoolean)
  {
    int i3 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.getMeasuredHeight();
    int i4 = (int)(paramInt2 * FlowCameraConstant.jdField_a_of_type_Float);
    int i1;
    int i2;
    if (i3 <= jdField_a_of_type_Float)
    {
      i1 = (int)(i3 * 0.83F);
      i2 = (i3 - i1) / 2;
      i3 = i1 * paramInt2 / i4;
      i1 = i1 * paramInt1 / i4;
      paramArrayOfInt[0] = paramInt2;
      paramArrayOfInt[1] = i4;
      paramInt1 = i3;
    }
    for (;;)
    {
      if (paramBoolean) {
        i1 = paramInt1;
      }
      paramArrayOfInt[2] = paramInt1;
      paramArrayOfInt[3] = i1;
      paramArrayOfInt[4] = paramInt2;
      paramArrayOfInt[5] = i4;
      return i2;
      i2 = (int)jdField_a_of_type_Float;
      i1 = (int)(jdField_a_of_type_Float * paramInt1 / paramInt2);
      paramArrayOfInt[0] = paramInt2;
      paramArrayOfInt[1] = ((int)(i3 * paramInt2 / jdField_a_of_type_Float));
      i3 = (i3 - i2) / 2;
      paramInt1 = i2;
      i2 = i3;
    }
  }
  
  public Bitmap a(int paramInt1, int paramInt2)
  {
    if (!m)
    {
      View localView = jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.getChildAt(0);
      if (TextureView.class.isInstance(localView)) {
        return ((TextureView)localView).getBitmap(paramInt1, paramInt2);
      }
    }
    return null;
  }
  
  protected FlowPanel a()
  {
    if (jdField_j_of_type_Boolean) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowPlusPanel = ((FlowPlusPanel)FlowPanelFactory.a(this, 0));
    }
    return jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowPlusPanel;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.c();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.a.getAndSet(null);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceAudioCapture.a.getAndSet(null);
    }
  }
  
  public void a(float paramFloat)
  {
    if (paramFloat > 0.0F)
    {
      if (!jdField_c_of_type_Boolean) {}
    }
    else {
      while ((!jdField_c_of_type_Boolean) || (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b() > 0) || (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.c() > 0)) {
        return;
      }
    }
    Object localObject = getResources();
    if (paramFloat > 0.0F)
    {
      ((Resources)localObject).getDimensionPixelSize(2131493525);
      i2 = b();
      if (jdField_p_of_type_Boolean) {
        ((Resources)localObject).getDimensionPixelSize(2131493529);
      }
      for (i1 = d();; i1 = c())
      {
        localObject = Integer.valueOf(-14342358);
        a(i2, i1, ((Integer)localObject).intValue());
        if (paramFloat <= 0.0F) {
          break;
        }
        jdField_c_of_type_Boolean = true;
        jdField_b_of_type_AndroidWidgetButton.setLongClickable(true);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.a();
        jdField_b_of_type_AndroidWidgetButton.setTextColor(Color.rgb(18, 183, 245));
        jdField_b_of_type_AndroidWidgetButton.setText(2131371893);
        jdField_b_of_type_AndroidWidgetButton.setBackgroundResource(2130840921);
        if (!jdField_f_of_type_Boolean)
        {
          jdField_b_of_type_AndroidWidgetButton.setTextSize(2, 21.0F);
          i1 = ScreenUtil.a(110.0F);
          localObject = jdField_b_of_type_AndroidWidgetButton.getLayoutParams();
          height = i1;
          width = i1;
          jdField_b_of_type_AndroidWidgetButton.setLayoutParams((ViewGroup.LayoutParams)localObject);
        }
        FlowCameraMqqAction.a("", "0X8005F5D");
        jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.setContentDescription("短视频模式，可调，用一个手指左右轻扫来调整");
        jdField_b_of_type_AndroidWidgetButton.setContentDescription("录制短视频，按钮，长按录制短视频");
        return;
        ((Resources)localObject).getDimensionPixelSize(2131493528);
      }
    }
    b();
    int i2 = ((Resources)localObject).getDimensionPixelSize(2131493525);
    if (jdField_p_of_type_Boolean) {
      d();
    }
    for (int i1 = ((Resources)localObject).getDimensionPixelSize(2131493529);; i1 = ((Resources)localObject).getDimensionPixelSize(2131493528))
    {
      localObject = Integer.valueOf(1275068416);
      break;
      c();
    }
    d(false);
    jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.b();
    jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.setContentDescription("相机模式，可调，用一个手指左右轻扫来调整");
    jdField_b_of_type_AndroidWidgetButton.setContentDescription("拍照");
  }
  
  public void a(int paramInt)
  {
    if ((jdField_c_of_type_Boolean) && (!jdField_f_of_type_Boolean))
    {
      int i1 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.c();
      if (i1 > 0)
      {
        int i2 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b();
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(i2, i1, true);
        jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.d();
        CompoundProcessor localCompoundProcessor = RichmediaClient.a().a().a(jdField_b_of_type_JavaLangString);
        if (localCompoundProcessor != null) {
          localCompoundProcessor.a(paramInt);
        }
      }
    }
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    int i1 = 0;
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "[@] previewSizeAdjustUI:width=" + paramInt1 + " height=" + paramInt2);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr == null)
    {
      if (QLog.isColorLevel()) {
        QLog.i("FlowCameraActivity", 2, "[previewSizeAdjustUI]rmStateMgr " + null);
      }
      return;
    }
    jdField_d_of_type_Int = paramInt1;
    jdField_e_of_type_Int = paramInt2;
    jdField_r_of_type_Boolean = true;
    Object localObject;
    if (!jdField_f_of_type_Boolean)
    {
      f(true);
      if ((jdField_r_of_type_Boolean) && (jdField_q_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder == null)) {
        H();
      }
      for (;;)
      {
        paramInt1 = i1;
        if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar != null) {
          paramInt1 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b();
        }
        if ((VersionUtils.c()) && (!jdField_c_of_type_AndroidWidgetButton.isEnabled()) && (paramInt1 <= 0)) {
          jdField_c_of_type_AndroidWidgetButton.setEnabled(true);
        }
        jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
        if (paramInt1 >= CodecParam.jdField_c_of_type_Int) {
          break;
        }
        jdField_a_of_type_AndroidOsHandler.postDelayed(jdField_a_of_type_JavaLangRunnable, 1000L);
        return;
        if (d())
        {
          localObject = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
          jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_JavaLangString, jdField_e_of_type_Int, jdField_f_of_type_Int);
          D();
          jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.a(-1, jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_d_of_type_Int * 1000);
          if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null)
          {
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.a.getAndSet(jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder);
          }
          else
          {
            if (QLog.isColorLevel()) {
              QLog.d("FlowCameraActivity", 2, "[@] previewSizeAdjustUI:[changeCamera] rmStateMgr.videoContext=null,do not hwencode...");
            }
            jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.b();
            jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = null;
          }
        }
      }
    }
    int[] arrayOfInt = new int[6];
    RMVideoClipSpec localRMVideoClipSpec = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
    label367:
    boolean bool;
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView != null)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView;
      if (localObject != jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView) {
        break label563;
      }
      bool = true;
      label379:
      int i2 = a(paramInt1, paramInt2, arrayOfInt, bool);
      int i3 = TransCircleMaskView.a(this);
      FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)a((View)localObject);
      width = arrayOfInt[2];
      height = arrayOfInt[3];
      topMargin = (i3 + i2);
      ((View)localObject).setLayoutParams(localLayoutParams);
      jdField_c_of_type_Int = arrayOfInt[0];
      jdField_d_of_type_Int = arrayOfInt[1];
      jdField_e_of_type_Int = paramInt1;
      jdField_f_of_type_Int = paramInt2;
      if (!m) {
        break label569;
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(2, localRMVideoClipSpec, 0);
    }
    for (;;)
    {
      jdField_e_of_type_Int = arrayOfInt[4];
      jdField_f_of_type_Int = arrayOfInt[5];
      a(localRMVideoClipSpec);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(localRMVideoClipSpec);
      if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView == null) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.setPreviewSize(jdField_d_of_type_Int, jdField_e_of_type_Int, localRMVideoClipSpec);
      break;
      localObject = a(2131296481);
      break label367;
      label563:
      bool = false;
      break label379;
      label569:
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(5, localRMVideoClipSpec, 0);
    }
  }
  
  void a(int paramInt1, int paramInt2, int paramInt3)
  {
    ViewGroup.LayoutParams localLayoutParams = jdField_c_of_type_AndroidViewView.getLayoutParams();
    height = paramInt1;
    jdField_c_of_type_AndroidViewView.setLayoutParams(localLayoutParams);
    if (jdField_p_of_type_Boolean)
    {
      localLayoutParams = jdField_a_of_type_AndroidViewView.getLayoutParams();
      height = paramInt2;
      jdField_a_of_type_AndroidViewView.setLayoutParams(localLayoutParams);
    }
    for (;;)
    {
      jdField_c_of_type_AndroidViewView.setBackgroundColor(paramInt3);
      jdField_b_of_type_AndroidViewView.setBackgroundColor(paramInt3);
      jdField_a_of_type_AndroidViewView.setBackgroundColor(paramInt3);
      return;
      localLayoutParams = jdField_b_of_type_AndroidViewView.getLayoutParams();
      height = paramInt2;
      jdField_b_of_type_AndroidViewView.setLayoutParams(localLayoutParams);
    }
  }
  
  void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, Integer paramInteger1, Integer paramInteger2)
  {
    ValueAnimator localValueAnimator = ValueAnimator.ofInt(new int[] { paramInt1, paramInt2 });
    localValueAnimator.addUpdateListener(new mij(this));
    localValueAnimator.addListener(new mik(this));
    localValueAnimator.start();
    localValueAnimator = ValueAnimator.ofInt(new int[] { paramInt3, paramInt4 });
    localValueAnimator.addUpdateListener(new mil(this));
    localValueAnimator.start();
    paramInteger1 = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[] { paramInteger1, paramInteger2 });
    paramInteger1.addUpdateListener(new mim(this));
    paramInteger1.start();
  }
  
  protected void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "onPreviewResult:requestCode=" + paramInt1 + "  resultCode=" + paramInt2);
    }
    if (paramInt1 == 1002)
    {
      jdField_a_of_type_Long = System.currentTimeMillis();
      u = false;
    }
    if (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.e();
    }
  }
  
  void a(int paramInt1, int paramInt2, boolean paramBoolean, int[] paramArrayOfInt)
  {
    int i3 = (int)(jdField_a_of_type_Float * FlowCameraConstant.jdField_a_of_type_Float);
    int i1;
    if (paramBoolean)
    {
      i1 = (int)jdField_a_of_type_Float;
      paramInt1 = (int)(paramInt1 * jdField_a_of_type_Float / paramInt2);
      paramArrayOfInt[0] = paramInt2;
      paramArrayOfInt[1] = ((int)(i3 * paramInt2 / jdField_a_of_type_Float));
    }
    for (paramInt2 = i1;; paramInt2 = i1)
    {
      paramArrayOfInt[1] = a(paramArrayOfInt[1]);
      paramArrayOfInt[2] = paramInt2;
      paramArrayOfInt[3] = paramInt1;
      return;
      i1 = (int)(paramInt2 * jdField_b_of_type_Float / paramInt1);
      int i2 = (int)jdField_b_of_type_Float;
      paramArrayOfInt[0] = ((int)(jdField_a_of_type_Float * paramInt2 / i1));
      paramArrayOfInt[1] = ((int)(i3 * paramInt1 / jdField_b_of_type_Float));
      paramInt1 = i2;
    }
  }
  
  public void a(int paramInt, String paramString, boolean paramBoolean)
  {
    runOnUiThread(new mir(this, paramString, paramInt));
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if (jdField_c_of_type_Boolean)
    {
      if (jdField_f_of_type_Boolean) {
        break label100;
      }
      RMVideoStateMgr localRMVideoStateMgr = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr;
      jdField_a_of_type_Int += 1;
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setProgress(paramInt, paramBoolean);
      if (paramBoolean) {
        h(true);
      }
    }
    else
    {
      return;
    }
    int i1 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.b();
    jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwAutoSegmentMgr.a(paramInt, i1);
    h(o);
    if (o)
    {
      o = false;
      return;
    }
    o = true;
    return;
    label100:
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setCurrentProgress(paramInt, paramBoolean);
  }
  
  void a(Context paramContext, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.e("FlowCameraActivity", 2, "showProgressDialog");
    }
    try
    {
      if (jdField_a_of_type_AndroidAppProgressDialog != null) {
        r();
      }
      for (;;)
      {
        jdField_c_of_type_AndroidWidgetTextView.setText(paramInt);
        if (jdField_a_of_type_AndroidAppProgressDialog.isShowing()) {
          break;
        }
        jdField_a_of_type_AndroidAppProgressDialog.show();
        return;
        jdField_a_of_type_AndroidAppProgressDialog = new ProgressDialog(paramContext, 2131558942);
        jdField_a_of_type_AndroidAppProgressDialog.setCancelable(true);
        jdField_a_of_type_AndroidAppProgressDialog.show();
        jdField_a_of_type_AndroidAppProgressDialog.setContentView(2130903444);
        jdField_c_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidAppProgressDialog.findViewById(2131298581));
      }
      return;
    }
    catch (Throwable paramContext)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FlowCameraActivity", 2, "showProgressDialog", paramContext);
      }
    }
  }
  
  public void a(Drawable paramDrawable, int paramInt)
  {
    if ((paramDrawable instanceof GradientDrawable)) {
      ((GradientDrawable)paramDrawable).setColor(paramInt);
    }
    while (!(paramDrawable instanceof ColorDrawable)) {
      return;
    }
    ((ColorDrawable)paramDrawable).setColor(paramInt);
  }
  
  protected void a(Bundle paramBundle)
  {
    int i1 = 0;
    super.a(paramBundle);
    jdField_f_of_type_Int = 0;
    jdField_g_of_type_Int = 0;
    jdField_h_of_type_Int = 0;
    jdField_i_of_type_Int = 0;
    jdField_j_of_type_Int = 0;
    jdField_a_of_type_Long = -1L;
    jdField_a_of_type_AndroidGraphicsBitmap = null;
    jdField_b_of_type_Boolean = false;
    jdField_g_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
    v = false;
    t = false;
    u = false;
    jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = null;
    jdField_q_of_type_Boolean = false;
    jdField_r_of_type_Boolean = false;
    FlowCameraConstant.jdField_d_of_type_Int = 2;
    FlowCameraConstant.jdField_a_of_type_Float = 0.75F;
    if (paramBundle == null) {}
    String str;
    boolean bool;
    do
    {
      return;
      b(paramBundle);
      c(paramBundle);
      jdField_d_of_type_Boolean = paramBundle.getBoolean("flow_camera_use_surfaceview", false);
      jdField_f_of_type_Boolean = paramBundle.getBoolean("flow_camera_ptv_mode", false);
      jdField_h_of_type_Boolean = paramBundle.getBoolean("flow_camera_capture_mode", false);
      jdField_i_of_type_Boolean = paramBundle.getBoolean("flow_camera_video_mode", false);
      if (jdField_f_of_type_Boolean)
      {
        jdField_j_of_type_Boolean = paramBundle.getBoolean("flow_camera_show_panel", true);
        FlowCameraConstant.jdField_d_of_type_Int = 1;
        if (!CameraAbility.c()) {
          FlowCameraConstant.jdField_d_of_type_Int = 2;
        }
        FlowCameraConstant.jdField_a_of_type_Float = 1.0F;
        jdField_c_of_type_Int = paramBundle.getInt("flow_key_ptv_max_time", 20);
      }
      str = paramBundle.getString("sv_config");
      bool = paramBundle.getBoolean("sv_whitelist");
      paramBundle = (SessionInfo)super.getIntent().getParcelableExtra("PhotoConst.SEND_SESSION_INFO");
      if (paramBundle != null) {
        i1 = jdField_a_of_type_Int;
      }
      int i2 = NetworkUtil.a(this);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a((AppInterface)getAppRuntime(), jdField_f_of_type_Boolean, str, bool, i1, i2, jdField_c_of_type_Int);
      if (!jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(this, FlowCameraMqqAction.a(this), this))
      {
        super.finish();
        return;
      }
      jdField_a_of_type_AndroidViewGestureDetector = new GestureDetector(this, new mjb(this, this));
      paramBundle = getResources().getDisplayMetrics();
      jdField_a_of_type_Float = widthPixels;
      jdField_b_of_type_Float = heightPixels;
      jdField_c_of_type_Float = (jdField_b_of_type_Float / jdField_a_of_type_Float);
      jdField_a_of_type_AndroidViewOrientationEventListener = new mit(this, this);
      if (jdField_a_of_type_AndroidViewOrientationEventListener.canDetectOrientation()) {
        jdField_a_of_type_AndroidViewOrientationEventListener.enable();
      }
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy = new CameraProxy(this, jdField_a_of_type_AndroidOsHandler);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy);
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy.a(new CameraExceptionHandler(jdField_a_of_type_AndroidOsHandler, jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraExceptionHandler$Callback));
    } while (!QLog.isColorLevel());
    QLog.d("FlowCameraActivity", 2, "initData(), mPtvMode:" + jdField_f_of_type_Boolean + ",mCaptureMode:" + jdField_h_of_type_Boolean + ", config=" + str + ", white=" + bool);
  }
  
  public void a(Message paramMessage)
  {
    switch (what)
    {
    }
    do
    {
      return;
    } while (!(obj instanceof MotionEvent));
    ((MotionEvent)obj).recycle();
  }
  
  protected void a(ViewGroup paramViewGroup)
  {
    getLayoutInflater().inflate(2130904111, paramViewGroup);
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover = ((CameraCover)a(2131297072));
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)a(2131296783));
    jdField_b_of_type_AndroidViewView = a(2131301362);
    jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator = ((HorizontalItemIndicator)a(2131301363));
    jdField_c_of_type_AndroidViewView = a(2131298823);
    jdField_a_of_type_AndroidViewView = a(2131300927);
    jdField_g_of_type_AndroidViewView = a(2131300920);
    jdField_h_of_type_AndroidViewView = a(2131296480);
    jdField_e_of_type_AndroidViewView = a(2131301354);
    jdField_f_of_type_AndroidViewView = a(2131301355);
    jdField_b_of_type_AndroidWidgetButton = ((Button)a(2131300928));
    jdField_c_of_type_AndroidWidgetButton = ((Button)a(2131301357));
    jdField_d_of_type_AndroidWidgetButton = ((Button)a(2131300925));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)a(2131301353));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)a(2131300924));
    jdField_i_of_type_AndroidViewView = a(2131301358);
    jdField_j_of_type_AndroidViewView = a(2131301360);
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)a(2131300923));
    jdField_a_of_type_AndroidWidgetButton = ((Button)a(2131301359));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer = ((ImageViewVideoPlayer)a(2131301366));
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.setIMPlayerEndListener(this);
    jdField_c_of_type_AndroidWidgetImageView = ((ImageView)a(2131301365));
    a((int)jdField_a_of_type_Float, 0.75F);
    jdField_d_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_j_of_type_AndroidViewView.setOnClickListener(this);
    jdField_i_of_type_AndroidViewView.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setEnabled(false);
    jdField_b_of_type_AndroidWidgetButton.setOnLongClickListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.a(new String[] { "照片", "短视频" });
    if (jdField_f_of_type_Boolean)
    {
      jdField_c_of_type_AndroidViewView.setVisibility(4);
      jdField_b_of_type_AndroidViewView.setVisibility(4);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar = ((SimpleProgressBar)a(2131301356));
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.setBackgroundColor(-16777216);
      jdField_b_of_type_AndroidWidgetButton.setText(2131371894);
      jdField_b_of_type_AndroidWidgetButton.setBackgroundResource(2130840910);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setText(2131371896);
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(-8355712);
      paramViewGroup = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.getLayoutParams();
      if (height != jdField_a_of_type_Int)
      {
        height = jdField_a_of_type_Int;
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.setLayoutParams(paramViewGroup);
      }
      if (!"mounted".equals(Environment.getExternalStorageState()))
      {
        paramViewGroup = (TextView)a(2131297080);
        paramViewGroup.setVisibility(0);
        paramViewGroup.setText(2131371891);
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.setBackgroundColor(-1);
        jdField_a_of_type_AndroidViewView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      }
      if (!CameraAbility.a())
      {
        a(2131297080).setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.setBackgroundColor(-1);
        jdField_a_of_type_AndroidViewView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        return;
      }
      jdField_a_of_type_ComTencentMobileqqWidgetTransCircleMaskView = new TransCircleMaskView(this);
      paramViewGroup = new FrameLayout.LayoutParams(-1, -1);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.addView(jdField_a_of_type_ComTencentMobileqqWidgetTransCircleMaskView, jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.getChildCount() - 2, paramViewGroup);
      jdField_b_of_type_AndroidWidgetButton.setContentDescription("按住说话");
      if (jdField_f_of_type_Boolean) {
        break label861;
      }
      jdField_b_of_type_AndroidWidgetImageView.setAlpha(64);
      label701:
      paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a(jdField_f_of_type_Boolean);
      if (paramViewGroup == null) {
        break label873;
      }
      jdField_b_of_type_AndroidWidgetImageView.setImageBitmap(paramViewGroup);
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      return;
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar = ((TCProgressBar)a(2131301364));
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setMax(CodecParam.jdField_f_of_type_Int, CodecParam.jdField_c_of_type_Int);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.setBackgroundResource(2130838245);
      if (!CameraAbility.c()) {
        jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
      }
      jdField_b_of_type_AndroidWidgetButton.setOnTouchListener(jdField_b_of_type_AndroidViewView$OnTouchListener);
      jdField_b_of_type_AndroidViewView.setBackgroundColor(1275068416);
      if (jdField_h_of_type_Boolean) {
        jdField_b_of_type_AndroidViewView.setVisibility(4);
      }
      if (jdField_i_of_type_Boolean) {
        jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.setVisibility(4);
      }
      jdField_a_of_type_AndroidViewView.setBackgroundColor(1275068416);
      jdField_b_of_type_AndroidWidgetButton.setLongClickable(false);
      break;
      label861:
      jdField_b_of_type_AndroidWidgetImageView.setAlpha(32);
      break label701;
      label873:
      jdField_b_of_type_AndroidWidgetImageView.setImageDrawable(new ColorDrawable(-16777216));
    }
  }
  
  void a(RMVideoClipSpec paramRMVideoClipSpec)
  {
    jdField_e_of_type_Int = 240;
    jdField_f_of_type_Int = 240;
  }
  
  public void a(File paramFile)
  {
    jdField_b_of_type_AndroidViewView.setVisibility(4);
    jdField_a_of_type_AndroidViewView.setVisibility(4);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_c_of_type_AndroidWidgetButton.setVisibility(4);
    if (a(2131300922) == null) {
      ((ViewStub)a(2131300921)).setVisibility(0);
    }
    if (jdField_d_of_type_AndroidViewView == null) {
      jdField_d_of_type_AndroidViewView = a(2131300922);
    }
    if (jdField_a_of_type_AndroidWidgetImageView == null) {
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)a(jdField_d_of_type_AndroidViewView, 2131301367));
    }
    Object localObject = URLDrawable.getDrawable(paramFile, URLDrawable.URLDrawableOptions.obtain());
    ((URLDrawable)localObject).downloadImediatly();
    jdField_a_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject);
    jdField_d_of_type_AndroidViewView.setVisibility(0);
    jdField_e_of_type_Boolean = true;
    localObject = (Button)a(jdField_d_of_type_AndroidViewView, 2131301368);
    Button localButton = (Button)a(jdField_d_of_type_AndroidViewView, 2131301369);
    ((Button)localObject).setOnClickListener(new mih(this, paramFile));
    localButton.setOnClickListener(new mii(this, paramFile, localButton));
  }
  
  public void a(boolean paramBoolean)
  {
    c();
    G();
    if (paramBoolean) {
      b(true);
    }
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "onTouchCaptureBtn: on=" + paramBoolean1 + ", up=" + paramBoolean2);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr == null) {}
    label134:
    do
    {
      return;
      if (paramBoolean2)
      {
        if (jdField_k_of_type_Boolean)
        {
          if (QLog.isColorLevel()) {
            QLog.d("FlowCameraActivity", 2, "onTouchCaptureBtn: 发送已录制的");
          }
          if ((jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr == null) || (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b())) {
            break label134;
          }
          d(jdField_k_of_type_Boolean);
        }
        for (;;)
        {
          jdField_k_of_type_Boolean = false;
          return;
          if (QLog.isColorLevel()) {
            QLog.d("FlowCameraActivity", 2, "onTouchCaptureBtn: 删除已录制的");
          }
          FlowCameraMqqAction.a("", "0X8005E93");
          break;
          if (QLog.isColorLevel()) {
            QLog.e("FlowCameraActivity", 2, "onTouchCaptureBtn: rmStateMgr.exitRecordMode() true, 段无效。");
          }
          d(false);
        }
      }
    } while (jdField_k_of_type_Boolean == paramBoolean1);
    jdField_k_of_type_Boolean = paramBoolean1;
    if (jdField_k_of_type_Boolean)
    {
      jdField_b_of_type_AndroidWidgetButton.setText(2131371894);
      jdField_a_of_type_AndroidWidgetTextView.setText("上滑取消");
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(-1);
      jdField_a_of_type_AndroidWidgetTextView.setBackgroundResource(2130837616);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setProgressColor(SimpleProgressBar.jdField_e_of_type_Int);
      if (jdField_k_of_type_AndroidViewView != null) {
        jdField_k_of_type_AndroidViewView.setVisibility(8);
      }
      jdField_b_of_type_AndroidWidgetButton.setBackgroundResource(2130840910);
      return;
    }
    jdField_b_of_type_AndroidWidgetButton.setText(null);
    jdField_a_of_type_AndroidWidgetTextView.setText("松手取消");
    jdField_a_of_type_AndroidWidgetTextView.setTextColor(-1);
    jdField_a_of_type_AndroidWidgetTextView.setBackgroundResource(2130837617);
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setProgressColor(SimpleProgressBar.jdField_f_of_type_Int);
    if (jdField_k_of_type_AndroidViewView == null)
    {
      jdField_k_of_type_AndroidViewView = new View(this);
      jdField_k_of_type_AndroidViewView.setBackgroundColor(871775498);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, jdField_a_of_type_Int);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_k_of_type_AndroidViewView, localLayoutParams);
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetButton.setBackgroundResource(2130840907);
      return;
      jdField_k_of_type_AndroidViewView.setVisibility(0);
    }
  }
  
  protected boolean a()
  {
    return false;
  }
  
  int[] a()
  {
    int[] arrayOfInt = new int[2];
    if (jdField_f_of_type_Boolean)
    {
      arrayOfInt[0] = ((int)jdField_a_of_type_Float);
      arrayOfInt[1] = ((int)(jdField_a_of_type_Float * FlowCameraConstant.jdField_a_of_type_Float));
      return arrayOfInt;
    }
    arrayOfInt[0] = ((int)jdField_a_of_type_Float);
    arrayOfInt[1] = ((int)(jdField_a_of_type_Float * 3.0F / 4.0F));
    return arrayOfInt;
  }
  
  int b()
  {
    if (jdField_f_of_type_Int == 0) {
      jdField_f_of_type_Int = getResources().getDimensionPixelSize(2131493526);
    }
    return jdField_f_of_type_Int;
  }
  
  public void b()
  {
    if (jdField_e_of_type_Boolean)
    {
      v();
      return;
    }
    Object localObject = null;
    if (jdField_f_of_type_Boolean) {
      localObject = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a(jdField_d_of_type_Int, jdField_e_of_type_Int, m, jdField_f_of_type_Boolean, (RMVideoClipSpec)localObject);
    if ((jdField_f_of_type_Boolean) && (jdField_c_of_type_Boolean))
    {
      d(false);
      return;
    }
    localObject = RichmediaClient.a().a().a(jdField_b_of_type_JavaLangString);
    if (localObject != null) {
      ((CompoundProcessor)localObject).a(103);
    }
    for (;;)
    {
      localObject = getIntent();
      ((Intent)localObject).putExtra("flow_back", 0);
      setResult(1001, (Intent)localObject);
      super.onBackPressed();
      return;
      a();
    }
  }
  
  void b(int paramInt1, int paramInt2)
  {
    Object localObject = a(2131296481);
    FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)a((View)localObject);
    width = paramInt1;
    height = paramInt2;
    ((View)localObject).setLayoutParams(localLayoutParams);
    jdField_a_of_type_AndroidViewView.getMeasuredHeight();
    int i3 = jdField_b_of_type_AndroidViewView.getMeasuredHeight();
    int i1 = jdField_c_of_type_AndroidViewView.getMeasuredHeight();
    int i2 = (int)(jdField_a_of_type_Float * FlowCameraConstant.jdField_a_of_type_Float);
    i2 = (int)jdField_b_of_type_Float - i3 - i2;
    if (paramInt2 >= jdField_b_of_type_Float) {
      paramInt2 = i2 - i1;
    }
    for (;;)
    {
      jdField_f_of_type_Int = i1;
      jdField_h_of_type_Int = paramInt2;
      jdField_i_of_type_Int = (i1 * jdField_e_of_type_Int / paramInt1);
      jdField_j_of_type_Int = ((paramInt2 + i3) * jdField_e_of_type_Int / paramInt1);
      localObject = (FrameLayout.LayoutParams)jdField_b_of_type_AndroidWidgetTextView.getLayoutParams();
      topMargin = (jdField_f_of_type_Int + ScreenUtil.a(13.0F));
      topMargin += ScreenUtil.a(3.0F);
      jdField_b_of_type_AndroidWidgetTextView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      if (jdField_i_of_type_Boolean) {
        a(5.0F);
      }
      return;
      paramInt2 = (int)jdField_b_of_type_Float - paramInt2;
      if (m)
      {
        paramInt2 = i2 - i1;
      }
      else if (i1 >= paramInt2)
      {
        paramInt2 = i2 - i1;
      }
      else
      {
        i2 -= paramInt2;
        i1 = paramInt2;
        paramInt2 = i2;
      }
    }
  }
  
  void b(RMVideoClipSpec paramRMVideoClipSpec)
  {
    int i2 = jdField_c_of_type_Int;
    int i3 = jdField_d_of_type_Int;
    int i4 = GloableValue.c.length;
    int i1 = 0;
    for (;;)
    {
      int i6;
      if (i1 < i4)
      {
        int i5 = a(GloableValue.c[(i1 + 1)]);
        i6 = a(GloableValue.c[(i1 + 3)]);
        if ((i2 >= GloableValue.c[i1]) && (i3 >= i5))
        {
          jdField_e_of_type_Int = GloableValue.c[i1];
          jdField_f_of_type_Int = i5;
        }
      }
      else
      {
        return;
      }
      if ((i2 >= GloableValue.c[(i1 + 2)]) && (i3 >= i6))
      {
        jdField_e_of_type_Int = GloableValue.c[(i1 + 2)];
        jdField_f_of_type_Int = i6;
        return;
      }
      i1 += 4;
    }
  }
  
  public void b(boolean paramBoolean)
  {
    Object localObject3 = getResources().getDisplayMetrics();
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover, 2131296481) == null)
    {
      localObject1 = localObject2;
      if (paramBoolean) {
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext;
      }
    }
    if ((VersionUtils.d()) && (!jdField_d_of_type_Boolean))
    {
      localObject2 = new CameraTextureView(this);
      if ((localObject1 != null) && ((localObject1 instanceof TexturePreviewContext)))
      {
        a = ((TexturePreviewContext)localObject1);
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(a);
        localObject1 = new FrameLayout.LayoutParams(-1, heightPixels);
        gravity = 83;
        m = false;
        if (jdField_f_of_type_Boolean)
        {
          ConfigurationInfo localConfigurationInfo = ((ActivityManager)super.getSystemService("activity")).getDeviceConfigurationInfo();
          paramBoolean = VideoEnvironment.a();
          if ((localConfigurationInfo == null) || (reqGlEsVersion < 131072) || (!paramBoolean)) {
            break label430;
          }
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView = ((CameraGLSurfaceView)a(2131297073));
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.setVideoContext(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext);
          localObject3 = new FrameLayout.LayoutParams(-1, heightPixels);
          height = jdField_a_of_type_Int;
          width = ((int)(jdField_a_of_type_Int * FlowCameraConstant.jdField_a_of_type_Float));
          gravity = 49;
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.setLayoutParams((ViewGroup.LayoutParams)localObject3);
          height = 1;
        }
      }
    }
    for (width = 1;; width = ((int)(jdField_a_of_type_Int * FlowCameraConstant.jdField_a_of_type_Float)))
    {
      gravity = 81;
      if (m) {
        gravity = 49;
      }
      ((View)localObject2).setId(2131296481);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.addView((View)localObject2, 0, (ViewGroup.LayoutParams)localObject1);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.setCameraView((View)localObject2);
      l = true;
      return;
      a = new TexturePreviewContext(jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy, widthPixels, heightPixels);
      break;
      localObject2 = new CameraPreview(this);
      if ((localObject1 != null) && ((localObject1 instanceof SurfacePreviewContext))) {}
      for (a = ((SurfacePreviewContext)localObject1);; a = new SurfacePreviewContext(jdField_a_of_type_ComTencentMobileqqShortvideoMediadeviceCameraProxy, widthPixels, heightPixels))
      {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(a);
        localObject1 = new FrameLayout.LayoutParams(-1, heightPixels);
        gravity = 51;
        m = true;
        break;
      }
      label430:
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView = ((CameraGLSurfaceView)a(2131297073));
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView = null;
      height = jdField_a_of_type_Int;
    }
  }
  
  boolean b()
  {
    return false;
  }
  
  int c()
  {
    if (jdField_g_of_type_Int == 0) {
      jdField_g_of_type_Int = getResources().getDimensionPixelSize(2131493527);
    }
    return jdField_g_of_type_Int;
  }
  
  void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer != null)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.b();
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.c();
    }
  }
  
  public void c(boolean paramBoolean)
  {
    if ((jdField_c_of_type_Boolean) && (!jdField_f_of_type_Boolean))
    {
      int i1 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a();
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "[@] deleteLastVideoSegment: current= " + i1 + ",deleteNative = " + paramBoolean);
      }
      CompoundProcessor localCompoundProcessor = RichmediaClient.a().a().a(jdField_b_of_type_JavaLangString);
      if ((paramBoolean) && (localCompoundProcessor != null)) {
        localCompoundProcessor.a(110);
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(i1, 1, paramBoolean);
    }
  }
  
  int d()
  {
    if (jdField_h_of_type_Int == 0) {
      jdField_h_of_type_Int = getResources().getDimensionPixelSize(2131493529);
    }
    return jdField_h_of_type_Int;
  }
  
  public void d()
  {
    if (!jdField_f_of_type_Boolean)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(0);
      localStringBuilder.append("\"");
      jdField_b_of_type_AndroidWidgetTextView.setText(localStringBuilder);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a(3);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a = this;
      jdField_c_of_type_AndroidWidgetButton.setEnabled(true);
      if (w)
      {
        jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
        jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
        return;
      }
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.jdField_c_of_type_Int = 2;
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.jdField_d_of_type_Int = CodecParam.jdField_c_of_type_Int;
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setCurrentProgress(0, false);
  }
  
  public void d(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "ptvRevert(): sendVideo:" + paramBoolean + ",mIsVideoMode: " + jdField_c_of_type_Boolean + ", mPtvMode: " + jdField_f_of_type_Boolean);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.j();
      if (jdField_c_of_type_Boolean) {}
    }
    else
    {
      return;
    }
    if (jdField_f_of_type_Boolean)
    {
      t();
      if (paramBoolean)
      {
        if (jdField_f_of_type_Boolean) {
          jdField_g_of_type_Boolean = false;
        }
        if (RichmediaClient.a().a().a(jdField_b_of_type_JavaLangString) != null) {
          break label256;
        }
        LogTag.a(jdField_b_of_type_JavaLangString, "sendShortVideo", "[peak] old procedure");
        getIntent().putExtra("ab_test_send_btn_click_time", SystemClock.uptimeMillis());
        float f1 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a();
        Object localObject = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr;
        if (jdField_f_of_type_Boolean) {
          f1 = 1.0F;
        }
        FlowCameraMqqAction.a(this, (RMVideoStateMgr)localObject, f1, jdField_f_of_type_Boolean, jdField_a_of_type_Double, jdField_b_of_type_Double, jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface);
        if (VideoEnvironment.d())
        {
          localObject = a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover, 2131296481);
          if (localObject != null) {
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.removeView((View)localObject);
          }
        }
      }
      label224:
      if (paramBoolean) {
        break label296;
      }
    }
    label256:
    label296:
    for (paramBoolean = true;; paramBoolean = false)
    {
      e(paramBoolean);
      jdField_c_of_type_Boolean = false;
      return;
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.m();
      break;
      if ((VideoEnvironment.d()) && (!jdField_f_of_type_Boolean))
      {
        setResult(1001);
        finish();
      }
      LogTag.a(jdField_b_of_type_JavaLangString, "sendShortVideo", "[peak] preupload procedure");
      break label224;
    }
  }
  
  public void e()
  {
    if ((jdField_c_of_type_Boolean) && (!jdField_f_of_type_Boolean))
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a(1);
      if ((jdField_j_of_type_AndroidViewView.getVisibility() == 0) && (jdField_i_of_type_AndroidViewView.getVisibility() == 0) && (jdField_j_of_type_AndroidViewView.isEnabled()) && (jdField_i_of_type_AndroidViewView.isEnabled()))
      {
        VideoAnimation.a(jdField_j_of_type_AndroidViewView, 0.0F, 8.0F, 0.0F, 0.0F, 300, 1.0F, 0.0F);
        VideoAnimation.a(jdField_i_of_type_AndroidViewView, 0.0F, -8.0F, 0.0F, 0.0F, 300, 1.0F, 0.0F);
      }
      jdField_j_of_type_AndroidViewView.setEnabled(false);
      jdField_i_of_type_AndroidViewView.setEnabled(false);
      VideoAnimation.a(jdField_b_of_type_AndroidWidgetButton, 1.0F, 1.08F, 1.0F, 1.08F, 200, null);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_Int = 0;
      if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_Double <= 0.0D) {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_e_of_type_Boolean = true;
      }
      if (jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.getVisibility() == 0) {
        jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.setVisibility(4);
      }
      if (jdField_c_of_type_AndroidWidgetButton.isEnabled())
      {
        jdField_c_of_type_AndroidWidgetButton.setEnabled(false);
        VideoAnimation.b(jdField_c_of_type_AndroidWidgetButton, true);
      }
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwAutoSegmentMgr.a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_Double);
      Drawable[] arrayOfDrawable = jdField_b_of_type_AndroidWidgetTextView.getCompoundDrawables();
      if (arrayOfDrawable[0] != null) {
        a(arrayOfDrawable[0], Color.argb(255, 255, 0, 43));
      }
      if ((w) && (jdField_a_of_type_AndroidWidgetButton.isEnabled()))
      {
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
      }
      if (jdField_d_of_type_AndroidWidgetButton.isEnabled())
      {
        jdField_d_of_type_AndroidWidgetButton.setEnabled(false);
        jdField_d_of_type_AndroidWidgetButton.setAlpha(0.2F);
      }
    }
  }
  
  void e(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "exitVideoMode(), mPtvMode = " + jdField_f_of_type_Boolean + ", clearCache = " + paramBoolean);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr != null)
    {
      if (paramBoolean)
      {
        a(103);
        if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null)
        {
          int i1 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.a();
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(0, i1, true);
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.d();
      if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr.a();
      }
      if (jdField_f_of_type_Boolean) {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b(paramBoolean);
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause != null) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr$ForceReleaseLockOnPause.jdField_b_of_type_Boolean)) {
        jdField_g_of_type_Boolean = false;
      }
    }
  }
  
  public void f()
  {
    float f1 = 1.0F;
    Object localObject;
    float f2;
    int i1;
    String str;
    if ((jdField_c_of_type_Boolean) && (!jdField_f_of_type_Boolean))
    {
      if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.c() <= 0) {
        jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a(2);
      }
      if ((jdField_j_of_type_AndroidViewView.getVisibility() == 4) && (jdField_i_of_type_AndroidViewView.getVisibility() == 4))
      {
        jdField_j_of_type_AndroidViewView.setVisibility(0);
        jdField_i_of_type_AndroidViewView.setVisibility(0);
      }
      if ((!jdField_j_of_type_AndroidViewView.isEnabled()) && (!jdField_i_of_type_AndroidViewView.isEnabled()))
      {
        VideoAnimation.a(jdField_j_of_type_AndroidViewView, 8.0F, 0.0F, 0.0F, 0.0F, 300, 0.0F, 1.0F);
        VideoAnimation.a(jdField_i_of_type_AndroidViewView, -8.0F, 0.0F, 0.0F, 0.0F, 300, 0.0F, 1.0F);
        jdField_j_of_type_AndroidViewView.setEnabled(true);
        jdField_i_of_type_AndroidViewView.setEnabled(true);
      }
      if (jdField_b_of_type_AndroidWidgetButton.isEnabled()) {
        VideoAnimation.a(jdField_b_of_type_AndroidWidgetButton, 1.08F, 1.0F, 1.08F, 1.0F, 200, null);
      }
      localObject = jdField_b_of_type_AndroidWidgetTextView.getCompoundDrawables();
      if (localObject[0] != null)
      {
        localObject[0].setAlpha(255);
        a(localObject[0], -1);
      }
      g(false);
      if (!jdField_d_of_type_AndroidWidgetButton.isEnabled())
      {
        jdField_d_of_type_AndroidWidgetButton.setEnabled(true);
        jdField_d_of_type_AndroidWidgetButton.setAlpha(1.0F);
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_e_of_type_Boolean)
      {
        f2 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a();
        i1 = 320;
        if (RMVideoStateMgr.jdField_a_of_type_Boolean) {
          i1 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.jdField_e_of_type_Int;
        }
        localObject = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr;
        str = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_JavaLangString;
        if (!jdField_f_of_type_Boolean) {
          break label385;
        }
      }
    }
    for (;;)
    {
      ((RMVideoThumbGenMgr)localObject).a(str, f1, i1);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_e_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = null;
      boolean bool = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a();
      if ((jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null) && (!bool))
      {
        i1 = (int)(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.b() * 1000.0F / jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_Double);
        jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.c(i1, -1);
      }
      return;
      label385:
      f1 = f2;
    }
  }
  
  public void f(boolean paramBoolean)
  {
    int[] arrayOfInt = new int[6];
    if ((jdField_d_of_type_Int == -1) || (jdField_e_of_type_Int == -1)) {}
    do
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.i("FlowCameraActivity", 2, "[changeVideoPreviewMapSize]rmStateMgr " + null);
    return;
    RMVideoClipSpec localRMVideoClipSpec = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
    float f1 = jdField_d_of_type_Int * 1.0F / jdField_e_of_type_Int;
    if (jdField_c_of_type_Float > f1) {}
    for (boolean bool = false;; bool = true)
    {
      if (CameraCompatibleList.a()) {
        bool = true;
      }
      if (paramBoolean) {
        a(jdField_d_of_type_Int, jdField_e_of_type_Int, bool, arrayOfInt);
      }
      try
      {
        b(arrayOfInt[2], arrayOfInt[3]);
        if (!paramBoolean) {
          a(jdField_d_of_type_Int, jdField_e_of_type_Int, bool, arrayOfInt);
        }
        jdField_c_of_type_Int = arrayOfInt[0];
        jdField_d_of_type_Int = arrayOfInt[1];
        jdField_e_of_type_Int = jdField_d_of_type_Int;
        jdField_f_of_type_Int = jdField_e_of_type_Int;
        if (bool) {
          if (m) {
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(2, localRMVideoClipSpec, jdField_i_of_type_Int);
          }
        }
        for (;;)
        {
          b(localRMVideoClipSpec);
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(localRMVideoClipSpec);
          return;
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(5, localRMVideoClipSpec, jdField_j_of_type_Int);
          continue;
          if (m) {
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b(2, localRMVideoClipSpec, jdField_i_of_type_Int);
          } else {
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b(5, localRMVideoClipSpec, jdField_j_of_type_Int);
          }
        }
      }
      catch (NullPointerException localNullPointerException)
      {
        for (;;) {}
      }
    }
  }
  
  public void finish()
  {
    super.finish();
    if ((jdField_q_of_type_Int == 1) && (t)) {
      overridePendingTransition(0, 2130968591);
    }
  }
  
  public void g()
  {
    if (jdField_j_of_type_AndroidViewView.isEnabled()) {
      jdField_j_of_type_AndroidViewView.setEnabled(false);
    }
    if (jdField_b_of_type_AndroidWidgetButton.isEnabled())
    {
      jdField_b_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_b_of_type_AndroidWidgetButton.setTextColor(-14531501);
    }
    if (jdField_d_of_type_AndroidWidgetButton.isEnabled())
    {
      jdField_d_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_d_of_type_AndroidWidgetButton.setAlpha(0.2F);
    }
    if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.isEnabled())
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setVisibility(4);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setEnabled(false);
    }
    int i1 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b();
    int i2 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.c();
    i2 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.a(i2);
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a(CodecParam.jdField_c_of_type_Int, i1, i2, jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_JavaLangString);
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr.a();
    BitmapFactory.Options localOptions;
    Object localObject1;
    if ((localObject2 != null) && (jdField_c_of_type_JavaLangString != null) && (a.get() == 3) && (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable == null))
    {
      localOptions = new BitmapFactory.Options();
      inSampleSize = 2;
      inPreferredConfig = Bitmap.Config.RGB_565;
      localObject1 = null;
    }
    try
    {
      localObject2 = BitmapFactory.decodeFile(jdField_c_of_type_JavaLangString, localOptions);
      localObject1 = localObject2;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;) {}
    }
    if (localObject1 != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = new BitmapDrawable(super.getResources(), localObject1);
    }
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a();
    if (!jdField_i_of_type_AndroidViewView.isEnabled())
    {
      jdField_i_of_type_AndroidViewView.setEnabled(true);
      jdField_i_of_type_AndroidViewView.setBackgroundResource(2130840927);
    }
  }
  
  public void g(boolean paramBoolean)
  {
    int i1 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b();
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "[@] event: current=" + i1);
    }
    if ((i1 >= CodecParam.jdField_c_of_type_Int) && (jdField_b_of_type_AndroidWidgetButton.isEnabled()))
    {
      jdField_b_of_type_AndroidWidgetButton.setText(2131371895);
      jdField_b_of_type_AndroidWidgetButton.setEnabled(false);
      jdField_b_of_type_AndroidWidgetButton.setTextColor(-14531501);
    }
    if (i1 < CodecParam.jdField_c_of_type_Int)
    {
      jdField_b_of_type_AndroidWidgetButton.setVisibility(0);
      jdField_b_of_type_AndroidWidgetButton.setText(2131371893);
      jdField_b_of_type_AndroidWidgetButton.setEnabled(true);
      jdField_b_of_type_AndroidWidgetButton.setTextColor(-15550475);
    }
    if (i1 == 0)
    {
      if ((jdField_j_of_type_AndroidViewView.isEnabled()) && (jdField_i_of_type_AndroidViewView.isEnabled()))
      {
        VideoAnimation.a(jdField_j_of_type_AndroidViewView, 0.0F, 8.0F, 0.0F, 0.0F, 300, 1.0F, 0.0F);
        VideoAnimation.a(jdField_i_of_type_AndroidViewView, 0.0F, -8.0F, 0.0F, 0.0F, 300, 1.0F, 0.0F);
        jdField_j_of_type_AndroidViewView.setEnabled(false);
        jdField_i_of_type_AndroidViewView.setEnabled(false);
      }
      if ((jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.c() <= 0) && (!jdField_i_of_type_Boolean) && (!jdField_h_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.getVisibility() == 4)) {
        jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.setVisibility(0);
      }
      jdField_c_of_type_AndroidWidgetButton.setEnabled(true);
      VideoAnimation.a(jdField_c_of_type_AndroidWidgetButton, true);
      if ((w) && (!jdField_a_of_type_AndroidWidgetButton.isEnabled()))
      {
        jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
        jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      }
    }
    for (;;)
    {
      z();
      if (paramBoolean) {
        FlowCameraMqqAction.a("", "0X8005F60");
      }
      return;
      if (i1 > 0)
      {
        if (jdField_c_of_type_AndroidWidgetButton.isEnabled())
        {
          jdField_c_of_type_AndroidWidgetButton.setEnabled(false);
          VideoAnimation.b(jdField_c_of_type_AndroidWidgetButton, true);
        }
        if ((!jdField_j_of_type_AndroidViewView.isEnabled()) && (!jdField_i_of_type_AndroidViewView.isEnabled()))
        {
          VideoAnimation.a(jdField_j_of_type_AndroidViewView, 8.0F, 0.0F, 0.0F, 0.0F, 300, 0.0F, 1.0F);
          VideoAnimation.a(jdField_i_of_type_AndroidViewView, -8.0F, 0.0F, 0.0F, 0.0F, 300, 0.0F, 1.0F);
          jdField_j_of_type_AndroidViewView.setEnabled(true);
          jdField_i_of_type_AndroidViewView.setEnabled(true);
        }
        if (jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.getVisibility() == 0) {
          jdField_a_of_type_ComTencentMobileqqWidgetHorizontalItemIndicator.setVisibility(4);
        }
        if ((w) && (jdField_a_of_type_AndroidWidgetButton.isEnabled()))
        {
          jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
          jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
        }
      }
    }
  }
  
  public void h()
  {
    if (jdField_b_of_type_AndroidWidgetButton != null) {
      jdField_b_of_type_AndroidWidgetButton.setEnabled(true);
    }
    jdField_q_of_type_Boolean = true;
    if ((jdField_q_of_type_Boolean) && (jdField_r_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder == null)) {
      H();
    }
    boolean bool = CameraCompatibleList.a(CameraCompatibleList.q);
    if ((!jdField_b_of_type_Boolean) && (bool)) {
      jdField_a_of_type_AndroidOsHandler.postDelayed(jdField_c_of_type_JavaLangRunnable, 2000L);
    }
  }
  
  void h(boolean paramBoolean)
  {
    runOnUiThread(new mjd(this, paramBoolean));
  }
  
  public void i()
  {
    if ((jdField_c_of_type_Boolean) && (!jdField_f_of_type_Boolean)) {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.c();
    }
  }
  
  public void j()
  {
    if (!jdField_f_of_type_Boolean) {
      QzoneHandlerThreadFactory.a("Normal_HandlerThread", false).a(new mjc(this, jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder));
    }
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "recordVideoFinish(): mOnCaptureBtn = " + jdField_k_of_type_Boolean);
      }
    } while (!jdField_k_of_type_Boolean);
    d(true);
  }
  
  public void k()
  {
    if ((!jdField_f_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar != null)) {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a();
    }
  }
  
  public void l()
  {
    if (!jdField_f_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetButton.setLongClickable(false);
      if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b() > 0)
      {
        jdField_i_of_type_AndroidViewView.setVisibility(0);
        jdField_j_of_type_AndroidViewView.setVisibility(0);
      }
      for (;;)
      {
        if (!jdField_c_of_type_AndroidWidgetButton.isEnabled())
        {
          jdField_c_of_type_AndroidWidgetButton.setEnabled(true);
          VideoAnimation.a(jdField_c_of_type_AndroidWidgetButton, true);
        }
        return;
        jdField_i_of_type_AndroidViewView.setVisibility(4);
        jdField_j_of_type_AndroidViewView.setVisibility(4);
      }
    }
    jdField_b_of_type_Int = ((int)((jdField_e_of_type_AndroidViewView.getMeasuredHeight() - jdField_b_of_type_AndroidWidgetButton.getHeight()) * 0.5F) + getResources().getDimensionPixelSize(2131493536));
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setVisibility(0);
  }
  
  public void m()
  {
    if (!jdField_f_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a();
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.setVisibility(4);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
      jdField_i_of_type_AndroidViewView.setVisibility(4);
      jdField_j_of_type_AndroidViewView.setVisibility(4);
      jdField_b_of_type_AndroidWidgetButton.setLongClickable(true);
      jdField_b_of_type_AndroidWidgetButton.setEnabled(true);
      jdField_b_of_type_AndroidWidgetButton.setBackgroundResource(2130840911);
      jdField_b_of_type_AndroidWidgetButton.setText(null);
      if (!jdField_c_of_type_AndroidWidgetButton.isEnabled())
      {
        jdField_c_of_type_AndroidWidgetButton.setEnabled(true);
        VideoAnimation.a(jdField_c_of_type_AndroidWidgetButton, true);
      }
      return;
    }
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setCurrentProgress(0, false);
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setVisibility(4);
    jdField_b_of_type_AndroidWidgetButton.setOnTouchListener(null);
    jdField_b_of_type_AndroidWidgetButton.setLongClickable(true);
  }
  
  public void n()
  {
    if (jdField_b_of_type_AndroidWidgetImageView.getVisibility() == 0)
    {
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(4);
      jdField_b_of_type_AndroidWidgetImageView.setAlpha(255);
    }
    if (jdField_c_of_type_AndroidWidgetImageView.getVisibility() == 0)
    {
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
      jdField_c_of_type_AndroidWidgetImageView.setAlpha(255);
    }
    if ((jdField_f_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView != null) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.getVisibility() != 0)) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.setVisibility(0);
    }
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_c_of_type_JavaLangRunnable);
  }
  
  public void o()
  {
    super.finish();
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface.a(this, paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void onBackPressed()
  {
    if ((!jdField_f_of_type_Boolean) && (jdField_c_of_type_Boolean))
    {
      q();
      return;
    }
    b();
  }
  
  public void onClick(View paramView)
  {
    Camera.CameraInfo localCameraInfo = null;
    CameraControl localCameraControl = null;
    if (!l) {}
    label974:
    do
    {
      int i1;
      do
      {
        do
        {
          do
          {
            return;
            i1 = paramView.getId();
            if (i1 != 2131300928) {
              break;
            }
          } while ((!Utils.d()) || (jdField_f_of_type_Boolean) || (jdField_c_of_type_Boolean));
          if (QLog.isColorLevel()) {
            QLog.i("FlowCameraActivity", 2, "Press the capture button.");
          }
          jdField_c_of_type_AndroidWidgetButton.setEnabled(false);
          jdField_b_of_type_AndroidWidgetButton.setClickable(false);
          jdField_b_of_type_AndroidWidgetButton.setOnLongClickListener(null);
          paramView = new File(AppConstants.bj);
          if (!paramView.exists()) {
            paramView.mkdirs();
          }
          jdField_c_of_type_JavaLangString = FlowCameraConstant.a();
          paramView = new File(jdField_c_of_type_JavaLangString);
          localCameraControl = CameraControl.a();
          localCameraInfo = new Camera.CameraInfo();
          Camera.getCameraInfo(jdField_c_of_type_Int, localCameraInfo);
          i1 = (jdField_k_of_type_Int + 45) / 90 * 90;
          if (facing == 1) {}
          for (i1 = (orientation - i1 + 360) % 360;; i1 = (i1 + orientation) % 360)
          {
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.a(paramView, new miz(this, paramView), i1);
            if (FlowCameraConstant.jdField_d_of_type_Int != 1) {
              break;
            }
            FlowCameraMqqAction.a("", "0X8005F5A", "0");
            return;
          }
          FlowCameraMqqAction.a("", "0X8005F5A", "1");
          return;
          if (i1 != 2131301358) {
            break;
          }
          if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b.get() == 4)
          {
            a(true);
            return;
          }
        } while (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b() <= 0);
        if (QLog.isColorLevel()) {
          QLog.d("FlowCameraActivity", 2, "mVideoDrawablePlayer.getVFileAndAFile=" + jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_JavaLangString);
        }
        if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_JavaLangString) != 0)
        {
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b(0, "视频文件不存在", false);
          return;
        }
        jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.jdField_a_of_type_Boolean = true;
        jdField_i_of_type_AndroidViewView.setEnabled(false);
        if (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null) {
          jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.f();
        }
        a(this, 2131369998);
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.c();
        r();
        u = true;
        paramView = a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover, 2131296481);
        if (paramView != null)
        {
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.removeView(paramView);
          jdField_b_of_type_Boolean = false;
        }
        if (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null)
        {
          paramView = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
          float f1 = jdField_f_of_type_Int * 1.0F / jdField_e_of_type_Int;
          a((int)jdField_a_of_type_Float, f1);
        }
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a(4);
        FlowCameraMqqAction.a("", "0X8005F5F");
        return;
        if (i1 == 2131301360)
        {
          paramView = new DCShortVideo(BaseApplication.getContext());
          for (;;)
          {
            try
            {
              i1 = FlowCameraConstant.jdField_d_of_type_Int;
              if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.a() <= 1) {
                continue;
              }
              bool = true;
              paramView.a(i1, bool);
            }
            catch (NullPointerException paramView)
            {
              boolean bool;
              continue;
            }
            t = true;
            F();
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.j();
            a(102);
            LogTag.a(jdField_b_of_type_JavaLangString, "SendBtn Click ", ",(int)rmStateMgr.mTotalTime = " + (int)jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_Double + ",frames = " + jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.b() + " VideoABTest:" + SystemClock.uptimeMillis());
            paramView = RichmediaClient.a().a().a(jdField_b_of_type_JavaLangString);
            if (paramView != null) {
              paramView.a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_JavaLangString, (int)jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_Double, jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.b());
            }
            d(true);
            paramView = localCameraControl;
            if (jdField_f_of_type_Boolean) {
              paramView = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
            }
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a(jdField_d_of_type_Int, jdField_e_of_type_Int, m, jdField_f_of_type_Boolean, paramView);
            if (!VideoEnvironment.d())
            {
              setResult(1001);
              finish();
            }
            if (FlowCameraConstant.jdField_d_of_type_Int != 1) {
              continue;
            }
            FlowCameraMqqAction.a("", "0X8005F5E", "0");
            return;
            bool = false;
          }
          FlowCameraMqqAction.a("", "0X8005F5E", "1");
          return;
        }
        if (i1 == 2131301357)
        {
          jdField_c_of_type_AndroidWidgetButton.setEnabled(false);
          jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.j();
          if (!m)
          {
            paramView = localCameraInfo;
            if (jdField_f_of_type_Boolean) {
              paramView = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
            }
            paramView = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a(jdField_d_of_type_Int, jdField_e_of_type_Int, m, jdField_f_of_type_Boolean, paramView);
            if (paramView != null)
            {
              jdField_b_of_type_AndroidWidgetImageView.setImageBitmap(paramView);
              jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
              a(104);
              jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a(3);
              jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.invalidate();
              jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.removeViewAt(0);
              if (FlowCameraConstant.jdField_d_of_type_Int != 1) {
                break label974;
              }
            }
          }
          for (FlowCameraConstant.jdField_d_of_type_Int = 2;; FlowCameraConstant.jdField_d_of_type_Int = 1)
          {
            s();
            jdField_b_of_type_AndroidWidgetButton.setEnabled(false);
            jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.i();
            return;
            jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130838245);
            break;
            jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130838245);
            break;
          }
        }
        if (i1 == 2131300925)
        {
          if ((jdField_c_of_type_Boolean) || (jdField_f_of_type_Boolean))
          {
            onBackPressed();
            return;
          }
          paramView = getIntent();
          paramView.putExtra("flow_back", 0);
          setResult(1001, paramView);
          finish();
          return;
        }
      } while (i1 != 2131301359);
      if (QLog.isColorLevel()) {
        QLog.e("FlowCameraActivity", 2, "flow_camera_btn_video_local");
      }
    } while (jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface == null);
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface.a(this);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    if (QLog.isColorLevel())
    {
      StringBuilder localStringBuilder = new StringBuilder("DeviceInfo:");
      localStringBuilder.append("PRODUCT=").append(Build.PRODUCT).append("|");
      localStringBuilder.append("MODEL=").append(Build.MODEL).append("|");
      localStringBuilder.append("BOARD=").append(Build.BOARD).append("|");
      localStringBuilder.append("BOOTLOADER=").append(Build.BOOTLOADER).append("|");
      localStringBuilder.append("CPU_ABI=").append(Build.CPU_ABI).append("|");
      localStringBuilder.append("CPU_ABI2=").append(Build.CPU_ABI2).append("|");
      localStringBuilder.append("DEVICE=").append(Build.DEVICE).append("|");
      localStringBuilder.append("DISPLAY=").append(Build.DISPLAY).append("|");
      localStringBuilder.append("FLNGERPRINT=").append(Build.FINGERPRINT).append("|");
      localStringBuilder.append("HARDWARE=").append(Build.HARDWARE).append("|");
      localStringBuilder.append("ID=").append(Build.ID).append("|");
      localStringBuilder.append("SERIAL=").append(Build.SERIAL).append("|");
      localStringBuilder.append("MANUFACTURER=").append(Build.MANUFACTURER).append("|");
      localStringBuilder.append("SDK_INT=").append(Build.VERSION.SDK_INT).append("|");
      QLog.i("FlowCameraActivity", 2, localStringBuilder.toString());
    }
    G = true;
    H = b();
    PerfTracer.a("Video_component_onCreate");
    super.onCreate(paramBundle);
    PerfTracer.b("Video_component_onCreate");
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    try
    {
      if (jdField_s_of_type_Int == 1)
      {
        unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
        jdField_s_of_type_Int = 0;
      }
      if (jdField_a_of_type_ComTencentWidgetActionSheet != null) {
        jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      }
      if (!jdField_f_of_type_Boolean) {
        jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.a = null;
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.c();
      if (jdField_a_of_type_AndroidViewOrientationEventListener != null) {
        jdField_a_of_type_AndroidViewOrientationEventListener.disable();
      }
      if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)
      {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
      }
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("FlowCameraActivity", 2, " already unregisterReceiver" + localIllegalArgumentException);
        }
      }
    }
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (jdField_f_of_type_Boolean)) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a().a();
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onLongClick(View paramView)
  {
    if (!l)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FlowCameraActivity", 2, "onLongClick mIsCameraSetup false just return;");
      }
      return false;
    }
    if (paramView.getId() == 2131300928)
    {
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "onLongClick mPtvMode = " + jdField_f_of_type_Boolean + ", mIsVideoMode = " + jdField_c_of_type_Boolean);
      }
      if (jdField_f_of_type_Boolean) {
        break label114;
      }
      if (jdField_c_of_type_Boolean)
      {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMViewSTInterface.l();
        w();
      }
    }
    for (;;)
    {
      return true;
      label114:
      int i1 = jdField_e_of_type_AndroidViewView.getMeasuredHeight();
      paramView = ValueAnimator.ofInt(new int[] { 0, i1 });
      paramView.addUpdateListener(new mio(this, i1));
      paramView.addListener(new mip(this));
      paramView.start();
      FlowCameraMqqAction.a("", "0X8005E92");
    }
  }
  
  public void onPause()
  {
    super.onPause();
    if (!jdField_g_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b();
      if ((jdField_f_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView != null)) {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.onPause();
      }
      jdField_b_of_type_Boolean = false;
    }
    if (jdField_q_of_type_Int == 1) {
      QzoneOnlineTimeCollectRptService.a().a();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b.get() == 4) {
      c();
    }
    View localView = a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover, 2131296481);
    if ((CameraCompatibleList.c(CameraCompatibleList.jdField_b_of_type_JavaLangString)) && (localView != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.removeView(localView);
    }
    if ((!jdField_f_of_type_Boolean) && (!v) && (!t) && (!u))
    {
      v = true;
      jdField_a_of_type_AndroidOsHandler.postDelayed(jdField_b_of_type_JavaLangRunnable, 300000L);
    }
  }
  
  public void onResume()
  {
    super.onResume();
    if ((!jdField_g_of_type_Boolean) && (l)) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a();
    }
    View localView = a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover, 2131296481);
    if (((!jdField_g_of_type_Boolean) || (localView == null)) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.b.get() != 4))
    {
      if (localView != null) {
        break label145;
      }
      Looper.myQueue().addIdleHandler(new miv(this));
    }
    for (;;)
    {
      jdField_g_of_type_Boolean = false;
      if ((!jdField_f_of_type_Boolean) && (v) && (!t) && (!u))
      {
        jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_b_of_type_JavaLangRunnable);
        v = false;
      }
      if (jdField_q_of_type_Int == 1) {
        QzoneOnlineTimeCollectRptService.a().b(4);
      }
      return;
      label145:
      if ((jdField_f_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView != null)) {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.onResume();
      }
    }
  }
  
  public void onStart()
  {
    super.onStart();
    C();
    jdField_a_of_type_Double = 0.0D;
    jdField_b_of_type_Double = 0.0D;
    jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener = new mix(this, 1, true, true, 0L, false, false, "FlowCameraActivity2");
    SosoInterface.a(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener);
  }
  
  public void onStop()
  {
    super.onStop();
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener != null)
    {
      SosoInterface.b(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener);
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener = null;
      jdField_a_of_type_Double = 0.0D;
      jdField_b_of_type_Double = 0.0D;
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = super.onTouchEvent(paramMotionEvent);
    if (!l) {}
    while ((jdField_f_of_type_Boolean) || (jdField_e_of_type_Boolean) || (!jdField_b_of_type_AndroidWidgetButton.isClickable())) {
      return bool;
    }
    jdField_a_of_type_AndroidViewGestureDetector.onTouchEvent(paramMotionEvent);
    return true;
  }
  
  public void p() {}
  
  void q()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.jdField_a_of_type_Double == 0.0D)
    {
      b();
      FlowCameraMqqAction.a("", "0X800656F", "1");
      return;
    }
    if (jdField_a_of_type_ComTencentWidgetActionSheet == null) {
      jdField_a_of_type_ComTencentWidgetActionSheet = ActionSheet.b(this, false);
    }
    jdField_a_of_type_ComTencentWidgetActionSheet.a("放弃录制，当前视频将会被删除");
    jdField_a_of_type_ComTencentWidgetActionSheet.a("放弃", 3);
    jdField_a_of_type_ComTencentWidgetActionSheet.d("取消");
    jdField_a_of_type_ComTencentWidgetActionSheet.a(new miy(this));
    jdField_a_of_type_ComTencentWidgetActionSheet.show();
  }
  
  void r()
  {
    if (QLog.isColorLevel()) {
      QLog.e("FlowCameraActivity", 2, "cancleProgressDailog");
    }
    try
    {
      if (jdField_a_of_type_AndroidAppProgressDialog != null) {
        jdField_a_of_type_AndroidAppProgressDialog.cancel();
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  public void s()
  {
    b(false);
  }
  
  void t()
  {
    int i1 = jdField_e_of_type_AndroidViewView.getMeasuredHeight();
    ValueAnimator localValueAnimator = ValueAnimator.ofInt(new int[] { jdField_e_of_type_AndroidViewView.getMeasuredHeight(), 0 });
    localValueAnimator.addUpdateListener(new mid(this, i1));
    localValueAnimator.addListener(new mie(this));
    localValueAnimator.start();
  }
  
  public void u()
  {
    jdField_b_of_type_AndroidWidgetButton.setText(2131371894);
    jdField_b_of_type_AndroidWidgetButton.setBackgroundResource(2130840910);
    jdField_a_of_type_AndroidWidgetTextView.setText(2131371896);
    jdField_a_of_type_AndroidWidgetTextView.setTextColor(-8355712);
    jdField_a_of_type_AndroidWidgetTextView.setBackgroundDrawable(null);
    jdField_a_of_type_ComTencentMobileqqShortvideoWidgetSimpleProgressBar.setProgressColor(SimpleProgressBar.jdField_e_of_type_Int);
    if (jdField_k_of_type_AndroidViewView != null)
    {
      jdField_a_of_type_AndroidWidgetRelativeLayout.removeView(jdField_k_of_type_AndroidViewView);
      jdField_k_of_type_AndroidViewView = null;
    }
  }
  
  public void v()
  {
    if (!jdField_h_of_type_Boolean) {
      jdField_b_of_type_AndroidViewView.setVisibility(0);
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(null);
    jdField_d_of_type_AndroidViewView.setVisibility(8);
    jdField_a_of_type_AndroidViewView.setVisibility(0);
    jdField_e_of_type_Boolean = false;
    jdField_b_of_type_AndroidWidgetButton.setClickable(true);
    jdField_b_of_type_AndroidWidgetButton.setOnLongClickListener(this);
    jdField_c_of_type_AndroidWidgetButton.setVisibility(0);
    jdField_c_of_type_AndroidWidgetButton.setEnabled(true);
  }
  
  public void w()
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "enterVideoMode(), mPtvMode = " + jdField_f_of_type_Boolean);
    }
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.e();
  }
  
  public void x()
  {
    G();
    b(true);
  }
  
  public void y()
  {
    Bitmap localBitmap2 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.jdField_a_of_type_AndroidGraphicsBitmap;
    Bitmap localBitmap1 = localBitmap2;
    if (localBitmap2 == null) {
      localBitmap1 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a();
    }
    if (localBitmap1 != null) {
      jdField_c_of_type_AndroidWidgetImageView.setImageBitmap(localBitmap1);
    }
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_c_of_type_AndroidWidgetImageView.setAlpha(0.2F);
  }
  
  public void z()
  {
    int i3 = jdField_a_of_type_ComTencentMobileqqShortvideoWidgetTCProgressBar.b();
    int i2 = i3 / 1000;
    int i1 = i2;
    if (i3 % 1000 >= 500) {
      i1 = i2 + 1;
    }
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(i1);
    localStringBuilder.append("\"");
    jdField_b_of_type_AndroidWidgetTextView.setText(localStringBuilder);
  }
}
