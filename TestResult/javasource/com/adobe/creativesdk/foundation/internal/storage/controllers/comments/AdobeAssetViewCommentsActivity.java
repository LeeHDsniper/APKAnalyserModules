package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetMainBrowserConfiguration;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;

public class AdobeAssetViewCommentsActivity
  extends ActionBarActivity
{
  private Toolbar _actionBarToolbar;
  private AdobeAssetViewCommentsFragment _commentsFragment;
  private int _containerId = R.id.frame_comments_container;
  private boolean openWithReplyWindow = false;
  
  public AdobeAssetViewCommentsActivity() {}
  
  private Fragment createCommentsFragment()
  {
    AdobeAssetViewCommentsFragment localAdobeAssetViewCommentsFragment = new AdobeAssetViewCommentsFragment();
    Bundle localBundle = new Bundle();
    localBundle.putSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY, getIntent().getExtras().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY));
    localAdobeAssetViewCommentsFragment.setArguments(localBundle);
    if (openWithReplyWindow) {
      localAdobeAssetViewCommentsFragment.setOpenWithReply(true);
    }
    return localAdobeAssetViewCommentsFragment;
  }
  
  private void setupActionBarCustomFont()
  {
    _actionBarToolbar = ((Toolbar)findViewById(R.id.actionbar_toolbar));
    AdobeCSDKActionBarController.setTitle(findViewById(16908290), getResources().getString(R.string.adobe_asset_view_comments_title));
    setSupportActionBar(_actionBarToolbar);
    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    getSupportActionBar().setHomeButtonEnabled(true);
  }
  
  private void startCommentsFragment()
  {
    Object localObject = getSupportFragmentManager();
    _commentsFragment = ((AdobeAssetViewCommentsFragment)createCommentsFragment());
    localObject = ((FragmentManager)localObject).beginTransaction();
    ((FragmentTransaction)localObject).replace(_containerId, _commentsFragment, "");
    ((FragmentTransaction)localObject).addToBackStack(null);
    ((FragmentTransaction)localObject).commit();
  }
  
  public void onBackPressed()
  {
    if ((_commentsFragment != null) && (!_commentsFragment.handleBackPress())) {
      finish();
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.activity_asset_browser_comments);
    setupActionBarCustomFont();
    openWithReplyWindow = getIntent().getBooleanExtra("OPEN_REPLY_WINDOW", false);
    startCommentsFragment();
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramMenuItem.getItemId() == 16908332)
    {
      bool1 = bool2;
      if (_commentsFragment != null)
      {
        bool1 = bool2;
        if (!_commentsFragment.handleBackPress())
        {
          finish();
          bool1 = true;
        }
      }
    }
    return bool1;
  }
}
