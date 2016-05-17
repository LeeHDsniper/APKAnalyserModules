package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.activity.recent.cur.DragTextView;
import com.tencent.mobileqq.activity.recent.data.RecentSayHelloBoxItem;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.MyGridView;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.CustomImgView;
import com.tencent.widget.CustomWidgetUtil;
import com.tencent.widget.SingleLineTextView;
import java.util.ArrayList;
import java.util.List;

public class SayHelloBoxItemBuilder
  extends RecentItemBaseBuilder
{
  private static final int jdField_a_of_type_Int = -1;
  protected RecentFaceDecoder a;
  private List jdField_a_of_type_JavaUtilList;
  
  public SayHelloBoxItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder = paramRecentFaceDecoder;
    paramViewGroup = null;
    paramRecentFaceDecoder = paramViewGroup;
    if (paramView != null)
    {
      paramRecentFaceDecoder = paramViewGroup;
      if (paramView.getTag() != null)
      {
        paramRecentFaceDecoder = paramViewGroup;
        if ((paramView.getTag() instanceof SayHelloBoxItemBuilder.SayHelloBoxItemHolder)) {
          paramRecentFaceDecoder = (SayHelloBoxItemBuilder.SayHelloBoxItemHolder)paramView.getTag();
        }
      }
    }
    if (paramRecentFaceDecoder == null)
    {
      paramViewGroup = new SayHelloBoxItemBuilder.SayHelloBoxItemHolder();
      paramOnDragModeChangedListener = super.a(paramContext, 2130904183, paramViewGroup);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramOnDragModeChangedListener.findViewById(2131301653));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramOnDragModeChangedListener.findViewById(2131300308));
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView = ((DragTextView)paramOnDragModeChangedListener.findViewById(2131301656));
      jdField_a_of_type_ComTencentWidgetSingleLineTextView = ((SingleLineTextView)paramOnDragModeChangedListener.findViewById(2131301654));
      jdField_a_of_type_ComTencentMobileqqWidgetMyGridView = ((MyGridView)paramOnDragModeChangedListener.findViewById(2131301655));
      paramRecentFaceDecoder = paramContext.getResources();
      paramView = paramRecentFaceDecoder.getDisplayMetrics();
      int m = (int)(Math.min(widthPixels, heightPixels) - density * 119.0F);
      int i = paramRecentFaceDecoder.getDimensionPixelSize(2131493484);
      int k = paramRecentFaceDecoder.getDimensionPixelSize(2131493485);
      if (i <= 0)
      {
        i = 45;
        int j = k;
        if (k <= 0) {
          j = 10;
        }
        m /= (i + j);
        k = m;
        if (m > 6) {
          k = 6;
        }
        paramRecentFaceDecoder = new SayHelloBoxItemBuilder.MsgHeaderAdapter(this, paramContext, k, i);
        jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setColumnWidth(i);
        jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setNumColumns(k);
        jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setHorizontalSpacing(j);
        jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setStretchMode(0);
        jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.a();
        jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setAdapter(paramRecentFaceDecoder);
        jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextSize(14.0F, 1);
        paramOnDragModeChangedListener.setTag(paramViewGroup);
        paramView = paramOnDragModeChangedListener;
        paramRecentFaceDecoder = paramViewGroup;
        if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null)
        {
          jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setOnModeChangeListener(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a());
          paramRecentFaceDecoder = paramViewGroup;
          paramView = paramOnDragModeChangedListener;
        }
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setTag(Integer.valueOf(paramInt));
      paramViewGroup = paramContext.getResources().getDrawable(2130840707);
      if ((paramRecentFaceDecoder != null) && ((paramObject instanceof RecentBaseData))) {
        a(paramView, (RecentBaseData)paramObject, paramContext, paramViewGroup);
      }
      for (;;)
      {
        super.a(paramContext, paramView, paramInt, paramObject, paramRecentFaceDecoder, paramOnClickListener);
        paramView.setOnClickListener(paramOnClickListener);
        paramView.setOnLongClickListener(paramOnLongClickListener);
        paramView.setTag(-1, Integer.valueOf(paramInt));
        if (AppSetting.i) {
          paramView.setContentDescription(null);
        }
        return paramView;
        if (paramRecentFaceDecoder != null)
        {
          jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramViewGroup);
          jdField_a_of_type_AndroidWidgetTextView.setText("");
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText("");
        }
      }
      break;
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
    if ((paramView == null) || (paramRecentBaseData == null) || (!(paramRecentBaseData instanceof RecentSayHelloBoxItem))) {}
    label151:
    label262:
    label269:
    label411:
    for (;;)
    {
      return;
      Object localObject = paramView.getTag();
      if ((localObject instanceof SayHelloBoxItemBuilder.SayHelloBoxItemHolder))
      {
        localObject = (SayHelloBoxItemBuilder.SayHelloBoxItemHolder)localObject;
        RecentSayHelloBoxItem localRecentSayHelloBoxItem = (RecentSayHelloBoxItem)paramRecentBaseData;
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
        jdField_a_of_type_AndroidWidgetTextView.setText(2131371711);
        int k = H;
        int i = 0;
        int j = 0;
        int m = G;
        if (k > 0)
        {
          if (m == 3)
          {
            i = 3;
            j = 2130842776;
            jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(1);
          }
        }
        else
        {
          CustomWidgetUtil.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView, i, k, j, 99, null);
          i = K;
          paramDrawable = jdField_c_of_type_JavaLangCharSequence;
          if (paramDrawable == null) {
            break label262;
          }
          paramDrawable = paramDrawable.toString();
          if (!TextUtils.isEmpty(paramDrawable)) {
            jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendTextColor(ColorStateList.valueOf(i), 1);
          }
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setExtendText(paramDrawable, 1);
          if (TextUtils.isEmpty(b)) {
            break label269;
          }
          jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setVisibility(8);
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setVisibility(0);
          jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText(b);
        }
        for (;;)
        {
          if (!AppSetting.i) {
            break label411;
          }
          paramView.setContentDescription(jdField_c_of_type_JavaLangString);
          return;
          i = 3;
          j = 2130842775;
          jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragTextView.setDragViewType(0);
          break;
          paramDrawable = "";
          break label151;
          if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
          {
            jdField_a_of_type_ComTencentWidgetSingleLineTextView.setVisibility(8);
            jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setVisibility(0);
            jdField_a_of_type_ComTencentWidgetSingleLineTextView.setTextColor(paramContext.getResources().getColor(2131428212));
            if (jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.getAdapter() != null) {
              SayHelloBoxItemBuilder.MsgHeaderAdapter.a((SayHelloBoxItemBuilder.MsgHeaderAdapter)jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.getAdapter(), jdField_a_of_type_JavaUtilList);
            }
          }
          else
          {
            jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.setVisibility(8);
            jdField_a_of_type_ComTencentWidgetSingleLineTextView.setVisibility(0);
            jdField_a_of_type_ComTencentWidgetSingleLineTextView.setText(b);
            jdField_a_of_type_ComTencentWidgetSingleLineTextView.setTextColor(paramContext.getResources().getColor(2131428212));
          }
        }
      }
    }
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData, MessageRecord paramMessageRecord, Drawable paramDrawable)
  {
    if ((paramView == null) || (paramMessageRecord == null) || (paramDrawable == null) || (!(paramRecentBaseData instanceof RecentSayHelloBoxItem))) {}
    for (;;)
    {
      return;
      paramView = paramView.getTag();
      if ((paramView instanceof SayHelloBoxItemBuilder.SayHelloBoxItemHolder))
      {
        paramView = (SayHelloBoxItemBuilder.SayHelloBoxItemHolder)paramView;
        int j = jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.getCount();
        int i = 0;
        while (i < j)
        {
          paramRecentBaseData = jdField_a_of_type_ComTencentMobileqqWidgetMyGridView.getChildAt(i);
          if ((paramRecentBaseData != null) && ((paramRecentBaseData.getTag(-1) instanceof String)))
          {
            String str = (String)paramRecentBaseData.getTag(-1);
            if (str.equals(senderuin))
            {
              ((CustomImgView)paramRecentBaseData).setImageDrawable(paramDrawable);
              return;
            }
            if (QLog.isDevelopLevel()) {
              QLog.d("SAYHELL_BOX", 4, "updateMsgHeader,childView uin:" + str);
            }
          }
          i += 1;
        }
      }
    }
  }
}
