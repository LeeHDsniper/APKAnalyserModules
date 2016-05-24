package com.behance.sdk.fragments.headless;

import android.app.Activity;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.Environment;
import android.support.v4.app.Fragment;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMIMETypeFilter;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMIMETypeFilterType;
import com.adobe.creativesdk.foundation.storage.AdobeSelection;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeUXAssetBrowser;
import com.adobe.creativesdk.foundation.storage.AdobeUXAssetBrowser.ResultProvider;
import com.adobe.creativesdk.foundation.storage.AdobeUXAssetBrowserConfiguration;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import com.behance.sdk.R.string;
import com.behance.sdk.factory.BehanceSDKImageProperties;
import com.behance.sdk.factory.BehanceSDKImageValidatorFactory;
import com.behance.sdk.factory.IBehanceSDKImageValidator;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.util.BehanceSDKUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

public class BehanceSDKCCBrowserHeadlessFragment
  extends Fragment
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKCCBrowserHeadlessFragment.class);
  private List<File> downloadErrors;
  private List<File> files;
  private String imageValidatorType;
  private List<File> invalidFile;
  private volatile boolean isDownloadInProgress = false;
  private ICreativeCloudAssetDownloadListener listener;
  private ArrayList<AdobeSelection> mSelectedAssetsList;
  private File tempStorageFolder;
  
  public BehanceSDKCCBrowserHeadlessFragment()
  {
    setRetainInstance(true);
  }
  
  private void checkForDownloadComplete(int paramInt)
  {
    if (files.size() + downloadErrors.size() + invalidFile.size() == paramInt)
    {
      files = moveFileToPicturesDirectory();
      if (listener != null) {
        listener.onDownloadComplete(files, downloadErrors, invalidFile);
      }
      isDownloadInProgress = false;
    }
  }
  
  private void computeImageDimensions(File paramFile, BehanceSDKImageProperties paramBehanceSDKImageProperties)
  {
    if ((paramFile != null) && (paramFile.exists()) && (paramFile.isFile()))
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      BitmapFactory.decodeFile(paramFile.getAbsolutePath(), localOptions);
      paramBehanceSDKImageProperties.setWidth(outWidth);
      paramBehanceSDKImageProperties.setHeight(outHeight);
      paramBehanceSDKImageProperties.setSize(paramFile.length());
    }
  }
  
  private void downloadOriginalFile(final int paramInt, AdobeAssetFile paramAdobeAssetFile, final File paramFile)
  {
    IAdobeGenericRequestCallback local2 = new IAdobeGenericRequestCallback()
    {
      public void onCancellation()
      {
        if (paramFile.exists()) {
          paramFile.delete();
        }
      }
      
      public void onCompletion(Boolean paramAnonymousBoolean)
      {
        files.add(paramFile);
        BehanceSDKCCBrowserHeadlessFragment.this.checkForDownloadComplete(paramInt);
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        downloadErrors.add(paramFile);
        BehanceSDKCCBrowserHeadlessFragment.this.showMessage(getString(R.string.bsdk_cc_asset_browser_file_download_error, new Object[] { paramFile.getName() }));
        BehanceSDKCCBrowserHeadlessFragment.this.checkForDownloadComplete(paramInt);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    };
    paramAdobeAssetFile.downloadAssetFile(paramFile.toURI(), local2);
  }
  
  private void downloadRendition(final int paramInt, AdobeAssetFile paramAdobeAssetFile, final File paramFile)
  {
    AdobeAssetImageDimensions localAdobeAssetImageDimensions = new AdobeAssetImageDimensions(2560.0F, 2560.0F);
    paramAdobeAssetFile.getRenditionWithType(getRenditionType(paramAdobeAssetFile.getType()), localAdobeAssetImageDimensions, new IAdobeGenericRequestCallback()
    {
      public void onCancellation() {}
      
      public void onCompletion(byte[] paramAnonymousArrayOfByte)
      {
        BehanceSDKCCBrowserHeadlessFragment.this.saveDatatoFile(paramAnonymousArrayOfByte, paramFile);
        paramAnonymousArrayOfByte = BehanceSDKCCBrowserHeadlessFragment.this.getImageValidator();
        if (paramAnonymousArrayOfByte != null)
        {
          BehanceSDKImageProperties localBehanceSDKImageProperties = BehanceSDKCCBrowserHeadlessFragment.this.getImageProperties(paramFile);
          if (paramAnonymousArrayOfByte.validate(getActivity(), localBehanceSDKImageProperties)) {
            files.add(paramFile);
          }
        }
        for (;;)
        {
          BehanceSDKCCBrowserHeadlessFragment.this.checkForDownloadComplete(paramInt);
          return;
          invalidFile.add(paramFile);
          continue;
          files.add(paramFile);
        }
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        downloadErrors.add(paramFile);
        BehanceSDKCCBrowserHeadlessFragment.this.showMessage(getString(R.string.bsdk_cc_asset_browser_file_download_error, new Object[] { paramFile.getName() }));
        BehanceSDKCCBrowserHeadlessFragment.this.checkForDownloadComplete(paramInt);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    });
  }
  
  private BehanceSDKImageProperties getImageProperties(AdobeAssetFile paramAdobeAssetFile)
  {
    BehanceSDKImageProperties localBehanceSDKImageProperties = new BehanceSDKImageProperties();
    localBehanceSDKImageProperties.setSize(paramAdobeAssetFile.getFileSize());
    localBehanceSDKImageProperties.setType(BehanceSDKUtils.getFileExtension(paramAdobeAssetFile.getName()));
    JSONObject localJSONObject = paramAdobeAssetFile.getOptionalMetadata();
    if ((localJSONObject != null) && (localJSONObject.has("height")) && (localJSONObject.has("width"))) {}
    try
    {
      int i = localJSONObject.getInt("height");
      int j = localJSONObject.getInt("width");
      localBehanceSDKImageProperties.setHeight(i);
      localBehanceSDKImageProperties.setWidth(j);
      return localBehanceSDKImageProperties;
    }
    catch (JSONException localJSONException)
    {
      logger.error("Exception parsing image metadata of CC asset file " + paramAdobeAssetFile.getName(), new Object[] { localJSONException });
    }
    return localBehanceSDKImageProperties;
  }
  
  private BehanceSDKImageProperties getImageProperties(File paramFile)
  {
    BehanceSDKImageProperties localBehanceSDKImageProperties = new BehanceSDKImageProperties();
    localBehanceSDKImageProperties.setType(BehanceSDKUtils.getFileExtension(paramFile.getName()));
    computeImageDimensions(paramFile, localBehanceSDKImageProperties);
    return localBehanceSDKImageProperties;
  }
  
  private IBehanceSDKImageValidator getImageValidator()
  {
    return BehanceSDKImageValidatorFactory.getInstance().getImageValidator(imageValidatorType);
  }
  
  private AdobeAssetFileRenditionType getRenditionType(String paramString)
  {
    if ("image/gif".equals(paramString)) {
      return AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_GIF;
    }
    if ("image/png".equals(paramString)) {
      return AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG;
    }
    if ("image/jpeg".equals(paramString)) {
      return AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG;
    }
    return AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG;
  }
  
  private File getStorageDirectoryForDownload()
  {
    File localFile = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) + "/CC" + System.currentTimeMillis());
    if (localFile.exists()) {
      BehanceSDKUtils.deleteRecursive(localFile);
    }
    localFile.mkdir();
    return localFile;
  }
  
  private List<File> moveFileToPicturesDirectory()
  {
    ArrayList localArrayList = new ArrayList();
    File localFile1 = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
    Iterator localIterator = files.iterator();
    while (localIterator.hasNext())
    {
      File localFile2 = (File)localIterator.next();
      File localFile3 = new File(localFile1, localFile2.getName());
      if (!localFile3.exists()) {
        localFile2.renameTo(localFile3);
      }
      localArrayList.add(localFile3);
    }
    BehanceSDKUtils.deleteRecursive(tempStorageFolder);
    return localArrayList;
  }
  
  private void processImage(int paramInt, AdobeSelectionAssetFile paramAdobeSelectionAssetFile)
  {
    IBehanceSDKImageValidator localIBehanceSDKImageValidator = getImageValidator();
    paramAdobeSelectionAssetFile = paramAdobeSelectionAssetFile.getSelectedItem();
    File localFile = new File(tempStorageFolder, paramAdobeSelectionAssetFile.getName());
    BehanceSDKImageProperties localBehanceSDKImageProperties = getImageProperties(paramAdobeSelectionAssetFile);
    if ((localBehanceSDKImageProperties.getHeight() > 2560) || (localBehanceSDKImageProperties.getWidth() > 2560))
    {
      downloadRendition(paramInt, paramAdobeSelectionAssetFile, localFile);
      return;
    }
    if ((localIBehanceSDKImageValidator == null) || (localIBehanceSDKImageValidator.validate(getActivity(), localBehanceSDKImageProperties)))
    {
      downloadOriginalFile(paramInt, paramAdobeSelectionAssetFile, localFile);
      return;
    }
    invalidFile.add(localFile);
  }
  
  private void saveDatatoFile(byte[] paramArrayOfByte, File paramFile)
  {
    try
    {
      localObject = new FileOutputStream(paramFile);
      ((FileOutputStream)localObject).write(paramArrayOfByte);
      ((FileOutputStream)localObject).close();
      return;
    }
    catch (Exception paramArrayOfByte)
    {
      Object localObject = getString(R.string.bsdk_cc_asset_browser_file_download_error, new Object[] { paramFile.getName() });
      logger.error((String)localObject, new Object[] { paramArrayOfByte });
      downloadErrors.add(paramFile);
      showMessage((String)localObject);
    }
  }
  
  private void showMessage(String paramString)
  {
    Toast.makeText(getActivity(), paramString, 1).show();
  }
  
  public void cancelDownload()
  {
    Object localObject2;
    for (;;)
    {
      try
      {
        if ((mSelectedAssetsList == null) || (mSelectedAssetsList.isEmpty())) {
          break label200;
        }
        Iterator localIterator1 = mSelectedAssetsList.iterator();
        if (!localIterator1.hasNext()) {
          break;
        }
        localObject2 = (AdobeSelection)localIterator1.next();
        if ((localObject2 instanceof AdobeSelectionAssetFile))
        {
          localObject2 = ((AdobeSelectionAssetFile)localObject2).getSelectedItem();
          ((AdobeAssetFile)localObject2).cancelDataRequest();
          BehanceSDKImageProperties localBehanceSDKImageProperties = getImageProperties((AdobeAssetFile)localObject2);
          if ((localBehanceSDKImageProperties.getHeight() > 2560) || (localBehanceSDKImageProperties.getWidth() > 2560)) {
            ((AdobeAssetFile)localObject2).cancelRenditionRequest();
          } else {
            ((AdobeAssetFile)localObject2).cancelDataRequest();
          }
        }
      }
      finally {}
    }
    if ((files != null) && (!files.isEmpty()))
    {
      Iterator localIterator2 = files.iterator();
      while (localIterator2.hasNext())
      {
        localObject2 = (File)localIterator2.next();
        if (((File)localObject2).exists()) {
          ((File)localObject2).delete();
        }
      }
    }
    BehanceSDKUtils.deleteRecursive(tempStorageFolder);
    mSelectedAssetsList = null;
    files = null;
    downloadErrors = null;
    invalidFile = null;
    label200:
    isDownloadInProgress = false;
  }
  
  public void downloadSelectedFiles(Intent paramIntent)
  {
    try
    {
      isDownloadInProgress = true;
      mSelectedAssetsList = new AdobeUXAssetBrowser.ResultProvider(paramIntent).getSelectionAssetArray();
      int i;
      if ((mSelectedAssetsList != null) && (!mSelectedAssetsList.isEmpty()))
      {
        i = mSelectedAssetsList.size();
        files = new ArrayList();
        downloadErrors = new ArrayList();
        invalidFile = new ArrayList();
        tempStorageFolder = getStorageDirectoryForDownload();
        paramIntent = mSelectedAssetsList.iterator();
      }
      while (paramIntent.hasNext())
      {
        AdobeSelection localAdobeSelection = (AdobeSelection)paramIntent.next();
        if ((localAdobeSelection instanceof AdobeSelectionAssetFile))
        {
          processImage(i, (AdobeSelectionAssetFile)localAdobeSelection);
          continue;
          isDownloadInProgress = false;
        }
      }
    }
    finally {}
  }
  
  public boolean isDownloadInProgress()
  {
    return isDownloadInProgress;
  }
  
  public void launchCCAssetBrowser(Activity paramActivity, Intent paramIntent)
    throws AdobeCSDKException
  {
    imageValidatorType = paramIntent.getStringExtra("ARGS_IMAGE_VALIDATOR_TYPE");
    AdobeUXAssetBrowserConfiguration localAdobeUXAssetBrowserConfiguration = new AdobeUXAssetBrowserConfiguration();
    Serializable localSerializable = paramIntent.getSerializableExtra("ARGS_ASSET_BROWSER_OPTIONS");
    if (localSerializable != null) {
      options = ((EnumSet)localSerializable);
    }
    paramIntent = paramIntent.getSerializableExtra("ARGS_ALLOWED_MIME_TYPES");
    if (paramIntent != null) {
      mimeTypeFilter = AdobeAssetMIMETypeFilter.createFromMimeTypes((EnumSet)paramIntent, AdobeAssetMIMETypeFilterType.ADOBE_ASSET_MIMETYPE_FILTERTYPE_INCLUSION);
    }
    AdobeUXAssetBrowser.getSharedInstance().popupFileBrowser(paramActivity, 9786, localAdobeUXAssetBrowserConfiguration);
  }
  
  public void removeDownloadListener()
  {
    listener = null;
  }
  
  public void setDownloadListener(ICreativeCloudAssetDownloadListener paramICreativeCloudAssetDownloadListener)
  {
    listener = paramICreativeCloudAssetDownloadListener;
  }
  
  public static abstract interface ICreativeCloudAssetDownloadListener
  {
    public abstract void onDownloadComplete(List<File> paramList1, List<File> paramList2, List<File> paramList3);
  }
}
