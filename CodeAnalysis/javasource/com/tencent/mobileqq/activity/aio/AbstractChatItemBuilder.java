package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.qphone.base.util.QLog;

public abstract class AbstractChatItemBuilder
  implements ChatItemBuilder
{
  public Context a;
  protected BaseAdapter a;
  public SessionInfo a;
  public QQAppInterface a;
  
  public AbstractChatItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidWidgetBaseAdapter = paramBaseAdapter;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_AndroidContentContext = paramContext;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Object localObject = paramViewGroup.getContext();
    int i;
    if (paramView == null)
    {
      paramView = new LinearLayout((Context)localObject);
      ((LinearLayout)paramView).setOrientation(1);
      paramViewGroup = a();
      paramView.setTag(paramViewGroup);
      jdField_a_of_type_Int = paramInt1;
      jdField_a_of_type_ComTencentMobileqqDataChatMessage = paramChatMessage;
      if (!mNeedTimeStamp) {
        break label533;
      }
      if (jdField_a_of_type_AndroidWidgetTextView == null)
      {
        TextView localTextView = new TextView((Context)localObject);
        i = AIOUtils.a(14.0F, ((Context)localObject).getResources());
        localTextView.setTextSize(2, 11.0F);
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a != null) {
          localTextView.setTextColor(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a);
        }
        localTextView.setPadding(i, 0, i, 0);
        localTextView.setGravity(17);
        LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
        gravity = 1;
        topMargin = ((Context)localObject).getResources().getDimensionPixelOffset(2131493048);
        bottomMargin = ((Context)localObject).getResources().getDimensionPixelOffset(2131493049);
        ((ViewGroup)paramView).addView(localTextView, 0, localLayoutParams);
        jdField_a_of_type_AndroidWidgetTextView = localTextView;
        localTextView.setTag(Long.valueOf(0L));
      }
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      if (((Long)jdField_a_of_type_AndroidWidgetTextView.getTag()).longValue() != time)
      {
        localObject = TimeFormatterUtils.a((Context)localObject, 3, time * 1000L);
        jdField_a_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      }
      label284:
      paramOnLongClickAndTouchListener = a(paramChatMessage, paramViewGroup, jdField_a_of_type_AndroidViewView, (LinearLayout)paramView, paramOnLongClickAndTouchListener);
      if (jdField_a_of_type_AndroidViewView != paramOnLongClickAndTouchListener)
      {
        if (jdField_a_of_type_AndroidViewView != null) {
          ((ViewGroup)paramView).removeView(jdField_a_of_type_AndroidViewView);
        }
        if (paramOnLongClickAndTouchListener.getLayoutParams() != null) {
          break label554;
        }
        ((ViewGroup)paramView).addView(paramOnLongClickAndTouchListener, -1, -2);
        label357:
        jdField_a_of_type_AndroidViewView = paramOnLongClickAndTouchListener;
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (msgtype == 62530))
      {
        i = AIOUtils.a(7.5F, jdField_a_of_type_AndroidContentContext.getResources());
        if (paramInt1 != 0) {
          break label567;
        }
        if (jdField_a_of_type_AndroidWidgetTextView != null) {
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        }
        paramView.setPadding(0, 0, 0, i);
      }
    }
    for (;;)
    {
      paramChatMessage = paramView;
      do
      {
        return paramChatMessage;
        try
        {
          paramViewGroup = (AbstractChatItemBuilder.ViewHolder)paramView.getTag();
        }
        catch (ClassCastException paramViewGroup)
        {
          paramChatMessage = paramView;
        }
      } while (!QLog.isColorLevel());
      QLog.d(jdField_a_of_type_JavaLangString, 2, "AbstractChatItemBuilder getview  e" + paramViewGroup + "position=" + paramInt1 + "size=" + jdField_a_of_type_AndroidWidgetBaseAdapter.getCount());
      return paramView;
      label533:
      if (jdField_a_of_type_AndroidWidgetTextView == null) {
        break label284;
      }
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      break label284;
      label554:
      ((ViewGroup)paramView).addView(paramOnLongClickAndTouchListener);
      break label357;
      label567:
      if (paramInt1 == paramInt2 - 1) {
        paramView.setPadding(0, i, 0, 1);
      } else {
        paramView.setPadding(0, i, 0, i);
      }
    }
  }
  
  protected abstract View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener);
  
  protected abstract AbstractChatItemBuilder.ViewHolder a();
}
