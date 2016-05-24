package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.media.AudioManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.app.NavUtils;
import android.support.v4.view.LayoutInflaterCompat;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v4.view.OnApplyWindowInsetsListener;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewConfigurationCompat;
import android.support.v4.view.WindowInsetsCompat;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.color;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.layout;
import android.support.v7.appcompat.R.style;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.app.AppCompatViewInflater;
import android.support.v7.internal.app.ToolbarActionBar;
import android.support.v7.internal.app.WindowDecorActionBar;
import android.support.v7.internal.view.ContextThemeWrapper;
import android.support.v7.internal.view.StandaloneActionMode;
import android.support.v7.internal.view.menu.ListMenuPresenter;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.internal.view.menu.MenuView;
import android.support.v7.internal.widget.ActionBarContextView;
import android.support.v7.internal.widget.ContentFrameLayout;
import android.support.v7.internal.widget.DecorContentParent;
import android.support.v7.internal.widget.FitWindowsViewGroup;
import android.support.v7.internal.widget.FitWindowsViewGroup.OnFitSystemWindowsListener;
import android.support.v7.internal.widget.TintManager;
import android.support.v7.internal.widget.ViewStubCompat;
import android.support.v7.internal.widget.ViewUtils;
import android.support.v7.view.ActionMode;
import android.support.v7.view.ActionMode.Callback;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.util.AndroidRuntimeException;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.LayoutInflater.Factory;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window;
import android.view.Window.Callback;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import android.widget.TextView;

