package com.tencent.mobileqq.activity.aio.panel;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.animation.AlphaAnimation;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.troop.widget.RedDotImageView;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class PanelIconLinearLayout
  extends LinearLayout
  implements View.OnClickListener
{
  public static int b = 0;
  public int a;
  public Context a;
  public SharedPreferences a;
  private PanelIconLinearLayout.PanelIconCallback jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout$PanelIconCallback;
  QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  public ArrayList a;
  private int c = -1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public PanelIconLinearLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_Int = 100;
    setOrientation(0);
    jdField_a_of_type_AndroidContentContext = paramContext;
    setBackgroundResource(2130842498);
    b = AIOUtils.a(40.0F, paramContext.getResources());
  }
  
  public ArrayList a()
  {
    return jdField_a_of_type_JavaUtilArrayList;
  }
  
  public void a()
  {
    removeAllViews();
    int i = 0;
    while (i < jdField_a_of_type_JavaUtilArrayList.size())
    {
      RedDotImageView localRedDotImageView = new RedDotImageView(jdField_a_of_type_AndroidContentContext);
      LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
      weight = 1.0F;
      gravity = 16;
      localRedDotImageView.setTag(Integer.valueOf(((int[])jdField_a_of_type_JavaUtilArrayList.get(i))[0]));
      localRedDotImageView.setImageResource(((int[])jdField_a_of_type_JavaUtilArrayList.get(i))[2]);
      localRedDotImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getResources().getString(((int[])jdField_a_of_type_JavaUtilArrayList.get(i))[1]));
      localRedDotImageView.setOnClickListener(this);
      localRedDotImageView.setSelected(false);
      addView(localRedDotImageView, localLayoutParams);
      i += 1;
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, BaseChatPie paramBaseChatPie)
  {
    jdField_a_of_type_AndroidContentSharedPreferences = paramQQAppInterface.a().getSharedPreferences(paramQQAppInterface.a(), 0);
    int i = jdField_a_of_type_Int;
    if (QLog.isColorLevel()) {
      QLog.d("PanelIcon", 2, "loadData curType=" + i);
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
    ShortVideoUtils.jdField_a_of_type_Boolean = ShortVideoUtils.b();
    int j = jdField_a_of_type_Int;
    if (QLog.isColorLevel()) {
      QLog.d("PlusPanel", 2, "reload(): type=" + j);
    }
    if (j == 3000)
    {
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.i);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
      if (AIOPanelUtiles.jdField_a_of_type_Boolean) {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.m);
      }
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
      if (jdField_a_of_type_JavaUtilArrayList.size() != 0) {
        break label1431;
      }
      setCustomHeight(0);
    }
    for (;;)
    {
      a();
      c = i;
      return;
      if (j == 1)
      {
        paramQQAppInterface = (HotChatManager)paramQQAppInterface.getManager(59);
        if ((paramQQAppInterface != null) && (paramQQAppInterface.b(jdField_a_of_type_JavaLangString)))
        {
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.p);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.q);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
          break;
        }
        a(AnonymousChatHelper.a().a(jdField_a_of_type_JavaLangString));
        break;
      }
      if ((j == 0) || (ChatActivityUtils.a(paramQQAppInterface, jdField_a_of_type_JavaLangString)))
      {
        if ((1024 == jdField_a_of_type_Int) && (CrmUtils.a(paramQQAppInterface, jdField_a_of_type_JavaLangString)))
        {
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.l);
          break;
        }
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.i);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        if (AIOPanelUtiles.jdField_a_of_type_Boolean) {
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.m);
        }
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
        if (!ChatActivityUtils.a(paramQQAppInterface, paramSessionInfo)) {
          break;
        }
        if (QLog.isColorLevel()) {
          QLog.d("PanelIcon", 2, "loadData curType=" + i + "isSingleWayFriend");
        }
        jdField_a_of_type_JavaUtilArrayList.clear();
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
        break;
      }
      if (j == 7100)
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.l);
        break;
      }
      if ((j == 1000) || (j == 1004) || (j == 1006))
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
        break;
      }
      if (j == 1020)
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.l);
        break;
      }
      if (j == 1008) {
        break;
      }
      if (j == 1005)
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.l);
        break;
      }
      if (j == 1003)
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.l);
        break;
      }
      if ((j == 1001) || (j == 1010))
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
        break;
      }
      if (j == 1021)
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
        break;
      }
      if ((j == 1022) || (j == 1023) || (j == 1009) || (j == 1024))
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.l);
        break;
      }
      if (j == 6000)
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.r);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.s);
        break;
      }
      if (j == 1025)
      {
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
        break;
      }
      if (j == 9501)
      {
        if ((paramBaseChatPie == null) || (!(paramBaseChatPie instanceof DeviceMsgChatPie))) {
          break;
        }
        if (((DeviceMsgChatPie)paramBaseChatPie).w()) {
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
        }
        if (((DeviceMsgChatPie)paramBaseChatPie).v())
        {
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
        }
        if (((DeviceMsgChatPie)paramBaseChatPie).s())
        {
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.o);
          jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.n);
        }
        if (!((DeviceMsgChatPie)paramBaseChatPie).u()) {
          break;
        }
        jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.r);
        break;
      }
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
      break;
      label1431:
      setCustomHeight(b);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.b);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.f);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.h);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.d);
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.k);
      return;
    }
    jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.jdField_a_of_type_ArrayOfInt);
    jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.i);
    jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.e);
    jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.g);
    if (AIOPanelUtiles.jdField_a_of_type_Boolean) {
      jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.m);
    }
    jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.c);
    jdField_a_of_type_JavaUtilArrayList.add(AIOPanelUtiles.j);
  }
  
  public void a(boolean paramBoolean, SessionInfo paramSessionInfo)
  {
    jdField_a_of_type_JavaUtilArrayList.clear();
    a(paramBoolean);
    a();
    if (paramSessionInfo != null)
    {
      c = jdField_a_of_type_Int;
      return;
    }
    c = 1;
  }
  
  public void onClick(View paramView)
  {
    Object localObject = paramView.getTag();
    if ((localObject == null) || (!(localObject instanceof Integer))) {
      return;
    }
    ((Integer)localObject).intValue();
    jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout$PanelIconCallback.a(paramView.getTag());
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, View.MeasureSpec.makeMeasureSpec(jdField_a_of_type_Int, 1073741824));
    setMeasuredDimension(getMeasuredWidth(), jdField_a_of_type_Int);
  }
  
  public void setAllAlpha(float paramFloat)
  {
    int i = 0;
    if (i < getChildCount())
    {
      if (Build.VERSION.SDK_INT >= 11) {
        getChildAt(i).setAlpha(paramFloat);
      }
      for (;;)
      {
        i += 1;
        break;
        AlphaAnimation localAlphaAnimation = new AlphaAnimation(paramFloat, paramFloat);
        localAlphaAnimation.setDuration(0L);
        localAlphaAnimation.setFillAfter(true);
        getChildAt(i).startAnimation(localAlphaAnimation);
      }
    }
  }
  
  public void setAllEnable(boolean paramBoolean)
  {
    int i = 0;
    while (i < getChildCount())
    {
      getChildAt(i).setEnabled(paramBoolean);
      i += 1;
    }
  }
  
  public void setAllUnSelected()
  {
    int i = 0;
    while (i < getChildCount())
    {
      getChildAt(i).setSelected(false);
      i += 1;
    }
  }
  
  public void setChildAlpha(int paramInt, float paramFloat)
  {
    View localView = findViewWithTag(Integer.valueOf(paramInt));
    if (localView != null)
    {
      if (Build.VERSION.SDK_INT >= 11) {
        localView.setAlpha(paramFloat);
      }
    }
    else {
      return;
    }
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(paramFloat, paramFloat);
    localAlphaAnimation.setDuration(0L);
    localAlphaAnimation.setFillAfter(true);
    localView.startAnimation(localAlphaAnimation);
  }
  
  public void setChildContentDescription(int paramInt, String paramString)
  {
    View localView = findViewWithTag(Integer.valueOf(paramInt));
    if (localView != null) {
      localView.setContentDescription(paramString);
    }
  }
  
  public void setChildImageSource(int paramInt1, int paramInt2)
  {
    ImageView localImageView = (ImageView)findViewWithTag(Integer.valueOf(paramInt1));
    if (localImageView != null) {
      localImageView.setImageResource(paramInt2);
    }
  }
  
  public void setChildVisible(int paramInt1, int paramInt2)
  {
    View localView = findViewWithTag(Integer.valueOf(paramInt1));
    if (localView != null) {
      localView.setVisibility(paramInt2);
    }
  }
  
  public void setCustomHeight(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    requestLayout();
  }
  
  public void setEnable(int paramInt, boolean paramBoolean)
  {
    View localView = findViewWithTag(Integer.valueOf(paramInt));
    if (localView != null) {
      localView.setEnabled(paramBoolean);
    }
  }
  
  public void setPanelIconListener(PanelIconLinearLayout.PanelIconCallback paramPanelIconCallback)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout$PanelIconCallback = paramPanelIconCallback;
  }
  
  public void setSelected(int paramInt)
  {
    int i = 0;
    if (i < getChildCount())
    {
      View localView = getChildAt(i);
      if (localView.getTag().equals(Integer.valueOf(paramInt))) {
        localView.setSelected(true);
      }
      for (;;)
      {
        i += 1;
        break;
        localView.setSelected(false);
      }
    }
  }
  
  public void setShowRed(int paramInt, boolean paramBoolean)
  {
    int i = 0;
    for (;;)
    {
      if (i < getChildCount())
      {
        View localView = getChildAt(i);
        if (localView.getTag().equals(Integer.valueOf(paramInt))) {
          ((RedDotImageView)localView).a(paramBoolean);
        }
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  public void setUnSelected(int paramInt)
  {
    int i = 0;
    for (;;)
    {
      if (i < getChildCount())
      {
        View localView = getChildAt(i);
        if (localView.getTag().equals(Integer.valueOf(paramInt))) {
          localView.setSelected(false);
        }
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
}
