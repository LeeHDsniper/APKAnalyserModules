package com.tencent.mobileqq.activity.aio.anim;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.view.View;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.bubble.AnimationConfig;
import com.tencent.mobileqq.bubble.BubbleConfig.Chartlet;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.bubble.BubbleInfo.CommonAttrs;
import com.tencent.mobileqq.bubble.VipBubbleDrawable;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.Pair;
import com.tencent.widget.ListView;
import ksh;
import ksi;
import ksj;
import ksm;

public class XBubbleAnimation
  extends AIOAnimationConatiner.AIOAnimator
{
  public static final String c;
  private long jdField_a_of_type_Long;
  private Rect jdField_a_of_type_AndroidGraphicsRect = new Rect();
  public Handler a;
  private View jdField_a_of_type_AndroidViewView;
  private BaseBubbleBuilder.ViewHolder jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder;
  public VipPngPlayAnimationDrawable a;
  private boolean jdField_a_of_type_Boolean = true;
  public View b;
  public VipPngPlayAnimationDrawable b;
  public BubbleInfo.CommonAttrs b;
  protected int c;
  public BubbleInfo.CommonAttrs c;
  protected int d;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_JavaLangString = XBubbleAnimation.class.getSimpleName();
  }
  
  public XBubbleAnimation(int paramInt, AIOAnimationConatiner paramAIOAnimationConatiner, ListView paramListView)
  {
    super(paramInt, paramAIOAnimationConatiner, paramListView);
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable = new VipPngPlayAnimationDrawable(paramListView.getResources());
    jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable = new VipPngPlayAnimationDrawable(paramListView.getResources());
    jdField_a_of_type_AndroidOsHandler = new Handler();
  }
  
  private int[] a(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    switch (paramInt1)
    {
    default: 
      paramInt1 = 0;
      paramInt2 = 0;
      return new int[] { paramInt2, paramInt1 };
    case 0: 
      if (paramBoolean) {}
      for (paramInt1 = jdField_a_of_type_AndroidGraphicsRect.right;; paramInt1 = jdField_a_of_type_AndroidGraphicsRect.left)
      {
        paramInt3 = jdField_a_of_type_AndroidGraphicsRect.top;
        paramInt2 = paramInt1;
        paramInt1 = paramInt3;
        break;
      }
    case 1: 
      if (paramBoolean) {}
      for (paramInt1 = jdField_a_of_type_AndroidGraphicsRect.right;; paramInt1 = jdField_a_of_type_AndroidGraphicsRect.left)
      {
        paramInt3 = jdField_a_of_type_AndroidGraphicsRect.bottom;
        paramInt2 = paramInt1;
        paramInt1 = paramInt3;
        break;
      }
    case 2: 
      if (paramBoolean) {}
      for (paramInt1 = jdField_a_of_type_AndroidGraphicsRect.right;; paramInt1 = jdField_a_of_type_AndroidGraphicsRect.left)
      {
        paramInt3 = (int)(jdField_a_of_type_AndroidGraphicsRect.bottom - jdField_a_of_type_AndroidGraphicsRect.height() / 2.0F - paramInt3 / 2.0F);
        paramInt2 = paramInt1;
        paramInt1 = paramInt3;
        break;
      }
    case 3: 
      if (paramBoolean) {}
      for (paramInt1 = (int)(jdField_a_of_type_AndroidGraphicsRect.right + jdField_a_of_type_AndroidGraphicsRect.width() / 2 - paramInt2 / 2.0F);; paramInt1 = (int)(jdField_a_of_type_AndroidGraphicsRect.left + jdField_a_of_type_AndroidGraphicsRect.width() / 2 - paramInt2 / 2.0F))
      {
        paramInt3 = jdField_a_of_type_AndroidGraphicsRect.top;
        paramInt2 = paramInt1;
        paramInt1 = paramInt3;
        break;
      }
    case 4: 
      if (paramBoolean) {}
      for (paramInt1 = (int)(jdField_a_of_type_AndroidGraphicsRect.right + jdField_a_of_type_AndroidGraphicsRect.width() / 2 - paramInt2 / 2.0F);; paramInt1 = (int)(jdField_a_of_type_AndroidGraphicsRect.left + jdField_a_of_type_AndroidGraphicsRect.width() / 2 - paramInt2 / 2.0F))
      {
        paramInt3 = jdField_a_of_type_AndroidGraphicsRect.bottom;
        paramInt2 = paramInt1;
        paramInt1 = paramInt3;
        break;
      }
    case 5: 
      if (paramBoolean) {}
      for (paramInt1 = jdField_a_of_type_AndroidGraphicsRect.left;; paramInt1 = jdField_a_of_type_AndroidGraphicsRect.right)
      {
        paramInt3 = jdField_a_of_type_AndroidGraphicsRect.top;
        paramInt2 = paramInt1;
        paramInt1 = paramInt3;
        break;
      }
    case 6: 
      if (paramBoolean) {}
      for (paramInt1 = jdField_a_of_type_AndroidGraphicsRect.left;; paramInt1 = jdField_a_of_type_AndroidGraphicsRect.right)
      {
        paramInt3 = jdField_a_of_type_AndroidGraphicsRect.bottom;
        paramInt2 = paramInt1;
        paramInt1 = paramInt3;
        break;
      }
    }
    if (paramBoolean) {}
    for (paramInt1 = jdField_a_of_type_AndroidGraphicsRect.left;; paramInt1 = jdField_a_of_type_AndroidGraphicsRect.right)
    {
      paramInt3 = (int)(jdField_a_of_type_AndroidGraphicsRect.bottom - jdField_a_of_type_AndroidGraphicsRect.height() / 2.0F - paramInt3 / 2.0F);
      paramInt2 = paramInt1;
      paramInt1 = paramInt3;
      break;
    }
  }
  
  protected void a(int paramInt)
  {
    int j = 0;
    if (jdField_b_of_type_AndroidViewView != null)
    {
      jdField_b_of_type_AndroidViewView.offsetTopAndBottom(paramInt);
      if ((!jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.d) && (jdField_b_of_type_AndroidViewView.getBottom() > 0)) {}
    }
    for (int i = 1;; i = 0)
    {
      if (jdField_a_of_type_AndroidViewView != null)
      {
        jdField_a_of_type_AndroidViewView.offsetTopAndBottom(paramInt);
        if (!jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.d)
        {
          paramInt = j;
          if (jdField_a_of_type_AndroidViewView.getBottom() > 0) {
            break label78;
          }
        }
      }
      for (paramInt = 1;; paramInt = i)
      {
        label78:
        if (paramInt != 0) {
          jdField_a_of_type_AndroidOsHandler.post(new ksi(this));
        }
        return;
      }
    }
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (jdField_a_of_type_Boolean == paramBoolean1) {}
    Drawable localDrawable;
    do
    {
      do
      {
        return;
        jdField_a_of_type_Boolean = paramBoolean1;
      } while (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder == null);
      localDrawable = jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_AndroidViewView.getBackground();
    } while (!(localDrawable instanceof VipBubbleDrawable));
    BubbleConfig.Chartlet localChartlet;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo != null)
    {
      localChartlet = jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo.a;
      label62:
      if ((localChartlet != null) && (((jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs != null) && (jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_ComTencentMobileqqBubbleAnimationConfig.d)) || ((jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs != null) && (jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_ComTencentMobileqqBubbleAnimationConfig.d))))
      {
        if (!paramBoolean1) {
          break label173;
        }
        ((VipBubbleDrawable)localDrawable).d(true);
      }
    }
    for (;;)
    {
      if (paramBoolean2) {
        ((VipBubbleDrawable)localDrawable).a(paramBoolean1);
      }
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d(jdField_c_of_type_JavaLangString, 2, "background alpha changed:" + String.valueOf(paramBoolean1));
      return;
      localChartlet = null;
      break label62;
      label173:
      ((VipBubbleDrawable)localDrawable).d(false);
    }
  }
  
  protected boolean a()
  {
    boolean bool3 = false;
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder = null;
    Object localObject = AIOUtils.a(AIOUtils.a(jdField_a_of_type_ComTencentWidgetListView, d));
    boolean bool1;
    label340:
    label378:
    boolean bool2;
    label419:
    label426:
    int i;
    int n;
    int k;
    int j;
    int m;
    if ((localObject != null) && ((localObject instanceof BaseBubbleBuilder.ViewHolder)))
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder = ((BaseBubbleBuilder.ViewHolder)localObject);
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_AndroidViewView == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout == null)) {
        e();
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder == null) || (jdField_b_of_type_AndroidViewView == null) || (jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs == null)) {
        break label1399;
      }
      jdField_a_of_type_AndroidGraphicsRect.top = (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_AndroidViewView.getTop() + jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.getTop() - jdField_a_of_type_ComTencentWidgetListView.getScrollY());
      jdField_a_of_type_AndroidGraphicsRect.left = (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_AndroidViewView.getLeft() + jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.getLeft());
      jdField_a_of_type_AndroidGraphicsRect.bottom = (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_AndroidViewView.getBottom() + jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.getTop() - jdField_a_of_type_ComTencentWidgetListView.getScrollY());
      jdField_a_of_type_AndroidGraphicsRect.right = (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_AndroidViewView.getRight() + jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.getLeft());
      if (QLog.isColorLevel()) {
        QLog.d(jdField_c_of_type_JavaLangString, 2, "bindView bubbleRect top=" + jdField_a_of_type_AndroidGraphicsRect.top + ",left=" + jdField_a_of_type_AndroidGraphicsRect.left + ",bottom=" + jdField_a_of_type_AndroidGraphicsRect.bottom + ",right=" + jdField_a_of_type_AndroidGraphicsRect.right + ",listView height=" + jdField_a_of_type_ComTencentWidgetListView.getHeight());
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder.jdField_a_of_type_ComTencentMobileqqDataChatMessage.isSend()) {
        break label1159;
      }
      bool1 = true;
      if ((jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs == null) || (jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_ComTencentMobileqqBubbleAnimationConfig == null) || (jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_ComTencentMobileqqBubbleAnimationConfig.e)) {
        break label1165;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.c = false;
      if (jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs != null)
      {
        if (!jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_b_of_type_JavaLangString.equals(jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_b_of_type_JavaLangString)) {
          break label1183;
        }
        localObject = jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable;
        if (bool1) {
          break label1177;
        }
        bool2 = true;
        c = bool2;
      }
      localObject = a(jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.f, jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right, jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.bottom, bool1);
      i = localObject[1];
      n = jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.top + i;
      if (bool1) {
        break label1195;
      }
      i = localObject[0];
      i = jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.left + i;
      k = i;
      if (jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs == null) {
        break label1426;
      }
      localObject = a(jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.f, jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right, jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.bottom, bool1);
      j = localObject[0] - jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.left - jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right;
      m = localObject[1] + jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.top;
      k = i;
      i = m;
    }
    for (;;)
    {
      label596:
      if (QLog.isColorLevel()) {
        QLog.d(jdField_c_of_type_JavaLangString, 2, "bindView mView master_x=" + k + ",master_y=" + n + ",mAttrsFirst.mRect.right=" + jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right + ",mAttrsFirst.mRect.bottom=" + jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.bottom + ",listview.Width=" + jdField_a_of_type_ComTencentWidgetListView.getWidth() + ",listview.Height=" + jdField_a_of_type_ComTencentWidgetListView.getHeight());
      }
      if ((k >= -jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right) && (k <= jdField_a_of_type_ComTencentWidgetListView.getWidth()) && (n >= -jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.bottom))
      {
        k -= jdField_b_of_type_AndroidViewView.getLeft();
        m = n - jdField_b_of_type_AndroidViewView.getTop();
        if ((k != 0) || (m != 0))
        {
          jdField_b_of_type_AndroidViewView.offsetLeftAndRight(k);
          jdField_b_of_type_AndroidViewView.offsetTopAndBottom(m);
          if (QLog.isColorLevel()) {
            QLog.d(jdField_c_of_type_JavaLangString, 2, "bindView mView.offsetLeftAndRight " + k + ",mView.offsetTopAndBottom " + m);
          }
        }
      }
      label841:
      for (bool1 = true;; bool1 = false)
      {
        if ((jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs != null) && (jdField_a_of_type_AndroidViewView != null) && (bool1))
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_c_of_type_JavaLangString, 2, "bindView mLinkView x=" + j + ",y=" + i + ",mRect.right=" + jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right + ",mRect.bottom=" + jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.bottom + ",listview.Width=" + jdField_a_of_type_ComTencentWidgetListView.getWidth() + ",listview.Height=" + jdField_a_of_type_ComTencentWidgetListView.getHeight());
          }
          bool1 = bool3;
          if (j >= -jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right)
          {
            bool1 = bool3;
            if (j <= jdField_a_of_type_ComTencentWidgetListView.getWidth())
            {
              bool1 = bool3;
              if (i >= -jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.bottom)
              {
                j -= jdField_a_of_type_AndroidViewView.getLeft();
                i -= jdField_a_of_type_AndroidViewView.getTop();
                if ((j == 0) && (i == 0)) {
                  break label1353;
                }
                jdField_a_of_type_AndroidViewView.offsetLeftAndRight(j);
                jdField_a_of_type_AndroidViewView.offsetTopAndBottom(i);
                if (QLog.isColorLevel()) {
                  QLog.d(jdField_c_of_type_JavaLangString, 2, "bindView mLinkView.offsetLeftAndRight " + j + ",mLinkView.offsetTopAndBottom " + i);
                }
              }
            }
          }
          for (;;)
          {
            bool1 = true;
            return bool1;
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.e(jdField_c_of_type_JavaLangString, 2, "list view item's tag can not cast to ViewHolder, object:" + localObject);
            break;
            label1159:
            bool1 = false;
            break label340;
            label1165:
            jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.c = bool1;
            break label378;
            label1177:
            bool2 = false;
            break label419;
            label1183:
            jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.c = bool1;
            break label426;
            label1195:
            m = localObject[0] - jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.left - jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right;
            k = m;
            if (jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs == null) {
              break label1426;
            }
            localObject = a(jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.f, jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.right, jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.bottom, bool1);
            j = localObject[0] + jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.left;
            i = localObject[1] + jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_AndroidGraphicsRect.top;
            k = m;
            break label596;
            if (!QLog.isColorLevel()) {
              break label841;
            }
            QLog.d(jdField_c_of_type_JavaLangString, 2, "bindView mView dx=" + k + ",dy=" + m);
            break label841;
            label1353:
            if (QLog.isColorLevel()) {
              QLog.d(jdField_c_of_type_JavaLangString, 2, "bindView mLinkView dx=" + j + ",dy=" + i);
            }
          }
          label1399:
          jdField_a_of_type_AndroidOsHandler.post(new ksh(this));
          return false;
        }
        return bool1;
      }
      label1426:
      i = 0;
      j = 0;
    }
  }
  
  protected boolean a(int paramInt)
  {
    return paramInt == 0;
  }
  
  protected boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_c_of_type_JavaLangString, 2, "layout changed=" + paramBoolean + ",left=" + paramInt1 + ",top=" + paramInt2 + ",right=" + paramInt3 + ",bottom=" + paramInt4);
    }
    return a();
  }
  
  protected boolean a(Object... paramVarArgs)
  {
    int j = 1;
    int k = ((Integer)paramVarArgs[0]).intValue();
    long l = ((Long)paramVarArgs[1]).longValue();
    if (paramVarArgs.length != 3) {}
    Object localObject;
    do
    {
      return false;
      d = AIOUtils.a(l, jdField_a_of_type_ComTencentWidgetListView.a());
      localObject = AIOUtils.a(AIOUtils.a(jdField_a_of_type_ComTencentWidgetListView, d));
      if ((localObject == null) || (!(localObject instanceof BaseBubbleBuilder.ViewHolder))) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseBubbleBuilder$ViewHolder = ((BaseBubbleBuilder.ViewHolder)localObject);
      if ((l == jdField_a_of_type_Long) && (jdField_c_of_type_Int == k)) {
        break label495;
      }
      paramVarArgs = (Pair)paramVarArgs[2];
    } while ((paramVarArgs == null) || (first == null) || (first).jdField_a_of_type_ArrayOfJavaLangString == null));
    e();
    jdField_a_of_type_Long = l;
    jdField_c_of_type_Int = k;
    jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs = ((BubbleInfo.CommonAttrs)first);
    jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs = ((BubbleInfo.CommonAttrs)second);
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.a(jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_ArrayOfJavaLangString, jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.e);
    int i;
    if (k != 0)
    {
      paramVarArgs = jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable;
      if (jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_b_of_type_Boolean)
      {
        i = 1;
        label217:
        l = i;
      }
    }
    else
    {
      jdField_b_of_type_AndroidViewView = new ksj(this, jdField_a_of_type_ComTencentWidgetListView.getContext());
      jdField_b_of_type_AndroidViewView.setBackgroundDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable);
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.addViewInLayout(jdField_b_of_type_AndroidViewView, -1, AIOAnimationConatiner.a, false);
      jdField_b_of_type_AndroidViewView.layout(0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.getIntrinsicWidth(), jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.getIntrinsicHeight());
      if ((jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs != null) && (jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_ArrayOfJavaLangString != null))
      {
        jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.a(jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_a_of_type_ArrayOfJavaLangString, jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.e);
        if (k != 0)
        {
          paramVarArgs = jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable;
          if (!jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.jdField_b_of_type_Boolean) {
            break label484;
          }
          i = j;
          label352:
          l = i;
        }
        jdField_a_of_type_AndroidViewView = new ksm(this, jdField_a_of_type_ComTencentWidgetListView.getContext());
        jdField_a_of_type_AndroidViewView.setBackgroundDrawable(jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable);
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.addViewInLayout(jdField_a_of_type_AndroidViewView, -1, AIOAnimationConatiner.a, false);
        jdField_a_of_type_AndroidViewView.layout(0, 0, jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.getIntrinsicWidth(), jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.getIntrinsicHeight());
      }
    }
    label484:
    label495:
    for (boolean bool = a();; bool = false)
    {
      return bool;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e(jdField_c_of_type_JavaLangString, 2, "list view item's tag can not cast to ViewHolder, object:" + localObject);
      break;
      i = jdField_b_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.d;
      break label217;
      i = jdField_c_of_type_ComTencentMobileqqBubbleBubbleInfo$CommonAttrs.d;
      break label352;
    }
  }
  
  protected void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.a();
    }
    if (jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable != null) {
      jdField_b_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.a();
    }
  }
  
  public void d()
  {
    e();
  }
  
  public void e()
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_c_of_type_JavaLangString, 2, "now stop current animation!");
    }
    c();
    if (jdField_b_of_type_AndroidViewView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.removeViewInLayout(jdField_b_of_type_AndroidViewView);
      jdField_b_of_type_AndroidViewView = null;
    }
    if (jdField_a_of_type_AndroidViewView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.removeViewInLayout(jdField_a_of_type_AndroidViewView);
      jdField_a_of_type_AndroidViewView = null;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.invalidate();
  }
}
