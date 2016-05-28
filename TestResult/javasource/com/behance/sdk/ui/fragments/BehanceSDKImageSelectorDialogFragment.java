package com.behance.sdk.ui.fragments;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.widget.ListAdapter;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewFlipper;
import com.adobe.creativesdk.foundation.storage.AdobeUXAssetBrowserOption;
import com.behance.sdk.BehanceSDKImageDimensions;
import com.behance.sdk.BehanceSDKImageSelectorOptions;
import com.behance.sdk.R.anim;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.R.style;
import com.behance.sdk.dto.BehanceSDKAlbumDTO;
import com.behance.sdk.enums.BehanceSDKAlbumType;
import com.behance.sdk.files.LocalImageLoader;
import com.behance.sdk.fragments.headless.BehanceSDKImageSelectorHeadlessFragment;
import com.behance.sdk.fragments.headless.BehanceSDKImageSelectorHeadlessFragment.Callbacks;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.project.modules.CreativeCloudAssetModule;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.activities.BehanceSDKCCLauncherActivity;
import com.behance.sdk.ui.adapters.BehanceSDKAlbumGridArrayAdapter;
import com.behance.sdk.ui.adapters.BehanceSDKAlbumImageGridArrayAdapter;
import com.behance.sdk.util.BehanceSDKUtils;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;

