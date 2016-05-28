package com.behance.sdk.ui.customviews;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;
import com.behance.sdk.util.BehanceSDKFontUtils;

public class BehanceSDKTextView
  extends TextView
{
  public BehanceSDKTextView(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null);
  }
  
  public BehanceSDKTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }
  
  public BehanceSDKTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }
  
  private void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    String str = null;
    if (paramAttributeSet != null) {
      str = paramAttributeSet.getAttributeValue("http://schemas.android.com/apk/com.behance.sdk", "fontStyle");
    }
    BehanceSDKFontUtils.setAdobeCleanFont(paramContext, this, str);
  }
  
  public void setTypeface(Typeface paramTypeface)
  {
    super.setTypeface(paramTypeface);
  }
  
  public void setTypeface(Typeface paramTypeface, int paramInt)
  {
    super.setTypeface(paramTypeface, paramInt);
  }
}
