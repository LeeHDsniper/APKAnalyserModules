package com.getbase.floatingactionbutton;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.TouchDelegate;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.TextView;

public class FloatingActionsMenu
  extends ViewGroup
{
  private static Interpolator sAlphaExpandInterpolator = new DecelerateInterpolator();
  private static Interpolator sCollapseInterpolator;
  private static Interpolator sExpandInterpolator = new OvershootInterpolator();
  private AddFloatingActionButton mAddButton;
  private int mAddButtonColorNormal;
  private int mAddButtonColorPressed;
  private int mAddButtonPlusColor;
  private int mAddButtonSize;
  private boolean mAddButtonStrokeVisible;
  private int mButtonSpacing;
  private int mButtonsCount;
  private AnimatorSet mCollapseAnimation = new AnimatorSet().setDuration(300L);
  private AnimatorSet mExpandAnimation = new AnimatorSet().setDuration(300L);
  private int mExpandDirection;
  private boolean mExpanded;
  private int mLabelsMargin;
  private int mLabelsPosition;
  private int mLabelsStyle;
  private int mLabelsVerticalOffset;
  private OnFloatingActionsMenuUpdateListener mListener;
  private int mMaxButtonHeight;
  private int mMaxButtonWidth;
  private RotatingDrawable mRotatingDrawable;
  private TouchDelegateGroup mTouchDelegateGroup;
  
  static
  {
    sCollapseInterpolator = new DecelerateInterpolator(3.0F);
  }
  
  public FloatingActionsMenu(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public FloatingActionsMenu(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }
  
  public FloatingActionsMenu(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }
  
  private int adjustForOvershoot(int paramInt)
  {
    return paramInt * 12 / 10;
  }
  
  private void createAddButton(Context paramContext)
  {
    mAddButton = new AddFloatingActionButton(paramContext)
    {
      Drawable getIconDrawable()
      {
        FloatingActionsMenu.RotatingDrawable localRotatingDrawable = new FloatingActionsMenu.RotatingDrawable(super.getIconDrawable());
        FloatingActionsMenu.access$402(FloatingActionsMenu.this, localRotatingDrawable);
        OvershootInterpolator localOvershootInterpolator = new OvershootInterpolator();
        ObjectAnimator localObjectAnimator1 = ObjectAnimator.ofFloat(localRotatingDrawable, "rotation", new float[] { 135.0F, 0.0F });
        ObjectAnimator localObjectAnimator2 = ObjectAnimator.ofFloat(localRotatingDrawable, "rotation", new float[] { 0.0F, 135.0F });
        localObjectAnimator1.setInterpolator(localOvershootInterpolator);
        localObjectAnimator2.setInterpolator(localOvershootInterpolator);
        mExpandAnimation.play(localObjectAnimator2);
        mCollapseAnimation.play(localObjectAnimator1);
        return localRotatingDrawable;
      }
      
      void updateBackground()
      {
        mPlusColor = mAddButtonPlusColor;
        mColorNormal = mAddButtonColorNormal;
        mColorPressed = mAddButtonColorPressed;
        mStrokeVisible = mAddButtonStrokeVisible;
        super.updateBackground();
      }
    };
    mAddButton.setId(R.id.fab_expand_menu_button);
    mAddButton.setSize(mAddButtonSize);
    mAddButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        toggle();
      }
    });
    addView(mAddButton, super.generateDefaultLayoutParams());
  }
  
  private void createLabels()
  {
    ContextThemeWrapper localContextThemeWrapper = new ContextThemeWrapper(getContext(), mLabelsStyle);
    int i = 0;
    if (i < mButtonsCount)
    {
      FloatingActionButton localFloatingActionButton = (FloatingActionButton)getChildAt(i);
      Object localObject = localFloatingActionButton.getTitle();
      if ((localFloatingActionButton == mAddButton) || (localObject == null) || (localFloatingActionButton.getTag(R.id.fab_label) != null)) {}
      for (;;)
      {
        i += 1;
        break;
        localObject = new TextView(localContextThemeWrapper);
        ((TextView)localObject).setTextAppearance(getContext(), mLabelsStyle);
        ((TextView)localObject).setText(localFloatingActionButton.getTitle());
        addView((View)localObject);
        localFloatingActionButton.setTag(R.id.fab_label, localObject);
      }
    }
  }
  
  private boolean expandsHorizontally()
  {
    return (mExpandDirection == 2) || (mExpandDirection == 3);
  }
  
  private int getColor(int paramInt)
  {
    return getResources().getColor(paramInt);
  }
  
  private void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    mButtonSpacing = ((int)(getResources().getDimension(R.dimen.fab_actions_spacing) - getResources().getDimension(R.dimen.fab_shadow_radius) - getResources().getDimension(R.dimen.fab_shadow_offset)));
    mLabelsMargin = getResources().getDimensionPixelSize(R.dimen.fab_labels_margin);
    mLabelsVerticalOffset = getResources().getDimensionPixelSize(R.dimen.fab_shadow_offset);
    mTouchDelegateGroup = new TouchDelegateGroup(this);
    setTouchDelegate(mTouchDelegateGroup);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.FloatingActionsMenu, 0, 0);
    mAddButtonPlusColor = paramAttributeSet.getColor(R.styleable.FloatingActionsMenu_fab_addButtonPlusIconColor, getColor(17170443));
    mAddButtonColorNormal = paramAttributeSet.getColor(R.styleable.FloatingActionsMenu_fab_addButtonColorNormal, getColor(17170451));
    mAddButtonColorPressed = paramAttributeSet.getColor(R.styleable.FloatingActionsMenu_fab_addButtonColorPressed, getColor(17170450));
    mAddButtonSize = paramAttributeSet.getInt(R.styleable.FloatingActionsMenu_fab_addButtonSize, 0);
    mAddButtonStrokeVisible = paramAttributeSet.getBoolean(R.styleable.FloatingActionsMenu_fab_addButtonStrokeVisible, true);
    mExpandDirection = paramAttributeSet.getInt(R.styleable.FloatingActionsMenu_fab_expandDirection, 0);
    mLabelsStyle = paramAttributeSet.getResourceId(R.styleable.FloatingActionsMenu_fab_labelStyle, 0);
    mLabelsPosition = paramAttributeSet.getInt(R.styleable.FloatingActionsMenu_fab_labelsPosition, 0);
    paramAttributeSet.recycle();
    if ((mLabelsStyle != 0) && (expandsHorizontally())) {
      throw new IllegalStateException("Action labels in horizontal expand orientation is not supported.");
    }
    createAddButton(paramContext);
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return super.checkLayoutParams(paramLayoutParams);
  }
  
  public void collapse()
  {
    if (mExpanded)
    {
      mExpanded = false;
      mTouchDelegateGroup.setEnabled(false);
      mCollapseAnimation.start();
      mExpandAnimation.cancel();
      if (mListener != null) {
        mListener.onMenuCollapsed();
      }
    }
  }
  
  public void expand()
  {
    if (!mExpanded)
    {
      mExpanded = true;
      mTouchDelegateGroup.setEnabled(true);
      mCollapseAnimation.cancel();
      mExpandAnimation.start();
      if (mListener != null) {
        mListener.onMenuExpanded();
      }
    }
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(super.generateDefaultLayoutParams());
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(super.generateLayoutParams(paramAttributeSet));
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return new LayoutParams(super.generateLayoutParams(paramLayoutParams));
  }
  
  public boolean isExpanded()
  {
    return mExpanded;
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    bringChildToFront(mAddButton);
    mButtonsCount = getChildCount();
    if (mLabelsStyle != 0) {
      createLabels();
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i;
    label47:
    label77:
    label97:
    label163:
    int j;
    View localView;
    label240:
    label246:
    label257:
    label265:
    label284:
    label310:
    float f1;
    float f2;
    label353:
    label370:
    Object localObject1;
    switch (mExpandDirection)
    {
    default: 
      return;
    case 0: 
    case 1: 
      if (mExpandDirection == 0)
      {
        i = 1;
        if (paramBoolean) {
          mTouchDelegateGroup.clearTouchDelegates();
        }
        if (i == 0) {
          break label240;
        }
        paramInt4 = paramInt4 - paramInt2 - mAddButton.getMeasuredHeight();
        if (mLabelsPosition != 0) {
          break label246;
        }
        paramInt3 = paramInt3 - paramInt1 - mMaxButtonWidth / 2;
        paramInt1 = paramInt3 - mAddButton.getMeasuredWidth() / 2;
        mAddButton.layout(paramInt1, paramInt4, mAddButton.getMeasuredWidth() + paramInt1, mAddButton.getMeasuredHeight() + paramInt4);
        paramInt1 = mMaxButtonWidth / 2 + mLabelsMargin;
        if (mLabelsPosition != 0) {
          break label257;
        }
        paramInt1 = paramInt3 - paramInt1;
        if (i == 0) {
          break label265;
        }
      }
      int k;
      for (paramInt2 = paramInt4 - mButtonSpacing;; paramInt2 = mAddButton.getMeasuredHeight() + paramInt4 + mButtonSpacing)
      {
        j = mButtonsCount - 1;
        while (j >= 0)
        {
          localView = getChildAt(j);
          k = paramInt2;
          if (localView != mAddButton)
          {
            if (localView.getVisibility() != 8) {
              break label284;
            }
            k = paramInt2;
          }
          j -= 1;
          paramInt2 = k;
        }
        i = 0;
        break label47;
        paramInt4 = 0;
        break label77;
        paramInt3 = mMaxButtonWidth / 2;
        break label97;
        paramInt1 = paramInt3 + paramInt1;
        break label163;
      }
      int n = paramInt3 - localView.getMeasuredWidth() / 2;
      label467:
      int m;
      if (i != 0)
      {
        k = paramInt2 - localView.getMeasuredHeight();
        localView.layout(n, k, localView.getMeasuredWidth() + n, localView.getMeasuredHeight() + k);
        f1 = paramInt4 - k;
        if (!mExpanded) {
          break label713;
        }
        f2 = 0.0F;
        localView.setTranslationY(f2);
        if (!mExpanded) {
          break label720;
        }
        f2 = 1.0F;
        localView.setAlpha(f2);
        localObject1 = (LayoutParams)localView.getLayoutParams();
        mCollapseDir.setFloatValues(new float[] { 0.0F, f1 });
        mExpandDir.setFloatValues(new float[] { f1, 0.0F });
        ((LayoutParams)localObject1).setAnimationsTarget(localView);
        localObject1 = (View)localView.getTag(R.id.fab_label);
        if (localObject1 != null)
        {
          if (mLabelsPosition != 0) {
            break label726;
          }
          paramInt2 = paramInt1 - ((View)localObject1).getMeasuredWidth();
          if (mLabelsPosition != 0) {
            break label737;
          }
          m = paramInt2;
          label477:
          if (mLabelsPosition != 0) {
            break label743;
          }
          paramInt2 = paramInt1;
          label486:
          int i1 = k - mLabelsVerticalOffset + (localView.getMeasuredHeight() - ((View)localObject1).getMeasuredHeight()) / 2;
          ((View)localObject1).layout(m, i1, paramInt2, ((View)localObject1).getMeasuredHeight() + i1);
          Object localObject2 = new Rect(Math.min(n, m), k - mButtonSpacing / 2, Math.max(localView.getMeasuredWidth() + n, paramInt2), localView.getMeasuredHeight() + k + mButtonSpacing / 2);
          mTouchDelegateGroup.addTouchDelegate(new TouchDelegate((Rect)localObject2, localView));
          if (!mExpanded) {
            break label746;
          }
          f2 = 0.0F;
          label607:
          ((View)localObject1).setTranslationY(f2);
          if (!mExpanded) {
            break label753;
          }
          f2 = 1.0F;
          label624:
          ((View)localObject1).setAlpha(f2);
          localObject2 = (LayoutParams)((View)localObject1).getLayoutParams();
          mCollapseDir.setFloatValues(new float[] { 0.0F, f1 });
          mExpandDir.setFloatValues(new float[] { f1, 0.0F });
          ((LayoutParams)localObject2).setAnimationsTarget((View)localObject1);
        }
        if (i == 0) {
          break label759;
        }
      }
      label713:
      label720:
      label726:
      label737:
      label743:
      label746:
      label753:
      label759:
      for (paramInt2 = k - mButtonSpacing;; paramInt2 = localView.getMeasuredHeight() + k + mButtonSpacing)
      {
        k = paramInt2;
        break;
        k = paramInt2;
        break label310;
        f2 = f1;
        break label353;
        f2 = 0.0F;
        break label370;
        paramInt2 = paramInt1 + ((View)localObject1).getMeasuredWidth();
        break label467;
        m = paramInt1;
        break label477;
        break label486;
        f2 = f1;
        break label607;
        f2 = 0.0F;
        break label624;
      }
    }
    if (mExpandDirection == 2)
    {
      i = 1;
      label787:
      if (i == 0) {
        break label935;
      }
      paramInt3 = paramInt3 - paramInt1 - mAddButton.getMeasuredWidth();
      label806:
      j = paramInt4 - paramInt2 - mMaxButtonHeight + (mMaxButtonHeight - mAddButton.getMeasuredHeight()) / 2;
      mAddButton.layout(paramInt3, j, mAddButton.getMeasuredWidth() + paramInt3, mAddButton.getMeasuredHeight() + j);
      if (i == 0) {
        break label941;
      }
    }
    label935:
    label941:
    for (paramInt1 = paramInt3 - mButtonSpacing;; paramInt1 = mAddButton.getMeasuredWidth() + paramInt3 + mButtonSpacing)
    {
      paramInt2 = mButtonsCount - 1;
      while (paramInt2 >= 0)
      {
        localView = getChildAt(paramInt2);
        paramInt4 = paramInt1;
        if (localView != mAddButton)
        {
          if (localView.getVisibility() != 8) {
            break label960;
          }
          paramInt4 = paramInt1;
        }
        paramInt2 -= 1;
        paramInt1 = paramInt4;
      }
      break;
      i = 0;
      break label787;
      paramInt3 = 0;
      break label806;
    }
    label960:
    if (i != 0)
    {
      paramInt1 -= localView.getMeasuredWidth();
      label973:
      paramInt4 = j + (mAddButton.getMeasuredHeight() - localView.getMeasuredHeight()) / 2;
      localView.layout(paramInt1, paramInt4, localView.getMeasuredWidth() + paramInt1, localView.getMeasuredHeight() + paramInt4);
      f2 = paramInt3 - paramInt1;
      if (!mExpanded) {
        break label1135;
      }
      f1 = 0.0F;
      label1033:
      localView.setTranslationX(f1);
      if (!mExpanded) {
        break label1142;
      }
      f1 = 1.0F;
      label1050:
      localView.setAlpha(f1);
      localObject1 = (LayoutParams)localView.getLayoutParams();
      mCollapseDir.setFloatValues(new float[] { 0.0F, f2 });
      mExpandDir.setFloatValues(new float[] { f2, 0.0F });
      ((LayoutParams)localObject1).setAnimationsTarget(localView);
      if (i == 0) {
        break label1148;
      }
      paramInt1 -= mButtonSpacing;
    }
    for (;;)
    {
      paramInt4 = paramInt1;
      break;
      break label973;
      label1135:
      f1 = f2;
      break label1033;
      label1142:
      f1 = 0.0F;
      break label1050;
      label1148:
      paramInt1 = localView.getMeasuredWidth() + paramInt1 + mButtonSpacing;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i1 = 0;
    measureChildren(paramInt1, paramInt2);
    paramInt2 = 0;
    paramInt1 = 0;
    mMaxButtonWidth = 0;
    mMaxButtonHeight = 0;
    int i = 0;
    int j = 0;
    while (j < mButtonsCount)
    {
      Object localObject = getChildAt(j);
      int n;
      int m;
      int k;
      if (((View)localObject).getVisibility() == 8)
      {
        n = paramInt2;
        m = i;
        k = paramInt1;
        j += 1;
        paramInt1 = k;
        i = m;
        paramInt2 = n;
      }
      else
      {
        switch (mExpandDirection)
        {
        }
        for (;;)
        {
          k = paramInt1;
          m = i;
          n = paramInt2;
          if (expandsHorizontally()) {
            break;
          }
          localObject = (TextView)((View)localObject).getTag(R.id.fab_label);
          k = paramInt1;
          m = i;
          n = paramInt2;
          if (localObject == null) {
            break;
          }
          m = Math.max(i, ((TextView)localObject).getMeasuredWidth());
          k = paramInt1;
          n = paramInt2;
          break;
          mMaxButtonWidth = Math.max(mMaxButtonWidth, ((View)localObject).getMeasuredWidth());
          paramInt1 += ((View)localObject).getMeasuredHeight();
          continue;
          paramInt2 += ((View)localObject).getMeasuredWidth();
          mMaxButtonHeight = Math.max(mMaxButtonHeight, ((View)localObject).getMeasuredHeight());
        }
      }
    }
    if (!expandsHorizontally())
    {
      j = mMaxButtonWidth;
      paramInt2 = i1;
      if (i > 0) {
        paramInt2 = mLabelsMargin + i;
      }
      paramInt2 = j + paramInt2;
      switch (mExpandDirection)
      {
      }
    }
    for (;;)
    {
      setMeasuredDimension(paramInt2, paramInt1);
      return;
      paramInt1 = mMaxButtonHeight;
      break;
      paramInt1 = adjustForOvershoot(paramInt1 + mButtonSpacing * (getChildCount() - 1));
      continue;
      paramInt2 = adjustForOvershoot(paramInt2 + mButtonSpacing * (getChildCount() - 1));
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    if ((paramParcelable instanceof SavedState))
    {
      paramParcelable = (SavedState)paramParcelable;
      mExpanded = mExpanded;
      mTouchDelegateGroup.setEnabled(mExpanded);
      RotatingDrawable localRotatingDrawable;
      if (mRotatingDrawable != null)
      {
        localRotatingDrawable = mRotatingDrawable;
        if (!mExpanded) {
          break label68;
        }
      }
      label68:
      for (float f = 135.0F;; f = 0.0F)
      {
        localRotatingDrawable.setRotation(f);
        super.onRestoreInstanceState(paramParcelable.getSuperState());
        return;
      }
    }
    super.onRestoreInstanceState(paramParcelable);
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    mExpanded = mExpanded;
    return localSavedState;
  }
  
  public void setOnFloatingActionsMenuUpdateListener(OnFloatingActionsMenuUpdateListener paramOnFloatingActionsMenuUpdateListener)
  {
    mListener = paramOnFloatingActionsMenuUpdateListener;
  }
  
  public void toggle()
  {
    if (mExpanded)
    {
      collapse();
      return;
    }
    expand();
  }
  
  private class LayoutParams
    extends ViewGroup.LayoutParams
  {
    private boolean animationsSetToPlay;
    private ObjectAnimator mCollapseAlpha = new ObjectAnimator();
    private ObjectAnimator mCollapseDir = new ObjectAnimator();
    private ObjectAnimator mExpandAlpha = new ObjectAnimator();
    private ObjectAnimator mExpandDir = new ObjectAnimator();
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
      mExpandDir.setInterpolator(FloatingActionsMenu.sExpandInterpolator);
      mExpandAlpha.setInterpolator(FloatingActionsMenu.sAlphaExpandInterpolator);
      mCollapseDir.setInterpolator(FloatingActionsMenu.sCollapseInterpolator);
      mCollapseAlpha.setInterpolator(FloatingActionsMenu.sCollapseInterpolator);
      mCollapseAlpha.setProperty(View.ALPHA);
      mCollapseAlpha.setFloatValues(new float[] { 1.0F, 0.0F });
      mExpandAlpha.setProperty(View.ALPHA);
      mExpandAlpha.setFloatValues(new float[] { 0.0F, 1.0F });
      switch (mExpandDirection)
      {
      default: 
        return;
      case 0: 
      case 1: 
        mCollapseDir.setProperty(View.TRANSLATION_Y);
        mExpandDir.setProperty(View.TRANSLATION_Y);
        return;
      }
      mCollapseDir.setProperty(View.TRANSLATION_X);
      mExpandDir.setProperty(View.TRANSLATION_X);
    }
    
    public void setAnimationsTarget(View paramView)
    {
      mCollapseAlpha.setTarget(paramView);
      mCollapseDir.setTarget(paramView);
      mExpandAlpha.setTarget(paramView);
      mExpandDir.setTarget(paramView);
      if (!animationsSetToPlay)
      {
        mCollapseAnimation.play(mCollapseAlpha);
        mCollapseAnimation.play(mCollapseDir);
        mExpandAnimation.play(mExpandAlpha);
        mExpandAnimation.play(mExpandDir);
        animationsSetToPlay = true;
      }
    }
  }
  
  public static abstract interface OnFloatingActionsMenuUpdateListener
  {
    public abstract void onMenuCollapsed();
    
    public abstract void onMenuExpanded();
  }
  
  private static class RotatingDrawable
    extends LayerDrawable
  {
    private float mRotation;
    
    public RotatingDrawable(Drawable paramDrawable)
    {
      super();
    }
    
    public void draw(Canvas paramCanvas)
    {
      paramCanvas.save();
      paramCanvas.rotate(mRotation, getBounds().centerX(), getBounds().centerY());
      super.draw(paramCanvas);
      paramCanvas.restore();
    }
    
    public float getRotation()
    {
      return mRotation;
    }
    
    public void setRotation(float paramFloat)
    {
      mRotation = paramFloat;
      invalidateSelf();
    }
  }
  
  public static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public FloatingActionsMenu.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new FloatingActionsMenu.SavedState(paramAnonymousParcel, null);
      }
      
      public FloatingActionsMenu.SavedState[] newArray(int paramAnonymousInt)
      {
        return new FloatingActionsMenu.SavedState[paramAnonymousInt];
      }
    };
    public boolean mExpanded;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      if (paramParcel.readInt() == 1) {}
      for (;;)
      {
        mExpanded = bool;
        return;
        bool = false;
      }
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      if (mExpanded) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        return;
      }
    }
  }
}
