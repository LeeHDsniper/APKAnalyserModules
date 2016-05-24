package android.support.v7.internal.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R.bool;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.widget.ActionMenuView.ActionMenuChildView;
import android.support.v7.widget.AppCompatTextView;
import android.support.v7.widget.ListPopupWindow;
import android.support.v7.widget.ListPopupWindow.ForwardingListener;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.widget.Toast;

public class ActionMenuItemView
  extends AppCompatTextView
  implements MenuView.ItemView, ActionMenuView.ActionMenuChildView, View.OnClickListener, View.OnLongClickListener
{
  private boolean mAllowTextWithIcon;
  private boolean mExpandedFormat;
  private ListPopupWindow.ForwardingListener mForwardingListener;
  private Drawable mIcon;
  private MenuItemImpl mItemData;
  private MenuBuilder.ItemInvoker mItemInvoker;
  private int mMaxIconSize;
  private int mMinWidth;
  private PopupCallback mPopupCallback;
  private int mSavedPaddingLeft;
  private CharSequence mTitle;
  
  public ActionMenuItemView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionMenuItemView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ActionMenuItemView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    Resources localResources = paramContext.getResources();
    mAllowTextWithIcon = localResources.getBoolean(R.bool.abc_config_allowActionMenuItemTextWithIcon);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ActionMenuItemView, paramInt, 0);
    mMinWidth = paramContext.getDimensionPixelSize(R.styleable.ActionMenuItemView_android_minWidth, 0);
    paramContext.recycle();
    mMaxIconSize = ((int)(32.0F * getDisplayMetricsdensity + 0.5F));
    setOnClickListener(this);
    setOnLongClickListener(this);
    mSavedPaddingLeft = -1;
  }
  
  private void updateTextButtonVisibility()
  {
    int k = 0;
    int i;
    if (!TextUtils.isEmpty(mTitle))
    {
      i = 1;
      if (mIcon != null)
      {
        j = k;
        if (!mItemData.showsTextAsAction()) {
          break label51;
        }
        if (!mAllowTextWithIcon)
        {
          j = k;
          if (!mExpandedFormat) {
            break label51;
          }
        }
      }
      int j = 1;
      label51:
      if ((i & j) == 0) {
        break label75;
      }
    }
    label75:
    for (CharSequence localCharSequence = mTitle;; localCharSequence = null)
    {
      setText(localCharSequence);
      return;
      i = 0;
      break;
    }
  }
  
  public MenuItemImpl getItemData()
  {
    return mItemData;
  }
  
  public boolean hasText()
  {
    return !TextUtils.isEmpty(getText());
  }
  
  public void initialize(MenuItemImpl paramMenuItemImpl, int paramInt)
  {
    mItemData = paramMenuItemImpl;
    setIcon(paramMenuItemImpl.getIcon());
    setTitle(paramMenuItemImpl.getTitleForItemView(this));
    setId(paramMenuItemImpl.getItemId());
    if (paramMenuItemImpl.isVisible()) {}
    for (paramInt = 0;; paramInt = 8)
    {
      setVisibility(paramInt);
      setEnabled(paramMenuItemImpl.isEnabled());
      if ((paramMenuItemImpl.hasSubMenu()) && (mForwardingListener == null)) {
        mForwardingListener = new ActionMenuItemForwardingListener();
      }
      return;
    }
  }
  
  public boolean needsDividerAfter()
  {
    return hasText();
  }
  
  public boolean needsDividerBefore()
  {
    return (hasText()) && (mItemData.getIcon() == null);
  }
  
  public void onClick(View paramView)
  {
    if (mItemInvoker != null) {
      mItemInvoker.invokeItem(mItemData);
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (Build.VERSION.SDK_INT >= 8) {
      super.onConfigurationChanged(paramConfiguration);
    }
    mAllowTextWithIcon = getContext().getResources().getBoolean(R.bool.abc_config_allowActionMenuItemTextWithIcon);
    updateTextButtonVisibility();
  }
  
  public boolean onLongClick(View paramView)
  {
    if (hasText()) {
      return false;
    }
    int[] arrayOfInt = new int[2];
    Rect localRect = new Rect();
    getLocationOnScreen(arrayOfInt);
    getWindowVisibleDisplayFrame(localRect);
    Context localContext = getContext();
    int i = getWidth();
    int k = getHeight();
    int m = arrayOfInt[1];
    int n = k / 2;
    int j = arrayOfInt[0] + i / 2;
    i = j;
    if (ViewCompat.getLayoutDirection(paramView) == 0) {
      i = getResourcesgetDisplayMetricswidthPixels - j;
    }
    paramView = Toast.makeText(localContext, mItemData.getTitle(), 0);
    if (m + n < localRect.height()) {
      paramView.setGravity(8388661, i, k);
    }
    for (;;)
    {
      paramView.show();
      return true;
      paramView.setGravity(81, 0, k);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    boolean bool = hasText();
    if ((bool) && (mSavedPaddingLeft >= 0)) {
      super.setPadding(mSavedPaddingLeft, getPaddingTop(), getPaddingRight(), getPaddingBottom());
    }
    super.onMeasure(paramInt1, paramInt2);
    int i = View.MeasureSpec.getMode(paramInt1);
    paramInt1 = View.MeasureSpec.getSize(paramInt1);
    int j = getMeasuredWidth();
    if (i == Integer.MIN_VALUE) {}
    for (paramInt1 = Math.min(paramInt1, mMinWidth);; paramInt1 = mMinWidth)
    {
      if ((i != 1073741824) && (mMinWidth > 0) && (j < paramInt1)) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(paramInt1, 1073741824), paramInt2);
      }
      if ((!bool) && (mIcon != null)) {
        super.setPadding((getMeasuredWidth() - mIcon.getBounds().width()) / 2, getPaddingTop(), getPaddingRight(), getPaddingBottom());
      }
      return;
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((mItemData.hasSubMenu()) && (mForwardingListener != null) && (mForwardingListener.onTouch(this, paramMotionEvent))) {
      return true;
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public boolean prefersCondensedTitle()
  {
    return true;
  }
  
  public void setCheckable(boolean paramBoolean) {}
  
  public void setChecked(boolean paramBoolean) {}
  
  public void setExpandedFormat(boolean paramBoolean)
  {
    if (mExpandedFormat != paramBoolean)
    {
      mExpandedFormat = paramBoolean;
      if (mItemData != null) {
        mItemData.actionFormatChanged();
      }
    }
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    mIcon = paramDrawable;
    if (paramDrawable != null)
    {
      int m = paramDrawable.getIntrinsicWidth();
      int k = paramDrawable.getIntrinsicHeight();
      int j = k;
      int i = m;
      float f;
      if (m > mMaxIconSize)
      {
        f = mMaxIconSize / m;
        i = mMaxIconSize;
        j = (int)(k * f);
      }
      m = j;
      k = i;
      if (j > mMaxIconSize)
      {
        f = mMaxIconSize / j;
        m = mMaxIconSize;
        k = (int)(i * f);
      }
      paramDrawable.setBounds(0, 0, k, m);
    }
    setCompoundDrawables(paramDrawable, null, null, null);
    updateTextButtonVisibility();
  }
  
  public void setItemInvoker(MenuBuilder.ItemInvoker paramItemInvoker)
  {
    mItemInvoker = paramItemInvoker;
  }
  
  public void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mSavedPaddingLeft = paramInt1;
    super.setPadding(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void setPopupCallback(PopupCallback paramPopupCallback)
  {
    mPopupCallback = paramPopupCallback;
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mTitle = paramCharSequence;
    setContentDescription(mTitle);
    updateTextButtonVisibility();
  }
  
  private class ActionMenuItemForwardingListener
    extends ListPopupWindow.ForwardingListener
  {
    public ActionMenuItemForwardingListener()
    {
      super();
    }
    
    public ListPopupWindow getPopup()
    {
      if (mPopupCallback != null) {
        return mPopupCallback.getPopup();
      }
      return null;
    }
    
    protected boolean onForwardingStarted()
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if (mItemInvoker != null)
      {
        bool1 = bool2;
        if (mItemInvoker.invokeItem(mItemData))
        {
          ListPopupWindow localListPopupWindow = getPopup();
          bool1 = bool2;
          if (localListPopupWindow != null)
          {
            bool1 = bool2;
            if (localListPopupWindow.isShowing()) {
              bool1 = true;
            }
          }
        }
      }
      return bool1;
    }
  }
  
  public static abstract class PopupCallback
  {
    public PopupCallback() {}
    
    public abstract ListPopupWindow getPopup();
  }
}