public class BehanceSDKImageSelectorDialogFragment
  extends DialogFragment
  implements DialogInterface.OnKeyListener, View.OnClickListener, BehanceSDKImageSelectorHeadlessFragment.Callbacks
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKImageSelectorDialogFragment.class);
  private GridView albumImagesGridView;
  private GridView albumsGridView;
  private ArrayList<String> allowedFileExtensionsList;
  private Callbacks callbacks;
  private BehanceSDKImageSelectorHeadlessFragment headlessFragment;
  private String imageValidatorType;
  private int lastDisplayedAlbumIndex;
  private int maxImageHeight;
  private long maxImageSizeBytes;
  private int maxImageWidth;
  private int maxNumberOfImages;
  private int minImageHeight;
  private long minImageSizeBytes;
  private int minImageWidth;
  private View progressSpinner;
  private ArrayList<String> prohibitedFileExtensionsList;
  private Uri selectedCameraImageUri;
  private ArrayList<ImageModule> selectedImageModulesList;
  private boolean showImageSelectionSources;
  private TextView titleBarActionBtnTxtView;
  private TextView titleBarTitleTxtView;
  private ViewFlipper viewFlipper;
  
  public BehanceSDKImageSelectorDialogFragment() {}
  
  private void clearAlbumsCache()
  {
    
    if (headlessFragment != null) {
      headlessFragment.clearAlbumsCache();
    }
  }
  
  private void closeThisDialog()
  {
    dismissAllowingStateLoss();
  }
  
  private void displayAlbumsView()
  {
    titleBarTitleTxtView.setText(R.string.bsdk_image_selector_view_titlebar_title_albums_txt);
    if (maxNumberOfImages == BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES) {
      titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label);
    }
    for (;;)
    {
      viewFlipper.setInAnimation(null);
      viewFlipper.setOutAnimation(getActivity(), R.anim.bsdk_dialog_exit);
      viewFlipper.setDisplayedChild(0);
      return;
      titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_cancel_label);
    }
  }
  
  private void displaySelectedAlbumImagesView(BehanceSDKAlbumDTO paramBehanceSDKAlbumDTO, boolean paramBoolean)
  {
    List localList = paramBehanceSDKAlbumDTO.getImages();
    if ((localList != null) && (!localList.isEmpty()))
    {
      paramBehanceSDKAlbumDTO = new BehanceSDKAlbumImageGridArrayAdapter(getActivity(), localList);
      paramBehanceSDKAlbumDTO.setSelectedImageModulesList(selectedImageModulesList);
      albumImagesGridView.setAdapter(paramBehanceSDKAlbumDTO);
      if (maxNumberOfImages == BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES)
      {
        titleBarTitleTxtView.setText(R.string.bsdk_image_selector_view_titlebar_title_choose_photos_txt);
        if (!selectedImageModulesList.isEmpty())
        {
          titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_multiple_photos_done_label);
          if (!paramBoolean) {
            break label158;
          }
          viewFlipper.setInAnimation(getActivity(), R.anim.bsdk_dialog_enter);
          viewFlipper.setOutAnimation(null);
        }
      }
      for (;;)
      {
        viewFlipper.setDisplayedChild(1);
        return;
        titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label);
        break;
        titleBarTitleTxtView.setText(R.string.bsdk_image_selector_view_titlebar_title_choose_single_photo_txt);
        titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_cancel_label);
        break;
        label158:
        viewFlipper.setInAnimation(null);
        viewFlipper.setOutAnimation(null);
      }
    }
    paramBehanceSDKAlbumDTO = getResources().getString(R.string.bsdk_image_selector_view_empty_album_msg, new Object[] { paramBehanceSDKAlbumDTO.getName() });
    Toast.makeText(getActivity(), paramBehanceSDKAlbumDTO, 0).show();
    displayAlbumsView();
  }
  
  private void displayToastMessage(String paramString)
  {
    if (paramString != null) {
      Toast.makeText(getActivity(), paramString, 1).show();
    }
  }
  
  public static BehanceSDKImageSelectorDialogFragment getInstance(Callbacks paramCallbacks, BehanceSDKImageSelectorOptions paramBehanceSDKImageSelectorOptions)
  {
    BehanceSDKImageSelectorDialogFragment localBehanceSDKImageSelectorDialogFragment = new BehanceSDKImageSelectorDialogFragment();
    localBehanceSDKImageSelectorDialogFragment.setCallbacks(paramCallbacks);
    paramCallbacks = new Bundle();
    if (paramBehanceSDKImageSelectorOptions != null)
    {
      paramCallbacks.putInt("ARGS_MAX_NUMBER_OF_IMAGES", paramBehanceSDKImageSelectorOptions.getMaxNumberOfImages());
      BehanceSDKImageDimensions localBehanceSDKImageDimensions = paramBehanceSDKImageSelectorOptions.getMinImageDimensions();
      if (localBehanceSDKImageDimensions != null)
      {
        paramCallbacks.putInt("ARGS_MIN_IMAGE_WIDTH", localBehanceSDKImageDimensions.getWidth());
        paramCallbacks.putInt("ARGS_MIN_IMAGE_HEIGHT", localBehanceSDKImageDimensions.getHeight());
      }
      localBehanceSDKImageDimensions = paramBehanceSDKImageSelectorOptions.getMaxImageDimensions();
      if (localBehanceSDKImageDimensions != null)
      {
        paramCallbacks.putInt("ARGS_MAX_IMAGE_WIDTH", localBehanceSDKImageDimensions.getWidth());
        paramCallbacks.putInt("ARGS_MAX_IMAGE_HEIGHT", localBehanceSDKImageDimensions.getHeight());
      }
      paramCallbacks.putBoolean("ARGS_ALBUMS_WITH_IMAGE_SELECTION_SOURCES", paramBehanceSDKImageSelectorOptions.isShowImageImageSelectionSources());
      paramCallbacks.putLong("ARGS_MIN_IMAGE_SIZE_BYTES", paramBehanceSDKImageSelectorOptions.getMinImageSizeInBytes());
      paramCallbacks.putLong("ARGS_MAX_IMAGE_SIZE_BYTES", paramBehanceSDKImageSelectorOptions.getMaxImageSizeInBytes());
      paramCallbacks.putStringArrayList("ARGS_ALLOWED_FILE_EXTENSIONS_LIST", paramBehanceSDKImageSelectorOptions.getAllowedFileExtensions());
      paramCallbacks.putStringArrayList("ARGS_PROHIBITED_FILE_EXTENSIONS_LIST", paramBehanceSDKImageSelectorOptions.getProhibitedFileExtensions());
      paramCallbacks.putString("ARGS_IMAGE_VALITATOR_TYPE", paramBehanceSDKImageSelectorOptions.getImageValidatorType());
    }
    for (;;)
    {
      localBehanceSDKImageSelectorDialogFragment.setArguments(paramCallbacks);
      return localBehanceSDKImageSelectorDialogFragment;
      paramCallbacks.putInt("ARGS_MAX_NUMBER_OF_IMAGES", BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES);
    }
  }
  
  private void handleActionBtnClick()
  {
    if (viewFlipper.getDisplayedChild() == 1)
    {
      if ((maxNumberOfImages > 1) || (maxNumberOfImages == BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES))
      {
        if (selectedImageModulesList.isEmpty())
        {
          notifyCallbacksOnCancel();
          closeThisDialog();
          return;
        }
        notifyCallbacksOnImageSelection(selectedImageModulesList);
        closeThisDialog();
        return;
      }
      notifyCallbacksOnCancel();
      closeThisDialog();
      return;
    }
    notifyCallbacksOnCancel();
    closeThisDialog();
  }
  
  private void handleBackBtnClick()
  {
    if (viewFlipper.getDisplayedChild() == 1)
    {
      displayAlbumsView();
      return;
    }
    notifyCallbacksOnBackPressed();
    closeThisDialog();
  }
  
  private void hideProgressSpinner()
  {
    if (progressSpinner != null) {
      progressSpinner.setVisibility(8);
    }
  }
  
  private boolean imageMatchesRequirements(ImageModule paramImageModule)
  {
    String str1 = paramImageModule.getName();
    String str2 = BehanceSDKUtils.getFileExtension(str1);
    if ((str2 != null) && (str2.length() > 0))
    {
      if ((prohibitedFileExtensionsList != null) && (!prohibitedFileExtensionsList.isEmpty()) && (prohibitedFileExtensionsList.contains(str2)))
      {
        displayToastMessage(getString(R.string.bsdk_image_selector_view_image_file_type_not_allowed_msg, new Object[] { str1, prohibitedFileExtensionsList.toString() }));
        return false;
      }
      if ((allowedFileExtensionsList != null) && (!allowedFileExtensionsList.isEmpty()) && (!allowedFileExtensionsList.contains(str2)))
      {
        displayToastMessage(getString(R.string.bsdk_image_selector_view_image_file_type_allowed_msg, new Object[] { str1, allowedFileExtensionsList.toString() }));
        return false;
      }
    }
    else
    {
      displayToastMessage(getString(R.string.bsdk_image_selector_view_image_file_type_invalid_msg, new Object[] { str1 }));
      return false;
    }
    int i = paramImageModule.getWidth();
    int j = paramImageModule.getHeight();
    long l = paramImageModule.getSizeInBytes();
    if (l > 0L)
    {
      if ((minImageSizeBytes > 0L) && (l < minImageSizeBytes))
      {
        paramImageModule = minImageSizeBytes / 1048576L + " MB";
        displayToastMessage(getString(R.string.bsdk_image_selector_view_image_size_less_than_min_required_msg, new Object[] { paramImageModule }));
        return false;
      }
      if ((maxImageSizeBytes > 0L) && (l > maxImageSizeBytes))
      {
        paramImageModule = maxImageSizeBytes / 1048576L + " MB";
        displayToastMessage(getString(R.string.bsdk_image_selector_view_image_size_more_than_max_allowed_msg, new Object[] { paramImageModule }));
        return false;
      }
    }
    else
    {
      displayToastMessage(getString(R.string.bsdk_image_selector_view_image_size_invalid_msg));
      return false;
    }
    if ((i > 0) && (j > 0))
    {
      if ((minImageWidth > 0) && (minImageHeight > 0) && ((i < minImageWidth) || (j < minImageHeight)))
      {
        displayToastMessage(getString(R.string.bsdk_image_selector_view_image_dimensions_less_than_min_required_msg, new Object[] { Integer.valueOf(minImageWidth), Integer.valueOf(minImageHeight), Integer.valueOf(i), Integer.valueOf(j) }));
        return false;
      }
      if ((maxImageWidth > 0) && (maxImageHeight > 0) && ((i > maxImageWidth) || (j > maxImageHeight)))
      {
        displayToastMessage(getString(R.string.bsdk_image_selector_view_image_dimensions_more_than_max_allowed_msg, new Object[] { Integer.valueOf(maxImageWidth), Integer.valueOf(maxImageHeight), Integer.valueOf(i), Integer.valueOf(j) }));
        return false;
      }
      return true;
    }
    displayToastMessage(getString(R.string.bsdk_image_selector_view_image_dimensions_invalid_msg));
    return false;
  }
  
  private void launchCameraToCapturePicture()
  {
    try
    {
      File localFile = BehanceSDKUtils.createTempImageFile();
      Intent localIntent = new Intent("android.media.action.IMAGE_CAPTURE");
      if (localIntent.resolveActivity(getActivity().getPackageManager()) != null)
      {
        if (localFile != null)
        {
          selectedCameraImageUri = Uri.fromFile(localFile);
          localIntent.putExtra("output", selectedCameraImageUri);
          startActivityForResult(localIntent, 1);
        }
      }
      else
      {
        logger.error("Camera intent not found", new Object[0]);
        Toast.makeText(getActivity(), R.string.bsdk_add_wip_pick_source_view_camera_launch_error, 1).show();
        return;
      }
    }
    catch (IOException localIOException)
    {
      logger.error(localIOException, "Problem creating temp file to capture image", new Object[0]);
      Toast.makeText(getActivity(), R.string.bsdk_add_wip_pick_source_view_camera_launch_error, 1).show();
    }
  }
  
  private void launchCreativeCloudAssetBrowser()
  {
    Intent localIntent = new Intent(getActivity(), BehanceSDKCCLauncherActivity.class);
    EnumSet localEnumSet = BehanceSDKUtils.getAdobeAssetMimeTypes(allowedFileExtensionsList);
    if (localEnumSet != null) {
      localIntent.putExtra("ARGS_ALLOWED_MIME_TYPES", localEnumSet);
    }
    if (maxNumberOfImages != 1) {
      localIntent.putExtra("ARGS_ASSET_BROWSER_OPTIONS", EnumSet.of(AdobeUXAssetBrowserOption.ENABLE_MULTI_SELECT, AdobeUXAssetBrowserOption.SHOW_MULTI_SELECT_ON_POPUP));
    }
    if (imageValidatorType != null) {
      localIntent.putExtra("ARGS_IMAGE_VALIDATOR_TYPE", imageValidatorType);
    }
    startActivityForResult(localIntent, 6789);
  }
  
  private void loadAlbums()
  {
    if ((headlessFragment.getAlbumsList() != null) && (!headlessFragment.getAlbumsList().isEmpty()))
    {
      setAlbumsGridAdapter();
      hideProgressSpinner();
      return;
    }
    loadAlbumsFromDevice();
  }
  
  private void loadAlbumsFromDevice()
  {
    showProgressSpinner();
    headlessFragment.loadAlbums(getActivity().getApplicationContext(), showImageSelectionSources);
  }
  
  private void notifyCallbacksOnBackPressed()
  {
    clearAlbumsCache();
    if (callbacks != null) {
      viewFlipper.post(new Runnable()
      {
        public void run()
        {
          callbacks.onImageSelectorSelectionBackPressed();
        }
      });
    }
  }
  
  private void notifyCallbacksOnCameraImageCaptureSuccess(ImageModule paramImageModule)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramImageModule);
    notifyCallbacksOnImageSelection(localArrayList);
  }
  
  private void notifyCallbacksOnCancel()
  {
    clearAlbumsCache();
    if (callbacks != null) {
      viewFlipper.post(new Runnable()
      {
        public void run()
        {
          callbacks.onImageSelectorSelectionCanceled();
        }
      });
    }
  }
  
  private void notifyCallbacksOnError(final Exception paramException)
  {
    clearAlbumsCache();
    if (callbacks != null) {
      viewFlipper.post(new Runnable()
      {
        public void run()
        {
          callbacks.onImageSelectorOnError(paramException);
        }
      });
    }
  }
  
  private void notifyCallbacksOnImageSelection(final List<ImageModule> paramList)
  {
    clearAlbumsCache();
    if (callbacks != null) {
      viewFlipper.post(new Runnable()
      {
        public void run()
        {
          callbacks.onImageSelectorSelectionFinished(paramList);
        }
      });
    }
  }
  
  private void onAlbumGridItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if ((paramAdapterView.getItemAtPosition(paramInt) instanceof BehanceSDKAlbumDTO))
    {
      lastDisplayedAlbumIndex = paramInt;
      paramAdapterView = (BehanceSDKAlbumDTO)paramAdapterView.getItemAtPosition(paramInt);
      if (paramAdapterView.getAlbumType() != BehanceSDKAlbumType.DEVICE_ALBUM) {
        break label49;
      }
      selectedImageModulesList.clear();
      displaySelectedAlbumImagesView(paramAdapterView, true);
    }
    label49:
    do
    {
      return;
      if (paramAdapterView.getAlbumType() == BehanceSDKAlbumType.CAMERA)
      {
        launchCameraToCapturePicture();
        return;
      }
    } while (paramAdapterView.getAlbumType() != BehanceSDKAlbumType.CREATIVE_CLOUD);
    launchCreativeCloudAssetBrowser();
  }
  
  private void onAlbumImageGridItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramView = paramAdapterView.getItemAtPosition(paramInt);
    if ((paramView instanceof ImageModule))
    {
      paramView = (ImageModule)paramView;
      if ((imageMatchesRequirements(paramView)) && (paramView.getFile() != null))
      {
        if (!selectedImageModulesList.contains(paramView)) {
          break label139;
        }
        selectedImageModulesList.remove(paramView);
      }
    }
    for (;;)
    {
      paramAdapterView = paramAdapterView.getAdapter();
      if ((paramAdapterView instanceof BehanceSDKAlbumImageGridArrayAdapter))
      {
        paramAdapterView = (BehanceSDKAlbumImageGridArrayAdapter)paramAdapterView;
        paramAdapterView.setSelectedImageModulesList(selectedImageModulesList);
        paramAdapterView.notifyDataSetChanged();
      }
      if ((maxNumberOfImages != BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES) && (selectedImageModulesList.size() >= maxNumberOfImages))
      {
        notifyCallbacksOnImageSelection(selectedImageModulesList);
        closeThisDialog();
      }
      if (selectedImageModulesList.isEmpty()) {
        break;
      }
      titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_multiple_photos_done_label);
      return;
      label139:
      selectedImageModulesList.add(paramView);
    }
    titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label);
  }
  
  private void setAlbumsGridAdapter()
  {
    Object localObject = headlessFragment.getAlbumsList();
    if (localObject != null)
    {
      localObject = new BehanceSDKAlbumGridArrayAdapter(getActivity(), (List)localObject);
      albumsGridView.setAdapter((ListAdapter)localObject);
    }
  }
  
  private void showProgressSpinner()
  {
    if (progressSpinner != null) {
      progressSpinner.setVisibility(0);
    }
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    }
    do
    {
      do
      {
        return;
        if (paramInt2 != -1) {
          break;
        }
        logger.debug("Camera Activity returned with ok result. [Photo Uri - %s]", new Object[] { selectedCameraImageUri });
      } while (selectedCameraImageUri == null);
      paramIntent = new File(selectedCameraImageUri.getPath());
      notifyCallbacksOnCameraImageCaptureSuccess(new ImageModule(paramIntent));
      BehanceSDKUtils.addImageToGallery(getActivity(), paramIntent.getAbsolutePath());
      clearAlbumsCache();
      loadAlbums();
      closeThisDialog();
      return;
      logger.debug("Camera Activity returned with not ok result. [Result - %s]", new Object[] { Integer.valueOf(paramInt2) });
      return;
    } while (paramInt2 != -1);
    Object localObject = (List)paramIntent.getExtras().getSerializable("ACTIVITY_CC_SUCCESSFULLY_DOWNLOADED_FILES");
    if ((localObject != null) && (!((List)localObject).isEmpty()))
    {
      paramIntent = new ArrayList(((List)localObject).size());
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        CreativeCloudAssetModule localCreativeCloudAssetModule = new CreativeCloudAssetModule((File)((Iterator)localObject).next());
        if (imageMatchesRequirements(localCreativeCloudAssetModule)) {
          paramIntent.add(localCreativeCloudAssetModule);
        }
      }
      notifyCallbacksOnImageSelection(paramIntent);
    }
    closeThisDialog();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == R.id.bsdkImageSelectorViewTitlebarActionBtnTxtView) {
      handleActionBtnClick();
    }
    while (paramView.getId() != R.id.bsdkImageSelectorViewBackBtnImageView) {
      return;
    }
    handleBackBtnClick();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(2, R.style.BsdkImageSelectorViewTheme);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.bsdk_dialog_fragment_image_selector, paramViewGroup, false);
    lastDisplayedAlbumIndex = 0;
    int i = 0;
    if (paramBundle != null)
    {
      i = paramBundle.getInt("BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX", 0);
      lastDisplayedAlbumIndex = paramBundle.getInt("BUNDLE_KEY_LAST_DISPLAYED_ALBUM_INDEX", 0);
      paramViewGroup = paramBundle.getSerializable("BUNDLE_KEY_SELECTED_IMAGE_MODULES_LIST");
      if ((paramViewGroup instanceof ArrayList)) {
        selectedImageModulesList = ((ArrayList)paramViewGroup);
      }
      selectedCameraImageUri = ((Uri)paramBundle.getParcelable("BUNDLE_KEY_CAMERA_IMAGE_URI"));
    }
    if (selectedImageModulesList == null) {
      selectedImageModulesList = new ArrayList();
    }
    paramViewGroup = getArguments();
    maxNumberOfImages = BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES;
    minImageHeight = -1;
    minImageWidth = -1;
    maxImageHeight = -1;
    maxImageWidth = -1;
    minImageSizeBytes = -1L;
    maxImageSizeBytes = -1L;
    imageValidatorType = null;
    if (paramViewGroup != null)
    {
      maxNumberOfImages = paramViewGroup.getInt("ARGS_MAX_NUMBER_OF_IMAGES", BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES);
      minImageWidth = paramViewGroup.getInt("ARGS_MIN_IMAGE_WIDTH", -1);
      minImageHeight = paramViewGroup.getInt("ARGS_MIN_IMAGE_HEIGHT", -1);
      maxImageWidth = paramViewGroup.getInt("ARGS_MAX_IMAGE_WIDTH", -1);
      maxImageHeight = paramViewGroup.getInt("ARGS_MAX_IMAGE_HEIGHT", -1);
      showImageSelectionSources = paramViewGroup.getBoolean("ARGS_ALBUMS_WITH_IMAGE_SELECTION_SOURCES", true);
      minImageSizeBytes = paramViewGroup.getLong("ARGS_MIN_IMAGE_SIZE_BYTES", -1L);
      maxImageSizeBytes = paramViewGroup.getLong("ARGS_MAX_IMAGE_SIZE_BYTES", -1L);
      allowedFileExtensionsList = paramViewGroup.getStringArrayList("ARGS_ALLOWED_FILE_EXTENSIONS_LIST");
      prohibitedFileExtensionsList = paramViewGroup.getStringArrayList("ARGS_PROHIBITED_FILE_EXTENSIONS_LIST");
      imageValidatorType = paramViewGroup.getString("ARGS_IMAGE_VALITATOR_TYPE");
    }
    headlessFragment = ((BehanceSDKImageSelectorHeadlessFragment)getActivity().getSupportFragmentManager().findFragmentByTag("IMAGE_SELECTOR_FRAGMENT_HEADLESS_FRAGMENT_TAG_SELECT_IMAGES"));
    if (headlessFragment == null)
    {
      headlessFragment = new BehanceSDKImageSelectorHeadlessFragment();
      getActivity().getSupportFragmentManager().beginTransaction().add(headlessFragment, "IMAGE_SELECTOR_FRAGMENT_HEADLESS_FRAGMENT_TAG_SELECT_IMAGES").commit();
    }
    headlessFragment.setCallbacks(this);
    viewFlipper = ((ViewFlipper)paramLayoutInflater.findViewById(R.id.bsdkImageSelectorViewFlipper));
    progressSpinner = paramLayoutInflater.findViewById(R.id.bsdkImageSelectorViewProgressSpinner);
    paramLayoutInflater.findViewById(R.id.bsdkImageSelectorViewBackBtnImageView).setOnClickListener(this);
    titleBarActionBtnTxtView = ((TextView)paramLayoutInflater.findViewById(R.id.bsdkImageSelectorViewTitlebarActionBtnTxtView));
    titleBarActionBtnTxtView.setOnClickListener(this);
    titleBarTitleTxtView = ((TextView)paramLayoutInflater.findViewById(R.id.bsdkImageSelectorViewTitlebarTitleTxtView));
    albumsGridView = ((GridView)paramLayoutInflater.findViewById(R.id.bsdkImageSelectorViewAlbumsGridView));
    albumsGridView.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        BehanceSDKImageSelectorDialogFragment.this.onAlbumGridItemClick(paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
      }
    });
    albumImagesGridView = ((GridView)paramLayoutInflater.findViewById(R.id.bsdkImageSelectorViewAlbumImagesGridView));
    albumImagesGridView.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        BehanceSDKImageSelectorDialogFragment.this.onAlbumImageGridItemClick(paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
      }
    });
    if (maxNumberOfImages == BehanceSDKImageSelectorOptions.UNLIMITED_NUM_OF_IMAGES)
    {
      titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label);
      if ((lastDisplayedAlbumIndex < 0) || (i != 1)) {
        break label610;
      }
      paramViewGroup = LocalImageLoader.getFromAlbumWithImageSelectionSources(getActivity(), lastDisplayedAlbumIndex);
      if ((paramViewGroup == null) || (paramViewGroup.getAlbumType() != BehanceSDKAlbumType.DEVICE_ALBUM)) {
        break label599;
      }
      displaySelectedAlbumImagesView(paramViewGroup, false);
    }
    for (;;)
    {
      getDialog().setOnKeyListener(this);
      if (!headlessFragment.isAlbumsLoadingInProgress()) {
        break label622;
      }
      showProgressSpinner();
      return paramLayoutInflater;
      titleBarActionBtnTxtView.setText(R.string.bsdk_image_selector_view_titlebar_action_btn_cancel_label);
      break;
      label599:
      viewFlipper.setDisplayedChild(0);
      continue;
      label610:
      viewFlipper.setDisplayedChild(i);
    }
    label622:
    loadAlbums();
    return paramLayoutInflater;
  }
  
  public void onDetach()
  {
    super.onDetach();
    if (headlessFragment != null) {
      headlessFragment.setCallbacks(null);
    }
  }
  
  public void onGetAlbumsFailure(Exception paramException)
  {
    if (getActivity() != null)
    {
      hideProgressSpinner();
      logger.error(paramException, "Problem loading albums", new Object[0]);
      Toast.makeText(getActivity(), R.string.bsdk_image_selector_view_error_loading_albums_msg, 1).show();
      notifyCallbacksOnError(paramException);
      closeThisDialog();
    }
  }
  
  public void onGetAlbumsSuccess()
  {
    if (getActivity() != null)
    {
      setAlbumsGridAdapter();
      hideProgressSpinner();
    }
  }
  
  public boolean onKey(DialogInterface paramDialogInterface, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (paramKeyEvent.getAction() != 0))
    {
      handleBackBtnClick();
      return true;
    }
    return false;
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putInt("BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX", viewFlipper.getDisplayedChild());
    paramBundle.putInt("BUNDLE_KEY_LAST_DISPLAYED_ALBUM_INDEX", lastDisplayedAlbumIndex);
    paramBundle.putSerializable("BUNDLE_KEY_SELECTED_IMAGE_MODULES_LIST", selectedImageModulesList);
    if (selectedCameraImageUri != null) {
      paramBundle.putParcelable("BUNDLE_KEY_CAMERA_IMAGE_URI", selectedCameraImageUri);
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onImageSelectorOnError(Exception paramException);
    
    public abstract void onImageSelectorSelectionBackPressed();
    
    public abstract void onImageSelectorSelectionCanceled();
    
    public abstract void onImageSelectorSelectionFinished(List<ImageModule> paramList);
  }
}
