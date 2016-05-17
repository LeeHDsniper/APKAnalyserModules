package com.tencent.mobileqq.activity.shortvideo;

import android.app.Activity;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.media.MediaMetadataRetriever;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager.DpcAccountNames;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.dc.DCShortVideo;
import com.tencent.mobileqq.shortvideo.ShortVideoBusiManager;
import com.tencent.mobileqq.shortvideo.ShortVideoDownloadInfo;
import com.tencent.mobileqq.shortvideo.ShortVideoReq;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.ShortVideoDownloadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.immersive.ImmersiveTitleBar2;
import java.io.File;
import java.util.concurrent.atomic.AtomicBoolean;
import mon;
import mos;
import mot;
import mou;
import mov;
import mow;
import mox;
import moy;
import moz;
import mpa;
import mpb;
import mpc;
import mpd;
import mpe;
import mqq.os.MqqHandler;
import org.json.JSONObject;

public class ShortVideoPlayActivity
  extends BaseActivity
  implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnInfoListener, SurfaceHolder.Callback, View.OnClickListener, FileTransferManager.Callback
{
  private static float jdField_a_of_type_Float = 0.05F;
  public static final int a = 0;
  public static final String a = "ShortVideoPlayActivity";
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  static final int jdField_j_of_type_Int = 250;
  static final String jdField_j_of_type_JavaLangString = "state_play_position";
  static final int jdField_k_of_type_Int = 2500;
  static final int jdField_l_of_type_Int = 100;
  public static final int m = 4;
  private static final int u = 512000;
  long jdField_a_of_type_Long = -1L;
  BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = new mpb(this);
  public Context a;
  Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private MediaPlayer.OnBufferingUpdateListener jdField_a_of_type_AndroidMediaMediaPlayer$OnBufferingUpdateListener = new mpd(this);
  public MediaPlayer a;
  SurfaceView jdField_a_of_type_AndroidViewSurfaceView;
  public View a;
  Animation.AnimationListener jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener = new moz(this);
  Animation jdField_a_of_type_AndroidViewAnimationAnimation;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  public RelativeLayout a;
  SeekBar.OnSeekBarChangeListener jdField_a_of_type_AndroidWidgetSeekBar$OnSeekBarChangeListener = new mot(this);
  public SeekBar a;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  public MessageForShortVideo a;
  ImmersiveTitleBar2 jdField_a_of_type_ComTencentWidgetImmersiveImmersiveTitleBar2;
  public final Runnable a;
  public final MqqHandler a;
  public boolean a;
  long jdField_b_of_type_Long = -1L;
  public View b;
  Animation.AnimationListener jdField_b_of_type_AndroidViewAnimationAnimation$AnimationListener = new mpa(this);
  Animation jdField_b_of_type_AndroidViewAnimationAnimation;
  ImageView jdField_b_of_type_AndroidWidgetImageView;
  private RelativeLayout jdField_b_of_type_AndroidWidgetRelativeLayout;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  final Runnable jdField_b_of_type_JavaLangRunnable = new moy(this);
  public String b;
  boolean jdField_b_of_type_Boolean = false;
  public long c;
  Animation jdField_c_of_type_AndroidViewAnimationAnimation;
  ImageView jdField_c_of_type_AndroidWidgetImageView;
  TextView jdField_c_of_type_AndroidWidgetTextView;
  public String c;
  public boolean c;
  public long d;
  Animation jdField_d_of_type_AndroidViewAnimationAnimation;
  private TextView jdField_d_of_type_AndroidWidgetTextView;
  public String d;
  boolean jdField_d_of_type_Boolean = false;
  private long jdField_e_of_type_Long = 0L;
  String jdField_e_of_type_JavaLangString;
  boolean jdField_e_of_type_Boolean;
  public int f;
  private long jdField_f_of_type_Long = 0L;
  String jdField_f_of_type_JavaLangString;
  boolean jdField_f_of_type_Boolean = false;
  public int g;
  public String g;
  boolean g;
  public int h;
  public String h;
  boolean h;
  public int i;
  String i;
  public boolean i;
  private boolean jdField_j_of_type_Boolean;
  public String k;
  private boolean jdField_k_of_type_Boolean;
  String jdField_l_of_type_JavaLangString;
  private boolean jdField_l_of_type_Boolean = false;
  private String m;
  public int n;
  public int o;
  int p;
  public int q = -1;
  int r;
  public int s;
  int t = 1;
  private int v;
  private int w;
  private int x;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ShortVideoPlayActivity()
  {
    jdField_f_of_type_Int = 0;
    jdField_g_of_type_Int = 0;
    jdField_c_of_type_JavaLangString = "";
    jdField_d_of_type_JavaLangString = "";
    jdField_i_of_type_Int = -1;
    jdField_a_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_k_of_type_JavaLangString = "0";
    j = false;
    jdField_g_of_type_Boolean = false;
    jdField_h_of_type_Boolean = false;
    jdField_a_of_type_MqqOsMqqHandler = new mon(this);
    jdField_a_of_type_JavaLangRunnable = new mox(this);
    jdField_i_of_type_Boolean = true;
  }
  
  private ShortVideoDownloadInfo a()
  {
    ShortVideoDownloadInfo localShortVideoDownloadInfo = new ShortVideoDownloadInfo();
    try
    {
      JSONObject localJSONObject = new JSONObject(jdField_e_of_type_JavaLangString);
      if (localJSONObject != null)
      {
        jdField_a_of_type_Int = localJSONObject.getInt("busi_type");
        jdField_a_of_type_JavaLangString = localJSONObject.getString("file_uuid");
        jdField_e_of_type_JavaLangString = localJSONObject.getString("file_md5");
        jdField_b_of_type_Long = localJSONObject.getInt("file_size");
        jdField_b_of_type_Int = q;
        jdField_b_of_type_JavaLangString = jdField_f_of_type_JavaLangString;
        jdField_c_of_type_JavaLangString = jdField_k_of_type_JavaLangString;
        jdField_d_of_type_JavaLangString = jdField_k_of_type_JavaLangString;
        jdField_g_of_type_Int = 1001;
        jdField_h_of_type_JavaLangString = a(jdField_e_of_type_JavaLangString);
        return localShortVideoDownloadInfo;
      }
      return null;
    }
    catch (Exception localException) {}
    return null;
  }
  
