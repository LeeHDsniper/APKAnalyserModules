package com.adobe.creativesdk.aviary.panels;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;

public abstract class AbstractSliderContentPanel
  extends AbstractContentPanel
  implements SeekBar.OnSeekBarChangeListener
{
  SeekBar mSeekBar;
  
  public AbstractSliderContentPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
    mFilter = ToolLoaderFactory.get(name);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_seekbar, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    super.onActivate();
    mSeekBar.setOnSeekBarChangeListener(this);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mSeekBar = ((SeekBar)getOptionView().findViewById(R.id.seekbar));
    if (getContext().hasAccentColor())
    {
      int i = getContext().getAccentColor(0);
      if (i != 0) {
        UIUtils.setSeekBarProgressTint(mSeekBar, i);
      }
    }
    mSeekBar.setProgress(50);
  }
  
  public void onDeactivate()
  {
    super.onDeactivate();
    mSeekBar.setOnSeekBarChangeListener(null);
  }
  
  public final void onProgressChanged(SeekBar paramSeekBar, int paramInt, boolean paramBoolean)
  {
    onSliderChanged(paramInt, paramBoolean);
  }
  
  protected abstract void onSliderChanged(int paramInt, boolean paramBoolean);
  
  protected abstract void onSliderEnd(int paramInt);
  
  protected abstract void onSliderStart(int paramInt);
  
  public final void onStartTrackingTouch(SeekBar paramSeekBar)
  {
    onSliderStart(paramSeekBar.getProgress());
  }
  
  public final void onStopTrackingTouch(SeekBar paramSeekBar)
  {
    onSliderEnd(paramSeekBar.getProgress());
  }
  
  protected void setValue(int paramInt)
  {
    mSeekBar.setProgress(paramInt);
  }
}
