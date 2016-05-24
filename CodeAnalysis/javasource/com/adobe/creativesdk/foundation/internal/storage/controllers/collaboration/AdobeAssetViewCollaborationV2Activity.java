package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

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
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;

public class AdobeAssetViewCollaborationV2Activity
  extends ActionBarActivity
  implements IAdobeCollaborationFragmentHostActivity
{
  private String ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY = "ASSET_VIEW_COLLABORATION_FOLDER_HREF";
  private Toolbar _actionBarToolbar;
  private AdobeAssetViewCollaborationFragment _collaborationFragment;
  private int _containerId = R.id.frame_collaboration_container;
  private String folderHref;
  
  public AdobeAssetViewCollaborationV2Activity() {}
  
  private Fragment createCollaborationFragment()
  {
    AdobeAssetViewCollaborationFragment localAdobeAssetViewCollaborationFragment = new AdobeAssetViewCollaborationFragment();
    Bundle localBundle = new Bundle();
    localBundle.putString(ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY, folderHref);
    localAdobeAssetViewCollaborationFragment.setFragmentHostActivity(this);
    localAdobeAssetViewCollaborationFragment.setArguments(localBundle);
    return localAdobeAssetViewCollaborationFragment;
  }
  
  private void setupActionBarCustomFont()
  {
    _actionBarToolbar = ((Toolbar)findViewById(R.id.actionbar_toolbar));
    AdobeCSDKActionBarController.setTitle(findViewById(16908290), getResources().getString(R.string.collaborator));
    setSupportActionBar(_actionBarToolbar);
    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    getSupportActionBar().setHomeButtonEnabled(true);
  }
  
  private void startCollaborationFragment()
  {
    Object localObject = getSupportFragmentManager();
    _collaborationFragment = ((AdobeAssetViewCollaborationFragment)createCollaborationFragment());
    localObject = ((FragmentManager)localObject).beginTransaction();
    ((FragmentTransaction)localObject).replace(_containerId, _collaborationFragment, "");
    ((FragmentTransaction)localObject).addToBackStack(null);
    ((FragmentTransaction)localObject).commit();
  }
  
  public void handleSelfDelete()
  {
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSET_VIEW_COLLABORATOR_SELF_DELETE_MOVE_TO_ROOT);
    finish();
  }
  
  public void onBackPressed()
  {
    if ((_collaborationFragment != null) && (!_collaborationFragment.handleBackPress())) {
      finish();
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.activity_asset_browser_collaboration);
    setupActionBarCustomFont();
    folderHref = getIntent().getStringExtra("Folder Href");
    startCollaborationFragment();
  }
  
  protected void onDestroy()
  {
    AdobeNetworkReachabilityUtil.destorySharedInstance();
    super.onDestroy();
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (!_collaborationFragment.onOptionsItemSelected(paramMenuItem))
    {
      finish();
      return true;
    }
    return false;
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
  }
}
