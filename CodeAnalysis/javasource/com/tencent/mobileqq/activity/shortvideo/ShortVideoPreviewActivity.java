package com.tencent.mobileqq.activity.shortvideo;

import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Bundle;
import android.os.Environment;
import android.text.TextUtils;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.util.FMDialogUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import java.io.File;
import java.util.ArrayList;
import mpg;
import mph;
import mpi;
import mpj;
import mpk;
import mpl;
import mpm;
import mpn;
import mpo;
import mpp;
import mpq;
import mpr;

public class ShortVideoPreviewActivity
  extends BaseActivity
  implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener, View.OnClickListener
{
  static final String jdField_a_of_type_JavaLangString = "ShortVideoPreviewActivity";
  public static final int d = 0;
  public static final int e = 1;
  static final String e = "state_play_position";
  public static final int f = 2;
  static final String f = "state_play_state";
  public static final int g = 3;
  public static final String g = "preview_only";
  public static final int m = 0;
  public static final int n = 1;
  public static final int o = 2;
  public static final int p = 3;
  public static final int q = 4;
  int jdField_a_of_type_Int;
  public long a;
  BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  public Bitmap a;
  public MediaPlayer a;
  SurfaceHolder.Callback jdField_a_of_type_AndroidViewSurfaceHolder$Callback;
  public SurfaceView a;
  public ImageView a;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  boolean jdField_a_of_type_Boolean;
  int jdField_b_of_type_Int;
  public long b;
  ImageView jdField_b_of_type_AndroidWidgetImageView;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  String jdField_b_of_type_JavaLangString;
  boolean jdField_b_of_type_Boolean;
  int jdField_c_of_type_Int;
  public String c;
  boolean jdField_c_of_type_Boolean;
  public String d;
  int h;
  public int i;
  public int j;
  public int k;
  public int l;
  int r;
  
