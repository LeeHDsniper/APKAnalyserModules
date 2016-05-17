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
import android.widget.TextView;
import com.etrump.mixlayout.ETTextView;
import com.etrump.mixlayout.FontManager;
import com.tencent.mobileqq.activity.BaseChatPie;
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
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.AnimationTextView;
import com.tencent.mobileqq.widget.AnimationTextView.OnDoubleClick;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import cooperation.troop.TroopOrgProxyActivity;
import java.util.ArrayList;
import java.util.List;
import lbl;
import lbm;
import lbn;
import lbo;

public class TextItemBuilder
  extends BaseBubbleBuilder
{
  private static final int h = BaseChatItemLayout.k + BaseChatItemLayout.p;
  private static final int i = BaseChatItemLayout.l + BaseChatItemLayout.q;
  private static final int j = BaseChatItemLayout.m + BaseChatItemLayout.r;
  private static final int k = BaseChatItemLayout.n + BaseChatItemLayout.s;
  protected AnimationTextView.OnDoubleClick a;
  protected View.OnClickListener b = new lbl(this);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public TextItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = new lbm(this);
  }
  
  public static String a(String paramString, boolean paramBoolean)
  {
    if (android.text.TextUtils.isEmpty(paramString)) {
      return paramString;
    }
    paramString = new StringBuilder(paramString);
    int i1 = paramString.length();
    int m = 0;
    if (m < i1)
    {
      int n = m;
      if ('\024' == paramString.charAt(m))
      {
        n = m;
        if (m + 1 < i1)
        {
          n = m;
          if ('ÿ' == paramString.charAt(m + 1))
          {
            n = m;
            if (m + 2 < i1)
            {
              if (!paramBoolean) {
                break label116;
              }
              if (paramString.charAt(m + 2) == '\024') {
                paramString.setCharAt(m + 2, 'ý');
              }
            }
          }
        }
      }
      for (;;)
      {
        n = m + 4;
        m = n + 1;
        break;
        label116:
        if (paramString.charAt(m + 2) == 'ý') {
          paramString.setCharAt(m + 2, '\024');
        }
      }
    }
    return paramString.toString();
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 1;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = paramBaseChatItemLayout.getContext();
    TextItemBuilder.Holder localHolder = (TextItemBuilder.Holder)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new ETTextView(paramBaseChatItemLayout);
      paramViewHolder.setTextColor(paramBaseChatItemLayout.getResources().getColorStateList(2131428183));
      paramViewHolder.setLinkTextColor(paramBaseChatItemLayout.getResources().getColorStateList(2131428182));
      paramViewHolder.setSpannableFactory(QQText.a);
      paramViewHolder.setMaxWidth(BaseChatItemLayout.h);
      paramViewHolder.setMovementMethod(LinkMovementMethod.getInstance());
      paramViewHolder.setId(2131297402);
      b = paramViewHolder;
    }
    ((ETTextView)b).setFont(0, uniseq);
    if (!android.text.TextUtils.isEmpty(paramChatMessage.getExtInfoFromExtStr("sens_msg_ctrl_info")))
    {
      paramView = ((ETTextView)b).a();
      if (paramView != null) {
        a = (uniseq + 1L);
      }
    }
    b.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    int n = BaseChatItemLayout.r;
    int m = BaseChatItemLayout.s;
    if (paramChatMessage.isSend())
    {
      n = BaseChatItemLayout.s;
      m = BaseChatItemLayout.r;
    }
    b.setPadding(n, BaseChatItemLayout.p, m, BaseChatItemLayout.q);
    if ((paramChatMessage instanceof MessageForText))
    {
      paramView = (MessageForText)paramChatMessage;
      if (msgtype == 63528) {
        if (paramChatMessage.isSend()) {
          b.setText(paramBaseChatItemLayout.getString(2131370017));
        }
      }
    }
    for (;;)
    {
      b.setOnTouchListener(paramOnLongClickAndTouchListener);
      b.setOnLongClickListener(paramOnLongClickAndTouchListener);
      b.setOnClickListener(b);
      if ((b instanceof AnimationTextView)) {
        b).jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick;
      }
      return paramViewHolder;
      b.setText(paramBaseChatItemLayout.getString(2131370016));
      continue;
      if (!android.text.TextUtils.isEmpty(sb))
      {
        b.setText(sb);
        b.setContentDescription(com.tencent.mobileqq.text.TextUtils.c(msg));
      }
      else
      {
        b.setText("");
        if (QLog.isColorLevel())
        {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "textitem text.sb is null" + msgtype);
          continue;
          b.setText(msg);
        }
      }
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new TextItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if ((paramChatMessage instanceof MessageForText)) {
      return "说" + com.tencent.mobileqq.text.TextUtils.c(msg);
    }
    return "说" + msg;
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
      do
      {
        do
        {
          do
          {
            return;
            ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006447", "0X8006447", 0, 0, "1", "", "", "");
            return;
          } while (msg == null);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800644A", "0X800644A", 0, 0, "1", "", "", "");
          try
          {
            ((ClipboardManager)jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setText(msg);
            return;
          }
          catch (Exception paramContext) {}
        } while (!QLog.isColorLevel());
        QLog.e(jdField_a_of_type_JavaLangString, 2, paramContext.toString());
        return;
        ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, msg, uniseq);
        return;
        localObject = new Bundle();
        ((Bundle)localObject).putInt("forward_type", -1);
        paramContext = (MessageForText)paramChatMessage;
        if (sb != null) {}
        for (paramContext = sb.toString();; paramContext = msg)
        {
          ((Bundle)localObject).putString("forward_text", paramContext);
          paramContext = new Intent();
          paramContext.putExtras((Bundle)localObject);
          ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramContext, 21);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "1", "", "", "");
          return;
        }
        StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "", "Translate_external", "Clk_about_translate", 0, 1, 0);
        paramContext = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
        paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
        if ((paramChatMessage != null) && (paramChatMessage.length() > 0)) {
          paramContext.putExtra("uin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        }
        paramContext.putExtra("url", "http://183.62.127.31/MobileQQ/translate.html");
        jdField_a_of_type_AndroidContentContext.startActivity(paramContext);
        return;
        c(paramChatMessage);
        return;
        super.b(paramChatMessage);
        return;
        super.a(paramChatMessage);
        return;
      } while ((c()) || (!(jdField_a_of_type_AndroidContentContext instanceof FragmentActivity)));
      ((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a().g(paramChatMessage);
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
      paramView = (MessageForText)AIOUtils.a(paramView);
      str1 = jdField_a_of_type_AndroidContentContext.getString(2131367611);
      str2 = jdField_a_of_type_AndroidContentContext.getString(2131367612);
    } while (!paramView.isSendFromLocal());
    DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, str1, str2, new lbn(this, paramView), new lbo(this)).show();
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
    TextItemBuilder.Holder localHolder = (TextItemBuilder.Holder)paramViewHolder;
    if ((c == 0) || (!paramBubbleInfo.a()))
    {
      paramView = paramView.getResources();
      if (paramChatMessage.isSend())
      {
        paramViewHolder = paramView.getColorStateList(2131428186);
        b.setTextColor(paramViewHolder);
        if (!paramChatMessage.isSend()) {
          break label86;
        }
      }
      label86:
      for (paramViewHolder = paramView.getColorStateList(2131428185);; paramViewHolder = paramView.getColorStateList(2131428184))
      {
        b.setLinkTextColor(paramViewHolder);
        return;
        paramViewHolder = paramView.getColorStateList(2131428183);
        break;
      }
    }
    if (d == 0) {
      b.setTextColor(-16777216);
    }
    while (e == 0)
    {
      b.setLinkTextColor(paramView.getResources().getColorStateList(2131428184));
      return;
      b.setTextColor(d);
    }
    b.setLinkTextColor(e);
  }
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, ChatMessage paramChatMessage)
  {
    if (AIOUtils.h) {}
    do
    {
      return;
      paramViewHolder = (TextItemBuilder.Holder)paramViewHolder;
    } while (!(b instanceof ETTextView));
    int m = ((FontManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(41)).a(paramChatMessage);
    ((ETTextView)b).setFont(m, uniseq);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = AIOUtils.a(paramView);
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    localQQCustomMenu.a(2131304469, "复制");
    if ((extraflag == 32768) && (paramView.isSendFromLocal())) {
      localQQCustomMenu.a(2131304471, jdField_a_of_type_AndroidContentContext.getString(2131367717));
    }
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
  }
  
  protected void c(ChatMessage paramChatMessage)
  {
    msg = a(msg, true);
    QfavBuilder.a(null, msg).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
    QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 1);
    if (android.text.TextUtils.isEmpty(msg)) {}
    label180:
    for (;;)
    {
      return;
      paramChatMessage = new StringBuilder(msg);
      int m = 0;
      for (;;)
      {
        if (m >= paramChatMessage.length()) {
          break label180;
        }
        if ((paramChatMessage.codePointAt(m) == 20) && (m < paramChatMessage.length() - 1) && (paramChatMessage.charAt(m + 1) == 'ÿ'))
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "0X800588D", 0, 0, "", "", "", "");
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "report save small emoticon amount");
          return;
        }
        m += 1;
      }
    }
  }
}
