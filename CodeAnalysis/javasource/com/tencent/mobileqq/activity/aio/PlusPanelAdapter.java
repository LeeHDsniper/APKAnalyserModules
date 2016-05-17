package com.tencent.mobileqq.activity.aio;

import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import java.util.ArrayList;

public class PlusPanelAdapter
  extends BaseAdapter
{
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  
  public PlusPanelAdapter()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View.OnClickListener a()
  {
    return jdField_a_of_type_AndroidViewView$OnClickListener;
  }
  
  public ArrayList a()
  {
    return jdField_a_of_type_JavaUtilArrayList;
  }
  
  public void a(View.OnClickListener paramOnClickListener)
  {
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
  }
  
  public void a(ArrayList paramArrayList)
  {
    jdField_a_of_type_JavaUtilArrayList = paramArrayList;
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_JavaUtilArrayList != null) {
      return jdField_a_of_type_JavaUtilArrayList.size();
    }
    return 0;
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = BaseApplication.getContext();
    PlusPanel.PluginData localPluginData;
    if (paramView == null)
    {
      paramView = LayoutInflater.from(paramViewGroup).inflate(2130903178, null);
      paramViewGroup = new PlusPanelAdapter.ViewHolder();
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131297496));
      b = ((ImageView)paramView.findViewById(2131297498));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131297497));
      paramView.setTag(paramViewGroup);
      localPluginData = (PlusPanel.PluginData)jdField_a_of_type_JavaUtilArrayList.get(paramInt);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(jdField_a_of_type_AndroidGraphicsDrawableDrawable);
      jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_JavaLangString);
      if (!jdField_a_of_type_Boolean) {
        break label163;
      }
      b.setVisibility(0);
    }
    for (;;)
    {
      jdField_a_of_type_Int = jdField_a_of_type_Int;
      paramView.setContentDescription(b);
      paramView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      return paramView;
      paramViewGroup = (PlusPanelAdapter.ViewHolder)paramView.getTag();
      break;
      label163:
      b.setVisibility(8);
    }
  }
}
