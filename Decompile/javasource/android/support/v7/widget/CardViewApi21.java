package android.support.v7.widget;

import android.content.Context;
import android.view.View;

class CardViewApi21
  implements CardViewImpl
{
  CardViewApi21() {}
  
  public float getElevation(CardViewDelegate paramCardViewDelegate)
  {
    return ((View)paramCardViewDelegate).getElevation();
  }
  
  public float getMaxElevation(CardViewDelegate paramCardViewDelegate)
  {
    return ((RoundRectDrawable)paramCardViewDelegate.getBackground()).getPadding();
  }
  
  public float getMinHeight(CardViewDelegate paramCardViewDelegate)
  {
    return getRadius(paramCardViewDelegate) * 2.0F;
  }
  
  public float getMinWidth(CardViewDelegate paramCardViewDelegate)
  {
    return getRadius(paramCardViewDelegate) * 2.0F;
  }
  
  public float getRadius(CardViewDelegate paramCardViewDelegate)
  {
    return ((RoundRectDrawable)paramCardViewDelegate.getBackground()).getRadius();
  }
  
  public void initStatic() {}
  
  public void initialize(CardViewDelegate paramCardViewDelegate, Context paramContext, int paramInt, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramCardViewDelegate.setBackgroundDrawable(new RoundRectDrawable(paramInt, paramFloat1));
    paramContext = (View)paramCardViewDelegate;
    paramContext.setClipToOutline(true);
    paramContext.setElevation(paramFloat2);
    setMaxElevation(paramCardViewDelegate, paramFloat3);
  }
  
  public void onCompatPaddingChanged(CardViewDelegate paramCardViewDelegate)
  {
    setMaxElevation(paramCardViewDelegate, getMaxElevation(paramCardViewDelegate));
  }
  
  public void onPreventCornerOverlapChanged(CardViewDelegate paramCardViewDelegate)
  {
    setMaxElevation(paramCardViewDelegate, getMaxElevation(paramCardViewDelegate));
  }
  
  public void setBackgroundColor(CardViewDelegate paramCardViewDelegate, int paramInt)
  {
    ((RoundRectDrawable)paramCardViewDelegate.getBackground()).setColor(paramInt);
  }
  
  public void setElevation(CardViewDelegate paramCardViewDelegate, float paramFloat)
  {
    ((View)paramCardViewDelegate).setElevation(paramFloat);
  }
  
  public void setMaxElevation(CardViewDelegate paramCardViewDelegate, float paramFloat)
  {
    ((RoundRectDrawable)paramCardViewDelegate.getBackground()).setPadding(paramFloat, paramCardViewDelegate.getUseCompatPadding(), paramCardViewDelegate.getPreventCornerOverlap());
    updatePadding(paramCardViewDelegate);
  }
  
  public void setRadius(CardViewDelegate paramCardViewDelegate, float paramFloat)
  {
    ((RoundRectDrawable)paramCardViewDelegate.getBackground()).setRadius(paramFloat);
  }
  
  public void updatePadding(CardViewDelegate paramCardViewDelegate)
  {
    if (!paramCardViewDelegate.getUseCompatPadding())
    {
      paramCardViewDelegate.setShadowPadding(0, 0, 0, 0);
      return;
    }
    float f1 = getMaxElevation(paramCardViewDelegate);
    float f2 = getRadius(paramCardViewDelegate);
    int i = (int)Math.ceil(RoundRectDrawableWithShadow.calculateHorizontalPadding(f1, f2, paramCardViewDelegate.getPreventCornerOverlap()));
    int j = (int)Math.ceil(RoundRectDrawableWithShadow.calculateVerticalPadding(f1, f2, paramCardViewDelegate.getPreventCornerOverlap()));
    paramCardViewDelegate.setShadowPadding(i, j, i, j);
  }
}
