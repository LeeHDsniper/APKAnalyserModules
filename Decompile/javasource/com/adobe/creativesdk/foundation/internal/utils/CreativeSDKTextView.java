package com.adobe.creativesdk.foundation.internal.utils;

import android.content.Context;
import android.graphics.Typeface;
import android.text.TextUtils.TruncateAt;
import android.util.AttributeSet;
import android.widget.TextView;

public class CreativeSDKTextView
  extends TextView
{
  private static Typeface _csdkadobeCleanFont = null;
  
  public CreativeSDKTextView(Context paramContext)
  {
    super(paramContext);
  }
  
  public CreativeSDKTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public CreativeSDKTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public void setEllipsize(TextUtils.TruncateAt paramTruncateAt)
  {
    super.setEllipsize(paramTruncateAt);
  }
  
  public void setTypeface(Typeface paramTypeface)
  {
    super.setTypeface(AdobeCSDKTypeFace.getTypeface(getContext()));
  }
}
