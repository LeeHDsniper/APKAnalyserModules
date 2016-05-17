package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.RelativeLayout;
import android.widget.RemoteViews.RemoteView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

@RemoteViews.RemoteView
public class BreathAnimationLayout
  extends RelativeLayout
{
  private long jdField_a_of_type_Long;
  private boolean jdField_a_of_type_Boolean;
  
  public BreathAnimationLayout(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = -1L;
  }
  
  public BreathAnimationLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = -1L;
  }
  
  public BreathAnimationLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = -1L;
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (jdField_a_of_type_Boolean)
    {
      Drawable localDrawable = getBackground();
      if (localDrawable != null)
      {
        long l = AnimationUtils.currentAnimationTimeMillis();
        if (jdField_a_of_type_Long == -1L) {
          jdField_a_of_type_Long = l;
        }
        int i = Math.min(255, (int)((Math.sin((l - jdField_a_of_type_Long) % 1600L / 1600.0D * 6.283185307179586D) + 1.0D) / 2.0D * 255.0D + 0.5D));
        localDrawable.setBounds(0, 0, getWidth(), getHeight());
        localDrawable.setState(View.PRESSED_ENABLED_STATE_SET);
        localDrawable.draw(paramCanvas);
        i = paramCanvas.saveLayerAlpha(0.0F, 0.0F, getWidth(), getHeight(), i, 20);
        localDrawable.setState(View.EMPTY_STATE_SET);
        localDrawable.draw(paramCanvas);
        paramCanvas.restoreToCount(i);
      }
      return;
    }
    super.draw(paramCanvas);
  }
  
  public void setAnimating(boolean paramBoolean)
  {
    if (jdField_a_of_type_Boolean != paramBoolean)
    {
      jdField_a_of_type_Boolean = paramBoolean;
      jdField_a_of_type_Long = -1L;
      if (!paramBoolean) {
        refreshDrawableState();
      }
      invalidate();
    }
  }
}
