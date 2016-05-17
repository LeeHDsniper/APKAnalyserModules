package com.tencent.widget;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import uaq;

public class AdapterViewPagerAdapter
  extends PagerAdapter
{
  private Context jdField_a_of_type_AndroidContentContext;
  private SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  private AdapterViewPagerAdapter.AdapterViewFactory jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$AdapterViewFactory;
  private AdapterViewPagerAdapter.PageInflateDelegate jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$PageInflateDelegate;
  private PagerBaseAdapterWrapper jdField_a_of_type_ComTencentWidgetPagerBaseAdapterWrapper;
  
  public AdapterViewPagerAdapter(Context paramContext, BaseAdapter paramBaseAdapter, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentWidgetPagerBaseAdapterWrapper = new PagerBaseAdapterWrapper(paramBaseAdapter, paramInt);
    jdField_a_of_type_ComTencentWidgetPagerBaseAdapterWrapper.registerDataSetObserver(new uaq(this));
  }
  
  public AdapterView a(int paramInt)
  {
    Object localObject2 = (AdapterView)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      if (jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$AdapterViewFactory != null) {
        localObject1 = jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$AdapterViewFactory.a(jdField_a_of_type_AndroidContentContext, paramInt);
      }
    }
    else
    {
      if (localObject1 != null)
      {
        localObject2 = new PagerBaseAdapterWrapper(jdField_a_of_type_ComTencentWidgetPagerBaseAdapterWrapper.a(), jdField_a_of_type_ComTencentWidgetPagerBaseAdapterWrapper.a());
        ((PagerBaseAdapterWrapper)localObject2).a(paramInt);
        ((AdapterView)localObject1).setAdapter((Adapter)localObject2);
        jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, localObject1);
      }
      return localObject1;
    }
    throw new IllegalArgumentException("setAdapterViewFactory should be invoked first!");
  }
  
  public void a(AdapterViewPagerAdapter.AdapterViewFactory paramAdapterViewFactory)
  {
    jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$AdapterViewFactory = paramAdapterViewFactory;
  }
  
  public void a(AdapterViewPagerAdapter.PageInflateDelegate paramPageInflateDelegate)
  {
    jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$PageInflateDelegate = paramPageInflateDelegate;
  }
  
  public void destroyItem(ViewGroup paramViewGroup, int paramInt, Object paramObject)
  {
    if (jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$PageInflateDelegate != null)
    {
      jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$PageInflateDelegate.a(paramViewGroup, (View)paramObject, paramInt);
      return;
    }
    paramViewGroup.removeView((View)paramObject);
  }
  
  public int getCount()
  {
    return jdField_a_of_type_ComTencentWidgetPagerBaseAdapterWrapper.c();
  }
  
  public Object instantiateItem(ViewGroup paramViewGroup, int paramInt)
  {
    AdapterView localAdapterView = a(paramInt);
    if (localAdapterView == null) {
      return null;
    }
    if (jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$PageInflateDelegate != null) {
      return jdField_a_of_type_ComTencentWidgetAdapterViewPagerAdapter$PageInflateDelegate.a(paramViewGroup, localAdapterView, paramInt);
    }
    paramViewGroup.addView(localAdapterView);
    return localAdapterView;
  }
  
  public boolean isViewFromObject(View paramView, Object paramObject)
  {
    return paramView == paramObject;
  }
}
