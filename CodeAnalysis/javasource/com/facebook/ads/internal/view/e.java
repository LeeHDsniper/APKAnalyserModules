package com.facebook.ads.internal.view;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.widget.ImageView;
import android.widget.LinearLayout;

public class e
  extends LinearLayout
{
  private Bitmap a;
  private Bitmap b;
  private ImageView c;
  private ImageView d;
  private ImageView e;
  private Bitmap f;
  private int g;
  private int h;
  
  private void a()
  {
    if (getHeight() > 0)
    {
      h = c();
      g = ((int)Math.ceil((getHeight() - h) / 2.0F));
      Object localObject = new Matrix();
      ((Matrix)localObject).preScale(1.0F, -1.0F);
      int i = (int)Math.floor((getHeight() - h) / 2.0F);
      float f1 = a.getHeight() / h;
      int j = Math.round(g * f1);
      if (j > 0)
      {
        f = Bitmap.createBitmap(b, 0, 0, b.getWidth(), j, (Matrix)localObject, true);
        c.setImageBitmap(f);
      }
      i = Math.round(i * f1);
      if (i > 0)
      {
        localObject = Bitmap.createBitmap(b, 0, b.getHeight() - i, b.getWidth(), i, (Matrix)localObject, true);
        e.setImageBitmap((Bitmap)localObject);
      }
    }
  }
  
  private int c()
  {
    return (int)Math.round(getWidth() / 1.91D);
  }
  
  public void a(Bitmap paramBitmap1, Bitmap paramBitmap2)
  {
    if (paramBitmap1 == null)
    {
      d.setImageDrawable(null);
      return;
    }
    d.setImageBitmap(Bitmap.createBitmap(paramBitmap1));
    a = paramBitmap1;
    b = paramBitmap2;
    float f1 = paramBitmap1.getHeight() / paramBitmap1.getWidth();
    a();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((a == null) || (b == null))
    {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
      return;
    }
    int i = c();
    if ((f == null) || (h != i)) {
      a();
    }
    c.layout(paramInt1, paramInt2, paramInt3, g);
    d.layout(paramInt1, g + paramInt2, paramInt3, g + h);
    e.layout(paramInt1, g + paramInt2 + h, paramInt3, paramInt4);
  }
}
