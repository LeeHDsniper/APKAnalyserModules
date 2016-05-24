package com.behance.sdk.ui.fragments;

import android.content.ContentResolver;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.graphics.Point;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Toast;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.R.style;
import com.behance.sdk.dto.BehanceSDKImageCropperDTO;
import com.behance.sdk.edmodo.cropper.CropImageView;
import com.behance.sdk.project.modules.ImageModule;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class BehanceSDKImageCropperDialogFragment
  extends DialogFragment
  implements View.OnClickListener
{
  private Callbacks callbacks;
  private CropImageView cropImageView;
  private int imageHeight;
  private int imageWidth;
  private int minLength;
  
  public BehanceSDKImageCropperDialogFragment() {}
  
  public static BehanceSDKImageCropperDialogFragment getInstance(BehanceSDKImageCropperDTO paramBehanceSDKImageCropperDTO, Callbacks paramCallbacks)
  {
    BehanceSDKImageCropperDialogFragment localBehanceSDKImageCropperDialogFragment = new BehanceSDKImageCropperDialogFragment();
    Bundle localBundle = new Bundle();
    localBundle.putSerializable("ARGS_KEY_IMAGE_CROPPER_DTO", paramBehanceSDKImageCropperDTO);
    localBehanceSDKImageCropperDialogFragment.setArguments(localBundle);
    localBehanceSDKImageCropperDialogFragment.setCallbacks(paramCallbacks);
    return localBehanceSDKImageCropperDialogFragment;
  }
  
  public void close()
  {
    dismiss();
  }
  
  public void cropSaveAndClose()
  {
    if (callbacks != null)
    {
      Bitmap localBitmap3 = cropImageView.getCroppedImage();
      Bitmap localBitmap1 = localBitmap3;
      Bitmap localBitmap2 = localBitmap1;
      if (imageHeight != -1)
      {
        localBitmap2 = localBitmap1;
        if (imageWidth != -1)
        {
          localBitmap2 = Bitmap.createScaledBitmap(localBitmap3, imageWidth, imageWidth, false);
          localBitmap3.recycle();
        }
      }
      if (localBitmap2 == null) {
        break label74;
      }
      callbacks.onImageCropped(localBitmap2);
    }
    for (;;)
    {
      close();
      return;
      label74:
      Toast.makeText(getActivity(), getResources().getString(R.string.bsdk_image_cropper_crop_failed_msg), 0).show();
    }
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (i == R.id.bsdkCropImageOk) {
      cropSaveAndClose();
    }
    while (i != R.id.bsdkCropImageCancel) {
      return;
    }
    close();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(2, R.style.BsdkPublishWIPToBehanceViewTheme);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.bsdk_dialog_fragment_image_cropper, paramViewGroup, true);
    cropImageView = ((CropImageView)paramLayoutInflater.findViewById(R.id.crop_image_view));
    cropImageView.setMinSize(200);
    paramViewGroup = getArguments();
    if (paramViewGroup != null)
    {
      paramViewGroup = (BehanceSDKImageCropperDTO)paramViewGroup.get("ARGS_KEY_IMAGE_CROPPER_DTO");
      if (paramViewGroup.isIncludeControls()) {
        paramLayoutInflater.findViewById(R.id.bsdkCropImageControlsWrapper).setVisibility(0);
      }
      imageHeight = paramViewGroup.getHeight();
      imageWidth = paramViewGroup.getWidth();
      minLength = paramViewGroup.getMinSize();
      setImage(paramViewGroup.getImageModule());
    }
    for (;;)
    {
      paramLayoutInflater.findViewById(R.id.bsdkCropImageOk).setOnClickListener(this);
      paramLayoutInflater.findViewById(R.id.bsdkCropImageCancel).setOnClickListener(this);
      return paramLayoutInflater;
      Toast.makeText(getActivity(), getResources().getString(R.string.bsdk_image_cropper_failed_to_open_msg), 0).show();
      close();
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public void setImage(ImageModule paramImageModule)
  {
    if ((imageHeight != -1) && (imageWidth != -1))
    {
      cropImageView.setAspectRatio(imageWidth, imageHeight);
      cropImageView.setFixedAspectRatio(true);
    }
    for (;;)
    {
      if (minLength != -1) {
        cropImageView.setMinSize(minLength);
      }
      Object localObject2 = getActivity().getContentResolver();
      Object localObject3 = Uri.parse("file:///" + String.valueOf(paramImageModule.getFile()));
      localObject1 = null;
      try
      {
        localObject2 = ((ContentResolver)localObject2).openInputStream((Uri)localObject3);
        localObject1 = localObject2;
      }
      catch (FileNotFoundException localFileNotFoundException)
      {
        for (;;)
        {
          Point localPoint;
          int i;
          localFileNotFoundException.printStackTrace();
          continue;
          cropImageView.setImageBitmap((Bitmap)localObject1);
        }
      }
      localObject2 = new BitmapFactory.Options();
      localObject3 = getActivity().getWindowManager().getDefaultDisplay();
      localPoint = new Point();
      ((Display)localObject3).getSize(localPoint);
      inSampleSize = (paramImageModule.getWidth() / x);
      localObject1 = BitmapFactory.decodeStream((InputStream)localObject1, null, (BitmapFactory.Options)localObject2);
      i = paramImageModule.getRotation();
      if (i <= 0) {
        break;
      }
      cropImageView.setImageBitmap(null);
      paramImageModule = new Matrix();
      paramImageModule.postRotate(i * 90);
      paramImageModule = Bitmap.createBitmap((Bitmap)localObject1, 0, 0, ((Bitmap)localObject1).getWidth(), ((Bitmap)localObject1).getHeight(), paramImageModule, true);
      cropImageView.setImageBitmap(paramImageModule);
      cropImageView.setGuidelines(0);
      return;
      cropImageView.setFixedAspectRatio(false);
    }
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onImageCropped(Bitmap paramBitmap);
  }
}
