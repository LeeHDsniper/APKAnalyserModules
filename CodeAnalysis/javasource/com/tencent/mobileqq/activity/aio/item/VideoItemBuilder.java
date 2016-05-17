package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.core.VcSystemInfo;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.gaudio.AVNotifyCenter.VideoRoomInfo;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.VideoActionSheet;
import com.tencent.av.utils.VideoMsgTools;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
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
import com.tencent.mobileqq.data.MessageForVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qcall.PstnCardInfo;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.qcall.PstnSwitchConfig;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import cooperation.huangye.C2BUtils;
import java.util.HashMap;
import java.util.Map;
import lcl;
import lcm;
import lcn;
import lco;
import lcp;

public class VideoItemBuilder
  extends BaseBubbleBuilder
{
  private static final int h = BaseChatItemLayout.k + BaseChatItemLayout.p;
  private static final int i = BaseChatItemLayout.l + BaseChatItemLayout.q;
  private static final int j = BaseChatItemLayout.m + BaseChatItemLayout.r;
  private static final int k = BaseChatItemLayout.n + BaseChatItemLayout.s;
  private View.OnClickListener a;
  private boolean d = true;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public VideoItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_AndroidViewView$OnClickListener = new lcl(this);
  }
  
  private void a(TextView paramTextView, int paramInt)
  {
    Resources localResources = jdField_a_of_type_AndroidContentContext.getResources();
    Drawable localDrawable = localResources.getDrawable(paramInt);
    int m = localDrawable.getIntrinsicWidth();
    int n = localDrawable.getIntrinsicHeight();
    switch (jdField_a_of_type_AndroidContentContext.getSharedPreferences("setting_text_size", 0).getInt("chat_text_size_type", 0))
    {
    default: 
      paramInt = n;
    }
    for (;;)
    {
      localDrawable.setBounds(0, 0, m, paramInt);
      paramTextView.setCompoundDrawables(localDrawable, null, null, null);
      paramTextView.setCompoundDrawablePadding(BaseChatItemLayout.u);
      return;
      int i1 = localResources.getDimensionPixelSize(2131493772);
      int i2 = localResources.getDimensionPixelSize(2131493773);
      paramInt = i1;
      if (i1 == 0) {
        paramInt = 1;
      }
      m = m * jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_Int / paramInt;
      paramInt = n * jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_Int / paramInt + i2;
      m += i2;
    }
  }
  
  private void a(MessageForVideo paramMessageForVideo, Context paramContext, View paramView)
  {
    int n = 0;
    Object localObject1 = "";
    if (paramMessageForVideo == null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "setMsgAccDescription-->message is null");
      }
    }
    do
    {
      return;
      if ((senderuin != null) && (selfuin != null)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "setMsgAccDescription-->uin is null");
    return;
    Object localObject2;
    label124:
    int i1;
    int m;
    if (selfuin.equals(senderuin))
    {
      if (63520 == msgtype) {
        localObject1 = "我";
      }
      localObject2 = localObject1;
      if (msgtype == 63527)
      {
        localObject2 = new StringBuilder().append((String)localObject1);
        if (!isVideo) {
          break label462;
        }
        localObject1 = "视频电话,";
        localObject2 = (String)localObject1;
      }
      localObject1 = (String)localObject2 + text;
      if (!text.contains(paramContext.getResources().getString(2131363223))) {
        break label514;
      }
      localObject2 = text;
      paramContext = paramContext.getResources().getString(2131363223) + ",";
      localObject2 = ((String)localObject2).substring(((String)localObject2).indexOf(':') - 2, ((String)localObject2).lastIndexOf(':') + 3).split(":");
      if (localObject2.length != 3) {
        break label470;
      }
      i1 = Integer.valueOf(localObject2[0]).intValue();
      n = Integer.valueOf(localObject2[1]).intValue();
      m = Integer.valueOf(localObject2[2]).intValue();
    }
    for (;;)
    {
      label286:
      if ((i1 > 0) || (n > 0) || (m > 0)) {
        if (i1 <= 0) {
          break label640;
        }
      }
      label410:
      label462:
      label470:
      label514:
      label640:
      for (localObject1 = paramContext + i1 + "小时,";; localObject1 = paramContext)
      {
        paramContext = (Context)localObject1;
        if (n > 0) {
          paramContext = (String)localObject1 + n + "分,";
        }
        localObject1 = paramContext;
        if (m > 0) {
          localObject1 = paramContext + m + "秒";
        }
        if (isVideo)
        {
          paramMessageForVideo = "视频电话,";
          localObject1 = paramMessageForVideo + (String)localObject1;
        }
        for (;;)
        {
          paramView.setContentDescription(((String)localObject1).replace("点击", "双击"));
          return;
          localObject1 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, senderuin, 0);
          break;
          localObject1 = "QQ电话,";
          break label124;
          if (localObject2.length != 2) {
            break label646;
          }
          n = Integer.valueOf(localObject2[0]).intValue();
          m = Integer.valueOf(localObject2[1]).intValue();
          i1 = 0;
          break label286;
          paramMessageForVideo = "QQ电话,";
          break label410;
          if (text.contains(paramContext.getResources().getString(2131363227)))
          {
            paramContext = paramContext.getResources();
            if (isVideo) {}
            for (m = 2131363321;; m = 2131363257)
            {
              localObject1 = paramContext.getString(m);
              break;
            }
          }
          if (text.contains(paramContext.getResources().getString(2131363143))) {
            localObject1 = paramContext.getResources().getString(2131363150);
          } else if (text.contains(paramContext.getResources().getString(2131363149))) {
            localObject1 = paramContext.getResources().getString(2131363150);
          }
        }
      }
      label646:
      m = 0;
      i1 = 0;
    }
  }
  
  private void a(MessageForVideo paramMessageForVideo, VideoActionSheet paramVideoActionSheet)
  {
    if (extInt == 10)
    {
      paramVideoActionSheet.c(2131363813);
      paramVideoActionSheet.c(2131363814);
    }
    for (;;)
    {
      paramVideoActionSheet.d(2131366996);
      paramVideoActionSheet.a(new lcm(this, paramVideoActionSheet, paramMessageForVideo));
      paramVideoActionSheet.show();
      return;
      paramVideoActionSheet.c(2131367818);
    }
  }
  
  private void a(MessageForVideo paramMessageForVideo, boolean paramBoolean, int paramInt)
  {
    if ((!VcSystemInfo.e()) || (!VcSystemInfo.f()) || (VideoActionSheet.a())) {}
    VideoActionSheet localVideoActionSheet;
    do
    {
      return;
      localVideoActionSheet = VideoActionSheet.a(jdField_a_of_type_AndroidContentContext);
      if (!paramBoolean) {
        break;
      }
      if (paramInt == 1)
      {
        a(paramMessageForVideo, localVideoActionSheet);
        return;
      }
    } while (paramInt != 3000);
    b(paramMessageForVideo, localVideoActionSheet);
    return;
    c(paramMessageForVideo, localVideoActionSheet);
  }
  
  private void a(boolean paramBoolean, MessageForVideo paramMessageForVideo)
  {
    Object localObject;
    long l;
    if (paramBoolean)
    {
      localObject = new HashMap();
      ((Map)localObject).put("MultiAVType", String.valueOf(extInt));
      ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, (Map)localObject);
      l = Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000) {
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() != l) {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Multi_call", "Multi_call_disobj_launch", 0, 0, "", "", "", "");
        }
      }
    }
    label248:
    String str1;
    String str2;
    label393:
    label459:
    label496:
    int m;
    label717:
    label750:
    label762:
    do
    {
      do
      {
        return;
      } while ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(1, l)));
      if (extInt == 10)
      {
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a() == 0L)
        {
          paramMessageForVideo = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l, 10);
          if ((paramMessageForVideo == null) || (jdField_a_of_type_Int <= 0)) {
            break label248;
          }
        }
        for (;;)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005DC6", "0X8005DC6", 0, 0, "", "", "", "");
          return;
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005925", "0X8005925", 0, 0, "", "", "", "");
        }
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80046CB", "0X80046CB", 0, 0, "", "", "", "");
      return;
      if (!isVideo)
      {
        str1 = "Two_call";
        str2 = "Two_call_launch";
        switch (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)
        {
        default: 
          localObject = "0";
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", str1, str2, 0, 0, (String)localObject, "", "", "");
          if (type == 2)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004009", "", 0, 0, "2", "", "", "");
            if (!isVideo) {
              break label717;
            }
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005643", "0X8005643", 0, 0, "", "", "", "");
            localObject = null;
            str1 = null;
            m = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
            str2 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d;
            if (m != 1006) {
              break label750;
            }
            str1 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
          }
          break;
        }
      }
      for (;;)
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1024) {
          break label807;
        }
        if (!CrmUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) {
          break label762;
        }
        CrmUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, "IvrAIOMessageEngineFalse");
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004655", "0X8004655", 0, 0, "", "", "", "");
        return;
        str1 = "Two_video_call";
        str2 = "Two_video_call_launch";
        break;
        localObject = "0";
        break label393;
        localObject = "1";
        break label393;
        localObject = "2";
        break label393;
        localObject = "3";
        break label393;
        localObject = "4";
        break label393;
        if (type != 0) {
          break label459;
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800400A", "", 0, 0, "2", "", "", "");
        break label459;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005244", "0X8005244", 0, 0, "", "", "", "");
        break label496;
        localObject = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
      }
      QQToast.a(jdField_a_of_type_AndroidContentContext, 2131363456, 1).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "Don't support ivr");
    return;
    label807:
    if (m == 1008)
    {
      paramMessageForVideo = new Bundle();
      paramMessageForVideo.putString("businessName", str2);
      paramMessageForVideo.putString("uin", (String)localObject);
      paramMessageForVideo.putString("from_where", "publicAccountAIOMsg");
      C2BUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, paramMessageForVideo);
      return;
    }
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    Context localContext = jdField_a_of_type_AndroidContentContext;
    if (!isVideo) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      ChatActivityUtils.a(localQQAppInterface, localContext, m, (String)localObject, str2, str1, paramBoolean, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString, true, true, null, "from_internal");
      return;
    }
  }
  
  private void b(MessageForVideo paramMessageForVideo, VideoActionSheet paramVideoActionSheet)
  {
    paramVideoActionSheet.c(2131367816);
    PstnManager localPstnManager = (PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142);
    PstnCardInfo localPstnCardInfo = localPstnManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    int m;
    if ((localPstnManager.a() == 1) && (af == 1))
    {
      paramVideoActionSheet.a(2131372009);
      if (pstn_multi_call_time > 0)
      {
        paramVideoActionSheet.a(jdField_a_of_type_AndroidContentContext.getResources().getString(2131372007), jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839032), 0);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063FE", "0X80063FE", 1, 0, "", "", "", "");
        m = 3;
      }
    }
    for (;;)
    {
      paramVideoActionSheet.d(2131366996);
      paramVideoActionSheet.a(new lcn(this, paramVideoActionSheet, paramMessageForVideo, m));
      paramVideoActionSheet.show();
      return;
      if ((localPstnManager.c() == 1) && (pstn_multi_try_status == 0))
      {
        paramVideoActionSheet.a(jdField_a_of_type_AndroidContentContext.getResources().getString(2131372007), jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839031), 0);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063FE", "0X80063FE", 3, 0, "", "", "", "");
        m = 4;
      }
      else
      {
        paramVideoActionSheet.a(jdField_a_of_type_AndroidContentContext.getResources().getString(2131372007), jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839029), 0);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063FE", "0X80063FE", 2, 0, "", "", "", "");
        m = 5;
        continue;
        m = 0;
      }
    }
  }
  
  private void c(MessageForVideo paramMessageForVideo, VideoActionSheet paramVideoActionSheet)
  {
    int m = 0;
    PstnSessionInfo localPstnSessionInfo = new PstnSessionInfo();
    PstnManager localPstnManager = (PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142);
    PstnCardInfo localPstnCardInfo = localPstnManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    if (isVideo) {
      paramVideoActionSheet.c(2131367812);
    }
    for (;;)
    {
      paramVideoActionSheet.d(2131366996);
      paramVideoActionSheet.a(new lco(this, paramVideoActionSheet, paramMessageForVideo, m, localPstnSessionInfo));
      paramVideoActionSheet.show();
      return;
      paramVideoActionSheet.c(2131367815);
      localPstnSessionInfo = PstnUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localPstnSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      if ((jdField_b_of_type_JavaLangString != null) && (c != null))
      {
        d = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d;
        if ((localPstnManager.a() == 1) && (ac == 1))
        {
          paramVideoActionSheet.a(2131372009);
          if (pstn_c2c_call_time > 0)
          {
            paramVideoActionSheet.a(jdField_a_of_type_AndroidContentContext.getResources().getString(2131372007), jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839032), 0);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063FD", "0X80063FD", 1, 0, "", "", "", "");
            m = 1;
          }
          else if ((localPstnManager.b() == 1) && (pstn_c2c_try_status == 0))
          {
            paramVideoActionSheet.a(jdField_a_of_type_AndroidContentContext.getResources().getString(2131372007), jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839031), 0);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063FD", "0X80063FD", 3, 0, "", "", "", "");
            m = 2;
          }
          else
          {
            paramVideoActionSheet.a(jdField_a_of_type_AndroidContentContext.getResources().getString(2131372007), jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839029), 0);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80063FD", "0X80063FD", 2, 0, "", "", "", "");
            m = 5;
          }
        }
      }
    }
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 1;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    lcp localLcp = (lcp)paramViewHolder;
    paramBaseChatItemLayout = paramBaseChatItemLayout.getContext();
    Resources localResources = jdField_a_of_type_AndroidContentContext.getResources();
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new TextView(jdField_a_of_type_AndroidContentContext);
      paramViewHolder.setId(2131297402);
      paramViewHolder.setTextColor(localResources.getColorStateList(2131428183));
      paramViewHolder.setTextSize(localResources.getDimensionPixelOffset(2131492882));
      paramViewHolder.setGravity(16);
      a = paramViewHolder;
    }
    paramView = (MessageForVideo)paramChatMessage;
    int m = VideoMsgTools.a(paramBaseChatItemLayout, type, text, isVideo, paramChatMessage.isSendFromLocal());
    a(a, m);
    m = VideoMsgTools.a(paramBaseChatItemLayout, type, text, paramChatMessage.isSendFromLocal());
    a.setTextColor(localResources.getColor(m));
    a.setText(text);
    paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
    paramViewHolder.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    if (b) {
      a(paramView, paramBaseChatItemLayout, paramViewHolder);
    }
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new lcp(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "发送了视频";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    if (paramInt == 2131304463)
    {
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
    }
    if (paramInt == 2131304473)
    {
      super.b(paramChatMessage);
      return;
    }
    super.a(paramInt, paramContext, paramChatMessage);
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
    lcp localLcp = (lcp)paramViewHolder;
    a.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_Int);
    if ((c == 0) || (!paramBubbleInfo.a()))
    {
      paramView = paramView.getResources();
      if (a.getText().toString().contains(jdField_a_of_type_AndroidContentContext.getString(2131363221)))
      {
        paramViewHolder = paramView.getColorStateList(2131428238);
        a.setTextColor(paramViewHolder);
        return;
      }
      if (paramChatMessage.isSend())
      {
        paramViewHolder = paramView.getColorStateList(2131428186);
        a.setTextColor(paramViewHolder);
        if (!paramChatMessage.isSend()) {
          break label151;
        }
      }
      label151:
      for (paramViewHolder = paramView.getColorStateList(2131428185);; paramViewHolder = paramView.getColorStateList(2131428184))
      {
        a.setLinkTextColor(paramViewHolder);
        return;
        paramViewHolder = paramView.getColorStateList(2131428183);
        break;
      }
    }
    if (d == 0) {
      a.setTextColor(-16777216);
    }
    while (e == 0)
    {
      a.setLinkTextColor(paramView.getResources().getColorStateList(2131428184));
      return;
      a.setTextColor(d);
    }
    a.setLinkTextColor(e);
  }
  
  public void a(boolean paramBoolean)
  {
    d = paramBoolean;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    AIOUtils.a(paramView);
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
    return localQQCustomMenu.a();
  }
}
