package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore.Images.Media;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLayoutChangeListener;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.TextView.BufferType;
import android.widget.Toast;
import com.adobe.creativesdk.behance.AdobeBehanceSDKPublishWIPOptions;
import com.adobe.creativesdk.behance.AdobeUXBehanceWorkflow;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.LibraryItemsOneUpViewController;
import com.adobe.creativesdk.foundation.internal.utils.DrawShadowRelativeLayout;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import com.sothree.slidinguppanel.SlidingUpPanelLayout;
import com.sothree.slidinguppanel.SlidingUpPanelLayout.PanelSlideListener;
import com.sothree.slidinguppanel.SlidingUpPanelLayout.PanelState;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public class AdobeAssetShareOptionsFragment
  extends Fragment
{
  private final String CLOUD_DOWNLOAD_PACKAGE_DUMMY = "LibraryItemRenditionToCC";
  private final String LOCAL_SAVE_PACKAGE_DUMMY = "DownloadToGallery";
  private final String PUBLISH_BEHANCE_PACKAGE_DUMMY = "PublishToBehance";
  private ArrayAdapter<ShareSettingEntry> mAdapter;
  private ListView mListView;
  private boolean mPanelHeightIsInitialized;
  private HashMap<Integer, String> mShareApps = new HashMap();
  HashMap<String, ShareSettingEntry> mShareEntriesList;
  private TextView mTitleView;
  
  public AdobeAssetShareOptionsFragment() {}
  
  private void generateShareEntries()
  {
    PackageManager localPackageManager = getActivity().getPackageManager();
    new HashSet();
    Object localObject = new Intent("android.intent.action.SEND");
    ((Intent)localObject).setType("image/*");
    getActivity().getPackageName();
    localObject = localPackageManager.queryIntentActivities((Intent)localObject, 0).iterator();
    while (((Iterator)localObject).hasNext())
    {
      ResolveInfo localResolveInfo = (ResolveInfo)((Iterator)localObject).next();
      if (!"com.adobe.creativesdk.foundation.assets".equals(activityInfo.packageName)) {
        try
        {
          Drawable localDrawable = getCorrectSizedApplicationIcon(localPackageManager, activityInfo.packageName);
          try
          {
            mShareEntriesList.put(activityInfo.packageName, new ShareSettingEntry(localDrawable, localPackageManager.getApplicationLabel(localPackageManager.getApplicationInfo(activityInfo.packageName, 0)), activityInfo.packageName));
          }
          catch (PackageManager.NameNotFoundException localNameNotFoundException1)
          {
            localNameNotFoundException1.printStackTrace();
          }
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException2)
        {
          localNameNotFoundException2.printStackTrace();
        }
      }
    }
  }
  
  private void initShareOptions()
  {
    mShareEntriesList = new HashMap();
    Drawable localDrawable = getResources().getDrawable(R.drawable.creative_cloud);
    mShareEntriesList.put("PublishToBehance", new ShareSettingEntry(localDrawable, "Publish to Behance", "PublishToBehance"));
  }
  
  private void setListAdapter()
  {
    if (mShareEntriesList.size() != 0)
    {
      ArrayList localArrayList = new ArrayList(mShareEntriesList.values());
      mAdapter = new ShareSettingsAdapter(getActivity(), R.layout.adobe_assetimage_list_shareviewcell, localArrayList);
      mListView.setAdapter(mAdapter);
    }
  }
  
  Drawable getCorrectSizedApplicationIcon(PackageManager paramPackageManager, String paramString)
    throws PackageManager.NameNotFoundException
  {
    if (TextUtils.isEmpty(paramString)) {
      paramPackageManager = null;
    }
    int i;
    do
    {
      return paramPackageManager;
      paramString = paramPackageManager.getApplicationIcon(paramString);
      i = (int)getResources().getDimension(R.dimen.sharing_icon_size);
      if (paramString.getIntrinsicHeight() > i) {
        break;
      }
      paramPackageManager = paramString;
    } while (paramString.getIntrinsicWidth() <= i);
    paramPackageManager = Bitmap.createScaledBitmap(((BitmapDrawable)paramString).getBitmap(), i, i, false);
    return new BitmapDrawable(getResources(), paramPackageManager);
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    initShareOptions();
    generateShareEntries();
    mListView.setClickable(false);
    mPanelHeightIsInitialized = false;
    setListAdapter();
    ((AdobeAssetShareBaseOneUpActivity)getActivity()).getSlidingUpPanel().setPanelSlideListener(new SlidingUpPanelLayout.PanelSlideListener()
    {
      public void onPanelAnchored(View paramAnonymousView)
      {
        val$shadowRelativeLayout.setShadowVisible(false, false);
      }
      
      public void onPanelCollapsed(View paramAnonymousView)
      {
        val$shadowRelativeLayout.setShadowVisible(true, false);
        mListView.smoothScrollToPosition(0);
        mListView.setClickable(true);
      }
      
      public void onPanelExpanded(View paramAnonymousView)
      {
        val$shadowRelativeLayout.setShadowVisible(false, false);
        mListView.setClickable(true);
      }
      
      public void onPanelHidden(View paramAnonymousView)
      {
        val$shadowRelativeLayout.setShadowVisible(false, false);
      }
      
      public void onPanelSlide(View paramAnonymousView, float paramAnonymousFloat)
      {
        val$shadowRelativeLayout.setShadowVisible(false, false);
      }
    });
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.asset_viewer_oneup_shareopts_fragment, paramViewGroup);
    mListView = ((ListView)paramLayoutInflater.findViewById(R.id.shareList));
    mTitleView = ((TextView)paramLayoutInflater.findViewById(R.id.text1));
    return paramLayoutInflater;
  }
  
  public boolean setPackage(Intent paramIntent, String paramString, Activity paramActivity)
  {
    paramActivity = paramActivity.getPackageManager();
    try
    {
      paramActivity.getPackageInfo(paramString, 128);
      paramIntent.setPackage(paramString);
      return true;
    }
    catch (PackageManager.NameNotFoundException paramIntent) {}
    return false;
  }
  
  class ShareSettingEntry
  {
    public CharSequence appName;
    public Drawable icon;
    public String packageName;
    
    ShareSettingEntry(Drawable paramDrawable, CharSequence paramCharSequence, String paramString)
    {
      icon = paramDrawable;
      packageName = paramString;
      appName = paramCharSequence;
    }
  }
  
  class ShareSettingsAdapter
    extends ArrayAdapter<AdobeAssetShareOptionsFragment.ShareSettingEntry>
  {
    int mCellHeight = 0;
    LayoutInflater mInflater;
    List<AdobeAssetShareOptionsFragment.ShareSettingEntry> mList;
    int mResId;
    
    public ShareSettingsAdapter(int paramInt, List<AdobeAssetShareOptionsFragment.ShareSettingEntry> paramList)
    {
      super(paramList, localList);
      mList = localList;
      mInflater = LayoutInflater.from(paramInt);
      mResId = paramList;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      AdobeAssetShareOptionsFragment.ShareSettingEntry localShareSettingEntry = (AdobeAssetShareOptionsFragment.ShareSettingEntry)getItem(paramInt);
      if (paramView == null)
      {
        View localView = mInflater.inflate(mResId, paramViewGroup, false);
        AdobeAssetShareOptionsFragment.ViewHolder localViewHolder = new AdobeAssetShareOptionsFragment.ViewHolder(AdobeAssetShareOptionsFragment.this);
        title = ((TextView)localView.findViewById(R.id.title));
        icon = ((ImageView)localView.findViewById(R.id.icon));
        localView.setTag(localViewHolder);
        localView.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(final View paramAnonymousView)
          {
            paramAnonymousView = (AdobeAssetShareOptionsFragment.ViewHolder)paramAnonymousView.getTag();
            ((AdobeAssetShareBaseOneUpActivity)getActivity()).getSlidingUpPanel().setPanelState(SlidingUpPanelLayout.PanelState.COLLAPSED);
            ((AdobeAssetShareBaseOneUpActivity)getActivity()).getSlidingUpPanel().setVisibility(4);
            paramAnonymousView = packageName.toString();
            Intent localIntent = ((AdobeAssetShareBaseOneUpActivity)getActivity()).getShareIntent();
            if (localIntent == null) {}
            do
            {
              do
              {
                do
                {
                  return;
                  try
                  {
                    Uri localUri = (Uri)localIntent.getExtras().get("android.intent.extra.STREAM");
                    if (localUri != null) {
                      getActivity().grantUriPermission(paramAnonymousView, localUri, 3);
                    }
                    if (setPackage(localIntent, paramAnonymousView, getActivity()))
                    {
                      startActivity(localIntent);
                      return;
                    }
                  }
                  catch (ActivityNotFoundException paramAnonymousView)
                  {
                    paramAnonymousView.printStackTrace();
                    Toast.makeText(getActivity(), "Could not find the application you are trying to share to on your device", 0).show();
                    return;
                  }
                  if (!paramAnonymousView.equals("DownloadToGallery")) {
                    break;
                  }
                } while ((!(getActivity() instanceof AdobeUXMobilePackageItemOneUpViewerActivity)) && (!(getActivity() instanceof AdobeUXLibraryItemCollectionOneUpViewerActivity)));
                if ((getActivity() instanceof AdobeUXLibraryItemCollectionOneUpViewerActivity))
                {
                  i = ((AdobeUXLibraryItemCollectionOneUpViewerActivity)getActivity()).getCurrentIndex();
                  LibraryItemsOneUpViewController.getInstance().getItemAtPos(i);
                  return;
                }
              } while (!(getActivity() instanceof AdobeUXMobilePackageItemOneUpViewerActivity));
              int i = ((AdobeUXMobilePackageItemOneUpViewerActivity)getActivity()).getCurrentIndex();
              paramAnonymousView = MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(i);
              paramAnonymousView.getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, new AdobeAssetImageDimensions(1024.0F, 1024.0F), new IAdobeGenericRequestCallback()
              {
                public void onCancellation() {}
                
                public void onCompletion(byte[] paramAnonymous2ArrayOfByte)
                {
                  try
                  {
                    String str1 = paramAnonymousView.getName() + "_" + System.currentTimeMillis() + ".jpg";
                    String str2 = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) + File.separator + str1;
                    File localFile = new File(str2);
                    localFile.createNewFile();
                    new FileOutputStream(str2).write(paramAnonymous2ArrayOfByte);
                    paramAnonymous2ArrayOfByte = new ContentValues();
                    paramAnonymous2ArrayOfByte.put("title", str1);
                    paramAnonymous2ArrayOfByte.put("description", "adobe creativeCloud");
                    paramAnonymous2ArrayOfByte.put("datetaken", Long.valueOf(System.currentTimeMillis()));
                    paramAnonymous2ArrayOfByte.put("bucket_id", Integer.valueOf(localFile.toString().toLowerCase(Locale.US).hashCode()));
                    paramAnonymous2ArrayOfByte.put("bucket_display_name", localFile.getName().toLowerCase(Locale.US));
                    paramAnonymous2ArrayOfByte.put("_data", localFile.getAbsolutePath());
                    getActivity().getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, paramAnonymous2ArrayOfByte);
                    Toast.makeText(getActivity(), "File saved to gallery", 0).show();
                    return;
                  }
                  catch (Exception paramAnonymous2ArrayOfByte)
                  {
                    paramAnonymous2ArrayOfByte.printStackTrace();
                  }
                }
                
                public void onError(AdobeAssetException paramAnonymous2AdobeAssetException) {}
                
                public void onProgress(double paramAnonymous2Double) {}
              });
              return;
            } while (!paramAnonymousView.equals("PublishToBehance"));
            paramAnonymousView = (AdobeAssetFile)AdobeAssetViewerController.getAssetAtPos(((AdobeUXAssetOneUpViewerActivity)getActivity()).getCurrentIndex());
            paramAnonymousView.getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, new AdobeAssetImageDimensions(1024.0F, 1024.0F), new IAdobeGenericRequestCallback()
            {
              public void onCancellation() {}
              
              public void onCompletion(byte[] paramAnonymous2ArrayOfByte)
              {
                try
                {
                  String str = paramAnonymousView.getName();
                  str = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) + File.separator + str;
                  File localFile = new File(str);
                  localFile.createNewFile();
                  new FileOutputStream(str).write(paramAnonymous2ArrayOfByte);
                  AdobeUXBehanceWorkflow.launchPublishWIP(new AdobeBehanceSDKPublishWIPOptions(localFile), getActivity());
                  return;
                }
                catch (Exception paramAnonymous2ArrayOfByte) {}
              }
              
              public void onError(AdobeAssetException paramAnonymous2AdobeAssetException) {}
              
              public void onProgress(double paramAnonymous2Double) {}
            });
          }
        });
        paramView = localView;
        paramViewGroup = localViewHolder;
        if (!mPanelHeightIsInitialized)
        {
          localView.addOnLayoutChangeListener(new View.OnLayoutChangeListener()
          {
            public void onLayoutChange(View paramAnonymousView, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3, int paramAnonymousInt4, int paramAnonymousInt5, int paramAnonymousInt6, int paramAnonymousInt7, int paramAnonymousInt8)
            {
              mCellHeight = (paramAnonymousInt4 - paramAnonymousInt2);
              paramAnonymousInt1 = mCellHeight;
              paramAnonymousInt2 = mTitleView.getHeight();
              paramAnonymousInt3 = mTitleView.getPaddingBottom();
              ((AdobeAssetShareBaseOneUpActivity)getActivity()).getSlidingUpPanel().setPanelHeight(paramAnonymousInt1 * 3 + paramAnonymousInt2 + paramAnonymousInt3);
              AdobeAssetShareOptionsFragment.access$102(AdobeAssetShareOptionsFragment.this, true);
              paramAnonymousView.removeOnLayoutChangeListener(this);
            }
          });
          paramViewGroup = localViewHolder;
          paramView = localView;
        }
      }
      for (;;)
      {
        packageName = packageName;
        title.setText(appName, TextView.BufferType.SPANNABLE);
        if (icon != null) {
          icon.setImageDrawable(icon);
        }
        return paramView;
        paramViewGroup = (AdobeAssetShareOptionsFragment.ViewHolder)paramView.getTag();
      }
    }
  }
  
  class ViewHolder
  {
    ImageView icon;
    CharSequence packageName;
    TextView title;
    
    ViewHolder() {}
  }
}
