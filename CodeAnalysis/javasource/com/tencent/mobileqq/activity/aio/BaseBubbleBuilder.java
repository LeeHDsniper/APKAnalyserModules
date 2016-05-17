package com.tencent.mobileqq.activity.aio;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.support.v4.app.FragmentActivity;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.etrump.mixlayout.FontManager;
import com.rookery.translate.model.TransDiskCache;
import com.rookery.translate.model.Trans_entity;
import com.rookery.translate.model.TranslateCache;
import com.rookery.translate.util.LocaleUtil;
import com.tencent.biz.TroopMemberLbs.TroopMemberLbsHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousExtInfo;
import com.tencent.biz.pubaccount.AccountDetailActivity;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.component.network.utils.Base64;
import com.tencent.device.DeviceHeadMgr;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.ChatSettingActivity;
import com.tencent.mobileqq.activity.MultiForwardActivity;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.TroopMemberCardActivity;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.item.SubscriptPicItemBuilder.Holder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.NearbyFlowerManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.bubble.AnimationConfig;
import com.tencent.mobileqq.bubble.BubbleConfig;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.bubble.BubbleInfo.CommonAttrs;
import com.tencent.mobileqq.bubble.BubbleManager;
import com.tencent.mobileqq.bubble.BubbleUtils;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForMarketFace;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageForTroopTopic;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.nearby.profilecard.NearbyPeopleProfileActivity;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.view.StructMsgItemLayout12;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.mobileqq.troop.utils.TroopBarUtils;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil.TroopBusinessMessage;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopGagMgr.SelfGagInfo;
import com.tencent.mobileqq.troop.utils.TroopGiftUtil;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import com.tencent.mobileqq.urldrawable.URLDrawableDecodeHandler;
import com.tencent.mobileqq.util.FaceDrawable;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.AvatarPendantUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.vas.AvatarPendantManager;
import com.tencent.mobileqq.vas.PendantInfo;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.Pair;
import com.tencent.util.ProfilePerformanceReport;
import com.tencent.util.VersionUtils;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import kpp;
import kpq;
import kpr;
import kps;
import kpt;

