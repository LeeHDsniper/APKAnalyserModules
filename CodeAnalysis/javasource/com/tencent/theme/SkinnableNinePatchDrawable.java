package com.tencent.theme;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.NinePatch;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.util.DisplayMetrics;

public class SkinnableNinePatchDrawable
  extends Drawable
{
  private static final boolean a = true;
  private a b;
  private NinePatch c;
  private Rect d;
  private Paint e;
  private boolean f;
  private int g = 160;
  private int h;
  private int i;
  
  SkinnableNinePatchDrawable() {}
  
  public SkinnableNinePatchDrawable(Resources paramResources, Bitmap paramBitmap, byte[] paramArrayOfByte, Rect paramRect, String paramString)
  {
    this(new a(new NinePatch(paramBitmap, paramArrayOfByte, paramString), paramBitmap, paramRect), paramResources);
    b.q = g;
  }
  
  @Deprecated
  public SkinnableNinePatchDrawable(Bitmap paramBitmap, byte[] paramArrayOfByte, Rect paramRect, String paramString)
  {
    this(new a(new NinePatch(paramBitmap, paramArrayOfByte, paramString), paramBitmap, paramRect), null);
  }
  
  SkinnableNinePatchDrawable(a paramA, Resources paramResources)
  {
    a(paramA, paramResources);
  }
  
  private void a()
  {
    b();
    if (b.k != null)
    {
      localObject = b.k;
      h = b.a(localObject[0], localObject[2], g);
      h = b.a(localObject[1], localObject[2], g);
      d.set(0, 0, 0, 0);
      return;
    }
    int j = c.getDensity();
    int k = g;
    if (j == k)
    {
      h = c.getWidth();
      i = c.getHeight();
      return;
    }
    h = b.a(c.getWidth(), j, k);
    i = b.a(c.getHeight(), j, k);
    Rect localRect1 = d;
    Rect localRect2 = b.m;
    Object localObject = localRect1;
    if (localRect1 == localRect2)
    {
      localObject = new Rect(localRect2);
      d = ((Rect)localObject);
    }
    left = b.a(left, j, k);
    top = b.a(top, j, k);
    right = b.a(right, j, k);
    bottom = b.a(bottom, j, k);
  }
  
  private void a(a paramA, Resources paramResources)
  {
    b = paramA;
    c = l;
    d = m;
    if (paramResources != null) {}
    for (int j = getDisplayMetricsdensityDpi;; j = q)
    {
      g = j;
      if (true != o) {
        setDither(o);
      }
      if (c != null) {
        a();
      }
      return;
    }
  }
  
  private void b()
  {
    if (c != b.l)
    {
      c = b.l;
      d = b.m;
      if (b.k != null)
      {
        localObject = b.k;
        h = b.a(localObject[0], localObject[2], g);
        h = b.a(localObject[1], localObject[2], g);
        d.set(0, 0, 0, 0);
      }
    }
    else
    {
      return;
    }
    int j = c.getDensity();
    int k = g;
    if (j == k)
    {
      h = c.getWidth();
      i = c.getHeight();
      return;
    }
    h = b.a(c.getWidth(), j, k);
    i = b.a(c.getHeight(), j, k);
    Rect localRect1 = d;
    Rect localRect2 = b.m;
    Object localObject = localRect1;
    if (localRect1 == localRect2)
    {
      localObject = new Rect(localRect2);
      d = ((Rect)localObject);
    }
    left = b.a(left, j, k);
    top = b.a(top, j, k);
    right = b.a(right, j, k);
    bottom = b.a(bottom, j, k);
  }
  
  boolean a(Rect paramRect)
  {
    if (b.n == null) {
      return false;
    }
    paramRect.set(b.n);
    return true;
  }
  
  public void draw(Canvas paramCanvas)
  {
    b();
    if (b.k != null) {}
    for (;;)
    {
      return;
      Rect localRect = getBounds();
      try
      {
        c.draw(paramCanvas, localRect, e);
        if (!b.j) {
          continue;
        }
        paramCanvas.drawRect(localRect, b.b);
        paramCanvas.drawLine(left, top, right, bottom, b.a);
        paramCanvas.drawLine(right, top, left, bottom, b.a);
        return;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
      }
    }
  }
  
  public Bitmap getBitmap()
  {
    return b.r;
  }
  
  public int getChangingConfigurations()
  {
    return super.getChangingConfigurations() | b.p;
  }
  
  public Drawable.ConstantState getConstantState()
  {
    b.p = super.getChangingConfigurations();
    return b;
  }
  
  public int getIntrinsicHeight()
  {
    b();
    return i;
  }
  
  public int getIntrinsicWidth()
  {
    b();
    return h;
  }
  
  public int getMinimumHeight()
  {
    b();
    return i;
  }
  
  public int getMinimumWidth()
  {
    b();
    return h;
  }
  
  public int getOpacity()
  {
    b();
    if ((c == null) || (c.hasAlpha()) || ((e != null) && (e.getAlpha() < 255))) {
      return -3;
    }
    return -1;
  }
  
  public boolean getPadding(Rect paramRect)
  {
    b();
    paramRect.set(d);
    return true;
  }
  
  public Paint getPaint()
  {
    if (e == null)
    {
      e = new Paint();
      e.setDither(true);
    }
    return e;
  }
  
  public Region getTransparentRegion()
  {
    b();
    if (c == null) {
      return null;
    }
    return c.getTransparentRegion(getBounds());
  }
  
  public Drawable mutate()
  {
    return this;
  }
  
  public void setAlpha(int paramInt)
  {
    getPaint().setAlpha(paramInt);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    getPaint().setColorFilter(paramColorFilter);
  }
  
  public void setDither(boolean paramBoolean)
  {
    getPaint().setDither(paramBoolean);
  }
  
  public void setTargetDensity(int paramInt)
  {
    b();
    int j = paramInt;
    if (paramInt == 0) {
      j = 160;
    }
    g = j;
    if (c != null) {
      a();
    }
  }
  
  public void setTargetDensity(Canvas paramCanvas)
  {
    setTargetDensity(paramCanvas.getDensity());
  }
  
  public void setTargetDensity(DisplayMetrics paramDisplayMetrics)
  {
    b();
    g = densityDpi;
    if (c != null) {
      a();
    }
  }
  
  static final class a
    extends b
  {
    NinePatch l;
    Rect m;
    Rect n;
    final boolean o;
    int p;
    int q = 160;
    Bitmap r;
    
    a(NinePatch paramNinePatch, Bitmap paramBitmap, Rect paramRect)
    {
      this(paramNinePatch, paramBitmap, paramRect, true);
    }
    
    a(NinePatch paramNinePatch, Bitmap paramBitmap, Rect paramRect, boolean paramBoolean)
    {
      r = paramBitmap;
      l = paramNinePatch;
      m = paramRect;
      o = paramBoolean;
    }
    
    a(a paramA)
    {
      l = l;
      m = m;
      o = o;
      p = p;
      q = q;
    }
    
    public int getChangingConfigurations()
    {
      return p;
    }
    
    public Drawable newDrawable()
    {
      return new SkinnableNinePatchDrawable(this, null);
    }
    
    public Drawable newDrawable(Resources paramResources)
    {
      return new SkinnableNinePatchDrawable(this, paramResources);
    }
  }
}
