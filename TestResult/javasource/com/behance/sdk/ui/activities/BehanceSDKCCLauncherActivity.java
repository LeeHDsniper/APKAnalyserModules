package com.behance.sdk.ui.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.view.View.OnClickListener;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.fragments.headless.BehanceSDKCCBrowserHeadlessFragment;
import com.behance.sdk.fragments.headless.BehanceSDKCCBrowserHeadlessFragment.ICreativeCloudAssetDownloadListener;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.ui.dialogs.BehanceSDKGenericAlertDialog;
import java.io.File;
import java.io.Serializable;
import java.util.List;

public class BehanceSDKCCLauncherActivity
  extends FragmentActivity
  implements View.OnClickListener, BehanceSDKCCBrowserHeadlessFragment.ICreativeCloudAssetDownloadListener
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKCCLauncherActivity.class);
  private final int BEHANCE_SDK_ASSET_BROWSER_LAUNCH_REQUEST_CODE = 9786;
  private BehanceSDKGenericAlertDialog cancelDownloadAlertDialog;
  private BehanceSDKCCBrowserHeadlessFragment headlessFragment;
  
  public BehanceSDKCCLauncherActivity() {}
  
  private void cancelDownload()
  {
    headlessFragment.cancelDownload();
    setResult(0);
    closeAlertDialog();
    closeActivity();
  }
  
  private void closeActivity()
  {
    headlessFragment.removeDownloadListener();
    finish();
  }
  
  private void closeAlertDialog()
  {
    if (cancelDownloadAlertDialog != null) {
      cancelDownloadAlertDialog.dismiss();
    }
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if ((paramInt1 == 9786) && (paramInt2 == -1) && (paramIntent != null))
    {
      headlessFragment.downloadSelectedFiles(paramIntent);
      return;
    }
    setResult(0);
    closeActivity();
  }
  
  public void onBackPressed()
  {
    if ((headlessFragment != null) && (headlessFragment.isDownloadInProgress()))
    {
      cancelDownloadAlertDialog = BehanceSDKGenericAlertDialog.getInstance(this, R.string.bsdk_cc_asset_browser_cancel_download_alert_dialog_title, R.string.bsdk_cc_asset_browser_cancel_download_alert_dialog_text, R.string.bsdk_generic_alert_dialog_ok_btn_label, R.string.bsdk_generic_alert_dialog_cancel_btn_label);
      cancelDownloadAlertDialog.setOnOKBtnClickListener(this);
      cancelDownloadAlertDialog.setOnNotOKBtnClickListener(this);
      cancelDownloadAlertDialog.show();
    }
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (i == R.id.bsdkGenericAlertDialogOKBtn) {
      cancelDownload();
    }
    while (i != R.id.bsdkGenericAlertDialogNotOKBtn) {
      return;
    }
    closeAlertDialog();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_cc_asset_browser_launcher);
    headlessFragment = ((BehanceSDKCCBrowserHeadlessFragment)getSupportFragmentManager().findFragmentByTag("HEADLESS_FRAGMENT_TAG_CC_BROWSER"));
    if (headlessFragment == null)
    {
      headlessFragment = new BehanceSDKCCBrowserHeadlessFragment();
      getSupportFragmentManager().beginTransaction().add(headlessFragment, "HEADLESS_FRAGMENT_TAG_CC_BROWSER").commit();
    }
    headlessFragment.setDownloadListener(this);
    if (paramBundle == null) {}
    try
    {
      headlessFragment.launchCCAssetBrowser(this, getIntent());
      return;
    }
    catch (AdobeCSDKException paramBundle)
    {
      logger.error(paramBundle, "Problem launching Creative Cloud Asset Browser", new Object[0]);
    }
  }
  
  public void onDownloadComplete(List<File> paramList1, List<File> paramList2, List<File> paramList3)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("ACTIVITY_CC_SUCCESSFULLY_DOWNLOADED_FILES", (Serializable)paramList1);
    localIntent.putExtra("ACTIVITY_CC_DOWNLOAD_FAILED_FILES", (Serializable)paramList2);
    localIntent.putExtra("ACTIVITY_CC_INVALID_FILES", (Serializable)paramList3);
    setResult(-1, localIntent);
    closeActivity();
  }
}
