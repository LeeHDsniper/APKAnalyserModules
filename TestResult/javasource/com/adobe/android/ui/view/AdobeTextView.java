package com.adobe.android.ui.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.TextView;
import com.adobe.android.ui.R.styleable;
import com.adobe.android.ui.utils.TypefaceUtils;

public class AdobeTextView
  extends TextView
{
  public AdobeTextView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdobeTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, 0);
  }
  
  public AdobeTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    super(paramContext, paramAttributeSet, paramInt1);
    if (isInEditMode()) {
      return;
    }
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeTextViewCustomFont, 0, paramInt2);
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
      Log.w("AdobeImageTextView", "unable to create font " + paramString);
      localThrowable.printStackTrace();
    }
  }
}
