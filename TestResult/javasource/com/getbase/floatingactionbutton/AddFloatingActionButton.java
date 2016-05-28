package com.getbase.floatingactionbutton;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.Shape;
import android.util.AttributeSet;

public class AddFloatingActionButton
  extends FloatingActionButton
{
  int mPlusColor;
  
  public AddFloatingActionButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AddFloatingActionButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  Drawable getIconDrawable()
  {
    final float f1 = getDimension(R.dimen.fab_icon_size);
    final float f2 = f1 / 2.0F;
    float f3 = getDimension(R.dimen.fab_plus_icon_size);
    final float f4 = getDimension(R.dimen.fab_plus_icon_stroke) / 2.0F;
    ShapeDrawable localShapeDrawable = new ShapeDrawable(new Shape()
    {
      public void draw(Canvas paramAnonymousCanvas, Paint paramAnonymousPaint)
      {
        float f1 = val$plusOffset;
        float f2 = f2;
        float f3 = f4;
        float f4 = f1;
        float f5 = val$plusOffset;
        float f6 = f2;
        paramAnonymousCanvas.drawRect(f1, f2 - f3, f4 - f5, f4 + f6, paramAnonymousPaint);
        f1 = f2;
        f2 = f4;
        f3 = val$plusOffset;
        f4 = f2;
        paramAnonymousCanvas.drawRect(f1 - f2, f3, f4 + f4, f1 - val$plusOffset, paramAnonymousPaint);
      }
    });
    Paint localPaint = localShapeDrawable.getPaint();
    localPaint.setColor(mPlusColor);
    localPaint.setStyle(Paint.Style.FILL);
    localPaint.setAntiAlias(true);
    return localShapeDrawable;
  }
  
  public int getPlusColor()
  {
    return mPlusColor;
  }
  
  void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.AddFloatingActionButton, 0, 0);
    mPlusColor = localTypedArray.getColor(R.styleable.AddFloatingActionButton_fab_plusIconColor, getColor(17170443));
    localTypedArray.recycle();
    super.init(paramContext, paramAttributeSet);
  }
  
  public void setIcon(int paramInt)
  {
    throw new UnsupportedOperationException("Use FloatingActionButton if you want to use custom icon");
  }
  
  public void setPlusColor(int paramInt)
  {
    if (mPlusColor != paramInt)
    {
      mPlusColor = paramInt;
      updateBackground();
    }
  }
  
  public void setPlusColorResId(int paramInt)
  {
    setPlusColor(getColor(paramInt));
  }
}
