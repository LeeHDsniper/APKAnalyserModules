package com.adobe.android.ui.view;

import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Button;
import com.adobe.android.ui.R.styleable;
import com.adobe.android.ui.utils.TypefaceUtils;

public class AdobeButton
  extends Button
{
  public AdobeButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdobeButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    if (isInEditMode()) {
      return;
    }
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
    catch (Throwable localThrowable)
    {
      Log.w("AdobeButton", "unable to create font " + paramString);
      localThrowable.printStackTrace();
    }
  }
}
