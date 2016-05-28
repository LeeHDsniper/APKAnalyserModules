package com.adobe.creativesdk.aviary.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.ColorFilter;
import android.graphics.LightingColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.View.BaseSavedState;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageView;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.creativesdk.aviary.graphics.GlowBitmapDrawable;
import com.aviary.android.feather.sdk.R.styleable;

public class AdobeImageHighlightImageButton
  extends ImageView
{
  private static final int[] CHECKED_STATE_SET = { 16842912 };
  private PorterDuff.Mode mBlendMode;
  private boolean mBroadcasting;
  private boolean mChecked;
  private ColorFilter mColorFilterTintChecked;
  private ColorFilter mColorFilterTintPressed;
  private ColorFilter mColorFilterTintSelected;
  private int mGlowSize;
  private int mGlowStatus;
  private int mHighlightColorChecked = 0;
  private int mHighlightColorPressed = 0;
  private int mHighlightColorSelected = 0;
  private int mHighlightMode;
  private OnCheckedChangeListener mOnCheckedChangeListener;
  private boolean mToggleEnabled;
  private boolean mUnToggleUserEnabled;
  
  public AdobeImageHighlightImageButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeImageHighlightImageButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdobeImageHighlightImageButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeImageHighlightImageButton, paramInt, 0);
    mHighlightColorPressed = paramContext.getColor(R.styleable.AdobeImageHighlightImageButton_adobe_highlightColorPressed, 0);
    mHighlightColorChecked = paramContext.getColor(R.styleable.AdobeImageHighlightImageButton_adobe_highlightColorChecked, 0);
    mHighlightColorSelected = paramContext.getColor(R.styleable.AdobeImageHighlightImageButton_adobe_highlightColorSelected, 0);
    mToggleEnabled = paramContext.getBoolean(R.styleable.AdobeImageHighlightImageButton_adobe_toggleable, false);
    mUnToggleUserEnabled = paramContext.getBoolean(R.styleable.AdobeImageHighlightImageButton_adobe_untoggleable, true);
    paramAttributeSet = paramContext.getString(R.styleable.AdobeImageHighlightImageButton_adobe_blendMode);
    mGlowStatus = paramContext.getInt(R.styleable.AdobeImageHighlightImageButton_adobe_glowMode, 0);
    mGlowSize = paramContext.getInt(R.styleable.AdobeImageHighlightImageButton_adobe_glowSize, 7);
    mHighlightMode = paramContext.getInteger(R.styleable.AdobeImageHighlightImageButton_adobe_highlightMode, 2);
    boolean bool = paramContext.getBoolean(R.styleable.AdobeImageHighlightImageButton_adobe_checked, false);
    if (!mToggleEnabled) {
      bool = false;
    }
    if (UIUtils.checkBits(mGlowStatus, 2)) {
      mColorFilterTintPressed = new LightingColorFilter(mHighlightColorPressed, mHighlightColorPressed);
    }
    if (UIUtils.checkBits(mGlowStatus, 4)) {
      mColorFilterTintChecked = new LightingColorFilter(mHighlightColorChecked, mHighlightColorChecked);
    }
    if (UIUtils.checkBits(mGlowStatus, 8)) {
      mColorFilterTintSelected = new LightingColorFilter(mHighlightColorSelected, mHighlightColorSelected);
    }
    if (paramAttributeSet != null) {}
    for (mBlendMode = PorterDuff.Mode.valueOf(paramAttributeSet);; mBlendMode = PorterDuff.Mode.MULTIPLY)
    {
      setChecked(bool, false);
      bool = paramContext.getBoolean(R.styleable.AdobeImageHighlightImageButton_android_focusable, true);
      paramContext.recycle();
      setFocusable(bool);
      if ((getDrawable() instanceof GlowBitmapDrawable)) {
        ((GlowBitmapDrawable)getDrawable()).updateConfig(mHighlightColorPressed, mHighlightColorChecked, mHighlightColorSelected, mGlowSize, mHighlightMode, mGlowStatus);
      }
      return;
    }
  }
  
  public boolean isChecked()
  {
    return mChecked;
  }
  
  @SuppressLint({"LongLogTag"})
  public int[] onCreateDrawableState(int paramInt)
  {
    Drawable localDrawable = getDrawable();
    int[] arrayOfInt = super.onCreateDrawableState(paramInt + 1);
    boolean bool1 = isChecked();
    boolean bool2 = isPressed();
    boolean bool3 = isSelected();
    if ((localDrawable != null) && (mBlendMode != null)) {
      updateDrawable(localDrawable, bool2, bool1, bool3);
    }
    if (bool1) {
      mergeDrawableStates(arrayOfInt, CHECKED_STATE_SET);
    }
    return arrayOfInt;
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(AdobeImageHighlightImageButton.class.getName());
    paramAccessibilityEvent.setChecked(mChecked);
  }
  
  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
    paramAccessibilityNodeInfo.setClassName(AdobeImageHighlightImageButton.class.getName());
    paramAccessibilityNodeInfo.setCheckable(mToggleEnabled);
    paramAccessibilityNodeInfo.setChecked(mChecked);
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    setChecked(checked, false);
    requestLayout();
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    checked = isChecked();
    return localSavedState;
  }
  
  protected boolean onSetAlpha(int paramInt)
  {
    return false;
  }
  
  public boolean performClick()
  {
    toggle();
    return super.performClick();
  }
  
  public void setChecked(boolean paramBoolean)
  {
    setChecked(paramBoolean, false);
  }
  
  protected void setChecked(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (!mToggleEnabled) {}
    do
    {
      do
      {
        return;
      } while (mChecked == paramBoolean1);
      mChecked = paramBoolean1;
      invalidate();
      refreshDrawableState();
    } while (mBroadcasting);
    mBroadcasting = true;
    if (mOnCheckedChangeListener != null) {
      mOnCheckedChangeListener.onCheckedChanged(this, mChecked, paramBoolean2);
    }
    mBroadcasting = false;
  }
  
  public void setImageBitmap(Bitmap paramBitmap)
  {
    Drawable localDrawable = getDrawable();
    if ((localDrawable instanceof GlowBitmapDrawable))
    {
      ((GlowBitmapDrawable)localDrawable).setBitmap(paramBitmap);
      setImageDrawable(localDrawable);
      return;
    }
    setImageDrawable(new GlowBitmapDrawable(paramBitmap, mHighlightColorPressed, mHighlightColorChecked, mHighlightColorSelected, mGlowSize, mHighlightMode, mGlowStatus));
  }
  
  public void setImageDrawable(Drawable paramDrawable)
  {
    Object localObject;
    if ((paramDrawable instanceof BitmapDrawable))
    {
      localObject = getDrawable();
      if ((localObject instanceof GlowBitmapDrawable)) {
        ((GlowBitmapDrawable)localObject).setBitmap(((BitmapDrawable)paramDrawable).getBitmap());
      }
    }
    for (;;)
    {
      super.setImageDrawable((Drawable)localObject);
      return;
      localObject = new GlowBitmapDrawable(((BitmapDrawable)paramDrawable).getBitmap(), mHighlightColorPressed, mHighlightColorChecked, mHighlightColorSelected, mGlowSize, mHighlightMode, mGlowStatus);
      continue;
      localObject = paramDrawable;
      if ((paramDrawable instanceof StateListDrawable)) {
        localObject = paramDrawable;
      }
    }
  }
  
  public void setImageResource(int paramInt)
  {
    Resources localResources = getResources();
    try
    {
      setImageDrawable(localResources.getDrawable(paramInt));
      invalidate();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      super.setImageResource(paramInt);
    }
  }
  
  public void setOnCheckedChangeListener(OnCheckedChangeListener paramOnCheckedChangeListener)
  {
    mOnCheckedChangeListener = paramOnCheckedChangeListener;
  }
  
  public void setPressed(boolean paramBoolean)
  {
    super.setPressed(paramBoolean);
    Drawable localDrawable = getDrawable();
    if ((localDrawable != null) && (mBlendMode != null)) {
      updateDrawable(localDrawable, paramBoolean, isChecked(), isSelected());
    }
  }
  
  public void setSelected(boolean paramBoolean)
  {
    super.setSelected(paramBoolean);
    Drawable localDrawable = getDrawable();
    if ((localDrawable != null) && (mBlendMode != null)) {
      updateDrawable(localDrawable, isPressed(), isChecked(), paramBoolean);
    }
  }
  
  public void toggle()
  {
    if ((mChecked) && (!mUnToggleUserEnabled)) {
      return;
    }
    if (!mChecked) {}
    for (boolean bool = true;; bool = false)
    {
      setChecked(bool, true);
      return;
    }
  }
  
  protected void updateDrawable(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (paramDrawable.isStateful()) {
      invalidate();
    }
    do
    {
      return;
      getBackground().jumpToCurrentState();
      if ((!paramBoolean1) && (!paramBoolean2) && (!paramBoolean3)) {
        break;
      }
      if ((paramBoolean1) && (UIUtils.checkBits(mHighlightMode, 2)))
      {
        if (mColorFilterTintPressed != null)
        {
          paramDrawable.setColorFilter(mColorFilterTintPressed);
          return;
        }
        paramDrawable.setColorFilter(mHighlightColorPressed, mBlendMode);
        return;
      }
      if ((paramBoolean2) && (UIUtils.checkBits(mHighlightMode, 4)))
      {
        if (mColorFilterTintChecked != null)
        {
          paramDrawable.setColorFilter(mColorFilterTintChecked);
          return;
        }
        paramDrawable.setColorFilter(mHighlightColorChecked, mBlendMode);
        return;
      }
    } while ((!paramBoolean3) || (!UIUtils.checkBits(mHighlightMode, 8)));
    if (mColorFilterTintSelected != null)
    {
      paramDrawable.setColorFilter(mColorFilterTintSelected);
      return;
    }
    paramDrawable.setColorFilter(mHighlightColorChecked, mBlendMode);
    return;
    paramDrawable.clearColorFilter();
  }
  
  public static abstract interface OnCheckedChangeListener
  {
    public abstract void onCheckedChanged(AdobeImageHighlightImageButton paramAdobeImageHighlightImageButton, boolean paramBoolean1, boolean paramBoolean2);
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public AdobeImageHighlightImageButton.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new AdobeImageHighlightImageButton.SavedState(paramAnonymousParcel, null);
      }
      
      public AdobeImageHighlightImageButton.SavedState[] newArray(int paramAnonymousInt)
      {
        return new AdobeImageHighlightImageButton.SavedState[paramAnonymousInt];
      }
    };
    boolean checked;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      checked = ((Boolean)paramParcel.readValue(null)).booleanValue();
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "CompoundButton.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " checked=" + checked + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeValue(Boolean.valueOf(checked));
    }
  }
}
