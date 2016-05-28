package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.content.FileProvider;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.SimpleOnPageChangeListener;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.util.DisplayMetrics;
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
import android.widget.ProgressBar;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.menu;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKActionBarController;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKTypeFace;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKTypefaceSpan;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLocalizedMgr;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAsset;
import com.adobe.creativesdk.foundation.storage.AdobePhotoAssetRendition;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import com.sothree.slidinguppanel.SlidingUpPanelLayout;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import uk.co.senab.photoview.PhotoViewAttacher;
import uk.co.senab.photoview.PhotoViewAttacher.OnViewTapListener;

public class AdobeUXPhotoAssetOneUpViewerActivity
  extends AdobeAssetShareBaseOneUpActivity
  implements IAssetViewerActivity
{
  private ImageButton mImageSelectbtn;
  
  public AdobeUXPhotoAssetOneUpViewerActivity() {}
  
  private SpannableString getAdobeString(String paramString)
  {
    paramString = new SpannableString(paramString);
    paramString.setSpan(new AdobeCSDKTypefaceSpan(null, AdobeCSDKTypeFace.getTypeface(this)), 0, paramString.length(), 33);
    paramString.setSpan(new ForegroundColorSpan(getResources().getColor(R.color.asset_browser_dark_text)), 0, paramString.length(), 33);
    return paramString;
  }
  
  private String getUniqueNameForAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    String str = paramAdobePhotoAsset.getGUID();
    if ((str == null) || (str.length() == 0)) {
      return paramAdobePhotoAsset.getName().replace(".", "_");
    }
    paramAdobePhotoAsset = str.split("/");
    if (paramAdobePhotoAsset.length > 1) {
      return paramAdobePhotoAsset[(paramAdobePhotoAsset.length - 1)];
    }
    return paramAdobePhotoAsset[0];
  }
  
  private void onViewFileDetailsPressed() {}
  
  private void setShareIntent()
  {
    final int i = mPos;
    final AdobePhotoAsset localAdobePhotoAsset = AdobePhotoAssetViewerController.getAssetAtPos(mPos);
    IAdobeGenericRequestCallback local3 = new IAdobeGenericRequestCallback()
    {
      protected void handleNoPreview()
      {
        if (AdobePhotoAssetViewerController.isMenuEnabled())
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
              paramAnonymous2VarArgs = BitmapFactory.decodeByteArray(paramAnonymous2VarArgs, 0, paramAnonymous2VarArgs.length);
              if (paramAnonymous2VarArgs == null)
              {
                _failed = true;
                return null;
              }
              Object localObject = AdobeUXPhotoAssetOneUpViewerActivity.this.getUniqueNameForAsset(val$asset);
              try
              {
                localObject = new File(mImagePath, (String)localObject + ".png");
                FileOutputStream localFileOutputStream = new FileOutputStream((File)localObject);
                paramAnonymous2VarArgs.compress(Bitmap.CompressFormat.PNG, 100, localFileOutputStream);
                localFileOutputStream.flush();
                localFileOutputStream.close();
                if (AdobePhotoAssetViewerController.isMenuEnabled())
                {
                  paramAnonymous2VarArgs = FileProvider.getUriForFile(AdobeUXPhotoAssetOneUpViewerActivity.this, AdobePhotoAssetViewerController.getFileProvideAuthority(), (File)localObject);
                  return paramAnonymous2VarArgs;
                }
              }
              catch (Exception paramAnonymous2VarArgs)
              {
                paramAnonymous2VarArgs.printStackTrace();
              }
            }
            return null;
          }
          
          protected void onPostExecute(Uri paramAnonymous2Uri)
          {
            if (AdobePhotoAssetViewerController.isMenuEnabled()) {
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
      
      public void onError(AdobePhotoException paramAnonymousAdobePhotoException)
      {
        handleNoPreview();
      }
      
      public final void onProgress(double paramAnonymousDouble) {}
    };
    Object localObject = getUniqueNameForAsset(localAdobePhotoAsset);
    localObject = new File(mImagePath, (String)localObject + ".png");
    if (((File)localObject).exists())
    {
      if (AdobePhotoAssetViewerController.isMenuEnabled())
      {
        FileProvider.getUriForFile(this, AdobePhotoAssetViewerController.getFileProvideAuthority(), (File)localObject);
        return;
      }
      enableOrDisableOpenBtn(i, true);
      return;
    }
    AdobePhotoAssetViewerController.getRenditionForAsset(localAdobePhotoAsset, local3);
  }
  
  private void updateSelectionBtn()
  {
    AdobePhotoAsset localAdobePhotoAsset = AdobePhotoAssetViewerController.getAssetAtPos(mPos);
    if (mImageSelectbtn != null)
    {
      if (AdobePhotoAssetViewerController.containsAsset(localAdobePhotoAsset)) {
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
        AdobePhotoAsset localAdobePhotoAsset = AdobePhotoAssetViewerController.getAssetAtPos(mPos);
        mImageSelectbtn.setSelected(false);
        AdobePhotoAssetViewerController.removeSelectedAsset(localAdobePhotoAsset);
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
  
  File getShareFile()
  {
    String str = getUniqueNameForAsset(AdobePhotoAssetViewerController.getAssetAtPos(mPos));
    return new File(mImagePath, str + ".png");
  }
  
  public void handleAssetCollectionChanged()
  {
    mAdapter.notifyDataSetChanged();
  }
  
  public void handleAssetSelectionChanged()
  {
    int i = AdobePhotoAssetViewerController.getSelectedAssetCount();
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
  
  @SuppressLint({"InlinedApi"})
  public void hideOrShowActionsBar()
  {
    hideOrShowBaseActivityActionsBar();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(null);
    if ((paramBundle != null) && (paramBundle.getInt("ASSET_ONE_UP_ACTIVITY", -2) != -2))
    {
      finish();
      return;
    }
    AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().setApplicationContext(getApplicationContext());
    if (!AdobePhotoAssetViewerController.isDataSourceValidForAssetViewerLaunch())
    {
      finish();
      return;
    }
    AdobePhotoAssetViewerController.setCurrentAssetViewerActivity(this);
    mAdapter = new AdobeUXPhotoAssetViewerAdapter(getSupportFragmentManager());
    mPager = ((ViewPager)findViewById(R.id.library_item_pager));
    mPager.setAdapter(mAdapter);
    mPager.setOnPageChangeListener(new AdobeUXAssetViewerPageChangeListener(null));
    mPos = AdobePhotoAssetViewerController.getSelectedIndex();
    mPager.setCurrentItem(mPos, false);
    paramBundle = AdobePhotoAssetViewerController.getAssetAtPos(mPos);
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
        if (!AdobePhotoAssetViewerController.isMultiSelectModeActive())
        {
          paramAnonymousView = AdobePhotoAssetViewerController.getAssetAtPos(mPos);
          if (!AdobePhotoAssetViewerController.containsAsset(paramAnonymousView)) {
            AdobePhotoAssetViewerController.addSelectedAsset(paramAnonymousView);
          }
        }
        paramAnonymousView = new Intent();
        setResult(-1, paramAnonymousView);
        finish();
      }
    });
    mImageSelectbtn = ((ImageButton)findViewById(R.id.library_items_image_selectbtn));
    mPhotoNumber.setText(mPos + 1 + " " + getString(R.string.IDS_ASSET_VIEWER_OF) + " " + AdobePhotoAssetViewerController.getTotalAssetsCount());
    if (!AdobePhotoAssetViewerController.isMenuEnabled())
    {
      mOpenBtnContainer.setVisibility(0);
      if ((AdobeAssetViewerController.isMenuEnabled()) || (!AdobeAssetViewerController.isMultiSelectModeActive())) {
        break label354;
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
          paramAnonymousView = AdobePhotoAssetViewerController.getAssetAtPos(mPos);
          if (!mImageSelectbtn.isSelected())
          {
            mImageSelectbtn.setSelected(true);
            AdobePhotoAssetViewerController.addSelectedAsset(paramAnonymousView);
            return;
          }
          mImageSelectbtn.setSelected(false);
          AdobePhotoAssetViewerController.removeSelectedAsset(paramAnonymousView);
        }
      });
      handleAssetSelectionChanged();
      return;
      mOpenBtnContainer.setVisibility(8);
      break;
      label354:
      mImageSelectbtn.setVisibility(8);
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    if (!AdobePhotoAssetViewerController.isDataSourceValidForAssetViewerLaunch()) {
      return super.onCreateOptionsMenu(paramMenu);
    }
    if (AdobePhotoAssetViewerController.isMenuEnabled())
    {
      getMenuInflater().inflate(R.menu.adobe_assetviewer_menu, paramMenu);
      MenuItem localMenuItem = paramMenu.findItem(R.id.action_view_file_details);
      localMenuItem.setVisible(false);
      localMenuItem.setTitleCondensed(getResources().getString(R.string.IDS_ACTION_VIEW_FILE_DETAILS));
      localMenuItem.setTitle(getAdobeString(getResources().getString(R.string.IDS_ACTION_VIEW_FILE_DETAILS)));
    }
    for (;;)
    {
      return super.onCreateOptionsMenu(paramMenu);
      setShareIntent();
    }
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
      AdobePhotoAssetViewerController.resetCurrentAdobeUXAssetViewerActivity();
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
    AdobePhotoAssetViewerController.setSelectedIndex(mPos);
    paramBundle.putInt("ASSET_ONE_UP_ACTIVITY", mPos);
    super.onSaveInstanceState(paramBundle);
  }
  
  @SuppressLint({"InlinedApi"})
  public void showActionsBar()
  {
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
  
  private class AdobeUXAssetViewerPageChangeListener
    extends ViewPager.SimpleOnPageChangeListener
  {
    private AdobeUXAssetViewerPageChangeListener() {}
    
    public void onPageSelected(int paramInt)
    {
      mPos = paramInt;
      if (mPhotoNumber != null) {
        mPhotoNumber.setText(mPos + 1 + " " + getString(R.string.IDS_ASSET_VIEWER_OF) + " " + AdobePhotoAssetViewerController.getTotalAssetsCount());
      }
      AdobePhotoAsset localAdobePhotoAsset = AdobePhotoAssetViewerController.getAssetAtPos(mPos);
      AdobeUXPhotoAssetOneUpViewerActivity.this.updateSelectionBtn();
      AdobeCSDKActionBarController.setTitle(findViewById(16908290), localAdobePhotoAsset.getName());
      AdobeUXPhotoAssetOneUpViewerActivity.this.setShareIntent();
      if (mPos >= AdobePhotoAssetViewerController.count() - 5) {
        AdobePhotoAssetViewerController.loadNextPage();
      }
    }
  }
  
  public static class AdobeUXPhotoAssetViewerAdapter
    extends FragmentStatePagerAdapter
  {
    public AdobeUXPhotoAssetViewerAdapter(FragmentManager paramFragmentManager)
    {
      super();
    }
    
    public int getCount()
    {
      return AdobePhotoAssetViewerController.count();
    }
    
    public Fragment getItem(int paramInt)
    {
      return AdobeUXPhotoAssetViewerAssetFragment.newInstance(paramInt);
    }
    
    public static class AdobeUXPhotoAssetViewerAssetFragment
      extends Fragment
    {
      int mNum;
      
      public AdobeUXPhotoAssetViewerAssetFragment() {}
      
      static AdobeUXPhotoAssetViewerAssetFragment newInstance(int paramInt)
      {
        AdobeUXPhotoAssetViewerAssetFragment localAdobeUXPhotoAssetViewerAssetFragment = new AdobeUXPhotoAssetViewerAssetFragment();
        Bundle localBundle = new Bundle();
        localBundle.putInt("num", paramInt);
        localAdobeUXPhotoAssetViewerAssetFragment.setArguments(localBundle);
        return localAdobeUXPhotoAssetViewerAssetFragment;
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
      
      public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, final Bundle paramBundle)
      {
        paramLayoutInflater = paramLayoutInflater.inflate(R.layout.fragment_photo_image, paramViewGroup, false);
        paramBundle = paramLayoutInflater.findViewById(R.id.photo_image_view);
        Object localObject2 = paramLayoutInflater.findViewById(R.id.photo_viewer_no_internet_connection);
        final View localView = paramLayoutInflater.findViewById(R.id.photo_viewer_no_preview);
        Object localObject1 = (ProgressBar)paramLayoutInflater.findViewById(R.id.photo_image_progressbar_new);
        ((ProgressBar)localObject1).setVisibility(0);
        paramViewGroup = AdobePhotoAssetViewerController.getAssetAtPos(mNum);
        final DisplayMetrics localDisplayMetrics = getResources().getDisplayMetrics();
        PhotoViewAttacher localPhotoViewAttacher = new PhotoViewAttacher((ImageView)paramBundle);
        localPhotoViewAttacher.setOnViewTapListener(new PhotoViewAttacher.OnViewTapListener()
        {
          public void onViewTap(View paramAnonymousView, float paramAnonymousFloat1, float paramAnonymousFloat2)
          {
            if (AdobePhotoAssetViewerController.getCurrentAssetViewerActivity() != null) {
              AdobePhotoAssetViewerController.getCurrentAssetViewerActivity().hideOrShowActionsBar();
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
          localPhotoViewAttacher.setOnLongClickListener(local1);
        }
        localObject2 = new Object()
        {
          void isOffLineOrError(boolean paramAnonymousBoolean)
          {
            paramBundle.setVisibility(8);
            if (paramAnonymousBoolean)
            {
              val$noInternetConnView.setVisibility(0);
              localView.setVisibility(8);
            }
            for (;;)
            {
              val$spinner.setVisibility(8);
              return;
              val$noInternetConnView.setVisibility(8);
              localView.setVisibility(0);
            }
          }
          
          void isOnLine()
          {
            paramBundle.setVisibility(0);
            val$noInternetConnView.setVisibility(8);
            localView.setVisibility(8);
          }
        };
        paramBundle = new IAdobeGenericRequestCallback()
        {
          protected void handleNoPreview()
          {
            val$visibilityHandler.isOffLineOrError(false);
          }
          
          public void onCancellation()
          {
            handleNoPreview();
          }
          
          public void onCompletion(byte[] paramAnonymousArrayOfByte)
          {
            Bitmap localBitmap = null;
            if (paramAnonymousArrayOfByte != null) {
              localBitmap = BitmapFactory.decodeByteArray(paramAnonymousArrayOfByte, 0, paramAnonymousArrayOfByte.length);
            }
            if (localBitmap == null)
            {
              handleNoPreview();
              return;
            }
            if ((localBitmap.getWidth() < localDisplayMetricswidthPixels) || (localBitmap.getHeight() < localDisplayMetricsheightPixels))
            {
              paramAnonymousArrayOfByte = new RelativeLayout.LayoutParams(-1, -1);
              paramAnonymousArrayOfByte.addRule(13);
              paramBundle.setLayoutParams(paramAnonymousArrayOfByte);
            }
            for (;;)
            {
              ((ImageView)paramBundle).setImageBitmap(localBitmap);
              val$spinner.setVisibility(8);
              return;
              paramAnonymousArrayOfByte = new RelativeLayout.LayoutParams(-2, -2);
              paramAnonymousArrayOfByte.addRule(13);
              paramBundle.setLayoutParams(paramAnonymousArrayOfByte);
            }
          }
          
          public void onError(AdobePhotoException paramAnonymousAdobePhotoException)
          {
            handleNoPreview();
          }
          
          public void onProgress(double paramAnonymousDouble) {}
        };
        if (AdobeUXPhotoAssetOneUpViewerActivity.isNetworkAvailable())
        {
          ((1VisibilityHandler)localObject2).isOnLine();
          localObject1 = paramViewGroup.getRenditions();
          if (((Map)localObject1).get("2048") != null) {
            paramViewGroup.downloadRendition((AdobePhotoAssetRendition)((Map)localObject1).get("2048"), paramBundle);
          }
        }
        for (;;)
        {
          ((AdobeUXPhotoAssetOneUpViewerActivity)getActivity()).setShareIntent();
          return paramLayoutInflater;
          if (((Map)localObject1).get("1024") != null)
          {
            paramViewGroup.downloadRendition((AdobePhotoAssetRendition)((Map)localObject1).get("1024"), paramBundle);
          }
          else if (((Map)localObject1).get("thumbnail2x") != null)
          {
            paramViewGroup.downloadRendition((AdobePhotoAssetRendition)((Map)localObject1).get("thumbnail2x"), paramBundle);
          }
          else if (((Map)localObject1).get("144h") != null)
          {
            paramViewGroup.downloadRendition((AdobePhotoAssetRendition)((Map)localObject1).get("144h"), paramBundle);
          }
          else
          {
            paramBundle.onCompletion(null);
            continue;
            ((1VisibilityHandler)localObject2).isOffLineOrError(true);
          }
        }
      }
    }
  }
}
