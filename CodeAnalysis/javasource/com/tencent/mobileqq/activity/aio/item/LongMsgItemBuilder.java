package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.ClipboardManager;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForMixedMsg;
import com.tencent.mobileqq.data.MessageForText.AtTroopMemberInfo;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.text.TextUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.AnimationTextView;
import com.tencent.mobileqq.widget.AnimationTextView.OnDoubleClick;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.widget.immersive.ImmersiveUtils;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import cooperation.troop.TroopOrgProxyActivity;
import java.util.ArrayList;
import java.util.List;
import kya;
import kyb;
import kyc;
import kyd;

public class LongMsgItemBuilder
  extends BaseBubbleBuilder
{
  private static final int h = BaseChatItemLayout.k + BaseChatItemLayout.p;
  private static final int i = BaseChatItemLayout.l + BaseChatItemLayout.q;
  private static final int j = BaseChatItemLayout.m + BaseChatItemLayout.r;
  private static final int k = BaseChatItemLayout.n + BaseChatItemLayout.s;
  protected View.OnClickListener a;
  AnimationTextView.OnDoubleClick a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public LongMsgItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = new kyc(this);
    jdField_a_of_type_AndroidViewView$OnClickListener = new kyd(this);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 1;
  }
  
  public int a(MessageForLongMsg paramMessageForLongMsg)
  {
    if ((paramMessageForLongMsg != null) && (mSourceMsgInfo != null)) {
      return 2;
    }
    return 1;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Context localContext = paramBaseChatItemLayout.getContext();
    paramBaseChatItemLayout = (MessageForLongMsg)paramChatMessage;
    int m = a(paramBaseChatItemLayout);
    LongMsgItemBuilder.Holder localHolder = (LongMsgItemBuilder.Holder)paramViewHolder;
    if (paramView == null) {
      if (m == 1)
      {
        paramViewHolder = new AnimationTextView(localContext);
        paramViewHolder.setTextColor(localContext.getResources().getColorStateList(2131428183));
        paramViewHolder.setMaxWidth(BaseChatItemLayout.h);
        paramViewHolder.setSpannableFactory(QQText.a);
        paramViewHolder.setMovementMethod(LinkMovementMethod.getInstance());
        paramViewHolder.setId(2131297402);
        a = paramViewHolder;
      }
    }
    for (;;)
    {
      if ((m == 2) && (b == null)) {
        paramViewHolder = a(localContext, localHolder);
      }
      for (;;)
      {
        a.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
        if (m == 2)
        {
          b.setVisibility(0);
          ReplyTextItemBuilder.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, b, mSourceMsgInfo, frienduin, istroop, uniseq);
          b.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
          b.setOnTouchListener(paramOnLongClickAndTouchListener);
          b.setOnLongClickListener(paramOnLongClickAndTouchListener);
          if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(senderuin)) && (!mIsCutAtInfoLocal) && (atInfoList != null) && (atInfoList.size() > 0))
          {
            paramChatMessage = (MessageForText.AtTroopMemberInfo)atInfoList.remove(0);
            if (msg.length() > textLen + 1)
            {
              msg = msg.substring(textLen + 1);
              sb = new QQText(msg, 13, 32, paramBaseChatItemLayout);
            }
            mIsCutAtInfoLocal = true;
          }
        }
        for (;;)
        {
          paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
          paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
          a.setOnTouchListener(paramOnLongClickAndTouchListener);
          a.setOnLongClickListener(paramOnLongClickAndTouchListener);
          a.setText(sb);
          if ((a instanceof AnimationTextView)) {
            a).jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick;
          }
          if ((b instanceof AnimationTextView)) {
            b).jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick;
          }
          return paramViewHolder;
          paramViewHolder = a(localContext, localHolder);
          break;
          if (b != null) {
            b.setVisibility(8);
          }
        }
      }
      paramViewHolder = paramView;
    }
  }
  
  public LinearLayout a(Context paramContext, LongMsgItemBuilder.Holder paramHolder)
  {
    LinearLayout localLinearLayout = new LinearLayout(paramContext);
    localLinearLayout.setOrientation(1);
    Object localObject = ReplyTextItemBuilder.a(paramContext);
    localLinearLayout.addView((View)localObject);
    b = ((TextView)localObject);
    localObject = new AnimationTextView(paramContext);
    ((AnimationTextView)localObject).setTextColor(paramContext.getResources().getColorStateList(2131428183));
    ((AnimationTextView)localObject).setMaxWidth(BaseChatItemLayout.h);
    ((AnimationTextView)localObject).setSpannableFactory(QQText.a);
    ((AnimationTextView)localObject).setMovementMethod(LinkMovementMethod.getInstance());
    ((AnimationTextView)localObject).setId(2131297402);
    localLinearLayout.addView((View)localObject);
    a = ((TextView)localObject);
    return localLinearLayout;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new LongMsgItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "说" + TextUtils.c(msg);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      super.a(paramInt, paramContext, paramChatMessage);
    }
    do
    {
      return;
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
      super.b(paramChatMessage);
      return;
      ((ClipboardManager)jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setText(MessageForMixedMsg.getTextFromMixedMsg(paramChatMessage));
      return;
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, (MessageForLongMsg)paramChatMessage);
      return;
      paramContext = new Bundle();
      paramContext.putInt("forward_type", -1);
      paramContext.putString("forward_text", MessageForMixedMsg.getTextFromMixedMsg(paramChatMessage).toString());
      paramChatMessage = new Intent();
      paramChatMessage.putExtras(paramContext);
      ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "", "", "", "");
      return;
      StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "", "Translate_external", "Clk_about_translate", 0, 1, 0);
      paramContext = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
      paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
      if ((paramChatMessage != null) && (paramChatMessage.length() > 0)) {
        paramContext.putExtra("uin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      }
      paramContext.putExtra("url", "http://183.62.127.31/MobileQQ/translate.html");
      jdField_a_of_type_AndroidContentContext.startActivity(paramContext);
      return;
      a((MessageForLongMsg)paramChatMessage);
      return;
      super.a(paramChatMessage);
      return;
    } while (!(jdField_a_of_type_AndroidContentContext instanceof FragmentActivity));
    paramContext = ((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a();
    Object localObject = new ArrayList();
    ((List)localObject).add(paramChatMessage);
    TroopOrgProxyActivity.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_AndroidContentContext, (List)localObject, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 0, paramContext);
    localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    if (paramChatMessage.isSend()) {}
    for (paramContext = "0";; paramContext = "1")
    {
      ReportController.b((QQAppInterface)localObject, "P_CliOper", "Grp_work", "", "function", "Clk_msg", 0, 0, str, paramContext, "", "");
      return;
    }
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    if (aisMultiMsg) {}
    String str1;
    String str2;
    do
    {
      return;
      paramView = (MessageForLongMsg)AIOUtils.a(paramView);
      str1 = jdField_a_of_type_AndroidContentContext.getString(2131367611);
      str2 = jdField_a_of_type_AndroidContentContext.getString(2131367612);
    } while (!paramView.isSendFromLocal());
    DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, str1, str2, new kya(this, paramView), new kyb(this)).show();
  }
  
  protected void a(View paramView, ChatMessage paramChatMessage)
  {
    if (paramChatMessage.isSend())
    {
      paramView.setPadding(k, h, j, i);
      return;
    }
    paramView.setPadding(j, h, k, i);
  }
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo)
  {
    LongMsgItemBuilder.Holder localHolder = (LongMsgItemBuilder.Holder)paramViewHolder;
    if ((c == 0) || (!paramBubbleInfo.a()))
    {
      paramView = paramView.getResources();
      if (paramChatMessage.isSend())
      {
        paramViewHolder = paramView.getColorStateList(2131428186);
        if (paramViewHolder != null)
        {
          a.setTextColor(paramViewHolder);
          if (b != null) {
            b.setTextColor(paramViewHolder);
          }
        }
        if (!paramChatMessage.isSend()) {
          break label135;
        }
      }
      label135:
      for (paramViewHolder = paramView.getColorStateList(2131428185);; paramViewHolder = paramView.getColorStateList(2131428184))
      {
        a.setLinkTextColor(paramViewHolder);
        if (b != null)
        {
          b.setLinkTextColor(paramViewHolder);
          ImmersiveUtils.a(b, 0.5F);
        }
        return;
        paramViewHolder = paramView.getColorStateList(2131428183);
        break;
      }
    }
    if (d == 0)
    {
      a.setTextColor(-16777216);
      if (b != null) {
        b.setTextColor(-16777216);
      }
      if (e != 0) {
        break label278;
      }
      paramViewHolder = paramView.getResources().getColorStateList(2131428184);
      a.setLinkTextColor(paramViewHolder);
      if (b != null) {
        b.setLinkTextColor(paramViewHolder);
      }
    }
    for (;;)
    {
      ImmersiveUtils.a(b, 0.5F);
      return;
      a.setTextColor(d);
      if (b == null) {
        break;
      }
      b.setTextColor(d);
      break;
      label278:
      a.setLinkTextColor(e);
      if (b != null) {
        b.setLinkTextColor(e);
      }
    }
  }
  
  protected void a(MessageForLongMsg paramMessageForLongMsg)
  {
    QfavBuilder.b(paramMessageForLongMsg).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramMessageForLongMsg).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
    QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 8);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = (MessageForLongMsg)AIOUtils.a(paramView);
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    if ((extraflag == 32768) && (paramView.isSendFromLocal()))
    {
      localQQCustomMenu.a(2131304469, jdField_a_of_type_AndroidContentContext.getString(2131367713));
      localQQCustomMenu.a(2131304471, jdField_a_of_type_AndroidContentContext.getString(2131367717));
    }
    for (;;)
    {
      localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
      if (istroop == 1)
      {
        localQQCustomMenu.a(2131304483, jdField_a_of_type_AndroidContentContext.getString(2131365094));
        if (!((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
          a(paramView, localQQCustomMenu);
        }
      }
      if (!paramView.isSend()) {
        b(paramView, localQQCustomMenu);
      }
      localQQCustomMenu.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
      if ((vipBubbleID == 100000L) && (!paramView.isSend())) {
        localQQCustomMenu.a(2131304481, jdField_a_of_type_AndroidContentContext.getString(2131370239));
      }
      if ((paramView.isSend()) && (extraflag != 32768) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramView))) {
        a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramView);
      }
      if (paramView.isSend()) {
        b(paramView, localQQCustomMenu);
      }
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
      return localQQCustomMenu.a();
      localQQCustomMenu.a(2131304469, "复制");
    }
  }
}
