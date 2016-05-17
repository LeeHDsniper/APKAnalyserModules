package com.tencent.mobileqq.activity.aio.anim;

import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.ListAdapter;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ListView;

public class FloorJumper
  extends AIOAnimationConatiner.AIOAnimator
{
  static final float jdField_a_of_type_Float;
  static final float[] jdField_a_of_type_ArrayOfFloat;
  static final float jdField_b_of_type_Float = 39.772724F * jdField_a_of_type_Float;
  static final float[] jdField_b_of_type_ArrayOfFloat;
  static final float jdField_c_of_type_Float = 17.5F * jdField_a_of_type_Float;
  static final int jdField_c_of_type_Int = 1;
  static final float jdField_d_of_type_Float = 3000.0F * jdField_a_of_type_Float;
  static final int jdField_d_of_type_Int = 2;
  static final int jdField_e_of_type_Int = 3;
  static final int jdField_f_of_type_Int = 4;
  static final int jdField_g_of_type_Int = 5;
  static final int h = 500;
  static final int i;
  long jdField_a_of_type_Long = 0L;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private View jdField_a_of_type_AndroidViewView;
  boolean jdField_a_of_type_Boolean = true;
  int jdField_b_of_type_Int = 0;
  long jdField_b_of_type_Long = 0L;
  long jdField_c_of_type_Long = 0L;
  private long jdField_d_of_type_Long = 0L;
  float jdField_e_of_type_Float;
  float jdField_f_of_type_Float;
  float jdField_g_of_type_Float;
  int j;
  int k;
  int l;
  int m;
  int n;
  int o;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Float = agetResourcesgetDisplayMetricsdensity;
    jdField_a_of_type_ArrayOfFloat = new float[] { 0.0F, 3.82F, 7.28F, 10.38F, 13.12F, 15.499998F, 17.52F, 19.18F, 20.48F, 21.420002F, 21.999998F, 22.22F, 22.08F, 21.580004F, 20.720001F, 19.500004F, 17.920002F, 15.98F, 13.680004F, 11.020004F, 8.0F, 4.6200027F, 0.87999725F, 0.0F, 0.0F, 1.5679998F, 2.8479996F, 3.8399992F, 4.543999F, 4.959999F, 5.0879984F, 4.927998F, 4.4799986F, 3.7439995F, 2.7199993F, 1.407999F, 0.0F, 0.0F, 0.5824001F, 0.9344002F, 1.0560002F, 0.9472004F, 0.60800076F, 0.03840065F, 0.0F };
    jdField_b_of_type_ArrayOfFloat = new float[] { 1.05F, 1.05F, 1.05F, 1.05F, 1.05F, 1.05F, 1.0419999F, 1.0239999F, 1.006F, 0.988F, 0.97F, 0.95199996F, 0.96599996F, 0.98399997F, 1.002F, 1.02F, 1.038F, 1.05F, 1.05F, 1.05F, 1.05F, 1.05F, 1.05F, 1.05F, 1.0356F, 1.0212F, 1.0067999F, 0.9924F, 0.978F, 0.9636F, 0.9508F, 0.9652F, 0.9796F, 0.99399996F, 1.0084F, 1.0228F, 1.0436F, 0.98488F, 0.97336F, 0.96184F, 0.95032F, 0.9612F, 0.97271997F, 0.98424F, 1.02288F };
    i = jdField_a_of_type_ArrayOfFloat.length * 10;
  }
  
  public FloorJumper(int paramInt, AIOAnimationConatiner paramAIOAnimationConatiner, ListView paramListView)
  {
    super(paramInt, paramAIOAnimationConatiner, paramListView);
    g = (750.0F * jdField_a_of_type_Float);
  }
  
  private BaseChatItemLayout a(long paramLong)
  {
    Object localObject2;
    if (paramLong == 0L)
    {
      i1 = 0;
      while (i1 < jdField_a_of_type_ComTencentWidgetListView.getChildCount())
      {
        localObject1 = jdField_a_of_type_ComTencentWidgetListView.getChildAt(i1);
        if ((localObject1 instanceof BaseChatItemLayout))
        {
          localObject2 = (BaseBubbleBuilder.ViewHolder)AIOUtils.a((View)localObject1);
          if ((jdField_a_of_type_Int != 0) && (jdField_a_of_type_AndroidViewView.getTop() + ((View)localObject1).getTop() + BaseChatItemLayout.k > 0)) {
            return (BaseChatItemLayout)localObject1;
          }
        }
        i1 += 1;
      }
    }
    int i4 = jdField_a_of_type_ComTencentWidgetListView.m();
    int i5 = jdField_a_of_type_ComTencentWidgetListView.n();
    int i3 = jdField_a_of_type_ComTencentWidgetListView.s();
    int i6 = jdField_a_of_type_ComTencentWidgetListView.t();
    Object localObject1 = jdField_a_of_type_ComTencentWidgetListView.a();
    if (localObject1 == null) {
      return null;
    }
    int i7 = ((ListAdapter)localObject1).getCount();
    int i2 = i3;
    int i1 = 0;
    if (i2 <= i6) {
      if (i2 >= i4) {}
    }
    for (;;)
    {
      i2 += 1;
      break;
      if (i2 >= i7 - i5) {
        return null;
      }
      if (i1 == 0)
      {
        if (paramLong == ((ListAdapter)localObject1).getItemId(i2)) {
          i1 = 1;
        }
      }
      else
      {
        localObject2 = jdField_a_of_type_ComTencentWidgetListView.getChildAt(i2 - i3);
        if (((localObject2 instanceof BaseChatItemLayout)) && (ajdField_a_of_type_Int != 0)) {
          return (BaseChatItemLayout)localObject2;
        }
      }
    }
  }
  
  int a(int paramInt, BaseBubbleBuilder.ViewHolder paramViewHolder)
  {
    int i1;
    int i2;
    int i3;
    if (jdField_a_of_type_ComTencentMobileqqDataChatMessage.isSend())
    {
      i1 = jdField_a_of_type_AndroidViewView.getLeft() + BaseChatItemLayout.n + BaseChatItemLayout.s;
      i2 = jdField_a_of_type_AndroidViewView.getRight() - BaseChatItemLayout.m - BaseChatItemLayout.r;
      if (paramInt > i1) {
        break label129;
      }
      if (i2 - jdField_c_of_type_Float >= i1) {
        break label108;
      }
      i3 = i1;
    }
    label108:
    label129:
    do
    {
      return i3;
      i1 = jdField_a_of_type_AndroidViewView.getLeft() + BaseChatItemLayout.m + BaseChatItemLayout.r;
      i2 = jdField_a_of_type_AndroidViewView.getRight() - BaseChatItemLayout.n - BaseChatItemLayout.n;
      break;
      return (int)(Math.random() * (i2 - i1 - jdField_c_of_type_Float) + i1);
      if (paramInt >= i2)
      {
        if (i1 + jdField_c_of_type_Float < i2) {
          return i2;
        }
        d1 = i1 + jdField_c_of_type_Float;
        double d2 = Math.random();
        return (int)((i2 - i1 - jdField_c_of_type_Float) * d2 + d1);
      }
      if (paramInt - i1 > jdField_c_of_type_Float) {
        break label211;
      }
      i3 = paramInt;
    } while (i2 - paramInt <= jdField_c_of_type_Float);
    label211:
    float f1;
    if ((paramInt - i1 > jdField_c_of_type_Float) && (i2 - paramInt > jdField_c_of_type_Float))
    {
      f1 = (int)(Math.random() * (i2 - i1 - jdField_c_of_type_Float - jdField_c_of_type_Float));
      return (int)(i1 + jdField_c_of_type_Float + f1);
    }
    if (paramInt - i1 > jdField_c_of_type_Float)
    {
      f1 = (int)(Math.random() * (paramInt - i1 - jdField_c_of_type_Float));
      return (int)(paramInt - f1);
    }
    double d1 = Math.random();
    return (int)((int)((i2 - paramInt - jdField_c_of_type_Float) * d1) + paramInt);
  }
  
  public long a()
  {
    if (!jdField_a_of_type_Boolean) {
      return -1L;
    }
    long l1 = AnimationUtils.currentAnimationTimeMillis();
    switch (jdField_b_of_type_Int)
    {
    default: 
      return -1L;
    case 1: 
    case 3: 
      if (l1 < jdField_c_of_type_Long) {
        return jdField_c_of_type_Long - l1;
      }
      BaseBubbleBuilder.ViewHolder localViewHolder;
      if (jdField_b_of_type_Int == 1)
      {
        jdField_c_of_type_Long = l1;
        localBaseChatItemLayout = a(0L);
        if (localBaseChatItemLayout != null)
        {
          localViewHolder = (BaseBubbleBuilder.ViewHolder)AIOUtils.a(localBaseChatItemLayout);
          if (localViewHolder != null)
          {
            jdField_b_of_type_Int = 2;
            jdField_a_of_type_Long = 0L;
            jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq;
            jdField_d_of_type_Long = 0L;
            j = 0;
            i1 = jdField_a_of_type_AndroidViewView.getTop();
            k = (localBaseChatItemLayout.getTop() + i1 + BaseChatItemLayout.k - jdField_a_of_type_ComTencentWidgetListView.getScrollY());
            l = a((jdField_a_of_type_AndroidViewView.getLeft() + jdField_a_of_type_AndroidViewView.getRight()) / 2, localViewHolder);
            m = 0;
            e = 0.0F;
            f = ((float)(500.0F * jdField_a_of_type_Float * Math.random()));
            o = 0;
            n = 0;
          }
        }
        for (;;)
        {
          return 0L;
          jdField_b_of_type_Int = 5;
          l = (jdField_a_of_type_ComTencentWidgetListView.getWidth() / 2 + (int)(Math.random() * 160.0D * jdField_a_of_type_Float - 80.0D));
          m = o;
          jdField_d_of_type_Long = 0L;
          jdField_a_of_type_Long = 0L;
          jdField_b_of_type_Long = 0L;
          j = 0;
          k = 0;
          e = 0.0F;
          f = ((float)(500.0F * jdField_a_of_type_Float * Math.random()));
        }
      }
      BaseChatItemLayout localBaseChatItemLayout = a(jdField_b_of_type_Long);
      if (localBaseChatItemLayout != null)
      {
        localViewHolder = (BaseBubbleBuilder.ViewHolder)AIOUtils.a(localBaseChatItemLayout);
        if (localViewHolder != null)
        {
          l = n;
          m = o;
          jdField_b_of_type_Int = 4;
          jdField_c_of_type_Long = l1;
          jdField_d_of_type_Long = 0L;
          jdField_a_of_type_Long = jdField_b_of_type_Long;
          jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq;
          f = ((float)-(750.0D + (Math.random() - 1.0D) * 300.0D) * jdField_a_of_type_Float);
          k = (jdField_a_of_type_AndroidViewView.getTop() + localBaseChatItemLayout.getTop() + BaseChatItemLayout.k - jdField_a_of_type_ComTencentWidgetListView.getScrollY() - m);
          double d1 = (Math.sqrt(f * f + jdField_d_of_type_Float * 2.0F * k) - f) / jdField_d_of_type_Float;
          j = (a(n, localViewHolder) - n);
          e = ((float)(j / d1));
        }
      }
      for (;;)
      {
        return 0L;
        l = n;
        m = o;
        jdField_b_of_type_Int = 5;
        jdField_c_of_type_Long = l1;
        jdField_d_of_type_Long = 0L;
        jdField_a_of_type_Long = jdField_b_of_type_Long;
        jdField_b_of_type_Long = 0L;
        j = 0;
        k = 0;
        e = ((float)(Math.random() * 400.0D - 100.0D));
        f = ((float)-(750.0D + (Math.random() - 1.0D) * 300.0D) * jdField_a_of_type_Float);
      }
    case 2: 
    case 4: 
      if (jdField_d_of_type_Long == 0L)
      {
        f1 = (float)(l1 - jdField_c_of_type_Long) / 1000.0F;
        i2 = (int)(f * f1 + jdField_d_of_type_Float * f1 * f1 / 2.0F);
        int i3 = (int)(e * f1);
        f2 = g;
        f3 = f;
        f1 = Math.min(f2, Math.abs(f1 * jdField_d_of_type_Float + f3)) / g * 0.25F + 0.9F;
        i1 = i2;
        if (i2 > k)
        {
          i1 = k;
          f1 = 1.0F;
          jdField_d_of_type_Long = l1;
        }
        o = (i1 + m);
        n = (l + i3);
        a(n, o, new float[] { f1 });
        return FloorJumperSet.jdField_a_of_type_Long;
      }
      if (l1 - jdField_d_of_type_Long <= i)
      {
        f1 = (float)(l1 - jdField_d_of_type_Long) / 1000.0F;
        i2 = Math.round((float)(l1 - jdField_d_of_type_Long) / 10.0F);
        i1 = i2;
        if (i2 >= jdField_a_of_type_ArrayOfFloat.length) {
          i1 = jdField_a_of_type_ArrayOfFloat.length - 1;
        }
        f1 = (int)(f1 * Math.max(Math.min(e, jdField_b_of_type_Float), -jdField_b_of_type_Float));
        f2 = jdField_a_of_type_ArrayOfFloat[i1];
        f3 = jdField_a_of_type_Float;
        float f4 = jdField_b_of_type_ArrayOfFloat[i1];
        n = ((int)(f1 + (l + j)));
        o = ((int)(m + k - f2 * f3));
        a(n, o, new float[] { f4 });
        return FloorJumperSet.jdField_a_of_type_Long;
      }
      o = (m + k);
      a(n, o, new float[0]);
      i1 = (int)(500.0D + Math.random() * 800.0D - 400.0D);
      jdField_c_of_type_Long = (AnimationUtils.currentAnimationTimeMillis() + i1);
      jdField_b_of_type_Int = 3;
      return i1;
    }
    float f1 = (float)(l1 - jdField_c_of_type_Long) / 1000.0F;
    int i1 = (int)(f * f1 + jdField_d_of_type_Float * f1 * f1 / 2.0F);
    int i2 = (int)(e * f1);
    float f2 = g;
    float f3 = f;
    f1 = Math.min(f2, Math.abs(f1 * jdField_d_of_type_Float + f3)) / g;
    o = (i1 + m);
    n = (l + i2);
    if ((o > jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getHeight() + jdField_a_of_type_AndroidViewView.getHeight()) || (n < -jdField_a_of_type_AndroidViewView.getWidth() / 2) || (n > jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getWidth() + jdField_a_of_type_AndroidViewView.getWidth() / 2))
    {
      a(0, jdField_a_of_type_AndroidViewView.getWidth(), new float[0]);
      c();
      return -1L;
    }
    a(n, o, new float[] { f1 * 0.25F + 0.9F });
    return FloorJumperSet.jdField_a_of_type_Long;
  }
  
  void a(int paramInt1, int paramInt2, float... paramVarArgs)
  {
    int i1 = jdField_a_of_type_AndroidViewView.getLeft();
    int i2 = jdField_a_of_type_AndroidViewView.getWidth() / 2;
    int i3 = jdField_a_of_type_AndroidViewView.getBottom();
    jdField_a_of_type_AndroidViewView.offsetTopAndBottom(paramInt2 - i3);
    jdField_a_of_type_AndroidViewView.offsetLeftAndRight(paramInt1 - (i1 + i2));
    if (VersionUtils.e())
    {
      if ((paramVarArgs != null) && (paramVarArgs.length > 0))
      {
        jdField_a_of_type_AndroidViewView.setScaleY(paramVarArgs[0]);
        jdField_a_of_type_AndroidViewView.setScaleX(2.0F - paramVarArgs[0]);
      }
    }
    else {
      return;
    }
    jdField_a_of_type_AndroidViewView.setScaleY(1.0F);
    jdField_a_of_type_AndroidViewView.setScaleX(1.0F);
  }
  
  void a(long paramLong)
  {
    if (jdField_c_of_type_Long > 0L) {
      jdField_c_of_type_Long += paramLong;
    }
    if (jdField_d_of_type_Long > 0L) {
      jdField_d_of_type_Long += paramLong;
    }
  }
  
  public boolean a(boolean paramBoolean)
  {
    if (jdField_a_of_type_Boolean)
    {
      if (paramBoolean) {
        switch (jdField_b_of_type_Int)
        {
        }
      }
      int i1;
      while ((jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner == null) || (jdField_a_of_type_AndroidViewView == null))
      {
        jdField_a_of_type_Boolean = false;
        jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
        jdField_a_of_type_AndroidViewView = null;
        return false;
        i1 = AIOUtils.a(jdField_b_of_type_Long, jdField_a_of_type_ComTencentWidgetListView.a());
        if (i1 < jdField_a_of_type_ComTencentWidgetListView.s())
        {
          o = -1;
        }
        else if (i1 > jdField_a_of_type_ComTencentWidgetListView.t())
        {
          if (jdField_d_of_type_Long > 0L)
          {
            c();
            return false;
          }
          jdField_b_of_type_Int = 5;
          jdField_a_of_type_Long = 0L;
          jdField_b_of_type_Long = 0L;
        }
        else
        {
          BaseBubbleBuilder.ViewHolder localViewHolder = (BaseBubbleBuilder.ViewHolder)AIOUtils.a(AIOUtils.a(jdField_a_of_type_ComTencentWidgetListView, i1));
          if (localViewHolder != null)
          {
            i1 = jdField_a_of_type_AndroidViewView.getTop();
            i1 = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.getTop() + i1 + BaseChatItemLayout.k - jdField_a_of_type_ComTencentWidgetListView.getScrollY() - (m + k);
            if (i1 != 0)
            {
              m += i1;
              o += i1;
              jdField_a_of_type_AndroidViewView.offsetTopAndBottom(i1);
            }
          }
          else
          {
            c();
            return false;
            i1 = AIOUtils.a(jdField_b_of_type_Long, jdField_a_of_type_ComTencentWidgetListView.a());
            int i2 = AIOUtils.a(jdField_a_of_type_Long, jdField_a_of_type_ComTencentWidgetListView.a());
            if ((i1 >= jdField_a_of_type_ComTencentWidgetListView.s()) && (i1 <= jdField_a_of_type_ComTencentWidgetListView.t()))
            {
              localViewHolder = (BaseBubbleBuilder.ViewHolder)AIOUtils.a(AIOUtils.a(jdField_a_of_type_ComTencentWidgetListView, i1));
              if (localViewHolder != null)
              {
                i1 = jdField_a_of_type_AndroidViewView.getTop();
                i1 = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.getTop() + i1 + BaseChatItemLayout.k - jdField_a_of_type_ComTencentWidgetListView.getScrollY() - (m + k);
                if (i1 != 0)
                {
                  m += i1;
                  o += i1;
                  jdField_a_of_type_AndroidViewView.offsetTopAndBottom(i1);
                }
              }
              else
              {
                c();
                return false;
              }
            }
            else if ((i2 >= jdField_a_of_type_ComTencentWidgetListView.s()) && (i2 <= jdField_a_of_type_ComTencentWidgetListView.t()))
            {
              localViewHolder = (BaseBubbleBuilder.ViewHolder)AIOUtils.a(AIOUtils.a(jdField_a_of_type_ComTencentWidgetListView, i2));
              if (localViewHolder != null)
              {
                i1 = jdField_a_of_type_AndroidViewView.getTop();
                i1 = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.getTop() + i1 + BaseChatItemLayout.k - jdField_a_of_type_ComTencentWidgetListView.getScrollY() - (m + k);
                if (i1 != 0)
                {
                  m += i1;
                  o += i1;
                  jdField_a_of_type_AndroidViewView.offsetTopAndBottom(i1);
                }
              }
              else
              {
                c();
                return false;
              }
            }
            else if (i1 < jdField_a_of_type_ComTencentWidgetListView.s())
            {
              o = -1;
            }
            else if (i2 > jdField_a_of_type_ComTencentWidgetListView.t())
            {
              jdField_b_of_type_Int = 5;
              jdField_a_of_type_Long = 0L;
              jdField_b_of_type_Long = 0L;
            }
            else
            {
              c();
              return false;
            }
          }
        }
      }
      if ((o > jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getHeight() + jdField_a_of_type_AndroidViewView.getHeight()) || (n < -jdField_a_of_type_AndroidViewView.getWidth() / 2) || (n > jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.getWidth() + jdField_a_of_type_AndroidViewView.getWidth() / 2))
      {
        c();
        return false;
      }
      if (o <= 0) {
        switch (jdField_b_of_type_Int)
        {
        }
      }
      for (;;)
      {
        return true;
        i1 = AIOUtils.a(jdField_b_of_type_Long, jdField_a_of_type_ComTencentWidgetListView.a());
        if ((i1 < jdField_a_of_type_ComTencentWidgetListView.s()) || (i1 > jdField_a_of_type_ComTencentWidgetListView.t()))
        {
          a(new Object[0]);
          a(n, o, new float[0]);
          continue;
          a(new Object[0]);
          a(n, o, new float[0]);
        }
      }
    }
    c();
    return false;
  }
  
  protected boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (jdField_a_of_type_Boolean) {
      return a(true);
    }
    return false;
  }
  
  protected boolean a(Object... paramVarArgs)
  {
    Rect localRect;
    if (jdField_a_of_type_AndroidViewView == null)
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = ((Drawable)paramVarArgs[0]);
      if (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null) {
        return false;
      }
      localRect = jdField_a_of_type_AndroidGraphicsDrawableDrawable.getBounds();
      jdField_a_of_type_AndroidViewView = new View(jdField_a_of_type_ComTencentWidgetListView.getContext());
      jdField_a_of_type_AndroidViewView.setBackgroundDrawable(jdField_a_of_type_AndroidGraphicsDrawableDrawable);
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.addViewInLayout(jdField_a_of_type_AndroidViewView, -1, AIOAnimationConatiner.a, false);
      if (localRect.isEmpty())
      {
        jdField_a_of_type_AndroidViewView.layout(-jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth(), -jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight(), 0, 0);
        if (VersionUtils.e())
        {
          jdField_a_of_type_AndroidViewView.setPivotX(jdField_a_of_type_AndroidViewView.getWidth() / 2);
          jdField_a_of_type_AndroidViewView.setPivotY(jdField_a_of_type_AndroidViewView.getHeight());
          jdField_a_of_type_AndroidViewView.setLayerType(2, null);
        }
        label161:
        jdField_b_of_type_Int = 2;
        jdField_a_of_type_Boolean = true;
        if (paramVarArgs.length <= 1) {
          break label301;
        }
      }
    }
    label301:
    for (paramVarArgs = paramVarArgs[1];; paramVarArgs = Integer.valueOf(0))
    {
      int i1 = ((Integer)paramVarArgs).intValue();
      if (QLog.isColorLevel()) {
        QLog.d("eggs", 2, "start floor jumper. delay: " + i1);
      }
      long l1 = AnimationUtils.currentAnimationTimeMillis();
      jdField_c_of_type_Long = (i1 + l1);
      jdField_b_of_type_Int = 1;
      return true;
      jdField_a_of_type_AndroidViewView.layout(-localRect.width(), -localRect.height(), 0, 0);
      break;
      jdField_a_of_type_AndroidViewView.offsetLeftAndRight(-jdField_a_of_type_AndroidViewView.getRight());
      jdField_a_of_type_AndroidViewView.offsetTopAndBottom(-jdField_a_of_type_AndroidViewView.getBottom());
      break label161;
    }
  }
  
  protected void c()
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.removeViewInLayout(jdField_a_of_type_AndroidViewView);
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
    jdField_a_of_type_AndroidViewView = null;
  }
}
