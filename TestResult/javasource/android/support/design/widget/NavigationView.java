package android.support.design.widget;

import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.design.internal.NavigationMenuPresenter;
import android.support.design.internal.ScrimInsetsFrameLayout;
import android.support.v4.content.ContextCompat;
import android.support.v7.internal.view.SupportMenuInflater;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;

public class NavigationView
  extends ScrimInsetsFrameLayout
{
  private static final int[] CHECKED_STATE_SET = { 16842912 };
  private static final int[] DISABLED_STATE_SET = { -16842910 };
  private OnNavigationItemSelectedListener mListener;
  private int mMaxWidth;
  private final MenuBuilder mMenu;
  private MenuInflater mMenuInflater;
  private final NavigationMenuPresenter mPresenter;
  
  private MenuInflater getMenuInflater()
  {
    if (mMenuInflater == null) {
      mMenuInflater = new SupportMenuInflater(getContext());
    }
    return mMenuInflater;
  }
  
  public Drawable getItemBackground()
  {
    return mPresenter.getItemBackground();
  }
  
  public ColorStateList getItemIconTintList()
  {
    return mPresenter.getItemTintList();
  }
  
  public ColorStateList getItemTextColor()
  {
    return mPresenter.getItemTextColor();
  }
  
  public Menu getMenu()
  {
    return mMenu;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    switch (View.MeasureSpec.getMode(paramInt1))
    {
    default: 
      i = paramInt1;
    }
    for (;;)
    {
      super.onMeasure(i, paramInt2);
      return;
      i = View.MeasureSpec.makeMeasureSpec(Math.min(View.MeasureSpec.getSize(paramInt1), mMaxWidth), 1073741824);
      continue;
      i = View.MeasureSpec.makeMeasureSpec(mMaxWidth, 1073741824);
    }
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    mMenu.restorePresenterStates(menuState);
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    menuState = new Bundle();
    mMenu.savePresenterStates(menuState);
    return localSavedState;
  }
  
  public void setItemBackground(Drawable paramDrawable)
  {
    mPresenter.setItemBackground(paramDrawable);
  }
  
  public void setItemBackgroundResource(int paramInt)
  {
    setItemBackground(ContextCompat.getDrawable(getContext(), paramInt));
  }
  
  public void setItemIconTintList(ColorStateList paramColorStateList)
  {
    mPresenter.setItemIconTintList(paramColorStateList);
  }
  
  public void setItemTextColor(ColorStateList paramColorStateList)
  {
    mPresenter.setItemTextColor(paramColorStateList);
  }
  
  public void setNavigationItemSelectedListener(OnNavigationItemSelectedListener paramOnNavigationItemSelectedListener)
  {
    mListener = paramOnNavigationItemSelectedListener;
  }
  
  public static abstract interface OnNavigationItemSelectedListener {}
  
  public static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public NavigationView.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new NavigationView.SavedState(paramAnonymousParcel);
      }
      
      public NavigationView.SavedState[] newArray(int paramAnonymousInt)
      {
        return new NavigationView.SavedState[paramAnonymousInt];
      }
    };
    public Bundle menuState;
    
    public SavedState(Parcel paramParcel)
    {
      super();
      menuState = paramParcel.readBundle();
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeBundle(menuState);
    }
  }
}
