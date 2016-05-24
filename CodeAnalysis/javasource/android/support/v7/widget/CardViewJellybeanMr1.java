package android.support.v7.widget;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;

class CardViewJellybeanMr1
  extends CardViewEclairMr1
{
  CardViewJellybeanMr1() {}
  
  public void initStatic()
  {
    RoundRectDrawableWithShadow.sRoundRectHelper = new RoundRectDrawableWithShadow.RoundRectHelper()
    {
      public void drawRoundRect(Canvas paramAnonymousCanvas, RectF paramAnonymousRectF, float paramAnonymousFloat, Paint paramAnonymousPaint)
      {
        paramAnonymousCanvas.drawRoundRect(paramAnonymousRectF, paramAnonymousFloat, paramAnonymousFloat, paramAnonymousPaint);
      }
    };
  }
}
