package android.support.design.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.design.R.anim;
import android.support.design.R.dimen;
import android.support.design.R.id;
import android.support.design.R.layout;
import android.support.design.R.styleable;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.text.Layout;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.LinearLayout;
import android.widget.TextView;

public class Snackbar
{
  private static final Handler sHandler = new Handler(Looper.getMainLooper(), new Handler.Callback()
  {
    public boolean handleMessage(Message paramAnonymousMessage)
    {
      switch (what)
      {
      default: 
        return false;
      case 0: 
        ((Snackbar)obj).showView();
        return true;
      }
      ((Snackbar)obj).hideView();
      return true;
    }
  });
  private final SnackbarManager.Callback mManagerCallback;
  private final ViewGroup mParent;
  private final SnackbarLayout mView;
  
  private void animateViewIn()
  {
    if (Build.VERSION.SDK_INT >= 14)
    {
      ViewCompat.setTranslationY(mView, mView.getHeight());
      ViewCompat.animate(mView).translationY(0.0F).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setDuration(250L).setListener(new ViewPropertyAnimatorListenerAdapter()
      {
        public void onAnimationEnd(View paramAnonymousView)
        {
          SnackbarManager.getInstance().onShown(mManagerCallback);
        }
        
        public void onAnimationStart(View paramAnonymousView)
        {
          mView.animateChildrenIn(70, 180);
        }
      }).start();
      return;
    }
    Animation localAnimation = android.view.animation.AnimationUtils.loadAnimation(mView.getContext(), R.anim.snackbar_in);
    localAnimation.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
    localAnimation.setDuration(250L);
    localAnimation.setAnimationListener(new Animation.AnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation)
      {
        SnackbarManager.getInstance().onShown(mManagerCallback);
      }
      
      public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
      
      public void onAnimationStart(Animation paramAnonymousAnimation) {}
    });
    mView.startAnimation(localAnimation);
  }
  
  private void animateViewOut()
  {
    if (Build.VERSION.SDK_INT >= 14)
    {
      ViewCompat.animate(mView).translationY(mView.getHeight()).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setDuration(250L).setListener(new ViewPropertyAnimatorListenerAdapter()
      {
        public void onAnimationEnd(View paramAnonymousView)
        {
          Snackbar.this.onViewHidden();
        }
        
        public void onAnimationStart(View paramAnonymousView)
        {
          mView.animateChildrenOut(0, 180);
        }
      }).start();
      return;
    }
    Animation localAnimation = android.view.animation.AnimationUtils.loadAnimation(mView.getContext(), R.anim.snackbar_out);
    localAnimation.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
    localAnimation.setDuration(250L);
    localAnimation.setAnimationListener(new Animation.AnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation)
      {
        Snackbar.this.onViewHidden();
      }
      
      public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
      
      public void onAnimationStart(Animation paramAnonymousAnimation) {}
    });
    mView.startAnimation(localAnimation);
  }
  
  private boolean isBeingDragged()
  {
    boolean bool2 = false;
    Object localObject = mView.getLayoutParams();
    boolean bool1 = bool2;
    if ((localObject instanceof CoordinatorLayout.LayoutParams))
    {
      localObject = ((CoordinatorLayout.LayoutParams)localObject).getBehavior();
      bool1 = bool2;
      if ((localObject instanceof SwipeDismissBehavior))
      {
        bool1 = bool2;
        if (((SwipeDismissBehavior)localObject).getDragState() != 0) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  private void onViewHidden()
  {
    mParent.removeView(mView);
    SnackbarManager.getInstance().onDismissed(mManagerCallback);
  }
  
  public void dismiss()
  {
    SnackbarManager.getInstance().dismiss(mManagerCallback);
  }
  
  final void hideView()
  {
    if ((mView.getVisibility() != 0) || (isBeingDragged()))
    {
      onViewHidden();
      return;
    }
    animateViewOut();
  }
  
  final void showView()
  {
    if (mView.getParent() == null)
    {
      ViewGroup.LayoutParams localLayoutParams = mView.getLayoutParams();
      if ((localLayoutParams instanceof CoordinatorLayout.LayoutParams))
      {
        Behavior localBehavior = new Behavior();
        localBehavior.setStartAlphaSwipeDistance(0.1F);
        localBehavior.setEndAlphaSwipeDistance(0.6F);
        localBehavior.setSwipeDirection(0);
        localBehavior.setListener(new SwipeDismissBehavior.OnDismissListener()
        {
          public void onDismiss(View paramAnonymousView)
          {
            dismiss();
          }
          
          public void onDragStateChanged(int paramAnonymousInt)
          {
            switch (paramAnonymousInt)
            {
            default: 
              return;
            case 1: 
            case 2: 
              SnackbarManager.getInstance().cancelTimeout(mManagerCallback);
              return;
            }
            SnackbarManager.getInstance().restoreTimeout(mManagerCallback);
          }
        });
        ((CoordinatorLayout.LayoutParams)localLayoutParams).setBehavior(localBehavior);
      }
      mParent.addView(mView);
    }
    if (ViewCompat.isLaidOut(mView))
    {
      animateViewIn();
      return;
    }
    mView.setOnLayoutChangeListener(new Snackbar.SnackbarLayout.OnLayoutChangeListener()
    {
      public void onLayoutChange(View paramAnonymousView, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3, int paramAnonymousInt4)
      {
        Snackbar.this.animateViewIn();
        mView.setOnLayoutChangeListener(null);
      }
    });
  }
  
  final class Behavior
    extends SwipeDismissBehavior<Snackbar.SnackbarLayout>
  {
    Behavior() {}
    
    public boolean onInterceptTouchEvent(CoordinatorLayout paramCoordinatorLayout, Snackbar.SnackbarLayout paramSnackbarLayout, MotionEvent paramMotionEvent)
    {
      if (paramCoordinatorLayout.isPointInChildBounds(paramSnackbarLayout, (int)paramMotionEvent.getX(), (int)paramMotionEvent.getY())) {
        switch (paramMotionEvent.getActionMasked())
        {
        }
      }
      for (;;)
      {
        return super.onInterceptTouchEvent(paramCoordinatorLayout, paramSnackbarLayout, paramMotionEvent);
        SnackbarManager.getInstance().cancelTimeout(mManagerCallback);
        continue;
        SnackbarManager.getInstance().restoreTimeout(mManagerCallback);
      }
    }
  }
  
  public static class SnackbarLayout
    extends LinearLayout
  {
    private TextView mActionView;
    private int mMaxInlineActionWidth;
    private int mMaxWidth;
    private TextView mMessageView;
    private OnLayoutChangeListener mOnLayoutChangeListener;
    
    public SnackbarLayout(Context paramContext)
    {
      this(paramContext, null);
    }
    
    public SnackbarLayout(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.SnackbarLayout);
      mMaxWidth = paramAttributeSet.getDimensionPixelSize(R.styleable.SnackbarLayout_android_maxWidth, -1);
      mMaxInlineActionWidth = paramAttributeSet.getDimensionPixelSize(R.styleable.SnackbarLayout_maxActionInlineWidth, -1);
      if (paramAttributeSet.hasValue(R.styleable.SnackbarLayout_elevation)) {
        ViewCompat.setElevation(this, paramAttributeSet.getDimensionPixelSize(R.styleable.SnackbarLayout_elevation, 0));
      }
      paramAttributeSet.recycle();
      setClickable(true);
      LayoutInflater.from(paramContext).inflate(R.layout.layout_snackbar_include, this);
    }
    
    private static void updateTopBottomPadding(View paramView, int paramInt1, int paramInt2)
    {
      if (ViewCompat.isPaddingRelative(paramView))
      {
        ViewCompat.setPaddingRelative(paramView, ViewCompat.getPaddingStart(paramView), paramInt1, ViewCompat.getPaddingEnd(paramView), paramInt2);
        return;
      }
      paramView.setPadding(paramView.getPaddingLeft(), paramInt1, paramView.getPaddingRight(), paramInt2);
    }
    
    private boolean updateViewsWithinLayout(int paramInt1, int paramInt2, int paramInt3)
    {
      boolean bool = false;
      if (paramInt1 != getOrientation())
      {
        setOrientation(paramInt1);
        bool = true;
      }
      if ((mMessageView.getPaddingTop() != paramInt2) || (mMessageView.getPaddingBottom() != paramInt3))
      {
        updateTopBottomPadding(mMessageView, paramInt2, paramInt3);
        bool = true;
      }
      return bool;
    }
    
    void animateChildrenIn(int paramInt1, int paramInt2)
    {
      ViewCompat.setAlpha(mMessageView, 0.0F);
      ViewCompat.animate(mMessageView).alpha(1.0F).setDuration(paramInt2).setStartDelay(paramInt1).start();
      if (mActionView.getVisibility() == 0)
      {
        ViewCompat.setAlpha(mActionView, 0.0F);
        ViewCompat.animate(mActionView).alpha(1.0F).setDuration(paramInt2).setStartDelay(paramInt1).start();
      }
    }
    
    void animateChildrenOut(int paramInt1, int paramInt2)
    {
      ViewCompat.setAlpha(mMessageView, 1.0F);
      ViewCompat.animate(mMessageView).alpha(0.0F).setDuration(paramInt2).setStartDelay(paramInt1).start();
      if (mActionView.getVisibility() == 0)
      {
        ViewCompat.setAlpha(mActionView, 1.0F);
        ViewCompat.animate(mActionView).alpha(0.0F).setDuration(paramInt2).setStartDelay(paramInt1).start();
      }
    }
    
    TextView getActionView()
    {
      return mActionView;
    }
    
    TextView getMessageView()
    {
      return mMessageView;
    }
    
    protected void onFinishInflate()
    {
      super.onFinishInflate();
      mMessageView = ((TextView)findViewById(R.id.snackbar_text));
      mActionView = ((TextView)findViewById(R.id.snackbar_action));
    }
    
    protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
      if ((paramBoolean) && (mOnLayoutChangeListener != null)) {
        mOnLayoutChangeListener.onLayoutChange(this, paramInt1, paramInt2, paramInt3, paramInt4);
      }
    }
    
    protected void onMeasure(int paramInt1, int paramInt2)
    {
      super.onMeasure(paramInt1, paramInt2);
      int i = paramInt1;
      if (mMaxWidth > 0)
      {
        i = paramInt1;
        if (getMeasuredWidth() > mMaxWidth)
        {
          i = View.MeasureSpec.makeMeasureSpec(mMaxWidth, 1073741824);
          super.onMeasure(i, paramInt2);
        }
      }
      int j = getResources().getDimensionPixelSize(R.dimen.snackbar_padding_vertical_2lines);
      int k = getResources().getDimensionPixelSize(R.dimen.snackbar_padding_vertical);
      if (mMessageView.getLayout().getLineCount() > 1) {}
      int m;
      for (paramInt1 = 1;; paramInt1 = 0)
      {
        m = 0;
        if ((paramInt1 == 0) || (mMaxInlineActionWidth <= 0) || (mActionView.getMeasuredWidth() <= mMaxInlineActionWidth)) {
          break;
        }
        paramInt1 = m;
        if (updateViewsWithinLayout(1, j, j - k)) {
          paramInt1 = 1;
        }
        if (paramInt1 != 0) {
          super.onMeasure(i, paramInt2);
        }
        return;
      }
      if (paramInt1 != 0) {}
      for (;;)
      {
        paramInt1 = m;
        if (!updateViewsWithinLayout(0, j, j)) {
          break;
        }
        paramInt1 = 1;
        break;
        j = k;
      }
    }
    
    void setOnLayoutChangeListener(OnLayoutChangeListener paramOnLayoutChangeListener)
    {
      mOnLayoutChangeListener = paramOnLayoutChangeListener;
    }
    
    static abstract interface OnLayoutChangeListener
    {
      public abstract void onLayoutChange(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
    }
  }
}
