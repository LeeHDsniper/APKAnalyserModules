package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageButton;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeEntitlementServices;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetFileInternal;

public class AdobeAssetOneUpSinglePageCellView
  extends AdobeAssetOneUpBaseCellView
{
  private int _currentAssetPos;
  private ImageButton mVidPlayBtn;
  
  public AdobeAssetOneUpSinglePageCellView() {}
  
  public void handleVideoFiles()
  {
    mVidPlayBtn.setVisibility(0);
    mVidPlayBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (_oneUpViewContext == null) {
          return;
        }
        paramAnonymousView = (AdobeAssetFileInternal)AdobeAssetViewerController.getAssetAtPos(_currentAssetPos);
        if (paramAnonymousView.canStreamVideo())
        {
          paramAnonymousView = new Intent();
          paramAnonymousView.setClass((Activity)_oneUpViewContext, AdobeUXAssetVideoActivity.class);
          paramAnonymousView.putExtra("current_asset_position", _currentAssetPos);
          ((Activity)_oneUpViewContext).startActivity(paramAnonymousView);
          return;
        }
        if (!AdobeEntitlementServices.getSharedServices().isEntitledToService("ccv", paramAnonymousView.getCloud()))
        {
          handleNoPreviewWithMsg(R.string.adobe_error_not_entitled_to_video);
          return;
        }
        new AlertDialog.Builder(_oneUpViewContext).setTitle("").setMessage("Preparing video for preview").setCancelable(false).setPositiveButton("ok", new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int) {}
        }).create().show();
      }
    });
  }
  
  public void initiallizeVideoButton()
  {
    mVidPlayBtn = ((ImageButton)findViewById(R.id.asset_video_playBtn));
  }
  
  public void setCurrentAssetPos(int paramInt)
  {
    _currentAssetPos = paramInt;
  }
}