class AppCompatDelegateImplV7
  extends AppCompatDelegateImplBase
  implements LayoutInflaterFactory, MenuBuilder.Callback
{
  private ActionMenuPresenterCallback mActionMenuPresenterCallback;
  ActionMode mActionMode;
  PopupWindow mActionModePopup;
  ActionBarContextView mActionModeView;
  private AppCompatViewInflater mAppCompatViewInflater;
  private boolean mClosingActionMenu;
  private DecorContentParent mDecorContentParent;
  private boolean mEnableDefaultActionBarUp;
  private boolean mFeatureIndeterminateProgress;
  private boolean mFeatureProgress;
  private int mInvalidatePanelMenuFeatures;
  private boolean mInvalidatePanelMenuPosted;
  private final Runnable mInvalidatePanelMenuRunnable = new Runnable()
  {
    public void run()
    {
      if ((mInvalidatePanelMenuFeatures & 0x1) != 0) {
        AppCompatDelegateImplV7.this.doInvalidatePanelMenu(0);
      }
      if ((mInvalidatePanelMenuFeatures & 0x100) != 0) {
        AppCompatDelegateImplV7.this.doInvalidatePanelMenu(8);
      }
      AppCompatDelegateImplV7.access$202(AppCompatDelegateImplV7.this, false);
      AppCompatDelegateImplV7.access$002(AppCompatDelegateImplV7.this, 0);
    }
  };
  private PanelMenuPresenterCallback mPanelMenuPresenterCallback;
  private PanelFeatureState[] mPanels;
  private PanelFeatureState mPreparedPanel;
  Runnable mShowActionModePopup;
  private View mStatusGuard;
  private ViewGroup mSubDecor;
  private boolean mSubDecorInstalled;
  private Rect mTempRect1;
  private Rect mTempRect2;
  private TextView mTitleView;
  private ViewGroup mWindowDecor;
  
  AppCompatDelegateImplV7(Context paramContext, Window paramWindow, AppCompatCallback paramAppCompatCallback)
  {
    super(paramContext, paramWindow, paramAppCompatCallback);
  }
  
  private void applyFixedSizeWindow(ContentFrameLayout paramContentFrameLayout)
  {
    paramContentFrameLayout.setDecorPadding(mWindowDecor.getPaddingLeft(), mWindowDecor.getPaddingTop(), mWindowDecor.getPaddingRight(), mWindowDecor.getPaddingBottom());
    TypedArray localTypedArray = mContext.obtainStyledAttributes(R.styleable.Theme);
    localTypedArray.getValue(R.styleable.Theme_windowMinWidthMajor, paramContentFrameLayout.getMinWidthMajor());
    localTypedArray.getValue(R.styleable.Theme_windowMinWidthMinor, paramContentFrameLayout.getMinWidthMinor());
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedWidthMajor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedWidthMajor, paramContentFrameLayout.getFixedWidthMajor());
    }
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedWidthMinor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedWidthMinor, paramContentFrameLayout.getFixedWidthMinor());
    }
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedHeightMajor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedHeightMajor, paramContentFrameLayout.getFixedHeightMajor());
    }
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedHeightMinor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedHeightMinor, paramContentFrameLayout.getFixedHeightMinor());
    }
    localTypedArray.recycle();
    paramContentFrameLayout.requestLayout();
  }
  
  private void callOnPanelClosed(int paramInt, PanelFeatureState paramPanelFeatureState, Menu paramMenu)
  {
    Object localObject2 = paramPanelFeatureState;
    Object localObject1 = paramMenu;
    if (paramMenu == null)
    {
      PanelFeatureState localPanelFeatureState = paramPanelFeatureState;
      if (paramPanelFeatureState == null)
      {
        localPanelFeatureState = paramPanelFeatureState;
        if (paramInt >= 0)
        {
          localPanelFeatureState = paramPanelFeatureState;
          if (paramInt < mPanels.length) {
            localPanelFeatureState = mPanels[paramInt];
          }
        }
      }
      localObject2 = localPanelFeatureState;
      localObject1 = paramMenu;
      if (localPanelFeatureState != null)
      {
        localObject1 = menu;
        localObject2 = localPanelFeatureState;
      }
    }
    if ((localObject2 != null) && (!isOpen)) {}
    do
    {
      return;
      paramPanelFeatureState = getWindowCallback();
    } while (paramPanelFeatureState == null);
    paramPanelFeatureState.onPanelClosed(paramInt, (Menu)localObject1);
  }
  
  private void checkCloseActionMenu(MenuBuilder paramMenuBuilder)
  {
    if (mClosingActionMenu) {
      return;
    }
    mClosingActionMenu = true;
    mDecorContentParent.dismissPopups();
    Window.Callback localCallback = getWindowCallback();
    if ((localCallback != null) && (!isDestroyed())) {
      localCallback.onPanelClosed(8, paramMenuBuilder);
    }
    mClosingActionMenu = false;
  }
  
  private void closePanel(int paramInt)
  {
    closePanel(getPanelState(paramInt, true), true);
  }
  
  private void closePanel(PanelFeatureState paramPanelFeatureState, boolean paramBoolean)
  {
    if ((paramBoolean) && (featureId == 0) && (mDecorContentParent != null) && (mDecorContentParent.isOverflowMenuShowing())) {
      checkCloseActionMenu(menu);
    }
    do
    {
      return;
      boolean bool = isOpen;
      WindowManager localWindowManager = (WindowManager)mContext.getSystemService("window");
      if ((localWindowManager != null) && (bool) && (decorView != null)) {
        localWindowManager.removeView(decorView);
      }
      isPrepared = false;
      isHandled = false;
      isOpen = false;
      if ((bool) && (paramBoolean)) {
        callOnPanelClosed(featureId, paramPanelFeatureState, null);
      }
      shownPanelView = null;
      refreshDecorView = true;
    } while (mPreparedPanel != paramPanelFeatureState);
    mPreparedPanel = null;
  }
  
  private void doInvalidatePanelMenu(int paramInt)
  {
    PanelFeatureState localPanelFeatureState = getPanelState(paramInt, true);
    if (menu != null)
    {
      Bundle localBundle = new Bundle();
      menu.saveActionViewStates(localBundle);
      if (localBundle.size() > 0) {
        frozenActionViewState = localBundle;
      }
      menu.stopDispatchingItemsChanged();
      menu.clear();
    }
    refreshMenuContent = true;
    refreshDecorView = true;
    if (((paramInt == 8) || (paramInt == 0)) && (mDecorContentParent != null))
    {
      localPanelFeatureState = getPanelState(0, false);
      if (localPanelFeatureState != null)
      {
        isPrepared = false;
        preparePanel(localPanelFeatureState, null);
      }
    }
  }
  
  private void ensureSubDecor()
  {
    if (!mSubDecorInstalled)
    {
      Object localObject1 = LayoutInflater.from(mContext);
      if (!mWindowNoTitle) {
        if (mIsFloating)
        {
          mSubDecor = ((ViewGroup)((LayoutInflater)localObject1).inflate(R.layout.abc_dialog_title_material, null));
          mOverlayActionBar = false;
          mHasActionBar = false;
        }
      }
      while (mSubDecor == null)
      {
        throw new IllegalArgumentException("AppCompat does not support the current theme features");
        if (mHasActionBar)
        {
          localObject1 = new TypedValue();
          mContext.getTheme().resolveAttribute(R.attr.actionBarTheme, (TypedValue)localObject1, true);
          if (resourceId != 0) {}
          for (localObject1 = new ContextThemeWrapper(mContext, resourceId);; localObject1 = mContext)
          {
            mSubDecor = ((ViewGroup)LayoutInflater.from((Context)localObject1).inflate(R.layout.abc_screen_toolbar, null));
            mDecorContentParent = ((DecorContentParent)mSubDecor.findViewById(R.id.decor_content_parent));
            mDecorContentParent.setWindowCallback(getWindowCallback());
            if (mOverlayActionBar) {
              mDecorContentParent.initFeature(9);
            }
            if (mFeatureProgress) {
              mDecorContentParent.initFeature(2);
            }
            if (!mFeatureIndeterminateProgress) {
              break;
            }
            mDecorContentParent.initFeature(5);
            break;
          }
          if (mOverlayActionMode) {}
          for (mSubDecor = ((ViewGroup)((LayoutInflater)localObject1).inflate(R.layout.abc_screen_simple_overlay_action_mode, null));; mSubDecor = ((ViewGroup)((LayoutInflater)localObject1).inflate(R.layout.abc_screen_simple, null)))
          {
            if (Build.VERSION.SDK_INT < 21) {
              break label303;
            }
            ViewCompat.setOnApplyWindowInsetsListener(mSubDecor, new OnApplyWindowInsetsListener()
            {
              public WindowInsetsCompat onApplyWindowInsets(View paramAnonymousView, WindowInsetsCompat paramAnonymousWindowInsetsCompat)
              {
                int i = paramAnonymousWindowInsetsCompat.getSystemWindowInsetTop();
                int j = AppCompatDelegateImplV7.this.updateStatusGuard(i);
                WindowInsetsCompat localWindowInsetsCompat = paramAnonymousWindowInsetsCompat;
                if (i != j) {
                  localWindowInsetsCompat = paramAnonymousWindowInsetsCompat.replaceSystemWindowInsets(paramAnonymousWindowInsetsCompat.getSystemWindowInsetLeft(), j, paramAnonymousWindowInsetsCompat.getSystemWindowInsetRight(), paramAnonymousWindowInsetsCompat.getSystemWindowInsetBottom());
                }
                return ViewCompat.onApplyWindowInsets(paramAnonymousView, localWindowInsetsCompat);
              }
            });
            break;
          }
          label303:
          ((FitWindowsViewGroup)mSubDecor).setOnFitSystemWindowsListener(new FitWindowsViewGroup.OnFitSystemWindowsListener()
          {
            public void onFitSystemWindows(Rect paramAnonymousRect)
            {
              top = AppCompatDelegateImplV7.this.updateStatusGuard(top);
            }
          });
        }
      }
      if (mDecorContentParent == null) {
        mTitleView = ((TextView)mSubDecor.findViewById(R.id.title));
      }
      ViewUtils.makeOptionalFitsSystemWindows(mSubDecor);
      Object localObject2 = (ViewGroup)mWindow.findViewById(16908290);
      localObject1 = (ContentFrameLayout)mSubDecor.findViewById(R.id.action_bar_activity_content);
      while (((ViewGroup)localObject2).getChildCount() > 0)
      {
        View localView = ((ViewGroup)localObject2).getChildAt(0);
        ((ViewGroup)localObject2).removeViewAt(0);
        ((ContentFrameLayout)localObject1).addView(localView);
      }
      mWindow.setContentView(mSubDecor);
      ((ViewGroup)localObject2).setId(-1);
      ((ContentFrameLayout)localObject1).setId(16908290);
      if ((localObject2 instanceof FrameLayout)) {
        ((FrameLayout)localObject2).setForeground(null);
      }
      localObject2 = getTitle();
      if (!TextUtils.isEmpty((CharSequence)localObject2)) {
        onTitleChanged((CharSequence)localObject2);
      }
      applyFixedSizeWindow((ContentFrameLayout)localObject1);
      onSubDecorInstalled(mSubDecor);
      mSubDecorInstalled = true;
      localObject1 = getPanelState(0, false);
      if ((!isDestroyed()) && ((localObject1 == null) || (menu == null))) {
        invalidatePanelMenu(8);
      }
    }
  }
  
  private PanelFeatureState findMenuPanel(Menu paramMenu)
  {
    PanelFeatureState[] arrayOfPanelFeatureState = mPanels;
    int i;
    int j;
    if (arrayOfPanelFeatureState != null)
    {
      i = arrayOfPanelFeatureState.length;
      j = 0;
    }
    for (;;)
    {
      if (j >= i) {
        break label57;
      }
      PanelFeatureState localPanelFeatureState = arrayOfPanelFeatureState[j];
      if ((localPanelFeatureState != null) && (menu == paramMenu))
      {
        return localPanelFeatureState;
        i = 0;
        break;
      }
      j += 1;
    }
    label57:
    return null;
  }
  
  private PanelFeatureState getPanelState(int paramInt, boolean paramBoolean)
  {
    Object localObject2 = mPanels;
    Object localObject1;
    if (localObject2 != null)
    {
      localObject1 = localObject2;
      if (localObject2.length > paramInt) {}
    }
    else
    {
      arrayOfPanelFeatureState = new PanelFeatureState[paramInt + 1];
      if (localObject2 != null) {
        System.arraycopy(localObject2, 0, arrayOfPanelFeatureState, 0, localObject2.length);
      }
      localObject1 = arrayOfPanelFeatureState;
      mPanels = arrayOfPanelFeatureState;
    }
    PanelFeatureState[] arrayOfPanelFeatureState = localObject1[paramInt];
    localObject2 = arrayOfPanelFeatureState;
    if (arrayOfPanelFeatureState == null)
    {
      localObject2 = new PanelFeatureState(paramInt);
      localObject1[paramInt] = localObject2;
    }
    return localObject2;
  }
  
  private boolean initializePanelContent(PanelFeatureState paramPanelFeatureState)
  {
    if (createdPanelView != null) {
      shownPanelView = createdPanelView;
    }
    do
    {
      return true;
      if (menu == null) {
        return false;
      }
      if (mPanelMenuPresenterCallback == null) {
        mPanelMenuPresenterCallback = new PanelMenuPresenterCallback(null);
      }
      shownPanelView = ((View)paramPanelFeatureState.getListMenuView(mPanelMenuPresenterCallback));
    } while (shownPanelView != null);
    return false;
  }
  
  private boolean initializePanelDecor(PanelFeatureState paramPanelFeatureState)
  {
    paramPanelFeatureState.setStyle(getActionBarThemedContext());
    decorView = new ListMenuDecorView(listPresenterContext);
    gravity = 81;
    return true;
  }
  
  private boolean initializePanelMenu(PanelFeatureState paramPanelFeatureState)
  {
    Context localContext = mContext;
    Object localObject1;
    TypedValue localTypedValue;
    Resources.Theme localTheme;
    if (featureId != 0)
    {
      localObject1 = localContext;
      if (featureId != 8) {}
    }
    else
    {
      localObject1 = localContext;
      if (mDecorContentParent != null)
      {
        localTypedValue = new TypedValue();
        localTheme = localContext.getTheme();
        localTheme.resolveAttribute(R.attr.actionBarTheme, localTypedValue, true);
        localObject1 = null;
        if (resourceId == 0) {
          break label197;
        }
        localObject1 = localContext.getResources().newTheme();
        ((Resources.Theme)localObject1).setTo(localTheme);
        ((Resources.Theme)localObject1).applyStyle(resourceId, true);
        ((Resources.Theme)localObject1).resolveAttribute(R.attr.actionBarWidgetTheme, localTypedValue, true);
      }
    }
    for (;;)
    {
      Object localObject2 = localObject1;
      if (resourceId != 0)
      {
        localObject2 = localObject1;
        if (localObject1 == null)
        {
          localObject2 = localContext.getResources().newTheme();
          ((Resources.Theme)localObject2).setTo(localTheme);
        }
        ((Resources.Theme)localObject2).applyStyle(resourceId, true);
      }
      localObject1 = localContext;
      if (localObject2 != null)
      {
        localObject1 = new ContextThemeWrapper(localContext, 0);
        ((Context)localObject1).getTheme().setTo((Resources.Theme)localObject2);
      }
      localObject1 = new MenuBuilder((Context)localObject1);
      ((MenuBuilder)localObject1).setCallback(this);
      paramPanelFeatureState.setMenu((MenuBuilder)localObject1);
      return true;
      label197:
      localTheme.resolveAttribute(R.attr.actionBarWidgetTheme, localTypedValue, true);
    }
  }
  
  private void invalidatePanelMenu(int paramInt)
  {
    mInvalidatePanelMenuFeatures |= 1 << paramInt;
    if ((!mInvalidatePanelMenuPosted) && (mWindowDecor != null))
    {
      ViewCompat.postOnAnimation(mWindowDecor, mInvalidatePanelMenuRunnable);
      mInvalidatePanelMenuPosted = true;
    }
  }
  
  private boolean onKeyDownPanel(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent.getRepeatCount() == 0)
    {
      PanelFeatureState localPanelFeatureState = getPanelState(paramInt, true);
      if (!isOpen) {
        return preparePanel(localPanelFeatureState, paramKeyEvent);
      }
    }
    return false;
  }
  
  private boolean onKeyUpPanel(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool2;
    if (mActionMode != null)
    {
      bool2 = false;
      return bool2;
    }
    boolean bool3 = false;
    PanelFeatureState localPanelFeatureState = getPanelState(paramInt, true);
    boolean bool1;
    if ((paramInt == 0) && (mDecorContentParent != null) && (mDecorContentParent.canShowOverflowMenu()) && (!ViewConfigurationCompat.hasPermanentMenuKey(ViewConfiguration.get(mContext)))) {
      if (!mDecorContentParent.isOverflowMenuShowing())
      {
        bool1 = bool3;
        if (!isDestroyed())
        {
          bool1 = bool3;
          if (preparePanel(localPanelFeatureState, paramKeyEvent)) {
            bool1 = mDecorContentParent.showOverflowMenu();
          }
        }
      }
    }
    for (;;)
    {
      bool2 = bool1;
      if (!bool1) {
        break;
      }
      paramKeyEvent = (AudioManager)mContext.getSystemService("audio");
      if (paramKeyEvent == null) {
        break label239;
      }
      paramKeyEvent.playSoundEffect(0);
      return bool1;
      bool1 = mDecorContentParent.hideOverflowMenu();
      continue;
      if ((isOpen) || (isHandled))
      {
        bool1 = isOpen;
        closePanel(localPanelFeatureState, true);
      }
      else
      {
        bool1 = bool3;
        if (isPrepared)
        {
          bool2 = true;
          if (refreshMenuContent)
          {
            isPrepared = false;
            bool2 = preparePanel(localPanelFeatureState, paramKeyEvent);
          }
          bool1 = bool3;
          if (bool2)
          {
            openPanel(localPanelFeatureState, paramKeyEvent);
            bool1 = true;
          }
        }
      }
    }
    label239:
    Log.w("AppCompatDelegate", "Couldn't get audio manager");
    return bool1;
  }
  
  private void openPanel(PanelFeatureState paramPanelFeatureState, KeyEvent paramKeyEvent)
  {
    if ((isOpen) || (isDestroyed())) {}
    Object localObject;
    int i;
    int j;
    label109:
    label114:
    label118:
    label120:
    WindowManager localWindowManager;
    do
    {
      do
      {
        for (;;)
        {
          return;
          if (featureId == 0)
          {
            localObject = mContext;
            if ((getResourcesgetConfigurationscreenLayout & 0xF) != 4) {
              break label109;
            }
            i = 1;
            if (getApplicationInfotargetSdkVersion < 11) {
              break label114;
            }
          }
          for (j = 1;; j = 0)
          {
            if ((i != 0) && (j != 0)) {
              break label118;
            }
            localObject = getWindowCallback();
            if ((localObject == null) || (((Window.Callback)localObject).onMenuOpened(featureId, menu))) {
              break label120;
            }
            closePanel(paramPanelFeatureState, true);
            return;
            i = 0;
            break;
          }
        }
        localWindowManager = (WindowManager)mContext.getSystemService("window");
      } while ((localWindowManager == null) || (!preparePanel(paramPanelFeatureState, paramKeyEvent)));
      j = -2;
      if ((decorView != null) && (!refreshDecorView)) {
        break label409;
      }
      if (decorView != null) {
        break;
      }
    } while ((!initializePanelDecor(paramPanelFeatureState)) || (decorView == null));
    label189:
    if ((initializePanelContent(paramPanelFeatureState)) && (paramPanelFeatureState.hasPanelItems()))
    {
      localObject = shownPanelView.getLayoutParams();
      paramKeyEvent = (KeyEvent)localObject;
      if (localObject == null) {
        paramKeyEvent = new ViewGroup.LayoutParams(-2, -2);
      }
      i = background;
      decorView.setBackgroundResource(i);
      localObject = shownPanelView.getParent();
      if ((localObject != null) && ((localObject instanceof ViewGroup))) {
        ((ViewGroup)localObject).removeView(shownPanelView);
      }
      decorView.addView(shownPanelView, paramKeyEvent);
      i = j;
      if (!shownPanelView.hasFocus())
      {
        shownPanelView.requestFocus();
        i = j;
      }
    }
    for (;;)
    {
      isHandled = false;
      paramKeyEvent = new WindowManager.LayoutParams(i, -2, x, y, 1002, 8519680, -3);
      gravity = gravity;
      windowAnimations = windowAnimations;
      localWindowManager.addView(decorView, paramKeyEvent);
      isOpen = true;
      return;
      if ((!refreshDecorView) || (decorView.getChildCount() <= 0)) {
        break label189;
      }
      decorView.removeAllViews();
      break label189;
      break;
      label409:
      i = j;
      if (createdPanelView != null)
      {
        paramKeyEvent = createdPanelView.getLayoutParams();
        i = j;
        if (paramKeyEvent != null)
        {
          i = j;
          if (width == -1) {
            i = -1;
          }
        }
      }
    }
  }
  
  private boolean performPanelShortcut(PanelFeatureState paramPanelFeatureState, int paramInt1, KeyEvent paramKeyEvent, int paramInt2)
  {
    boolean bool2;
    if (paramKeyEvent.isSystem()) {
      bool2 = false;
    }
    boolean bool1;
    do
    {
      do
      {
        do
        {
          return bool2;
          bool2 = false;
          if (!isPrepared)
          {
            bool1 = bool2;
            if (!preparePanel(paramPanelFeatureState, paramKeyEvent)) {}
          }
          else
          {
            bool1 = bool2;
            if (menu != null) {
              bool1 = menu.performShortcut(paramInt1, paramKeyEvent, paramInt2);
            }
          }
          bool2 = bool1;
        } while (!bool1);
        bool2 = bool1;
      } while ((paramInt2 & 0x1) != 0);
      bool2 = bool1;
    } while (mDecorContentParent != null);
    closePanel(paramPanelFeatureState, true);
    return bool1;
  }
  
  private boolean preparePanel(PanelFeatureState paramPanelFeatureState, KeyEvent paramKeyEvent)
  {
    if (isDestroyed()) {
      return false;
    }
    if (isPrepared) {
      return true;
    }
    if ((mPreparedPanel != null) && (mPreparedPanel != paramPanelFeatureState)) {
      closePanel(mPreparedPanel, false);
    }
    Window.Callback localCallback = getWindowCallback();
    if (localCallback != null) {
      createdPanelView = localCallback.onCreatePanelView(featureId);
    }
    if ((featureId == 0) || (featureId == 8)) {}
    for (int i = 1;; i = 0)
    {
      if ((i != 0) && (mDecorContentParent != null)) {
        mDecorContentParent.setMenuPrepared();
      }
      if ((createdPanelView != null) || ((i != 0) && ((peekSupportActionBar() instanceof ToolbarActionBar)))) {
        break label408;
      }
      if ((menu != null) && (!refreshMenuContent)) {
        break label278;
      }
      if ((menu == null) && ((!initializePanelMenu(paramPanelFeatureState)) || (menu == null))) {
        break;
      }
      if ((i != 0) && (mDecorContentParent != null))
      {
        if (mActionMenuPresenterCallback == null) {
          mActionMenuPresenterCallback = new ActionMenuPresenterCallback(null);
        }
        mDecorContentParent.setMenu(menu, mActionMenuPresenterCallback);
      }
      menu.stopDispatchingItemsChanged();
      if (localCallback.onCreatePanelMenu(featureId, menu)) {
        break label273;
      }
      paramPanelFeatureState.setMenu(null);
      if ((i == 0) || (mDecorContentParent == null)) {
        break;
      }
      mDecorContentParent.setMenu(null, mActionMenuPresenterCallback);
      return false;
    }
    label273:
    refreshMenuContent = false;
    label278:
    menu.stopDispatchingItemsChanged();
    if (frozenActionViewState != null)
    {
      menu.restoreActionViewStates(frozenActionViewState);
      frozenActionViewState = null;
    }
    if (!localCallback.onPreparePanel(0, createdPanelView, menu))
    {
      if ((i != 0) && (mDecorContentParent != null)) {
        mDecorContentParent.setMenu(null, mActionMenuPresenterCallback);
      }
      menu.startDispatchingItemsChanged();
      return false;
    }
    if (paramKeyEvent != null)
    {
      i = paramKeyEvent.getDeviceId();
      if (KeyCharacterMap.load(i).getKeyboardType() == 1) {
        break label430;
      }
    }
    label408:
    label430:
    for (boolean bool = true;; bool = false)
    {
      qwertyMode = bool;
      menu.setQwertyMode(qwertyMode);
      menu.startDispatchingItemsChanged();
      isPrepared = true;
      isHandled = false;
      mPreparedPanel = paramPanelFeatureState;
      return true;
      i = -1;
      break;
    }
  }
  
  private void reopenMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if ((mDecorContentParent != null) && (mDecorContentParent.canShowOverflowMenu()) && ((!ViewConfigurationCompat.hasPermanentMenuKey(ViewConfiguration.get(mContext))) || (mDecorContentParent.isOverflowMenuShowPending())))
    {
      paramMenuBuilder = getWindowCallback();
      if ((!mDecorContentParent.isOverflowMenuShowing()) || (!paramBoolean)) {
        if ((paramMenuBuilder != null) && (!isDestroyed()))
        {
          if ((mInvalidatePanelMenuPosted) && ((mInvalidatePanelMenuFeatures & 0x1) != 0))
          {
            mWindowDecor.removeCallbacks(mInvalidatePanelMenuRunnable);
            mInvalidatePanelMenuRunnable.run();
          }
          PanelFeatureState localPanelFeatureState = getPanelState(0, true);
          if ((menu != null) && (!refreshMenuContent) && (paramMenuBuilder.onPreparePanel(0, createdPanelView, menu)))
          {
            paramMenuBuilder.onMenuOpened(8, menu);
            mDecorContentParent.showOverflowMenu();
          }
        }
      }
      do
      {
        return;
        mDecorContentParent.hideOverflowMenu();
      } while (isDestroyed());
      paramMenuBuilder.onPanelClosed(8, getPanelState0menu);
      return;
    }
    paramMenuBuilder = getPanelState(0, true);
    refreshDecorView = true;
    closePanel(paramMenuBuilder, false);
    openPanel(paramMenuBuilder, null);
  }
  
  private void throwFeatureRequestIfSubDecorInstalled()
  {
    if (mSubDecorInstalled) {
      throw new AndroidRuntimeException("Window feature must be requested before adding content");
    }
  }
  
  private int updateStatusGuard(int paramInt)
  {
    int i1 = 0;
    int j = 0;
    int i2 = 0;
    int n = j;
    int i = paramInt;
    Object localObject1;
    Object localObject2;
    label217:
    label227:
    int k;
    int m;
    if (mActionModeView != null)
    {
      n = j;
      i = paramInt;
      if ((mActionModeView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams))
      {
        localObject1 = (ViewGroup.MarginLayoutParams)mActionModeView.getLayoutParams();
        j = 0;
        i = 0;
        if (!mActionModeView.isShown()) {
          break label373;
        }
        if (mTempRect1 == null)
        {
          mTempRect1 = new Rect();
          mTempRect2 = new Rect();
        }
        localObject2 = mTempRect1;
        Rect localRect = mTempRect2;
        ((Rect)localObject2).set(0, paramInt, 0, 0);
        ViewUtils.computeFitSystemWindows(mSubDecor, (Rect)localObject2, localRect);
        if (top != 0) {
          break label322;
        }
        j = paramInt;
        if (topMargin != j)
        {
          j = 1;
          topMargin = paramInt;
          if (mStatusGuard != null) {
            break label327;
          }
          mStatusGuard = new View(mContext);
          mStatusGuard.setBackgroundColor(mContext.getResources().getColor(R.color.abc_input_method_navigation_guard));
          mSubDecor.addView(mStatusGuard, -1, new ViewGroup.LayoutParams(-1, paramInt));
          i = j;
        }
        if (mStatusGuard == null) {
          break label367;
        }
        n = 1;
        j = i;
        k = n;
        m = paramInt;
        if (!mOverlayActionMode)
        {
          j = i;
          k = n;
          m = paramInt;
          if (n != 0)
          {
            m = 0;
            k = n;
            j = i;
          }
        }
        label266:
        n = k;
        i = m;
        if (j != 0)
        {
          mActionModeView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
          i = m;
          n = k;
        }
      }
    }
    if (mStatusGuard != null)
    {
      localObject1 = mStatusGuard;
      if (n == 0) {
        break label406;
      }
    }
    label322:
    label327:
    label367:
    label373:
    label406:
    for (paramInt = i1;; paramInt = 8)
    {
      ((View)localObject1).setVisibility(paramInt);
      return i;
      j = 0;
      break;
      localObject2 = mStatusGuard.getLayoutParams();
      i = j;
      if (height == paramInt) {
        break label217;
      }
      height = paramInt;
      mStatusGuard.setLayoutParams((ViewGroup.LayoutParams)localObject2);
      i = j;
      break label217;
      n = 0;
      break label227;
      k = i2;
      m = paramInt;
      if (topMargin == 0) {
        break label266;
      }
      j = 1;
      topMargin = 0;
      k = i2;
      m = paramInt;
      break label266;
    }
  }
  
  public void addContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    ((ViewGroup)mSubDecor.findViewById(16908290)).addView(paramView, paramLayoutParams);
    mOriginalWindowCallback.onContentChanged();
  }
  
  View callActivityOnCreateView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    if ((mOriginalWindowCallback instanceof LayoutInflater.Factory))
    {
      paramView = ((LayoutInflater.Factory)mOriginalWindowCallback).onCreateView(paramString, paramContext, paramAttributeSet);
      if (paramView != null) {
        return paramView;
      }
    }
    return null;
  }
  
  public ActionBar createSupportActionBar()
  {
    ensureSubDecor();
    WindowDecorActionBar localWindowDecorActionBar = null;
    if ((mOriginalWindowCallback instanceof Activity)) {
      localWindowDecorActionBar = new WindowDecorActionBar((Activity)mOriginalWindowCallback, mOverlayActionBar);
    }
    for (;;)
    {
      if (localWindowDecorActionBar != null) {
        localWindowDecorActionBar.setDefaultDisplayHomeAsUpEnabled(mEnableDefaultActionBarUp);
      }
      return localWindowDecorActionBar;
      if ((mOriginalWindowCallback instanceof Dialog)) {
        localWindowDecorActionBar = new WindowDecorActionBar((Dialog)mOriginalWindowCallback);
      }
    }
  }
  
  public View createView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    boolean bool1;
    if (Build.VERSION.SDK_INT < 21)
    {
      bool1 = true;
      if (mAppCompatViewInflater == null) {
        mAppCompatViewInflater = new AppCompatViewInflater();
      }
      if ((!bool1) || (!mSubDecorInstalled) || (paramView == null) || (paramView.getId() == 16908290) || (ViewCompat.isAttachedToWindow(paramView))) {
        break label89;
      }
    }
    label89:
    for (boolean bool2 = true;; bool2 = false)
    {
      return mAppCompatViewInflater.createView(paramView, paramString, paramContext, paramAttributeSet, bool2, bool1, true);
      bool1 = false;
      break;
    }
  }
  
  boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    int j = paramKeyEvent.getKeyCode();
    if (paramKeyEvent.getAction() == 0) {}
    for (int i = 1; i != 0; i = 0) {
      return onKeyDown(j, paramKeyEvent);
    }
    return onKeyUp(j, paramKeyEvent);
  }
  
  public void installViewFactory()
  {
    LayoutInflater localLayoutInflater = LayoutInflater.from(mContext);
    if (localLayoutInflater.getFactory() == null)
    {
      LayoutInflaterCompat.setFactory(localLayoutInflater, this);
      return;
    }
    Log.i("AppCompatDelegate", "The Activity's LayoutInflater already has a Factory installed so we can not install AppCompat's");
  }
  
  public void invalidateOptionsMenu()
  {
    ActionBar localActionBar = getSupportActionBar();
    if ((localActionBar != null) && (localActionBar.invalidateOptionsMenu())) {
      return;
    }
    invalidatePanelMenu(0);
  }
  
  boolean onBackPressed()
  {
    if (mActionMode != null) {
      mActionMode.finish();
    }
    ActionBar localActionBar;
    do
    {
      return true;
      localActionBar = getSupportActionBar();
    } while ((localActionBar != null) && (localActionBar.collapseActionView()));
    return false;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if ((mHasActionBar) && (mSubDecorInstalled))
    {
      ActionBar localActionBar = getSupportActionBar();
      if (localActionBar != null) {
        localActionBar.onConfigurationChanged(paramConfiguration);
      }
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mWindowDecor = ((ViewGroup)mWindow.getDecorView());
    if (((mOriginalWindowCallback instanceof Activity)) && (NavUtils.getParentActivityName((Activity)mOriginalWindowCallback) != null))
    {
      paramBundle = peekSupportActionBar();
      if (paramBundle == null) {
        mEnableDefaultActionBarUp = true;
      }
    }
    else
    {
      return;
    }
    paramBundle.setDefaultDisplayHomeAsUpEnabled(true);
  }
  
  public final View onCreateView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    View localView = callActivityOnCreateView(paramView, paramString, paramContext, paramAttributeSet);
    if (localView != null) {
      return localView;
    }
    return createView(paramView, paramString, paramContext, paramAttributeSet);
  }
  
  boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool = false;
    switch (paramInt)
    {
    }
    do
    {
      if (Build.VERSION.SDK_INT < 11) {
        bool = onKeyShortcut(paramInt, paramKeyEvent);
      }
      return bool;
    } while (!onKeyDownPanel(0, paramKeyEvent));
    return true;
  }
  
  boolean onKeyShortcut(int paramInt, KeyEvent paramKeyEvent)
  {
    Object localObject = getSupportActionBar();
    if ((localObject != null) && (((ActionBar)localObject).onKeyShortcut(paramInt, paramKeyEvent))) {}
    boolean bool;
    do
    {
      do
      {
        return true;
        if ((mPreparedPanel == null) || (!performPanelShortcut(mPreparedPanel, paramKeyEvent.getKeyCode(), paramKeyEvent, 1))) {
          break;
        }
      } while (mPreparedPanel == null);
      mPreparedPanel.isHandled = true;
      return true;
      if (mPreparedPanel != null) {
        break;
      }
      localObject = getPanelState(0, true);
      preparePanel((PanelFeatureState)localObject, paramKeyEvent);
      bool = performPanelShortcut((PanelFeatureState)localObject, paramKeyEvent.getKeyCode(), paramKeyEvent, 1);
      isPrepared = false;
    } while (bool);
    return false;
  }
  
  boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    switch (paramInt)
    {
    }
    do
    {
      do
      {
        return false;
      } while (!onKeyUpPanel(0, paramKeyEvent));
      return true;
      paramKeyEvent = getPanelState(0, false);
      if ((paramKeyEvent != null) && (isOpen))
      {
        closePanel(paramKeyEvent, true);
        return true;
      }
    } while (!onBackPressed());
    return true;
  }
  
  public boolean onMenuItemSelected(MenuBuilder paramMenuBuilder, MenuItem paramMenuItem)
  {
    Window.Callback localCallback = getWindowCallback();
    if ((localCallback != null) && (!isDestroyed()))
    {
      paramMenuBuilder = findMenuPanel(paramMenuBuilder.getRootMenu());
      if (paramMenuBuilder != null) {
        return localCallback.onMenuItemSelected(featureId, paramMenuItem);
      }
    }
    return false;
  }
  
  public void onMenuModeChange(MenuBuilder paramMenuBuilder)
  {
    reopenMenu(paramMenuBuilder, true);
  }
  
  boolean onMenuOpened(int paramInt, Menu paramMenu)
  {
    if (paramInt == 8)
    {
      paramMenu = getSupportActionBar();
      if (paramMenu != null) {
        paramMenu.dispatchMenuVisibilityChanged(true);
      }
      return true;
    }
    return false;
  }
  
  boolean onPanelClosed(int paramInt, Menu paramMenu)
  {
    if (paramInt == 8)
    {
      paramMenu = getSupportActionBar();
      if (paramMenu != null) {
        paramMenu.dispatchMenuVisibilityChanged(false);
      }
      return true;
    }
    if (paramInt == 0)
    {
      paramMenu = getPanelState(paramInt, true);
      if (isOpen) {
        closePanel(paramMenu, false);
      }
    }
    return false;
  }
  
  public void onPostCreate(Bundle paramBundle)
  {
    ensureSubDecor();
  }
  
  public void onPostResume()
  {
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null) {
      localActionBar.setShowHideAnimationEnabled(true);
    }
  }
  
  public void onStop()
  {
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null) {
      localActionBar.setShowHideAnimationEnabled(false);
    }
  }
  
  void onSubDecorInstalled(ViewGroup paramViewGroup) {}
  
  void onTitleChanged(CharSequence paramCharSequence)
  {
    if (mDecorContentParent != null) {
      mDecorContentParent.setWindowTitle(paramCharSequence);
    }
    do
    {
      return;
      if (peekSupportActionBar() != null)
      {
        peekSupportActionBar().setWindowTitle(paramCharSequence);
        return;
      }
    } while (mTitleView == null);
    mTitleView.setText(paramCharSequence);
  }
  
  public boolean requestWindowFeature(int paramInt)
  {
    switch (paramInt)
    {
    case 3: 
    case 4: 
    case 6: 
    case 7: 
    default: 
      return mWindow.requestFeature(paramInt);
    case 8: 
      throwFeatureRequestIfSubDecorInstalled();
      mHasActionBar = true;
      return true;
    case 9: 
      throwFeatureRequestIfSubDecorInstalled();
      mOverlayActionBar = true;
      return true;
    case 10: 
      throwFeatureRequestIfSubDecorInstalled();
      mOverlayActionMode = true;
      return true;
    case 2: 
      throwFeatureRequestIfSubDecorInstalled();
      mFeatureProgress = true;
      return true;
    case 5: 
      throwFeatureRequestIfSubDecorInstalled();
      mFeatureIndeterminateProgress = true;
      return true;
    }
    throwFeatureRequestIfSubDecorInstalled();
    mWindowNoTitle = true;
    return true;
  }
  
  public void setContentView(int paramInt)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)mSubDecor.findViewById(16908290);
    localViewGroup.removeAllViews();
    LayoutInflater.from(mContext).inflate(paramInt, localViewGroup);
    mOriginalWindowCallback.onContentChanged();
  }
  
  public void setContentView(View paramView)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)mSubDecor.findViewById(16908290);
    localViewGroup.removeAllViews();
    localViewGroup.addView(paramView);
    mOriginalWindowCallback.onContentChanged();
  }
  
  public void setContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)mSubDecor.findViewById(16908290);
    localViewGroup.removeAllViews();
    localViewGroup.addView(paramView, paramLayoutParams);
    mOriginalWindowCallback.onContentChanged();
  }
  
  public void setSupportActionBar(Toolbar paramToolbar)
  {
    if (!(mOriginalWindowCallback instanceof Activity)) {
      return;
    }
    if ((getSupportActionBar() instanceof WindowDecorActionBar)) {
      throw new IllegalStateException("This Activity already has an action bar supplied by the window decor. Do not request Window.FEATURE_ACTION_BAR and set windowActionBar to false in your theme to use a Toolbar instead.");
    }
    paramToolbar = new ToolbarActionBar(paramToolbar, ((Activity)mContext).getTitle(), mAppCompatWindowCallback);
    setSupportActionBar(paramToolbar);
    mWindow.setCallback(paramToolbar.getWrappedWindowCallback());
    paramToolbar.invalidateOptionsMenu();
  }
  
  public ActionMode startSupportActionMode(ActionMode.Callback paramCallback)
  {
    if (paramCallback == null) {
      throw new IllegalArgumentException("ActionMode callback can not be null.");
    }
    if (mActionMode != null) {
      mActionMode.finish();
    }
    paramCallback = new ActionModeCallbackWrapperV7(paramCallback);
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null)
    {
      mActionMode = localActionBar.startActionMode(paramCallback);
      if ((mActionMode != null) && (mAppCompatCallback != null)) {
        mAppCompatCallback.onSupportActionModeStarted(mActionMode);
      }
    }
    if (mActionMode == null) {
      mActionMode = startSupportActionModeFromWindow(paramCallback);
    }
    return mActionMode;
  }
  
  ActionMode startSupportActionModeFromWindow(ActionMode.Callback paramCallback)
  {
    if (mActionMode != null) {
      mActionMode.finish();
    }
    ActionModeCallbackWrapperV7 localActionModeCallbackWrapperV7 = new ActionModeCallbackWrapperV7(paramCallback);
    Object localObject3 = null;
    Object localObject1 = localObject3;
    if (mAppCompatCallback != null)
    {
      localObject1 = localObject3;
      if (isDestroyed()) {}
    }
    try
    {
      localObject1 = mAppCompatCallback.onWindowStartingSupportActionMode(localActionModeCallbackWrapperV7);
      if (localObject1 != null) {
        mActionMode = ((ActionMode)localObject1);
      }
      for (;;)
      {
        if ((mActionMode != null) && (mAppCompatCallback != null)) {
          mAppCompatCallback.onSupportActionModeStarted(mActionMode);
        }
        return mActionMode;
        if (mActionModeView == null)
        {
          if (!mIsFloating) {
            break label486;
          }
          localObject3 = new TypedValue();
          localObject1 = mContext.getTheme();
          ((Resources.Theme)localObject1).resolveAttribute(R.attr.actionBarTheme, (TypedValue)localObject3, true);
          if (resourceId != 0)
          {
            Resources.Theme localTheme = mContext.getResources().newTheme();
            localTheme.setTo((Resources.Theme)localObject1);
            localTheme.applyStyle(resourceId, true);
            localObject1 = new ContextThemeWrapper(mContext, 0);
            ((Context)localObject1).getTheme().setTo(localTheme);
            label212:
            mActionModeView = new ActionBarContextView((Context)localObject1);
            mActionModePopup = new PopupWindow((Context)localObject1, null, R.attr.actionModePopupWindowStyle);
            mActionModePopup.setContentView(mActionModeView);
            mActionModePopup.setWidth(-1);
            ((Context)localObject1).getTheme().resolveAttribute(R.attr.actionBarSize, (TypedValue)localObject3, true);
            int i = TypedValue.complexToDimensionPixelSize(data, ((Context)localObject1).getResources().getDisplayMetrics());
            mActionModeView.setContentHeight(i);
            mActionModePopup.setHeight(-2);
            mShowActionModePopup = new Runnable()
            {
              public void run()
              {
                mActionModePopup.showAtLocation(mActionModeView, 55, 0, 0);
              }
            };
          }
        }
        else
        {
          label322:
          if (mActionModeView == null) {
            break label531;
          }
          mActionModeView.killMode();
          localObject1 = mActionModeView.getContext();
          localObject3 = mActionModeView;
          if (mActionModePopup != null) {
            break label533;
          }
        }
        label486:
        label531:
        label533:
        for (boolean bool = true;; bool = false)
        {
          localObject1 = new StandaloneActionMode((Context)localObject1, (ActionBarContextView)localObject3, localActionModeCallbackWrapperV7, bool);
          if (!paramCallback.onCreateActionMode((ActionMode)localObject1, ((ActionMode)localObject1).getMenu())) {
            break label538;
          }
          ((ActionMode)localObject1).invalidate();
          mActionModeView.initForMode((ActionMode)localObject1);
          mActionModeView.setVisibility(0);
          mActionMode = ((ActionMode)localObject1);
          if (mActionModePopup != null) {
            mWindow.getDecorView().post(mShowActionModePopup);
          }
          mActionModeView.sendAccessibilityEvent(32);
          if (mActionModeView.getParent() == null) {
            break;
          }
          ViewCompat.requestApplyInsets((View)mActionModeView.getParent());
          break;
          localObject1 = mContext;
          break label212;
          localObject1 = (ViewStubCompat)mSubDecor.findViewById(R.id.action_mode_bar_stub);
          if (localObject1 == null) {
            break label322;
          }
          ((ViewStubCompat)localObject1).setLayoutInflater(LayoutInflater.from(getActionBarThemedContext()));
          mActionModeView = ((ActionBarContextView)((ViewStubCompat)localObject1).inflate());
          break label322;
          break;
        }
        label538:
        mActionMode = null;
      }
    }
    catch (AbstractMethodError localAbstractMethodError)
    {
      for (;;)
      {
        Object localObject2 = localObject3;
      }
    }
  }
  
  private final class ActionMenuPresenterCallback
    implements MenuPresenter.Callback
  {
    private ActionMenuPresenterCallback() {}
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
    {
      AppCompatDelegateImplV7.this.checkCloseActionMenu(paramMenuBuilder);
    }
    
    public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
    {
      Window.Callback localCallback = getWindowCallback();
      if (localCallback != null) {
        localCallback.onMenuOpened(8, paramMenuBuilder);
      }
      return true;
    }
  }
  
  class ActionModeCallbackWrapperV7
    implements ActionMode.Callback
  {
    private ActionMode.Callback mWrapped;
    
    public ActionModeCallbackWrapperV7(ActionMode.Callback paramCallback)
    {
      mWrapped = paramCallback;
    }
    
    public boolean onActionItemClicked(ActionMode paramActionMode, MenuItem paramMenuItem)
    {
      return mWrapped.onActionItemClicked(paramActionMode, paramMenuItem);
    }
    
    public boolean onCreateActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return mWrapped.onCreateActionMode(paramActionMode, paramMenu);
    }
    
    public void onDestroyActionMode(ActionMode paramActionMode)
    {
      mWrapped.onDestroyActionMode(paramActionMode);
      if (mActionModePopup != null)
      {
        mWindow.getDecorView().removeCallbacks(mShowActionModePopup);
        mActionModePopup.dismiss();
      }
      for (;;)
      {
        if (mActionModeView != null) {
          mActionModeView.removeAllViews();
        }
        if (mAppCompatCallback != null) {
          mAppCompatCallback.onSupportActionModeFinished(mActionMode);
        }
        mActionMode = null;
        return;
        if (mActionModeView != null)
        {
          mActionModeView.setVisibility(8);
          if (mActionModeView.getParent() != null) {
            ViewCompat.requestApplyInsets((View)mActionModeView.getParent());
          }
        }
      }
    }
    
    public boolean onPrepareActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return mWrapped.onPrepareActionMode(paramActionMode, paramMenu);
    }
  }
  
  private class ListMenuDecorView
    extends FrameLayout
  {
    public ListMenuDecorView(Context paramContext)
    {
      super();
    }
    
    private boolean isOutOfBounds(int paramInt1, int paramInt2)
    {
      return (paramInt1 < -5) || (paramInt2 < -5) || (paramInt1 > getWidth() + 5) || (paramInt2 > getHeight() + 5);
    }
    
    public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
    {
      return AppCompatDelegateImplV7.this.dispatchKeyEvent(paramKeyEvent);
    }
    
    public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
    {
      if ((paramMotionEvent.getAction() == 0) && (isOutOfBounds((int)paramMotionEvent.getX(), (int)paramMotionEvent.getY())))
      {
        AppCompatDelegateImplV7.this.closePanel(0);
        return true;
      }
      return super.onInterceptTouchEvent(paramMotionEvent);
    }
    
    public void setBackgroundResource(int paramInt)
    {
      setBackgroundDrawable(TintManager.getDrawable(getContext(), paramInt));
    }
  }
  
  private static final class PanelFeatureState
  {
    int background;
    View createdPanelView;
    ViewGroup decorView;
    int featureId;
    Bundle frozenActionViewState;
    int gravity;
    boolean isHandled;
    boolean isOpen;
    boolean isPrepared;
    ListMenuPresenter listMenuPresenter;
    Context listPresenterContext;
    MenuBuilder menu;
    public boolean qwertyMode;
    boolean refreshDecorView;
    boolean refreshMenuContent;
    View shownPanelView;
    int windowAnimations;
    int x;
    int y;
    
    PanelFeatureState(int paramInt)
    {
      featureId = paramInt;
      refreshDecorView = false;
    }
    
    MenuView getListMenuView(MenuPresenter.Callback paramCallback)
    {
      if (menu == null) {
        return null;
      }
      if (listMenuPresenter == null)
      {
        listMenuPresenter = new ListMenuPresenter(listPresenterContext, R.layout.abc_list_menu_item_layout);
        listMenuPresenter.setCallback(paramCallback);
        menu.addMenuPresenter(listMenuPresenter);
      }
      return listMenuPresenter.getMenuView(decorView);
    }
    
    public boolean hasPanelItems()
    {
      boolean bool2 = true;
      boolean bool1;
      if (shownPanelView == null) {
        bool1 = false;
      }
      do
      {
        do
        {
          return bool1;
          bool1 = bool2;
        } while (createdPanelView != null);
        bool1 = bool2;
      } while (listMenuPresenter.getAdapter().getCount() > 0);
      return false;
    }
    
    void setMenu(MenuBuilder paramMenuBuilder)
    {
      if (paramMenuBuilder == menu) {}
      do
      {
        return;
        if (menu != null) {
          menu.removeMenuPresenter(listMenuPresenter);
        }
        menu = paramMenuBuilder;
      } while ((paramMenuBuilder == null) || (listMenuPresenter == null));
      paramMenuBuilder.addMenuPresenter(listMenuPresenter);
    }
    
    void setStyle(Context paramContext)
    {
      TypedValue localTypedValue = new TypedValue();
      Resources.Theme localTheme = paramContext.getResources().newTheme();
      localTheme.setTo(paramContext.getTheme());
      localTheme.resolveAttribute(R.attr.actionBarPopupTheme, localTypedValue, true);
      if (resourceId != 0) {
        localTheme.applyStyle(resourceId, true);
      }
      localTheme.resolveAttribute(R.attr.panelMenuListTheme, localTypedValue, true);
      if (resourceId != 0) {
        localTheme.applyStyle(resourceId, true);
      }
      for (;;)
      {
        paramContext = new ContextThemeWrapper(paramContext, 0);
        paramContext.getTheme().setTo(localTheme);
        listPresenterContext = paramContext;
        paramContext = paramContext.obtainStyledAttributes(R.styleable.Theme);
        background = paramContext.getResourceId(R.styleable.Theme_panelBackground, 0);
        windowAnimations = paramContext.getResourceId(R.styleable.Theme_android_windowAnimationStyle, 0);
        paramContext.recycle();
        return;
        localTheme.applyStyle(R.style.Theme_AppCompat_CompactMenu, true);
      }
    }
    
    private static class SavedState
      implements Parcelable
    {
      public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
      {
        public AppCompatDelegateImplV7.PanelFeatureState.SavedState createFromParcel(Parcel paramAnonymousParcel)
        {
          return AppCompatDelegateImplV7.PanelFeatureState.SavedState.readFromParcel(paramAnonymousParcel);
        }
        
        public AppCompatDelegateImplV7.PanelFeatureState.SavedState[] newArray(int paramAnonymousInt)
        {
          return new AppCompatDelegateImplV7.PanelFeatureState.SavedState[paramAnonymousInt];
        }
      };
      int featureId;
      boolean isOpen;
      Bundle menuState;
      
      private SavedState() {}
      
      private static SavedState readFromParcel(Parcel paramParcel)
      {
        boolean bool = true;
        SavedState localSavedState = new SavedState();
        featureId = paramParcel.readInt();
        if (paramParcel.readInt() == 1) {}
        for (;;)
        {
          isOpen = bool;
          if (isOpen) {
            menuState = paramParcel.readBundle();
          }
          return localSavedState;
          bool = false;
        }
      }
      
      public int describeContents()
      {
        return 0;
      }
      
      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        paramParcel.writeInt(featureId);
        if (isOpen) {}
        for (paramInt = 1;; paramInt = 0)
        {
          paramParcel.writeInt(paramInt);
          if (isOpen) {
            paramParcel.writeBundle(menuState);
          }
          return;
        }
      }
    }
  }
  
  private final class PanelMenuPresenterCallback
    implements MenuPresenter.Callback
  {
    private PanelMenuPresenterCallback() {}
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
    {
      MenuBuilder localMenuBuilder = paramMenuBuilder.getRootMenu();
      if (localMenuBuilder != paramMenuBuilder) {}
      for (int i = 1;; i = 0)
      {
        AppCompatDelegateImplV7 localAppCompatDelegateImplV7 = AppCompatDelegateImplV7.this;
        if (i != 0) {
          paramMenuBuilder = localMenuBuilder;
        }
        paramMenuBuilder = localAppCompatDelegateImplV7.findMenuPanel(paramMenuBuilder);
        if (paramMenuBuilder != null)
        {
          if (i == 0) {
            break;
          }
          AppCompatDelegateImplV7.this.callOnPanelClosed(featureId, paramMenuBuilder, localMenuBuilder);
          AppCompatDelegateImplV7.this.closePanel(paramMenuBuilder, true);
        }
        return;
      }
      AppCompatDelegateImplV7.this.closePanel(paramMenuBuilder, paramBoolean);
    }
    
    public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
    {
      if ((paramMenuBuilder == null) && (mHasActionBar))
      {
        Window.Callback localCallback = getWindowCallback();
        if ((localCallback != null) && (!isDestroyed())) {
          localCallback.onMenuOpened(8, paramMenuBuilder);
        }
      }
      return true;
    }
  }
}
