package com.adobe.creativesdk.foundation.internal.utils;

import android.graphics.drawable.Drawable;

public class AdobeLongClickMenuItem
  implements Comparable
{
  private Drawable itemIcon;
  private String itemName;
  IAdobeLongMenuItemClickListener listener;
  private int priority;
  
  public AdobeLongClickMenuItem(String paramString, Drawable paramDrawable, int paramInt, IAdobeLongMenuItemClickListener paramIAdobeLongMenuItemClickListener)
  {
    itemName = paramString;
    itemIcon = paramDrawable;
    priority = paramInt;
    listener = paramIAdobeLongMenuItemClickListener;
  }
  
  public int compareTo(Object paramObject)
  {
    paramObject = (AdobeLongClickMenuItem)paramObject;
    if (priority == priority) {
      return 0;
    }
    if (priority < priority) {
      return 1;
    }
    return -1;
  }
  
  public Drawable getItemIcon()
  {
    return itemIcon;
  }
  
  public String getItemName()
  {
    return itemName;
  }
}
