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
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.activity.recent.cur.DragTextView;
import com.tencent.mobileqq.activity.recent.data.RecentSayHelloListItem;
import com.tencent.mobileqq.activity.recent.data.RecentTroopAssistantItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.ProfileCardUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.CustomWidgetUtil;
import com.tencent.widget.SingleLineTextView;
import java.util.ArrayList;
import java.util.List;

public class SayHelloListItemBuilder
  extends RecentItemBaseBuilder
{
  public static final String b = "SayHelloListItemBuilder";
  private List a;
  
  public SayHelloListItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramOnDragModeChangedListener = null;
    paramViewGroup = paramOnDragModeChangedListener;
    if (paramView != null)
    {
      paramViewGroup = paramOnDragModeChangedListener;
      if (paramView.getTag() != null)
      {
        paramViewGroup = paramOnDragModeChangedListener;
        if ((paramView.getTag() instanceof SayHelloListItemBuilder.SayHelloListItemHolder)) {
          paramViewGroup = (SayHelloListItemBuilder.SayHelloListItemHolder)paramView.getTag();
        }
      }
    }
    if (paramViewGroup == null)
    {
      paramViewGroup = new SayHelloListItemBuilder.SayHelloListItemHolder();
      paramView = super.a(paramContext, 2130904255, paramViewGroup);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301974));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131297636));
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView = ((DragTextView)paramView.findViewById(2131301975));
      jdField_a_of_type_ComTencentWidgetSingleLineTextView = ((SingleLineTextView)paramView.findViewById(2131298324));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131298422));
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131298320));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131301057));
      d = ((TextView)paramView.findViewById(2131301807));
      e = ((TextView)paramView.findViewById(2131298322));
      jdField_c_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131298426));
      f = ((TextView)paramView.findViewById(2131298427));
      jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)paramView.findViewById(2131298423));
      paramView.setTag(paramViewGroup);
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setOnModeChangeListener(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a());
      }
      jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextSize(13.0F, 1);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setTag(Integer.valueOf(paramInt));
      if ((paramViewGroup != null) && ((paramObject instanceof RecentBaseData)))
      {
        RecentBaseData localRecentBaseData = (RecentBaseData)paramObject;
        paramOnDragModeChangedListener = null;
        if (paramRecentFaceDecoder != null) {
          paramOnDragModeChangedListener = paramRecentFaceDecoder.a(localRecentBaseData);
        }
        a(paramView, localRecentBaseData, paramContext, paramOnDragModeChangedListener);
      }
      for (;;)
      {
        super.a(paramContext, paramView, paramInt, paramObject, paramViewGroup, paramOnClickListener);
        paramView.setOnClickListener(paramOnClickListener);
        paramView.setOnLongClickListener(paramOnLongClickListener);
        paramView.setTag(-1, Integer.valueOf(paramInt));
        return paramView;
        if (paramViewGroup != null)
        {
          jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(null);
          jdField_b_of_type_AndroidWidgetTextView.setText("");
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText("");
        }
      }
    }
  }
  
  public List a(RecentBaseData paramRecentBaseData, Context paramContext)
  {
    if ((paramRecentBaseData == null) || (paramRecentBaseData == null)) {
      return null;
    }
    paramRecentBaseData = paramContext.getResources();
    if (jdField_a_of_type_JavaUtilList == null) {
      jdField_a_of_type_JavaUtilList = new ArrayList();
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilList.add(paramRecentBaseData.getString(jdField_a_of_type_ArrayOfInt[0]));
      return jdField_a_of_type_JavaUtilList;
      jdField_a_of_type_JavaUtilList.clear();
    }
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData, Context paramContext, Drawable paramDrawable)
  {
    if ((paramView == null) || (paramRecentBaseData == null))
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.recent", 2, "bindView|param invalidate");
      }
      return;
    }
    Object localObject = paramView.getTag();
    if ((localObject instanceof SayHelloListItemBuilder.SayHelloListItemHolder)) {}
    for (SayHelloListItemBuilder.SayHelloListItemHolder localSayHelloListItemHolder = (SayHelloListItemBuilder.SayHelloListItemHolder)localObject;; localSayHelloListItemHolder = null)
    {
      if (localSayHelloListItemHolder == null)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.i("Q.recent", 2, "bindView|holder is null, tag = " + localObject);
        return;
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
      RecentSayHelloListItem localRecentSayHelloListItem;
      label141:
      label158:
      int i;
      if ((paramRecentBaseData instanceof RecentSayHelloListItem))
      {
        localRecentSayHelloListItem = (RecentSayHelloListItem)paramRecentBaseData;
        if (R <= 0) {
          break label546;
        }
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
        if (R != 1) {
          break label532;
        }
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130842814);
        jdField_b_of_type_AndroidWidgetTextView.setTextColor(paramContext.getResources().getColorStateList(2131428238));
        localObject = a;
        CharSequence localCharSequence = jdField_b_of_type_AndroidWidgetTextView.getText();
        paramDrawable = (Drawable)localObject;
        if (localObject == null) {
          paramDrawable = "";
        }
        if (!paramDrawable.equals(localCharSequence)) {
          jdField_b_of_type_AndroidWidgetTextView.setText(paramDrawable);
        }
        i = K;
        paramDrawable = jdField_c_of_type_JavaLangCharSequence;
        if (paramDrawable == null) {
          break label576;
        }
        paramDrawable = paramDrawable.toString();
        if (!TextUtils.isEmpty(paramDrawable)) {
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextColor(ColorStateList.valueOf(i), 1);
        }
        jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendText(paramDrawable, 1);
        localObject = jdField_b_of_type_JavaLangCharSequence;
        localCharSequence = jdField_a_of_type_ComTencentWidgetSingleLineTextView.a();
        paramDrawable = (Drawable)localObject;
        if (localObject == null) {
          paramDrawable = "";
        }
        if (paramDrawable.equals(localCharSequence)) {}
      }
      try
      {
        jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText(paramDrawable);
        jdField_a_of_type_ComTencentWidgetSingleLineTextView.setCompoundDrawables(null, null);
        if (F == 4) {
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setCompoundDrawables(paramContext.getResources().getDrawable(2130838284), null);
        }
        paramDrawable = jdField_b_of_type_JavaLangString;
        localObject = jdField_a_of_type_AndroidWidgetTextView.getText();
        paramContext = paramDrawable;
        if (paramDrawable == null) {
          paramContext = "";
        }
        if (!paramContext.equals(localObject)) {
          jdField_a_of_type_AndroidWidgetTextView.setText(paramContext);
        }
        m = H;
        i = G;
        if (m > 0) {
          if (i == 0)
          {
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(-1);
            k = 99;
            m = 0;
            j = 0;
            i = 0;
            CustomWidgetUtil.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView, i, m, j, k, null);
            if (jdField_a_of_type_AndroidWidgetTextView.getVisibility() != 0) {
              jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
            }
            a(localSayHelloListItemHolder, localRecentSayHelloListItem);
            if (!AppSetting.i) {
              break;
            }
            paramView.setContentDescription(jdField_c_of_type_JavaLangString);
            return;
            if (QLog.isColorLevel()) {
              QLog.d("SayHelloListItemBuilder", 2, "data is not RecentSayHelloItem");
            }
            throw new RuntimeException("data is null");
            label532:
            jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130842944);
            break label141;
            label546:
            jdField_b_of_type_AndroidWidgetTextView.setTextColor(paramContext.getResources().getColorStateList(2131428207));
            jdField_b_of_type_AndroidWidgetImageView.setVisibility(4);
            break label158;
            label576:
            paramDrawable = "";
          }
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          int m;
          int k;
          int j;
          localException.printStackTrace();
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText(paramDrawable + " ");
          continue;
          if (i == 2)
          {
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(-1);
            m = 0;
            j = 0;
            i = 1;
            k = 99;
          }
          else if (i == 3)
          {
            j = 2130842776;
            if ((paramRecentBaseData instanceof RecentTroopAssistantItem)) {}
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(1);
            k = 99;
            i = 3;
          }
          else
          {
            j = 2130842775;
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(0);
            k = 99;
            i = 3;
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
  
  public void a(SayHelloListItemBuilder.SayHelloListItemHolder paramSayHelloListItemHolder, RecentSayHelloListItem paramRecentSayHelloListItem)
  {
    int k = 1;
    StringBuilder localStringBuilder = new StringBuilder();
    int i;
    int j;
    if (S > 0)
    {
      jdField_c_of_type_AndroidWidgetTextView.setText(String.valueOf(S));
      i = 1;
      localStringBuilder.append(a);
      switch (T)
      {
      default: 
        jdField_c_of_type_AndroidWidgetTextView.setBackgroundResource(2130840714);
        j = 2130838491;
      }
    }
    for (;;)
    {
      label87:
      if ((AppSetting.i) && (S > 0)) {
        localStringBuilder.append(S).append("岁");
      }
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(j, 0, 0, 0);
      label143:
      label168:
      String str;
      if (i != 0)
      {
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        j = 1;
        if ((U > 0) && (U < 14)) {
          break label678;
        }
        d.setVisibility(8);
        str = ProfileCardUtil.a((byte)V);
        if (!TextUtils.isEmpty(str)) {
          break label756;
        }
        e.setVisibility(8);
        label195:
        if (!jdField_b_of_type_Boolean) {
          break label856;
        }
        if (jdField_c_of_type_AndroidWidgetImageView.getVisibility() != 0) {
          jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
        }
        j += 1;
        switch (W)
        {
        default: 
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130840637);
          label266:
          i = j;
          if (AppSetting.i)
          {
            localStringBuilder.append(",").append("拥有魅力勋章");
            i = j;
          }
          label293:
          if ((X > 0) && (!TextUtils.isEmpty(i)))
          {
            int m = i + 1;
            e.setVisibility(8);
            f.setVisibility(0);
            f.setText(i);
            f.setTag(Integer.valueOf(X));
            i = m;
            j = k;
            if (AppSetting.i)
            {
              localStringBuilder.append(",").append(i);
              j = k;
              i = m;
            }
          }
          break;
        }
      }
      for (;;)
      {
        if (j == 0)
        {
          f.setVisibility(8);
          f.setTag(Integer.valueOf(0));
        }
        if (i > 0) {
          jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
        }
        for (;;)
        {
          if (AppSetting.i)
          {
            if (H > 0) {
              localStringBuilder.append(",").append(H).append("条未读消息");
            }
            localStringBuilder.append(",").append(jdField_a_of_type_ComTencentWidgetSingleLineTextView.a().toString());
            localStringBuilder.append(",").append(jdField_a_of_type_AndroidWidgetTextView.getText().toString());
            if (localStringBuilder.length() > 0) {
              jdField_c_of_type_JavaLangString = localStringBuilder.toString();
            }
            if (QLog.isColorLevel()) {
              QLog.i("Q.recent", 2, "talkback|" + localStringBuilder.toString());
            }
          }
          return;
          jdField_c_of_type_AndroidWidgetTextView.setText("");
          i = 0;
          break;
          jdField_c_of_type_AndroidWidgetTextView.setBackgroundResource(2130840714);
          if (!AppSetting.i) {
            break label908;
          }
          localStringBuilder.append(",").append("男");
          j = 2130838491;
          i = 1;
          break label87;
          j = 2130838486;
          jdField_c_of_type_AndroidWidgetTextView.setBackgroundResource(2130840713);
          if (!AppSetting.i) {
            break label903;
          }
          localStringBuilder.append(",").append("女");
          i = 1;
          break label87;
          jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
          j = 0;
          break label143;
          label678:
          i = j + 1;
          d.setText(com.tencent.mobileqq.util.NearbyProfileUtil.e[U]);
          d.setBackgroundResource(com.tencent.mobileqq.util.NearbyProfileUtil.jdField_a_of_type_ArrayOfInt[U]);
          d.setVisibility(0);
          j = i;
          if (!AppSetting.i) {
            break label168;
          }
          localStringBuilder.append(",").append(com.tencent.mobileqq.util.NearbyProfileUtil.e[U]);
          j = i;
          break label168;
          label756:
          i = j + 1;
          e.setText(str);
          e.setBackgroundResource(2130840725);
          e.setVisibility(0);
          j = i;
          if (!AppSetting.i) {
            break label195;
          }
          localStringBuilder.append(",").append(str);
          j = i;
          break label195;
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130840642);
          break label266;
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130840643);
          break label266;
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130840644);
          break label266;
          label856:
          i = j;
          if (jdField_c_of_type_AndroidWidgetImageView.getVisibility() == 8) {
            break label293;
          }
          jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
          i = j;
          break label293;
          jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(4);
        }
        j = 0;
      }
      label903:
      i = 1;
      continue;
      label908:
      j = 2130838491;
      i = 1;
    }
  }
}
