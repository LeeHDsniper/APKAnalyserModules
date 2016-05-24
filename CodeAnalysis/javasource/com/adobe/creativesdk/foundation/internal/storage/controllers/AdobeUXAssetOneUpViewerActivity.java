package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.content.FileProvider;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.SimpleOnPageChangeListener;
import android.support.v7.app.ActionBar;
import android.support.v7.widget.Toolbar;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability.AdobeNetworkStatus;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.menu;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.PushNotification.controller.AdobeNotificationManager;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.controllers.comments.AdobeAssetViewCommentsActivity;
import com.adobe.creativesdk.foundation.internal.storage.controllers.comments.AdobeAssetViewCommentsTargetAssetController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapCache.ImageCacheParams;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.internal.storage.controllers.multipage.AdobeMultiPageFragmentController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.multipage.AdobeMultiPageViewState;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKTypeFace;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKTypefaceSpan;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLocalizedMgr;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import com.sothree.slidinguppanel.SlidingUpPanelLayout;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import org.apache.commons.io.FileUtils;
import org.json.JSONObject;

public class AdobeUXAssetOneUpViewerActivity
  extends AdobeAssetShareBaseOneUpActivity
  implements IAssetViewerActivity
{
  private AdobeCloud _cloud;
  private TextView _commentsCountView;
  private ImageView _commentsMenuIcon;
  private View _commentsMenuView;
  private ReusableImageBitmapWorker _reusableBitmapCacheWorker;
  private MenuItem mCommentsItem;
  private MenuItem mFileInfo;
  private ImageButton mImageSelectbtn;
  
  public AdobeUXAssetOneUpViewerActivity() {}
  
  private void action_showCommentsScreen()
  {
    Object localObject;
    if (AdobeUXAssetViewerAdapter.getCurrentFragment() != null)
    {
      int i = getCurrentFragmentmNum;
      if (i < AdobeAssetViewerController.count()) {
        localObject = AdobeAssetViewerController.getAssetAtPos(i);
      }
    }
    for (;;)
    {
      AdobeAssetViewCommentsTargetAssetController.setTargetAsset((AdobeAsset)localObject);
      localObject = new Intent(this, AdobeAssetViewCommentsActivity.class);
      ((Intent)localObject).putExtra(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY, getIntent().getExtras().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY));
      startActivity((Intent)localObject);
      return;
      localObject = AdobeAssetViewerController.getAssetAtPos(AdobeAssetViewerController.getSelectedIndex());
      continue;
      localObject = AdobeAssetViewerController.getAssetAtPos(AdobeAssetViewerController.getSelectedIndex());
    }
  }
  
  private void action_showCommentsScreenWithReply()
  {
    Object localObject;
    if (AdobeUXAssetViewerAdapter.getCurrentFragment() != null)
    {
      int i = getCurrentFragmentmNum;
      if (i < AdobeAssetViewerController.count()) {
        localObject = AdobeAssetViewerController.getAssetAtPos(i);
      }
    }
    for (;;)
    {
      AdobeAssetViewCommentsTargetAssetController.setTargetAsset((AdobeAsset)localObject);
      localObject = new Intent(this, AdobeAssetViewCommentsActivity.class);
      ((Intent)localObject).putExtra("OPEN_REPLY_WINDOW", true);
      ((Intent)localObject).putExtra(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY, getIntent().getExtras().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY));
      startActivity((Intent)localObject);
      return;
      localObject = AdobeAssetViewerController.getAssetAtPos(AdobeAssetViewerController.getSelectedIndex());
      continue;
      localObject = AdobeAssetViewerController.getAssetAtPos(AdobeAssetViewerController.getSelectedIndex());
    }
  }
  
  private SpannableString getAdobeString(String paramString)
  {
    paramString = new SpannableString(paramString);
    paramString.setSpan(new AdobeCSDKTypefaceSpan(null, AdobeCSDKTypeFace.getTypeface(this)), 0, paramString.length(), 33);
    paramString.setSpan(new ForegroundColorSpan(getResources().getColor(R.color.asset_browser_dark_text)), 0, paramString.length(), 33);
    return paramString;
  }
  
  private String getUniqueNameForAsset(AdobeAsset paramAdobeAsset)
  {
    String str = paramAdobeAsset.getGUID();
    if ((str == null) || (str.length() == 0)) {
      return paramAdobeAsset.getName().replace(".", "_");
    }
    paramAdobeAsset = str.split("/");
    if (paramAdobeAsset.length > 1) {
      return paramAdobeAsset[(paramAdobeAsset.length - 1)];
    }
    return paramAdobeAsset[0];
  }
  
  private void hideMenuItems()
  {
    if (mFileInfo != null) {
      mFileInfo.setVisible(false);
    }
    handleVisibilityOfCommentsMenu(false);
  }
  
  private void onViewFileDetailsPressed()
  {
    AdobeUXAssetDetailsFragment.newInstance(mPos).show(getSupportFragmentManager(), "dialog");
  }
  
  private void setShareIntent()
  {
    final int i = mPos;
    final AdobeAsset localAdobeAsset = AdobeAssetViewerController.getAssetAtPos(mPos);
    IAdobeGenericRequestCallback local4 = new IAdobeGenericRequestCallback()
    {
      protected void handleNoPreview()
      {
        if (AdobeAssetViewerController.isMenuEnabled())
        {
          mImagePath = null;
          return;
        }
        enableOrDisableOpenBtn(i, false);
      }
      
      public void onCancellation()
      {
        handleNoPreview();
      }
      
      public void onCompletion(byte[] paramAnonymousArrayOfByte)
      {
        new AsyncTask()
        {
          boolean _failed;
          
          protected Uri doInBackground(byte[]... paramAnonymous2VarArgs)
          {
            _failed = false;
            if (paramAnonymous2VarArgs == null) {
              _failed = true;
            }
            for (;;)
            {
              return null;
              paramAnonymous2VarArgs = paramAnonymous2VarArgs[0];
              if (paramAnonymous2VarArgs == null)
              {
                _failed = true;
                return null;
              }
              if (!AdobeAssetViewerController.isMenuEnabled()) {
                return null;
              }
              Object localObject = AdobeUXAssetOneUpViewerActivity.this.getUniqueNameForAsset(val$asset);
              try
              {
                localObject = new File(mImagePath, (String)localObject + ".png");
                if (((File)localObject).createNewFile())
                {
                  FileOutputStream localFileOutputStream = new FileOutputStream((File)localObject);
                  localFileOutputStream.write(paramAnonymous2VarArgs);
                  localFileOutputStream.flush();
                  localFileOutputStream.close();
                  paramAnonymous2VarArgs = FileProvider.getUriForFile(AdobeUXAssetOneUpViewerActivity.this, AdobeAssetViewerController.getFileProvideAuthority(), (File)localObject);
                  return paramAnonymous2VarArgs;
                }
              }
              catch (Exception paramAnonymous2VarArgs)
              {
                AdobeLogger.log(Level.DEBUG, "AdobeUXAssetOneUpViewerActivity", null, paramAnonymous2VarArgs);
              }
            }
            return null;
          }
          
          protected void onPostExecute(Uri paramAnonymous2Uri)
          {
            if (AdobeAssetViewerController.isMenuEnabled()) {
              return;
            }
            if (!_failed)
            {
              enableOrDisableOpenBtn(val$assetIndex, true);
              return;
            }
            enableOrDisableOpenBtn(val$assetIndex, false);
          }
          
          protected void onProgressUpdate(Integer... paramAnonymous2VarArgs) {}
        }.execute(new byte[][] { paramAnonymousArrayOfByte });
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        handleNoPreview();
      }
      
      public final void onProgress(double paramAnonymousDouble) {}
    };
    Object localObject = getUniqueNameForAsset(localAdobeAsset);
    localObject = new File(mImagePath, (String)localObject + ".png");
    if (((File)localObject).exists())
    {
      if (AdobeAssetViewerController.isMenuEnabled())
      {
        FileProvider.getUriForFile(this, AdobeAssetViewerController.getFileProvideAuthority(), (File)localObject);
        return;
      }
      enableOrDisableOpenBtn(i, true);
      return;
    }
    ((AdobeAssetFile)localAdobeAsset).getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, new AdobeAssetImageDimensions(0.0F, 0.0F), local4);
  }
  
  private void showMenuItems()
  {
    if (mFileInfo != null) {
      mFileInfo.setVisible(true);
    }
    handleVisibilityOfCommentsMenu(true);
  }
  
  private void updateSelectionBtn()
  {
    AdobeAsset localAdobeAsset = AdobeAssetViewerController.getAssetAtPos(mPos);
    if (mImageSelectbtn != null)
    {
      if (AdobeAssetViewerController.containsAsset((AdobeAssetFile)localAdobeAsset)) {
        mImageSelectbtn.setSelected(true);
      }
    }
    else {
      return;
    }
    mImageSelectbtn.setSelected(false);
  }
  
  public void enableOrDisableOpenBtn(int paramInt, boolean paramBoolean)
  {
    if ((mOpenBtn != null) && (paramInt == mPos))
    {
      mOpenBtn.setEnabled(paramBoolean);
      mImageSelectbtn.setEnabled(paramBoolean);
      if ((!paramBoolean) && (mImageSelectbtn.isSelected()))
      {
        AdobeAsset localAdobeAsset = AdobeAssetViewerController.getAssetAtPos(mPos);
        mImageSelectbtn.setSelected(false);
        AdobeAssetViewerController.removeSelectedAsset((AdobeAssetFile)localAdobeAsset);
      }
      if (paramBoolean) {
        ViewCompat.setAlpha(mOpenBtn, 1.0F);
      }
    }
    else
    {
      return;
    }
    ViewCompat.setAlpha(mOpenBtn, 0.5F);
  }
  
  public int fetchCurrentPageIndex()
  {
    return mPos;
  }
  
  ViewPager.SimpleOnPageChangeListener getItemPageChangeListener()
  {
    return new AdobeUXAssetViewerPageChangeListener(null);
  }
  
  public ReusableImageBitmapWorker getReusableBitmapCacheWorker()
  {
    return _reusableBitmapCacheWorker;
  }
  
  File getShareFile()
  {
    String str = getUniqueNameForAsset(AdobeAssetViewerController.getAssetAtPos(mPos));
    return new File(mImagePath, str + ".png");
  }
  
  public void handleAssetCollectionChanged()
  {
    mAdapter.notifyDataSetChanged();
  }
  
  public void handleAssetSelectionChanged()
  {
    int i = AdobeAssetViewerController.getSelectedAssetCount();
    String str;
    if (i < 1) {
      str = AdobeLocalizedMgr.getLocalizedString(R.string.storage_open_files);
    }
    for (;;)
    {
      mOpenFileText.setText(str);
      return;
      if (i > 99) {
        str = AdobeLocalizedMgr.getLocalizedString(R.string.storage_open_multiple_files_99);
      } else {
        str = String.format(AdobeLocalizedMgr.getLocalizedString(R.string.storage_open_multiple_files), new Object[] { Integer.toString(i) });
      }
    }
  }
  
  public void handleVisibilityOfCommentsMenu(boolean paramBoolean)
  {
    MenuItem localMenuItem;
    if (mCommentsItem != null)
    {
      localMenuItem = mCommentsItem;
      if ((!isNetworkAvailable()) || (!paramBoolean)) {
        break label33;
      }
    }
    label33:
    for (paramBoolean = true;; paramBoolean = false)
    {
      localMenuItem.setVisible(paramBoolean);
      return;
    }
  }
  
  public void hideOrShowActionsBar()
  {
    super.hideOrShowBaseActivityActionsBar();
  }
  
  public void onBackPressed()
  {
    if ((AdobeUXAssetViewerAdapter.getCurrentFragment() != null) && (AdobeUXAssetViewerAdapter.getCurrentFragment().handleBackPressed())) {
      return;
    }
    super.onBackPressed();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(null);
    if ((paramBundle != null) && (paramBundle.getInt("ASSET_ONE_UP_ACTIVITY", -2) != -2)) {
      finish();
    }
    boolean bool2;
    label567:
    label579:
    do
    {
      return;
      paramBundle = new ReusableImageBitmapCache.ImageCacheParams();
      paramBundle.setMemCacheSizePercent(0.1F);
      _reusableBitmapCacheWorker = new ReusableImageBitmapWorker(this);
      _reusableBitmapCacheWorker.addImageCache(getSupportFragmentManager(), paramBundle);
      AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().setApplicationContext(getApplicationContext());
      _cloud = ((AdobeCloud)getIntent().getExtras().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY));
      paramBundle = (Toolbar)findViewById(R.id.actionbar_toolbar);
      _commentsMenuView = getLayoutInflater().inflate(R.layout.adobe_comment_icon_view, null);
      _commentsMenuIcon = ((ImageView)_commentsMenuView.findViewById(R.id.comment_icon));
      _commentsCountView = ((TextView)_commentsMenuView.findViewById(R.id.adobe_comment_count));
      if ((_commentsMenuView != null) && (_cloud.isPrivateCloud()))
      {
        _commentsMenuIcon.setImageResource(R.drawable.ic_forum_black_24dp_disabled);
        _commentsMenuView.setEnabled(false);
        if (_commentsCountView != null) {
          _commentsCountView.setVisibility(4);
        }
      }
      _commentsMenuView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          AdobeUXAssetOneUpViewerActivity.this.action_showCommentsScreen();
        }
      });
      AdobeCSDKActionBarController.setTitle(findViewById(16908290), "Yes");
      if (!AdobeAssetViewerController.isDataSourceValidForAssetViewerLaunch())
      {
        finish();
        return;
      }
      AdobeAssetViewerController.setCurrentAssetViewerActivity(this);
      mAdapter = new AdobeUXAssetViewerAdapter(getSupportFragmentManager());
      mPager = ((ViewPager)findViewById(R.id.library_item_pager));
      mPager.setAdapter(mAdapter);
      mPos = AdobeAssetViewerController.getSelectedIndex();
      mPager.setCurrentItem(mPos, false);
      paramBundle = AdobeAssetViewerController.getAssetAtPos(mPos);
      AdobeCSDKActionBarController.setTitle(findViewById(16908290), paramBundle.getName());
      mPager.setPageTransformer(true, new AdobeDepthPageTransformer());
      mImagePath = new File(getFilesDir(), "adobeassetviewerimages");
      if (!mImagePath.exists()) {
        mImagePath.mkdirs();
      }
      mOpenBtn.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          if (!AdobeAssetViewerController.isMultiSelectModeActive())
          {
            paramAnonymousView = AdobeAssetViewerController.getAssetAtPos(mPos);
            if (!AdobeAssetViewerController.containsAsset((AdobeAssetFile)paramAnonymousView)) {
              AdobeAssetViewerController.addSelectedAsset((AdobeAssetFile)paramAnonymousView);
            }
          }
          paramAnonymousView = new Intent();
          setResult(-1, paramAnonymousView);
          finish();
        }
      });
      mImageSelectbtn = ((ImageButton)findViewById(R.id.library_items_image_selectbtn));
      mPhotoNumber.setText(mPos + 1 + " " + getString(R.string.IDS_ASSET_VIEWER_OF) + " " + AdobeAssetViewerController.count());
      if (!AdobeAssetViewerController.isMenuEnabled())
      {
        mOpenBtnContainer.setVisibility(0);
        if ((AdobeAssetViewerController.isMenuEnabled()) || (!AdobeAssetViewerController.isMultiSelectModeActive())) {
          break label567;
        }
        mImageSelectbtn.setVisibility(0);
      }
      for (;;)
      {
        updateSelectionBtn();
        mImageSelectbtn.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            paramAnonymousView = AdobeAssetViewerController.getAssetAtPos(mPos);
            if (!mImageSelectbtn.isSelected())
            {
              mImageSelectbtn.setSelected(true);
              AdobeAssetViewerController.addSelectedAsset((AdobeAssetFile)paramAnonymousView);
              return;
            }
            mImageSelectbtn.setSelected(false);
            AdobeAssetViewerController.removeSelectedAsset((AdobeAssetFile)paramAnonymousView);
          }
        });
        handleAssetSelectionChanged();
        boolean bool1 = getIntent().getBooleanExtra("START_WITH_COMMENT_WINDOW", false);
        bool2 = getIntent().getBooleanExtra("START_WITH_COMMENT_REPLY_WINDOW", false);
        if (!bool1) {
          break label579;
        }
        action_showCommentsScreen();
        return;
        mOpenBtnContainer.setVisibility(8);
        break;
        mImageSelectbtn.setVisibility(8);
      }
    } while (!bool2);
    action_showCommentsScreenWithReply();
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    if (!AdobeAssetViewerController.isDataSourceValidForAssetViewerLaunch()) {
      return super.onCreateOptionsMenu(paramMenu);
    }
    if (AdobeAssetViewerController.isMenuEnabled())
    {
      getMenuInflater().inflate(R.menu.adobe_ccfiles_assetviewer_menu, paramMenu);
      mCommentsItem = paramMenu.findItem(R.id.adobe_asset_one_up_view_comments_menu);
      if (_commentsMenuView != null) {
        mCommentsItem.setActionView(_commentsMenuView);
      }
      mFileInfo = paramMenu.findItem(R.id.action_view_file_details);
      mFileInfo.setTitleCondensed(getResources().getString(R.string.IDS_ACTION_VIEW_FILE_DETAILS));
      mFileInfo.setTitle(getAdobeString(getResources().getString(R.string.IDS_ACTION_VIEW_FILE_DETAILS)));
      mFileInfo.setVisible(isNetworkAvailable());
      handleVisibilityOfCommentsMenu(true);
    }
    return super.onCreateOptionsMenu(paramMenu);
  }
  
  public void onDestroy()
  {
    AdobeNetworkReachabilityUtil.destorySharedInstance();
    _network_reachbility_obj = null;
    try
    {
      if (mImagePath != null) {
        FileUtils.deleteDirectory(mImagePath);
      }
      super.onDestroy();
      if (_reusableBitmapCacheWorker != null) {
        _reusableBitmapCacheWorker.clearCache();
      }
      _reusableBitmapCacheWorker = null;
      AdobeAssetViewerController.resetCurrentAdobeUXAssetViewerActivity();
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        localIOException.printStackTrace();
      }
    }
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    int i = paramMenuItem.getItemId();
    if (i == 16908332)
    {
      onBackPressed();
      return true;
    }
    if (i == R.id.action_view_file_details)
    {
      AdobeAnalyticsSDKReporter.trackAssetBrowserAction("Show File Info");
      onViewFileDetailsPressed();
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    AdobeAssetViewerController.setSelectedIndex(mPos);
    paramBundle.putInt("ASSET_ONE_UP_ACTIVITY", mPos);
    super.onSaveInstanceState(paramBundle);
  }
  
  protected void onStart()
  {
    super.onStart();
    mPos = AdobeAssetViewerController.getSelectedIndex();
    if (mPos != -1) {
      setCommentCount(AdobeAssetViewerController.getAssetAtPos(mPos).getGUID());
    }
  }
  
  public void setCommentCount(String paramString)
  {
    int i = AdobeNotificationManager.getAssetCommentCount(paramString);
    if (i > 0) {
      if (_commentsCountView != null)
      {
        _commentsCountView.setText("" + i);
        _commentsCountView.setVisibility(0);
      }
    }
    while (_commentsCountView == null) {
      return;
    }
    _commentsCountView.setVisibility(8);
  }
  
  public void showActionsBar()
  {
    if (getSupportActionBar().isShowing()) {
      return;
    }
    hideOrShowBaseActivityActionsBar();
  }
  
  void updateOpenBtnContainerVisibility()
  {
    if (!AdobeAssetViewerController.isMenuEnabled())
    {
      mOpenBtnContainer.setVisibility(0);
      return;
    }
    mOpenBtnContainer.setVisibility(8);
  }
  
  void updateSelectionBtnVisibility(boolean paramBoolean)
  {
    if ((!AdobeAssetViewerController.isMenuEnabled()) && (AdobeAssetViewerController.isMultiSelectModeActive()))
    {
      if (paramBoolean) {
        mImageSelectbtn.setVisibility(0);
      }
    }
    else {
      return;
    }
    mImageSelectbtn.setVisibility(4);
  }
  
  public static class AdobeUXAssetViewerAdapter
    extends FragmentStatePagerAdapter
  {
    protected static AdobeUXAssetViewerAssetFragment _fragmentInstance;
    
    public AdobeUXAssetViewerAdapter(FragmentManager paramFragmentManager)
    {
      super();
    }
    
    public static AdobeUXAssetViewerAssetFragment getCurrentFragment()
    {
      return _fragmentInstance;
    }
    
    public int getCount()
    {
      return AdobeAssetViewerController.count();
    }
    
    public Fragment getItem(int paramInt)
    {
      return AdobeUXAssetViewerAssetFragment.newInstance(paramInt);
    }
    
    public void setPrimaryItem(ViewGroup paramViewGroup, int paramInt, Object paramObject)
    {
      if (_fragmentInstance != paramObject) {
        _fragmentInstance = (AdobeUXAssetViewerAssetFragment)paramObject;
      }
      super.setPrimaryItem(paramViewGroup, paramInt, paramObject);
    }
    
    public static class AdobeUXAssetViewerAssetFragment
      extends Fragment
    {
      private Observer _commentCountObserver;
      private Observer _network_reachability_observer;
      AdobeMultiPageFragmentController fragmentController;
      int mNum;
      int num_pages = 1;
      AdobeOneUpSinglePageAssetController singlePageAssetController;
      
      public AdobeUXAssetViewerAssetFragment() {}
      
      private int checkPageCount(AdobeAsset paramAdobeAsset)
      {
        if ((paramAdobeAsset instanceof AdobeAssetFile))
        {
          paramAdobeAsset = (AdobeAssetFile)paramAdobeAsset;
          if (paramAdobeAsset.getOptionalMetadata() != null) {
            num_pages = paramAdobeAsset.getOptionalMetadata().optInt("pages", 1);
          }
          return num_pages;
        }
        return 0;
      }
      
      static AdobeUXAssetViewerAssetFragment newInstance(int paramInt)
      {
        AdobeUXAssetViewerAssetFragment localAdobeUXAssetViewerAssetFragment = new AdobeUXAssetViewerAssetFragment();
        Bundle localBundle = new Bundle();
        localBundle.putInt("num", paramInt);
        localAdobeUXAssetViewerAssetFragment.setArguments(localBundle);
        return localAdobeUXAssetViewerAssetFragment;
      }
      
      ReusableImageBitmapWorker getReusableImageWorker()
      {
        AdobeUXAssetOneUpViewerActivity localAdobeUXAssetOneUpViewerActivity = (AdobeUXAssetOneUpViewerActivity)getActivity();
        ReusableImageBitmapWorker localReusableImageBitmapWorker = null;
        if (localAdobeUXAssetOneUpViewerActivity != null) {
          localReusableImageBitmapWorker = localAdobeUXAssetOneUpViewerActivity.getReusableBitmapCacheWorker();
        }
        return localReusableImageBitmapWorker;
      }
      
      public boolean handleBackPressed()
      {
        if ((num_pages > 1) && (fragmentController.getState() == AdobeMultiPageViewState.AdobeMultiPageViewPager))
        {
          if (fragmentController.getPreviousState() == AdobeMultiPageViewState.AdobeMultiPageGridView) {
            fragmentController.displayGridView();
          }
          while (fragmentController.getPreviousState() != AdobeMultiPageViewState.AdobeMultiPageListView) {
            return true;
          }
          fragmentController.displayListView();
          return true;
        }
        return false;
      }
      
      public void onConfigurationChanged(Configuration paramConfiguration)
      {
        if (fragmentController != null) {
          fragmentController.handleOrientationChange();
        }
        super.onConfigurationChanged(paramConfiguration);
      }
      
      public void onCreate(Bundle paramBundle)
      {
        super.onCreate(paramBundle);
        if (getArguments() != null) {}
        for (int i = getArguments().getInt("num");; i = 1)
        {
          mNum = i;
          return;
        }
      }
      
      public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
      {
        paramBundle = null;
        AdobeAsset localAdobeAsset = AdobeAssetViewerController.getAssetAtPos(mNum);
        num_pages = checkPageCount(localAdobeAsset);
        if (num_pages == 1)
        {
          paramViewGroup = paramLayoutInflater.inflate(R.layout.fragment_asset_image, paramViewGroup, false);
          paramLayoutInflater = paramViewGroup.findViewById(R.id.asset_image_view);
          singlePageAssetController = new AdobeOneUpSinglePageAssetController();
          singlePageAssetController.setReuseableBitmapCacheWorker(getReusableImageWorker());
          singlePageAssetController.setMainRootView(paramViewGroup);
          singlePageAssetController.setAsset(localAdobeAsset);
          singlePageAssetController.setCurrentAssetPos(mNum);
          singlePageAssetController.performInitialization(getActivity());
          singlePageAssetController.initiateDisplay();
        }
        for (;;)
        {
          paramBundle = new View.OnLongClickListener()
          {
            public boolean onLongClick(View paramAnonymousView)
            {
              getActivity()).mLayout.setVisibility(0);
              return true;
            }
          };
          if ((AdobeAssetViewerController.isMenuEnabled()) && (paramLayoutInflater != null)) {
            paramLayoutInflater.setOnLongClickListener(paramBundle);
          }
          ((AdobeUXAssetOneUpViewerActivity)getActivity()).setShareIntent();
          return paramViewGroup;
          paramViewGroup = paramLayoutInflater.inflate(R.layout.adobe_multipage_fragment_controller, paramViewGroup, false);
          fragmentController = new AdobeMultiPageFragmentController();
          fragmentController.setFragmentView(paramViewGroup);
          fragmentController.setAsset(localAdobeAsset);
          fragmentController.setState(AdobeMultiPageViewState.AdobeMultiPageGridView);
          fragmentController.performInitiallization(getActivity());
          fragmentController.setReuseableBitmapCacheWorker(getReusableImageWorker());
          fragmentController.provideViewToActivity();
          paramLayoutInflater = paramBundle;
        }
      }
      
      public void onDestroyView()
      {
        super.onDestroyView();
        if (singlePageAssetController != null)
        {
          singlePageAssetController.cancelAnyOneUpImageOperation();
          singlePageAssetController.setMainRootView(null);
          singlePageAssetController = null;
        }
        while (fragmentController == null) {
          return;
        }
      }
      
      public void onStart()
      {
        super.onStart();
        registerLocalNofications();
      }
      
      public void onStop()
      {
        super.onStop();
        unRegisterLocalNotifications();
      }
      
      public void registerLocalNofications()
      {
        if (_network_reachability_observer == null) {
          _network_reachability_observer = new Observer()
          {
            public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
            {
              paramAnonymousObservable = (AdobeNetworkReachability.AdobeNetworkStatus)((AdobeNotification)paramAnonymousObject).getInfo().get("AdobeNetworkReachabilityStatusKey");
              switch (AdobeUXAssetOneUpViewerActivity.5.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode[networkStatusCode.ordinal()])
              {
              default: 
                if (fragmentController != null) {
                  fragmentController.wentOffline();
                }
                break;
              }
              do
              {
                return;
              } while (fragmentController == null);
              fragmentController.wentOnline();
            }
          };
        }
        if (_commentCountObserver == null) {
          _commentCountObserver = new Observer()
          {
            public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
            {
              paramAnonymousObject = (String)((AdobeNotification)paramAnonymousObject).getInfo().get("assetURL");
              if (AdobeUXAssetOneUpViewerActivity.AdobeUXAssetViewerAdapter.getCurrentFragment() != null)
              {
                int i = getCurrentFragmentmNum;
                if (i < AdobeAssetViewerController.count()) {
                  paramAnonymousObservable = AdobeAssetViewerController.getAssetAtPos(i);
                }
              }
              for (;;)
              {
                if (paramAnonymousObservable.getGUID().equalsIgnoreCase(paramAnonymousObject)) {
                  ((AdobeUXAssetOneUpViewerActivity)getActivity()).setCommentCount(paramAnonymousObject);
                }
                return;
                paramAnonymousObservable = AdobeAssetViewerController.getAssetAtPos(AdobeAssetViewerController.getSelectedIndex());
                continue;
                paramAnonymousObservable = AdobeAssetViewerController.getAssetAtPos(AdobeAssetViewerController.getSelectedIndex());
              }
            }
          };
        }
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeCCFilesNotificationRefreshCommentCount, _commentCountObserver);
      }
      
      public void unRegisterLocalNotifications()
      {
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeCCFilesNotificationRefreshCommentCount, _commentCountObserver);
      }
    }
  }
  
  private class AdobeUXAssetViewerPageChangeListener
    extends ViewPager.SimpleOnPageChangeListener
  {
    private AdobeUXAssetViewerPageChangeListener() {}
    
    public void onPageSelected(int paramInt)
    {
      mPos = paramInt;
      if (AdobeAssetShareBaseOneUpActivity.isNetworkAvailable()) {
        AdobeUXAssetOneUpViewerActivity.this.showMenuItems();
      }
      for (;;)
      {
        if (mPhotoNumber != null) {
          mPhotoNumber.setText(mPos + 1 + " " + getString(R.string.IDS_ASSET_VIEWER_OF) + " " + AdobeAssetViewerController.count());
        }
        AdobeAsset localAdobeAsset = AdobeAssetViewerController.getAssetAtPos(mPos);
        AdobeUXAssetOneUpViewerActivity.this.updateSelectionBtn();
        setCommentCount(localAdobeAsset.getGUID());
        AdobeCSDKActionBarController.setTitle(findViewById(16908290), localAdobeAsset.getName());
        AdobeUXAssetOneUpViewerActivity.this.setShareIntent();
        if (mPos >= AdobeAssetViewerController.count() - 5) {
          AdobeAssetViewerController.loadNextPage();
        }
        return;
        AdobeUXAssetOneUpViewerActivity.this.hideMenuItems();
      }
    }
  }
}
