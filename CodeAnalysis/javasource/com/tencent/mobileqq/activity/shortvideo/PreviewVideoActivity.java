package com.tencent.mobileqq.activity.shortvideo;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.Toast;
import com.tencent.mobileqq.activity.aio.photo.PeakActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.VideoEnvironment;
import com.tencent.mobileqq.shortvideo.common.GloableValue;
import com.tencent.mobileqq.shortvideo.util.ScreenUtil;
import com.tencent.mobileqq.shortvideo.widget.ImageViewVideoPlayer;
import com.tencent.mobileqq.shortvideo.widget.ImageViewVideoPlayer.IMPlayerEndListener;
import com.tencent.qphone.base.util.QLog;
import moc;

public class PreviewVideoActivity
  extends PeakActivity
  implements ImageViewVideoPlayer.IMPlayerEndListener
{
  private static final String jdField_a_of_type_JavaLangString = PreviewVideoActivity.class.getSimpleName();
  private int jdField_a_of_type_Int;
  private ImageViewVideoPlayer jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer;
  private String b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public PreviewVideoActivity() {}
  
  public void onCreate(Bundle paramBundle)
  {
    G = true;
    H = false;
    super.onCreate(paramBundle);
    setContentView(2130904610);
    try
    {
      if (VideoEnvironment.b("AVCodec", getApplicationContext()) != 0)
      {
        QLog.e(jdField_a_of_type_JavaLangString, 4, "load so failed");
        finish();
      }
      GloableValue.a();
      if (getIntent() == null)
      {
        Toast.makeText(getApplicationContext(), "预览视频无参数", 1).show();
        finish();
        return;
      }
    }
    catch (Exception paramBundle)
    {
      for (;;)
      {
        QLog.e(jdField_a_of_type_JavaLangString, 4, "load so failed");
        finish();
      }
      int i = getIntent().getIntExtra("video_type", -1);
      if (i != 0)
      {
        Toast.makeText(getApplicationContext(), "预览视频参数错误", 1).show();
        QLog.e(jdField_a_of_type_JavaLangString, 4, "init error, mVideoType=" + i);
        finish();
        return;
      }
      b = getIntent().getStringExtra("video_source_path");
      if (TextUtils.isEmpty(b))
      {
        Toast.makeText(getApplicationContext(), "预览视频参数错误", 1).show();
        QLog.e(jdField_a_of_type_JavaLangString, 4, "init error, mSourcePath=" + b);
        finish();
        return;
      }
      paramBundle = (FrameLayout)findViewById(2131303419);
      findViewById(2131297781).setOnClickListener(new moc(this));
      DisplayMetrics localDisplayMetrics = getResources().getDisplayMetrics();
      jdField_a_of_type_Int = getIntent().getBundleExtra("encode_video_params").getInt("sv_total_frame_count");
      FrameLayout.LayoutParams localLayoutParams = new FrameLayout.LayoutParams(widthPixels, widthPixels * 3 / 4, 17);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer = new ImageViewVideoPlayer(getApplicationContext());
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.setCyclePlay(true);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a(widthPixels, 0.75F, false, ScreenUtil.a(5.0F));
      paramBundle.addView(jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer, localLayoutParams);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.setIMPlayerEndListener(this);
    }
  }
  
  public void onDestroy()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onDestroy");
    }
    super.onDestroy();
    if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer != null)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.b();
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.c();
    }
    GloableValue.b();
  }
  
  protected void onPause()
  {
    super.onPause();
    if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.b();
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    if ((jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer != null) && (!TextUtils.isEmpty(b)))
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a(0, 0, jdField_a_of_type_Int, b);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a();
    }
  }
  
  protected void onStop()
  {
    super.onStop();
    if (jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.b();
    }
  }
  
  public void x()
  {
    if (!TextUtils.isEmpty(b))
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a(0, 0, jdField_a_of_type_Int, b);
      jdField_a_of_type_ComTencentMobileqqShortvideoWidgetImageViewVideoPlayer.a();
    }
  }
  
  public void y() {}
}
