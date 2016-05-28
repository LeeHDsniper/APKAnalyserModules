package it.sephiroth.android.library.tooltip;

import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

class TooltipTextDrawable
  extends Drawable
{
  private final float arrowRatio;
  private int arrowWeight = 0;
  private final int backgroundColor;
  private final Paint bgPaint;
  private final float ellipseSize;
  private TooltipManager.Gravity gravity;
  private int padding = 0;
  private final Path path;
  private Point point;
  private final RectF rectF;
  private final Paint stPaint;
  private final int strokeColor;
  private final int strokeWidth;
  
  public TooltipTextDrawable(Context paramContext, TooltipManager.Builder paramBuilder)
  {
    paramContext = paramContext.getTheme().obtainStyledAttributes(null, R.styleable.TooltipLayout, defStyleAttr, defStyleRes);
    ellipseSize = paramContext.getDimensionPixelSize(R.styleable.TooltipLayout_ttlm_cornerRadius, 4);
    strokeWidth = paramContext.getDimensionPixelSize(R.styleable.TooltipLayout_ttlm_strokeWeight, 30);
    backgroundColor = paramContext.getColor(R.styleable.TooltipLayout_ttlm_backgroundColor, 0);
    strokeColor = paramContext.getColor(R.styleable.TooltipLayout_ttlm_strokeColor, 0);
    arrowRatio = paramContext.getFloat(R.styleable.TooltipLayout_ttlm_arrowRatio, 1.4F);
    paramContext.recycle();
    rectF = new RectF();
    if (backgroundColor != 0)
    {
      bgPaint = new Paint(1);
      bgPaint.setColor(backgroundColor);
      bgPaint.setStyle(Paint.Style.FILL);
      if (strokeColor == 0) {
        break label224;
      }
      stPaint = new Paint(1);
      stPaint.setColor(strokeColor);
      stPaint.setStyle(Paint.Style.STROKE);
      stPaint.setStrokeWidth(strokeWidth);
    }
    for (;;)
    {
      path = new Path();
      return;
      bgPaint = null;
      break;
      label224:
      stPaint = null;
    }
  }
  
  private void calculatePath(Rect paramRect)
  {
    int k = left + padding;
    int m = top + padding;
    int n = right - padding;
    int i1 = bottom - padding;
    float f1 = i1 - ellipseSize;
    float f2 = n - ellipseSize;
    float f3 = m + ellipseSize;
    float f4 = k + ellipseSize;
    int j = 0;
    if ((point != null) && (gravity != null))
    {
      int i;
      if ((gravity == TooltipManager.Gravity.RIGHT) || (gravity == TooltipManager.Gravity.LEFT))
      {
        i = j;
        if (point.y >= m)
        {
          i = j;
          if (point.y <= i1)
          {
            if (point.y + m + arrowWeight <= f1) {
              break label811;
            }
            point.y = ((int)(f1 - arrowWeight - m));
            i = 1;
          }
        }
        label194:
        path.reset();
        if (point.y >= m) {
          break label1011;
        }
        point.y = m;
      }
      for (;;)
      {
        if (point.x < k) {
          point.x = k;
        }
        if (point.x > n) {
          point.x = n;
        }
        path.moveTo(k + ellipseSize, m);
        if ((i != 0) && (gravity == TooltipManager.Gravity.BOTTOM))
        {
          path.lineTo(point.x + k - arrowWeight, m);
          path.lineTo(point.x + k, top);
          path.lineTo(point.x + k + arrowWeight, m);
        }
        path.lineTo(n - ellipseSize, m);
        path.quadTo(n, m, n, m + ellipseSize);
        if ((i != 0) && (gravity == TooltipManager.Gravity.LEFT))
        {
          path.lineTo(n, point.y + m - arrowWeight);
          path.lineTo(right, point.y + m);
          path.lineTo(n, point.y + m + arrowWeight);
        }
        path.lineTo(n, i1 - ellipseSize);
        path.quadTo(n, i1, n - ellipseSize, i1);
        if ((i != 0) && (gravity == TooltipManager.Gravity.TOP))
        {
          path.lineTo(point.x + k + arrowWeight, i1);
          path.lineTo(point.x + k, bottom);
          path.lineTo(point.x + k - arrowWeight, i1);
        }
        path.lineTo(k + ellipseSize, i1);
        path.quadTo(k, i1, k, i1 - ellipseSize);
        if ((i != 0) && (gravity == TooltipManager.Gravity.RIGHT))
        {
          path.lineTo(k, point.y + m + arrowWeight);
          path.lineTo(left, point.y + m);
          path.lineTo(k, point.y + m - arrowWeight);
        }
        path.lineTo(k, m + ellipseSize);
        path.quadTo(k, m, k + ellipseSize, m);
        return;
        label811:
        if (point.y + m - arrowWeight >= f3) {
          break;
        }
        point.y = ((int)(arrowWeight + f3 - m));
        break;
        i = j;
        if (point.x < k) {
          break label194;
        }
        i = j;
        if (point.x > n) {
          break label194;
        }
        i = j;
        if (point.x < k) {
          break label194;
        }
        i = j;
        if (point.x > n) {
          break label194;
        }
        if (point.x + k + arrowWeight > f2) {
          point.x = ((int)(f2 - arrowWeight - k));
        }
        for (;;)
        {
          i = 1;
          break;
          if (point.x + k - arrowWeight < f4) {
            point.x = ((int)(arrowWeight + f4 - k));
          }
        }
        label1011:
        if (point.y > i1) {
          point.y = i1;
        }
      }
    }
    rectF.set(k, m, n, i1);
    path.addRoundRect(rectF, ellipseSize, ellipseSize, Path.Direction.CW);
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (bgPaint != null) {
      paramCanvas.drawPath(path, bgPaint);
    }
    if (stPaint != null) {
      paramCanvas.drawPath(path, stPaint);
    }
  }
  
  public int getOpacity()
  {
    return 0;
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    calculatePath(paramRect);
  }
  
  public void setAlpha(int paramInt) {}
  
  public void setAnchor(TooltipManager.Gravity paramGravity, int paramInt)
  {
    gravity = paramGravity;
    padding = paramInt;
    arrowWeight = ((int)(paramInt / arrowRatio));
  }
  
  public void setColorFilter(ColorFilter paramColorFilter) {}
  
  public void setDestinationPoint(Point paramPoint)
  {
    point = new Point(paramPoint);
  }
}
