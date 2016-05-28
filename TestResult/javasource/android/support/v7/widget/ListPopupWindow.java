package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.SystemClock;
import android.support.v4.text.TextUtilsCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.widget.ListViewAutoScrollHelper;
import android.support.v4.widget.PopupWindowCompat;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.widget.AppCompatPopupWindow;
import android.support.v7.internal.widget.ListViewCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;
import java.lang.reflect.Method;

public class ListPopupWindow
{
  private static Method sClipToWindowEnabledMethod;
  private ListAdapter mAdapter;
  private Context mContext;
  private boolean mDropDownAlwaysVisible = false;
  private View mDropDownAnchorView;
  private int mDropDownGravity = 0;
  private int mDropDownHeight = -2;
  private int mDropDownHorizontalOffset;
  private DropDownListView mDropDownList;
  private Drawable mDropDownListHighlight;
  private int mDropDownVerticalOffset;
  private boolean mDropDownVerticalOffsetSet;
  private int mDropDownWidth = -2;
  private boolean mForceIgnoreOutsideTouch = false;
  private Handler mHandler = new Handler();
  private final ListSelectorHider mHideSelector = new ListSelectorHider(null);
  private AdapterView.OnItemClickListener mItemClickListener;
  private AdapterView.OnItemSelectedListener mItemSelectedListener;
  private int mLayoutDirection;
  int mListItemExpandMaximum = Integer.MAX_VALUE;
  private boolean mModal;
  private DataSetObserver mObserver;
  private PopupWindow mPopup;
  private int mPromptPosition = 0;
  private View mPromptView;
  private final ResizePopupRunnable mResizePopupRunnable = new ResizePopupRunnable(null);
  private final PopupScrollListener mScrollListener = new PopupScrollListener(null);
  private Runnable mShowDropDownRunnable;
  private Rect mTempRect = new Rect();
  private final PopupTouchInterceptor mTouchInterceptor = new PopupTouchInterceptor(null);
  
  static
  {
    try
    {
      sClipToWindowEnabledMethod = PopupWindow.class.getDeclaredMethod("setClipToScreenEnabled", new Class[] { Boolean.TYPE });
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      Log.i("ListPopupWindow", "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well.");
    }
  }
  
  public ListPopupWindow(Context paramContext)
  {
    this(paramContext, null, R.attr.listPopupWindowStyle);
  }
  
