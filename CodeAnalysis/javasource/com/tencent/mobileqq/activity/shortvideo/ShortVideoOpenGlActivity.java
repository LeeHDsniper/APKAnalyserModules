package com.tencent.mobileqq.activity.shortvideo;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.maxvideo.common.MessageStruct;
import com.tencent.maxvideo.mediadevice.AVCodec;
import com.tencent.maxvideo.mediadevice.AVCodec.AVCodecCallback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.common.GloableValue;
import com.tencent.mobileqq.shortvideo.mediadevice.RecordManager;
import com.tencent.mobileqq.shortvideo.mediaplay.TMMMediaView;
import com.tencent.qphone.base.util.QLog;
import mom;

public class ShortVideoOpenGlActivity
  extends Activity
  implements View.OnClickListener, AVCodec.AVCodecCallback
{
  public static final int a = Integer.MIN_VALUE;
  public static ShortVideoOpenGlActivity a;
  public static final String a = "ShortVideoOpenGlActivity";
  public static final String b = "svpath";
  public static final String c = "svtime";
  public static final String d = "svframe";
  public static final String e = "svWinWidth";
  public static final String f = "svWinHeight";
  public static final String g = "svFullScreen";
  public Handler a;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TMMMediaView jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView;
  private boolean jdField_a_of_type_Boolean;
  private int b;
  private int c;
  private int d;
  private int e;
  private int f;
  private int g;
  private String h;
  
  public ShortVideoOpenGlActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new Handler();
  }
  
  private void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView == null)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView = new TMMMediaView(getApplicationContext());
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.setVideoPath(h);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.setVideoFramesAndTime(b, c);
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.setId(318709776);
      Object localObject = new RelativeLayout.LayoutParams(f, g);
      ((RelativeLayout.LayoutParams)localObject).addRule(13);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView, (ViewGroup.LayoutParams)localObject);
      localObject = new TextView(this);
      ((TextView)localObject).setText("轻触退出");
      ((TextView)localObject).setTextSize(18.0F);
      ((TextView)localObject).setTextColor(Color.rgb(102, 102, 102));
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(2, jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.getId());
      localLayoutParams.addRule(14);
      bottomMargin = 50;
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView((View)localObject, localLayoutParams);
      return;
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoOpenGlActivity", 2, "[@][init]mTMMMediaView != null  exited=" + true);
      }
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.d();
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.g();
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView = null;
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView = new TMMMediaView(getApplicationContext());
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.setVideoPath(h);
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoOpenGlActivity", 2, "[@][init]mTMMMediaView != null[new instance]");
      }
    }
  }
  
  public void onAVCodecEvent(AVCodec.AVCodecCallback paramAVCodecCallback, MessageStruct paramMessageStruct)
  {
    switch (mId)
    {
    default: 
      return;
    }
    try
    {
      Thread.sleep(d);
      super.finish();
      return;
    }
    catch (InterruptedException paramAVCodecCallback)
    {
      for (;;) {}
    }
  }
  
  public void onClick(View paramView)
  {
    super.finish();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoOpenGlActivity = this;
    paramBundle = super.getIntent();
    jdField_a_of_type_Boolean = paramBundle.getBooleanExtra("svFullScreen", false);
    if (jdField_a_of_type_Boolean) {
      getWindow().setFlags(1024, 1024);
    }
    int i = getResourcesgetDisplayMetricswidthPixels;
    RecordManager.a().a().addCodecCallback(this);
    h = paramBundle.getStringExtra("svpath");
    c = paramBundle.getIntExtra("svframe", -1);
    b = paramBundle.getIntExtra("svtime", -1);
    if ((c <= 0) || (b <= 0))
    {
      super.finish();
      return;
    }
    e = (c * 1000 / b);
    d = (1000 / e);
    f = paramBundle.getIntExtra("svWinWidth", i);
    g = paramBundle.getIntExtra("svWinHeight", i * 3 / 4);
    jdField_a_of_type_AndroidWidgetRelativeLayout = new RelativeLayout(this);
    jdField_a_of_type_AndroidWidgetRelativeLayout.setBackgroundColor(Color.rgb(13, 13, 13));
    super.setContentView(jdField_a_of_type_AndroidWidgetRelativeLayout);
  }
  
  protected void onDestroy()
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView != null)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.d();
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.g();
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView = null;
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoOpenGlActivity", 2, "onDestroy");
    }
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoOpenGlActivity = null;
    super.onDestroy();
  }
  
  protected void onPause()
  {
    
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.a();
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoOpenGlActivity", 2, "onPause");
    }
    super.onPause();
  }
  
  protected void onResume()
  {
    a();
    GloableValue.a();
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediaplayTMMMediaView.b();
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoOpenGlActivity", 2, "onResume");
    }
    super.setResult(-1, null);
    super.onResume();
    jdField_a_of_type_AndroidOsHandler.postDelayed(new mom(this), d * 2);
  }
  
  protected void onStop()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoOpenGlActivity", 2, "onStop");
    }
    super.onStop();
  }
}
