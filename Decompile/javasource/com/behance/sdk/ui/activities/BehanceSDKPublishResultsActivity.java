package com.behance.sdk.ui.activities;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;

public class BehanceSDKPublishResultsActivity
  extends FragmentActivity
  implements View.OnClickListener
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKPublishResultsActivity.class);
  private String workUrl;
  
  public BehanceSDKPublishResultsActivity() {}
  
  private void closeThisView()
  {
    finish();
  }
  
  private void dispatchViewWorkUrlIntent()
  {
    try
    {
      if (workUrl != null) {
        startActivity(new Intent("android.intent.action.VIEW", Uri.parse(workUrl)));
      }
      closeThisView();
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        logger.error(localThrowable, "Problem launching URL. [Url - %s]", new Object[] { workUrl });
      }
    }
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == R.id.bsdkPublishResultsTitlebarBackBtnImageView) {
      closeThisView();
    }
    while ((paramView.getId() != R.id.bsdkPublishResultsBehanceBtn) && (paramView.getId() != R.id.bsdkPublishResultsUrlTxtView) && (paramView.getId() != R.id.bsdkPublishResultsWorkImageView)) {
      return;
    }
    dispatchViewWorkUrlIntent();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_publish_results);
    if (!ImageLoader.getInstance().isInited())
    {
      paramBundle = ImageLoaderConfiguration.createDefault(this);
      ImageLoader.getInstance().init(paramBundle);
    }
    paramBundle = getIntent();
    workUrl = paramBundle.getStringExtra("INTENT_STRING_EXTRA_WORK_URL");
    paramBundle = paramBundle.getStringExtra("INTENT_STRING_EXTRA_IMAGE_URL");
    findViewById(R.id.bsdkPublishResultsTitlebarBackBtnImageView).setOnClickListener(this);
    Object localObject = (TextView)findViewById(R.id.bsdkPublishResultsUrlTxtView);
    ((TextView)localObject).setOnClickListener(this);
    if (workUrl != null) {
      ((TextView)localObject).setText(workUrl);
    }
    localObject = (ImageView)findViewById(R.id.bsdkPublishResultsWorkImageView);
    ((ImageView)localObject).setOnClickListener(this);
    if (paramBundle != null)
    {
      DisplayImageOptions localDisplayImageOptions = new DisplayImageOptions.Builder().cacheInMemory(true).resetViewBeforeLoading(false).cacheOnDisk(false).showImageOnFail(17301624).build();
      ImageLoader.getInstance().displayImage(paramBundle, (ImageView)localObject, localDisplayImageOptions);
    }
    findViewById(R.id.bsdkPublishResultsBehanceBtn).setOnClickListener(this);
  }
}
