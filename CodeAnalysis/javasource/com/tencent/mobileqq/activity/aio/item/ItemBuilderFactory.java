package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.text.TextUtils;
import android.widget.BaseAdapter;
import com.tencent.bitapp.BitAppMsgItemBuilder;
import com.tencent.bitapp.MessageForBitApp;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.device.msg.activities.DevLittleVideoItemBuilder;
import com.tencent.device.msg.activities.DevShortVideoItemBuilder;
import com.tencent.device.msg.activities.DevicePttItemBuilder;
import com.tencent.device.msg.data.MessageForDevLittleVideo;
import com.tencent.device.msg.data.MessageForDevPtt;
import com.tencent.device.msg.data.MessageForDevShortVideo;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForActivity;
import com.tencent.mobileqq.data.MessageForApollo;
import com.tencent.mobileqq.data.MessageForApproval;
import com.tencent.mobileqq.data.MessageForArkApp;
import com.tencent.mobileqq.data.MessageForColorRing;
import com.tencent.mobileqq.data.MessageForDeliverGiftTips;
import com.tencent.mobileqq.data.MessageForDeviceFile;
import com.tencent.mobileqq.data.MessageForDeviceSingleStruct;
import com.tencent.mobileqq.data.MessageForDeviceText;
import com.tencent.mobileqq.data.MessageForDingdongSchedule;
import com.tencent.mobileqq.data.MessageForEnterTroop;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.data.MessageForFunnyFace;
import com.tencent.mobileqq.data.MessageForGrayTips;
import com.tencent.mobileqq.data.MessageForIncompatibleGrayTips;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForMarketFace;
import com.tencent.mobileqq.data.MessageForMixedMsg;
import com.tencent.mobileqq.data.MessageForMyEnterTroop;
import com.tencent.mobileqq.data.MessageForNearbyMarketGrayTips;
import com.tencent.mobileqq.data.MessageForNewGrayTips;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.MessageForQQWalletTips;
import com.tencent.mobileqq.data.MessageForQzoneFeed;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForRichState;
import com.tencent.mobileqq.data.MessageForSafeGrayTips;
import com.tencent.mobileqq.data.MessageForShakeWindow;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageForTroopFee;
import com.tencent.mobileqq.data.MessageForTroopFile;
import com.tencent.mobileqq.data.MessageForTroopGift;
import com.tencent.mobileqq.data.MessageForTroopNotification;
import com.tencent.mobileqq.data.MessageForTroopTopic;
import com.tencent.mobileqq.data.MessageForTroopUnreadTips;
import com.tencent.mobileqq.data.MessageForVideo;
import com.tencent.mobileqq.data.MessageForVideoVip;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.ShareHotChatGrayTips;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.StatusManager;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class ItemBuilderFactory
{
  private static final int A = 25;
  private static final int B = 26;
  private static final int C = 27;
  private static final int D = 28;
  private static final int E = 29;
  private static final int F = 30;
  private static final int G = 31;
  private static final int H = 32;
  private static final int I = 33;
  private static final int J = 34;
  private static final int K = 35;
  private static final int L = 36;
  private static final int M = 37;
  private static final int N = 38;
  private static final int O = 39;
  private static final int P = 40;
  private static final int Q = 41;
  private static final int R = 42;
  private static final int S = 43;
  private static final int T = 44;
  private static final int U = 45;
  private static final int V = 46;
  private static final int W = 47;
  private static final int X = 48;
  private static final int Y = 49;
  private static final int Z = 50;
  public static final int a = 56;
  private static final int aa = 51;
  private static final int ab = 100;
  private static final int ac = 52;
  private static final int ad = 53;
  private static final int ae = 54;
  private static final int af = 55;
  private static final int ag = 55;
  public static final int b = 43;
  private static final int c = 0;
  private static final int d = 1;
  private static final int e = 2;
  private static final int f = 3;
  private static final int g = 4;
  private static final int h = 5;
  private static final int i = 6;
  private static final int j = 7;
  private static final int k = 8;
  private static final int l = 9;
  private static final int m = 10;
  private static final int n = 11;
  private static final int o = 12;
  private static final int p = 13;
  private static final int q = 15;
  private static final int r = 16;
  private static final int s = 17;
  private static final int t = 18;
  private static final int u = 19;
  private static final int v = 20;
  private static final int w = 21;
  private static final int x = 22;
  private static final int y = 23;
  private static final int z = 24;
  private Context jdField_a_of_type_AndroidContentContext;
  BitAppMsgItemBuilder jdField_a_of_type_ComTencentBitappBitAppMsgItemBuilder;
  DevLittleVideoItemBuilder jdField_a_of_type_ComTencentDeviceMsgActivitiesDevLittleVideoItemBuilder;
  DevShortVideoItemBuilder jdField_a_of_type_ComTencentDeviceMsgActivitiesDevShortVideoItemBuilder;
  DevicePttItemBuilder jdField_a_of_type_ComTencentDeviceMsgActivitiesDevicePttItemBuilder;
  private BaseChatPie jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private AIOAnimationConatiner jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner;
  ActivityChatItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemActivityChatItemBuilder;
  ApolloItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemApolloItemBuilder;
  AppSharePicItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemAppSharePicItemBuilder;
  ApprovalMsgBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemApprovalMsgBuilder;
  ArkAppItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemArkAppItemBuilder;
  DeviceFileItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceFileItemBuilder;
  DevicePicItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemDevicePicItemBuilder;
  DeviceSingleStructBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceSingleStructBuilder;
  DeviceTextItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceTextItemBuilder;
  DingdongScheduleItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemDingdongScheduleItemBuilder;
  EnterTroopChatItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemEnterTroopChatItemBuilder;
  FileItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder;
  FlashPicItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemFlashPicItemBuilder;
  GrayTipsItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder;
  LocationItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder;
  LongMsgItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemLongMsgItemBuilder;
  MarketFaceItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder;
  MixedMsgItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemMixedMsgItemBuilder;
  MyEnterTroopChatItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemMyEnterTroopChatItemBuilder;
  PAMultiItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemPAMultiItemBuilder;
  PASingleItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemPASingleItemBuilder;
  PATextItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemPATextItemBuilder;
  PAWeatherItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder;
  PicItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder;
  PttItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder;
  QQWalletMsgItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder;
  QzoneFeedItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder;
  ReplyTextItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemReplyTextItemBuilder;
  RichStatItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder;
  ShakeItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemShakeItemBuilder;
  ShortVideoItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder;
  ShortVideoPTVItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder;
  ShortVideoRealItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoRealItemBuilder;
  StructTroopNotificationItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemStructTroopNotificationItemBuilder;
  StructingMsgItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder;
  SubscriptGrayTipsItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptGrayTipsItemBuilder;
  SubscriptLongMsgItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptLongMsgItemBuilder;
  SubscriptMarketFaceItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptMarketFaceItemBuilder;
  SubscriptPicItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptPicItemBuilder;
  SubscriptTextItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptTextItemBuilder;
  TextItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemTextItemBuilder;
  TextTranslationItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder;
  ThumbItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemThumbItemBuilder;
  TroopFeeMsgItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFeeMsgItemBuilder;
  TroopFileItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder;
  TroopGiftMsgItemBuilder.TroopGiftMsgItemRecieverBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemRecieverBuilder;
  TroopGiftMsgItemBuilder.TroopGiftMsgItemSenderBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemSenderBuilder;
  TroopUnreadTipsChatItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopUnreadTipsChatItemBuilder;
  VideoItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder;
  VideoVipItemBuilder jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  
  public ItemBuilderFactory(Context paramContext, QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner, BaseChatPie paramBaseChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner = paramAIOAnimationConatiner;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    int i2 = 15;
    int i1;
    if ((paramChatMessage instanceof MessageForText)) {
      if (locationUrl != null) {
        i1 = 10;
      }
    }
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    return i1;
                    if ((vipBubbleID != 100000L) || (paramChatMessage.isSend())) {
                      break;
                    }
                    return 9;
                    if ((paramChatMessage instanceof MessageForTroopGift))
                    {
                      if (senderuin.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {
                        return 48;
                      }
                      return 49;
                    }
                    i1 = i2;
                  } while ((paramChatMessage instanceof MessageForGrayTips));
                  i1 = i2;
                } while ((paramChatMessage instanceof MessageForNewGrayTips));
                i1 = i2;
              } while ((paramChatMessage instanceof MessageForSafeGrayTips));
              i1 = i2;
            } while ((paramChatMessage instanceof MessageForIncompatibleGrayTips));
            i1 = i2;
          } while ((paramChatMessage instanceof MessageForNearbyMarketGrayTips));
          if ((paramChatMessage instanceof MessageForPic))
          {
            if (isMixed) {
              return 24;
            }
            if (HotChatHelper.a(paramChatMessage)) {
              return 42;
            }
            return 1;
          }
          if ((paramChatMessage instanceof MessageForDevPtt)) {
            return 33;
          }
          if ((paramChatMessage instanceof MessageForPtt)) {
            return 2;
          }
          if ((paramChatMessage instanceof MessageForFile)) {
            return 3;
          }
          if ((paramChatMessage instanceof MessageForVideo)) {
            return 11;
          }
          if ((paramChatMessage instanceof MessageForMarketFace)) {
            return 12;
          }
          if ((paramChatMessage instanceof MessageForRichState)) {
            return 13;
          }
          if ((paramChatMessage instanceof MessageForPubAccount))
          {
            paramChatMessage = mPAMessage;
            if ((paramChatMessage != null) && (items != null) && (items.size() != 0))
            {
              PAMessage.Item localItem = (PAMessage.Item)items.get(0);
              if (cover != null)
              {
                if (!TextUtils.isEmpty(weaArea)) {
                  return 43;
                }
                if (items.size() == 1) {
                  return 6;
                }
                if (items.size() < 2) {
                  break;
                }
                return 7;
              }
              return 8;
            }
            return 0;
          }
          if ((paramChatMessage instanceof MessageForTroopNotification)) {
            return 28;
          }
          if ((paramChatMessage instanceof MessageForTroopTopic)) {
            return 52;
          }
          if ((paramChatMessage instanceof MessageForStructing)) {
            return 5;
          }
          if ((paramChatMessage instanceof MessageForBitApp)) {
            return 51;
          }
          if ((paramChatMessage instanceof MessageForFunnyFace)) {
            return 19;
          }
          if (((paramChatMessage instanceof MessageForLongMsg)) && (msgtype != 64500)) {
            return 17;
          }
          if (((paramChatMessage instanceof MessageForMixedMsg)) || ((paramChatMessage != null) && (msgtype == 64500))) {
            return 18;
          }
          if ((paramChatMessage instanceof MessageForQzoneFeed)) {
            return 21;
          }
          if ((paramChatMessage instanceof MessageForActivity)) {
            return 16;
          }
          if ((paramChatMessage instanceof MessageForEnterTroop)) {
            return 22;
          }
          if ((paramChatMessage instanceof MessageForMyEnterTroop)) {
            return 23;
          }
          if ((paramChatMessage instanceof MessageForTroopFile)) {
            return 25;
          }
          if ((paramChatMessage instanceof MessageForShakeWindow)) {
            return 26;
          }
          if ((paramChatMessage instanceof MessageForTroopUnreadTips)) {
            return 27;
          }
          if ((paramChatMessage instanceof MessageForDevShortVideo)) {
            return 35;
          }
          if ((paramChatMessage instanceof MessageForDevLittleVideo)) {
            return 45;
          }
          if ((paramChatMessage instanceof MessageForShortVideo))
          {
            switch (busiType)
            {
            default: 
              return 29;
            case 0: 
              return 29;
            case 1: 
              return 38;
            case 2: 
              return 46;
            case 1007: 
              return 40;
            }
            return 41;
          }
          if ((paramChatMessage instanceof MessageForColorRing)) {
            return 31;
          }
          if ((paramChatMessage instanceof MessageForQQWalletMsg)) {
            return 32;
          }
          if ((paramChatMessage instanceof MessageForTroopFee)) {
            return 44;
          }
          if ((paramChatMessage instanceof MessageForDeviceFile))
          {
            paramChatMessage = (MessageForDeviceFile)paramChatMessage;
            if (nFileMsgType == 2) {
              return 36;
            }
            if (nFileMsgType != 1) {
              break;
            }
            return 37;
          }
          if ((paramChatMessage instanceof MessageForDeviceSingleStruct)) {
            return 34;
          }
          i1 = i2;
        } while ((paramChatMessage instanceof MessageForQQWalletTips));
        if ((paramChatMessage instanceof MessageForDeviceText)) {
          return 39;
        }
        i1 = i2;
      } while ((paramChatMessage instanceof ShareHotChatGrayTips));
      i1 = i2;
    } while ((paramChatMessage instanceof MessageForDeliverGiftTips));
    if ((paramChatMessage instanceof MessageForArkApp)) {
      return 47;
    }
    if ((paramChatMessage instanceof MessageForApollo)) {
      return 55;
    }
    if ((paramChatMessage instanceof MessageForReplyText)) {
      return 50;
    }
    if ((paramChatMessage instanceof MessageForApproval)) {
      return 100;
    }
    if ((paramChatMessage instanceof MessageForDingdongSchedule)) {
      return 54;
    }
    if ((paramChatMessage instanceof MessageForVideoVip)) {
      return 53;
    }
    return 0;
  }
  
  public ChatItemBuilder a(ChatMessage paramChatMessage, BaseAdapter paramBaseAdapter)
  {
    switch (a(paramChatMessage))
    {
    case 4: 
    case 14: 
    case 19: 
    case 20: 
    case 30: 
    case 56: 
    case 57: 
    case 58: 
    case 59: 
    case 60: 
    case 61: 
    case 62: 
    case 63: 
    case 64: 
    case 65: 
    case 66: 
    case 67: 
    case 68: 
    case 69: 
    case 70: 
    case 71: 
    case 72: 
    case 73: 
    case 74: 
    case 75: 
    case 76: 
    case 77: 
    case 78: 
    case 79: 
    case 80: 
    case 81: 
    case 82: 
    case 83: 
    case 84: 
    case 85: 
    case 86: 
    case 87: 
    case 88: 
    case 89: 
    case 90: 
    case 91: 
    case 92: 
    case 93: 
    case 94: 
    case 95: 
    case 96: 
    case 97: 
    case 98: 
    case 99: 
    default: 
      if (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin))
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptTextItemBuilder == null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptTextItemBuilder = new SubscriptTextItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
        }
        return jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptTextItemBuilder;
      }
      break;
    case 3: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder = new FileItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemFileItemBuilder;
    case 1: 
      if ((msgtype == 63536) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin)))
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptPicItemBuilder == null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptPicItemBuilder = new SubscriptPicItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
        }
        return jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptPicItemBuilder;
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder = new PicItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemPicItemBuilder;
    case 24: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemAppSharePicItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemAppSharePicItemBuilder = new AppSharePicItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemAppSharePicItemBuilder;
    case 2: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder = new PttItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder;
    case 33: 
      if (jdField_a_of_type_ComTencentDeviceMsgActivitiesDevicePttItemBuilder == null) {
        jdField_a_of_type_ComTencentDeviceMsgActivitiesDevicePttItemBuilder = new DevicePttItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie);
      }
      if (QLog.isColorLevel()) {
        QLog.d("AutoMonitor", 2, "ItemBuilder is: DevicePttItemBuilder");
      }
      return jdField_a_of_type_ComTencentDeviceMsgActivitiesDevicePttItemBuilder;
    case 15: 
      if (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin))
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptGrayTipsItemBuilder == null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptGrayTipsItemBuilder = new SubscriptGrayTipsItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
        }
        return jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptGrayTipsItemBuilder;
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder = new GrayTipsItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder;
    case 6: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemPASingleItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemPASingleItemBuilder = new PASingleItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemPASingleItemBuilder;
    case 7: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemPAMultiItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemPAMultiItemBuilder = new PAMultiItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemPAMultiItemBuilder;
    case 8: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemPATextItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemPATextItemBuilder = new PATextItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemPATextItemBuilder;
    case 5: 
    case 52: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder = new StructingMsgItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder;
    case 51: 
      if (jdField_a_of_type_ComTencentBitappBitAppMsgItemBuilder == null) {
        jdField_a_of_type_ComTencentBitappBitAppMsgItemBuilder = new BitAppMsgItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie);
      }
      return jdField_a_of_type_ComTencentBitappBitAppMsgItemBuilder;
    case 10: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder = new LocationItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemLocationItemBuilder;
    case 11: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder = new VideoItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoItemBuilder;
    case 13: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder == null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder = new RichStatItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
        paramChatMessage = (StatusManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(14);
        if (paramChatMessage != null) {
          paramChatMessage.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder);
        }
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder;
    case 9: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder = new TextTranslationItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder;
    case 12: 
      if (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin))
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptMarketFaceItemBuilder == null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptMarketFaceItemBuilder = new SubscriptMarketFaceItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
        }
        return jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptMarketFaceItemBuilder;
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder = new MarketFaceItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemMarketFaceItemBuilder;
    case 16: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemActivityChatItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemActivityChatItemBuilder = new ActivityChatItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemActivityChatItemBuilder;
    case 22: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemEnterTroopChatItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemEnterTroopChatItemBuilder = new EnterTroopChatItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemEnterTroopChatItemBuilder;
    case 23: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemMyEnterTroopChatItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemMyEnterTroopChatItemBuilder = new MyEnterTroopChatItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemMyEnterTroopChatItemBuilder;
    case 17: 
      if (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin))
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptLongMsgItemBuilder == null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptLongMsgItemBuilder = new SubscriptLongMsgItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
        }
        return jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptLongMsgItemBuilder;
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemLongMsgItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemLongMsgItemBuilder = new LongMsgItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemLongMsgItemBuilder;
    case 18: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemMixedMsgItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemMixedMsgItemBuilder = new MixedMsgItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemMixedMsgItemBuilder;
    case 21: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder = new QzoneFeedItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder;
    case 25: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder = new TroopFileItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFileItemBuilder;
    case 26: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemShakeItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShakeItemBuilder = new ShakeItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemShakeItemBuilder;
    case 27: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopUnreadTipsChatItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopUnreadTipsChatItemBuilder = new TroopUnreadTipsChatItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopUnreadTipsChatItemBuilder;
    case 28: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemStructTroopNotificationItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemStructTroopNotificationItemBuilder = new StructTroopNotificationItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemStructTroopNotificationItemBuilder;
    case 29: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder = new ShortVideoItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoItemBuilder;
    case 38: 
    case 40: 
    case 41: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoRealItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoRealItemBuilder = new ShortVideoRealItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoRealItemBuilder;
    case 46: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder = new ShortVideoPTVItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemShortVideoPTVItemBuilder;
    case 31: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemThumbItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemThumbItemBuilder = new ThumbItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemThumbItemBuilder;
    case 32: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder = new QQWalletMsgItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemQQWalletMsgItemBuilder;
    case 44: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFeeMsgItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFeeMsgItemBuilder = new TroopFeeMsgItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopFeeMsgItemBuilder;
    case 48: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemSenderBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemSenderBuilder = new TroopGiftMsgItemBuilder.TroopGiftMsgItemSenderBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemSenderBuilder;
    case 49: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemRecieverBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemRecieverBuilder = new TroopGiftMsgItemBuilder.TroopGiftMsgItemRecieverBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemTroopGiftMsgItemBuilder$TroopGiftMsgItemRecieverBuilder;
    case 35: 
      if (jdField_a_of_type_ComTencentDeviceMsgActivitiesDevShortVideoItemBuilder == null) {
        jdField_a_of_type_ComTencentDeviceMsgActivitiesDevShortVideoItemBuilder = new DevShortVideoItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentDeviceMsgActivitiesDevShortVideoItemBuilder;
    case 45: 
      if (jdField_a_of_type_ComTencentDeviceMsgActivitiesDevLittleVideoItemBuilder == null) {
        jdField_a_of_type_ComTencentDeviceMsgActivitiesDevLittleVideoItemBuilder = new DevLittleVideoItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentDeviceMsgActivitiesDevLittleVideoItemBuilder;
    case 34: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceSingleStructBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceSingleStructBuilder = new DeviceSingleStructBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      if (QLog.isColorLevel()) {
        QLog.d("AutoMonitor", 2, "ItemBuilder is: DeviceSingleItemBuilder");
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceSingleStructBuilder;
    case 36: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemDevicePicItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemDevicePicItemBuilder = new DevicePicItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      if (QLog.isColorLevel()) {
        QLog.d("AutoMonitor", 2, "ItemBuilder is: DevicePicItemBuilder");
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemDevicePicItemBuilder;
    case 37: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceFileItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceFileItemBuilder = new DeviceFileItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      if (QLog.isColorLevel()) {
        QLog.d("AutoMonitor", 2, "ItemBuilder is: DeviceFileItemBuilder");
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceFileItemBuilder;
    case 39: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceTextItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceTextItemBuilder = new DeviceTextItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceTextItemBuilder;
    case 42: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemFlashPicItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemFlashPicItemBuilder = new FlashPicItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemFlashPicItemBuilder;
    case 43: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder = new PAWeatherItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder;
    case 55: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemApolloItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemApolloItemBuilder = new ApolloItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemApolloItemBuilder;
    case 47: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemArkAppItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemArkAppItemBuilder = new ArkAppItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemArkAppItemBuilder;
    case 50: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemReplyTextItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemReplyTextItemBuilder = new ReplyTextItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemReplyTextItemBuilder;
    case 100: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemApprovalMsgBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemApprovalMsgBuilder = new ApprovalMsgBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemApprovalMsgBuilder;
    case 53: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder = new VideoVipItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemVideoVipItemBuilder;
    case 54: 
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemDingdongScheduleItemBuilder == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioItemDingdongScheduleItemBuilder = new DingdongScheduleItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemDingdongScheduleItemBuilder;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextItemBuilder == null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemTextItemBuilder = new TextItemBuilder(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramBaseAdapter, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner);
    }
    return jdField_a_of_type_ComTencentMobileqqActivityAioItemTextItemBuilder;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder.a();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemPttItemBuilder.d();
    }
    if (jdField_a_of_type_ComTencentBitappBitAppMsgItemBuilder != null) {
      jdField_a_of_type_ComTencentBitappBitAppMsgItemBuilder.a();
    }
  }
}
