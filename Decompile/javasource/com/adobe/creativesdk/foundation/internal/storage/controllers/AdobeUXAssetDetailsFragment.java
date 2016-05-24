package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.text.format.DateUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.assets.R.style;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import java.util.Date;
import java.util.TimeZone;

public class AdobeUXAssetDetailsFragment
  extends DialogFragment
{
  private int mNum;
  private boolean mOnDismissed;
  
  public AdobeUXAssetDetailsFragment() {}
  
  private String getFormattedDateString(Date paramDate)
  {
    long l1 = paramDate.getTime();
    long l2 = TimeZone.getDefault().getRawOffset();
    return DateUtils.formatDateTime(getActivity(), l1 + l2, 131093);
  }
  
  static AdobeUXAssetDetailsFragment newInstance(int paramInt)
  {
    AdobeUXAssetDetailsFragment localAdobeUXAssetDetailsFragment = new AdobeUXAssetDetailsFragment();
    Bundle localBundle = new Bundle();
    localBundle.putInt("num", paramInt);
    localAdobeUXAssetDetailsFragment.setArguments(localBundle);
    return localAdobeUXAssetDetailsFragment;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mNum = getArguments().getInt("num");
    setStyle(1, R.style.AdobeCSDKTheme_TransparentDialog);
    mOnDismissed = false;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.fragment_asset_details, paramViewGroup, false);
    paramViewGroup = AdobeAssetViewerController.getAssetAtPos(mNum);
    ((TextView)paramLayoutInflater.findViewById(R.id.ASSET_DETAILS_UPLOADED)).setText(getFormattedDateString(paramViewGroup.getCreationDate()));
    ((TextView)paramLayoutInflater.findViewById(R.id.ASSET_DETAILS_MODIFIED)).setText(getFormattedDateString(paramViewGroup.getModificationDate()));
    paramBundle = (TextView)paramLayoutInflater.findViewById(R.id.ASSET_DETAILS_SIZE);
    paramViewGroup = (AdobeAssetFile)paramViewGroup;
    float f = (float)paramViewGroup.getFileSize() / 1024.0F;
    TextView localTextView1;
    TextView localTextView2;
    TextView localTextView3;
    if (f < 1024.0F)
    {
      paramBundle.setText(String.format("%.2f", new Object[] { Float.valueOf(f) }) + getString(R.string.IDS_ASSET_DETAILS_KB));
      paramBundle = (TextView)paramLayoutInflater.findViewById(R.id.ASSET_DETAILS_WIDTH_NEW);
      localTextView1 = (TextView)paramLayoutInflater.findViewById(R.id.ASSET_DETAILS_HEIGHT);
      localTextView2 = (TextView)paramLayoutInflater.findViewById(R.id.ASSET_DETAILS_WIDTH_NEW_HEADER);
      localTextView3 = (TextView)paramLayoutInflater.findViewById(R.id.ASSET_DETAILS_HEIGHT_NEW_HEADER);
      paramViewGroup = AdobeStorageAssetFileUtils.getAssetFileImageDimensions(paramViewGroup);
      if (height == 0.0F) {
        break label335;
      }
      localTextView1.setText(Integer.toString((int)height) + getString(R.string.IDS_ASSET_DETAILS_PX));
    }
    for (;;)
    {
      if (width == 0.0F) {
        break label352;
      }
      paramBundle.setText(Integer.toString((int)width) + getString(R.string.IDS_ASSET_DETAILS_PX));
      return paramLayoutInflater;
      f /= 1024.0F;
      paramBundle.setText(String.format("%.2f", new Object[] { Float.valueOf(f) }) + getString(R.string.IDS_ASSET_DETAILS_MB));
      break;
      label335:
      localTextView3.setVisibility(8);
      localTextView1.setVisibility(8);
    }
    label352:
    localTextView2.setVisibility(8);
    paramBundle.setVisibility(8);
    return paramLayoutInflater;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    mOnDismissed = true;
    super.onDismiss(paramDialogInterface);
  }
}
