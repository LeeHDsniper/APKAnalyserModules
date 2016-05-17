package com.tencent.mobileqq.activity.shortvideo;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.Toast;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.image.VideoDrawable;
import com.tencent.image.VideoDrawable.VideoDrawableParams;
import com.tencent.mobileqq.drawable.EmptyDrawable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.BubbleImageView;
import java.io.File;
import mpf;

public class ShortVideoPlayerActivity
  extends Activity
{
  public Button a;
  URLDrawable jdField_a_of_type_ComTencentImageURLDrawable;
  BubbleImageView jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView;
  public boolean a;
  
  public ShortVideoPlayerActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130904807);
    paramBundle = new File(getIntent().getExtras().getString("file_send_path"));
    if (paramBundle.exists())
    {
      jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView = ((BubbleImageView)findViewById(2131303017));
      jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.setAdjustViewBounds(true);
      URLDrawable.URLDrawableOptions localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
      mGifRoundCorner = 0.0F;
      Object localObject = new EmptyDrawable(960, 720);
      ((EmptyDrawable)localObject).setColor(-1);
      mLoadingDrawable = ((Drawable)localObject);
      mUseMemoryCache = false;
      localObject = new VideoDrawable.VideoDrawableParams();
      mPlayVideoFrame = true;
      mPlayAudioFrame = true;
      mExtraInfo = localObject;
      jdField_a_of_type_ComTencentImageURLDrawable = URLDrawable.getDrawable(paramBundle, localURLDrawableOptions);
      jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.setImageDrawable(jdField_a_of_type_ComTencentImageURLDrawable);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131304069));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(new mpf(this));
      return;
      Toast.makeText(BaseApplicationImpl.a, "视频文件不存在", 0).show();
    }
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    jdField_a_of_type_Boolean = false;
  }
  
  protected void onPause()
  {
    super.onPause();
  }
  
  protected void onResume()
  {
    super.onResume();
  }
  
  protected void onStart()
  {
    super.onStart();
  }
  
  protected void onStop()
  {
    super.onStop();
    if ((jdField_a_of_type_ComTencentImageURLDrawable.getStatus() == 1) && ((jdField_a_of_type_ComTencentImageURLDrawable.getCurrDrawable() instanceof VideoDrawable))) {
      ((VideoDrawable)jdField_a_of_type_ComTencentImageURLDrawable.getCurrDrawable()).stopAudio();
    }
    Log.d("xxx", " onStop ");
  }
}
