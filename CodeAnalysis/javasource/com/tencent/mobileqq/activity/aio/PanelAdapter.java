package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.emoticonview.PanelRecycleBin;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XPanelContainer;
import java.util.ArrayList;
import kqq;

public class PanelAdapter
  extends PagerAdapter
{
  int jdField_a_of_type_Int;
  Context jdField_a_of_type_AndroidContentContext;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  PanelRecycleBin jdField_a_of_type_ComTencentMobileqqEmoticonviewPanelRecycleBin;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  public boolean a;
  int b;
  
  public PanelAdapter(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 4;
    jdField_b_of_type_Int = 2;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqEmoticonviewPanelRecycleBin = new PanelRecycleBin();
    jdField_a_of_type_AndroidContentContext = paramContext;
  }
  
  private void a(int paramInt, kqq paramKqq)
  {
    int m = jdField_a_of_type_Int;
    int n = jdField_b_of_type_Int;
    jdField_a_of_type_Int = paramInt;
    int i = 0;
    int j = 0;
    while (j < jdField_b_of_type_Int)
    {
      LinearLayout localLinearLayout = (LinearLayout)paramKqq.getChildAt(j);
      int k = 0;
      if (k < jdField_a_of_type_Int)
      {
        View localView = localLinearLayout.getChildAt(k);
        PanelAdapter.ViewHolder localViewHolder = (PanelAdapter.ViewHolder)localView.getTag();
        int i1 = m * n * paramInt + i;
        if (i1 < jdField_a_of_type_JavaUtilArrayList.size())
        {
          PlusPanel.PluginData localPluginData = (PlusPanel.PluginData)jdField_a_of_type_JavaUtilArrayList.get(i1);
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
          jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(jdField_a_of_type_AndroidGraphicsDrawableDrawable);
          if ((jdField_a_of_type_AndroidGraphicsDrawableDrawable instanceof URLDrawable))
          {
            URLDrawable localURLDrawable = (URLDrawable)jdField_a_of_type_AndroidGraphicsDrawableDrawable;
            if (localURLDrawable.getStatus() == 2) {
              localURLDrawable.restartDownload();
            }
          }
          jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_JavaLangString);
          if (jdField_a_of_type_Boolean)
          {
            jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
            label197:
            jdField_a_of_type_Int = jdField_a_of_type_Int;
            jdField_b_of_type_Int = jdField_b_of_type_Int;
            localView.setContentDescription(jdField_a_of_type_JavaLangString + "按钮");
            localView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
            localView.setEnabled(true);
          }
        }
        for (;;)
        {
          i += 1;
          k += 1;
          break;
          jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
          break label197;
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(4);
          jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(null);
          jdField_a_of_type_AndroidWidgetTextView.setText(null);
          jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
          jdField_a_of_type_Int = 0;
          jdField_b_of_type_Int = 0;
          localView.setContentDescription(null);
          localView.setOnClickListener(null);
          localView.setEnabled(false);
        }
      }
      j += 1;
    }
  }
  
  public int a()
  {
    return jdField_a_of_type_Int;
  }
  
  public View.OnClickListener a()
  {
    return jdField_a_of_type_AndroidViewView$OnClickListener;
  }
  
  public ArrayList a()
  {
    return jdField_a_of_type_JavaUtilArrayList;
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
  }
  
  public void a(View.OnClickListener paramOnClickListener)
  {
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
  }
  
  public void a(ArrayList paramArrayList)
  {
    jdField_a_of_type_JavaUtilArrayList = paramArrayList;
  }
  
  public int b()
  {
    return jdField_b_of_type_Int;
  }
  
  public void b(int paramInt)
  {
    jdField_b_of_type_Int = paramInt;
  }
  
  public void c(int paramInt)
  {
    if (jdField_a_of_type_AndroidViewViewGroup == null) {}
    for (;;)
    {
      return;
      if (paramInt >= 0)
      {
        int i = 0;
        while (i < jdField_a_of_type_AndroidViewViewGroup.getChildCount())
        {
          kqq localKqq = (kqq)jdField_a_of_type_AndroidViewViewGroup.getChildAt(i);
          if ((localKqq != null) && (paramInt == jdField_a_of_type_Int))
          {
            a(paramInt, localKqq);
            return;
          }
          i += 1;
        }
      }
    }
  }
  
  public void destroyItem(View paramView, int paramInt, Object paramObject)
  {
    kqq localKqq = (kqq)paramObject;
    ((ViewGroup)paramView).removeView(localKqq);
    localKqq.a();
    jdField_a_of_type_ComTencentMobileqqEmoticonviewPanelRecycleBin.a((View)paramObject);
  }
  
  public int getCount()
  {
    if ((jdField_a_of_type_Int == 0) || (jdField_b_of_type_Int == 0) || (jdField_a_of_type_JavaUtilArrayList == null)) {
      return 0;
    }
    return (jdField_a_of_type_JavaUtilArrayList.size() + jdField_a_of_type_Int * jdField_b_of_type_Int - 1) / (jdField_a_of_type_Int * jdField_b_of_type_Int);
  }
  
  public int getItemPosition(Object paramObject)
  {
    if (jdField_a_of_type_Boolean) {
      return -2;
    }
    if (((paramObject instanceof kqq)) && (jdField_a_of_type_Int >= getCount())) {
      return -2;
    }
    return super.getItemPosition(paramObject);
  }
  
  public Object instantiateItem(View paramView, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PanelIconAdapter", 2, "instantiateItem " + paramInt);
    }
    kqq localKqq = (kqq)jdField_a_of_type_ComTencentMobileqqEmoticonviewPanelRecycleBin.a();
    Object localObject;
    if (localKqq != null)
    {
      localObject = localKqq.getTag();
      if ((localObject != null) && ((localObject instanceof Integer)) && (((Integer)localKqq.getTag()).intValue() != XPanelContainer.e))
      {
        jdField_a_of_type_ComTencentMobileqqEmoticonviewPanelRecycleBin.a();
        localKqq = null;
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)paramView);
      localObject = localKqq;
      if (localKqq == null) {
        localObject = new kqq(this, jdField_a_of_type_AndroidContentContext, null);
      }
      jdField_a_of_type_Int = paramInt;
      a(paramInt, (kqq)localObject);
      if ((((kqq)localObject).getParent() != paramView) && (paramInt < getCount())) {
        ((ViewGroup)paramView).addView((View)localObject);
      }
      return localObject;
    }
  }
  
  public boolean isViewFromObject(View paramView, Object paramObject)
  {
    return paramView == paramObject;
  }
}
