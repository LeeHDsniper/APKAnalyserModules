package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.tencent.biz.pubaccount.ecshopassit.RecentItemEcShop;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.activity.recent.cur.DragTextView;
import com.tencent.mobileqq.activity.recent.data.RecentItemTroopMsgData;
import com.tencent.mobileqq.activity.recent.data.RecentTroopAssistantItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.CustomWidgetUtil;
import com.tencent.widget.FixSizeImageView;
import com.tencent.widget.SingleLineTextView;
import java.util.ArrayList;
import java.util.List;

public class RecentEfficientItemBuilder
  extends RecentItemBaseBuilder
{
  public static final int a = 3;
  public static int b = 0;
  private static final String b = "RecentDefaultItemBuilder";
  private List a;
  
  public RecentEfficientItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a()
  {
    return 3;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    Object localObject;
    if ((paramView != null) && ((paramView.getTag() instanceof RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder)))
    {
      paramOnDragModeChangedListener = (RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder)paramView.getTag();
      paramViewGroup = paramView;
      paramView = paramOnDragModeChangedListener;
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setTag(Integer.valueOf(paramInt));
      if (AppSetting.i) {
        paramViewGroup.setContentDescription(null);
      }
      if (!(paramObject instanceof RecentBaseData)) {
        break label497;
      }
      localObject = (RecentBaseData)paramObject;
      paramOnDragModeChangedListener = null;
      if (paramRecentFaceDecoder != null) {
        paramOnDragModeChangedListener = paramRecentFaceDecoder.a((RecentBaseData)localObject);
      }
      a(paramViewGroup, (RecentBaseData)localObject, paramContext, paramOnDragModeChangedListener);
      if ((paramObject instanceof RecentItemEcShop))
      {
        jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(paramOnClickListener);
        jdField_a_of_type_AndroidWidgetImageView.setTag(-1, Integer.valueOf(paramInt));
        if (AppSetting.i) {
          jdField_a_of_type_AndroidWidgetImageView.setContentDescription(String.format("点击进入%1$s资料卡页面", new Object[] { jdField_a_of_type_JavaLangString }));
        }
      }
    }
    for (;;)
    {
      a(paramContext, paramViewGroup, paramInt, paramObject, paramView, paramOnClickListener);
      paramViewGroup.setOnClickListener(paramOnClickListener);
      paramViewGroup.setOnLongClickListener(paramOnLongClickListener);
      paramViewGroup.setTag(-1, Integer.valueOf(paramInt));
      return paramViewGroup;
      paramOnDragModeChangedListener = new RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder();
      localObject = a(paramContext, 2130904725, paramOnDragModeChangedListener);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)((View)localObject).findViewById(2131296683));
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView = ((DragTextView)((View)localObject).findViewById(2131301975));
      jdField_a_of_type_ComTencentWidgetSingleLineTextView = ((SingleLineTextView)((View)localObject).findViewById(2131297018));
      b = ((SingleLineTextView)((View)localObject).findViewById(2131298601));
      paramViewGroup = paramContext.getResources();
      float f = DeviceInfoUtil.a();
      paramView = paramViewGroup.getColorStateList(2131428215);
      paramViewGroup = paramViewGroup.getColorStateList(2131428178);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setTextColor(paramViewGroup);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setTextSize(17.0F);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextColor(paramView, 0);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextSize(12.0F, 0);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setCompoundDrawablePadding((int)(3.0F * f));
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextPadding((int)(5.0F * f), 2);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextColor(paramView, 2);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextSize(17.0F, 2);
      b.setTextColor(paramView);
      b.setTextSize(14.0F);
      b.setExtendTextPadding((int)(f * 2.0F), 1);
      b.setExtendTextSize(14.0F, 1);
      ((View)localObject).setTag(paramOnDragModeChangedListener);
      paramViewGroup = (ViewGroup)localObject;
      paramView = paramOnDragModeChangedListener;
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter == null) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setOnModeChangeListener(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a());
      paramViewGroup = (ViewGroup)localObject;
      paramView = paramOnDragModeChangedListener;
      break;
      label497:
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText("");
      b.setText("");
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setVisibility(4);
    }
  }
  
  public List a(RecentBaseData paramRecentBaseData, Context paramContext)
  {
    if ((paramRecentBaseData == null) || (paramContext == null)) {
      return null;
    }
    int i = M;
    paramRecentBaseData = paramContext.getResources();
    int j;
    if (jdField_a_of_type_JavaUtilList == null)
    {
      jdField_a_of_type_JavaUtilList = new ArrayList();
      j = i & 0xF0;
      if (j != 32) {
        break label115;
      }
      jdField_a_of_type_JavaUtilList.add(paramRecentBaseData.getString(jdField_a_of_type_ArrayOfInt[2]));
    }
    for (;;)
    {
      if ((i & 0xF) == 1) {
        jdField_a_of_type_JavaUtilList.add(paramRecentBaseData.getString(jdField_a_of_type_ArrayOfInt[0]));
      }
      return jdField_a_of_type_JavaUtilList;
      jdField_a_of_type_JavaUtilList.clear();
      break;
      label115:
      if (j == 16) {
        jdField_a_of_type_JavaUtilList.add(paramRecentBaseData.getString(jdField_a_of_type_ArrayOfInt[3]));
      }
    }
  }
  
  public void a(View paramView, Drawable paramDrawable)
  {
    if ((paramView == null) || (paramDrawable == null)) {}
    do
    {
      do
      {
        return;
        paramView = paramView.getTag();
      } while (!(paramView instanceof RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder));
      paramView = (RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder)paramView;
    } while (jdField_a_of_type_AndroidWidgetImageView == null);
    jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData)
  {
    if ((paramView == null) || (paramRecentBaseData == null)) {}
    do
    {
      do
      {
        return;
        paramView = paramView.getTag();
      } while (!(paramView instanceof RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder));
      paramView = (RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder)paramView;
    } while (jdField_a_of_type_ComTencentWidgetSingleLineTextView == null);
    jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText(jdField_a_of_type_JavaLangString);
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData, Context paramContext, Drawable paramDrawable)
  {
    int j = 1;
    if ((paramView == null) || (paramRecentBaseData == null))
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.recent", 2, "bindView|param invalidate");
      }
      return;
    }
    if ((paramView.getTag() instanceof RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder)) {}
    for (paramContext = (RecentEfficientItemBuilder.RecentEfficientItemBuilderHolder)paramView.getTag();; paramContext = null)
    {
      if (paramContext == null)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.i("Q.recent", 2, "bindView|holder is null, tag = " + paramView.getTag());
        return;
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setCompoundDrawablesWithIntrinsicBounds(0, I);
      paramDrawable = jdField_a_of_type_JavaLangCharSequence;
      label124:
      int i;
      if (paramDrawable != null)
      {
        paramDrawable = paramDrawable.toString();
        jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendText(paramDrawable, 2);
        jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendText(jdField_b_of_type_JavaLangString, 0);
        jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText(jdField_a_of_type_JavaLangString);
        switch (F)
        {
        default: 
          i = 0;
          label199:
          b.setCompoundDrawablesWithIntrinsicBounds(i, 0);
          i = K;
          paramDrawable = jdField_c_of_type_JavaLangCharSequence;
          if (paramDrawable != null)
          {
            paramDrawable = paramDrawable.toString();
            if ((!TextUtils.isEmpty(paramDrawable)) && (i != 0)) {
              b.setExtendTextColor(ColorStateList.valueOf(i), 1);
            }
            b.setExtendText(paramDrawable, 1);
          }
          break;
        }
      }
      try
      {
        b.setText(jdField_b_of_type_JavaLangCharSequence);
        m = H;
        i = G;
        if (m > 0) {
          if (i == 0)
          {
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(-1, paramView);
            k = 99;
            m = 0;
            j = 0;
            i = 0;
            CustomWidgetUtil.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView, i, m, j, k, null);
            if ((M & 0xF0) != 32) {
              break label623;
            }
            jdField_a_of_type_AndroidViewView.setBackgroundResource(2130838183);
            if (AppSetting.i) {
              paramView.setContentDescription(jdField_c_of_type_JavaLangString);
            }
            if ((jdField_a_of_type_AndroidWidgetImageView instanceof FixSizeImageView)) {
              ((FixSizeImageView)jdField_a_of_type_AndroidWidgetImageView).a(paramRecentBaseData.c());
            }
            if ((!(paramRecentBaseData instanceof RecentItemTroopMsgData)) || (!((RecentItemTroopMsgData)paramRecentBaseData).b())) {
              break;
            }
            jdField_a_of_type_ComTencentWidgetSingleLineTextView.setCompoundDrawablesWithIntrinsicBounds(0, 2130839642);
            return;
            paramDrawable = "";
            break label124;
            i = 2130838895;
            break label199;
            i = 2130838895;
            break label199;
            i = 2130838901;
            break label199;
            i = 2130838901;
            break label199;
            i = 2130838284;
            break label199;
            paramDrawable = "";
          }
        }
      }
      catch (Exception paramDrawable)
      {
        for (;;)
        {
          int m;
          int k;
          paramDrawable.printStackTrace();
          b.setText(jdField_b_of_type_JavaLangCharSequence + " ");
          continue;
          if (i == 2)
          {
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(-1, paramView);
            k = 99;
            m = 0;
            int n = 0;
            i = j;
            j = n;
          }
          else if (i == 3)
          {
            j = 2130842776;
            if ((paramRecentBaseData instanceof RecentTroopAssistantItem)) {}
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(1, paramView);
            i = 3;
            k = 99;
          }
          else
          {
            j = 2130842775;
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(0, paramView);
            i = 3;
            k = 99;
            continue;
            label623:
            jdField_a_of_type_AndroidViewView.setBackgroundResource(2130838182);
            continue;
            k = 99;
            m = 0;
            j = 0;
            i = 0;
          }
        }
      }
    }
  }
}