  private String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder(AppConstants.bd);
    localStringBuilder.append("shortvideo");
    localStringBuilder.append(File.separator);
    localStringBuilder.append("publicaccount");
    localStringBuilder.append(File.separator);
    localStringBuilder.append(jdField_f_of_type_JavaLangString);
    localStringBuilder.append(File.separator);
    localStringBuilder.append(paramString);
    localStringBuilder.append(".");
    localStringBuilder.append("mp4");
    return localStringBuilder.toString();
  }
  
  private void u()
  {
    if ((VersionUtils.g()) && (!ShortVideoUtils.c()) && (jdField_a_of_type_AndroidWidgetRelativeLayout != null))
    {
      jdField_a_of_type_AndroidWidgetRelativeLayout.setSystemUiVisibility(5894);
      jdField_a_of_type_ComTencentWidgetImmersiveImmersiveTitleBar2.setVisibility(8);
    }
  }
  
  private void v()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "startDownLoadVideoForPubAccount: " + jdField_e_of_type_JavaLangString);
    }
    Object localObject = Environment.getExternalStorageDirectory();
    int i1;
    if ((((File)localObject).exists()) && (((File)localObject).canWrite()))
    {
      i1 = 1;
      if ((!Environment.getExternalStorageState().equals("mounted")) || (i1 == 0)) {
        break label112;
      }
      i1 = 1;
      label73:
      if (i1 != 0) {
        break label117;
      }
      QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131368675, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
    }
    label112:
    label117:
    ShortVideoDownloadInfo localShortVideoDownloadInfo;
    do
    {
      return;
      i1 = 0;
      break;
      i1 = 0;
      break label73;
      localObject = ShortVideoBusiManager.a(2, 0);
      localShortVideoDownloadInfo = a();
    } while (localShortVideoDownloadInfo == null);
    a = localShortVideoDownloadInfo;
    ShortVideoBusiManager.a((ShortVideoReq)localObject, app);
    jdField_l_of_type_JavaLangString = jdField_h_of_type_JavaLangString;
  }
  
  private void w()
  {
    Object localObject = app.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
    if ((localObject != null) && ((localObject instanceof ShortVideoDownloadProcessor)))
    {
      localObject = (ShortVideoDownloadProcessor)localObject;
      if (!((ShortVideoDownloadProcessor)localObject).c()) {
        ((ShortVideoDownloadProcessor)localObject).k();
      }
    }
  }
  
  String a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return "null";
    case 0: 
      return " idle ";
    case 1: 
      return " playing ";
    case 2: 
      return " pause ";
    case 3: 
      return " error ";
    }
    return " buffering ";
  }
  
  void a()
  {
    boolean bool2 = true;
    Object localObject = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.ProgressVideoDownloadSwitch.name(), "1|1|1");
    if ((localObject != null) && (((String)localObject).length() > 0))
    {
      localObject = ((String)localObject).split("\\|");
      if ((localObject == null) || (localObject.length < 3)) {
        break label208;
      }
    }
    for (;;)
    {
      try
      {
        i2 = Integer.valueOf(localObject[0]).intValue();
        if (!QLog.isColorLevel()) {
          break label165;
        }
      }
      catch (NumberFormatException localNumberFormatException1)
      {
        for (;;)
        {
          try
          {
            i1 = Integer.valueOf(localObject[1]).intValue();
          }
          catch (NumberFormatException localNumberFormatException2)
          {
            int i4;
            boolean bool1;
            i1 = 0;
            continue;
          }
          try
          {
            i3 = Integer.valueOf(localObject[2]).intValue();
            i4 = i2;
            i2 = i3;
            i3 = i1;
            i1 = i4;
            if (i1 != 1) {
              continue;
            }
            bool1 = true;
            jdField_h_of_type_Boolean = bool1;
            if (i3 != 1) {
              continue;
            }
            bool1 = true;
            jdField_g_of_type_Boolean = bool1;
            if (i2 != 1) {
              continue;
            }
            bool1 = bool2;
            jdField_f_of_type_Boolean = bool1;
            return;
          }
          catch (NumberFormatException localNumberFormatException3) {}
        }
        localNumberFormatException1 = localNumberFormatException1;
        i1 = 0;
        i2 = 0;
      }
      QLog.e("ShortVideoPlayActivity", 2, "<parseDownloadSwitch>get DpcConfig Erro", localNumberFormatException1);
      label165:
      int i3 = i1;
      i4 = 0;
      int i1 = i2;
      int i2 = i4;
      continue;
      bool1 = false;
      continue;
      bool1 = false;
      continue;
      bool1 = false;
      continue;
      label208:
      i2 = 0;
      i3 = 0;
      i1 = 0;
    }
  }
  
  public void a(int paramInt)
  {
    if ((paramInt != 0) && (paramInt != 1) && (paramInt != 2) && (paramInt != 3) && (paramInt != 4)) {}
    do
    {
      do
      {
        return;
      } while (paramInt == jdField_f_of_type_Int);
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "changePlayState, " + a(jdField_f_of_type_Int) + " ==> " + a(paramInt));
      }
      jdField_f_of_type_Int = paramInt;
      switch (paramInt)
      {
      default: 
        return;
      case 0: 
        jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840754);
        return;
      case 1: 
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840755);
        jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_a_of_type_MqqOsMqqHandler.post(jdField_a_of_type_JavaLangRunnable);
        d();
        if (jdField_g_of_type_Int == 1)
        {
          r();
          return;
        }
        break;
      }
    } while ((jdField_g_of_type_Int != 0) && (jdField_g_of_type_Int != 2));
    jdField_b_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
    jdField_b_of_type_AndroidWidgetImageView.setEnabled(true);
    return;
    if (jdField_i_of_type_Boolean)
    {
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_AndroidViewView.setVisibility(0);
    }
    jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840754);
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
    return;
    jdField_b_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
    jdField_b_of_type_AndroidWidgetImageView.setEnabled(false);
    Drawable localDrawable = getResources().getDrawable(2130838195);
    paramInt = AIOUtils.a(20.0F, getResources());
    localDrawable.setBounds(0, 0, paramInt, paramInt);
    jdField_d_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(10);
    jdField_d_of_type_AndroidWidgetTextView.setCompoundDrawables(localDrawable, null, null, null);
    ((Animatable)localDrawable).start();
    jdField_a_of_type_MqqOsMqqHandler.post(jdField_a_of_type_JavaLangRunnable);
    return;
    if (jdField_i_of_type_Boolean)
    {
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_AndroidViewView.setVisibility(0);
    }
    jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840754);
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
  }
  
  public void a(long paramLong)
  {
    if ((jdField_d_of_type_AndroidWidgetTextView != null) && (jdField_d_of_type_AndroidWidgetTextView.getVisibility() == 0))
    {
      String str = ShortVideoUtils.a(jdField_a_of_type_AndroidContentContext, paramLong);
      jdField_d_of_type_AndroidWidgetTextView.setText(str + "/s");
    }
  }
  
  void a(Intent paramIntent)
  {
    jdField_b_of_type_JavaLangString = paramIntent.getExtras().getString("file_send_path");
    jdField_g_of_type_Int = paramIntent.getExtras().getInt("video_play_caller", 0);
    jdField_c_of_type_JavaLangString = paramIntent.getExtras().getString("ad_gdt");
    jdField_d_of_type_JavaLangString = paramIntent.getExtras().getString("msg_id");
    q = paramIntent.getExtras().getInt("from_uin_type");
    jdField_k_of_type_JavaLangString = paramIntent.getExtras().getString("from_session_uin");
    jdField_h_of_type_Int = paramIntent.getExtras().getInt("uintype");
    jdField_e_of_type_JavaLangString = paramIntent.getExtras().getString("struct_msg_video_info");
    jdField_f_of_type_JavaLangString = paramIntent.getExtras().getString("from_uin");
    a();
    if (jdField_g_of_type_Int == 0)
    {
      jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo = ((MessageForShortVideo)paramIntent.getExtras().getParcelable("key_message_for_shortvideo"));
      if (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo == null)
      {
        QQToast.a(this, 1, "参数错误，传入的shortvideoMsg为空！", 0).b(getTitleBarHeight());
        finish();
      }
    }
    while (!QLog.isColorLevel())
    {
      return;
      jdField_g_of_type_JavaLangString = paramIntent.getExtras().getString("file_shortvideo_md5");
      jdField_h_of_type_JavaLangString = paramIntent.getExtras().getString("thumbfile_md5");
      jdField_h_of_type_Int = paramIntent.getExtras().getInt("uintype");
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "initData(), PLAY_CALLER_SHORT_VIDEO, msg = " + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.toLogString());
      }
    }
    QLog.d("ShortVideoPlayActivity", 2, "initData(): mVideoPath=" + jdField_b_of_type_JavaLangString + ", mPlayCallerType=" + jdField_g_of_type_Int + ", mCursessionType = " + q + ", mCurSessionUin = " + jdField_k_of_type_JavaLangString + ", mUinType = " + jdField_h_of_type_Int);
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    if (((jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo == null) || (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq != jdField_c_of_type_Long)) && (jdField_g_of_type_Int != 2)) {}
    do
    {
      do
      {
        do
        {
          do
          {
            return;
          } while ((e != 6) && (e != 17) && (e != 9) && (e != 20));
          switch (M)
          {
          case 2001: 
          case 2004: 
          default: 
            return;
          }
        } while (jdField_a_of_type_Long == 0L);
        jdField_c_of_type_Long = jdField_f_of_type_Long;
        jdField_d_of_type_Long = jdField_a_of_type_Long;
        w = ((int)(100L * jdField_f_of_type_Long / jdField_a_of_type_Long));
        jdField_a_of_type_AndroidWidgetSeekBar.setSecondaryProgress(w);
      } while ((!jdField_k_of_type_Boolean) || ((float)jdField_c_of_type_Long <= jdField_a_of_type_Float * (float)jdField_d_of_type_Long) || (j) || (jdField_b_of_type_JavaLangString != null) || (!b()));
      if (QLog.isColorLevel()) {
        QLog.e("ShortVideoPlayActivity", 2, "STATUS_RECV_PROCESS: mTransferedSize > " + jdField_a_of_type_Float * (float)jdField_d_of_type_Long + ", data ready and need play!!!");
      }
      jdField_b_of_type_JavaLangString = m;
      j = true;
      r = ((int)(System.currentTimeMillis() - jdField_b_of_type_Long));
      b(0);
      return;
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "handleMessage STATUS_RECV_FINISHED");
      }
      w = 100;
    } while ((jdField_k_of_type_Boolean) || (j) || (!b()));
    if (jdField_g_of_type_Int == 2) {}
    for (jdField_b_of_type_JavaLangString = jdField_l_of_type_JavaLangString;; jdField_b_of_type_JavaLangString = ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, "mp4"))
    {
      j = true;
      if (QLog.isColorLevel()) {
        QLog.e("ShortVideoPlayActivity", 2, "STATUS_RECV_FINISHED not mSupportProgressive download finish and need play!!!");
      }
      r = ((int)(System.currentTimeMillis() - jdField_b_of_type_Long));
      b(0);
      return;
    }
    QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371160, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
    return;
    QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371161, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
    return;
    QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371162, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
  }
  
  protected void a(MessageForShortVideo paramMessageForShortVideo)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "startDownloadVideo: " + paramMessageForShortVideo.toString());
    }
    if (videoFileStatus == 5002)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "短视频已过期不启动下载流程");
      }
      return;
    }
    Object localObject = Environment.getExternalStorageDirectory();
    if ((((File)localObject).exists()) && (((File)localObject).canWrite()))
    {
      i1 = 1;
      if ((!Environment.getExternalStorageState().equals("mounted")) || (i1 == 0)) {
        break label138;
      }
    }
    label138:
    for (int i1 = 1;; i1 = 0)
    {
      if (i1 != 0) {
        break label143;
      }
      QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131368675, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      return;
      i1 = 0;
      break;
    }
    label143:
    localObject = ShortVideoBusiManager.a(2, 0);
    ShortVideoDownloadInfo localShortVideoDownloadInfo = paramMessageForShortVideo.getDownloadInfo(jdField_g_of_type_Int);
    jdField_h_of_type_JavaLangString = ShortVideoUtils.a(paramMessageForShortVideo, "mp4");
    String str = ShortVideoUtils.d(NetworkUtil.a(jdField_a_of_type_AndroidContentContext));
    if ((istroop == 0) || (istroop == 1008))
    {
      jdField_g_of_type_Int = 1001;
      ReportController.b(app, "CliOper", "", "", "0X8004672", "0X8004672", 0, 0, "", "1", str, "");
    }
    for (;;)
    {
      jdField_h_of_type_Int = 1;
      k = 2;
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, " startDownloadVideo downloadvideo fileType==" + jdField_g_of_type_Int + ", uniseq:" + uniseq);
      }
      ((ShortVideoReq)localObject).a(localShortVideoDownloadInfo);
      ((ShortVideoReq)localObject).a(paramMessageForShortVideo);
      ShortVideoBusiManager.a((ShortVideoReq)localObject, app);
      return;
      if (istroop == 3000)
      {
        jdField_g_of_type_Int = 1005;
        ReportController.b(app, "CliOper", "", "", "0X8004672", "0X8004672", 0, 0, "", "2", str, "");
      }
      else if (istroop == 1)
      {
        jdField_g_of_type_Int = 1003;
        ReportController.b(app, "CliOper", "", "", "0X8004672", "0X8004672", 0, 0, "", "3", str, "");
      }
      else
      {
        ReportController.b(app, "CliOper", "", "", "0X8004672", "0X8004672", 0, 0, "", "4", str, "");
      }
    }
  }
  
  public void a(String paramString1, int paramInt1, int paramInt2, String paramString2)
  {
    String str;
    if (!TextUtils.isEmpty(paramString1)) {
      str = "0";
    }
    try
    {
      JSONObject localJSONObject = new JSONObject(paramString1);
      paramString1 = str;
      if (localJSONObject.has("ad_id")) {
        paramString1 = localJSONObject.getString("ad_id");
      }
    }
    catch (Exception paramString1)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e("ShortVideoPlayActivity", 2, "parse ad_id error");
        }
        paramString1 = "0";
      }
    }
    ReportController.b(app, "P_CliOper", "Pb_account_lifeservice", "", "0X8005D93", "0X8005D93", paramInt2, 1, paramInt1, paramString1, paramString2, "", "");
  }
  
  public boolean a()
  {
    return (jdField_f_of_type_Int == 1) && (jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying());
  }
  
  void b()
  {
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131296923));
    jdField_a_of_type_AndroidWidgetRelativeLayout.getViewTreeObserver().addOnGlobalLayoutListener(new mpc(this));
    jdField_a_of_type_ComTencentWidgetImmersiveImmersiveTitleBar2 = ((ImmersiveTitleBar2)findViewById(2131297032));
    jdField_a_of_type_ComTencentWidgetImmersiveImmersiveTitleBar2.a(-870178270);
    u();
    jdField_a_of_type_AndroidViewSurfaceView = ((SurfaceView)findViewById(2131302125));
    jdField_a_of_type_AndroidViewView = findViewById(2131298182);
    jdField_b_of_type_AndroidViewView = findViewById(2131302131);
    jdField_c_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131302126));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131302127));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298183));
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131302133));
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131302135));
    jdField_a_of_type_AndroidWidgetSeekBar = ((SeekBar)findViewById(2131302134));
    jdField_a_of_type_AndroidWidgetSeekBar.setMax(100);
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131302132));
    jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(this);
    jdField_a_of_type_AndroidViewSurfaceView.setOnClickListener(this);
    jdField_a_of_type_AndroidViewSurfaceView.getHolder().setType(3);
    jdField_a_of_type_AndroidViewSurfaceView.getHolder().addCallback(this);
    jdField_a_of_type_AndroidViewSurfaceView.getHolder().setFormat(-3);
    jdField_a_of_type_AndroidWidgetSeekBar.setOnSeekBarChangeListener(jdField_a_of_type_AndroidWidgetSeekBar$OnSeekBarChangeListener);
    jdField_b_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131302128));
    jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131302129));
    jdField_b_of_type_AndroidViewAnimationAnimation = AnimationUtils.loadAnimation(this, 2130968784);
    jdField_a_of_type_AndroidViewAnimationAnimation = AnimationUtils.loadAnimation(this, 2130968783);
    jdField_d_of_type_AndroidViewAnimationAnimation = AnimationUtils.loadAnimation(this, 2130968782);
    jdField_c_of_type_AndroidViewAnimationAnimation = AnimationUtils.loadAnimation(this, 2130968781);
    jdField_a_of_type_AndroidViewAnimationAnimation.setAnimationListener(jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener);
    jdField_d_of_type_AndroidViewAnimationAnimation.setAnimationListener(jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener);
    jdField_b_of_type_AndroidViewAnimationAnimation.setAnimationListener(jdField_b_of_type_AndroidViewAnimationAnimation$AnimationListener);
    Object localObject1;
    if ((jdField_g_of_type_Int == 1) || (jdField_g_of_type_Int == 2) || (jdField_h_of_type_Int == 9501))
    {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(4);
      if ((jdField_g_of_type_Int == 2) && (jdField_e_of_type_JavaLangString != null)) {
        localObject1 = "";
      }
    }
    try
    {
      localObject2 = a(new JSONObject(jdField_e_of_type_JavaLangString).getString("file_md5"));
      localObject1 = localObject2;
    }
    catch (Exception localException)
    {
      Object localObject2;
      for (;;) {}
    }
    localObject2 = new File((String)localObject1);
    if ((((File)localObject2).exists()) && (((File)localObject2).isFile())) {
      jdField_b_of_type_JavaLangString = ((String)localObject1);
    }
    label725:
    label1018:
    label1023:
    label1039:
    for (;;)
    {
      return;
      v();
      localObject1 = FileTransferManager.a(app);
      if (localObject1 != null) {
        ((FileTransferManager)localObject1).a(jdField_a_of_type_AndroidWidgetRelativeLayout, this);
      }
      jdField_a_of_type_AndroidWidgetSeekBar.setSecondaryProgress(w);
      jdField_b_of_type_JavaLangString = null;
      a(4);
      return;
      if (jdField_g_of_type_Int == 0)
      {
        localObject1 = ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, "mp4");
        if (FileUtils.a((String)localObject1)) {
          break;
        }
        if (QLog.isColorLevel()) {
          QLog.e("ShortVideoPlayActivity", 2, "initData, #PLAY_CALLER_SHORT_VIDEO#, 视频文件不存在, startDownload...");
        }
        a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo);
        localObject1 = FileTransferManager.a(app);
        if (localObject1 != null) {
          ((FileTransferManager)localObject1).a(jdField_a_of_type_AndroidWidgetRelativeLayout, this);
        }
        localObject1 = ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.thumbMD5, "jpg");
        boolean bool1;
        if (FileUtils.b((String)localObject1))
        {
          localObject1 = URLDrawable.getDrawable(new File((String)localObject1), null);
          jdField_c_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject1);
          jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
          m = ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo);
          boolean bool2 = ProgressiveUtils.a.get();
          boolean bool3 = ProgressiveUtils.a();
          if ((!bool2) || (bool3) || (!jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.supportProgressive)) {
            break label1018;
          }
          bool1 = true;
          jdField_k_of_type_Boolean = bool1;
          if (QLog.isColorLevel()) {
            QLog.d("ShortVideoPlayActivity", 2, "onCreateView(), enableProgressive=" + bool2 + ", inBlackList=" + bool3 + ",msgSupportProgressive=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.supportProgressive + " ===> mSupportProgressive=" + jdField_k_of_type_Boolean);
          }
          jdField_c_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.transferedSize;
          jdField_d_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileSize;
          w = ((int)(100L * jdField_c_of_type_Long / jdField_d_of_type_Long));
          v = 0;
          x = 0;
          jdField_e_of_type_Boolean = true;
          jdField_a_of_type_AndroidWidgetSeekBar.setSecondaryProgress(w);
          if ((!jdField_k_of_type_Boolean) || ((float)jdField_c_of_type_Long <= jdField_a_of_type_Float * (float)jdField_d_of_type_Long)) {
            break label1023;
          }
          j = true;
          jdField_b_of_type_JavaLangString = m;
        }
        for (;;)
        {
          if (!QLog.isColorLevel()) {
            break label1039;
          }
          QLog.d("ShortVideoPlayActivity", 2, "onCreateView(), mSupportProgressive=" + jdField_k_of_type_Boolean + ",mFirstPlayReady=" + j + ",mCacheProgress=" + w + ",mTransferedSize=" + jdField_c_of_type_Long);
          return;
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.e("ShortVideoPlayActivity", 2, "onCreateView(), thumbFile no exists. thumbPath=" + (String)localObject1);
          break;
          bool1 = false;
          break label725;
          j = false;
          jdField_b_of_type_JavaLangString = null;
          a(4);
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onCreateView(), #PLAY_CALLER_SHORT_VIDEO#, 视频文件存在，直接播放");
    }
    jdField_b_of_type_JavaLangString = ((String)localObject1);
    j = true;
    w = 100;
    jdField_a_of_type_AndroidWidgetSeekBar.setSecondaryProgress(100);
    jdField_e_of_type_Boolean = false;
  }
  
  public void b(int paramInt)
  {
    for (;;)
    {
      try
      {
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoPlayActivity", 2, "#play#, msec=" + paramInt);
        }
        if (TextUtils.isEmpty(jdField_b_of_type_JavaLangString))
        {
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.e("ShortVideoPlayActivity", 2, "#play#, mVideoPath should not be null!");
          return;
        }
        if (jdField_g_of_type_Int == 1) {
          q();
        }
        if (jdField_a_of_type_AndroidMediaMediaPlayer != null)
        {
          jdField_a_of_type_AndroidMediaMediaPlayer.stop();
          jdField_a_of_type_AndroidMediaMediaPlayer.release();
          jdField_a_of_type_AndroidMediaMediaPlayer = null;
        }
        jdField_a_of_type_AndroidMediaMediaPlayer = new MediaPlayer();
        jdField_a_of_type_AndroidMediaMediaPlayer.setAudioStreamType(3);
        jdField_a_of_type_AndroidMediaMediaPlayer.setDisplay(jdField_a_of_type_AndroidViewSurfaceView.getHolder());
        jdField_a_of_type_AndroidMediaMediaPlayer.setOnCompletionListener(this);
        jdField_a_of_type_AndroidMediaMediaPlayer.setOnErrorListener(this);
        jdField_a_of_type_AndroidMediaMediaPlayer.setOnBufferingUpdateListener(jdField_a_of_type_AndroidMediaMediaPlayer$OnBufferingUpdateListener);
        jdField_a_of_type_AndroidMediaMediaPlayer.setDataSource(jdField_b_of_type_JavaLangString);
        jdField_a_of_type_AndroidMediaMediaPlayer.prepareAsync();
        jdField_a_of_type_AndroidMediaMediaPlayer.setOnPreparedListener(new mpe(this, paramInt));
        if ((jdField_g_of_type_Int == 0) && (!jdField_a_of_type_Boolean))
        {
          if (jdField_h_of_type_Int == 0)
          {
            ReportController.b(app, "CliOper", "", "", "0X8004673", "0X8004673", 0, 0, "", "1", "", "");
            jdField_a_of_type_Boolean = true;
          }
        }
        else
        {
          if (jdField_b_of_type_Long >= 0L) {
            jdField_a_of_type_Long += System.currentTimeMillis() - jdField_b_of_type_Long;
          }
          jdField_b_of_type_Long = System.currentTimeMillis();
          return;
        }
      }
      catch (Exception localException)
      {
        QLog.e("ShortVideoPlayActivity", 1, "#play#, msec=" + paramInt, localException);
        j();
        k();
        return;
      }
      if (jdField_h_of_type_Int == 3000)
      {
        ReportController.b(app, "CliOper", "", "", "0X8004673", "0X8004673", 0, 0, "", "2", "", "");
        jdField_a_of_type_Boolean = true;
      }
      else if (jdField_h_of_type_Int == 1)
      {
        ReportController.b(app, "CliOper", "", "", "0X8004673", "0X8004673", 0, 0, "", "3", "", "");
        jdField_a_of_type_Boolean = true;
      }
      else
      {
        ReportController.b(app, "CliOper", "", "", "0X8004673", "0X8004673", 0, 0, "", "4", "", "");
        jdField_a_of_type_Boolean = true;
      }
    }
  }
  
  public boolean b()
  {
    return (jdField_f_of_type_Int == 4) && ((jdField_a_of_type_AndroidMediaMediaPlayer == null) || (!jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying()));
  }
  
  void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "startShowing : mHidden = " + jdField_i_of_type_Boolean);
    }
    if (!jdField_i_of_type_Boolean) {
      return;
    }
    f();
    jdField_a_of_type_AndroidViewView.clearAnimation();
    jdField_b_of_type_AndroidViewView.clearAnimation();
    if (!VersionUtils.d())
    {
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_AndroidViewView.setVisibility(0);
    }
    jdField_a_of_type_AndroidViewView.startAnimation(jdField_a_of_type_AndroidViewAnimationAnimation);
    jdField_b_of_type_AndroidViewView.startAnimation(jdField_d_of_type_AndroidViewAnimationAnimation);
    jdField_i_of_type_Boolean = false;
  }
  
  public void c(int paramInt)
  {
    if (jdField_b_of_type_AndroidWidgetTextView != null) {
      jdField_b_of_type_AndroidWidgetTextView.setText(ShortVideoUtils.a(paramInt) + "/" + jdField_i_of_type_JavaLangString);
    }
  }
  
  public boolean c()
  {
    return Build.MODEL.contains("M9");
  }
  
  void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "delayStartHiding");
    }
    f();
    if ((jdField_f_of_type_Int == 1) && (jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying())) {
      jdField_a_of_type_MqqOsMqqHandler.postDelayed(jdField_b_of_type_JavaLangRunnable, 2500L);
    }
  }
  
  public void doOnBackPressed()
  {
    super.doOnBackPressed();
    overridePendingTransition(0, 2130968792);
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mActNeedImmersive = false;
    super.doOnCreate(paramBundle);
    super.setContentView(2130904285);
    getWindow().addFlags(128);
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
      localStringBuilder.append("MANUFACTURER=").append(Build.MANUFACTURER).append("|");
      localStringBuilder.append("SDK_INT=").append(Build.VERSION.SDK_INT).append("|");
      QLog.i("ShortVideoPlayActivity", 2, localStringBuilder.toString());
    }
    if (paramBundle != null)
    {
      p = paramBundle.getInt("state_play_position");
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "onCreate(), savedInstanceState != null, mCurrentPosition : " + p);
      }
    }
    jdField_a_of_type_AndroidContentContext = this;
    a(super.getIntent());
    b();
    paramBundle = new IntentFilter();
    paramBundle.addAction("android.intent.action.SCREEN_OFF");
    paramBundle.addAction("tencent.av.v2q.StartVideoChat");
    registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, paramBundle);
    app.a(ShortVideoPlayActivity.class, jdField_a_of_type_MqqOsMqqHandler);
    jdField_b_of_type_Long = System.currentTimeMillis();
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "doOnDestroy");
    }
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacksAndMessages(null);
    g();
    unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
    app.a(ShortVideoPlayActivity.class);
    if (jdField_b_of_type_Long >= 0L)
    {
      jdField_a_of_type_Long += System.currentTimeMillis() - jdField_b_of_type_Long;
      if (!jdField_d_of_type_Boolean)
      {
        new DCShortVideo(BaseApplication.getContext()).a(app, 2002, jdField_i_of_type_Int / 1000, q, jdField_k_of_type_JavaLangString, jdField_a_of_type_Long / 1000L);
        jdField_d_of_type_Boolean = true;
      }
    }
    if (jdField_e_of_type_Boolean) {
      new DCShortVideo(BaseApplication.getContext()).a(jdField_k_of_type_Boolean, r, v, w, jdField_i_of_type_Int, (int)jdField_d_of_type_Long, 0, s, t, jdField_a_of_type_Long);
    }
    if ((jdField_g_of_type_Int == 0) && (w == 100) && (!TextUtils.isEmpty(m)) && (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo != null) && (FileUtils.b(ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, "mp4"))))
    {
      FileUtils.d(m);
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "doOnDestroy ==>> deleteFile: mTmpPath = " + m);
      }
    }
  }
  
  protected boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    switch (paramInt)
    {
    }
    do
    {
      return super.doOnKeyDown(paramInt, paramKeyEvent);
    } while (jdField_b_of_type_AndroidViewView.getVisibility() != 0);
    if (jdField_h_of_type_Int != 9501) {
      p();
    }
    return true;
  }
  
  public void doOnPause()
  {
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying()))
    {
      p = jdField_a_of_type_AndroidMediaMediaPlayer.getCurrentPosition();
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "pause mCurrentPosition:" + p);
      }
    }
    super.doOnPause();
  }
  
  public void doOnResume()
  {
    super.doOnResume();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "doOnResume:");
    }
    u();
    if ((Build.VERSION.SDK_INT >= 10) && (jdField_c_of_type_Boolean))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "onResume, restore last pause, mCurrentPosition=" + p);
      }
      if (jdField_g_of_type_Int != 0) {
        break label176;
      }
      if ((!TextUtils.isEmpty(jdField_b_of_type_JavaLangString)) && (FileUtils.b(jdField_b_of_type_JavaLangString)))
      {
        MediaMetadataRetriever localMediaMetadataRetriever = new MediaMetadataRetriever();
        localMediaMetadataRetriever.setDataSource(jdField_b_of_type_JavaLangString);
        jdField_a_of_type_AndroidGraphicsBitmap = localMediaMetadataRetriever.getFrameAtTime(p * 1000);
        jdField_c_of_type_AndroidWidgetImageView.setImageBitmap(jdField_a_of_type_AndroidGraphicsBitmap);
      }
    }
    for (;;)
    {
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      if (jdField_i_of_type_Boolean)
      {
        jdField_b_of_type_AndroidViewView.setVisibility(0);
        jdField_a_of_type_AndroidViewView.setVisibility(0);
      }
      return;
      label176:
      if (jdField_g_of_type_Int == 1) {
        jdField_c_of_type_AndroidWidgetImageView.setImageDrawable(new ColorDrawable(0));
      }
    }
  }
  
  protected void doOnStart()
  {
    MediaPlayerManager.a(app).a(true);
    if (VersionUtils.b()) {
      ((AudioManager)getSystemService("audio")).requestAudioFocus(null, 3, 2);
    }
    super.doOnStart();
  }
  
  protected void doOnStop()
  {
    if (VersionUtils.b()) {
      ((AudioManager)getSystemService("audio")).abandonAudioFocus(null);
    }
    super.doOnStop();
  }
  
  public void e()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "startHiding : mHidden = " + jdField_i_of_type_Boolean + ",playState:" + a(jdField_f_of_type_Int));
    }
    if (jdField_i_of_type_Boolean) {}
    do
    {
      do
      {
        return;
      } while (jdField_f_of_type_Int != 1);
      if (jdField_b_of_type_AndroidViewView.getVisibility() == 0)
      {
        jdField_b_of_type_AndroidViewView.clearAnimation();
        jdField_b_of_type_AndroidViewView.startAnimation(jdField_c_of_type_AndroidViewAnimationAnimation);
      }
    } while (jdField_a_of_type_AndroidViewView.getVisibility() != 0);
    jdField_a_of_type_AndroidViewView.clearAnimation();
    jdField_a_of_type_AndroidViewView.startAnimation(jdField_b_of_type_AndroidViewAnimationAnimation);
  }
  
  void f()
  {
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_b_of_type_JavaLangRunnable);
  }
  
  void g()
  {
    if (jdField_a_of_type_AndroidMediaMediaPlayer != null)
    {
      jdField_a_of_type_AndroidMediaMediaPlayer.stop();
      jdField_a_of_type_AndroidMediaMediaPlayer.release();
      jdField_a_of_type_AndroidMediaMediaPlayer = null;
    }
    a(0);
  }
  
  public void h()
  {
    int i1 = jdField_a_of_type_AndroidMediaMediaPlayer.getDuration();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "initDuration: duration=" + i1);
    }
    if (i1 != 0)
    {
      jdField_i_of_type_Int = i1;
      jdField_i_of_type_JavaLangString = ShortVideoUtils.a(jdField_i_of_type_Int);
    }
  }
  
  public void i()
  {
    int i1 = jdField_a_of_type_AndroidMediaMediaPlayer.getVideoWidth();
    int i2 = jdField_a_of_type_AndroidMediaMediaPlayer.getVideoHeight();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "adjustVideoRatio, videoWith:" + i1 + ",videoHeight:" + i2);
    }
    if ((o == 0) || (n == 0) || (i1 == 0) || (i2 == 0)) {
      return;
    }
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    if (o / n > i2 / i1)
    {
      f1 = n;
      i1 = (int)(i2 * f1 / i1);
      i1 = (int)((o - i1) / 2.0F);
      localLayoutParams.setMargins(0, i1, 0, i1);
      jdField_a_of_type_AndroidViewSurfaceView.setLayoutParams(localLayoutParams);
      return;
    }
    float f1 = o;
    i1 = (int)(i1 * f1 / i2);
    i1 = (int)((n - i1) / 2.0F);
    localLayoutParams.setMargins(i1, 0, i1, 0);
    jdField_a_of_type_AndroidViewSurfaceView.setLayoutParams(localLayoutParams);
  }
  
  public boolean isWrapContent()
  {
    return false;
  }
  
  void j()
  {
    if (jdField_a_of_type_AndroidMediaMediaPlayer != null) {
      jdField_a_of_type_AndroidMediaMediaPlayer.reset();
    }
    a(0);
  }
  
  public void k()
  {
    t = 0;
    String str1 = getString(2131371158);
    if (jdField_g_of_type_Int == 1)
    {
      r();
      str1 = getString(2131371174);
    }
    for (;;)
    {
      DialogUtil.a(this, 232, null, str1, new mos(this), null).show();
      if (QLog.isColorLevel()) {
        QLog.e("ShortVideoPlayActivity", 2, "handleError，mPlayCallerType = " + jdField_g_of_type_Int);
      }
      jdField_a_of_type_Long = -1L;
      jdField_b_of_type_Long = -1L;
      return;
      if (jdField_g_of_type_Int == 0)
      {
        if (!jdField_b_of_type_Boolean)
        {
          int i1 = (int)(DeviceInfoUtil.d() / 1024L);
          int i2 = (int)(new File(jdField_b_of_type_JavaLangString).length() / 1024L);
          String str2 = DeviceInfoUtil.d();
          ReportController.b(app, "CliOper", "", "", "0X8004674", "0X8004674", 0, 0, "" + i1, "" + i2, str2, jdField_g_of_type_JavaLangString);
          jdField_b_of_type_Boolean = true;
        }
      }
      else if (jdField_g_of_type_Int == 2)
      {
        a(jdField_c_of_type_JavaLangString, 0, 1002, jdField_d_of_type_JavaLangString);
        str1 = getString(2131371174);
      }
    }
  }
  
  void l()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "#stop#");
    }
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && ((jdField_f_of_type_Int == 1) || (jdField_f_of_type_Int == 2))) {
      g();
    }
  }
  
  public void m()
  {
    if (a())
    {
      p = jdField_a_of_type_AndroidMediaMediaPlayer.getCurrentPosition();
      jdField_a_of_type_AndroidMediaMediaPlayer.pause();
      a(2);
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "#pause# , mCurrentPosition = " + p);
    }
    if (jdField_b_of_type_Long >= 0L) {
      jdField_a_of_type_Long += System.currentTimeMillis() - jdField_b_of_type_Long;
    }
  }
  
  public void n()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "#resume#");
    }
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_f_of_type_Int == 2))
    {
      jdField_a_of_type_AndroidMediaMediaPlayer.start();
      a(1);
    }
    if (jdField_b_of_type_Long >= 0L) {
      jdField_a_of_type_Long += System.currentTimeMillis() - jdField_b_of_type_Long;
    }
    jdField_b_of_type_Long = System.currentTimeMillis();
  }
  
  void o()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "handleClick: mPlayState = " + a(jdField_f_of_type_Int) + ", mCurrentPosition = " + p);
    }
    switch (jdField_f_of_type_Int)
    {
    case 4: 
    default: 
      return;
    case 0: 
      if (jdField_c_of_type_Boolean)
      {
        b(p);
        jdField_c_of_type_Boolean = false;
        return;
      }
      b(0);
      return;
    case 1: 
      m();
      return;
    case 2: 
      n();
      return;
    }
    b(0);
  }
  
  public void onBackPressed()
  {
    t();
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131302125: 
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "onClick surfaceView, mHidden=" + jdField_i_of_type_Boolean);
      }
      if (jdField_i_of_type_Boolean)
      {
        c();
        d();
        return;
      }
      e();
      return;
    case 2131302132: 
      o();
      return;
    case 2131298183: 
      t();
      return;
    }
    if (jdField_f_of_type_Int == 1) {
      m();
    }
    p();
  }
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "[MediaPlayer] onCompletion(), mPlayProgress=" + v + ", mCacheProgress=" + w + ", mCurPlayPosition" + x + ", mDuration=" + jdField_i_of_type_Int);
    }
    jdField_a_of_type_AndroidWidgetSeekBar.setProgress(100);
    if ((jdField_g_of_type_Int == 2) && (jdField_f_of_type_Int == 1)) {
      a(jdField_c_of_type_JavaLangString, 2, 1002, jdField_d_of_type_JavaLangString);
    }
    a(0);
    c();
    if (jdField_b_of_type_Long >= 0L)
    {
      jdField_a_of_type_Long += System.currentTimeMillis() - jdField_b_of_type_Long;
      if (!jdField_d_of_type_Boolean)
      {
        new DCShortVideo(BaseApplication.getContext()).a(app, 2002, jdField_i_of_type_Int / 1000, q, jdField_k_of_type_JavaLangString, jdField_a_of_type_Long / 1000L);
        jdField_d_of_type_Boolean = true;
      }
    }
  }
  
  public boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.e("ShortVideoPlayActivity", 2, "[MediaPlayer] onError what=" + paramInt1 + ",extra=" + paramInt2 + ", mSupportProgressive=" + jdField_k_of_type_Boolean + ",mCacheProgress=" + w + ", mPlayProgress=" + v + ", mCurPlayPosition=" + x);
    }
    a(3);
    j();
    k();
    return false;
  }
  
  public boolean onInfo(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.w("ShortVideoPlayActivity", 2, "[MediaPlayer] onInfo what=" + paramInt1 + ",extra=" + paramInt2 + ", mSupportProgressive=" + jdField_k_of_type_Boolean + ",mCacheProgress=" + w + ", mPlayProgress=" + v + ", mCurPlayPosition=" + x);
    }
    return false;
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying())) {
      p = jdField_a_of_type_AndroidMediaMediaPlayer.getCurrentPosition();
    }
    paramBundle.putInt("state_play_position", p);
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onSaveInstanceState: mCurrentPosition: " + p);
    }
  }
  
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
    if (paramBoolean) {
      u();
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "onWindowFocusChanged: hasFocus: " + paramBoolean);
    }
  }
  
  void p()
  {
    int i1 = 0;
    String str2 = getResources().getString(2131371173);
    String str3 = getResources().getString(2131371153);
    String str4 = getResources().getString(2131371157);
    String str5 = getResources().getString(2131366996);
    String str1;
    boolean bool1;
    ActionSheet localActionSheet;
    if (jdField_g_of_type_Int == 0)
    {
      str1 = ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo, "mp4");
      bool1 = FileUtils.a(str1);
      boolean bool2 = "1".equals(DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.shortvideo_forward_switch.name(), "1"));
      if (getIntent().getIntExtra("from_busi_type", 0) == 2) {
        i1 = 1;
      }
      localActionSheet = ActionSheet.a(this);
      if ((bool2) && (jdField_h_of_type_Int != 9501) && (i1 == 0)) {
        localActionSheet.c(str2);
      }
      if (jdField_g_of_type_Int != 3)
      {
        if (!bool1) {
          break label217;
        }
        localActionSheet.c(str3);
        localActionSheet.c(str4);
      }
    }
    for (;;)
    {
      localActionSheet.d(str5);
      localActionSheet.show();
      localActionSheet.a(new mou(this, localActionSheet, str2, str3, bool1, str1, str4));
      return;
      str1 = jdField_b_of_type_JavaLangString;
      break;
      label217:
      localActionSheet.a(str3, 7);
      localActionSheet.a(str4, 7);
    }
  }
  
  void q()
  {
    if (jdField_c_of_type_AndroidWidgetTextView.getVisibility() != 0)
    {
      Drawable localDrawable = getResources().getDrawable(2130838193);
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(10);
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(localDrawable, null, null, null);
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
      ((Animatable)localDrawable).start();
    }
  }
  
  void r()
  {
    if (jdField_c_of_type_AndroidWidgetTextView.getVisibility() == 0) {
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
    }
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
  
  public void s()
  {
    DialogUtil.a(this, 232, null, getString(2131371175), new mov(this), new mow(this)).show();
  }
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "surfaceCreated: mCurrentPosition:" + p);
    }
    if (jdField_c_of_type_Boolean) {}
    do
    {
      return;
      if ((jdField_g_of_type_Int != 0) || (j)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.e("ShortVideoPlayActivity", 2, "surfaceCreated, mFirstPlayReady = false, just return.");
    return;
    if (p > 0)
    {
      b(p);
      p = 0;
      return;
    }
    b(0);
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying())) {
      p = jdField_a_of_type_AndroidMediaMediaPlayer.getCurrentPosition();
    }
    if ((jdField_f_of_type_Int == 2) && (Build.VERSION.SDK_INT >= 10)) {
      jdField_c_of_type_Boolean = true;
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPlayActivity", 2, "surfaceDestroyed mCurrentPosition:" + p + ", mNeedRestore=" + jdField_c_of_type_Boolean);
    }
    g();
  }
  
  public void t()
  {
    switch (NetworkUtil.a(this))
    {
    case 2: 
    case 3: 
    default: 
      if (!jdField_f_of_type_Boolean) {
        w();
      }
      break;
    }
    for (;;)
    {
      setResult(-1, getIntent());
      finish();
      overridePendingTransition(2130968619, 2130968620);
      return;
      if (!jdField_h_of_type_Boolean)
      {
        w();
        continue;
        if (!jdField_g_of_type_Boolean) {
          w();
        }
      }
    }
  }
}