public abstract class BaseBubbleBuilder
  implements View.OnClickListener, ChatItemBuilder
{
  private static final Handler jdField_a_of_type_AndroidOsHandler;
  public static boolean a = false;
  public static final int b = 0;
  public static final int c = 1;
  public static final int d = 2;
  public static final int e = 3;
  public static final int f = 1;
  public static final int g = 2;
  public static int k_;
  public Context a;
  View.OnLongClickListener jdField_a_of_type_AndroidViewView$OnLongClickListener = new kpr(this);
  @Deprecated
  public BaseAdapter a;
  public SessionInfo a;
  private AIOAnimationConatiner jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner;
  public QQAppInterface a;
  protected float a_;
  private boolean d = false;
  private int h = -1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    k_ = 255;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    if (("MNC".equals(Build.VERSION.CODENAME)) || (Build.VERSION.SDK_INT >= 23)) {}
    for (bool = true;; bool = false)
    {
      jdField_a_of_type_Boolean = bool;
      return;
    }
  }
  
  public BaseBubbleBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidWidgetBaseAdapter = paramBaseAdapter;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner = paramAIOAnimationConatiner;
    a_ = getResourcesgetDisplayMetricsdensity;
  }
  
  private void a(ChatMessage paramChatMessage, Context paramContext, BaseChatItemLayout paramBaseChatItemLayout, BaseBubbleBuilder.ViewHolder paramViewHolder, int paramInt1, int paramInt2)
  {
    boolean bool1 = true;
    if ((jdField_a_of_type_AndroidContentContext instanceof MultiForwardActivity)) {
      bool1 = false;
    }
    label148:
    label404:
    label626:
    label686:
    for (;;)
    {
      int i;
      int j;
      try
      {
        i = a(paramChatMessage);
        jdField_a_of_type_Int = i;
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          j = 1;
          if ((j == 0) || (msgtype != 63536)) {
            break label148;
          }
          jdField_a_of_type_AndroidViewView.setBackgroundColor(-1);
          paramBaseChatItemLayout.a(jdField_a_of_type_AndroidViewView);
          a(jdField_a_of_type_AndroidViewView, paramChatMessage);
        }
      }
      catch (Exception localException)
      {
        QLog.e(jdField_a_of_type_JavaLangString, 1, "getBubbleType error : " + localException);
        i = 0;
        continue;
        j = 0;
        continue;
      }
      if (i != 0) {
        if ((vipBubbleID == 100000L) && (msgtype == 64536))
        {
          Object localObject = LocaleUtil.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
          paramContext = null;
          TransDiskCache localTransDiskCache = TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
          if (localTransDiskCache != null) {
            paramContext = localTransDiskCache.a(msg, uniseq, (String)localObject);
          }
          if ((paramContext != null) && (paramContext.a().booleanValue()) && (!paramChatMessage.isSend()))
          {
            jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(100001, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext.getResources(), jdField_a_of_type_AndroidWidgetBaseAdapter, bool1);
            if (jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo != null) {
              jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo.a(jdField_a_of_type_AndroidViewView, null);
            }
            if (jdField_a_of_type_AndroidViewView != null)
            {
              jdField_a_of_type_AndroidViewView.setMinimumWidth(AIOUtils.a(65.0F, jdField_a_of_type_AndroidContentContext.getResources()));
              jdField_a_of_type_AndroidViewView.setMinimumHeight(AIOUtils.a(57.0F, jdField_a_of_type_AndroidContentContext.getResources()));
            }
            if (jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo != null)
            {
              int k = vipBubbleDiyTextId;
              j = k;
              if (k <= 0) {
                j = SVIPHandler.b(vipBubbleID);
              }
              paramContext = jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo;
              localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
              boolean bool2 = paramChatMessage.isSend();
              boolean bool3 = paramChatMessage.needVipBubble();
              if (i != 2) {
                break label626;
              }
              bool1 = true;
              paramContext.a((QQAppInterface)localObject, bool2, bool3, bool1, jdField_a_of_type_AndroidViewView, FontManager.a(paramChatMessage), j);
            }
            if (jdField_a_of_type_AndroidViewView != null)
            {
              paramContext = jdField_a_of_type_AndroidViewView.getBackground();
              if (paramContext != null) {
                paramContext.setAlpha(k_);
              }
            }
            a(paramViewHolder, paramBaseChatItemLayout, paramChatMessage, jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo);
            a(paramViewHolder, paramChatMessage);
            if ((paramInt1 == paramInt2 - 1) && (mAnimFlag))
            {
              jdField_a_of_type_AndroidOsHandler.post(new kpq(this, paramViewHolder, paramChatMessage));
              mAnimFlag = false;
            }
          }
        }
      }
      for (;;)
      {
        if (jdField_a_of_type_AndroidViewView == null) {
          break label686;
        }
        paramBaseChatItemLayout.a(jdField_a_of_type_AndroidViewView);
        a(jdField_a_of_type_AndroidViewView, paramChatMessage);
        return;
        jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(100000, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext.getResources(), jdField_a_of_type_AndroidWidgetBaseAdapter, bool1);
        break;
        j = SVIPHandler.a(vipBubbleID);
        if ((i == 3) || (!paramChatMessage.needVipBubble())) {
          j = 0;
        }
        jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(j, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramContext.getResources(), jdField_a_of_type_AndroidWidgetBaseAdapter, bool1);
        break;
        bool1 = false;
        break label404;
        if (j == 0)
        {
          if (jdField_a_of_type_AndroidViewView == null)
          {
            QLog.e(jdField_a_of_type_JavaLangString, 1, "handleBubbleBg mContent is null type = " + istroop);
            return;
          }
          jdField_a_of_type_AndroidViewView.setBackgroundDrawable(null);
        }
      }
    }
  }
  
  private void a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout, int paramInt1, int paramInt2)
  {
    if (AIOUtils.i) {}
    Object localObject;
    do
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) {
        break;
      }
      localObject = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    } while ((localObject != null) && (((TroopInfo)localObject).hasOrgs()));
    if ((paramChatMessage == null) || (senderuin == null) || (AnonymousChatHelper.a(paramChatMessage)) || ((jdField_a_of_type_AndroidContentContext instanceof MultiForwardActivity)))
    {
      paramBaseChatItemLayout.setPendantImageVisible(false);
      return;
    }
    ExtensionInfo localExtensionInfo;
    AvatarPendantManager localAvatarPendantManager;
    if (paramChatMessage.isSend())
    {
      localObject = selfuin;
      FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if (localFriendsManager == null) {
        break label354;
      }
      localExtensionInfo = localFriendsManager.a((String)localObject);
      localAvatarPendantManager = (AvatarPendantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(45);
      if ((localExtensionInfo == null) || (!localExtensionInfo.isPendantValid())) {
        break label317;
      }
      AvatarPendantManager.b = true;
      if (!AvatarPendantUtil.a(pendantId)) {
        break label295;
      }
      localAvatarPendantManager.a(pendantId).a(paramBaseChatItemLayout, 2, uniseq);
      label191:
      if ((!localFriendsManager.b((String)localObject)) && (localExtensionInfo.isPendantExpired())) {
        AvatarPendantUtil.a((String)localObject);
      }
      if ((!localAvatarPendantManager.a(uniseq)) && (jdField_a_of_type_ComTencentImageURLImageView != null)) {
        jdField_a_of_type_ComTencentImageURLImageView.setVisibility(4);
      }
    }
    for (;;)
    {
      mPendantAnimatable = false;
      return;
      if ((istroop == 1000) || (istroop == 1020) || (istroop == 1004))
      {
        localObject = frienduin;
        break;
      }
      localObject = senderuin;
      break;
      label295:
      localAvatarPendantManager.a(pendantId).a(paramBaseChatItemLayout, 1, uniseq);
      break label191;
      label317:
      if (jdField_a_of_type_ComTencentImageURLImageView != null)
      {
        jdField_a_of_type_ComTencentImageURLImageView.setImageDrawable(null);
        jdField_a_of_type_ComTencentImageURLImageView.setVisibility(8);
      }
      if (localExtensionInfo == null)
      {
        AvatarPendantUtil.a((String)localObject);
        continue;
        label354:
        if (jdField_a_of_type_ComTencentImageURLImageView != null)
        {
          jdField_a_of_type_ComTencentImageURLImageView.setImageDrawable(null);
          jdField_a_of_type_ComTencentImageURLImageView.setVisibility(8);
        }
      }
    }
  }
  
  private void a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout, BaseBubbleBuilder.ViewHolder paramViewHolder)
  {
    Object localObject1;
    if ((istroop == 1) || (istroop == 3000)) {
      if (isMultiMsg) {
        localObject1 = MultiMsgManager.a().a(senderuin, msgseq, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
    }
    for (;;)
    {
      label64:
      Object localObject2;
      int i;
      if ((localObject1 == null) || (((String)localObject1).length() == 0))
      {
        localObject1 = senderuin;
        if (!AnonymousChatHelper.a(paramChatMessage)) {
          break label929;
        }
        localObject2 = ajdField_b_of_type_JavaLangString;
        i = 1;
      }
      for (;;)
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a;
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
          localObject1 = ColorStateList.valueOf(AnonymousChatHelper.jdField_d_of_type_Int);
        }
        for (;;)
        {
          if ((istroop == 1) && (((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).a(frienduin) != null)) {}
          for (boolean bool1 = HotChatManager.a(paramChatMessage);; bool1 = false)
          {
            if (msgtype == 62530) {
              localObject2 = PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.getContext());
            }
            TroopBusinessUtil.TroopBusinessMessage localTroopBusinessMessage = TroopBusinessUtil.a(paramChatMessage);
            if (localTroopBusinessMessage != null)
            {
              String str = jdField_c_of_type_JavaLangString;
              localObject2 = str;
              if (ThemeUtil.isDefaultTheme(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface))
              {
                localObject1 = ColorStateList.valueOf(jdField_b_of_type_Int);
                localObject2 = str;
              }
            }
            for (;;)
            {
              boolean bool2;
              label254:
              boolean bool3;
              label269:
              label283:
              label318:
              label364:
              int j;
              if (((localObject2 != null) && (!paramChatMessage.isSend())) || (i != 0))
              {
                bool2 = true;
                if ((i == 0) || (!AnonymousChatHelper.b(paramChatMessage))) {
                  break label541;
                }
                bool3 = true;
                paramBaseChatItemLayout.a(bool2, (CharSequence)localObject2, (ColorStateList)localObject1, bool3, bool1);
                if (e != null)
                {
                  if (AnonymousChatHelper.a(paramChatMessage)) {
                    break label695;
                  }
                  e.setOnClickListener(this);
                  e.setTag(Integer.valueOf(2131296320));
                  if ((AppSetting.i) && (Build.VERSION.SDK_INT >= 14)) {
                    e.setAccessibilityDelegate(new kpp(this));
                  }
                }
                if (AppSetting.i)
                {
                  if (istroop != 1) {
                    break label706;
                  }
                  i = 1;
                  if (istroop != 3000) {
                    break label712;
                  }
                  j = 1;
                  label377:
                  bool1 = paramChatMessage.isSend();
                  if ((i != 0) || (j != 0))
                  {
                    if (i == 0) {
                      break label810;
                    }
                    if (!bool1) {
                      break label718;
                    }
                    localObject1 = "我的群名片";
                  }
                }
              }
              for (;;)
              {
                jdField_a_of_type_AndroidWidgetImageView.setContentDescription((CharSequence)localObject1);
                if ((AppSetting.i) && (jdField_b_of_type_JavaLangStringBuilder != null))
                {
                  if (paramChatMessage.isSend()) {
                    jdField_b_of_type_JavaLangStringBuilder.append("我");
                  }
                }
                else
                {
                  return;
                  if (istroop == 1)
                  {
                    localObject1 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, senderuin, frienduin, 1, 0);
                    break;
                  }
                  if (3000 != istroop) {
                    break label939;
                  }
                  localObject1 = ContactUtils.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin, senderuin);
                  break;
                  localObject1 = (String)localObject1 + ":";
                  break label64;
                  bool2 = false;
                  break label254;
                  label541:
                  bool3 = false;
                  break label269;
                  if (istroop == 9501)
                  {
                    if (("device_groupchat".equals(extStr)) && (issend == 0))
                    {
                      localObject1 = ContactUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, senderuin, true);
                      if (senderuin.equals(frienduin)) {
                        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
                      }
                      if (localObject1 != null)
                      {
                        localObject2 = localObject1;
                        if (((String)localObject1).length() != 0) {}
                      }
                      else
                      {
                        localObject2 = senderuin;
                      }
                      paramBaseChatItemLayout.a(true, (CharSequence)localObject2, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a, false, false);
                    }
                    for (;;)
                    {
                      localObject2 = null;
                      break;
                      paramBaseChatItemLayout.a(false, null, null, false, false);
                    }
                  }
                  paramBaseChatItemLayout.a(false, null, null, false, false);
                  localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
                  break label283;
                  label695:
                  e.setOnClickListener(null);
                  break label318;
                  label706:
                  i = 0;
                  break label364;
                  label712:
                  j = 0;
                  break label377;
                  label718:
                  if ("1000000".equals(senderuin))
                  {
                    if (msgtype == 62530)
                    {
                      localObject1 = String.format(paramBaseChatItemLayout.getResources().getString(2131365189), new Object[] { PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.getContext()) });
                      continue;
                    }
                    localObject1 = "进入群应用";
                    continue;
                  }
                  localObject1 = (String)localObject2 + "群名片";
                  continue;
                  label810:
                  if (j == 0) {
                    break label909;
                  }
                  if (bool1)
                  {
                    localObject1 = "我的资料卡";
                    continue;
                  }
                  localObject1 = (String)localObject2 + "资料卡";
                  continue;
                }
                paramBaseChatItemLayout = (BaseChatItemLayout)localObject2;
                if (localObject2 == null) {
                  paramBaseChatItemLayout = "";
                }
                if (AnonymousChatHelper.a(paramChatMessage))
                {
                  jdField_b_of_type_JavaLangStringBuilder.append(jdField_a_of_type_AndroidContentContext.getResources().getString(2131364803)).append(paramBaseChatItemLayout);
                  return;
                }
                jdField_b_of_type_JavaLangStringBuilder.append(paramBaseChatItemLayout);
                return;
                label909:
                localObject1 = "";
              }
            }
          }
        }
        label929:
        i = 0;
        localObject2 = localObject1;
      }
      label939:
      localObject1 = null;
    }
  }
  
  public static void a(QQCustomMenu paramQQCustomMenu, Context paramContext)
  {
    paramQQCustomMenu.a(2131304463, paramContext.getString(2131367614));
  }
  
  private void a(String paramString1, int paramInt, String paramString2)
  {
    if ((jdField_a_of_type_AndroidContentContext instanceof BaseActivity)) {}
    for (QQAppInterface localQQAppInterface = (QQAppInterface)((BaseActivity)jdField_a_of_type_AndroidContentContext).getAppRuntime();; localQQAppInterface = null)
    {
      if (localQQAppInterface != null) {
        ReportController.b(localQQAppInterface, "CliOper", "", "", "Bubble", paramString1, 0, 1, String.valueOf(paramInt), VipUtils.a(localQQAppInterface, localQQAppInterface.a()), paramString2, null);
      }
      return;
    }
  }
  
  private void b(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout, BaseBubbleBuilder.ViewHolder paramViewHolder)
  {
    boolean bool = true;
    if ((istroop == 1) && (!AnonymousChatHelper.a(paramChatMessage)))
    {
      if (TroopMemberLbsHelper.a(frienduin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).booleanValue())
      {
        CharSequence localCharSequence = TroopMemberLbsHelper.a(frienduin, senderuin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext);
        if (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
        {
          paramViewHolder = ColorStateList.valueOf(AnonymousChatHelper.jdField_d_of_type_Int);
          if (paramChatMessage.isSend()) {
            break label110;
          }
        }
        for (;;)
        {
          paramBaseChatItemLayout.a(bool, localCharSequence, paramViewHolder);
          return;
          paramViewHolder = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a;
          break;
          label110:
          bool = false;
        }
      }
      paramBaseChatItemLayout.a(false, "", null);
      return;
    }
    paramBaseChatItemLayout.a(false, "", null);
  }
  
  private void c(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    paramBaseChatItemLayout.setCheckBox(paramChatMessage, paramBaseChatItemLayout, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
  }
  
  private void d(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    if (AnonymousChatHelper.a(paramChatMessage))
    {
      localObject1 = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839534);
      paramBaseChatItemLayout.setHeaderIcon(URLDrawable.getDrawable(AnonymousChatHelper.a(ajdField_b_of_type_Int), (Drawable)localObject1, (Drawable)localObject1));
      jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetImageView.setOnLongClickListener(null);
      return;
    }
    if ((msgtype == 62530) && (istroop == 1))
    {
      paramBaseChatItemLayout.setHeaderIcon(jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130838456));
      jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetImageView.setOnLongClickListener(null);
      return;
    }
    Object localObject1 = TroopBusinessUtil.a(paramChatMessage);
    if (localObject1 != null)
    {
      paramChatMessage = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130838435);
      paramChatMessage = URLDrawable.getDrawable(jdField_a_of_type_JavaLangString, paramChatMessage, paramChatMessage);
      paramChatMessage.setTag(URLDrawableDecodeHandler.a(100, 100, 6));
      paramChatMessage.setDecodeHandler(URLDrawableDecodeHandler.a);
      paramBaseChatItemLayout.setHeaderIcon(paramChatMessage);
      jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetImageView.setOnLongClickListener(null);
      return;
    }
    int k = istroop;
    String str;
    label209:
    Object localObject2;
    label256:
    int j;
    if (paramChatMessage.isSend())
    {
      str = selfuin;
      localObject1 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      localObject2 = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
      if ((localObject2 == null) || (!((HotChatManager)localObject2).b(frienduin))) {
        break label736;
      }
      i = 1;
      if ((localObject1 == null) || (!((FriendsManager)localObject1).b(str))) {
        break label741;
      }
      j = 1;
      label274:
      if (((k != 1010) && (k != 1001) && ((i == 0) || ((j != 0) && (!str.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())))) && ((k != 1022) || ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_Int != 3007) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_Int != 2007) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_Int != 3019) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_Int != 2019)))) || (localObject1 == null) || (((FriendsManager)localObject1).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        break label747;
      }
      localObject2 = FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 200, str, true);
      localObject1 = localObject2;
      if (QLog.isColorLevel())
      {
        QLog.d("BaseBubbleBuilder", 2, "new head, uin = " + str);
        localObject1 = localObject2;
      }
    }
    for (;;)
    {
      paramBaseChatItemLayout.setHeaderIcon((Drawable)localObject1);
      if ((paramChatMessage.isSendFromLocal()) || ((k != 1) && (k != 3000))) {
        break label1017;
      }
      if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(senderuin))
      {
        localObject1 = frienduin;
        localObject2 = senderuin;
        ThreadManager.b(new kpt(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, paramBaseChatItemLayout, (String)localObject1, (String)localObject2, k, jdField_a_of_type_AndroidViewView$OnLongClickListener));
      }
      label536:
      jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetImageView.setTag(paramChatMessage);
      if (QLog.isColorLevel()) {
        QLog.d("BaseBubbleBuilder", 2, "AppSetting.enableTalkBack = " + AppSetting.i);
      }
      if (!AppSetting.i) {
        break;
      }
      localObject2 = "";
      localObject1 = localObject2;
      if (istroop != 1)
      {
        localObject1 = localObject2;
        if (istroop != 3000)
        {
          if (!paramChatMessage.isSend()) {
            break label1028;
          }
          localObject1 = "我的资料卡";
        }
      }
      label636:
      if (msgtype == 62530) {
        localObject1 = String.format(paramBaseChatItemLayout.getResources().getString(2131365189), new Object[] { PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.getContext()) });
      }
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription((CharSequence)localObject1);
      return;
      if ((istroop == 1000) || (istroop == 1020) || (istroop == 1004))
      {
        str = frienduin;
        break label209;
      }
      str = senderuin;
      break label209;
      label736:
      i = 0;
      break label256;
      label741:
      j = 0;
      break label274;
      label747:
      if ((k != 9501) || (paramChatMessage.isSend())) {
        break label846;
      }
      localObject1 = ((SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(Long.parseLong(str));
      if ((localObject1 != null) && (str.equals(String.valueOf(din)))) {
        localObject1 = new BitmapDrawable(BaseApplication.getContext().getResources(), DeviceHeadMgr.a().a(str));
      } else {
        localObject1 = FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1, str);
      }
    }
    label846:
    if (k == 1006) {}
    for (int i = 11;; i = 1)
    {
      if (k == 1)
      {
        localObject1 = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        if ((localObject1 != null) && (((TroopInfo)localObject1).hasOrgs())) {
          localObject2 = FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 109, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "_" + str);
        }
      }
      for (;;)
      {
        localObject1 = localObject2;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("BaseBubbleBuilder", 2, "QQ head, uin = " + str);
        localObject1 = localObject2;
        break;
        localObject2 = FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i, str);
        continue;
        localObject2 = FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i, str);
      }
      label1017:
      jdField_a_of_type_AndroidWidgetImageView.setOnLongClickListener(null);
      break label536;
      label1028:
      localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString + "资料卡";
      break label636;
    }
  }
  
  private void e(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    HotChatInfo localHotChatInfo = ((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    Object localObject2;
    int j;
    Object localObject1;
    int i;
    if (localHotChatInfo != null)
    {
      localObject2 = null;
      j = 0;
      if (!senderuin.equals(ownerUin)) {
        break label67;
      }
      localObject1 = "房主";
      i = 2130842923;
    }
    for (;;)
    {
      paramBaseChatItemLayout.a((String)localObject1, i);
      return;
      label67:
      i = j;
      localObject1 = localObject2;
      if (adminUins != null)
      {
        i = j;
        localObject1 = localObject2;
        if (adminUins.contains(senderuin))
        {
          localObject1 = "管理员";
          i = 2130842922;
        }
      }
    }
  }
  
  private void f(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    TroopManager localTroopManager = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {}
    int j;
    for (boolean bool = true;; bool = false)
    {
      j = -1;
      if (bool) {
        j = AnonymousChatHelper.jdField_e_of_type_Int;
      }
      if (!AnonymousChatHelper.a(paramChatMessage)) {
        break;
      }
      i = jdField_a_of_type_AndroidContentContext.getResources().getColor(2131427914);
      if (!bool) {
        i = jdField_a_of_type_AndroidContentContext.getResources().getColor(2131427912);
      }
      paramBaseChatItemLayout.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true, jdField_a_of_type_AndroidContentContext.getResources().getString(2131364805), AnonymousChatHelper.b(paramChatMessage), i, j);
      c.setOnClickListener(null);
      return;
    }
    if ("1000000".equals(senderuin))
    {
      d = false;
      paramBaseChatItemLayout.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false, null, false, -1, j);
      return;
    }
    if ((paramChatMessage instanceof MessageForTroopTopic))
    {
      paramBaseChatItemLayout.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false, null, false, -1, j);
      return;
    }
    Object localObject = TroopBusinessUtil.a(paramChatMessage);
    if (localObject != null)
    {
      i = jdField_c_of_type_Int;
      paramBaseChatItemLayout.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true, jdField_d_of_type_JavaLangString, false, jdField_d_of_type_Int, i);
      c.setOnClickListener(this);
      c.setTag(Integer.valueOf(2131296319));
      return;
    }
    localObject = null;
    if (h == -1) {
      h = jdField_a_of_type_AndroidContentContext.getResources().getColor(2131427912);
    }
    int i = h;
    TroopInfo localTroopInfo;
    String str;
    TroopMemberInfo localTroopMemberInfo;
    int k;
    if ((istroop == 1) && (localTroopManager != null))
    {
      localTroopInfo = localTroopManager.a(frienduin);
      if ((localTroopInfo != null) && (cGroupRankSysFlag == 1) && (cGroupRankUserFlag == 1))
      {
        str = paramChatMessage.getExtInfoFromExtStr("uniqueTitle");
        localTroopMemberInfo = localTroopManager.a(frienduin, senderuin);
        localObject = localTroopManager.a(localTroopInfo, localTroopMemberInfo, jdField_a_of_type_AndroidContentContext);
        if (localTroopMemberInfo == null)
        {
          k = 0;
          if ((k <= 9) || (!android.text.TextUtils.isEmpty(str)) || (localTroopInfo.isTroopOwner(senderuin)) || (localTroopInfo.isTroopAdmin(senderuin))) {
            break label543;
          }
          paramChatMessage = BaseApplication.getContext().getSharedPreferences("mobileQQ", 4).getString("FlowerRank_" + k, null);
          if (android.text.TextUtils.isEmpty(paramChatMessage)) {
            break label649;
          }
          i = Color.parseColor(paramChatMessage) & 0xCCFFFFFF;
          label476:
          paramChatMessage = (ChatMessage)localObject;
          localObject = str;
        }
      }
    }
    for (;;)
    {
      if (!android.text.TextUtils.isEmpty((CharSequence)localObject))
      {
        paramBaseChatItemLayout.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true, (String)localObject, false, i, j);
        d = true;
        c.setOnClickListener(this);
        c.setTag(Integer.valueOf(2131296319));
        return;
        k = level;
        break;
        label543:
        i = jdField_a_of_type_AndroidContentContext.getResources().getColor(localTroopManager.a(localTroopInfo, localTroopMemberInfo, str, bool));
        paramChatMessage = (ChatMessage)localObject;
        localObject = str;
        continue;
      }
      if ((paramChatMessage != null) && (paramChatMessage.length() > 0))
      {
        paramBaseChatItemLayout.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true, paramChatMessage, false, i, j);
        d = true;
        c.setOnClickListener(this);
        c.setTag(Integer.valueOf(2131296319));
        return;
      }
      d = false;
      paramBaseChatItemLayout.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false, null, false, -1, j);
      return;
      label649:
      break label476;
      paramChatMessage = null;
    }
  }
  
  public abstract int a(ChatMessage paramChatMessage);
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    if (QLog.isColorLevel()) {
      QLog.d("BubbleView", 2, " getView position = " + paramInt1 + ", msgseq = " + msgseq + ", shmsgseq = " + shmsgseq);
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && ((msgtype == 63536) || (msgtype == 64536) || (msgtype == 64499) || (msgtype == 63525) || (msgtype == 63529))) {}
    for (int i = 1;; i = 0)
    {
      Context localContext = paramViewGroup.getContext();
      paramViewGroup = (BaseChatItemLayout)paramView;
      boolean bool = AppSetting.i;
      Object localObject1;
      Object localObject2;
      if (paramViewGroup == null)
      {
        localObject1 = new BaseChatItemLayout(localContext);
        ((BaseChatItemLayout)localObject1).setId(2131296407);
        ((BaseChatItemLayout)localObject1).setFocusableInTouchMode(true);
        ((BaseChatItemLayout)localObject1).setPadding(BaseChatItemLayout.w, BaseChatItemLayout.y, BaseChatItemLayout.x, 0);
        localObject2 = a();
        ((BaseChatItemLayout)localObject1).setTag(localObject2);
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout = ((BaseChatItemLayout)localObject1);
        paramViewGroup = (ViewGroup)localObject1;
        paramView = (View)localObject2;
        if (bool)
        {
          jdField_b_of_type_JavaLangStringBuilder = new StringBuilder();
          paramView = (View)localObject2;
          paramViewGroup = (ViewGroup)localObject1;
        }
      }
      for (;;)
      {
        int j;
        if (i != 0)
        {
          j = AIOUtils.a(7.5F, localContext.getResources());
          paramViewGroup.setPadding(0, j, 0, j);
        }
        localObject1 = paramView;
        if (i != 0)
        {
          localObject1 = paramView;
          if (msgtype == 63536)
          {
            localObject1 = paramView;
            if (!(paramView instanceof SubscriptPicItemBuilder.Holder))
            {
              paramView = a();
              paramViewGroup.setTag(paramView);
              jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout = paramViewGroup;
              localObject1 = paramView;
              if (bool)
              {
                jdField_b_of_type_JavaLangStringBuilder = new StringBuilder();
                localObject1 = paramView;
              }
            }
          }
        }
        if ((bool) && (jdField_b_of_type_JavaLangStringBuilder == null)) {
          jdField_b_of_type_JavaLangStringBuilder = new StringBuilder();
        }
        jdField_b_of_type_Int = paramInt1;
        jdField_c_of_type_Int = paramInt2;
        localObject2 = null;
        paramView = (View)localObject2;
        if (bool)
        {
          paramViewGroup.setContentDescription(null);
          if (!android.text.TextUtils.isEmpty(jdField_b_of_type_JavaLangStringBuilder)) {
            jdField_b_of_type_JavaLangStringBuilder.replace(0, jdField_b_of_type_JavaLangStringBuilder.length(), "");
          }
          paramView = (View)localObject2;
          if (mNeedTimeStamp)
          {
            paramView = (View)localObject2;
            if (time <= 0L) {}
          }
        }
        try
        {
          paramView = TimeFormatterUtils.a(localContext, 3, time * 1000L);
          jdField_b_of_type_JavaLangStringBuilder.append(paramView).append(" ");
          jdField_a_of_type_ComTencentMobileqqDataChatMessage = paramChatMessage;
          if (paramChatMessage.isSend())
          {
            j = 1;
            paramViewGroup.setHearIconPosition(j);
            if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground != null)
            {
              ColorStateList localColorStateList = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a;
              localObject2 = localColorStateList;
              if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
              {
                localObject2 = localColorStateList;
                if (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
                  localObject2 = ColorStateList.valueOf(AnonymousChatHelper.jdField_d_of_type_Int);
                }
              }
              paramViewGroup.setTimeStamp(mNeedTimeStamp, time, (ColorStateList)localObject2, paramView);
            }
            paramViewGroup.setGrayTipsText(mNeedGrayTips, mMessageSource, jdField_a_of_type_AndroidContentContext.getResources().getColorStateList(2131427367));
            c(paramChatMessage, paramViewGroup);
            d(paramChatMessage, paramViewGroup);
            a(paramChatMessage, paramViewGroup, paramInt1, paramInt2);
            if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
            {
              paramView = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
              if ((paramView == null) || (!paramView.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
                break label1075;
              }
              e(paramChatMessage, paramViewGroup);
            }
            a(paramChatMessage, paramViewGroup, (BaseBubbleBuilder.ViewHolder)localObject1);
            b(paramChatMessage, paramViewGroup, (BaseBubbleBuilder.ViewHolder)localObject1);
            a(paramChatMessage, paramViewGroup);
            b(paramChatMessage, paramViewGroup);
            jdField_a_of_type_AndroidViewView = a(paramChatMessage, (BaseBubbleBuilder.ViewHolder)localObject1, jdField_a_of_type_AndroidViewView, paramViewGroup, paramOnLongClickAndTouchListener);
            if (i != 0)
            {
              j = AIOUtils.a(7.5F, jdField_a_of_type_AndroidContentContext.getResources());
              if (paramInt1 != 0) {
                break label1085;
              }
              paramViewGroup.setTimeStamp(false, 0L, null, null);
              paramViewGroup.setPadding(0, 0, 0, j);
              paramView = jdField_a_of_type_AndroidViewView.findViewById(2131296311);
              if ((paramView != null) && (paramView.findViewById(2131296491) != null)) {
                paramViewGroup.setPadding(0, AIOUtils.a(50.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, j);
              }
            }
            a(paramChatMessage, localContext, paramViewGroup, (BaseBubbleBuilder.ViewHolder)localObject1, paramInt1, paramInt2);
            if (bool)
            {
              jdField_b_of_type_JavaLangStringBuilder.append(a(paramChatMessage));
              paramViewGroup.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
              paramViewGroup.setFocusable(true);
            }
            if (i != 0)
            {
              paramViewGroup.b();
              paramViewGroup.a(localContext.getResources());
              jdField_a_of_type_AndroidViewView.setPadding(0, 0, 0, 0);
              ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).setMargins(0, 0, 0, 0);
            }
            if ((paramChatMessage instanceof MessageForTroopTopic))
            {
              paramInt1 = AIOUtils.a(11.0F, jdField_a_of_type_AndroidContentContext.getResources());
              paramInt2 = AIOUtils.a(7.5F, localContext.getResources());
              paramViewGroup.setPadding(0, 0, 0, 0);
              jdField_a_of_type_AndroidViewView.setPadding(0, 0, 0, 0);
              ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).setMargins(paramInt1, paramInt2, paramInt1, paramInt2);
            }
            paramViewGroup.requestLayout();
            return paramViewGroup;
            paramView = (BaseBubbleBuilder.ViewHolder)paramViewGroup.getTag();
          }
        }
        catch (Exception paramView)
        {
          for (;;)
          {
            paramView = "";
            continue;
            j = 0;
            continue;
            label1075:
            f(paramChatMessage, paramViewGroup);
            continue;
            label1085:
            if (paramInt1 == paramInt2 - 1) {
              paramViewGroup.setPadding(0, j, 0, 1);
            }
          }
        }
      }
    }
  }
  
  protected abstract View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener);
  
  protected abstract BaseBubbleBuilder.ViewHolder a();
  
  protected abstract String a(ChatMessage paramChatMessage);
  
  public void a()
  {
    jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    }
    do
    {
      do
      {
        do
        {
          return;
        } while ((c()) || (!(jdField_a_of_type_AndroidContentContext instanceof FragmentActivity)));
        ((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a().g(paramChatMessage);
        return;
      } while ((istroop != 1) || ((!(paramChatMessage instanceof MessageForLongMsg)) && (!(paramChatMessage instanceof MessageForText)) && (!(paramChatMessage instanceof MessageForReplyText))));
      if (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
      {
        DialogUtil.a(jdField_a_of_type_AndroidContentContext, 232, null, jdField_a_of_type_AndroidContentContext.getString(2131365102), null, jdField_a_of_type_AndroidContentContext.getString(2131364502), new kps(this), null).show();
        return;
      }
      paramContext = (TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97);
    } while ((paramContext == null) || (!(jdField_a_of_type_AndroidContentContext instanceof FragmentActivity)));
    TroopBarUtils.a.clear();
    paramContext.a(((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramChatMessage, null);
    paramContext = "";
    if (msgtype == 64536) {
      paramContext = "1";
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "dc00899", "Grp_talk", "", "pub_talk", "Clk_bubble", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramContext, "", "");
      return;
      if (msgtype == 63536) {
        paramContext = "2";
      }
    }
  }
  
  public void a(View paramView) {}
  
  public void a(View paramView, ChatMessage paramChatMessage)
  {
    int j = BaseChatItemLayout.k;
    int i = j;
    if (StructMsgItemLayout12.a(paramChatMessage)) {
      i = j - AIOUtils.a(10.0F, paramView.getResources());
    }
    if (paramChatMessage.isSend())
    {
      paramView.setPadding(BaseChatItemLayout.n, i, BaseChatItemLayout.m, BaseChatItemLayout.l);
      return;
    }
    paramView.setPadding(BaseChatItemLayout.m, i, BaseChatItemLayout.n, BaseChatItemLayout.l);
  }
  
  public void a(View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner == null) {
      return;
    }
    int j = 0;
    int k = 0;
    Object localObject3 = null;
    Object localObject4 = null;
    Object localObject1;
    label39:
    Object localObject2;
    int i;
    if (com.tencent.mobileqq.text.TextUtils.a(msg))
    {
      localObject1 = com.tencent.mobileqq.text.TextUtils.a(msg);
      localObject2 = localObject4;
      i = j;
      if ((paramChatMessage instanceof MessageForText))
      {
        localObject5 = paramBubbleInfo.a((String)localObject1);
        localObject2 = localObject4;
        localObject3 = localObject5;
        i = j;
        if (localObject5 != null)
        {
          localObject4 = paramBubbleInfo.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1);
          localObject2 = localObject4;
          localObject3 = localObject5;
          i = j;
          if (localObject4 != null)
          {
            localObject2 = localObject4;
            localObject3 = localObject5;
            i = j;
            if (first != null)
            {
              i = 1;
              localObject3 = localObject5;
              localObject2 = localObject4;
            }
          }
        }
      }
      j = k;
      if (!android.text.TextUtils.isEmpty((CharSequence)localObject1))
      {
        j = k;
        if ((paramChatMessage instanceof MessageForText))
        {
          j = k;
          if (VersionUtils.e())
          {
            localObject1 = paramBubbleInfo.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 3);
            j = k;
            if (localObject1 != null)
            {
              j = k;
              if (first != null)
              {
                j = k;
                if (paramView.getWidth() > first).a.s) {
                  j = 1;
                }
              }
            }
          }
        }
      }
      localObject1 = (BubbleManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(43);
      if ((localObject1 == null) || (!(paramChatMessage instanceof MessageForText))) {
        break label665;
      }
      localObject4 = ((BubbleManager)localObject1).a(jdField_c_of_type_Int, false);
      if ((localObject4 == null) || (d == null) || (d.t == 0) || (!VersionUtils.e())) {
        break label665;
      }
      if (!paramChatMessage.isSend()) {
        break label611;
      }
      localObject1 = selfuin;
      label312:
      Object localObject5 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if (localObject5 == null) {
        break label665;
      }
      localObject1 = ((FriendsManager)localObject5).a((String)localObject1);
      if ((localObject1 == null) || ((d.t != -1) && (pendantId != d.t))) {
        break label665;
      }
    }
    label611:
    label659:
    label665:
    for (k = 1;; k = 0)
    {
      if ((i != 0) || (j != 0) || (k != 0)) {
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0);
      }
      if (i != 0)
      {
        a("keyword_trigger", jdField_c_of_type_Int, localObject3);
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0, 100, new Object[] { Integer.valueOf(1), Long.valueOf(uniseq), localObject2 });
      }
      if ((j != 0) || (k != 0)) {
        if (j == 0) {
          break label659;
        }
      }
      for (i = 3;; i = 5)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0, 100, new Object[] { Integer.valueOf(i), Long.valueOf(uniseq), Integer.valueOf(jdField_c_of_type_Int), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface });
        if (!paramBubbleInfo.a(paramView.getHeight())) {
          break;
        }
        paramView = paramBubbleInfo.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2);
        if ((paramView == null) || (first == null)) {
          break;
        }
        a("wordnum_trigger", jdField_c_of_type_Int, null);
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0, 100, new Object[] { Integer.valueOf(2), Long.valueOf(uniseq), paramView });
        return;
        localObject1 = msg;
        break label39;
        if ((istroop == 1000) || (istroop == 1020) || (istroop == 1004))
        {
          localObject1 = frienduin;
          break label312;
        }
        localObject1 = senderuin;
        break label312;
      }
    }
  }
  
  protected void a(View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner == null) {}
    do
    {
      return;
      paramView = paramBubbleInfo.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
    } while ((paramView == null) || (first == null));
    b();
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0, 100, new Object[] { Integer.valueOf(0), Long.valueOf(uniseq), paramView });
  }
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo) {}
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, ChatMessage paramChatMessage) {}
  
  public void a(ChatMessage paramChatMessage)
  {
    int i;
    if ((jdField_a_of_type_AndroidContentContext instanceof FragmentActivity))
    {
      ChatFragment localChatFragment = ((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment();
      BaseChatPie localBaseChatPie = null;
      if (localChatFragment != null) {
        localBaseChatPie = localChatFragment.a();
      }
      if (localBaseChatPie != null) {
        localBaseChatPie.c(paramChatMessage);
      }
      if (!(paramChatMessage instanceof MessageForFile)) {
        break label108;
      }
      i = 6;
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80056B1", "0X80056B1", 0, 0, "" + i, "", "", "");
      return;
      label108:
      if ((paramChatMessage instanceof MessageForText)) {
        i = 1;
      } else if ((paramChatMessage instanceof MessageForPic)) {
        i = 3;
      } else if ((paramChatMessage instanceof MessageForMarketFace)) {
        i = 4;
      } else {
        i = 0;
      }
    }
  }
  
  protected void a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    if (a(paramChatMessage, paramBaseChatItemLayout))
    {
      paramBaseChatItemLayout.setFailedIconVisable(true, this);
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        paramBaseChatItemLayout.setFailedIconResource(2130838116, this);
      }
      return;
    }
    paramBaseChatItemLayout.setFailedIconVisable(false, null);
  }
  
  protected void a(ChatMessage paramChatMessage, QQCustomMenu paramQQCustomMenu)
  {
    if ((paramChatMessage != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (!senderuin.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f())) && (paramChatMessage.isSupportReply()))
    {
      paramQQCustomMenu.a(2131304482, jdField_a_of_type_AndroidContentContext.getString(2131365104));
      MessageForReplyText.reportReplyMsg(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "Msg_menu", "exp_replyMsg", frienduin, paramChatMessage);
    }
  }
  
  protected void a(QQCustomMenu paramQQCustomMenu, int paramInt, MessageRecord paramMessageRecord)
  {
    if (AnonymousChatHelper.a(paramMessageRecord)) {}
    label7:
    boolean bool;
    do
    {
      do
      {
        Object localObject;
        do
        {
          do
          {
            break label7;
            break label7;
            do
            {
              return;
            } while (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 9);
            localObject = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
          } while ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0) && (!((FriendsManager)localObject).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)));
          if (paramInt != 1) {
            break;
          }
          localObject = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
        } while ((localObject != null) && (((HotChatManager)localObject).b(frienduin)));
        paramInt = istroop;
      } while ((paramInt != 0) && (paramInt != 1) && (paramInt != 3000) && (paramInt != 1000) && (paramInt != 1004));
      bool = BaseApplication.getContext().getSharedPreferences("mobileQQ", 0).getBoolean("msgrevoke_flag" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), false);
      if (QLog.isColorLevel()) {
        QLog.i("msgrevoke", 2, "menuitem msgRevokeFlag=" + bool);
      }
    } while (!bool);
    paramQQCustomMenu.a(2131296347, jdField_a_of_type_AndroidContentContext.getString(2131367751));
  }
  
  public boolean a()
  {
    return BaseChatItemLayout.b;
  }
  
  public boolean a(ChatMessage paramChatMessage)
  {
    return (senderuin != null) && (senderuin.equals(selfuin));
  }
  
  public boolean a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    return (extraflag == 32768) && (paramChatMessage.isSendFromLocal());
  }
  
  protected void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0);
    }
  }
  
  public void b(View paramView)
  {
    ChatMessage localChatMessage = AIOUtils.a(paramView);
    if (localChatMessage == null) {}
    label174:
    do
    {
      do
      {
        for (;;)
        {
          return;
          localObject1 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
          if ((issend == 1) || (issend == 2)) {}
          for (i = 1; !"10000".equals(senderuin); i = 0)
          {
            localObject2 = TroopBusinessUtil.a(localChatMessage);
            if (localObject2 == null) {
              break label174;
            }
            if (!android.text.TextUtils.isEmpty(jdField_b_of_type_JavaLangString))
            {
              paramView = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
              paramView.putExtra("url", jdField_b_of_type_JavaLangString);
              PublicAccountUtil.a(paramView, jdField_b_of_type_JavaLangString);
              jdField_a_of_type_AndroidContentContext.startActivity(paramView);
            }
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "five_m", "clk_head", 0, 0, frienduin, "", jdField_c_of_type_JavaLangString, "");
            return;
          }
        }
        if (msgtype == 62530)
        {
          localObject1 = (MessageForPubAccount)localChatMessage;
          localObject2 = new Intent(paramView.getContext(), AccountDetailActivity.class);
          ((Intent)localObject2).putExtra("uin", associatePubAccUin + "");
          ((Intent)localObject2).putExtra("account_type", 1);
          paramView.getContext().startActivity((Intent)localObject2);
          return;
        }
      } while ((i == 0) && (istroop == 7100));
      if (!AnonymousChatHelper.a(localChatMessage)) {
        break label900;
      }
      localObject1 = AnonymousChatHelper.a(localChatMessage);
      if ((paramView != null) && ((jdField_a_of_type_JavaLangString != null) || (jdField_a_of_type_Int == 2))) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.i(jdField_a_of_type_JavaLangString, 2, "onHeadIconClick : an_id is null");
    return;
    Object localObject2 = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).b(frienduin);
    Object localObject3 = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
    if (localObject2 != null) {
      ((TroopHandler)localObject3).a(troopuin, (byte)0, dwTimeStamp, 0);
    }
    int j = 0;
    localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    int i = j;
    if (localObject2 != null)
    {
      i = j;
      if (!android.text.TextUtils.isEmpty((CharSequence)localObject3))
      {
        if ((Administrator == null) || (!Administrator.contains((CharSequence)localObject3))) {
          break label711;
        }
        i = 3;
      }
    }
    localObject2 = ((AnonymousChatHelper.AnonymousExtInfo)localObject1).a();
    if ((localObject2 != null) && (jdField_a_of_type_Int != 2))
    {
      localObject2 = URLEncoder.encode(Base64.encodeToString((byte[])localObject2, 2));
      localObject3 = new Intent(paramView.getContext(), QQBrowserActivity.class);
      localStringBuilder = new StringBuilder().append("http://qqweb.qq.com/m/business/anonymoustalk/index.html?_wv=5123&_bid=227&id=").append((String)localObject2).append("&gcode=").append(frienduin).append("&avatar=").append(AnonymousChatHelper.a(jdField_b_of_type_Int)).append("&nick=");
      if (android.text.TextUtils.isEmpty(jdField_b_of_type_JavaLangString))
      {
        localObject1 = "";
        ((Intent)localObject3).putExtra("url", (String)localObject1 + "&role=" + String.valueOf(i) + "&self=0");
        ((Activity)paramView.getContext()).startActivity((Intent)localObject3);
        if (msgData != null)
        {
          AnonymousChatHelper.a().a(frienduin, (String)localObject2, localChatMessage);
          if (QLog.isDevelopLevel()) {
            QLog.i(jdField_a_of_type_JavaLangString, 4, "report:" + msgData.toString());
          }
        }
      }
    }
    label711:
    while (jdField_a_of_type_Int != 2) {
      for (;;)
      {
        StringBuilder localStringBuilder;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_anon", "", "aio", "Clk_head", 0, 0, frienduin, "", "", "");
        return;
        if (((String)localObject3).equals(troopowneruin))
        {
          i = 2;
          break;
        }
        i = 1;
        break;
        localObject1 = URLEncoder.encode(jdField_b_of_type_JavaLangString);
      }
    }
    localObject2 = new Intent(paramView.getContext(), QQBrowserActivity.class);
    localObject3 = new StringBuilder().append("http://qqweb.qq.com/m/business/anonymoustalk/index.html?_wv=5123&_bid=227&gcode=").append(frienduin).append("&avatar=").append(AnonymousChatHelper.a(jdField_b_of_type_Int)).append("&nick=");
    if (android.text.TextUtils.isEmpty(jdField_b_of_type_JavaLangString)) {}
    for (Object localObject1 = "";; localObject1 = URLEncoder.encode(jdField_b_of_type_JavaLangString))
    {
      ((Intent)localObject2).putExtra("url", (String)localObject1 + "&role=" + String.valueOf(i) + "&self=1");
      ((Activity)paramView.getContext()).startActivity((Intent)localObject2);
      break;
    }
    label900:
    if ("1000000".equals(senderuin))
    {
      TroopUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)paramView.getContext(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "1");
      return;
    }
    localObject3 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    localObject2 = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
    if ((localObject2 != null) && (((HotChatManager)localObject2).b(frienduin))) {}
    for (j = 1; (j == 0) && (istroop == 1); j = 0)
    {
      localObject1 = new Intent(paramView.getContext(), TroopMemberCardActivity.class);
      ((Intent)localObject1).putExtra("troopUin", frienduin);
      ((Intent)localObject1).putExtra("memberUin", senderuin);
      ((Intent)localObject1).putExtra("fromFlag", 0);
      ((Activity)paramView.getContext()).startActivityForResult((Intent)localObject1, 2000);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_mber", "", "mber_card", "Clk_head", 0, 0, frienduin, senderuin, "", "");
      return;
    }
    if ((j != 0) && ((i != 0) || ((localObject3 != null) && (!((FriendsManager)localObject3).b(senderuin)))))
    {
      localObject1 = null;
      paramView = (View)localObject1;
      if (localObject2 != null)
      {
        localObject2 = ((HotChatManager)localObject2).a(frienduin);
        paramView = (View)localObject1;
        if (localObject2 != null) {
          paramView = troopCode;
        }
      }
      ProfilePerformanceReport.b();
      localObject1 = new ProfileActivity.AllInOne(senderuin, 42);
      jdField_c_of_type_JavaLangString = paramView;
      jdField_d_of_type_JavaLangString = frienduin;
      g = 31;
      paramView = new Intent(jdField_a_of_type_AndroidContentContext, NearbyPeopleProfileActivity.class);
      paramView.putExtra("AllInOne", (Parcelable)localObject1);
      if (i != 0) {}
      for (i = 2;; i = 3)
      {
        paramView.putExtra("param_mode", i);
        jdField_a_of_type_AndroidContentContext.startActivity(paramView);
        return;
      }
    }
    boolean bool;
    if ((istroop != 1000) && (istroop != 1020) && (istroop != 1004))
    {
      bool = ((FriendsManager)localObject1).b(senderuin);
      localObject2 = senderuin;
      label1326:
      if (localObject2 == null) {
        break label1573;
      }
      if (!((FriendsManager)localObject1).b((String)localObject2)) {
        break label2754;
      }
      bool = true;
    }
    label1377:
    label1452:
    label1504:
    label1573:
    label2651:
    label2711:
    label2732:
    label2744:
    label2754:
    for (;;)
    {
      if (i != 0)
      {
        localObject1 = new ProfileActivity.AllInOne(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
        h = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b();
        if (((String)localObject2).equals(h)) {
          h = null;
        }
        jdField_f_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
        jdField_e_of_type_Int = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
        if ((istroop != 1000) && (istroop != 1020)) {
          break label2651;
        }
        jdField_d_of_type_JavaLangString = senderuin;
        jdField_f_of_type_Int = 2;
        g = 1;
        if ((istroop != 1001) && (istroop != 1010)) {
          break label2744;
        }
        if (istroop != 1001) {
          break label2711;
        }
        g = 10;
        paramView = new Intent(jdField_a_of_type_AndroidContentContext, NearbyPeopleProfileActivity.class);
        paramView.putExtra("AllInOne", (Parcelable)localObject1);
        if (!Utils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), localObject2)) {
          break label2732;
        }
        paramView.putExtra("param_mode", 2);
      }
      for (;;)
      {
        jdField_a_of_type_AndroidContentContext.startActivity(paramView);
        return;
        localObject2 = frienduin;
        bool = false;
        break label1326;
        break;
        if (istroop == 1008)
        {
          localObject1 = new Intent();
          ((Intent)localObject1).putExtra("need_finish", true);
          ((Intent)localObject1).putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          ((Intent)localObject1).putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
          ((Intent)localObject1).putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          PublicAccountUtil.a((Intent)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)paramView.getContext(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, -1, 2000, 2);
          return;
        }
        if (istroop == 1024)
        {
          localObject1 = new Intent(paramView.getContext(), AccountDetailActivity.class);
          ((Intent)localObject1).putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          ((Intent)localObject1).putExtra("account_type", 2);
          ((Intent)localObject1).putExtra("need_finish", true);
          ((Intent)localObject1).putExtra("uintype", 1024);
          ((Activity)paramView.getContext()).startActivityForResult((Intent)localObject1, 2000);
          return;
        }
        if (bool)
        {
          if (istroop == 1) {}
          for (localObject1 = new ProfileActivity.AllInOne((String)localObject2, 20);; localObject1 = new ProfileActivity.AllInOne((String)localObject2, 1))
          {
            h = ContactUtils.j(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject2);
            break;
          }
        }
        if (istroop == 1010)
        {
          localObject1 = new ProfileActivity.AllInOne((String)localObject2, 76);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1001)
        {
          localObject1 = new ProfileActivity.AllInOne((String)localObject2, 42);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0)
        {
          localObject1 = new ProfileActivity.AllInOne((String)localObject2, 70);
          h = ContactUtils.j(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject2);
          break label1377;
        }
        if (istroop == 1000)
        {
          localObject1 = new ProfileActivity.AllInOne(frienduin, 22);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1020)
        {
          localObject1 = new ProfileActivity.AllInOne(frienduin, 58);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1)
        {
          localObject1 = new ProfileActivity.AllInOne(senderuin, 21);
          h = ContactUtils.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString, senderuin);
          break label1377;
        }
        if (3000 == istroop)
        {
          localObject1 = new ProfileActivity.AllInOne(senderuin, 46);
          h = ContactUtils.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin, senderuin);
          break label1377;
        }
        if (istroop == 1001)
        {
          localObject1 = new ProfileActivity.AllInOne(senderuin, 42);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1004)
        {
          localObject1 = new ProfileActivity.AllInOne(frienduin, 47);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          jdField_e_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1005)
        {
          localObject1 = new ProfileActivity.AllInOne(senderuin, 2);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1023)
        {
          localObject1 = new ProfileActivity.AllInOne(senderuin, 74);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1009)
        {
          localObject1 = new ProfileActivity.AllInOne(senderuin, 57);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1006)
        {
          localObject1 = new ProfileActivity.AllInOne(frienduin, 34);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1009)
        {
          localObject1 = new ProfileActivity.AllInOne(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 57);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1021)
        {
          localObject1 = new ProfileActivity.AllInOne(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 72);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1022)
        {
          localObject1 = new ProfileActivity.AllInOne(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 27);
          h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
          break label1377;
        }
        if (istroop == 1025)
        {
          if (jdField_a_of_type_AndroidContentContext == null) {
            break;
          }
          paramView = new Intent(jdField_a_of_type_AndroidContentContext, ChatSettingActivity.class);
          paramView.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          paramView.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
          paramView.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          jdField_a_of_type_AndroidContentContext.startActivity(paramView);
          return;
        }
        localObject1 = new ProfileActivity.AllInOne(senderuin, 19);
        h = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
        break label1377;
        if (istroop == 1)
        {
          jdField_d_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString;
          jdField_c_of_type_JavaLangString = frienduin;
          break label1452;
        }
        if (3000 != istroop) {
          break label1452;
        }
        jdField_e_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
        break label1452;
        if (istroop != 1010) {
          break label1504;
        }
        g = 11;
        break label1504;
        paramView.putExtra("param_mode", 3);
      }
      ProfileActivity.b(paramView.getContext(), (ProfileActivity.AllInOne)localObject1);
      return;
    }
  }
  
  public void b(ChatMessage paramChatMessage)
  {
    FragmentActivity localFragmentActivity = (FragmentActivity)jdField_a_of_type_AndroidContentContext;
    Object localObject;
    if ((localFragmentActivity == null) || (localFragmentActivity.getChatFragment() == null))
    {
      localObject = new StringBuilder().append("onClickSelectMore Error:");
      if (localFragmentActivity != null)
      {
        paramChatMessage = localFragmentActivity.toString();
        QLog.e("BaseBubbleBuilder", 1, paramChatMessage);
      }
    }
    do
    {
      return;
      paramChatMessage = "ca is null ";
      break;
      localObject = localFragmentActivity.getChatFragment().a();
      ((BaseChatPie)localObject).e(paramChatMessage);
      ((BaseChatPie)localObject).e(true);
    } while (paramChatMessage == null);
    int j;
    int i;
    if (istroop == 0)
    {
      j = 1;
      if (!(paramChatMessage instanceof MessageForFile)) {
        break label257;
      }
      i = 6;
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80059B5", "0X80059B5", 0, 0, "" + i, "", "", "");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800465F", "0X800465F", 0, 0, "" + j, "", "", "");
      return;
      if (istroop == 3000)
      {
        j = 2;
        break;
      }
      if (istroop == 1)
      {
        j = 3;
        break;
      }
      j = 4;
      break;
      label257:
      if ((paramChatMessage instanceof MessageForText)) {
        i = 1;
      } else if ((paramChatMessage instanceof MessageForPic)) {
        i = 3;
      } else if ((paramChatMessage instanceof MessageForMarketFace)) {
        i = 4;
      } else {
        i = 0;
      }
    }
  }
  
  public void b(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    paramBaseChatItemLayout.setProgressVisable(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramChatMessage));
  }
  
  public void b(ChatMessage paramChatMessage, QQCustomMenu paramQQCustomMenu)
  {
    if ((paramChatMessage != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1))
    {
      paramChatMessage = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((paramChatMessage != null) && (paramChatMessage.hasOrgs())) {
        paramQQCustomMenu.a(2131304480, jdField_a_of_type_AndroidContentContext.getString(2131365162));
      }
    }
  }
  
  public void b(QQCustomMenu paramQQCustomMenu, Context paramContext)
  {
    if ((b()) && (MultiMsgManager.a().a())) {
      paramQQCustomMenu.a(2131304473, paramContext.getString(2131367758));
    }
  }
  
  protected boolean b()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000))
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
      {
        HotChatManager localHotChatManager = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
        if ((localHotChatManager != null) && (localHotChatManager.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }
  
  public void c() {}
  
  protected void c(View paramView)
  {
    ChatMessage localChatMessage = AIOUtils.a(paramView);
    if ((localChatMessage != null) && (istroop == 1) && (Utils.c(senderuin)))
    {
      localObject = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
      if (localObject == null) {
        break label97;
      }
      localObject = ((HotChatManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (localObject == null) {
        break label102;
      }
      NearbyFlowerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, senderuin, paramView.getContext(), 2, frienduin);
      NearbyFlowerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X800638A");
    }
    label97:
    label102:
    do
    {
      return;
      localObject = null;
      break;
      TroopInfo localTroopInfo = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((localTroopInfo != null) && (TroopInfo.hasPayPrivilege(troopPrivilegeFlag, 32)))
      {
        int i;
        if (localTroopInfo.isTroopOwner(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {
          i = 0;
        }
        for (;;)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "Clk_name", 0, 0, troopuin + "", i + "", "", "");
          localObject = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, senderuin, troopuin, 1, 0);
          TroopBusinessUtil.TroopBusinessMessage localTroopBusinessMessage = TroopBusinessUtil.a(localChatMessage);
          if (localTroopBusinessMessage != null)
          {
            localObject = jdField_c_of_type_JavaLangString;
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "five_m", "clk_name", 0, 0, frienduin, "", (String)localObject, "");
          }
          TroopGiftUtil.a((Activity)paramView.getContext(), troopuin, senderuin, (String)localObject, "aio", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          return;
          if (localTroopInfo.isAdmin()) {
            i = 1;
          } else {
            i = 2;
          }
        }
      }
    } while (!d);
    Object localObject = new Intent(paramView.getContext(), QQBrowserActivity.class);
    ((Intent)localObject).putExtra("url", "http://qinfo.clt.qq.com/qlevel/faq.html?_bid=125#gc=" + frienduin + "&target=" + senderuin);
    ((Intent)localObject).putExtra("hide_operation_bar", true);
    ((Intent)localObject).putExtra("hide_more_button", true);
    paramView.getContext().startActivity((Intent)localObject);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_rank", "", "AIOchat", "Clk_level", 0, 0, frienduin, "", "", "");
  }
  
  protected boolean c()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(47)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true).jdField_a_of_type_Boolean))
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 2131364574, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      return true;
    }
    return false;
  }
  
  public void onClick(View paramView)
  {
    if (a()) {}
    while ((jdField_a_of_type_AndroidContentContext instanceof MultiForwardActivity)) {
      return;
    }
    AIOUtils.l = true;
    switch (paramView.getId())
    {
    case 2131296318: 
    case 2131296321: 
    case 2131296323: 
    default: 
      return;
    case 2131296317: 
      b(paramView);
      return;
    case 2131296324: 
      a(paramView);
      return;
    }
    c(paramView);
  }
}
