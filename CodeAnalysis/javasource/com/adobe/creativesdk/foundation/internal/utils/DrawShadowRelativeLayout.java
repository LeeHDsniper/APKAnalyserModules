package com.adobe.creativesdk.foundation.internal.utils;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Property;
import android.widget.RelativeLayout;
import com.adobe.creativesdk.foundation.auth.R.drawable;
import com.adobe.creativesdk.foundation.auth.R.styleable;

public class DrawShadowRelativeLayout
  extends RelativeLayout
{
  private static Property<DrawShadowRelativeLayout, Float> SHADOW_ALPHA = new Property(Float.class, "shadowAlpha")
  {
    public Float get(DrawShadowRelativeLayout paramAnonymousDrawShadowRelativeLayout)
    {
      return Float.valueOf(mAlpha);
    }
    
    public void set(DrawShadowRelativeLayout paramAnonymousDrawShadowRelativeLayout, Float paramAnonymousFloat)
    {
      DrawShadowRelativeLayout.access$002(paramAnonymousDrawShadowRelativeLayout, paramAnonymousFloat.floatValue());
      ViewCompat.postInvalidateOnAnimation(paramAnonymousDrawShadowRelativeLayout);
    }
  };
  private float mAlpha = 1.0F;
  private ObjectAnimator mAnimator;
  private int mHeight;
  private final boolean mShadowAtBottom;
  private Drawable mShadowDrawable;
  private NinePatchDrawable mShadowNinePatchDrawable;
  private int mShadowTopOffset;
  private boolean mShadowVisible;
  private int mWidth;
  
  public DrawShadowRelativeLayout(Context paramContext)
  {
    this(paramContext, null, 0);
  }
  
  public DrawShadowRelativeLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public DrawShadowRelativeLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.DrawShadowFrameLayout, 0, 0);
    mShadowVisible = paramAttributeSet.getBoolean(R.styleable.DrawShadowFrameLayout_shadowVisible, true);
    mShadowAtBottom = paramAttributeSet.getBoolean(R.styleable.DrawShadowFrameLayout_shadowBottom, false);
    mShadowDrawable = paramAttributeSet.getDrawable(R.styleable.DrawShadowFrameLayout_shadowDrawable);
    if ((mShadowDrawable == null) && (mShadowVisible)) {
      mShadowDrawable = paramContext.getResources().getDrawable(R.drawable.drop_shadow);
    }
    if (mShadowDrawable != null)
    {
      mShadowDrawable.setCallback(this);
      if ((mShadowDrawable instanceof NinePatchDrawable)) {
        mShadowNinePatchDrawable = ((NinePatchDrawable)mShadowDrawable);
      }
    }
    if (!mShadowVisible) {}
    for (boolean bool = true;; bool = false)
    {
      setWillNotDraw(bool);
      paramAttributeSet.recycle();
      return;
    }
  }
  
  private void updateShadowBounds()
  {
    if (mShadowDrawable != null) {
      mShadowDrawable.setBounds(0, mShadowTopOffset, mWidth, mHeight);
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    super.draw(paramCanvas);
    if ((mShadowDrawable != null) && (mShadowVisible))
    {
      if (mShadowNinePatchDrawable != null) {
        mShadowNinePatchDrawable.getPaint().setAlpha((int)(255.0F * mAlpha));
      }
      mShadowDrawable.draw(paramCanvas);
    }
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    mWidth = paramInt1;
    mHeight = paramInt2;
    if (mShadowAtBottom) {
      mShadowTopOffset = mHeight;
    }
    updateShadowBounds();
  }
  
  public void setShadowTopOffset(int paramInt)
  {
    mShadowTopOffset = paramInt;
    updateShadowBounds();
    ViewCompat.postInvalidateOnAnimation(this);
  }
  
  public void setShadowVisible(boolean paramBoolean1, boolean paramBoolean2)
  {
    float f2 = 1.0F;
    mShadowVisible = paramBoolean1;
    if (mAnimator != null)
    {
      mAnimator.cancel();
      mAnimator = null;
    }
    float f1;
    if ((paramBoolean2) && (mShadowDrawable != null))
    {
      Property localProperty = SHADOW_ALPHA;
      if (paramBoolean1)
      {
        f1 = 0.0F;
        if (!paramBoolean1) {
          break label117;
        }
        label53:
        mAnimator = ObjectAnimator.ofFloat(this, localProperty, new float[] { f1, f2 });
        mAnimator.setDuration(1000L);
        mAnimator.start();
      }
    }
    else
    {
      ViewCompat.postInvalidateOnAnimation(this);
      if (mShadowVisible) {
        break label123;
      }
    }
    label117:
    label123:
    for (paramBoolean1 = true;; paramBoolean1 = false)
    {
      setWillNotDraw(paramBoolean1);
      return;
      f1 = 1.0F;
      break;
      f2 = 0.0F;
      break label53;
    }
  }
}