  public ShortVideoPreviewActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    h = 0;
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_AndroidContentBroadcastReceiver = new mpg(this);
    jdField_a_of_type_AndroidViewSurfaceHolder$Callback = new mpm(this);
  }
  
  public static void a(Context paramContext, int paramInt)
  {
    DialogUtil.a(paramContext, 232, null, paramContext.getString(paramInt), new mpj(), null).show();
  }
  
  private void i()
  {
    jdField_a_of_type_Long = new File(d).length();
    if ((NetworkUtil.g(this)) && (!NetworkUtil.h(this)) && (jdField_a_of_type_Long > 3145728L))
    {
      FMDialogUtil.a(this, 2131362794, 2131362790, new mpi(this));
      return;
    }
    j();
    setResult(-1);
  }
  
  private void j()
  {
    Intent localIntent = getIntent();
    String str2 = localIntent.getStringExtra("PhotoConst.DEST_VIDEO_ACTIVITY_CLASS_NAME");
    Object localObject = localIntent.getStringExtra("PhotoConst.DEST_VIDEO_ACTIVITY_PACKAGE_NAME");
    String str1 = str2;
    if (str2 == null)
    {
      str2 = localIntent.getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
      localObject = localIntent.getStringExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME");
      str1 = str2;
      if (str2 == null)
      {
        QQToast.a(this, "请设置INIT_ACTIVITY_CLASS_NAME ", 0).a();
        return;
      }
    }
    localIntent.setClassName((String)localObject, str1);
    localIntent.putExtra("file_send_path", d);
    localIntent.putExtra("file_send_duration", jdField_b_of_type_Long);
    localIntent.putExtra("file_send_size", jdField_a_of_type_Long);
    localIntent.putExtra("uin", jdField_b_of_type_JavaLangString);
    localIntent.putExtra("uintype", jdField_a_of_type_Int);
    localIntent.putExtra("file_source", jdField_c_of_type_JavaLangString);
    localIntent.putExtra("start_init_activity_after_sended", true);
    if (!jdField_a_of_type_Boolean) {
      ReportController.b(null, "CliOper", "", "", "0X8006130", "0X8006130", 0, 0, "", "", "", "");
    }
    localObject = getIntent();
    if ((localObject != null) && (((Intent)localObject).hasExtra("custom_shortvideopreview_sendbtn_reportActionName")))
    {
      str2 = ((Intent)localObject).getStringExtra("custom_shortvideopreview_sendbtn_reportActionName");
      str1 = ((Intent)localObject).getStringExtra("custom_shortvideopreview_sendbtn_reportReverse2");
      localObject = str1;
      if (str1 == null) {
        localObject = "";
      }
      if (str2 != null) {
        ReportController.b(null, "CliOper", "", "", str2, str2, 0, 0, (String)localObject, "", "", "");
      }
    }
    startActivity(localIntent);
  }
  
  public String a(int paramInt)
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
    }
    return " error ";
  }
  
  void a()
  {
    if (jdField_b_of_type_AndroidWidgetTextView != null) {
      switch (r)
      {
      default: 
        jdField_b_of_type_AndroidWidgetTextView.setText(2131366997);
      }
    }
    for (;;)
    {
      if (jdField_c_of_type_Boolean)
      {
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
        if (jdField_a_of_type_AndroidWidgetTextView != null) {
          jdField_a_of_type_AndroidWidgetTextView.setText(2131364429);
        }
      }
      return;
      StringBuilder localStringBuilder = new StringBuilder("发送");
      if ((jdField_b_of_type_Boolean) && (jdField_a_of_type_JavaUtilArrayList != null) && (jdField_a_of_type_JavaUtilArrayList.size() > 0)) {
        localStringBuilder.append("(").append(jdField_a_of_type_JavaUtilArrayList.size()).append(")");
      }
      jdField_b_of_type_AndroidWidgetTextView.setText(localStringBuilder);
      continue;
      jdField_b_of_type_AndroidWidgetTextView.setText(2131366997);
      continue;
      jdField_b_of_type_AndroidWidgetTextView.setText(2131364853);
    }
  }
  
  public void a(int paramInt)
  {
    if (!FileUtils.b(d))
    {
      QQToast.a(this, 2131371150, 0).a();
      return;
    }
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPreviewActivity", 2, "#play#, msec=" + paramInt);
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
      jdField_a_of_type_AndroidMediaMediaPlayer.setDataSource(d);
      jdField_a_of_type_AndroidMediaMediaPlayer.prepareAsync();
      jdField_a_of_type_AndroidMediaMediaPlayer.setOnPreparedListener(new mpn(this, paramInt));
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.e("ShortVideoPreviewActivity", 2, "#play#, msec=" + paramInt, localException);
      }
      e();
      DialogUtil.a(this, 232, null, getString(2131371159), new mpo(this), null).show();
    }
  }
  
  void a(Intent paramIntent)
  {
    d = paramIntent.getExtras().getString("file_send_path");
    jdField_b_of_type_Long = paramIntent.getExtras().getLong("file_send_duration");
    jdField_a_of_type_Long = paramIntent.getExtras().getLong("file_send_size");
    jdField_b_of_type_Int = paramIntent.getIntExtra("file_width", 0);
    jdField_c_of_type_Int = paramIntent.getIntExtra("file_height", 0);
    paramIntent.removeExtra("file_width");
    paramIntent.removeExtra("file_height");
    jdField_b_of_type_JavaLangString = paramIntent.getExtras().getString("uin");
    jdField_a_of_type_Int = paramIntent.getIntExtra("uintype", -1);
    jdField_c_of_type_JavaLangString = paramIntent.getStringExtra("file_source");
    jdField_c_of_type_Boolean = paramIntent.getBooleanExtra("preview_only", false);
    jdField_a_of_type_Boolean = paramIntent.getBooleanExtra("is_from_system_media", true);
    jdField_b_of_type_Boolean = paramIntent.getBooleanExtra("PhotoConst.IS_SUPPORT_VIDEO_CHECKBOX", false);
    if (jdField_b_of_type_Boolean) {
      jdField_a_of_type_JavaUtilArrayList = paramIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
    }
    boolean bool = paramIntent.getBooleanExtra("PhotoConst.IS_FROM_TROOP_BAR", false);
    paramIntent = paramIntent.getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
    if ((paramIntent.contains("SplashActivity")) || (paramIntent.contains("ChatActivity"))) {
      r = 0;
    }
    for (;;)
    {
      if ((TextUtils.isEmpty(d)) || ((r != 2) && (TextUtils.isEmpty(jdField_b_of_type_JavaLangString))) || (!FileUtils.b(d)))
      {
        if (QLog.isColorLevel()) {
          QLog.e("ShortVideoPreviewActivity", 2, "ShortVideoPreviewActivity initData(),mVideoPath or mUin is empty or mVideoPath not exits, just finish.");
        }
        QQToast.a(this, 2131371150, 0).a();
        super.finish();
      }
      return;
      if (paramIntent.contains("QZonePublishMoodActivity")) {
        r = 1;
      } else if (bool) {
        r = 2;
      } else if (paramIntent.contains("TrimVideoActivity")) {
        r = 3;
      } else if (paramIntent.contains("LiteActivity")) {
        r = 4;
      } else {
        r = 0;
      }
    }
  }
  
  public void b()
  {
    if (jdField_a_of_type_AndroidMediaMediaPlayer != null)
    {
      jdField_a_of_type_AndroidMediaMediaPlayer.stop();
      jdField_a_of_type_AndroidMediaMediaPlayer.release();
      jdField_a_of_type_AndroidMediaMediaPlayer = null;
    }
    b(0);
  }
  
  public void b(int paramInt)
  {
    if ((paramInt != 0) && (paramInt != 1) && (paramInt != 2) && (paramInt != 3)) {}
    for (;;)
    {
      return;
      h = paramInt;
      if (paramInt == 1)
      {
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840980);
      }
      while (QLog.isColorLevel())
      {
        QLog.d("ShortVideoPreviewActivity", 2, "changePlayState, playState => " + a(paramInt));
        return;
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840979);
      }
    }
  }
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "#pause#");
    }
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying()) && (h == 1))
    {
      jdField_a_of_type_AndroidMediaMediaPlayer.pause();
      b(2);
    }
  }
  
  void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "#resume#");
    }
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (h == 2))
    {
      jdField_a_of_type_AndroidMediaMediaPlayer.start();
      b(1);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mActNeedImmersive = false;
    super.doOnCreate(paramBundle);
    a(super.getIntent());
    if (paramBundle != null)
    {
      l = paramBundle.getInt("state_play_state");
      k = paramBundle.getInt("state_play_position");
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPreviewActivity", 2, "onCreate(), mSavedCurPosition : " + k + ",mSavedPlayState : " + a(l));
      }
    }
    super.setContentView(2130904286);
    jdField_a_of_type_AndroidViewSurfaceView = ((SurfaceView)findViewById(2131302125));
    jdField_a_of_type_AndroidViewSurfaceView.getHolder().setType(3);
    jdField_a_of_type_AndroidViewSurfaceView.getHolder().addCallback(jdField_a_of_type_AndroidViewSurfaceHolder$Callback);
    jdField_a_of_type_AndroidViewSurfaceView.getViewTreeObserver().addOnGlobalLayoutListener(new mpk(this));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131298036));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131302137));
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131302138));
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131302132));
    jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetImageView.getViewTreeObserver().addOnGlobalLayoutListener(new mpl(this));
    a();
    paramBundle = new IntentFilter();
    paramBundle.addAction("android.intent.action.SCREEN_OFF");
    registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, paramBundle);
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "doOnDestroy");
    }
    b();
    if (jdField_a_of_type_AndroidGraphicsBitmap != null)
    {
      if (!jdField_a_of_type_AndroidGraphicsBitmap.isRecycled()) {
        jdField_a_of_type_AndroidGraphicsBitmap.recycle();
      }
      jdField_a_of_type_AndroidGraphicsBitmap = null;
    }
    unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
  }
  
  void e()
  {
    if (jdField_a_of_type_AndroidMediaMediaPlayer != null) {
      jdField_a_of_type_AndroidMediaMediaPlayer.reset();
    }
    b(0);
  }
  
  void f()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "#stop#");
    }
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && ((h == 1) || (h == 2))) {
      b();
    }
  }
  
  public void g()
  {
    int i1 = jdField_a_of_type_AndroidMediaMediaPlayer.getVideoWidth();
    int i2 = jdField_a_of_type_AndroidMediaMediaPlayer.getVideoHeight();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "adjustVideoRatio, videoWith:" + i1 + ",videoHeight:" + i2);
    }
    if ((j == 0) || (i == 0) || (i1 == 0) || (i2 == 0)) {
      return;
    }
    if (j / i > i2 / i1)
    {
      f1 = i;
      i1 = (int)(i2 * f1 / i1);
      i1 = (int)((j - i1) / 2.0F);
      localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
      localLayoutParams.setMargins(0, i1, 0, i1);
      jdField_a_of_type_AndroidViewSurfaceView.setLayoutParams(localLayoutParams);
      return;
    }
    float f1 = j;
    i1 = (int)(i1 * f1 / i2);
    i1 = (int)((i - i1) / 2.0F);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    localLayoutParams.setMargins(i1, 0, i1, 0);
    jdField_a_of_type_AndroidViewSurfaceView.setLayoutParams(localLayoutParams);
  }
  
  void h()
  {
    Object localObject = Environment.getExternalStorageDirectory();
    int i1;
    if ((((File)localObject).exists()) && (((File)localObject).canWrite()))
    {
      i1 = 1;
      if ((!Environment.getExternalStorageState().equals("mounted")) || (i1 == 0)) {
        break label140;
      }
      i1 = 1;
    }
    for (;;)
    {
      if (i1 != 0)
      {
        if (Utils.b() > 512000L)
        {
          if (NetworkUtil.c(this))
          {
            jdField_a_of_type_Long = new File(d).length();
            localObject = ShortVideoUtils.a(this, jdField_a_of_type_Long);
            DialogUtil.a(this, 232, null, String.format(getResources().getString(2131371168), new Object[] { localObject }), new mpr(this), new mph(this)).show();
            return;
            i1 = 0;
            break;
            label140:
            i1 = 0;
            continue;
          }
          j();
          return;
        }
        a(this, 2131371165);
        return;
      }
    }
    QQToast.a(this, 1, 2131368675, 0).b(getTitleBarHeight());
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131302137: 
      super.finish();
      return;
    case 2131302132: 
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPreviewActivity", 2, "handleClick: mPlayState = " + a(h));
      }
      if ((l == 2) && (k > 0))
      {
        a(k);
        l = 0;
        k = 0;
        return;
      }
      switch (h)
      {
      default: 
        return;
      case 0: 
        if (app.d())
        {
          QQToast.a(this, 0, 2131371170, 0).a();
          return;
        }
        a(0);
        return;
      case 1: 
        c();
        return;
      case 2: 
        d();
        return;
      }
      a(0);
      return;
    }
    switch (r)
    {
    default: 
      return;
    case 0: 
      h();
      return;
    case 4: 
      i();
      return;
    case 1: 
    case 3: 
      paramView = super.getIntent();
      paramView.putExtra("PhotoConst.IS_VIDEO_SELECTED", true);
      paramView.putExtra("PhotoConst.VIDEO_SIZE", jdField_a_of_type_Long);
      paramView.putExtra("file_send_duration", jdField_b_of_type_Long);
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(d);
      PhotoUtils.a(this, paramView, localArrayList, 2, false);
      return;
    }
    DialogUtil.a(this, 232, null, getString(2131364868, new Object[] { String.format("%.2fMB", new Object[] { Double.valueOf(jdField_a_of_type_Long / 1024.0D / 1024.0D) }) }), new mpp(this), new mpq(this)).show();
    paramView = new Intent("key_video_select_apply_click");
    paramView.putExtra("className", super.getIntent().getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME"));
    sendBroadcast(paramView);
  }
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "mMediaPlayer onCompletion");
    }
    b(0);
  }
  
  public boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.e("ShortVideoPreviewActivity", 2, "mMediaPlayer onError what=" + paramInt1 + ",extra=" + paramInt2);
    }
    b(3);
    e();
    return false;
  }
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "mMediaPlayer onPrepared");
    }
    g();
    jdField_a_of_type_AndroidMediaMediaPlayer.start();
    b(1);
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (((h == 1) || (h == 2)) && (jdField_a_of_type_AndroidMediaMediaPlayer != null)) {
      k = jdField_a_of_type_AndroidMediaMediaPlayer.getCurrentPosition();
    }
    l = h;
    paramBundle.putInt("state_play_state", h);
    paramBundle.putInt("state_play_position", k);
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPreviewActivity", 2, "onSaveInstanceState: mSavedCurPosition: " + k + " ,playState = " + a(h));
    }
  }
  
  public void onStart()
  {
    if (VersionUtils.b()) {
      ((AudioManager)getSystemService("audio")).requestAudioFocus(null, 3, 2);
    }
    super.onStart();
  }
  
  protected void onStop()
  {
    if (VersionUtils.b()) {
      ((AudioManager)getSystemService("audio")).abandonAudioFocus(null);
    }
    super.onStop();
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
