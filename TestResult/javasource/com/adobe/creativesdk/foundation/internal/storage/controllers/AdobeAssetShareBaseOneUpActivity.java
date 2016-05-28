package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.content.FileProvider;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.SimpleOnPageChangeListener;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.Toolbar;
import android.view.KeyCharacterMap;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.internal.utils.DrawShadowRelativeLayout;
import com.sothree.slidinguppanel.SlidingUpPanelLayout;
import com.sothree.slidinguppanel.SlidingUpPanelLayout.PanelState;
import java.io.File;

public abstract class AdobeAssetShareBaseOneUpActivity
  extends ActionBarActivity
{
  static AdobeNetworkReachability _network_reachbility_obj;
  protected DrawShadowRelativeLayout _rootShadowRelativeLayout;
  FragmentStatePagerAdapter mAdapter;
  FrameLayout mDummyLayout;
  File mImagePath;
  SlidingUpPanelLayout mLayout;
  View mOpenBtn;
  View mOpenBtnContainer;
  TextView mOpenFileText;
  ViewPager mPager;
  private View.OnTouchListener mPagerOnTouchListener = new View.OnTouchListener()
  {
    private float pointX;
    private float pointY;
    private final int tolerance = 50;
    
    public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
    {
      switch (paramAnonymousMotionEvent.getAction())
      {
      }
      label140:
      label144:
      for (;;)
      {
        return false;
        pointX = paramAnonymousMotionEvent.getX();
        pointY = paramAnonymousMotionEvent.getY();
        return false;
        int i;
        if ((pointX + 50.0F > paramAnonymousMotionEvent.getX()) && (pointX - 50.0F < paramAnonymousMotionEvent.getX()))
        {
          i = 1;
          if ((pointY + 50.0F <= paramAnonymousMotionEvent.getY()) || (pointY - 50.0F >= paramAnonymousMotionEvent.getY())) {
            break label140;
          }
        }
        for (int j = 1;; j = 0)
        {
          if ((i == 0) || (j == 0)) {
            break label144;
          }
          hideOrShowBaseActivityActionsBar();
          return false;
          i = 0;
          break;
        }
      }
    }
  };
  TextView mPhotoNumber;
  int mPos;
  
  public AdobeAssetShareBaseOneUpActivity() {}
  
  public static boolean isNetworkAvailable()
  {
    if (_network_reachbility_obj == null) {
      _network_reachbility_obj = AdobeNetworkReachabilityUtil.getSharedInstance();
    }
    return _network_reachbility_obj.isOnline();
  }
  
  public int getCurrentIndex()
  {
    return mPos;
  }
  
  abstract ViewPager.SimpleOnPageChangeListener getItemPageChangeListener();
  
  public DrawShadowRelativeLayout getShadowRelativeLayout()
  {
    return _rootShadowRelativeLayout;
  }
  
  abstract File getShareFile();
  
  public Intent getShareIntent()
  {
    Object localObject = getShareFile();
    if ((localObject != null) && (((File)localObject).exists()))
    {
      Intent localIntent = new Intent("android.intent.action.SEND");
      if (AdobeAssetViewerController.isMenuEnabled())
      {
        localObject = FileProvider.getUriForFile(this, AdobeAssetViewerController.getFileProvideAuthority(), (File)localObject);
        localIntent.setType("image/*");
        localIntent.putExtra("android.intent.extra.STREAM", (Parcelable)localObject);
        localIntent.addFlags(1);
      }
      return localIntent;
    }
    Toast.makeText(getApplicationContext(), "Preview Not available, nothing to share", 1).show();
    return null;
  }
  
  public SlidingUpPanelLayout getSlidingUpPanel()
  {
    return mLayout;
  }
  
  @SuppressLint({"InlinedApi"})
  protected void hideOrShowBaseActivityActionsBar()
  {
    Object localObject = getSupportActionBar();
    boolean bool1 = ViewConfiguration.get(this).hasPermanentMenuKey();
    boolean bool2 = KeyCharacterMap.deviceHasKey(4);
    if (localObject != null)
    {
      if (((ActionBar)localObject).isShowing())
      {
        ((ActionBar)localObject).hide();
        _rootShadowRelativeLayout.setShadowVisible(false, false);
        mOpenBtnContainer.setVisibility(8);
        updateSelectionBtnVisibility(false);
        mPager.setBackgroundColor(getResources().getColor(R.color.asset_detail_blackBackGround));
        mPager.setPadding(0, 0, 0, 0);
        int i = 0;
        if (Build.VERSION.SDK_INT >= 16)
        {
          j = 0x0 | 0x4;
          i = j;
          if (Build.VERSION.SDK_INT >= 19) {
            i = j | 0x800;
          }
        }
        localObject = getWindow().getDecorView();
        int j = i;
        if (!bool1)
        {
          j = i;
          if (!bool2) {
            j = i | 0x702;
          }
        }
        ((View)localObject).setSystemUiVisibility(j);
      }
    }
    else {
      return;
    }
    ((ActionBar)localObject).show();
    _rootShadowRelativeLayout.setShadowVisible(true, false);
    updateOpenBtnContainerVisibility();
    updateSelectionBtnVisibility(true);
    mPager.setBackgroundColor(getResources().getColor(R.color.creative_sdk_background_color));
    mPager.setPadding(0, ((ActionBar)localObject).getHeight(), 0, 0);
    getWindow().getDecorView().setSystemUiVisibility(0);
  }
  
  public void onBackPressed()
  {
    if (mLayout.getVisibility() == 0)
    {
      mLayout.setPanelState(SlidingUpPanelLayout.PanelState.COLLAPSED);
      mLayout.setVisibility(4);
      ListView localListView = (ListView)findViewById(R.id.shareList);
      if (localListView != null)
      {
        localListView.smoothScrollToPosition(0);
        localListView.setClickable(false);
      }
      return;
    }
    super.onBackPressed();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.adobe_library_item_collection_activity);
    _rootShadowRelativeLayout = ((DrawShadowRelativeLayout)findViewById(R.id.library_oneup_rootview));
    _rootShadowRelativeLayout.setShadowTopOffset(getResources().getDimensionPixelSize(R.dimen.ActionBar_Size));
    setSupportActionBar((Toolbar)findViewById(R.id.actionbar_toolbar));
    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    getSupportActionBar().setHomeButtonEnabled(true);
    getSupportActionBar().setDisplayOptions(14);
    mPager = ((ViewPager)findViewById(R.id.library_item_pager));
    mPager.setOnPageChangeListener(getItemPageChangeListener());
    paramBundle = getSupportActionBar();
    if (paramBundle != null) {
      paramBundle.setDisplayHomeAsUpEnabled(true);
    }
    mPager.setOnTouchListener(mPagerOnTouchListener);
    mPager.setPageTransformer(true, new AdobeDepthPageTransformer());
    mOpenBtnContainer = findViewById(R.id.library_item_open_button_container);
    mOpenBtn = findViewById(R.id.library_item_selection_open_file_btn);
    mPhotoNumber = ((TextView)findViewById(R.id.library_item_photo_number));
    mOpenFileText = ((TextView)findViewById(R.id.library_item_selection_open_file_text));
    updateOpenBtnContainerVisibility();
    if (_network_reachbility_obj == null) {
      _network_reachbility_obj = AdobeNetworkReachabilityUtil.getSharedInstance();
    }
    mDummyLayout = ((FrameLayout)findViewById(R.id.dummy_framelayout));
    mLayout = ((SlidingUpPanelLayout)findViewById(R.id.sliding_layout));
    mDummyLayout.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        mLayout.setPanelState(SlidingUpPanelLayout.PanelState.COLLAPSED);
        mLayout.setVisibility(4);
      }
    });
    mLayout.setVisibility(4);
    mLayout.setPanelState(SlidingUpPanelLayout.PanelState.HIDDEN);
    mImagePath = new File(getFilesDir(), "adobeassetviewerimages");
    if (!mImagePath.exists()) {
      mImagePath.mkdirs();
    }
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 16908332)
    {
      onBackPressed();
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  void setActionBarTitle(String paramString)
  {
    AdobeCSDKActionBarController.setTitle(findViewById(16908290), paramString);
  }
  
  abstract void updateOpenBtnContainerVisibility();
  
  abstract void updateSelectionBtnVisibility(boolean paramBoolean);
}