  public ListPopupWindow(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, 0);
  }
  
  public ListPopupWindow(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    mContext = paramContext;
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ListPopupWindow, paramInt1, paramInt2);
    mDropDownHorizontalOffset = localTypedArray.getDimensionPixelOffset(R.styleable.ListPopupWindow_android_dropDownHorizontalOffset, 0);
    mDropDownVerticalOffset = localTypedArray.getDimensionPixelOffset(R.styleable.ListPopupWindow_android_dropDownVerticalOffset, 0);
    if (mDropDownVerticalOffset != 0) {
      mDropDownVerticalOffsetSet = true;
    }
    localTypedArray.recycle();
    mPopup = new AppCompatPopupWindow(paramContext, paramAttributeSet, paramInt1);
    mPopup.setInputMethodMode(1);
    mLayoutDirection = TextUtilsCompat.getLayoutDirectionFromLocale(mContext.getResources().getConfiguration().locale);
  }
  
  private int buildDropDown()
  {
    int j = 0;
    int i = 0;
    Object localObject3;
    boolean bool;
    Object localObject2;
    View localView;
    Object localObject1;
    label261:
    label314:
    int k;
    if (mDropDownList == null)
    {
      localObject3 = mContext;
      mShowDropDownRunnable = new Runnable()
      {
        public void run()
        {
          View localView = getAnchorView();
          if ((localView != null) && (localView.getWindowToken() != null)) {
            show();
          }
        }
      };
      if (!mModal)
      {
        bool = true;
        mDropDownList = new DropDownListView((Context)localObject3, bool);
        if (mDropDownListHighlight != null) {
          mDropDownList.setSelector(mDropDownListHighlight);
        }
        mDropDownList.setAdapter(mAdapter);
        mDropDownList.setOnItemClickListener(mItemClickListener);
        mDropDownList.setFocusable(true);
        mDropDownList.setFocusableInTouchMode(true);
        mDropDownList.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
        {
          public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
          {
            if (paramAnonymousInt != -1)
            {
              paramAnonymousAdapterView = mDropDownList;
              if (paramAnonymousAdapterView != null) {
                ListPopupWindow.DropDownListView.access$502(paramAnonymousAdapterView, false);
              }
            }
          }
          
          public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
        });
        mDropDownList.setOnScrollListener(mScrollListener);
        if (mItemSelectedListener != null) {
          mDropDownList.setOnItemSelectedListener(mItemSelectedListener);
        }
        localObject2 = mDropDownList;
        localView = mPromptView;
        localObject1 = localObject2;
        if (localView != null)
        {
          localObject1 = new LinearLayout((Context)localObject3);
          ((LinearLayout)localObject1).setOrientation(1);
          localObject3 = new LinearLayout.LayoutParams(-1, 0, 1.0F);
        }
        switch (mPromptPosition)
        {
        default: 
          Log.e("ListPopupWindow", "Invalid hint position " + mPromptPosition);
          localView.measure(View.MeasureSpec.makeMeasureSpec(mDropDownWidth, Integer.MIN_VALUE), 0);
          localObject2 = (LinearLayout.LayoutParams)localView.getLayoutParams();
          i = localView.getMeasuredHeight() + topMargin + bottomMargin;
          mPopup.setContentView((View)localObject1);
          k = 0;
          localObject1 = mPopup.getBackground();
          if (localObject1 != null)
          {
            ((Drawable)localObject1).getPadding(mTempRect);
            j = mTempRect.top + mTempRect.bottom;
            k = j;
            if (!mDropDownVerticalOffsetSet)
            {
              mDropDownVerticalOffset = (-mTempRect.top);
              k = j;
            }
            label379:
            if (mPopup.getInputMethodMode() != 2) {
              break label537;
            }
          }
          break;
        }
      }
    }
    int m;
    label537:
    for (;;)
    {
      m = mPopup.getMaxAvailableHeight(getAnchorView(), mDropDownVerticalOffset);
      if ((!mDropDownAlwaysVisible) && (mDropDownHeight != -1)) {
        break label540;
      }
      return m + k;
      bool = false;
      break;
      ((LinearLayout)localObject1).addView((View)localObject2, (ViewGroup.LayoutParams)localObject3);
      ((LinearLayout)localObject1).addView(localView);
      break label261;
      ((LinearLayout)localObject1).addView(localView);
      ((LinearLayout)localObject1).addView((View)localObject2, (ViewGroup.LayoutParams)localObject3);
      break label261;
      localObject1 = (ViewGroup)mPopup.getContentView();
      localObject1 = mPromptView;
      i = j;
      if (localObject1 == null) {
        break label314;
      }
      localObject2 = (LinearLayout.LayoutParams)((View)localObject1).getLayoutParams();
      i = ((View)localObject1).getMeasuredHeight() + topMargin + bottomMargin;
      break label314;
      mTempRect.setEmpty();
      break label379;
    }
    label540:
    switch (mDropDownWidth)
    {
    default: 
      j = View.MeasureSpec.makeMeasureSpec(mDropDownWidth, 1073741824);
    }
    for (;;)
    {
      m = mDropDownList.measureHeightOfChildrenCompat(j, 0, -1, m - i, -1);
      j = i;
      if (m > 0) {
        j = i + k;
      }
      return m + j;
      j = View.MeasureSpec.makeMeasureSpec(mContext.getResources().getDisplayMetrics().widthPixels - (mTempRect.left + mTempRect.right), Integer.MIN_VALUE);
      continue;
      j = View.MeasureSpec.makeMeasureSpec(mContext.getResources().getDisplayMetrics().widthPixels - (mTempRect.left + mTempRect.right), 1073741824);
    }
  }
  
  private void removePromptView()
  {
    if (mPromptView != null)
    {
      ViewParent localViewParent = mPromptView.getParent();
      if ((localViewParent instanceof ViewGroup)) {
        ((ViewGroup)localViewParent).removeView(mPromptView);
      }
    }
  }
  
  private void setPopupClipToScreenEnabled(boolean paramBoolean)
  {
    if (sClipToWindowEnabledMethod != null) {}
    try
    {
      sClipToWindowEnabledMethod.invoke(mPopup, new Object[] { Boolean.valueOf(paramBoolean) });
      return;
    }
    catch (Exception localException)
    {
      Log.i("ListPopupWindow", "Could not call setClipToScreenEnabled() on PopupWindow. Oh well.");
    }
  }
  
  public void clearListSelection()
  {
    DropDownListView localDropDownListView = mDropDownList;
    if (localDropDownListView != null)
    {
      DropDownListView.access$502(localDropDownListView, true);
      localDropDownListView.requestLayout();
    }
  }
  
  public void dismiss()
  {
    mPopup.dismiss();
    removePromptView();
    mPopup.setContentView(null);
    mDropDownList = null;
    mHandler.removeCallbacks(mResizePopupRunnable);
  }
  
  public View getAnchorView()
  {
    return mDropDownAnchorView;
  }
  
  public ListView getListView()
  {
    return mDropDownList;
  }
  
  public boolean isInputMethodNotNeeded()
  {
    return mPopup.getInputMethodMode() == 2;
  }
  
  public boolean isShowing()
  {
    return mPopup.isShowing();
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (mObserver == null) {
      mObserver = new PopupDataSetObserver(null);
    }
    for (;;)
    {
      mAdapter = paramListAdapter;
      if (mAdapter != null) {
        paramListAdapter.registerDataSetObserver(mObserver);
      }
      if (mDropDownList != null) {
        mDropDownList.setAdapter(mAdapter);
      }
      return;
      if (mAdapter != null) {
        mAdapter.unregisterDataSetObserver(mObserver);
      }
    }
  }
  
  public void setAnchorView(View paramView)
  {
    mDropDownAnchorView = paramView;
  }
  
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    mPopup.setBackgroundDrawable(paramDrawable);
  }
  
  public void setContentWidth(int paramInt)
  {
    Drawable localDrawable = mPopup.getBackground();
    if (localDrawable != null)
    {
      localDrawable.getPadding(mTempRect);
      mDropDownWidth = (mTempRect.left + mTempRect.right + paramInt);
      return;
    }
    setWidth(paramInt);
  }
  
  public void setDropDownGravity(int paramInt)
  {
    mDropDownGravity = paramInt;
  }
  
  public void setInputMethodMode(int paramInt)
  {
    mPopup.setInputMethodMode(paramInt);
  }
  
  public void setModal(boolean paramBoolean)
  {
    mModal = paramBoolean;
    mPopup.setFocusable(paramBoolean);
  }
  
  public void setOnDismissListener(PopupWindow.OnDismissListener paramOnDismissListener)
  {
    mPopup.setOnDismissListener(paramOnDismissListener);
  }
  
  public void setOnItemClickListener(AdapterView.OnItemClickListener paramOnItemClickListener)
  {
    mItemClickListener = paramOnItemClickListener;
  }
  
  public void setPromptPosition(int paramInt)
  {
    mPromptPosition = paramInt;
  }
  
  public void setWidth(int paramInt)
  {
    mDropDownWidth = paramInt;
  }
  
  public void show()
  {
    boolean bool1 = true;
    boolean bool2 = false;
    int k = -1;
    int j = buildDropDown();
    int i = 0;
    int m = 0;
    boolean bool3 = isInputMethodNotNeeded();
    label57:
    PopupWindow localPopupWindow;
    if (mPopup.isShowing())
    {
      if (mDropDownWidth == -1)
      {
        i = -1;
        if (mDropDownHeight != -1) {
          break label212;
        }
        if (!bool3) {
          break label171;
        }
        if (!bool3) {
          break label181;
        }
        localPopupWindow = mPopup;
        if (mDropDownWidth != -1) {
          break label176;
        }
        label76:
        localPopupWindow.setWindowLayoutMode(k, 0);
      }
      for (;;)
      {
        localPopupWindow = mPopup;
        bool1 = bool2;
        if (!mForceIgnoreOutsideTouch)
        {
          bool1 = bool2;
          if (!mDropDownAlwaysVisible) {
            bool1 = true;
          }
        }
        localPopupWindow.setOutsideTouchable(bool1);
        mPopup.update(getAnchorView(), mDropDownHorizontalOffset, mDropDownVerticalOffset, i, j);
        return;
        if (mDropDownWidth == -2)
        {
          i = getAnchorView().getWidth();
          break;
        }
        i = mDropDownWidth;
        break;
        label171:
        j = -1;
        break label57;
        label176:
        k = 0;
        break label76;
        label181:
        localPopupWindow = mPopup;
        if (mDropDownWidth == -1) {}
        for (k = -1;; k = 0)
        {
          localPopupWindow.setWindowLayoutMode(k, -1);
          break;
        }
        label212:
        if (mDropDownHeight != -2) {
          j = mDropDownHeight;
        }
      }
    }
    if (mDropDownWidth == -1)
    {
      i = -1;
      label242:
      if (mDropDownHeight != -1) {
        break label416;
      }
      j = -1;
      label252:
      mPopup.setWindowLayoutMode(i, j);
      setPopupClipToScreenEnabled(true);
      localPopupWindow = mPopup;
      if ((mForceIgnoreOutsideTouch) || (mDropDownAlwaysVisible)) {
        break label456;
      }
    }
    for (;;)
    {
      localPopupWindow.setOutsideTouchable(bool1);
      mPopup.setTouchInterceptor(mTouchInterceptor);
      PopupWindowCompat.showAsDropDown(mPopup, getAnchorView(), mDropDownHorizontalOffset, mDropDownVerticalOffset, mDropDownGravity);
      mDropDownList.setSelection(-1);
      if ((!mModal) || (mDropDownList.isInTouchMode())) {
        clearListSelection();
      }
      if (mModal) {
        break;
      }
      mHandler.post(mHideSelector);
      return;
      if (mDropDownWidth == -2)
      {
        mPopup.setWidth(getAnchorView().getWidth());
        break label242;
      }
      mPopup.setWidth(mDropDownWidth);
      break label242;
      label416:
      if (mDropDownHeight == -2)
      {
        mPopup.setHeight(j);
        j = m;
        break label252;
      }
      mPopup.setHeight(mDropDownHeight);
      j = m;
      break label252;
      label456:
      bool1 = false;
    }
  }
  
  private static class DropDownListView
    extends ListViewCompat
  {
    private ViewPropertyAnimatorCompat mClickAnimation;
    private boolean mDrawsInPressedState;
    private boolean mHijackFocus;
    private boolean mListSelectionHidden;
    private ListViewAutoScrollHelper mScrollHelper;
    
    public DropDownListView(Context paramContext, boolean paramBoolean)
    {
      super(null, R.attr.dropDownListViewStyle);
      mHijackFocus = paramBoolean;
      setCacheColorHint(0);
    }
    
    private void clearPressedItem()
    {
      mDrawsInPressedState = false;
      setPressed(false);
      drawableStateChanged();
      if (mClickAnimation != null)
      {
        mClickAnimation.cancel();
        mClickAnimation = null;
      }
    }
    
    private void clickPressedItem(View paramView, int paramInt)
    {
      performItemClick(paramView, paramInt, getItemIdAtPosition(paramInt));
    }
    
    private void setPressedItem(View paramView, int paramInt, float paramFloat1, float paramFloat2)
    {
      mDrawsInPressedState = true;
      setPressed(true);
      layoutChildren();
      setSelection(paramInt);
      positionSelectorLikeTouchCompat(paramInt, paramView, paramFloat1, paramFloat2);
      setSelectorEnabled(false);
      refreshDrawableState();
    }
    
    public boolean hasFocus()
    {
      return (mHijackFocus) || (super.hasFocus());
    }
    
    public boolean hasWindowFocus()
    {
      return (mHijackFocus) || (super.hasWindowFocus());
    }
    
    public boolean isFocused()
    {
      return (mHijackFocus) || (super.isFocused());
    }
    
    public boolean isInTouchMode()
    {
      return ((mHijackFocus) && (mListSelectionHidden)) || (super.isInTouchMode());
    }
    
    public boolean onForwardedEvent(MotionEvent paramMotionEvent, int paramInt)
    {
      boolean bool1 = true;
      boolean bool2 = true;
      int i = 0;
      int j = MotionEventCompat.getActionMasked(paramMotionEvent);
      switch (j)
      {
      default: 
        bool1 = bool2;
        paramInt = i;
        if ((!bool1) || (paramInt != 0)) {
          clearPressedItem();
        }
        if (bool1)
        {
          if (mScrollHelper == null) {
            mScrollHelper = new ListViewAutoScrollHelper(this);
          }
          mScrollHelper.setEnabled(true);
          mScrollHelper.onTouch(this, paramMotionEvent);
        }
        break;
      }
      while (mScrollHelper == null)
      {
        return bool1;
        bool1 = false;
        paramInt = i;
        break;
        bool1 = false;
        int k = paramMotionEvent.findPointerIndex(paramInt);
        if (k < 0)
        {
          bool1 = false;
          paramInt = i;
          break;
        }
        paramInt = (int)paramMotionEvent.getX(k);
        int m = (int)paramMotionEvent.getY(k);
        k = pointToPosition(paramInt, m);
        if (k == -1)
        {
          paramInt = 1;
          break;
        }
        View localView = getChildAt(k - getFirstVisiblePosition());
        setPressedItem(localView, k, paramInt, m);
        bool2 = true;
        paramInt = i;
        bool1 = bool2;
        if (j != 1) {
          break;
        }
        clickPressedItem(localView, k);
        paramInt = i;
        bool1 = bool2;
        break;
      }
      mScrollHelper.setEnabled(false);
      return bool1;
    }
    
    protected boolean touchModeDrawsInPressedStateCompat()
    {
      return (mDrawsInPressedState) || (super.touchModeDrawsInPressedStateCompat());
    }
  }
  
  public static abstract class ForwardingListener
    implements View.OnTouchListener
  {
    private int mActivePointerId;
    private Runnable mDisallowIntercept;
    private boolean mForwarding;
    private final int mLongPressTimeout;
    private final float mScaledTouchSlop;
    private final View mSrc;
    private final int mTapTimeout;
    private final int[] mTmpLocation = new int[2];
    private Runnable mTriggerLongPress;
    private boolean mWasLongPress;
    
    public ForwardingListener(View paramView)
    {
      mSrc = paramView;
      mScaledTouchSlop = ViewConfiguration.get(paramView.getContext()).getScaledTouchSlop();
      mTapTimeout = ViewConfiguration.getTapTimeout();
      mLongPressTimeout = ((mTapTimeout + ViewConfiguration.getLongPressTimeout()) / 2);
    }
    
    private void clearCallbacks()
    {
      if (mTriggerLongPress != null) {
        mSrc.removeCallbacks(mTriggerLongPress);
      }
      if (mDisallowIntercept != null) {
        mSrc.removeCallbacks(mDisallowIntercept);
      }
    }
    
    private void onLongPress()
    {
      clearCallbacks();
      View localView = mSrc;
      if ((!localView.isEnabled()) || (localView.isLongClickable())) {}
      while (!onForwardingStarted()) {
        return;
      }
      localView.getParent().requestDisallowInterceptTouchEvent(true);
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l, l, 3, 0.0F, 0.0F, 0);
      localView.onTouchEvent(localMotionEvent);
      localMotionEvent.recycle();
      mForwarding = true;
      mWasLongPress = true;
    }
    
    private boolean onTouchForwarded(MotionEvent paramMotionEvent)
    {
      boolean bool1 = true;
      View localView = mSrc;
      Object localObject = getPopup();
      if ((localObject == null) || (!((ListPopupWindow)localObject).isShowing())) {}
      do
      {
        return false;
        localObject = mDropDownList;
      } while ((localObject == null) || (!((ListPopupWindow.DropDownListView)localObject).isShown()));
      MotionEvent localMotionEvent = MotionEvent.obtainNoHistory(paramMotionEvent);
      toGlobalMotionEvent(localView, localMotionEvent);
      toLocalMotionEvent((View)localObject, localMotionEvent);
      boolean bool2 = ((ListPopupWindow.DropDownListView)localObject).onForwardedEvent(localMotionEvent, mActivePointerId);
      localMotionEvent.recycle();
      int i = MotionEventCompat.getActionMasked(paramMotionEvent);
      if ((i != 1) && (i != 3))
      {
        i = 1;
        if ((!bool2) || (i == 0)) {
          break label124;
        }
      }
      for (;;)
      {
        return bool1;
        i = 0;
        break;
        label124:
        bool1 = false;
      }
    }
    
    private boolean onTouchObserved(MotionEvent paramMotionEvent)
    {
      View localView = mSrc;
      if (!localView.isEnabled()) {}
      int i;
      do
      {
        return false;
        switch (MotionEventCompat.getActionMasked(paramMotionEvent))
        {
        default: 
          return false;
        case 0: 
          mActivePointerId = paramMotionEvent.getPointerId(0);
          mWasLongPress = false;
          if (mDisallowIntercept == null) {
            mDisallowIntercept = new DisallowIntercept(null);
          }
          localView.postDelayed(mDisallowIntercept, mTapTimeout);
          if (mTriggerLongPress == null) {
            mTriggerLongPress = new TriggerLongPress(null);
          }
          localView.postDelayed(mTriggerLongPress, mLongPressTimeout);
          return false;
        case 2: 
          i = paramMotionEvent.findPointerIndex(mActivePointerId);
        }
      } while ((i < 0) || (pointInView(localView, paramMotionEvent.getX(i), paramMotionEvent.getY(i), mScaledTouchSlop)));
      clearCallbacks();
      localView.getParent().requestDisallowInterceptTouchEvent(true);
      return true;
      clearCallbacks();
      return false;
    }
    
    private static boolean pointInView(View paramView, float paramFloat1, float paramFloat2, float paramFloat3)
    {
      return (paramFloat1 >= -paramFloat3) && (paramFloat2 >= -paramFloat3) && (paramFloat1 < paramView.getRight() - paramView.getLeft() + paramFloat3) && (paramFloat2 < paramView.getBottom() - paramView.getTop() + paramFloat3);
    }
    
    private boolean toGlobalMotionEvent(View paramView, MotionEvent paramMotionEvent)
    {
      int[] arrayOfInt = mTmpLocation;
      paramView.getLocationOnScreen(arrayOfInt);
      paramMotionEvent.offsetLocation(arrayOfInt[0], arrayOfInt[1]);
      return true;
    }
    
    private boolean toLocalMotionEvent(View paramView, MotionEvent paramMotionEvent)
    {
      int[] arrayOfInt = mTmpLocation;
      paramView.getLocationOnScreen(arrayOfInt);
      paramMotionEvent.offsetLocation(-arrayOfInt[0], -arrayOfInt[1]);
      return true;
    }
    
    public abstract ListPopupWindow getPopup();
    
    protected boolean onForwardingStarted()
    {
      ListPopupWindow localListPopupWindow = getPopup();
      if ((localListPopupWindow != null) && (!localListPopupWindow.isShowing())) {
        localListPopupWindow.show();
      }
      return true;
    }
    
    protected boolean onForwardingStopped()
    {
      ListPopupWindow localListPopupWindow = getPopup();
      if ((localListPopupWindow != null) && (localListPopupWindow.isShowing())) {
        localListPopupWindow.dismiss();
      }
      return true;
    }
    
    public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
    {
      boolean bool3 = false;
      boolean bool4 = mForwarding;
      boolean bool1;
      if (bool4)
      {
        if (mWasLongPress)
        {
          bool1 = onTouchForwarded(paramMotionEvent);
          mForwarding = bool1;
          if (!bool1)
          {
            bool1 = bool3;
            if (!bool4) {}
          }
          else
          {
            bool1 = true;
          }
          return bool1;
        }
        if ((onTouchForwarded(paramMotionEvent)) || (!onForwardingStopped())) {}
        for (bool1 = true;; bool1 = false) {
          break;
        }
      }
      if ((onTouchObserved(paramMotionEvent)) && (onForwardingStarted())) {}
      for (boolean bool2 = true;; bool2 = false)
      {
        bool1 = bool2;
        if (!bool2) {
          break;
        }
        long l = SystemClock.uptimeMillis();
        paramView = MotionEvent.obtain(l, l, 3, 0.0F, 0.0F, 0);
        mSrc.onTouchEvent(paramView);
        paramView.recycle();
        bool1 = bool2;
        break;
      }
    }
    
    private class DisallowIntercept
      implements Runnable
    {
      private DisallowIntercept() {}
      
      public void run()
      {
        mSrc.getParent().requestDisallowInterceptTouchEvent(true);
      }
    }
    
    private class TriggerLongPress
      implements Runnable
    {
      private TriggerLongPress() {}
      
      public void run()
      {
        ListPopupWindow.ForwardingListener.this.onLongPress();
      }
    }
  }
  
  private class ListSelectorHider
    implements Runnable
  {
    private ListSelectorHider() {}
    
    public void run()
    {
      clearListSelection();
    }
  }
  
  private class PopupDataSetObserver
    extends DataSetObserver
  {
    private PopupDataSetObserver() {}
    
    public void onChanged()
    {
      if (isShowing()) {
        show();
      }
    }
    
    public void onInvalidated()
    {
      dismiss();
    }
  }
  
  private class PopupScrollListener
    implements AbsListView.OnScrollListener
  {
    private PopupScrollListener() {}
    
    public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
    
    public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
    {
      if ((paramInt == 1) && (!isInputMethodNotNeeded()) && (mPopup.getContentView() != null))
      {
        mHandler.removeCallbacks(mResizePopupRunnable);
        mResizePopupRunnable.run();
      }
    }
  }
  
  private class PopupTouchInterceptor
    implements View.OnTouchListener
  {
    private PopupTouchInterceptor() {}
    
    public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
    {
      int i = paramMotionEvent.getAction();
      int j = (int)paramMotionEvent.getX();
      int k = (int)paramMotionEvent.getY();
      if ((i == 0) && (mPopup != null) && (mPopup.isShowing()) && (j >= 0) && (j < mPopup.getWidth()) && (k >= 0) && (k < mPopup.getHeight())) {
        mHandler.postDelayed(mResizePopupRunnable, 250L);
      }
      for (;;)
      {
        return false;
        if (i == 1) {
          mHandler.removeCallbacks(mResizePopupRunnable);
        }
      }
    }
  }
  
  private class ResizePopupRunnable
    implements Runnable
  {
    private ResizePopupRunnable() {}
    
    public void run()
    {
      if ((mDropDownList != null) && (mDropDownList.getCount() > mDropDownList.getChildCount()) && (mDropDownList.getChildCount() <= mListItemExpandMaximum))
      {
        mPopup.setInputMethodMode(2);
        show();
      }
    }
  }
}
