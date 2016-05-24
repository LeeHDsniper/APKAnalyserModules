package com.behance.sdk.ui.activities;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.ui.adapters.BehanceSDKAdobeCloudSelectionListItemAdapter;
import java.util.ArrayList;

public class BehanceSDKAdobeCloudSelectionActivity
  extends FragmentActivity
  implements View.OnClickListener, AdapterView.OnItemClickListener, IAdobeGenericCompletionCallback<ArrayList<AdobeCloud>>, IAdobeGenericErrorCallback<AdobeCSDKException>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKAdobeCloudSelectionActivity.class);
  private boolean activityDestroyed = false;
  private ListView cloudsListView;
  private View progressSpinner;
  private AdobeCloudManager sharedCloudManager;
  
  public BehanceSDKAdobeCloudSelectionActivity() {}
  
  private void closeThisView()
  {
    activityDestroyed = true;
    finish();
  }
  
  private void handleCloudOptionSelection(AdobeCloud paramAdobeCloud)
  {
    if (paramAdobeCloud != null) {
      sharedCloudManager.setDefaultCloud(paramAdobeCloud);
    }
    setResult(1);
    closeThisView();
  }
  
  private void handleCloudRetrievingError()
  {
    Toast.makeText(this, R.string.bsdk_cloud_selection_view_loading_error_msg, 1).show();
    setResult(3);
    closeThisView();
  }
  
  private void hideProgressSpinner()
  {
    if (progressSpinner != null)
    {
      cloudsListView.setVisibility(0);
      progressSpinner.setVisibility(8);
    }
  }
  
  private void loadAdobeClouds()
  {
    showProgressSpinner();
    sharedCloudManager.refreshClouds(this, this, null);
  }
  
  private void setCloudListAdapter(ArrayList<AdobeCloud> paramArrayList)
  {
    if (paramArrayList != null)
    {
      paramArrayList = new BehanceSDKAdobeCloudSelectionListItemAdapter(this, paramArrayList, sharedCloudManager.getDefaultCloud());
      cloudsListView.setAdapter(paramArrayList);
      hideProgressSpinner();
    }
  }
  
  private void showProgressSpinner()
  {
    if (progressSpinner != null)
    {
      cloudsListView.setVisibility(4);
      progressSpinner.setVisibility(0);
    }
  }
  
  public void onBackPressed()
  {
    setResult(2);
    closeThisView();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == R.id.bsdkCloudSelectionViewBackBtnContainer)
    {
      setResult(2);
      closeThisView();
    }
  }
  
  public void onCompletion(final ArrayList<AdobeCloud> paramArrayList)
  {
    if (!activityDestroyed)
    {
      if (paramArrayList == null) {
        break label36;
      }
      if (cloudsListView != null) {
        cloudsListView.post(new Runnable()
        {
          public void run()
          {
            BehanceSDKAdobeCloudSelectionActivity.this.setCloudListAdapter(paramArrayList);
          }
        });
      }
    }
    return;
    label36:
    handleCloudRetrievingError();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    activityDestroyed = false;
    setContentView(R.layout.bsdk_activity_adobe_cloud_selection);
    sharedCloudManager = AdobeCloudManager.getSharedCloudManager();
    findViewById(R.id.bsdkCloudSelectionViewBackBtnContainer).setOnClickListener(this);
    cloudsListView = ((ListView)findViewById(R.id.bsdkCloudSelectionViewCloudsListView));
    cloudsListView.setOnItemClickListener(this);
    progressSpinner = findViewById(R.id.bsdkCloudSelectionViewProgressSpinner);
  }
  
  public void onError(AdobeCSDKException paramAdobeCSDKException)
  {
    logger.error(paramAdobeCSDKException, "Problem retrieving Clouds", new Object[0]);
    if ((!activityDestroyed) && (cloudsListView != null)) {
      cloudsListView.post(new Runnable()
      {
        public void run()
        {
          BehanceSDKAdobeCloudSelectionActivity.this.handleCloudRetrievingError();
        }
      });
    }
  }
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    handleCloudOptionSelection((AdobeCloud)cloudsListView.getItemAtPosition(paramInt));
  }
  
  protected void onResume()
  {
    super.onResume();
    loadAdobeClouds();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
  }
}
