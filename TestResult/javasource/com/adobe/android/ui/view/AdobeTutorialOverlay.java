package com.adobe.android.ui.view;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Handler;
import android.text.DynamicLayout;
import android.text.Layout.Alignment;
import android.text.SpannableString;
import android.text.TextPaint;
import android.text.style.TextAppearanceSpan;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.adobe.android.ui.R.drawable;
import com.adobe.android.ui.R.styleable;
import com.adobe.android.ui.utils.UIUtils;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.Animator.AnimatorListener;
import com.nineoldandroids.animation.AnimatorSet;
import com.nineoldandroids.animation.ObjectAnimator;

public abstract class AdobeTutorialOverlay
  extends RelativeLayout
  implements View.OnClickListener
{
  protected static final CharSequence POSITION_CENTER = "center";
  protected static final CharSequence POSITION_LEFT = "left";
  protected static final CharSequence POSITION_RIGHT = "right";
  protected static final CharSequence POSITION_TOP = "top";
  private float alpha = 0.0F;
  private Animator hideAnimation;
  private boolean inLayout;
  private final int mActivationDelay;
  private boolean mActive;
  private final int mAnimationDuration;
  private final int mArrow;
  private final int mBackgroundAlpha;
  private int mBackgroundColor;
  private Button mCloseButton;
  private final int mCloseButtonResId;
  protected OnCloseListener mCloseListener;
  protected final int mClosebuttonMargins;
  private final DisplayMetrics mMetrics;
  protected boolean mOrientationChanged;
  private final int mOriginalBackgroundColor;
  private final int mRipple;
  protected final String mTagName;
  private final int mTextMargins;
  private final int mTextStyle;
  private final int mTitleMargins;
  private final int mTitleStyle;
  private boolean mVisible;
  protected int overlayId;
  private Animator showAnimation;
  
  public AdobeTutorialOverlay(Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    super(paramContext);
    Resources localResources = paramContext.getResources();
    overlayId = paramInt2;
    mTagName = paramString;
    paramContext = paramContext.getTheme();
    paramString = new TypedValue();
    paramInt2 = 0;
    if (paramContext.resolveAttribute(paramInt1, paramString, true)) {
      paramInt2 = resourceId;
    }
    paramContext = paramContext.obtainStyledAttributes(paramInt2, R.styleable.AdobeTutorialOverlay);
    mOriginalBackgroundColor = paramContext.getColor(R.styleable.AdobeTutorialOverlay_android_background, -16777216);
    mTitleStyle = paramContext.getResourceId(R.styleable.AdobeTutorialOverlay_adobe_titleStyle, 16973890);
    mTextStyle = paramContext.getResourceId(R.styleable.AdobeTutorialOverlay_adobe_textStyle, 16973892);
    mArrow = paramContext.getResourceId(R.styleable.AdobeTutorialOverlay_adobe_arrow, R.drawable.com_adobe_image_overlay_blemish_arrow);
    mRipple = paramContext.getResourceId(R.styleable.AdobeTutorialOverlay_adobe_ripple, R.drawable.com_adobe_image_editor_tutorial_ripple);
    mTextMargins = paramContext.getDimensionPixelSize(R.styleable.AdobeTutorialOverlay_adobe_textMargins, 0);
    mTitleMargins = paramContext.getDimensionPixelSize(R.styleable.AdobeTutorialOverlay_adobe_titleMargins, 0);
    mAnimationDuration = paramContext.getInt(R.styleable.AdobeTutorialOverlay_android_animationDuration, 250);
    mClosebuttonMargins = paramContext.getDimensionPixelSize(R.styleable.AdobeTutorialOverlay_adobe_closeButtonMargins, 0);
    mActivationDelay = paramContext.getInteger(R.styleable.AdobeTutorialOverlay_adobe_activationDelay, 0);
    mCloseButtonResId = paramContext.getResourceId(R.styleable.AdobeTutorialOverlay_adobe_closeButtonLayout, 0);
    paramContext.recycle();
    mBackgroundColor = mOriginalBackgroundColor;
    mBackgroundAlpha = Color.alpha(mOriginalBackgroundColor);
    mMetrics = localResources.getDisplayMetrics();
    setTag(getClass().getName());
    setVisibility(4);
    setHardwareAccelerated(true);
    if (Build.VERSION.SDK_INT >= 14) {
      setFitsSystemWindows(true);
    }
  }
  
  private DynamicLayout createTextLayout(CharSequence paramCharSequence, int paramInt1, Layout.Alignment paramAlignment, int paramInt2)
  {
    TextPaint localTextPaint = new TextPaint();
    localTextPaint.setAntiAlias(true);
    localTextPaint.setLinearText(true);
    localTextPaint.setFilterBitmap(true);
    TextAppearanceSpan localTextAppearanceSpan = new TextAppearanceSpan(getContext(), paramInt2);
    paramCharSequence = new SpannableString(paramCharSequence);
    paramCharSequence.setSpan(localTextAppearanceSpan, 0, paramCharSequence.length(), 0);
    return new DynamicLayout(paramCharSequence, localTextPaint, paramInt1, paramAlignment, 1.0F, 1.0F, true);
  }
  
  public static AdobeTutorialOverlay findOverlay(Context paramContext, Class<? extends AdobeTutorialOverlay>... paramVarArgs)
  {
    paramContext = (ViewGroup)((Activity)paramContext).getWindow().getDecorView();
    if (paramContext != null)
    {
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        AdobeTutorialOverlay localAdobeTutorialOverlay = (AdobeTutorialOverlay)paramContext.findViewWithTag(paramVarArgs[i].getName());
        if (localAdobeTutorialOverlay != null) {
          return localAdobeTutorialOverlay;
        }
        i += 1;
      }
    }
    return null;
  }
  
  private void postActivate()
  {
    if (mActivationDelay > 0)
    {
      Handler localHandler = getHandler();
      if (localHandler != null) {
        localHandler.postDelayed(new Runnable()
        {
          public void run()
          {
            onActivate();
          }
        }, mActivationDelay);
      }
      return;
    }
    onActivate();
  }
  
  protected void addCloseButton(int... paramVarArgs)
  {
    if (mCloseButton == null)
    {
      mCloseButton = ((Button)LayoutInflater.from(getContext()).inflate(mCloseButtonResId, this, false));
      mCloseButton.setOnClickListener(this);
      RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)generateDefaultLayoutParams();
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        localLayoutParams.addRule(paramVarArgs[i]);
        i += 1;
      }
      localLayoutParams.setMargins(mClosebuttonMargins, mClosebuttonMargins + UIUtils.getStatusBarHeight(getContext()), mClosebuttonMargins, mClosebuttonMargins);
      mCloseButton.setLayoutParams(localLayoutParams);
      mCloseButton.setVisibility(8);
      addView(mCloseButton);
    }
  }
  
  protected abstract void calculatePositions();
  
  public void dismiss()
  {
    inLayout = false;
    ViewGroup localViewGroup;
    if (getParent() != null)
    {
      Log.i("TutorialOverlay", "dismiss");
      setOnCloseListener(null);
      localViewGroup = (ViewGroup)getParent();
      if ((localViewGroup == null) || (localViewGroup.indexOfChild(this) <= -1)) {}
    }
    try
    {
      localViewGroup.removeView(this);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  protected abstract void doShow();
  
  protected void fadeIn()
  {
    if (showAnimation == null)
    {
      Log.i("TutorialOverlay", "fadeIn");
      showAnimation = generateInAnimation();
      showAnimation.addListener(new Animator.AnimatorListener()
      {
        public void onAnimationCancel(Animator paramAnonymousAnimator) {}
        
        public void onAnimationEnd(Animator paramAnonymousAnimator)
        {
          AdobeTutorialOverlay.access$002(AdobeTutorialOverlay.this, true);
          inAnimationCompleted();
          AdobeTutorialOverlay.this.postActivate();
        }
        
        public void onAnimationRepeat(Animator paramAnonymousAnimator) {}
        
        public void onAnimationStart(Animator paramAnonymousAnimator)
        {
          setVisibility(0);
        }
      });
      showAnimation.start();
    }
  }
  
  protected void fadeOut(final String paramString)
  {
    if (hideAnimation == null)
    {
      Log.i("TutorialOverlay", "fadeOut");
      hideAnimation = generateHideAnimation();
      hideAnimation.addListener(new Animator.AnimatorListener()
      {
        public void onAnimationCancel(Animator paramAnonymousAnimator) {}
        
        public void onAnimationEnd(Animator paramAnonymousAnimator)
        {
          if (paramString != null) {
            trackTutorialClosed(paramString);
          }
          dismiss();
        }
        
        public void onAnimationRepeat(Animator paramAnonymousAnimator) {}
        
        public void onAnimationStart(Animator paramAnonymousAnimator) {}
      });
      hideAnimation.start();
    }
  }
  
  protected Drawable generateArrow()
  {
    return getContext().getResources().getDrawable(mArrow);
  }
  
  protected Bitmap generateBitmap(DynamicLayout paramDynamicLayout)
  {
    Bitmap localBitmap = Bitmap.createBitmap(paramDynamicLayout.getWidth(), paramDynamicLayout.getHeight(), Bitmap.Config.ARGB_8888);
    localBitmap.eraseColor(0);
    paramDynamicLayout.draw(new Canvas(localBitmap));
    return localBitmap;
  }
  
  protected Animator generateHideAnimation()
  {
    ObjectAnimator localObjectAnimator = ObjectAnimator.ofFloat(this, "alpha", new float[] { 1.0F, 0.0F });
    localObjectAnimator.setDuration(getAnimationDuration());
    return localObjectAnimator;
  }
  
  protected Animator generateInAnimation()
  {
    AnimatorSet localAnimatorSet = new AnimatorSet();
    ((AnimatorSet)localAnimatorSet).playTogether(new Animator[] { ObjectAnimator.ofFloat(this, "alpha", new float[] { 0.0F, 1.0F }) });
    localAnimatorSet.setDuration(getAnimationDuration());
    return localAnimatorSet;
  }
  
  protected Drawable generateRipple()
  {
    return getContext().getResources().getDrawable(mRipple);
  }
  
  protected Drawable generateTextDrawable(Context paramContext, CharSequence paramCharSequence, int paramInt, Layout.Alignment paramAlignment)
  {
    paramCharSequence = generateBitmap(generateTextLayout(paramCharSequence, paramInt, paramAlignment));
    return new BitmapDrawable(paramContext.getResources(), paramCharSequence);
  }
  
  protected DynamicLayout generateTextLayout(CharSequence paramCharSequence, int paramInt, Layout.Alignment paramAlignment)
  {
    return createTextLayout(paramCharSequence, paramInt, paramAlignment, getTextStyle());
  }
  
  protected Drawable generateTitleDrawable(Context paramContext, CharSequence paramCharSequence, int paramInt, Layout.Alignment paramAlignment)
  {
    paramCharSequence = generateBitmap(generateTitleLayout(paramCharSequence, paramInt, paramAlignment));
    return new BitmapDrawable(paramContext.getResources(), paramCharSequence);
  }
  
  protected DynamicLayout generateTitleLayout(CharSequence paramCharSequence, int paramInt, Layout.Alignment paramAlignment)
  {
    return createTextLayout(paramCharSequence, paramInt, paramAlignment, getTitleStyle());
  }
  
  public float getAlpha()
  {
    return alpha;
  }
  
  public int getAnimationDuration()
  {
    return mAnimationDuration;
  }
  
  public int getBackgroundColor()
  {
    return mBackgroundColor;
  }
  
  public Button getCloseButton()
  {
    return mCloseButton;
  }
  
  protected DisplayMetrics getDisplayMetrics()
  {
    return mMetrics;
  }
  
  protected final int getOverlayId()
  {
    return overlayId;
  }
  
  public int getTextMargins()
  {
    return mTextMargins;
  }
  
  public int getTextStyle()
  {
    return mTextStyle;
  }
  
  public int getTitleMargins()
  {
    return mTitleMargins;
  }
  
  public int getTitleStyle()
  {
    return mTitleStyle;
  }
  
  protected final String getToolName()
  {
    return mTagName;
  }
  
  public void hide()
  {
    hide(null);
  }
  
  public void hide(String paramString)
  {
    if (!isAttachedToParent()) {
      return;
    }
    Log.i("TutorialOverlay", "hide");
    fadeOut(paramString);
  }
  
  protected abstract void inAnimationCompleted();
  
  protected boolean isActive()
  {
    return mActive;
  }
  
  protected boolean isAttachedToParent()
  {
    return (inLayout) && (getParent() != null);
  }
  
  protected boolean isVisible()
  {
    return mVisible;
  }
  
  protected void onActivate()
  {
    mActive = true;
  }
  
  public boolean onBackPressed()
  {
    if (isAttachedToParent())
    {
      Log.i("TutorialOverlay", "onBackPressed");
      hide("back");
      return true;
    }
    return false;
  }
  
  public void onClick(View paramView)
  {
    Log.i("TutorialOverlay", "onClick: " + paramView);
    if (paramView == getCloseButton()) {
      hide("button");
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    setAlpha(1.0F);
    mOrientationChanged = true;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if ((mOrientationChanged) && (paramBoolean))
    {
      calculatePositions();
      invalidate();
      mOrientationChanged = false;
    }
  }
  
  public void setAlpha(float paramFloat)
  {
    alpha = paramFloat;
    mBackgroundColor = Color.argb((int)(mBackgroundAlpha * paramFloat), 0, 0, 0);
    postInvalidate();
  }
  
  public void setHardwareAccelerated(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      if (Build.VERSION.SDK_INT >= 11)
      {
        if (isHardwareAccelerated())
        {
          Paint localPaint = new Paint();
          localPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.OVERLAY));
          setLayerType(2, localPaint);
          return;
        }
        setLayerType(1, null);
        return;
      }
      setDrawingCacheEnabled(true);
      return;
    }
    if (Build.VERSION.SDK_INT >= 11)
    {
      setLayerType(1, null);
      return;
    }
    setDrawingCacheEnabled(true);
  }
  
  public void setOnCloseListener(OnCloseListener paramOnCloseListener)
  {
    mCloseListener = paramOnCloseListener;
  }
  
  public abstract boolean shouldShow();
  
  public final boolean show()
  {
    return showDelayed(100L);
  }
  
  public boolean showDelayed(long paramLong)
  {
    Log.i("TutorialOverlay", "show");
    ViewGroup localViewGroup = (ViewGroup)((Activity)getContext()).getWindow().getDecorView();
    if ((localViewGroup != null) && (localViewGroup.getHandler() != null))
    {
      if (shouldShow())
      {
        inLayout = true;
        localViewGroup.addView(this, new WindowManager.LayoutParams(-1, -1));
        localViewGroup.getHandler().postDelayed(new Runnable()
        {
          public void run()
          {
            calculatePositions();
            trackTutorialOpened();
            doShow();
          }
        }, paramLong);
        return true;
      }
      Log.i("TutorialOverlay", "don't show");
    }
    for (;;)
    {
      return false;
      Log.w("TutorialOverlay", "handler is null");
    }
  }
  
  protected abstract void trackTutorialClosed(String paramString);
  
  protected abstract void trackTutorialOpened();
  
  public static abstract interface OnCloseListener
  {
    public abstract void onClose(AdobeTutorialOverlay paramAdobeTutorialOverlay);
  }
}
