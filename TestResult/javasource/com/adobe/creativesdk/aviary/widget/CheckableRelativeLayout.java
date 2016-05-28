package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.Checkable;
import android.widget.RelativeLayout;

public class CheckableRelativeLayout
  extends RelativeLayout
  implements Checkable
{
  private static final int[] CHECKED_STATE_SET = { 16842912 };
  private boolean checked = false;
  
  public CheckableRelativeLayout(Context paramContext)
  {
    super(paramContext);
  }
  
  public CheckableRelativeLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public CheckableRelativeLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public boolean isChecked()
  {
    return checked;
  }
  
  protected int[] onCreateDrawableState(int paramInt)
  {
    int[] arrayOfInt = super.onCreateDrawableState(paramInt + 1);
    if (isChecked()) {
      mergeDrawableStates(arrayOfInt, CHECKED_STATE_SET);
    }
    return arrayOfInt;
  }
  
  public void setChecked(boolean paramBoolean)
  {
    if (paramBoolean != checked)
    {
      checked = paramBoolean;
      refreshDrawableState();
    }
  }
  
  public void toggle()
  {
    if (!checked) {}
    for (boolean bool = true;; bool = false)
    {
      setChecked(bool);
      return;
    }
  }
}
