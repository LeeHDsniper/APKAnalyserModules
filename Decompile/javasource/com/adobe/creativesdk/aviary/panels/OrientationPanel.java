package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.AdjustFilter;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.widget.AdobeImageAdjustImageView;
import com.adobe.creativesdk.aviary.widget.AdobeImageAdjustImageView.FlipType;
import com.adobe.creativesdk.aviary.widget.AdobeImageAdjustImageView.OnResetListener;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import org.json.JSONException;

public class OrientationPanel
  extends AbstractContentPanel
  implements View.OnClickListener, AdobeImageAdjustImageView.OnResetListener
{
  boolean isClosing;
  private AdobeImageAdjustImageView mAdjustImageView;
  private AdobeImageHighlightImageButton mButton1;
  private AdobeImageHighlightImageButton mButton2;
  private AdobeImageHighlightImageButton mButton3;
  private AdobeImageHighlightImageButton mButton4;
  
  public OrientationPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry, ToolLoaderFactory.Tools paramTools)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
    mFilter = ToolLoaderFactory.get(paramTools);
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_orientation, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_orientation, paramViewGroup, false);
  }
  
  public boolean getIsChanged()
  {
    boolean bool = mAdjustImageView.getStraightenStarted();
    int i = (int)mAdjustImageView.getCurrentRotation();
    int j = mAdjustImageView.getFlipType();
    return (i != 0) || (j != FLIP_NONEnativeInt) || (bool);
  }
  
  public void onActivate()
  {
    super.onActivate();
    mAdjustImageView.setImageBitmap(mBitmap);
    mAdjustImageView.setOnResetListener(this);
    mButton1.setOnClickListener(this);
    mButton2.setOnClickListener(this);
    mButton3.setOnClickListener(this);
    mButton4.setOnClickListener(this);
    contentReady();
  }
  
  public boolean onCancel()
  {
    if (isClosing) {
      return true;
    }
    isClosing = true;
    setEnabled(false);
    int i = (int)mAdjustImageView.getCurrentRotation();
    mAdjustImageView.getHorizontalFlip();
    mAdjustImageView.getVerticalFlip();
    mAdjustImageView.getStraightenStarted();
    mAdjustImageView.getStraightenAngle();
    return false;
  }
  
  public void onClick(View paramView)
  {
    if ((!isActive()) || (!isEnabled())) {}
    int i;
    do
    {
      return;
      i = paramView.getId();
      if (i == R.id.button1)
      {
        mAdjustImageView.rotate90(false);
        return;
      }
      if (i == R.id.button2)
      {
        mAdjustImageView.rotate90(true);
        return;
      }
      if (i == R.id.button3)
      {
        mAdjustImageView.flip(true);
        return;
      }
    } while (i != R.id.button4);
    mAdjustImageView.flip(false);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mAdjustImageView = ((AdobeImageAdjustImageView)getContentView().findViewById(R.id.image));
    paramBitmap = getOptionView();
    mButton1 = ((AdobeImageHighlightImageButton)paramBitmap.findViewById(R.id.button1));
    mButton2 = ((AdobeImageHighlightImageButton)paramBitmap.findViewById(R.id.button2));
    mButton3 = ((AdobeImageHighlightImageButton)paramBitmap.findViewById(R.id.button3));
    mButton4 = ((AdobeImageHighlightImageButton)paramBitmap.findViewById(R.id.button4));
  }
  
  public void onDeactivate()
  {
    mAdjustImageView.setOnResetListener(null);
    mButton1.setOnClickListener(null);
    mButton2.setOnClickListener(null);
    mButton3.setOnClickListener(null);
    mButton4.setOnClickListener(null);
    super.onDeactivate();
  }
  
  public void onDestroy()
  {
    mAdjustImageView.setImageBitmap(null);
    super.onDestroy();
  }
  
  protected void onGenerateResult()
  {
    int i = (int)mAdjustImageView.getCurrentRotation();
    double d1 = mAdjustImageView.getStraightenAngle();
    boolean bool1 = mAdjustImageView.getHorizontalFlip();
    boolean bool2 = mAdjustImageView.getVerticalFlip();
    double d2 = 1.0D / mAdjustImageView.getGrowthFactor();
    AdjustFilter localAdjustFilter = (AdjustFilter)mFilter;
    localAdjustFilter.setFlip(bool1, bool2);
    localAdjustFilter.setFixedRotation(i);
    localAdjustFilter.setStraighten(d1, d2, d2);
    try
    {
      Bitmap localBitmap = localAdjustFilter.execute(mBitmap, null, 1, 1);
      mAdjustImageView.setImageBitmap(localBitmap);
      mEditResult.setActionList(localAdjustFilter.getActions());
      mEditResult.setToolAction(new ToolActionVO(Integer.valueOf(0)));
      onComplete(localBitmap);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      onGenericError(localJSONException);
    }
  }
  
  public void onResetComplete()
  {
    getContext().cancel();
  }
}
