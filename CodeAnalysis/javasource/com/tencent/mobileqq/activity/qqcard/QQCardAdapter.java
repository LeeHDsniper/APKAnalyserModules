package com.tencent.mobileqq.activity.qqcard;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.List;

public class QQCardAdapter
  extends BaseAdapter
{
  private Context jdField_a_of_type_AndroidContentContext;
  private CardItemBuilderFactory jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory;
  private List jdField_a_of_type_JavaUtilList;
  
  public QQCardAdapter(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory = new CardItemBuilderFactory(jdField_a_of_type_AndroidContentContext);
  }
  
  public List a()
  {
    return jdField_a_of_type_JavaUtilList;
  }
  
  public void a(List paramList)
  {
    if (paramList == null)
    {
      jdField_a_of_type_JavaUtilList.clear();
      return;
    }
    jdField_a_of_type_JavaUtilList = paramList;
  }
  
  public void b(List paramList)
  {
    if ((paramList == null) || (paramList.size() < 1)) {
      return;
    }
    jdField_a_of_type_JavaUtilList.addAll(paramList);
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_JavaUtilList == null) {
      return 0;
    }
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if (jdField_a_of_type_JavaUtilList == null) {
      return null;
    }
    return jdField_a_of_type_JavaUtilList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getItemViewType(int paramInt)
  {
    return jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory.a(jdField_a_of_type_JavaUtilList.get(paramInt));
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject = getItem(paramInt);
    BaseCardItemBuilder localBaseCardItemBuilder = jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory.a(localObject);
    if ((localBaseCardItemBuilder == null) || (localObject == null)) {
      return null;
    }
    return localBaseCardItemBuilder.a(localObject, paramView, paramViewGroup);
  }
  
  public int getViewTypeCount()
  {
    return 2;
  }
}
