package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.StatFs;
import android.util.AttributeSet;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.PttBuffer;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.BuddyTransfileProcessor;
import com.tencent.mobileqq.util.SkinUtils;
import com.tencent.mobileqq.utils.AudioHelper;
import com.tencent.mobileqq.utils.AudioUtil;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.utils.QQRecorder.OnQQRecorderListener;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.utils.RecordParams;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import java.io.File;
import ksr;
import kss;
import kst;
import ksu;
import ksv;
import ksw;
import ksx;
import ksy;
import ksz;

public class CommonRecordSoundPanel
  extends RelativeLayout
  implements View.OnClickListener, AudioPanelCallback, QQRecorder.OnQQRecorderListener
{
  public static final int a = 350;
  public static final int b = 250;
  public static final int c = 200;
  static final int d = 16711686;
  static final int e = 16711687;
  static final int f = 16711688;
  public static final int h = 0;
  public static final int i = 1;
  public static final int j = 2;
  public static final int k = 3;
  public static final int l = 1;
  public static final int m = 2;
  public static final int n = 3;
  private static final int o = 1;
  private static final int p = 2000;
  public double a;
  public Handler a;
  private View jdField_a_of_type_AndroidViewView;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private PopupWindow jdField_a_of_type_AndroidWidgetPopupWindow;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private MediaPlayerManager jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager;
  private VolumeIndicateView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView;
  public BaseActivity a;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private QQRecorder jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder;
  private String jdField_a_of_type_JavaLangString;
  private boolean jdField_a_of_type_Boolean;
  private Handler jdField_b_of_type_AndroidOsHandler;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private VolumeIndicateView jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView;
  int g;
  private int q;
  private int r;
  private int s;
  
  public CommonRecordSoundPanel(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_AndroidOsHandler = new ksr(this, Looper.getMainLooper());
    jdField_a_of_type_JavaLangString = "common record panel";
    g = 0;
    s = 180000;
  }
  
  public CommonRecordSoundPanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet, 0);
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_AndroidOsHandler = new ksr(this, Looper.getMainLooper());
    jdField_a_of_type_JavaLangString = "common record panel";
    g = 0;
    s = 180000;
  }
  
  private void a(Context paramContext, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    int i1;
    if (!AppSetting.i)
    {
      if (!paramBoolean3) {
        break label36;
      }
      i1 = 2131367875;
    }
    for (;;)
    {
      QQToast.a(paramContext, i1, 0).b(paramContext.getResources().getDimensionPixelSize(2131492908));
      return;
      label36:
      if (paramBoolean2) {
        i1 = 2131367876;
      } else if (paramBoolean1) {
        i1 = 2131367874;
      } else {
        i1 = 2131367873;
      }
    }
  }
  
  public double a()
  {
    return jdField_a_of_type_Double;
  }
  
  public int a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderStart() is called");
    }
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(3);
    jdField_b_of_type_AndroidOsHandler.post(new ksw(this));
    jdField_b_of_type_AndroidOsHandler.removeMessages(1);
    jdField_b_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 2000L);
    jdField_a_of_type_Boolean = true;
    return 250;
  }
  
  public int a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onBeginReceiveData() is called");
    }
    return c();
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onInitSuccess() is called");
    }
  }
  
  public void a(int paramInt) {}
  
  public void a(QQAppInterface paramQQAppInterface, BaseActivity paramBaseActivity, Handler paramHandler)
  {
    a(paramQQAppInterface, paramBaseActivity, paramHandler, 0);
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseActivity paramBaseActivity, Handler paramHandler, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    jdField_a_of_type_AndroidOsHandler = paramHandler;
    q = paramInt;
    jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager = MediaPlayerManager.a(paramQQAppInterface);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299341));
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131299342));
    jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131299332));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView = ((VolumeIndicateView)findViewById(2131299333));
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView = ((VolumeIndicateView)findViewById(2131299335));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299345));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131299346));
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
    paramBaseActivity = paramBaseActivity.getResources();
    paramQQAppInterface = SkinUtils.a(paramBaseActivity.getDrawable(2130842468));
    paramBaseActivity = SkinUtils.a(paramBaseActivity.getDrawable(2130842469));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setIndicateVolumeBitmap(paramQQAppInterface, 3);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setIndicateVolumeBitmap(paramBaseActivity, 4);
    if (QLog.isColorLevel())
    {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.init() is called,time is:" + System.currentTimeMillis());
      QLog.d("AIOAudioPanel", 2, "volumeFillLeftBmp is:" + paramQQAppInterface + ",volumeFillRightBmp is:" + paramBaseActivity);
    }
  }
  
  public void a(QQRecorder.OnQQRecorderListener paramOnQQRecorderListener)
  {
    if (jdField_b_of_type_AndroidOsHandler != null)
    {
      if (jdField_b_of_type_AndroidOsHandler.hasMessages(16711688)) {
        jdField_b_of_type_AndroidOsHandler.removeMessages(16711688);
      }
      jdField_b_of_type_AndroidOsHandler.removeMessages(16711688);
      jdField_b_of_type_AndroidOsHandler.removeMessages(16711686);
      jdField_b_of_type_AndroidOsHandler.removeMessages(16711687);
    }
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getWindow().addFlags(128);
    setRequestedOrientation4Recording(false);
    jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager.a(true);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "startRecord() is called");
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder == null) {
      jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder = new QQRecorder(jdField_a_of_type_ComTencentMobileqqAppBaseActivity);
    }
    QQRecorder.RecorderParam localRecorderParam;
    if (q == 0) {
      localRecorderParam = new QQRecorder.RecorderParam(RecordParams.f, 0, 0);
    }
    for (String str = BuddyTransfileProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), null, 2, null);; str = BuddyTransfileProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), null, 25, null))
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder.a(localRecorderParam);
      if (QLog.isColorLevel()) {
        QLog.i("QQRecorder", 2, "path: " + str);
      }
      jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder.a(paramOnQQRecorderListener);
      AudioUtil.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, true);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "QQRecorder start() is called,time is:" + System.currentTimeMillis());
      }
      jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder.a(str);
      return;
      localRecorderParam = new QQRecorder.RecorderParam(RecordParams.i, 16000, 1);
    }
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderNotReady() is called,path is:" + paramString);
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    AudioUtil.b(2131165187, false);
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    AudioUtil.b(2131165187, false);
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderPrepare() is called");
    }
    jdField_b_of_type_AndroidOsHandler.post(new kst(this));
    a(paramString, true, paramRecorderParam);
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam, double paramDouble)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderEnd() is called,path is:" + paramString);
    }
    jdField_b_of_type_AndroidOsHandler.removeMessages(1);
    int i1 = b();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "fateOfRecorder is:" + i1);
    }
    if (i1 == 102)
    {
      PttBuffer.b(paramString);
      paramRecorderParam = jdField_a_of_type_AndroidOsHandler.obtainMessage(102);
      obj = paramString;
      jdField_a_of_type_AndroidOsHandler.sendMessage(paramRecorderParam);
    }
    while (i1 != 1) {
      return;
    }
    PttBuffer.a(paramString);
    jdField_b_of_type_AndroidOsHandler.post(new ksz(this, paramString));
  }
  
  public void a(String paramString1, QQRecorder.RecorderParam paramRecorderParam, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderError() is called,path is:" + paramString1);
    }
    PttBuffer.a(paramString1);
    b(paramString1);
    jdField_b_of_type_AndroidOsHandler.removeMessages(1);
    jdField_b_of_type_AndroidOsHandler.post(new ksy(this));
  }
  
  public void a(String paramString, boolean paramBoolean, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQRecorder", 2, "onRecorderPerpare path = " + paramString);
    }
    paramRecorderParam = RecordParams.a(c, a);
    PttBuffer.a(paramString);
    PttBuffer.a(paramString, paramRecorderParam, paramRecorderParam.length);
    AudioUtil.b(2131165197, false);
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, int paramInt1, int paramInt2, double paramDouble, QQRecorder.RecorderParam paramRecorderParam)
  {
    PttBuffer.a(paramString, paramArrayOfByte, paramInt1);
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = false;
      jdField_b_of_type_AndroidOsHandler.removeMessages(1);
    }
    jdField_b_of_type_AndroidOsHandler.post(new kss(this, paramInt2, paramDouble));
  }
  
  public boolean a()
  {
    boolean bool1 = false;
    boolean bool2 = b();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onBackEvent() is called,isRecording is:" + bool2);
    }
    if (bool2)
    {
      b(102);
      bool1 = true;
    }
    return bool1;
  }
  
  public int b()
  {
    return g;
  }
  
  public void b()
  {
    boolean bool = b();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onPause() is called,isRecording is:" + bool);
    }
    if (bool) {
      b(102);
    }
  }
  
  public void b(int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder != null) && (!jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder.b()) && (!jdField_b_of_type_AndroidOsHandler.hasMessages(16711686)))
    {
      jdField_b_of_type_AndroidOsHandler.removeMessages(16711688);
      jdField_b_of_type_AndroidOsHandler.removeMessages(16711686);
      jdField_b_of_type_AndroidOsHandler.removeMessages(16711687);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "stopRecord() is called,time is:" + System.currentTimeMillis());
      }
      g = paramInt;
      if (jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder != null)
      {
        Message localMessage = jdField_b_of_type_AndroidOsHandler.obtainMessage(16711686);
        jdField_b_of_type_AndroidOsHandler.sendMessageDelayed(localMessage, 200L);
      }
    }
  }
  
  public void b(String paramString)
  {
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.runOnUiThread(new ksu(this));
  }
  
  public void b(String paramString, QQRecorder.RecorderParam paramRecorderParam) {}
  
  public boolean b()
  {
    return (jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder.a());
  }
  
  public int c()
  {
    s -= 200;
    jdField_b_of_type_AndroidOsHandler.sendEmptyMessageDelayed(16711687, s);
    return s + 200;
  }
  
  public void c()
  {
    boolean bool = b();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onDestroy() is called,isRecording is:" + bool);
    }
    if (bool) {
      b(1);
    }
  }
  
  public void c(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setLevel(paramInt);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setLevel(paramInt);
  }
  
  public void c(String paramString)
  {
    setRequestedOrientation4Recording(true);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getWindow().clearFlags(128);
  }
  
  public void c(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onInitFailed() is called");
    }
    jdField_b_of_type_AndroidOsHandler.post(new ksx(this));
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.reset() is called");
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840215);
    jdField_a_of_type_AndroidWidgetImageView.setContentDescription("开始录音");
    jdField_b_of_type_AndroidWidgetTextView.setText(AudioPanel.a(0.0D));
    if ((jdField_a_of_type_AndroidWidgetPopupWindow == null) || (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {}
    try
    {
      jdField_a_of_type_AndroidWidgetPopupWindow.dismiss();
      jdField_a_of_type_AndroidWidgetPopupWindow = null;
      if (jdField_a_of_type_AndroidViewView != null)
      {
        if (jdField_a_of_type_AndroidViewView.getParent() != null) {
          ((ViewGroup)jdField_a_of_type_AndroidViewView.getParent()).removeView(jdField_a_of_type_AndroidViewView);
        }
        jdField_a_of_type_AndroidViewView = null;
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.reset(),dismiss topMaskPanel caused exception,it is no matter.", localException);
        }
      }
    }
  }
  
  public void d(String paramString)
  {
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.runOnUiThread(new ksv(this));
  }
  
  public void e()
  {
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(0);
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
  }
  
  public void f()
  {
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
  }
  
  public void onClick(View paramView)
  {
    int i1 = paramView.getId();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onClick() is called");
    }
    if (i1 == 2131299346)
    {
      boolean bool = b();
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "isRecording is:" + bool);
      }
      if (bool) {
        b(102);
      }
    }
    else
    {
      return;
    }
    paramView = Environment.getExternalStorageDirectory();
    label115:
    int i2;
    if ((paramView.exists()) && (paramView.canWrite()))
    {
      i1 = 1;
      if ((!Environment.getExternalStorageState().equals("mounted")) || (i1 == 0)) {
        break label213;
      }
      i1 = 1;
      i2 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getTitleBarHeight();
      if (i1 == 0) {
        break label298;
      }
      if (new StatFs(Environment.getExternalStorageDirectory().getAbsolutePath()).getAvailableBlocks() <= 1) {
        break label280;
      }
      if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
        break label218;
      }
      QQToast.a(BaseApplication.getContext(), 2131367775, 0).a();
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Voice_record", "Voice_record_clk", 0, 0, "", "", "", "");
      return;
      i1 = 0;
      break;
      label213:
      i1 = 0;
      break label115;
      label218:
      if (AudioHelper.b(1))
      {
        ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity);
      }
      else
      {
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840214);
        jdField_a_of_type_AndroidWidgetImageView.setContentDescription("ֹͣ停止录音");
        a(this);
        setFateOfRecorder(102);
        getWindowVisibleDisplayFrame(new Rect());
        continue;
        label280:
        QQToast.a(BaseApplication.getContext(), 2131367410, 0).b(i2);
        continue;
        label298:
        QQToast.a(BaseApplication.getContext(), 2131367409, 0).b(i2);
      }
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    super.onTouchEvent(paramMotionEvent);
    return b();
  }
  
  public void setFateOfRecorder(int paramInt)
  {
    g = paramInt;
  }
  
  public void setRequestedOrientation4Recording(boolean paramBoolean)
  {
    int i1 = 0;
    int i2 = 1;
    if (!paramBoolean)
    {
      r = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getRequestedOrientation();
      int i3 = getResourcesgetConfigurationorientation;
      Object localObject;
      if (!VersionUtils.b()) {
        if (i3 == 1)
        {
          localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
          i1 = i2;
          if (VersionUtils.c()) {
            i1 = 7;
          }
          ((BaseActivity)localObject).setRequestedOrientation(i1);
        }
      }
      label66:
      do
      {
        do
        {
          do
          {
            break label66;
            do
            {
              return;
            } while (i3 != 2);
            localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
            if (VersionUtils.c()) {}
            for (i1 = 6;; i1 = 0)
            {
              ((BaseActivity)localObject).setRequestedOrientation(i1);
              return;
            }
            if (VersionUtils.f())
            {
              localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getWindowManager().getDefaultDisplay();
              i2 = ((Display)localObject).getRotation();
              Point localPoint = new Point();
              ((Display)localObject).getSize(localPoint);
              if ((i2 == 0) || (i2 == 2)) {
                if (x > y) {
                  if (i2 != 0) {}
                }
              }
              for (;;)
              {
                jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setRequestedOrientation(i1);
                return;
                i1 = 8;
                continue;
                if (i2 == 0)
                {
                  i1 = 1;
                }
                else
                {
                  i1 = 9;
                  continue;
                  if (x > y)
                  {
                    if (i2 != 1) {
                      i1 = 8;
                    }
                  }
                  else if (i2 == 1) {
                    i1 = 9;
                  } else {
                    i1 = 1;
                  }
                }
              }
            }
            i1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getWindowManager().getDefaultDisplay().getRotation();
            if ((i1 != 0) && (i1 != 1)) {
              break;
            }
            if (i3 == 1)
            {
              jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setRequestedOrientation(1);
              return;
            }
          } while (i3 != 2);
          jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setRequestedOrientation(0);
          return;
        } while ((i1 != 2) && (i1 != 3));
        if (i3 == 1)
        {
          jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setRequestedOrientation(9);
          return;
        }
      } while (i3 != 2);
      jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setRequestedOrientation(8);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setRequestedOrientation(r);
  }
  
  public void setTimeOutTime(int paramInt)
  {
    s = paramInt;
  }
}
