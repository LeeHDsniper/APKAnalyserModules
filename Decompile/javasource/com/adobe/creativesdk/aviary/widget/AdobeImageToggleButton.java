package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.ToggleButton;
import com.adobe.android.ui.utils.TypefaceUtils;
import com.aviary.android.feather.sdk.R.styleable;

public class AdobeImageToggleButton
  extends ToggleButton
{
  public AdobeImageToggleButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeImageToggleButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdobeImageToggleButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramContext = paramContext.getTheme().obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeTextViewCustomFont, paramInt, 0);
    setTypeface(paramContext.getString(R.styleable.AdobeTextViewCustomFont_fontFamily));
    paramContext.recycle();
  }
  
  public void setTextAppearance(Context paramContext, int paramInt)
  {
    super.setTextAppearance(paramContext, paramInt);
  }
  
  public void setTypeface(String paramString)
  {
    if (paramString != null) {}
    try
    {
      setTypeface(TypefaceUtils.createFromAsset(getContext().getAssets(), paramString));
      return;
    }
    catch (Throwable paramString) {}
  }
}
