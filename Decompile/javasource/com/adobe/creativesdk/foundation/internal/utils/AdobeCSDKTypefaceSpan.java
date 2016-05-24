package com.adobe.creativesdk.foundation.internal.utils;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.TypefaceSpan;

public class AdobeCSDKTypefaceSpan
  extends TypefaceSpan
{
  private final Typeface newType;
  
  public AdobeCSDKTypefaceSpan(String paramString, Typeface paramTypeface)
  {
    super(paramString);
    newType = paramTypeface;
  }
  
  private static void applyCustomTypeFace(Paint paramPaint, Typeface paramTypeface)
  {
    Typeface localTypeface = paramPaint.getTypeface();
    if (localTypeface == null) {}
    for (int i = 0;; i = localTypeface.getStyle())
    {
      i &= (paramTypeface.getStyle() ^ 0xFFFFFFFF);
      if ((i & 0x1) != 0) {
        paramPaint.setFakeBoldText(true);
      }
      if ((i & 0x2) != 0) {
        paramPaint.setTextSkewX(-0.25F);
      }
      paramPaint.setTypeface(paramTypeface);
      return;
    }
  }
  
  public void updateDrawState(TextPaint paramTextPaint)
  {
    applyCustomTypeFace(paramTextPaint, newType);
  }
  
  public void updateMeasureState(TextPaint paramTextPaint)
  {
    applyCustomTypeFace(paramTextPaint, newType);
  }
}
