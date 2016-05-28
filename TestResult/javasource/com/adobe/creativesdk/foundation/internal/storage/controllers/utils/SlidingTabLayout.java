package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.graphics.Color;
import android.graphics.Typeface;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;

public class SlidingTabLayout
  extends HorizontalScrollView
{
  private SparseArray<String> mContentDescriptions = new SparseArray();
  private boolean mDistributeEvenly;
  private final SlidingTabStrip mTabStrip;
  private int mTabViewLayoutId;
  private int mTabViewTextViewId;
  private int mTitleOffset;
  private ViewPager mViewPager;
  private ViewPager.OnPageChangeListener mViewPagerPageChangeListener;
  
  public SlidingTabLayout(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public SlidingTabLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public SlidingTabLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setHorizontalScrollBarEnabled(false);
    setFillViewport(true);
    mTitleOffset = ((int)(24.0F * getResourcesgetDisplayMetricsdensity));
    mTabStrip = new SlidingTabStrip(paramContext);
    addView(mTabStrip, -1, -2);
  }
  
  private void populateTabStrip()
  {
    PagerAdapter localPagerAdapter = mViewPager.getAdapter();
    TabClickListener localTabClickListener = new TabClickListener(null);
    int j = 0;
    int i = 0;
    while (i < localPagerAdapter.getCount())
    {
      j += localPagerAdapter.getPageTitle(i).length();
      i += 1;
    }
    j /= localPagerAdapter.getCount();
    i = 0;
    if (i < localPagerAdapter.getCount())
    {
      Object localObject2 = null;
      Object localObject1 = null;
      if (mTabViewLayoutId != 0)
      {
        localObject2 = LayoutInflater.from(getContext()).inflate(mTabViewLayoutId, mTabStrip, false);
        localObject1 = (TextView)((View)localObject2).findViewById(mTabViewTextViewId);
      }
      Object localObject3 = localObject2;
      if (localObject2 == null) {
        localObject3 = createDefaultTabView(getContext());
      }
      localObject2 = localObject1;
      if (localObject1 == null)
      {
        localObject2 = localObject1;
        if (TextView.class.isInstance(localObject3)) {
          localObject2 = (TextView)localObject3;
        }
      }
      ((TextView)localObject2).setText(localPagerAdapter.getPageTitle(i));
      ((TextView)localObject2).setTextColor(Color.parseColor("#a3aeb7"));
      ((View)localObject3).setOnClickListener(localTabClickListener);
      localObject1 = (String)mContentDescriptions.get(i, null);
      if (localObject1 != null) {
        ((View)localObject3).setContentDescription((CharSequence)localObject1);
      }
      localObject1 = (LinearLayout.LayoutParams)((View)localObject3).getLayoutParams();
      if (mDistributeEvenly)
      {
        width = 0;
        weight = 1.0F;
      }
      for (;;)
      {
        mTabStrip.addView((View)localObject3);
        if (i == mViewPager.getCurrentItem())
        {
          ((TextView)localObject2).setTextColor(Color.parseColor("#2098f5"));
          ((View)localObject3).setSelected(true);
        }
        i += 1;
        break;
        if (localPagerAdapter.getPageTitle(i).length() < j)
        {
          width = 0;
          weight = 1.0F;
        }
        else
        {
          width = 0;
          weight = 2.0F;
        }
      }
    }
  }
  
  private void scrollToTab(int paramInt1, int paramInt2)
  {
    int i = mTabStrip.getChildCount();
    if ((i == 0) || (paramInt1 < 0) || (paramInt1 >= i)) {}
    View localView;
    do
    {
      return;
      localView = mTabStrip.getChildAt(paramInt1);
    } while (localView == null);
    i = localView.getLeft() + paramInt2;
    if (paramInt1 <= 0)
    {
      paramInt1 = i;
      if (paramInt2 <= 0) {}
    }
    else
    {
      paramInt1 = i - mTitleOffset;
    }
    scrollTo(paramInt1, 0);
  }
  
  protected TextView createDefaultTabView(Context paramContext)
  {
    paramContext = new TextView(paramContext);
    paramContext.setGravity(17);
    paramContext.setTextSize(2, 12.0F);
    paramContext.setTypeface(Typeface.DEFAULT_BOLD);
    paramContext.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
    TypedValue localTypedValue = new TypedValue();
    getContext().getTheme().resolveAttribute(16843534, localTypedValue, true);
    paramContext.setBackgroundResource(resourceId);
    paramContext.setAllCaps(true);
    int i = (int)(16.0F * getResourcesgetDisplayMetricsdensity);
    paramContext.setPadding(i, i, i, i);
    return paramContext;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (mViewPager != null) {
      scrollToTab(mViewPager.getCurrentItem(), 0);
    }
  }
  
  public void setCustomTabColorizer(TabColorizer paramTabColorizer)
  {
    mTabStrip.setCustomTabColorizer(paramTabColorizer);
  }
  
  public void setCustomTabView(int paramInt1, int paramInt2)
  {
    mTabViewLayoutId = paramInt1;
    mTabViewTextViewId = paramInt2;
    mTabStrip.setCustomLayoutIds(paramInt1, paramInt2);
  }
  
  public void setDistributeEvenly(boolean paramBoolean)
  {
    mDistributeEvenly = paramBoolean;
  }
  
  public void setOnPageChangeListener(ViewPager.OnPageChangeListener paramOnPageChangeListener)
  {
    mViewPagerPageChangeListener = paramOnPageChangeListener;
  }
  
  public void setSelectedIndicatorColors(int... paramVarArgs)
  {
    mTabStrip.setSelectedIndicatorColors(paramVarArgs);
  }
  
  public void setViewPager(ViewPager paramViewPager)
  {
    mTabStrip.removeAllViews();
    mViewPager = paramViewPager;
    if (paramViewPager != null)
    {
      paramViewPager.setOnPageChangeListener(new InternalViewPagerListener(null));
      populateTabStrip();
    }
  }
  
  private class InternalViewPagerListener
    implements ViewPager.OnPageChangeListener
  {
    private int mScrollState;
    
    private InternalViewPagerListener() {}
    
    public void onPageScrollStateChanged(int paramInt)
    {
      mScrollState = paramInt;
      if (mViewPagerPageChangeListener != null) {
        mViewPagerPageChangeListener.onPageScrollStateChanged(paramInt);
      }
    }
    
    public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
    {
      int i = mTabStrip.getChildCount();
      if ((i == 0) || (paramInt1 < 0) || (paramInt1 >= i)) {
        return;
      }
      mTabStrip.onViewPagerPageChanged(paramInt1, paramFloat);
      View localView = mTabStrip.getChildAt(paramInt1);
      if (localView != null) {}
      for (i = (int)(localView.getWidth() * paramFloat);; i = 0)
      {
        SlidingTabLayout.this.scrollToTab(paramInt1, i);
        if (mViewPagerPageChangeListener == null) {
          break;
        }
        mViewPagerPageChangeListener.onPageScrolled(paramInt1, paramFloat, paramInt2);
        return;
      }
    }
    
    public void onPageSelected(int paramInt)
    {
      if (mScrollState == 0)
      {
        mTabStrip.onViewPagerPageChanged(paramInt, 0.0F);
        SlidingTabLayout.this.scrollToTab(paramInt, 0);
      }
      int i = 0;
      if (i < mTabStrip.getChildCount())
      {
        View localView = mTabStrip.getChildAt(i);
        if (paramInt == i) {}
        for (boolean bool = true;; bool = false)
        {
          localView.setSelected(bool);
          i += 1;
          break;
        }
      }
      if (mViewPagerPageChangeListener != null) {
        mViewPagerPageChangeListener.onPageSelected(paramInt);
      }
    }
  }
  
  private class TabClickListener
    implements View.OnClickListener
  {
    private TabClickListener() {}
    
    public void onClick(View paramView)
    {
      int i = 0;
      for (;;)
      {
        if (i < mTabStrip.getChildCount())
        {
          if (paramView == mTabStrip.getChildAt(i)) {
            mViewPager.setCurrentItem(i);
          }
        }
        else {
          return;
        }
        i += 1;
      }
    }
  }
  
  public static abstract interface TabColorizer
  {
    public abstract int getIndicatorColor(int paramInt);
  }
}
