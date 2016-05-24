package com.adobe.creativesdk.aviary.internal.services;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;

public class ConfigService
  extends BaseContextService
{
  Resources mResources;
  
  public ConfigService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    super(paramAdobeImageEditorController);
    mResources = paramAdobeImageEditorController.getBaseContext().getResources();
  }
  
  public void dispose() {}
  
  public boolean getBoolean(int paramInt)
  {
    return mResources.getBoolean(paramInt);
  }
  
  public int getColor(int paramInt)
  {
    return mResources.getColor(paramInt);
  }
  
  public int getDimensionPixelSize(int paramInt)
  {
    return mResources.getDimensionPixelSize(paramInt);
  }
  
  public float getFraction(int paramInt1, int paramInt2, int paramInt3)
  {
    return mResources.getFraction(paramInt1, paramInt2, paramInt3);
  }
  
  public int[] getIntArray(int paramInt)
  {
    return mResources.getIntArray(paramInt);
  }
  
  public int getInteger(int paramInt)
  {
    return mResources.getInteger(paramInt);
  }
  
  public int[] getSizeArray(int paramInt)
  {
    float f = mResources.getDisplayMetrics().density;
    int[] arrayOfInt = getIntArray(paramInt);
    if (arrayOfInt != null)
    {
      paramInt = 0;
      while (paramInt < arrayOfInt.length)
      {
        arrayOfInt[paramInt] = ((int)(arrayOfInt[paramInt] * f));
        paramInt += 1;
      }
    }
    return arrayOfInt;
  }
  
  public String getString(int paramInt)
  {
    return mResources.getString(paramInt);
  }
  
  public String[] getStringArray(int paramInt)
  {
    return mResources.getStringArray(paramInt);
  }
}
