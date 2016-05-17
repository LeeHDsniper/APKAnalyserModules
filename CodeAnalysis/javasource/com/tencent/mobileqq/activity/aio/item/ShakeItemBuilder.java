package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForShakeWindow;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import lab;
import lac;
import lad;

public class ShakeItemBuilder
  extends BaseBubbleBuilder
{
  private long jdField_a_of_type_Long;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  
  public ShakeItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = -1L;
    jdField_a_of_type_AndroidViewView$OnClickListener = new lab(this);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 1;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = paramBaseChatItemLayout.getContext();
    ShakeItemBuilder.Holder localHolder = (ShakeItemBuilder.Holder)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new LinearLayout(paramBaseChatItemLayout);
      paramViewHolder.setOrientation(0);
      paramView = new ImageView(paramBaseChatItemLayout);
      paramView.setScaleType(ImageView.ScaleType.CENTER_CROP);
      Object localObject = new LinearLayout.LayoutParams(-2, -2);
      gravity = 16;
      paramViewHolder.addView(paramView, (ViewGroup.LayoutParams)localObject);
      localObject = new TextView(paramBaseChatItemLayout);
      ((TextView)localObject).setTextColor(paramBaseChatItemLayout.getResources().getColorStateList(2131428183));
      ((TextView)localObject).setMaxWidth(BaseChatItemLayout.i);
      ((TextView)localObject).setId(2131297402);
      LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
      gravity = 16;
      paramViewHolder.addView((View)localObject, localLayoutParams);
      jdField_a_of_type_AndroidWidgetImageView = paramView;
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localObject);
    }
    jdField_a_of_type_AndroidWidgetTextView.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    int k = BaseChatItemLayout.r;
    int j = BaseChatItemLayout.s;
    int i = BaseChatItemLayout.r;
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840224);
    if (paramChatMessage.isSend())
    {
      k = BaseChatItemLayout.s;
      j = BaseChatItemLayout.r;
      i = BaseChatItemLayout.s;
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840225);
    }
    jdField_a_of_type_AndroidWidgetImageView.setPadding(i, 0, 0, 0);
    jdField_a_of_type_AndroidWidgetTextView.setPadding(k, BaseChatItemLayout.p, j, BaseChatItemLayout.q);
    jdField_a_of_type_AndroidWidgetTextView.setText(paramBaseChatItemLayout.getResources().getString(2131367329));
    paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
    paramViewHolder.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    if (b)
    {
      if ((b != null) && (b.length() > 0)) {
        b.setLength(0);
      }
      paramView = new StringBuilder();
      if (time > 0L) {
        paramView.append(TimeFormatterUtils.a(paramBaseChatItemLayout, 3, time * 1000L)).append(" ");
      }
      if (!paramChatMessage.isSend()) {
        break label417;
      }
      paramView.append("我抖了").append(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d).append("一下");
    }
    for (;;)
    {
      paramViewHolder.setContentDescription(paramView.toString());
      return paramViewHolder;
      label417:
      paramView.append(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d).append("抖了你一下");
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new ShakeItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (time > 0L) {
      localStringBuilder.append(TimeFormatterUtils.a(jdField_a_of_type_AndroidContentContext, 3, time * 1000L)).append(" ");
    }
    if (paramChatMessage.isSend()) {
      localStringBuilder.append("我抖了").append(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d).append("一下");
    }
    for (;;)
    {
      return localStringBuilder.toString();
      localStringBuilder.append(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d).append("抖了你一下");
    }
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 2131304463: 
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
    }
    super.b(paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    paramView = (MessageForShakeWindow)AIOUtils.a(paramView);
    String str1 = jdField_a_of_type_AndroidContentContext.getString(2131367611);
    String str2 = jdField_a_of_type_AndroidContentContext.getString(2131367612);
    if (paramView.isSendFromLocal()) {
      DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, str1, str2, new lac(this, paramView), new lad(this)).show();
    }
  }
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo)
  {
    ShakeItemBuilder.Holder localHolder = (ShakeItemBuilder.Holder)paramViewHolder;
    if ((c == 0) || (!paramBubbleInfo.a()))
    {
      paramView = paramView.getResources();
      if (paramChatMessage.isSend())
      {
        paramViewHolder = paramView.getColorStateList(2131428186);
        if (paramViewHolder != null) {
          jdField_a_of_type_AndroidWidgetTextView.setTextColor(paramViewHolder);
        }
        if (!paramChatMessage.isSend()) {
          break label90;
        }
      }
      label90:
      for (paramViewHolder = paramView.getColorStateList(2131428185);; paramViewHolder = paramView.getColorStateList(2131428184))
      {
        jdField_a_of_type_AndroidWidgetTextView.setLinkTextColor(paramViewHolder);
        return;
        paramViewHolder = paramView.getColorStateList(2131428183);
        break;
      }
    }
    if (d == 0) {
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(-16777216);
    }
    while (e == 0)
    {
      jdField_a_of_type_AndroidWidgetTextView.setLinkTextColor(paramView.getResources().getColorStateList(2131428184));
      return;
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(d);
    }
    jdField_a_of_type_AndroidWidgetTextView.setLinkTextColor(e);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(paramView, jdField_a_of_type_AndroidContentContext);
    return paramView.a();
  }
}
