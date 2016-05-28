package com.adobe.creativesdk.aviary.panels;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.adobe.android.ui.widget.VibrationWidget;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.services.LocalDataService;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;

abstract class AbstractOptionPanel
  extends AbstractPanel
  implements AbstractPanel.OptionPanel
{
  protected ViewGroup mOptionView;
  
  public AbstractOptionPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  protected void disableHapticIsNecessary(VibrationWidget... paramVarArgs)
  {
    boolean bool2 = true;
    boolean bool1;
    if (((LocalDataService)getContext().getService(LocalDataService.class)).getIntentHasExtra("tools-vibration-disabled")) {
      bool1 = false;
    }
    for (;;)
    {
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        paramVarArgs[i].setVibrationEnabled(bool1);
        i += 1;
      }
      bool1 = bool2;
      if (getContext() != null)
      {
        bool1 = bool2;
        if (getContext().getBaseContext() != null) {
          bool1 = SharedPreferencesUtils.getInstance(getContext().getBaseContext()).hasVibrationEnabled();
        }
      }
    }
  }
  
  protected abstract ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup);
  
  public final ViewGroup getOptionView()
  {
    return mOptionView;
  }
  
  public final ViewGroup getOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    mOptionView = generateOptionView(paramLayoutInflater, paramViewGroup);
    return mOptionView;
  }
  
  protected void onDispose()
  {
    mOptionView = null;
    super.onDispose();
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    getOptionView().setEnabled(paramBoolean);
    super.setEnabled(paramBoolean);
  }
}
