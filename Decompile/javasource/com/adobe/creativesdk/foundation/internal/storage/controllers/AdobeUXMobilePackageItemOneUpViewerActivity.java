package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.os.PersistableBundle;
import android.provider.MediaStore.Images.Media;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.content.FileProvider;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.SimpleOnPageChangeListener;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetMobileCreationSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStoragePhotoAssetSelectionState;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetCompPage;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetPSMixPage;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetSketchbookPage;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
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
import java.util.Locale;
import java.util.Observable;
import java.util.Observer;
import org.apache.commons.io.FileUtils;
import uk.co.senab.photoview.PhotoView;
import uk.co.senab.photoview.PhotoViewAttacher;
import uk.co.senab.photoview.PhotoViewAttacher.OnViewTapListener;

public class AdobeUXMobilePackageItemOneUpViewerActivity
  extends AdobeAssetShareBaseOneUpActivity
{
  Observer _mobilePackageOneupControllerInitializedObserver = null;
  
  public AdobeUXMobilePackageItemOneUpViewerActivity() {}
  
  private void removeMobilePackageInitializedObserver()
  {
    if (_mobilePackageOneupControllerInitializedObserver != null)
    {
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeMobilePackageOneUpControllerInitialized, _mobilePackageOneupControllerInitializedObserver);
      _mobilePackageOneupControllerInitializedObserver = null;
    }
  }
  
  void generateShareIntentInfo()
  {
    if (!AdobeAssetViewerController.isMenuEnabled()) {}
    final AdobeAssetFile localAdobeAssetFile;
    IAdobeGenericRequestCallback local3;
    String str;
    do
    {
      return;
      int i = mPos;
      localAdobeAssetFile = MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(mPos);
      local3 = new IAdobeGenericRequestCallback()
      {
        protected void handleNoPreview() {}
        
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
                Object localObject = getUniqueNameForAsset(val$asset);
                try
                {
                  localObject = new File(mImagePath, (String)localObject + ".png");
                  if (((File)localObject).createNewFile())
                  {
                    FileOutputStream localFileOutputStream = new FileOutputStream((File)localObject);
                    localFileOutputStream.write(paramAnonymous2VarArgs);
                    localFileOutputStream.flush();
                    localFileOutputStream.close();
                    paramAnonymous2VarArgs = FileProvider.getUriForFile(AdobeUXMobilePackageItemOneUpViewerActivity.this, AdobeAssetViewerController.getFileProvideAuthority(), (File)localObject);
                    return paramAnonymous2VarArgs;
                  }
                }
                catch (Exception paramAnonymous2VarArgs)
                {
                  AdobeLogger.log(Level.DEBUG, "AdobeUXMobilePackageItemOneUpViewerActivity", null, paramAnonymous2VarArgs);
                }
              }
              return null;
            }
            
            protected void onPostExecute(Uri paramAnonymous2Uri)
            {
              if (AdobeAssetViewerController.isMenuEnabled()) {}
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
      str = getUniqueNameForAsset(localAdobeAssetFile);
    } while (new File(mImagePath, str + ".png").exists());
    ((AdobeAssetFile)localAdobeAssetFile).getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, new AdobeAssetImageDimensions(0.0F, 0.0F), local3);
  }
  
  protected ViewPager.SimpleOnPageChangeListener getItemPageChangeListener()
  {
    return new AdobeUXMobilePackageItemPageChangeListener();
  }
  
  protected File getShareFile()
  {
    String str = getUniqueNameForAsset(MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(mPos));
    return new File(mImagePath, str + ".png");
  }
  
  String getUniqueNameForAsset(AdobeAsset paramAdobeAsset)
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
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mOpenBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(mPos);
        AdobeStorageAssetSelectionState.resetSelectedAssets();
        AdobeStoragePhotoAssetSelectionState.resetSelectedAssets();
        AdobeAssetMobileCreationSelectionState.resetSelection();
        AdobeAssetMobileCreationSelectionState.selectPackageItem(MobilePackageItemsOneUpViewController.getInstance().getPackage(), paramAnonymousView);
        paramAnonymousView = new Intent();
        setResult(-1, paramAnonymousView);
        finish();
      }
    });
    setUpMobilePackageController(paramBundle);
  }
  
  public void onDestroy()
  {
    removeMobilePackageInitializedObserver();
    AdobeNetworkReachabilityUtil.destorySharedInstance();
    try
    {
      if (mImagePath != null) {
        FileUtils.deleteDirectory(mImagePath);
      }
      _network_reachbility_obj = null;
      super.onDestroy();
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
  
  public void onSaveInstanceState(Bundle paramBundle, PersistableBundle paramPersistableBundle)
  {
    super.onSaveInstanceState(paramBundle, paramPersistableBundle);
    MobilePackageItemsOneUpViewController.getInstance().saveInstanceState(paramBundle);
  }
  
  protected void setUpMobilePackageController(Bundle paramBundle)
  {
    if (MobilePackageItemsOneUpViewController.getInstance() != null)
    {
      startItemsOneUpDisplay();
      return;
    }
    _mobilePackageOneupControllerInitializedObserver = new Observer()
    {
      public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
      {
        AdobeUXMobilePackageItemOneUpViewerActivity.this.removeMobilePackageInitializedObserver();
        startItemsOneUpDisplay();
      }
    };
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeMobilePackageOneUpControllerInitialized, _mobilePackageOneupControllerInitializedObserver);
    MobilePackageItemsOneUpViewController.createInstanceFromConfigurationBundle(paramBundle);
  }
  
  protected void startItemsOneUpDisplay()
  {
    mAdapter = new AdobeUXMobilePackageItemCollectionAdapter(getSupportFragmentManager());
    mPager.setAdapter(mAdapter);
    mPos = MobilePackageItemsOneUpViewController.getInstance().getStartIndex();
    mPager.setCurrentItem(mPos, false);
    updateTitleOfActivity();
  }
  
  protected void updateOpenBtnContainerVisibility()
  {
    if (!AdobeAssetViewerController.isMenuEnabled())
    {
      mOpenBtnContainer.setVisibility(0);
      return;
    }
    mOpenBtnContainer.setVisibility(8);
  }
  
  void updateSelectionBtnVisibility(boolean paramBoolean) {}
  
  protected void updateTitleOfActivity()
  {
    if (mPhotoNumber != null)
    {
      str = String.format(getString(R.string.IDS_ASSET_VIEWER_OF_2), new Object[] { Integer.valueOf(mPos + 1), Integer.valueOf(MobilePackageItemsOneUpViewController.getInstance().getCount()) });
      mPhotoNumber.setText(str);
    }
    AdobeAssetFile localAdobeAssetFile = MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(mPos);
    String str = AdobeLocalizedMgr.getLocalizedString(R.string.adobe_lineordrawcollection_singular);
    if ((localAdobeAssetFile instanceof AdobeAssetSketchbookPage)) {
      str = AdobeLocalizedMgr.getLocalizedString(R.string.adobe_sketchCollection_singular);
    }
    for (;;)
    {
      if (localAdobeAssetFile != null) {
        setActionBarTitle(str);
      }
      return;
      if ((localAdobeAssetFile instanceof AdobeAssetCompPage)) {
        str = AdobeLocalizedMgr.getLocalizedString(R.string.adobe_composition_collection_singular);
      } else if ((localAdobeAssetFile instanceof AdobeAssetPSMixPage)) {
        str = AdobeLocalizedMgr.getLocalizedString(R.string.adobe_psmix_collection_singular);
      }
    }
  }
  
  public static class AdobeUXMobilePackageItemCollectionAdapter
    extends FragmentStatePagerAdapter
  {
    public AdobeUXMobilePackageItemCollectionAdapter(FragmentManager paramFragmentManager)
    {
      super();
    }
    
    public int getCount()
    {
      return MobilePackageItemsOneUpViewController.getInstance().getCount();
    }
    
    public Fragment getItem(int paramInt)
    {
      return AdobeUXMobilePackageItemOneUpViewerActivity.AdobeUXMobilePackageItemFragment.newInstance(paramInt);
    }
  }
  
  public static class AdobeUXMobilePackageItemFragment
    extends Fragment
  {
    AssetsViewBaseActionBarController _actionBarController;
    private RelativeLayout _main_content_container;
    private View _noInternetConnView;
    private View _noPreviewView;
    AdobeUXMobilePackageItemOneUpViewerActivity.PhotoViewData _photoViewData;
    private ProgressBar _spinner;
    private int mIndexPos;
    
    public AdobeUXMobilePackageItemFragment() {}
    
    private void handleNoImageItemPreview()
    {
      visibilityhandler_isOffLineOrError(false);
    }
    
    private void initializeViewWithMobilePackageItem(int paramInt)
    {
      setupLibraryImageCollectionView(MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(paramInt));
    }
    
    public static Fragment newInstance(int paramInt)
    {
      AdobeUXMobilePackageItemFragment localAdobeUXMobilePackageItemFragment = new AdobeUXMobilePackageItemFragment();
      Bundle localBundle = new Bundle();
      localBundle.putInt("indexPos", paramInt);
      localAdobeUXMobilePackageItemFragment.setArguments(localBundle);
      return localAdobeUXMobilePackageItemFragment;
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
    
    private void setupLibraryImageCollectionView(AdobeAssetFile paramAdobeAssetFile)
    {
      final PhotoView localPhotoView = new PhotoView(getActivity());
      Object localObject = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject).addRule(13);
      localPhotoView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localObject = new PhotoViewAttacher(localPhotoView);
      ((PhotoViewAttacher)localObject).setOnViewTapListener(new PhotoViewAttacher.OnViewTapListener()
      {
        public void onViewTap(View paramAnonymousView, float paramAnonymousFloat1, float paramAnonymousFloat2)
        {
          if (getActivity() != null) {
            ((AdobeUXMobilePackageItemOneUpViewerActivity)getActivity()).hideOrShowBaseActivityActionsBar();
          }
        }
      });
      View.OnLongClickListener local1 = new View.OnLongClickListener()
      {
        public boolean onLongClick(View paramAnonymousView)
        {
          getActivity()).mLayout.setVisibility(0);
          return true;
        }
      };
      if (AdobeAssetViewerController.isMenuEnabled()) {
        ((PhotoViewAttacher)localObject).setOnLongClickListener(local1);
      }
      localObject = new IAdobeGenericRequestCallback()
      {
        public void onCancellation() {}
        
        public void onCompletion(byte[] paramAnonymousArrayOfByte)
        {
          new AsyncTask()
          {
            protected Bitmap doInBackground(byte[]... paramAnonymous2VarArgs)
            {
              paramAnonymous2VarArgs = paramAnonymous2VarArgs[0];
              if (paramAnonymous2VarArgs != null) {
                return BitmapFactory.decodeByteArray(paramAnonymous2VarArgs, 0, paramAnonymous2VarArgs.length);
              }
              return null;
            }
            
            protected void onPostExecute(Bitmap paramAnonymous2Bitmap)
            {
              if (paramAnonymous2Bitmap != null)
              {
                if (getActivity() == null) {}
                do
                {
                  return;
                  if ((paramAnonymous2Bitmap == null) && (_photoViewData == null))
                  {
                    AdobeUXMobilePackageItemOneUpViewerActivity.AdobeUXMobilePackageItemFragment.this.handleNoImageItemPreview();
                    return;
                  }
                } while ((_photoViewData != null) && ((paramAnonymous2Bitmap.getWidth() <= _photoViewData._currentImageWidth) || (paramAnonymous2Bitmap.getHeight() <= _photoViewData._currentImageHeight)));
                visibilityhandler_isOnLine();
                _photoViewData = new AdobeUXMobilePackageItemOneUpViewerActivity.PhotoViewData();
                _photoViewData._currentImageWidth = paramAnonymous2Bitmap.getWidth();
                _photoViewData._currentImageHeight = paramAnonymous2Bitmap.getHeight();
                Object localObject = getResources().getDisplayMetrics();
                if ((paramAnonymous2Bitmap.getWidth() < widthPixels) || (paramAnonymous2Bitmap.getHeight() < heightPixels)) {}
                for (localObject = new RelativeLayout.LayoutParams(-1, -1);; localObject = new RelativeLayout.LayoutParams(-2, -2))
                {
                  ((RelativeLayout.LayoutParams)localObject).addRule(13);
                  val$photoZoomView.setLayoutParams((ViewGroup.LayoutParams)localObject);
                  val$photoZoomView.setImageBitmap(paramAnonymous2Bitmap);
                  AdobeUXMobilePackageItemOneUpViewerActivity.AdobeUXMobilePackageItemFragment.this.setSpinnerVisibility(false);
                  return;
                }
              }
              AdobeLogger.log(Level.ERROR, "AdobeMobileCreations:OneUpView", "Decoding data");
            }
          }.execute(new byte[][] { paramAnonymousArrayOfByte });
          paramAnonymousArrayOfByte = (AdobeUXMobilePackageItemOneUpViewerActivity)getActivity();
          if (paramAnonymousArrayOfByte == null) {
            return;
          }
          paramAnonymousArrayOfByte.generateShareIntentInfo();
        }
        
        public void onError(AdobeAssetException paramAnonymousAdobeAssetException) {}
        
        public void onProgress(double paramAnonymousDouble) {}
      };
      paramAdobeAssetFile.getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, new AdobeAssetImageDimensions(1024.0F, 1024.0F), (IAdobeGenericRequestCallback)localObject);
      _main_content_container.addView(localPhotoView);
    }
    
    protected AssetsViewBaseActionBarController createActionBarController()
    {
      return new AssetsViewBaseActionBarController();
    }
    
    protected AssetsViewBaseActionBarController getActionBarController()
    {
      if (_actionBarController == null) {
        _actionBarController = createActionBarController();
      }
      return _actionBarController;
    }
    
    public void onAttach(Activity paramActivity)
    {
      super.onAttach(paramActivity);
    }
    
    public void onCreate(Bundle paramBundle)
    {
      super.onCreate(paramBundle);
      setHasOptionsMenu(true);
      if (getArguments() != null) {}
      for (int i = getArguments().getInt("indexPos");; i = -1)
      {
        mIndexPos = i;
        return;
      }
    }
    
    public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
    {
      getActionBarController().onCreateOptionsMenu(paramMenu, paramMenuInflater);
      super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
    }
    
    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      paramLayoutInflater = paramLayoutInflater.inflate(R.layout.mobilepackage_item_fragment, paramViewGroup, false);
      _main_content_container = ((RelativeLayout)paramLayoutInflater.findViewById(R.id.mobilepackage_item_fragment_content_container));
      _noInternetConnView = paramLayoutInflater.findViewById(R.id.mobilepackage_item_no_internet_connection);
      _noPreviewView = paramLayoutInflater.findViewById(R.id.mobilepackage_item_no_preview);
      _spinner = ((ProgressBar)paramLayoutInflater.findViewById(R.id.mobilepackage_item_progressbar_new));
      setSpinnerVisibility(true);
      if (AdobeAssetShareBaseOneUpActivity.isNetworkAvailable())
      {
        visibilityhandler_isOnLine();
        initializeViewWithMobilePackageItem(mIndexPos);
        return paramLayoutInflater;
      }
      visibilityhandler_isOffLineOrError(true);
      return paramLayoutInflater;
    }
    
    public boolean onOptionsItemSelected(MenuItem paramMenuItem)
    {
      if (getActionBarController().onOptionsItemSelected(paramMenuItem)) {
        return true;
      }
      if (paramMenuItem.getItemId() == 16908332)
      {
        AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.NAVIGATE_BACK, null);
        return true;
      }
      return super.onOptionsItemSelected(paramMenuItem);
    }
    
    public void onPrepareOptionsMenu(Menu paramMenu)
    {
      super.onPrepareOptionsMenu(paramMenu);
      getActionBarController().onPrepareOptionsMenu(paramMenu);
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
    
    protected class AssetsViewBaseActionBarController
    {
      protected AssetsViewBaseActionBarController() {}
      
      protected boolean handleOptionItemSelect(int paramInt)
      {
        if (paramInt == R.id.adobe_mobiecreation_item_menu_download)
        {
          final AdobeAssetFile localAdobeAssetFile = MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(mIndexPos);
          localAdobeAssetFile.getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, new AdobeAssetImageDimensions(1024.0F, 1024.0F), new IAdobeGenericRequestCallback()
          {
            public void onCancellation() {}
            
            public void onCompletion(byte[] paramAnonymousArrayOfByte)
            {
              try
              {
                String str1 = localAdobeAssetFile.getName() + "_" + System.currentTimeMillis() + ".jpg";
                String str2 = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) + File.separator + str1;
                File localFile = new File(str2);
                localFile.createNewFile();
                new FileOutputStream(str2).write(paramAnonymousArrayOfByte);
                paramAnonymousArrayOfByte = new ContentValues();
                paramAnonymousArrayOfByte.put("title", str1);
                paramAnonymousArrayOfByte.put("description", "adobe creativeCloud");
                paramAnonymousArrayOfByte.put("datetaken", Long.valueOf(System.currentTimeMillis()));
                paramAnonymousArrayOfByte.put("bucket_id", Integer.valueOf(localFile.toString().toLowerCase(Locale.US).hashCode()));
                paramAnonymousArrayOfByte.put("bucket_display_name", localFile.getName().toLowerCase(Locale.US));
                paramAnonymousArrayOfByte.put("_data", localFile.getAbsolutePath());
                getActivity().getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, paramAnonymousArrayOfByte);
                return;
              }
              catch (Exception paramAnonymousArrayOfByte)
              {
                paramAnonymousArrayOfByte.printStackTrace();
              }
            }
            
            public void onError(AdobeAssetException paramAnonymousAdobeAssetException) {}
            
            public void onProgress(double paramAnonymousDouble) {}
          });
          return true;
        }
        return false;
      }
      
      public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater) {}
      
      public boolean onOptionsItemSelected(MenuItem paramMenuItem)
      {
        return handleOptionItemSelect(paramMenuItem.getItemId());
      }
      
      public void onPrepareOptionsMenu(Menu paramMenu) {}
    }
  }
  
  class AdobeUXMobilePackageItemPageChangeListener
    extends ViewPager.SimpleOnPageChangeListener
  {
    AdobeUXMobilePackageItemPageChangeListener() {}
    
    public void onPageSelected(int paramInt)
    {
      mPos = paramInt;
      updateTitleOfActivity();
      generateShareIntentInfo();
    }
  }
  
  public static class PhotoViewData
  {
    public int _currentImageHeight;
    public int _currentImageWidth;
    
    public PhotoViewData() {}
  }
}
