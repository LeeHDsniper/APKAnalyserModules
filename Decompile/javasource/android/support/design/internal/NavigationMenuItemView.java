package android.support.design.internal;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.graphics.drawable.StateListDrawable;
import android.support.design.R.attr;
import android.support.design.R.dimen;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v4.widget.TextViewCompat;
import android.support.v7.internal.view.menu.MenuItemImpl;
import android.support.v7.internal.view.menu.MenuView.ItemView;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.widget.TextView;

public class NavigationMenuItemView
  extends TextView
  implements MenuView.ItemView
{
  private static final int[] CHECKED_STATE_SET = { 16842912 };
  private int mIconSize;
  private ColorStateList mIconTintList;
  private MenuItemImpl mItemData;
  
  public NavigationMenuItemView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public NavigationMenuItemView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public NavigationMenuItemView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    mIconSize = paramContext.getResources().getDimensionPixelSize(R.dimen.navigation_icon_size);
  }
  
  private StateListDrawable createDefaultBackground()
  {
    TypedValue localTypedValue = new TypedValue();
    if (getContext().getTheme().resolveAttribute(R.attr.colorControlHighlight, localTypedValue, true))
    {
      StateListDrawable localStateListDrawable = new StateListDrawable();
      localStateListDrawable.addState(CHECKED_STATE_SET, new ColorDrawable(data));
      localStateListDrawable.addState(EMPTY_STATE_SET, new ColorDrawable(0));
      return localStateListDrawable;
    }
    return null;
  }
  
  public MenuItemImpl getItemData()
  {
    return mItemData;
  }
  
  public void initialize(MenuItemImpl paramMenuItemImpl, int paramInt)
  {
    mItemData = paramMenuItemImpl;
    if (paramMenuItemImpl.isVisible()) {}
    for (paramInt = 0;; paramInt = 8)
    {
      setVisibility(paramInt);
      if (getBackground() == null) {
        setBackgroundDrawable(createDefaultBackground());
      }
      setCheckable(paramMenuItemImpl.isCheckable());
      setChecked(paramMenuItemImpl.isChecked());
      setEnabled(paramMenuItemImpl.isEnabled());
      setTitle(paramMenuItemImpl.getTitle());
      setIcon(paramMenuItemImpl.getIcon());
      return;
    }
  }
  
  protected int[] onCreateDrawableState(int paramInt)
  {
    int[] arrayOfInt = super.onCreateDrawableState(paramInt + 1);
    if ((mItemData != null) && (mItemData.isCheckable()) && (mItemData.isChecked())) {
      mergeDrawableStates(arrayOfInt, CHECKED_STATE_SET);
    }
    return arrayOfInt;
  }
  
  public boolean prefersCondensedTitle()
  {
    return false;
  }
  
  public void setCheckable(boolean paramBoolean)
  {
    refreshDrawableState();
  }
  
  public void setChecked(boolean paramBoolean)
  {
    refreshDrawableState();
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    Drawable localDrawable = paramDrawable;
    if (paramDrawable != null)
    {
      localDrawable = DrawableCompat.wrap(paramDrawable.getConstantState().newDrawable()).mutate();
      localDrawable.setBounds(0, 0, mIconSize, mIconSize);
      DrawableCompat.setTintList(localDrawable, mIconTintList);
    }
    TextViewCompat.setCompoundDrawablesRelative(this, localDrawable, null, null, null);
  }
  
  void setIconTintList(ColorStateList paramColorStateList)
  {
    mIconTintList = paramColorStateList;
    if (mItemData != null) {
      setIcon(mItemData.getIcon());
    }
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    setText(paramCharSequence);
  }
}
