package com.tencent.mobileqq.activity.activateFriend;

import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import mqq.util.WeakReference;

public class ActivatePageAdapter
  extends PagerAdapter
{
  private static final String jdField_a_of_type_JavaLangString = "ActivatePageAdapter";
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  private WeakReference jdField_a_of_type_MqqUtilWeakReference;
  
  public ActivatePageAdapter(ViewPager paramViewPager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_MqqUtilWeakReference = null;
    jdField_a_of_type_MqqUtilWeakReference = new WeakReference(paramViewPager);
  }
  
  public long a(int paramInt)
  {
    return paramInt;
  }
  
  public void a()
  {
    if ((jdField_a_of_type_MqqUtilWeakReference == null) || (jdField_a_of_type_MqqUtilWeakReference.get() == null)) {
      return;
    }
    ((ViewPager)jdField_a_of_type_MqqUtilWeakReference.get()).setAdapter(null);
    jdField_a_of_type_JavaUtilArrayList.clear();
    ((ViewPager)jdField_a_of_type_MqqUtilWeakReference.get()).setAdapter(this);
  }
  
  public void a(ActivateBasePage paramActivateBasePage)
  {
    jdField_a_of_type_JavaUtilArrayList.add(paramActivateBasePage);
    notifyDataSetChanged();
  }
  
  public void destroyItem(ViewGroup paramViewGroup, int paramInt, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ActivatePageAdapter", 4, "destroy item");
    }
    paramObject = (ActivateBasePage)jdField_a_of_type_JavaUtilArrayList.get(paramInt);
    paramObject.b();
    paramViewGroup.removeView(paramObject);
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public Object instantiateItem(ViewGroup paramViewGroup, int paramInt)
  {
    paramViewGroup.addView((View)jdField_a_of_type_JavaUtilArrayList.get(paramInt));
    return jdField_a_of_type_JavaUtilArrayList.get(paramInt);
  }
  
  public boolean isViewFromObject(View paramView, Object paramObject)
  {
    return paramView == paramObject;
  }
}
