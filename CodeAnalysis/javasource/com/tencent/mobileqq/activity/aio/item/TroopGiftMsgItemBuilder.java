package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.etrump.mixlayout.FontManager;
import com.rookery.translate.model.TransDiskCache;
import com.rookery.translate.model.Trans_entity;
import com.rookery.translate.model.TranslateCache;
import com.rookery.translate.util.LocaleUtil;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.MultiForwardActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.bubble.BubbleUtils;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForTroopGift;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopGiftManager;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import lcc;
import lcd;
import lce;
import lcf;
import lcg;

public abstract class TroopGiftMsgItemBuilder
  extends BaseBubbleBuilder
{
  public static List a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new LinkedList();
  }
  
  public TroopGiftMsgItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
  }
  
  public static void a(QQAppInterface paramQQAppInterface)
  {
    if (!jdField_a_of_type_JavaUtilList.isEmpty())
    {
      ArrayList localArrayList = new ArrayList(jdField_a_of_type_JavaUtilList.size());
      localArrayList.addAll(jdField_a_of_type_JavaUtilList);
      jdField_a_of_type_JavaUtilList.clear();
      ThreadManager.a(new lce(paramQQAppInterface.a().createEntityManager(), localArrayList), 5, null, true);
    }
  }
  
  private void a(ChatMessage paramChatMessage, Context paramContext, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView)
  {
    int i = 0;
    if ((jdField_a_of_type_AndroidContentContext instanceof MultiForwardActivity)) {}
    for (boolean bool = false;; bool = true)
    {
      TransDiskCache localTransDiskCache;
      if ((vipBubbleID == 100000L) && (msgtype == 64536))
      {
        paramContext = LocaleUtil.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
        localTransDiskCache = TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
        if (localTransDiskCache == null) {
          break label309;
        }
      }
      label309:
      for (paramContext = localTransDiskCache.a(msg, uniseq, paramContext);; paramContext = null)
      {
        if ((paramContext != null) && (paramContext.a().booleanValue()) && (!paramChatMessage.isSend())) {}
        for (jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(100001, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext.getResources(), null, bool);; jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(100000, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext.getResources(), null, bool))
        {
          if (jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo != null) {
            jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo.a(jdField_a_of_type_AndroidViewView, null);
          }
          if (jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo != null)
          {
            j = vipBubbleDiyTextId;
            i = j;
            if (j <= 0) {
              i = SVIPHandler.b(vipBubbleID);
            }
            jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage.isSend(), paramChatMessage.needVipBubble(), true, paramView, FontManager.a(paramChatMessage), i);
          }
          if (jdField_a_of_type_AndroidViewView != null)
          {
            paramContext = jdField_a_of_type_AndroidViewView.getBackground();
            if (paramContext != null) {
              paramContext.setAlpha(k_);
            }
          }
          super.a(paramView, paramChatMessage);
          return;
        }
        int j = SVIPHandler.a(vipBubbleID);
        if (!paramChatMessage.needVipBubble()) {}
        for (;;)
        {
          jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(i, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramContext.getResources(), null, bool);
          break;
          i = j;
        }
      }
    }
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  public abstract View a();
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    localLcg = (lcg)paramViewHolder;
    View localView = paramView;
    float f;
    if (paramView == null)
    {
      localView = a();
      jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)localView);
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304239));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304240));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304241));
      jdField_a_of_type_AndroidWidgetButton = ((Button)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304243));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304238));
      jdField_a_of_type_AndroidWidgetImageButton = ((ImageButton)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304242));
      jdField_b_of_type_AndroidViewView = jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304237);
      jdField_c_of_type_AndroidViewView = jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131304244);
      i = (int)Math.min(BaseChatItemLayout.h - (int)DisplayUtils.a(jdField_a_of_type_AndroidContentContext, 24.0F), DisplayUtils.a(jdField_a_of_type_AndroidContentContext, 251.0F));
      f = i / DisplayUtils.a(jdField_a_of_type_AndroidContentContext, 238.0F);
      if (f <= 1.0F) {
        break label943;
      }
      f = 1.0F;
    }
    label943:
    for (;;)
    {
      paramView = (LinearLayout.LayoutParams)jdField_b_of_type_AndroidViewView.getLayoutParams();
      width = i;
      jdField_b_of_type_AndroidViewView.setLayoutParams(paramView);
      paramView = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetImageView.getLayoutParams();
      width = ((int)DisplayUtils.a(jdField_a_of_type_AndroidContentContext, f * 110.0F));
      jdField_a_of_type_AndroidWidgetImageView.setLayoutParams(paramView);
      localMessageForTroopGift = (MessageForTroopGift)paramChatMessage;
      jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift = localMessageForTroopGift;
      jdField_a_of_type_AndroidWidgetTextView.setText(title);
      jdField_b_of_type_AndroidWidgetTextView.setText(subtitle);
      jdField_c_of_type_AndroidWidgetTextView.setText(message);
      jdField_a_of_type_AndroidWidgetButton.setText(comefrom);
      jdField_a_of_type_AndroidWidgetButton.setContentDescription(comefrom);
      Object localObject = null;
      paramBaseChatItemLayout = null;
      paramChatMessage = paramBaseChatItemLayout;
      paramView = localObject;
      try
      {
        URLDrawable.URLDrawableOptions localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
        paramChatMessage = paramBaseChatItemLayout;
        paramView = localObject;
        mFailedDrawable = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130842919);
        paramChatMessage = paramBaseChatItemLayout;
        paramView = localObject;
        mLoadingDrawable = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130842919);
        paramChatMessage = paramBaseChatItemLayout;
        paramView = localObject;
        paramBaseChatItemLayout = URLDrawable.getDrawable("http://pub.idqqimg.com/pc/misc/groupgift/objicon_" + giftPicId + ".png", localURLDrawableOptions);
        paramChatMessage = paramBaseChatItemLayout;
        paramView = paramBaseChatItemLayout;
        paramBaseChatItemLayout.setDownloadListener(new lcc(this));
      }
      catch (OutOfMemoryError paramView)
      {
        for (;;)
        {
          paramBaseChatItemLayout = paramChatMessage;
          if (QLog.isColorLevel())
          {
            QLog.d(jdField_a_of_type_JavaLangString, 2, paramView.getMessage());
            paramBaseChatItemLayout = paramChatMessage;
          }
        }
      }
      catch (Exception paramChatMessage)
      {
        for (;;)
        {
          paramBaseChatItemLayout = paramView;
          if (QLog.isColorLevel())
          {
            QLog.d(jdField_a_of_type_JavaLangString, 2, paramChatMessage.getMessage());
            paramBaseChatItemLayout = paramView;
            continue;
            jdField_a_of_type_AndroidWidgetImageButton.setVisibility(0);
            jdField_a_of_type_AndroidWidgetImageButton.setOnClickListener(paramChatMessage);
            continue;
            jdField_c_of_type_AndroidViewView.setVisibility(8);
            paramChatMessage.b(localLcg);
            continue;
            if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(Long.valueOf(receiverUin))) {
              i = 1;
            } else {
              i = 2;
            }
          }
        }
      }
      if ((paramBaseChatItemLayout != null) && (paramBaseChatItemLayout.getStatus() == 2)) {
        paramBaseChatItemLayout.restartDownload();
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramBaseChatItemLayout);
      paramChatMessage = new lcf(this, localMessageForTroopGift, localLcg);
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(paramChatMessage);
      jdField_b_of_type_AndroidViewView.setOnClickListener(paramChatMessage);
      jdField_b_of_type_AndroidViewView.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_b_of_type_AndroidViewView.setOnTouchListener(new lcd(this, paramOnLongClickAndTouchListener));
      if (animationPackageId != 0) {
        break;
      }
      jdField_a_of_type_AndroidWidgetImageButton.setVisibility(8);
      paramChatMessage = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
      if ((!isLoading) || (!paramChatMessage.b(animationPackageId + ""))) {
        break label1021;
      }
      paramChatMessage.a(localLcg);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "VISIBLE uniseq = " + uniseq);
      }
      jdField_c_of_type_AndroidViewView.setVisibility(0);
      a(localMessageForTroopGift, jdField_a_of_type_AndroidContentContext, paramViewHolder, jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131296713));
      if (!isReported)
      {
        isReported = true;
        jdField_a_of_type_JavaUtilList.add(localMessageForTroopGift);
        if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(senderuin)) {
          break label1040;
        }
        i = 0;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "exp_obj", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, i + "", giftPicId + "", "");
        if (animationPackageId > 0) {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "exp_play", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, i + "", giftPicId + "", "");
        }
      }
      return localView;
    }
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    paramChatMessage = (MessageForTroopGift)paramChatMessage;
    return "发来来自送花的" + title + subtitle + message;
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      super.a(paramInt, paramContext, paramChatMessage);
      return;
    }
    ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
  }
  
  protected void a(View paramView, ChatMessage paramChatMessage)
  {
    paramView.setPadding(0, 0, 0, BaseChatItemLayout.l);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    a(AIOUtils.a(paramView), localQQCustomMenu);
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    return localQQCustomMenu.a();
  }
}
