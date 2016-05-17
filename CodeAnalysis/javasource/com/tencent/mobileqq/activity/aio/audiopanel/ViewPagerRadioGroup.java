package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.content.res.Resources;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.util.AttributeSet;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.LayoutParams;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import kus;

public class ViewPagerRadioGroup
  extends RadioGroup
  implements ViewPager.OnPageChangeListener
{
  public ViewPagerRadioGroup(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ViewPagerRadioGroup(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  private RadioButton a()
  {
    kus localKus = new kus(this, getContext());
    localKus.setButtonDrawable(2130838362);
    localKus.setGravity(17);
    Resources localResources = getResources();
    RadioGroup.LayoutParams localLayoutParams = new RadioGroup.LayoutParams(AIOUtils.a(10.0F, localResources), AIOUtils.a(10.0F, localResources));
    gravity = 17;
    int i = AIOUtils.a(3.0F, localResources);
    leftMargin = i;
    rightMargin = i;
    localKus.setLayoutParams(localLayoutParams);
    localKus.setClickable(true);
    return localKus;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    int j = getChildCount();
    int i;
    if (paramInt1 > j)
    {
      i = 0;
      while (i < paramInt1 - j)
      {
        addView(a());
        i += 1;
      }
    }
    if (paramInt1 < j)
    {
      i = j - 1;
      while (i >= paramInt1)
      {
        removeViewAt(i);
        i -= 1;
      }
    }
    if (paramInt2 >= 0)
    {
      i = paramInt2;
      if (paramInt2 < paramInt1) {}
    }
    else
    {
      i = 0;
    }
    if (paramInt1 > 0)
    {
      RadioButton localRadioButton = (RadioButton)getChildAt(i);
      localRadioButton.setButtonDrawable(2130838362);
      localRadioButton.setChecked(true);
    }
    paramInt1 = 0;
    while (paramInt1 < getChildCount())
    {
      ((RadioButton)getChildAt(paramInt1)).setVisibility(0);
      paramInt1 += 1;
    }
  }
  
  public void onPageScrollStateChanged(int paramInt) {}
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2) {}
  
  public void onPageSelected(int paramInt)
  {
    if (getChildCount() > paramInt)
    {
      RadioButton localRadioButton = (RadioButton)getChildAt(paramInt);
      if (localRadioButton != null)
      {
        localRadioButton.setChecked(true);
        if (paramInt == 1)
        {
          localRadioButton.setContentDescription("第二页，录音功能，向右划返回按住说话功能");
          localRadioButton.sendAccessibilityEvent(128);
        }
      }
    }
  }
}
