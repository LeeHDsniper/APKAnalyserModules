package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import lck;

public class TroopUnreadTipsChatItemBuilder
  extends AbstractChatItemBuilder
{
  public TroopUnreadTipsChatItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramViewHolder = (lck)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903191, null);
      paramViewHolder = (TextView)paramView.findViewById(2131297569);
      paramViewHolder.setMovementMethod(null);
      paramViewHolder.setGravity(17);
      paramViewHolder = paramView;
      if (ThemeUtil.isInNightMode(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface))
      {
        paramViewHolder = (TextView)paramView.findViewById(2131297580);
        paramLinearLayout = (TextView)paramView.findViewById(2131297581);
        paramViewHolder.setBackgroundColor(2130839213);
        paramLinearLayout.setBackgroundColor(2130839213);
        paramViewHolder = paramView;
      }
    }
    paramView = (TextView)paramViewHolder.findViewById(2131297569);
    if ((istroop == 1) && (AnonymousChatHelper.a().a(senderuin)))
    {
      paramView.setTextColor(AnonymousChatHelper.d);
      return paramViewHolder;
    }
    paramView.setTextColor(paramViewHolder.getResources().getColorStateList(2131427365));
    return paramViewHolder;
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new lck(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage) {}
  
  public QQCustomMenuItem[] a(View paramView)
  {
    return null;
  }
}
