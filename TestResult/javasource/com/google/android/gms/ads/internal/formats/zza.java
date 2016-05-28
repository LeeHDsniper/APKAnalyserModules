package com.google.android.gms.ads.internal.formats;

import android.graphics.Color;
import android.graphics.drawable.Drawable;

public class zza
{
  private static final int zzvA = Color.rgb(204, 204, 204);
  static final int zzvB = zzvA;
  static final int zzvC = zzvz;
  private static final int zzvz = Color.rgb(12, 174, 206);
  private final int mTextColor;
  private final String zzvD;
  private final Drawable zzvE;
  private final int zzvF;
  private final int zzvG;
  
  public zza(String paramString, Drawable paramDrawable, Integer paramInteger1, Integer paramInteger2, Integer paramInteger3)
  {
    zzvD = paramString;
    zzvE = paramDrawable;
    if (paramInteger1 != null)
    {
      i = paramInteger1.intValue();
      zzvF = i;
      if (paramInteger2 == null) {
        break label75;
      }
      i = paramInteger2.intValue();
      label42:
      mTextColor = i;
      if (paramInteger3 == null) {
        break label83;
      }
    }
    label75:
    label83:
    for (int i = paramInteger3.intValue();; i = 12)
    {
      zzvG = i;
      return;
      i = zzvB;
      break;
      i = zzvC;
      break label42;
    }
  }
  
  public int getBackgroundColor()
  {
    return zzvF;
  }
  
  public Drawable getIcon()
  {
    return zzvE;
  }
  
  public String getText()
  {
    return zzvD;
  }
  
  public int getTextColor()
  {
    return mTextColor;
  }
  
  public int getTextSize()
  {
    return zzvG;
  }
}
