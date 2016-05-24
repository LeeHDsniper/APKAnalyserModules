package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.content.FileProvider;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.SimpleOnPageChangeListener;
import android.support.v7.app.ActionBar;
import android.util.DisplayMetrics;
import android.view.KeyCharacterMap;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemCharacterStyle;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemLayoutStyle;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageLibrarySelectionState;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.LibraryItemsOneUpViewController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeLibraryItemUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.internal.utils.DrawShadowRelativeLayout;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemBrush;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColor;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColorTheme;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemImage;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemLook;
import com.sothree.slidinguppanel.SlidingUpPanelLayout;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;
import uk.co.senab.photoview.PhotoView;
import uk.co.senab.photoview.PhotoViewAttacher;
import uk.co.senab.photoview.PhotoViewAttacher.OnViewTapListener;

public class AdobeUXLibraryItemCollectionOneUpViewerActivity
  extends AdobeAssetShareBaseOneUpActivity
{
  private Observer _libraryOneupControllerInitializedObserver = null;
  
  public AdobeUXLibraryItemCollectionOneUpViewerActivity() {}
  
  private String getUniqueNameForLibraryItem(AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
  {
    String str = paramAdobeAssetLibraryItem.getItemID();
    if ((str == null) || (str.length() == 0)) {
      return paramAdobeAssetLibraryItem.getName().replace(".", "_");
    }
    paramAdobeAssetLibraryItem = str.split("/");
    if (paramAdobeAssetLibraryItem.length > 1) {
      return paramAdobeAssetLibraryItem[(paramAdobeAssetLibraryItem.length - 1)];
    }
    return paramAdobeAssetLibraryItem[0];
  }
  
  private void handleOpenBtnClick()
  {
    AdobeAssetLibraryItem localAdobeAssetLibraryItem = getCurrentLibraryItem();
    if (AdobeStorageLibrarySelectionState.isSelectModeActive()) {
      AdobeStorageLibrarySelectionState.selectLibraryItem(localAdobeAssetLibraryItem, localAdobeAssetLibraryItem.getLibrary());
    }
    setResult(-1, new Intent());
    finish();
  }
  
  private boolean isCurrentItemRenderable()
  {
    return (LibraryItemsOneUpViewController.getInstance().getItemAtPos(mPos) instanceof AdobeAssetLibraryItemImage);
  }
  
  private void removeLibraryInitializedObserver()
  {
    if (_libraryOneupControllerInitializedObserver != null)
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeLibraryOneUpControllerInitialized, _libraryOneupControllerInitializedObserver);
      _libraryOneupControllerInitializedObserver = null;
    }
  }
  
  private void setUpLibraryController(Bundle paramBundle)
  {
    if (LibraryItemsOneUpViewController.getInstance() != null)
    {
      startItemsOneUpDisplay();
      return;
    }
    _libraryOneupControllerInitializedObserver = new Observer()
    {
      public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
      {
        AdobeUXLibraryItemCollectionOneUpViewerActivity.this.removeLibraryInitializedObserver();
        AdobeUXLibraryItemCollectionOneUpViewerActivity.this.startItemsOneUpDisplay();
      }
    };
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeLibraryOneUpControllerInitialized, _libraryOneupControllerInitializedObserver);
    LibraryItemsOneUpViewController.createInstanceFromConfigurationBundle(paramBundle);
  }
  
  private void startItemsOneUpDisplay()
  {
    mAdapter = new AdobeUXLibraryItemCollectionAdapter(getSupportFragmentManager());
    mPager.setAdapter(mAdapter);
    mPos = LibraryItemsOneUpViewController.getInstance().getStartIndex();
    mPager.setCurrentItem(mPos, false);
    updateTitleOfActivity();
  }
  
  private void updateTitleOfActivity()
  {
    if (mPhotoNumber != null)
    {
      localObject = String.format(getString(R.string.IDS_ASSET_VIEWER_OF_2), new Object[] { Integer.valueOf(mPos + 1), Integer.valueOf(LibraryItemsOneUpViewController.getInstance().getCount()) });
      mPhotoNumber.setText((CharSequence)localObject);
    }
    Object localObject = LibraryItemsOneUpViewController.getInstance().getItemAtPos(mPos);
    if (localObject != null)
    {
      if ((localObject instanceof AdobeAssetLibraryItemColor)) {
        setActionBarTitle(((AdobeAssetLibraryItemColor)localObject).colorNameOrHexValue());
      }
    }
    else {
      return;
    }
    setActionBarTitle(((AdobeAssetLibraryItem)localObject).nameOrIdForDisplay());
  }
  
  void generateShareIntentInfo()
  {
    if (!AdobeAssetViewerController.isMenuEnabled()) {}
    label129:
    for (;;)
    {
      return;
      int i = mPos;
      Object localObject2 = LibraryItemsOneUpViewController.getInstance().getItemAtPos(mPos);
      if ((localObject2 instanceof AdobeAssetLibraryItemImage))
      {
        Object localObject1 = (AdobeAssetLibraryItemImage)localObject2;
        if (((AdobeAssetLibraryItemImage)localObject1).getPrimaryComponentType().equals("image/vnd.adobe.shape+svg")) {}
        for (localObject1 = ((AdobeAssetLibraryItemImage)localObject1).getRendition();; localObject1 = ((AdobeAssetLibraryItemImage)localObject1).getImage())
        {
          if (localObject1 == null) {
            break label129;
          }
          IAdobeGenericCompletionCallback local3 = new IAdobeGenericCompletionCallback()
          {
            public void onCompletion(Bitmap paramAnonymousBitmap)
            {
              Object localObject = AdobeUXLibraryItemCollectionOneUpViewerActivity.this.getUniqueNameForLibraryItem(val$item);
              try
              {
                localObject = new File(mImagePath, (String)localObject + ".png");
                if (((File)localObject).createNewFile())
                {
                  FileOutputStream localFileOutputStream = new FileOutputStream((File)localObject);
                  paramAnonymousBitmap.compress(Bitmap.CompressFormat.PNG, 100, localFileOutputStream);
                  localFileOutputStream.flush();
                  localFileOutputStream.close();
                  FileProvider.getUriForFile(AdobeUXLibraryItemCollectionOneUpViewerActivity.this, AdobeAssetViewerController.getFileProvideAuthority(), (File)localObject);
                }
                return;
              }
              catch (Exception paramAnonymousBitmap)
              {
                AdobeLogger.log(Level.DEBUG, "AdobeUXLibraryItemCollectionOneUpViewerActivity", null, paramAnonymousBitmap);
              }
            }
          };
          localObject2 = getUniqueNameForLibraryItem((AdobeAssetLibraryItem)localObject2);
          if (new File(mImagePath, (String)localObject2 + ".png").exists()) {
            break;
          }
          AdobeLibraryItemUtils.getImageRendition((AdobeAssetFile)localObject1, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION, local3);
          return;
        }
      }
    }
  }
  
  AdobeAssetLibraryItem getCurrentLibraryItem()
  {
    return LibraryItemsOneUpViewController.getInstance().getItemAtPos(mPager.getCurrentItem());
  }
  
  protected ViewPager.SimpleOnPageChangeListener getItemPageChangeListener()
  {
    return new AdobeUXLibraryItemCollectionPageChangeListener(null);
  }
  
  File getShareFile()
  {
    String str = getUniqueNameForLibraryItem(LibraryItemsOneUpViewController.getInstance().getItemAtPos(mPos));
    return new File(mImagePath, str + ".png");
  }
  
  @SuppressLint({"InlinedApi"})
  public void hideOrShowActionsBar()
  {
    Object localObject = getSupportActionBar();
    boolean bool1 = ViewConfiguration.get(this).hasPermanentMenuKey();
    boolean bool2 = KeyCharacterMap.deviceHasKey(4);
    if (localObject != null)
    {
      if (((ActionBar)localObject).isShowing())
      {
        ((ActionBar)localObject).hide();
        mOpenBtnContainer.setVisibility(8);
        _rootShadowRelativeLayout.setShadowVisible(false, false);
        updatePageBackground(false);
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
    updatePageBackground(false);
    mPager.setPadding(0, ((ActionBar)localObject).getHeight(), 0, 0);
    getWindow().getDecorView().setSystemUiVisibility(0);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mOpenBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeUXLibraryItemCollectionOneUpViewerActivity.this.handleOpenBtnClick();
      }
    });
    setUpLibraryController(paramBundle);
  }
  
  public void onDestroy()
  {
    removeLibraryInitializedObserver();
    AdobeNetworkReachabilityUtil.destorySharedInstance();
    _network_reachbility_obj = null;
    super.onDestroy();
  }
  
  public void onSaveInstanceState(Bundle paramBundle, PersistableBundle paramPersistableBundle)
  {
    super.onSaveInstanceState(paramBundle, paramPersistableBundle);
    LibraryItemsOneUpViewController.getInstance().saveInstanceState(paramBundle);
  }
  
  protected void updateOpenBtnContainerVisibility()
  {
    if (AdobeStorageLibrarySelectionState.isSelectModeActive())
    {
      mOpenBtnContainer.setVisibility(0);
      return;
    }
    mOpenBtnContainer.setVisibility(8);
  }
  
  public void updatePageBackground(boolean paramBoolean)
  {
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null)
    {
      if (localActionBar.isShowing()) {
        mPager.setBackgroundColor(getResources().getColor(R.color.creative_sdk_background_color));
      }
    }
    else {
      return;
    }
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (mAdapter != null)
    {
      bool1 = bool2;
      if (mAdapter.getCount() > 0) {
        bool1 = getCurrentLibraryItem() instanceof AdobeAssetLibraryItemImage;
      }
    }
    if ((bool1) && (!paramBoolean))
    {
      mPager.setBackgroundResource(R.drawable.checkered);
      return;
    }
    mPager.setBackgroundColor(-16777216);
  }
  
  void updateSelectionBtnVisibility(boolean paramBoolean) {}
  
  public static class AdobeUXLibraryItemCollectionAdapter
    extends FragmentStatePagerAdapter
  {
    public AdobeUXLibraryItemCollectionAdapter(FragmentManager paramFragmentManager)
    {
      super();
    }
    
    public int getCount()
    {
      return LibraryItemsOneUpViewController.getInstance().getCount();
    }
    
    public Fragment getItem(int paramInt)
    {
      return AdobeUXLibraryItemCollectionOneUpViewerActivity.AdobeUXLibraryItemFragment.newInstance(paramInt);
    }
  }
  
  private class AdobeUXLibraryItemCollectionPageChangeListener
    extends ViewPager.SimpleOnPageChangeListener
  {
    private AdobeUXLibraryItemCollectionPageChangeListener() {}
    
    public void onPageSelected(int paramInt)
    {
      mPos = paramInt;
      AdobeUXLibraryItemCollectionOneUpViewerActivity.this.updateTitleOfActivity();
      updatePageBackground(false);
      generateShareIntentInfo();
    }
  }
  
  public static class AdobeUXLibraryItemFragment
    extends Fragment
  {
    private RelativeLayout _main_content_container;
    private View _noInternetConnView;
    private View _noPreviewView;
    AdobeUXLibraryItemCollectionOneUpViewerActivity.PhotoViewData _photoViewData;
    private ProgressBar _spinner;
    private int mIndexPos;
    
    public AdobeUXLibraryItemFragment() {}
    
    private void handleNoImageItemPreview()
    {
      visibilityhandler_isOffLineOrError(false);
    }
    
    private void initializeViewWithLibraryItem(int paramInt)
    {
      AdobeAssetLibraryItem localAdobeAssetLibraryItem = LibraryItemsOneUpViewController.getInstance().getItemAtPos(paramInt);
      if (localAdobeAssetLibraryItem == null) {}
      do
      {
        return;
        if ((localAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemColor))
        {
          setupColorView((AdobeAssetLibraryItemColor)localAdobeAssetLibraryItem);
          setSpinnerVisibility(false);
          return;
        }
        if ((localAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemColorTheme))
        {
          setupColorThemeView((AdobeAssetLibraryItemColorTheme)localAdobeAssetLibraryItem);
          setSpinnerVisibility(false);
          return;
        }
      } while (!libraryItemAsImageRendition(localAdobeAssetLibraryItem));
      setupLibraryImageCollectionView(localAdobeAssetLibraryItem);
    }
    
    private boolean libraryItemAsImageRendition(AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
    {
      return ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemImage)) || ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemBrush)) || ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemCharacterStyle)) || ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemLayoutStyle)) || ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemLook));
    }
    
    public static Fragment newInstance(int paramInt)
    {
      AdobeUXLibraryItemFragment localAdobeUXLibraryItemFragment = new AdobeUXLibraryItemFragment();
      Bundle localBundle = new Bundle();
      localBundle.putInt("indexPos", paramInt);
      localAdobeUXLibraryItemFragment.setArguments(localBundle);
      return localAdobeUXLibraryItemFragment;
    }
    
    private void setSpinnerVisibility(boolean paramBoolean)
    {
      ProgressBar localProgressBar = _spinner;
      if (paramBoolean) {}
      for (int i = 0;; i = 8)
      {
        localProgressBar.setVisibility(i);
        return;
      }
    }
    
    private void setupColorThemeView(AdobeAssetLibraryItemColorTheme paramAdobeAssetLibraryItemColorTheme)
    {
      LinearLayout localLinearLayout1 = new LinearLayout(getActivity());
      Object localObject = new RelativeLayout.LayoutParams(getResources().getDimensionPixelSize(R.dimen.adobe_library_oneup_colortheme_width), getResources().getDimensionPixelSize(R.dimen.adobe_library_oneup_colortheme_height));
      ((RelativeLayout.LayoutParams)localObject).addRule(13);
      localLinearLayout1.setLayoutParams((ViewGroup.LayoutParams)localObject);
      paramAdobeAssetLibraryItemColorTheme = paramAdobeAssetLibraryItemColorTheme.getRGBColors();
      if (paramAdobeAssetLibraryItemColorTheme != null)
      {
        localObject = new LinearLayout.LayoutParams(0, -1);
        weight = 1.0F;
        int i = 0;
        while (i < 5)
        {
          LinearLayout localLinearLayout2 = new LinearLayout(getActivity());
          localLinearLayout2.setLayoutParams((ViewGroup.LayoutParams)localObject);
          if (i < paramAdobeAssetLibraryItemColorTheme.size()) {
            localLinearLayout2.setBackgroundColor(((Integer)paramAdobeAssetLibraryItemColorTheme.get(i)).intValue());
          }
          localLinearLayout1.addView(localLinearLayout2);
          i += 1;
        }
      }
      _main_content_container.addView(localLinearLayout1);
    }
    
    private void setupColorView(AdobeAssetLibraryItemColor paramAdobeAssetLibraryItemColor)
    {
      RelativeLayout localRelativeLayout = new RelativeLayout(getActivity());
      int i = getResources().getDimensionPixelSize(R.dimen.adobe_library_oneup_color_size);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(i, i);
      localLayoutParams.addRule(13);
      localRelativeLayout.setLayoutParams(localLayoutParams);
      localRelativeLayout.setBackgroundColor(paramAdobeAssetLibraryItemColor.color());
      _main_content_container.addView(localRelativeLayout);
    }
    
    private void setupLibraryImageCollectionView(AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
    {
      final PhotoView localPhotoView = new PhotoView(getActivity());
      Object localObject1 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject1).addRule(13);
      localPhotoView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
      localObject1 = new PhotoViewAttacher(localPhotoView);
      ((PhotoViewAttacher)localObject1).setOnViewTapListener(new PhotoViewAttacher.OnViewTapListener()
      {
        public void onViewTap(View paramAnonymousView, float paramAnonymousFloat1, float paramAnonymousFloat2)
        {
          if (getActivity() != null) {
            ((AdobeUXLibraryItemCollectionOneUpViewerActivity)getActivity()).hideOrShowActionsBar();
          }
        }
      });
      Object localObject2 = new View.OnLongClickListener()
      {
        public boolean onLongClick(View paramAnonymousView)
        {
          paramAnonymousView = (AdobeUXLibraryItemCollectionOneUpViewerActivity)getActivity();
          if (paramAnonymousView.isCurrentItemRenderable()) {
            mLayout.setVisibility(0);
          }
          return true;
        }
      };
      if (AdobeAssetViewerController.isMenuEnabled()) {
        ((PhotoViewAttacher)localObject1).setOnLongClickListener((View.OnLongClickListener)localObject2);
      }
      localObject1 = new IAdobeGenericCompletionCallback()
      {
        public void onCompletion(Bitmap paramAnonymousBitmap)
        {
          if (getActivity() == null) {}
          do
          {
            return;
            if ((paramAnonymousBitmap == null) && (_photoViewData == null))
            {
              AdobeUXLibraryItemCollectionOneUpViewerActivity.AdobeUXLibraryItemFragment.this.handleNoImageItemPreview();
              return;
            }
          } while ((_photoViewData != null) && ((paramAnonymousBitmap.getWidth() <= _photoViewData._currentImageWidth) || (paramAnonymousBitmap.getHeight() <= _photoViewData._currentImageHeight)));
          visibilityhandler_isOnLine();
          _photoViewData = new AdobeUXLibraryItemCollectionOneUpViewerActivity.PhotoViewData();
          _photoViewData._currentImageWidth = paramAnonymousBitmap.getWidth();
          _photoViewData._currentImageHeight = paramAnonymousBitmap.getHeight();
          Object localObject = getResources().getDisplayMetrics();
          if ((paramAnonymousBitmap.getWidth() < widthPixels) || (paramAnonymousBitmap.getHeight() < heightPixels)) {}
          for (localObject = new RelativeLayout.LayoutParams(-1, -1);; localObject = new RelativeLayout.LayoutParams(-2, -2))
          {
            ((RelativeLayout.LayoutParams)localObject).addRule(13);
            localPhotoView.setLayoutParams((ViewGroup.LayoutParams)localObject);
            localPhotoView.setImageBitmap(paramAnonymousBitmap);
            AdobeUXLibraryItemCollectionOneUpViewerActivity.AdobeUXLibraryItemFragment.this.setSpinnerVisibility(false);
            paramAnonymousBitmap = (AdobeUXLibraryItemCollectionOneUpViewerActivity)getActivity();
            if (paramAnonymousBitmap == null) {
              break;
            }
            paramAnonymousBitmap.generateShareIntentInfo();
            return;
          }
        }
      };
      localObject2 = new AdobeAssetImageDimensions(1024.0F, 1024.0F);
      paramAdobeAssetLibraryItem = AdobeLibraryItemUtils.getRenditionFile(paramAdobeAssetLibraryItem);
      if (paramAdobeAssetLibraryItem != null) {
        AdobeLibraryItemUtils.getImageRendition(paramAdobeAssetLibraryItem, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, (AdobeAssetImageDimensions)localObject2, (IAdobeGenericCompletionCallback)localObject1);
      }
      for (;;)
      {
        _main_content_container.addView(localPhotoView);
        return;
        ((IAdobeGenericCompletionCallback)localObject1).onCompletion(null);
      }
    }
    
    public void onAttach(Activity paramActivity)
    {
      super.onAttach(paramActivity);
    }
    
    public void onCreate(Bundle paramBundle)
    {
      super.onCreate(paramBundle);
      if (getArguments() != null) {}
      for (int i = getArguments().getInt("indexPos");; i = -1)
      {
        mIndexPos = i;
        return;
      }
    }
    
    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      paramLayoutInflater = paramLayoutInflater.inflate(R.layout.library_item_fragment, paramViewGroup, false);
      _main_content_container = ((RelativeLayout)paramLayoutInflater.findViewById(R.id.library_item_fragment_content_container));
      _noInternetConnView = paramLayoutInflater.findViewById(R.id.alibrary_item_no_internet_connection);
      _noPreviewView = paramLayoutInflater.findViewById(R.id.library_item_no_preview);
      _spinner = ((ProgressBar)paramLayoutInflater.findViewById(R.id.library_item_progressbar_new));
      setSpinnerVisibility(true);
      if (AdobeAssetShareBaseOneUpActivity.isNetworkAvailable())
      {
        visibilityhandler_isOnLine();
        initializeViewWithLibraryItem(mIndexPos);
        return paramLayoutInflater;
      }
      visibilityhandler_isOffLineOrError(true);
      return paramLayoutInflater;
    }
    
    void visibilityhandler_isOffLineOrError(boolean paramBoolean)
    {
      _main_content_container.setVisibility(8);
      if (paramBoolean)
      {
        _noInternetConnView.setVisibility(0);
        _noPreviewView.setVisibility(8);
      }
      for (;;)
      {
        setSpinnerVisibility(false);
        return;
        _noInternetConnView.setVisibility(8);
        _noPreviewView.setVisibility(0);
      }
    }
    
    void visibilityhandler_isOnLine()
    {
      _main_content_container.setVisibility(0);
      _noInternetConnView.setVisibility(8);
      _noPreviewView.setVisibility(8);
    }
  }
  
  public static class PhotoViewData
  {
    public int _currentImageHeight;
    public int _currentImageWidth;
    
    public PhotoViewData() {}
  }
}
