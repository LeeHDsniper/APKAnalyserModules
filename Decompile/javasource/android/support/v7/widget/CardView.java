package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.v7.cardview.R.style;
import android.support.v7.cardview.R.styleable;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.FrameLayout;

public class CardView
  extends FrameLayout
  implements CardViewDelegate
{
  private static final CardViewImpl IMPL;
  private boolean mCompatPadding;
  private final Rect mContentPadding = new Rect();
  private boolean mPreventCornerOverlap;
  private final Rect mShadowBounds = new Rect();
  
  static
  {
    if (Build.VERSION.SDK_INT >= 21) {
      IMPL = new CardViewApi21();
    }
    for (;;)
    {
      IMPL.initStatic();
      return;
      if (Build.VERSION.SDK_INT >= 17) {
        IMPL = new CardViewJellybeanMr1();
      } else {
        IMPL = new CardViewEclairMr1();
      }
    }
  }
  
  public CardView(Context paramContext)
  {
    super(paramContext);
    initialize(paramContext, null, 0);
  }
  
  public CardView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initialize(paramContext, paramAttributeSet, 0);
  }
  
  public CardView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initialize(paramContext, paramAttributeSet, paramInt);
  }
  
  private void initialize(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.CardView, paramInt, R.style.CardView_Light);
    paramInt = paramAttributeSet.getColor(R.styleable.CardView_cardBackgroundColor, 0);
    float f4 = paramAttributeSet.getDimension(R.styleable.CardView_cardCornerRadius, 0.0F);
    float f2 = paramAttributeSet.getDimension(R.styleable.CardView_cardElevation, 0.0F);
    float f3 = paramAttributeSet.getDimension(R.styleable.CardView_cardMaxElevation, 0.0F);
    mCompatPadding = paramAttributeSet.getBoolean(R.styleable.CardView_cardUseCompatPadding, false);
    mPreventCornerOverlap = paramAttributeSet.getBoolean(R.styleable.CardView_cardPreventCornerOverlap, true);
    int i = paramAttributeSet.getDimensionPixelSize(R.styleable.CardView_contentPadding, 0);
    mContentPadding.left = paramAttributeSet.getDimensionPixelSize(R.styleable.CardView_contentPaddingLeft, i);
    mContentPadding.top = paramAttributeSet.getDimensionPixelSize(R.styleable.CardView_contentPaddingTop, i);
    mContentPadding.right = paramAttributeSet.getDimensionPixelSize(R.styleable.CardView_contentPaddingRight, i);
    mContentPadding.bottom = paramAttributeSet.getDimensionPixelSize(R.styleable.CardView_contentPaddingBottom, i);
    float f1 = f3;
    if (f2 > f3) {
      f1 = f2;
    }
    paramAttributeSet.recycle();
    IMPL.initialize(this, paramContext, paramInt, f4, f2, f1);
  }
  
  public float getCardElevation()
  {
    return IMPL.getElevation(this);
  }
  
  public int getContentPaddingBottom()
  {
    return mContentPadding.bottom;
  }
  
  public int getContentPaddingLeft()
  {
    return mContentPadding.left;
  }
  
  public int getContentPaddingRight()
  {
    return mContentPadding.right;
  }
  
  public int getContentPaddingTop()
  {
    return mContentPadding.top;
  }
  
  public float getMaxCardElevation()
  {
    return IMPL.getMaxElevation(this);
  }
  
  public boolean getPreventCornerOverlap()
  {
    return mPreventCornerOverlap;
  }
  
  public float getRadius()
  {
    return IMPL.getRadius(this);
  }
  
  public boolean getUseCompatPadding()
  {
    return mCompatPadding;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (!(IMPL instanceof CardViewApi21))
    {
      int i = View.MeasureSpec.getMode(paramInt1);
      switch (i)
      {
      default: 
        i = View.MeasureSpec.getMode(paramInt2);
        switch (i)
        {
        }
        break;
      }
      for (;;)
      {
        super.onMeasure(paramInt1, paramInt2);
        return;
        paramInt1 = View.MeasureSpec.makeMeasureSpec(Math.max((int)Math.ceil(IMPL.getMinWidth(this)), View.MeasureSpec.getSize(paramInt1)), i);
        break;
        paramInt2 = View.MeasureSpec.makeMeasureSpec(Math.max((int)Math.ceil(IMPL.getMinHeight(this)), View.MeasureSpec.getSize(paramInt2)), i);
      }
    }
    super.onMeasure(paramInt1, paramInt2);
  }
  
  public void setCardBackgroundColor(int paramInt)
  {
    IMPL.setBackgroundColor(this, paramInt);
  }
  
  public void setCardElevation(float paramFloat)
  {
    IMPL.setElevation(this, paramFloat);
  }
  
  public void setMaxCardElevation(float paramFloat)
  {
    IMPL.setMaxElevation(this, paramFloat);
  }
  
  public void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {}
  
  public void setPaddingRelative(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {}
  
  public void setPreventCornerOverlap(boolean paramBoolean)
  {
    if (paramBoolean == mPreventCornerOverlap) {
      return;
    }
    mPreventCornerOverlap = paramBoolean;
    IMPL.onPreventCornerOverlapChanged(this);
  }
  
  public void setRadius(float paramFloat)
  {
    IMPL.setRadius(this, paramFloat);
  }
  
  public void setShadowPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mShadowBounds.set(paramInt1, paramInt2, paramInt3, paramInt4);
    super.setPadding(mContentPadding.left + paramInt1, mContentPadding.top + paramInt2, mContentPadding.right + paramInt3, mContentPadding.bottom + paramInt4);
  }
  
  public void setUseCompatPadding(boolean paramBoolean)
  {
    if (mCompatPadding == paramBoolean) {
      return;
    }
    mCompatPadding = paramBoolean;
    IMPL.onCompatPaddingChanged(this);
  }
}
