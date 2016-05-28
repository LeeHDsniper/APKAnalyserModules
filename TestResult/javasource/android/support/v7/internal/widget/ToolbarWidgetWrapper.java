package android.support.v7.internal.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.drawable;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.string;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.view.menu.ActionMenuItem;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.widget.ActionMenuPresenter;
import android.support.v7.widget.Toolbar;
import android.support.v7.widget.Toolbar.LayoutParams;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window.Callback;

public class ToolbarWidgetWrapper
  implements DecorToolbar
{
  private ActionMenuPresenter mActionMenuPresenter;
  private View mCustomView;
  private int mDefaultNavigationContentDescription = 0;
  private Drawable mDefaultNavigationIcon;
  private int mDisplayOpts;
  private CharSequence mHomeDescription;
  private Drawable mIcon;
  private Drawable mLogo;
  private boolean mMenuPrepared;
  private Drawable mNavIcon;
  private int mNavigationMode = 0;
  private CharSequence mSubtitle;
  private View mTabView;
  private final TintManager mTintManager;
  private CharSequence mTitle;
  private boolean mTitleSet;
  private Toolbar mToolbar;
  private Window.Callback mWindowCallback;
  
  public ToolbarWidgetWrapper(Toolbar paramToolbar, boolean paramBoolean)
  {
    this(paramToolbar, paramBoolean, R.string.abc_action_bar_up_description, R.drawable.abc_ic_ab_back_mtrl_am_alpha);
  }
  
  public ToolbarWidgetWrapper(Toolbar paramToolbar, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    mToolbar = paramToolbar;
    mTitle = paramToolbar.getTitle();
    mSubtitle = paramToolbar.getSubtitle();
    boolean bool;
    if (mTitle != null)
    {
      bool = true;
      mTitleSet = bool;
      mNavIcon = paramToolbar.getNavigationIcon();
      if (!paramBoolean) {
        break label492;
      }
      paramToolbar = TintTypedArray.obtainStyledAttributes(paramToolbar.getContext(), null, R.styleable.ActionBar, R.attr.actionBarStyle, 0);
      Object localObject = paramToolbar.getText(R.styleable.ActionBar_title);
      if (!TextUtils.isEmpty((CharSequence)localObject)) {
        setTitle((CharSequence)localObject);
      }
      localObject = paramToolbar.getText(R.styleable.ActionBar_subtitle);
      if (!TextUtils.isEmpty((CharSequence)localObject)) {
        setSubtitle((CharSequence)localObject);
      }
      localObject = paramToolbar.getDrawable(R.styleable.ActionBar_logo);
      if (localObject != null) {
        setLogo((Drawable)localObject);
      }
      localObject = paramToolbar.getDrawable(R.styleable.ActionBar_icon);
      if ((mNavIcon == null) && (localObject != null)) {
        setIcon((Drawable)localObject);
      }
      localObject = paramToolbar.getDrawable(R.styleable.ActionBar_homeAsUpIndicator);
      if (localObject != null) {
        setNavigationIcon((Drawable)localObject);
      }
      setDisplayOptions(paramToolbar.getInt(R.styleable.ActionBar_displayOptions, 0));
      int i = paramToolbar.getResourceId(R.styleable.ActionBar_customNavigationLayout, 0);
      if (i != 0)
      {
        setCustomView(LayoutInflater.from(mToolbar.getContext()).inflate(i, mToolbar, false));
        setDisplayOptions(mDisplayOpts | 0x10);
      }
      i = paramToolbar.getLayoutDimension(R.styleable.ActionBar_height, 0);
      if (i > 0)
      {
        localObject = mToolbar.getLayoutParams();
        height = i;
        mToolbar.setLayoutParams((ViewGroup.LayoutParams)localObject);
      }
      i = paramToolbar.getDimensionPixelOffset(R.styleable.ActionBar_contentInsetStart, -1);
      int j = paramToolbar.getDimensionPixelOffset(R.styleable.ActionBar_contentInsetEnd, -1);
      if ((i >= 0) || (j >= 0)) {
        mToolbar.setContentInsetsRelative(Math.max(i, 0), Math.max(j, 0));
      }
      i = paramToolbar.getResourceId(R.styleable.ActionBar_titleTextStyle, 0);
      if (i != 0) {
        mToolbar.setTitleTextAppearance(mToolbar.getContext(), i);
      }
      i = paramToolbar.getResourceId(R.styleable.ActionBar_subtitleTextStyle, 0);
      if (i != 0) {
        mToolbar.setSubtitleTextAppearance(mToolbar.getContext(), i);
      }
      i = paramToolbar.getResourceId(R.styleable.ActionBar_popupTheme, 0);
      if (i != 0) {
        mToolbar.setPopupTheme(i);
      }
      paramToolbar.recycle();
    }
    for (mTintManager = paramToolbar.getTintManager();; mTintManager = TintManager.get(paramToolbar.getContext()))
    {
      setDefaultNavigationContentDescription(paramInt1);
      mHomeDescription = mToolbar.getNavigationContentDescription();
      setDefaultNavigationIcon(mTintManager.getDrawable(paramInt2));
      mToolbar.setNavigationOnClickListener(new View.OnClickListener()
      {
        final ActionMenuItem mNavItem = new ActionMenuItem(mToolbar.getContext(), 0, 16908332, 0, 0, mTitle);
        
        public void onClick(View paramAnonymousView)
        {
          if ((mWindowCallback != null) && (mMenuPrepared)) {
            mWindowCallback.onMenuItemSelected(0, mNavItem);
          }
        }
      });
      return;
      bool = false;
      break;
      label492:
      mDisplayOpts = detectDisplayOptions();
    }
  }
  
  private int detectDisplayOptions()
  {
    int i = 11;
    if (mToolbar.getNavigationIcon() != null) {
      i = 0xB | 0x4;
    }
    return i;
  }
  
  private void setTitleInt(CharSequence paramCharSequence)
  {
    mTitle = paramCharSequence;
    if ((mDisplayOpts & 0x8) != 0) {
      mToolbar.setTitle(paramCharSequence);
    }
  }
  
  private void updateHomeAccessibility()
  {
    if ((mDisplayOpts & 0x4) != 0)
    {
      if (TextUtils.isEmpty(mHomeDescription)) {
        mToolbar.setNavigationContentDescription(mDefaultNavigationContentDescription);
      }
    }
    else {
      return;
    }
    mToolbar.setNavigationContentDescription(mHomeDescription);
  }
  
  private void updateNavigationIcon()
  {
    Toolbar localToolbar;
    if ((mDisplayOpts & 0x4) != 0)
    {
      localToolbar = mToolbar;
      if (mNavIcon == null) {
        break label32;
      }
    }
    label32:
    for (Drawable localDrawable = mNavIcon;; localDrawable = mDefaultNavigationIcon)
    {
      localToolbar.setNavigationIcon(localDrawable);
      return;
    }
  }
  
  private void updateToolbarLogo()
  {
    Drawable localDrawable = null;
    if ((mDisplayOpts & 0x2) != 0)
    {
      if ((mDisplayOpts & 0x1) == 0) {
        break label49;
      }
      if (mLogo == null) {
        break label41;
      }
      localDrawable = mLogo;
    }
    for (;;)
    {
      mToolbar.setLogo(localDrawable);
      return;
      label41:
      localDrawable = mIcon;
      continue;
      label49:
      localDrawable = mIcon;
    }
  }
  
  public void animateToVisibility(int paramInt)
  {
    if (paramInt == 8) {
      ViewCompat.animate(mToolbar).alpha(0.0F).setListener(new ViewPropertyAnimatorListenerAdapter()
      {
        private boolean mCanceled = false;
        
        public void onAnimationCancel(View paramAnonymousView)
        {
          mCanceled = true;
        }
        
        public void onAnimationEnd(View paramAnonymousView)
        {
          if (!mCanceled) {
            mToolbar.setVisibility(8);
          }
        }
      });
    }
    while (paramInt != 0) {
      return;
    }
    ViewCompat.animate(mToolbar).alpha(1.0F).setListener(new ViewPropertyAnimatorListenerAdapter()
    {
      public void onAnimationStart(View paramAnonymousView)
      {
        mToolbar.setVisibility(0);
      }
    });
  }
  
  public boolean canShowOverflowMenu()
  {
    return mToolbar.canShowOverflowMenu();
  }
  
  public void collapseActionView()
  {
    mToolbar.collapseActionView();
  }
  
  public void dismissPopupMenus()
  {
    mToolbar.dismissPopupMenus();
  }
  
  public Context getContext()
  {
    return mToolbar.getContext();
  }
  
  public int getDisplayOptions()
  {
    return mDisplayOpts;
  }
  
  public int getHeight()
  {
    return mToolbar.getHeight();
  }
  
  public Menu getMenu()
  {
    return mToolbar.getMenu();
  }
  
  public int getNavigationMode()
  {
    return mNavigationMode;
  }
  
  public CharSequence getTitle()
  {
    return mToolbar.getTitle();
  }
  
  public ViewGroup getViewGroup()
  {
    return mToolbar;
  }
  
  public int getVisibility()
  {
    return mToolbar.getVisibility();
  }
  
  public boolean hasExpandedActionView()
  {
    return mToolbar.hasExpandedActionView();
  }
  
  public boolean hideOverflowMenu()
  {
    return mToolbar.hideOverflowMenu();
  }
  
  public void initIndeterminateProgress()
  {
    Log.i("ToolbarWidgetWrapper", "Progress display unsupported");
  }
  
  public void initProgress()
  {
    Log.i("ToolbarWidgetWrapper", "Progress display unsupported");
  }
  
  public boolean isOverflowMenuShowPending()
  {
    return mToolbar.isOverflowMenuShowPending();
  }
  
  public boolean isOverflowMenuShowing()
  {
    return mToolbar.isOverflowMenuShowing();
  }
  
  public boolean isSplit()
  {
    return false;
  }
  
  public void setCollapsible(boolean paramBoolean)
  {
    mToolbar.setCollapsible(paramBoolean);
  }
  
  public void setCustomView(View paramView)
  {
    if ((mCustomView != null) && ((mDisplayOpts & 0x10) != 0)) {
      mToolbar.removeView(mCustomView);
    }
    mCustomView = paramView;
    if ((paramView != null) && ((mDisplayOpts & 0x10) != 0)) {
      mToolbar.addView(mCustomView);
    }
  }
  
  public void setDefaultNavigationContentDescription(int paramInt)
  {
    if (paramInt == mDefaultNavigationContentDescription) {}
    do
    {
      return;
      mDefaultNavigationContentDescription = paramInt;
    } while (!TextUtils.isEmpty(mToolbar.getNavigationContentDescription()));
    setNavigationContentDescription(mDefaultNavigationContentDescription);
  }
  
  public void setDefaultNavigationIcon(Drawable paramDrawable)
  {
    if (mDefaultNavigationIcon != paramDrawable)
    {
      mDefaultNavigationIcon = paramDrawable;
      updateNavigationIcon();
    }
  }
  
  public void setDisplayOptions(int paramInt)
  {
    int i = mDisplayOpts ^ paramInt;
    mDisplayOpts = paramInt;
    if (i != 0)
    {
      if ((i & 0x4) != 0)
      {
        if ((paramInt & 0x4) == 0) {
          break label115;
        }
        updateNavigationIcon();
        updateHomeAccessibility();
      }
      if ((i & 0x3) != 0) {
        updateToolbarLogo();
      }
      if ((i & 0x8) != 0)
      {
        if ((paramInt & 0x8) == 0) {
          break label126;
        }
        mToolbar.setTitle(mTitle);
        mToolbar.setSubtitle(mSubtitle);
      }
    }
    for (;;)
    {
      if (((i & 0x10) != 0) && (mCustomView != null))
      {
        if ((paramInt & 0x10) == 0) {
          break label145;
        }
        mToolbar.addView(mCustomView);
      }
      return;
      label115:
      mToolbar.setNavigationIcon(null);
      break;
      label126:
      mToolbar.setTitle(null);
      mToolbar.setSubtitle(null);
    }
    label145:
    mToolbar.removeView(mCustomView);
  }
  
  public void setEmbeddedTabView(ScrollingTabContainerView paramScrollingTabContainerView)
  {
    if ((mTabView != null) && (mTabView.getParent() == mToolbar)) {
      mToolbar.removeView(mTabView);
    }
    mTabView = paramScrollingTabContainerView;
    if ((paramScrollingTabContainerView != null) && (mNavigationMode == 2))
    {
      mToolbar.addView(mTabView, 0);
      Toolbar.LayoutParams localLayoutParams = (Toolbar.LayoutParams)mTabView.getLayoutParams();
      width = -2;
      height = -2;
      gravity = 8388691;
      paramScrollingTabContainerView.setAllowCollapse(true);
    }
  }
  
  public void setHomeButtonEnabled(boolean paramBoolean) {}
  
  public void setIcon(int paramInt)
  {
    if (paramInt != 0) {}
    for (Drawable localDrawable = mTintManager.getDrawable(paramInt);; localDrawable = null)
    {
      setIcon(localDrawable);
      return;
    }
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    mIcon = paramDrawable;
    updateToolbarLogo();
  }
  
  public void setLogo(int paramInt)
  {
    if (paramInt != 0) {}
    for (Drawable localDrawable = mTintManager.getDrawable(paramInt);; localDrawable = null)
    {
      setLogo(localDrawable);
      return;
    }
  }
  
  public void setLogo(Drawable paramDrawable)
  {
    mLogo = paramDrawable;
    updateToolbarLogo();
  }
  
  public void setMenu(Menu paramMenu, MenuPresenter.Callback paramCallback)
  {
    if (mActionMenuPresenter == null)
    {
      mActionMenuPresenter = new ActionMenuPresenter(mToolbar.getContext());
      mActionMenuPresenter.setId(R.id.action_menu_presenter);
    }
    mActionMenuPresenter.setCallback(paramCallback);
    mToolbar.setMenu((MenuBuilder)paramMenu, mActionMenuPresenter);
  }
  
  public void setMenuCallbacks(MenuPresenter.Callback paramCallback, MenuBuilder.Callback paramCallback1)
  {
    mToolbar.setMenuCallbacks(paramCallback, paramCallback1);
  }
  
  public void setMenuPrepared()
  {
    mMenuPrepared = true;
  }
  
  public void setNavigationContentDescription(int paramInt)
  {
    if (paramInt == 0) {}
    for (Object localObject = null;; localObject = getContext().getString(paramInt))
    {
      setNavigationContentDescription((CharSequence)localObject);
      return;
    }
  }
  
  public void setNavigationContentDescription(CharSequence paramCharSequence)
  {
    mHomeDescription = paramCharSequence;
    updateHomeAccessibility();
  }
  
  public void setNavigationIcon(Drawable paramDrawable)
  {
    mNavIcon = paramDrawable;
    updateNavigationIcon();
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    mSubtitle = paramCharSequence;
    if ((mDisplayOpts & 0x8) != 0) {
      mToolbar.setSubtitle(paramCharSequence);
    }
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mTitleSet = true;
    setTitleInt(paramCharSequence);
  }
  
  public void setVisibility(int paramInt)
  {
    mToolbar.setVisibility(paramInt);
  }
  
  public void setWindowCallback(Window.Callback paramCallback)
  {
    mWindowCallback = paramCallback;
  }
  
  public void setWindowTitle(CharSequence paramCharSequence)
  {
    if (!mTitleSet) {
      setTitleInt(paramCharSequence);
    }
  }
  
  public boolean showOverflowMenu()
  {
    return mToolbar.showOverflowMenu();
  }
}
