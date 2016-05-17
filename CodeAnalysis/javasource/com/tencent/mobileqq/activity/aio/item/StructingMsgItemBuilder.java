package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.text.ClipboardManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.biz.common.util.HttpUtil;
import com.tencent.biz.pubaccount.util.PAReportUtil.AdverInfo;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AudioPlayer;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.ForwardUtils;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager.Callback;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.photo.AIOGallerySceneWithBusiness;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.AIOImageData;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.DynamicMsgInfoManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopQZoneUploadAlbumHandler;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.customviews.MessageProgressTextView;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForTroopTopic;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.pic.PicPreDownloader;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsShareMsg;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.AbsStructMsgElement;
import com.tencent.mobileqq.structmsg.AbsStructMsgItem;
import com.tencent.mobileqq.structmsg.StructMsgClickHandler;
import com.tencent.mobileqq.structmsg.StructMsgFactory;
import com.tencent.mobileqq.structmsg.StructMsgForAudioShare;
import com.tencent.mobileqq.structmsg.StructMsgForGeneralShare;
import com.tencent.mobileqq.structmsg.StructMsgForHypertext;
import com.tencent.mobileqq.structmsg.StructMsgForImageShare;
import com.tencent.mobileqq.structmsg.StructMsgTimeReport;
import com.tencent.mobileqq.structmsg.view.StructMsgItemImage;
import com.tencent.mobileqq.structmsg.view.StructMsgItemLayout10.ViewHolder;
import com.tencent.mobileqq.structmsg.view.StructMsgItemPAAudio.ViewHolder;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.StructLongMessageDownloadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import com.tencent.mobileqq.vipgift.VipGiftDownloadInfo;
import com.tencent.mobileqq.vipgift.VipGiftManager;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView.RecyclerListener;
import com.tencent.widget.PopupMenuDialog;
import com.tencent.widget.PopupMenuDialog.MenuItem;
import com.tencent.widget.XListView;
import cooperation.comic.VipComicReportUtils;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import cooperation.qqfav.QfavUtil;
import java.io.File;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import lav;
import law;
import lax;
import lay;
import laz;
import lbb;
import lbc;
import lbd;
import lbf;
import lbg;
import lbh;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class StructingMsgItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback, MediaPlayerManager.Callback
{
  private static final String jdField_b_of_type_JavaLangString = "StructingMsgItemBuilder";
  public static int h = 0;
  private StructMsgTimeReport jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgTimeReport = null;
  public AbsListView.RecyclerListener a;
  PopupMenuDialog jdField_a_of_type_ComTencentWidgetPopupMenuDialog;
  private final float jdField_b_of_type_Float;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public StructingMsgItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_ComTencentWidgetAbsListView$RecyclerListener = new lax(this);
    if (((paramContext instanceof ChatActivity)) || ((paramContext instanceof SplashActivity))) {
      ((FragmentActivity)paramContext).getChatFragment().a().a(jdField_a_of_type_ComTencentWidgetAbsListView$RecyclerListener);
    }
    b = getResourcesgetDisplayMetricsdensity;
    jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgTimeReport = new StructMsgTimeReport();
  }
  
  private StructMsgForGeneralShare a(ChatMessage paramChatMessage)
  {
    if (!(paramChatMessage instanceof MessageForStructing)) {
      paramChatMessage = null;
    }
    StructMsgForGeneralShare localStructMsgForGeneralShare;
    do
    {
      return paramChatMessage;
      paramChatMessage = (MessageForStructing)paramChatMessage;
      if (!(structingMsg instanceof StructMsgForGeneralShare)) {
        break;
      }
      localStructMsgForGeneralShare = (StructMsgForGeneralShare)structingMsg;
      paramChatMessage = localStructMsgForGeneralShare;
    } while (localStructMsgForGeneralShare.getProgress() >= 0);
    return null;
  }
  
  public static String a()
  {
    return String.valueOf(h);
  }
  
  private void a(long paramLong)
  {
    if (((jdField_a_of_type_AndroidContentContext instanceof ChatActivity)) || ((jdField_a_of_type_AndroidContentContext instanceof SplashActivity)))
    {
      VipGiftManager localVipGiftManager = (VipGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(75);
      VipGiftDownloadInfo localVipGiftDownloadInfo = localVipGiftManager.a();
      BaseActivity localBaseActivity = (BaseActivity)jdField_a_of_type_AndroidContentContext;
      if ((localVipGiftDownloadInfo != null) && (localBaseActivity.isResume()) && (b.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (d == 2L) && (paramLong == a)) {
        localVipGiftManager.a(localVipGiftDownloadInfo, localBaseActivity);
      }
    }
  }
  
  private void a(Activity paramActivity, View paramView, ChatMessage paramChatMessage)
  {
    String str = frienduin;
    AbsStructMsg localAbsStructMsg = structingMsg;
    ArrayList localArrayList1 = new ArrayList();
    Object localObject1 = adverKey;
    ArrayList localArrayList2 = new ArrayList();
    try
    {
      localObject1 = new JSONArray((String)localObject1);
      i = 0;
      if (i < ((JSONArray)localObject1).length())
      {
        JSONObject localJSONObject = (JSONObject)((JSONArray)localObject1).get(i);
        Object localObject2 = new PopupMenuDialog.MenuItem();
        jdField_a_of_type_Int = i;
        b = 0;
        if (localJSONObject.has("show_name")) {}
        for (jdField_a_of_type_JavaLangString = localJSONObject.getString("show_name");; jdField_a_of_type_JavaLangString = "")
        {
          localArrayList1.add(localObject2);
          localObject2 = new PAReportUtil.AdverInfo();
          jdField_a_of_type_JavaLangString = str;
          c = localJSONObject.optString("index");
          d = localJSONObject.optString("index_name");
          b = localJSONObject.optString("index_type");
          e = String.valueOf(HttpUtil.a());
          localArrayList2.add(localObject2);
          i += 1;
          break;
        }
      }
      jdField_a_of_type_ComTencentWidgetPopupMenuDialog = PopupMenuDialog.a(paramActivity, localArrayList1, new lbd(this, paramActivity, paramChatMessage, localAbsStructMsg, str, localArrayList2), new lbf(this), AIOUtils.a(100.0F, paramActivity.getResources()));
    }
    catch (JSONException paramActivity)
    {
      paramActivity.printStackTrace();
      return;
    }
    int i = paramView.getWidth() * 7 / 2;
    jdField_a_of_type_ComTencentWidgetPopupMenuDialog.showAsDropDown(paramView, 0 - i, 0);
  }
  
  private void a(View paramView, StructMsgForGeneralShare paramStructMsgForGeneralShare)
  {
    new StructMsgClickHandler(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView).a(mMsgAction, mMsgUrl, mMsgActionData, mMsg_A_ActionData);
  }
  
  private void a(BaseChatItemLayout paramBaseChatItemLayout, MessageForStructing paramMessageForStructing)
  {
    int i = ((StructMsgForGeneralShare)structingMsg).getProgress();
    if ((extraflag == 32772) && (i >= 0) && (i < 100))
    {
      TroopQZoneUploadAlbumHandler localTroopQZoneUploadAlbumHandler = (TroopQZoneUploadAlbumHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(28);
      localTroopQZoneUploadAlbumHandler.a(MessageUtils.a(msgUid), frienduin, uniseq);
      localTroopQZoneUploadAlbumHandler.a(paramBaseChatItemLayout, new lbg(this, paramMessageForStructing, paramBaseChatItemLayout));
    }
  }
  
  private void a(StructingMsgItemBuilder.StructingMsgViewHolder paramStructingMsgViewHolder, BaseChatItemLayout paramBaseChatItemLayout, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      paramBaseChatItemLayout.setHeadIconVisible(false);
      jdField_a_of_type_AndroidViewView.setBackgroundResource(2130842982);
      int i = jdField_a_of_type_AndroidWidgetRelativeLayout.getPaddingLeft();
      int j = jdField_a_of_type_AndroidWidgetRelativeLayout.getPaddingLeft();
      jdField_a_of_type_AndroidWidgetRelativeLayout.setPadding(0, i, 0, j);
      return;
    }
    paramBaseChatItemLayout.setHeadIconVisible(true);
  }
  
  private void a(StructingMsgItemBuilder.StructingMsgViewHolder paramStructingMsgViewHolder, BaseChatItemLayout paramBaseChatItemLayout, boolean paramBoolean1, AbsStructMsg paramAbsStructMsg, Resources paramResources, boolean paramBoolean2)
  {
    RelativeLayout localRelativeLayout = b;
    if (localRelativeLayout == null)
    {
      localRelativeLayout = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      b = localRelativeLayout;
      localRelativeLayout.setId(2131296328);
      paramBaseChatItemLayout.addView(localRelativeLayout);
    }
    for (;;)
    {
      Object localObject2 = (RelativeLayout.LayoutParams)localRelativeLayout.getLayoutParams();
      Object localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = new RelativeLayout.LayoutParams(-2, -2);
      }
      topMargin = AIOUtils.a(2.0F, paramResources);
      if (paramBoolean2)
      {
        leftMargin = AIOUtils.a(0.0F, paramResources);
        ((RelativeLayout.LayoutParams)localObject1).addRule(5, 2131296325);
        ((RelativeLayout.LayoutParams)localObject1).addRule(3, 2131296325);
        if (!paramBoolean1) {
          break label422;
        }
        ((RelativeLayout.LayoutParams)localObject1).addRule(1, 0);
        ((RelativeLayout.LayoutParams)localObject1).addRule(7, 2131296317);
      }
      for (;;)
      {
        localRelativeLayout.setLayoutParams((ViewGroup.LayoutParams)localObject1);
        View localView = localRelativeLayout.getChildAt(0);
        localObject2 = localView;
        if (localView != null)
        {
          localObject2 = localView;
          if (jdField_a_of_type_AndroidWidgetRelativeLayout != null)
          {
            Object localObject3 = jdField_a_of_type_AndroidWidgetRelativeLayout.getChildAt(0);
            localObject2 = localView;
            if (localObject3 != null)
            {
              localObject3 = ((View)localObject3).getTag(2131296311);
              if (QLog.isColorLevel()) {
                QLog.d("structMsg", 2, "bindviwfor structmsg tag:" + localObject3);
              }
              if (localObject3 != null)
              {
                localObject2 = localView;
                if (localObject3.getClass() == paramAbsStructMsg.getClass()) {}
              }
              else
              {
                localObject2 = null;
              }
            }
          }
        }
        localRelativeLayout.removeAllViews();
        paramAbsStructMsg = paramAbsStructMsg.getSourceView(jdField_a_of_type_AndroidContentContext, (View)localObject2);
        if (paramAbsStructMsg == null) {
          break label444;
        }
        localRelativeLayout.addView(paramAbsStructMsg);
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          width = -1;
          height = AIOUtils.a(25.0F, paramResources);
          topMargin = 0;
          localRelativeLayout.setLayoutParams((ViewGroup.LayoutParams)localObject1);
          localRelativeLayout.setBackgroundColor(Color.parseColor("#1A000000"));
          paramAbsStructMsg.setBackgroundDrawable(null);
          paramAbsStructMsg.setPadding(AIOUtils.a(20.0F, paramResources), 0, AIOUtils.a(20.0F, paramResources), 0);
          paramAbsStructMsg.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        }
        return;
        leftMargin = AIOUtils.a(10.0F, paramResources);
        break;
        label422:
        ((RelativeLayout.LayoutParams)localObject1).addRule(1, 2131296317);
        ((RelativeLayout.LayoutParams)localObject1).addRule(7, 2131296325);
      }
      label444:
      paramBaseChatItemLayout.removeView(localRelativeLayout);
      b = null;
      return;
    }
  }
  
  private void a(IHttpCommunicatorListener paramIHttpCommunicatorListener, StructingMsgItemBuilder.StructingMsgViewHolder paramStructingMsgViewHolder)
  {
    if (jdField_a_of_type_AndroidWidgetRelativeLayout == null) {
      return;
    }
    Object localObject;
    int i;
    if ((paramIHttpCommunicatorListener instanceof BaseTransProcessor))
    {
      localObject = (BaseTransProcessor)paramIHttpCommunicatorListener;
      i = (int)((BaseTransProcessor)localObject).c();
      if ((i != 1004) || (!((BaseTransProcessor)localObject).b()) || (!((BaseTransProcessor)localObject).c())) {
        break label420;
      }
      i = 1006;
    }
    label420:
    for (;;)
    {
      localObject = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject).addRule(6, 2131296311);
      ((RelativeLayout.LayoutParams)localObject).addRule(8, 2131296311);
      ((RelativeLayout.LayoutParams)localObject).addRule(5, 2131296311);
      ((RelativeLayout.LayoutParams)localObject).addRule(7, 2131296311);
      if ((jdField_a_of_type_AndroidWidgetRelativeLayout != null) && (jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296383) == null) && (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null)) {
        jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView, (ViewGroup.LayoutParams)localObject);
      }
      switch (i)
      {
      default: 
        if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView == null) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(null);
        jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(8);
        return;
      case 1000: 
      case 1001: 
      case 1002: 
      case 1006: 
      case 4001: 
        if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView == null)
        {
          MessageProgressTextView localMessageProgressTextView = new MessageProgressTextView(jdField_a_of_type_AndroidContentContext);
          localMessageProgressTextView.setTextColor(-1);
          localMessageProgressTextView.setTextSize(2, 15.0F);
          localMessageProgressTextView.setGravity(17);
          localMessageProgressTextView.setId(2131296383);
          localMessageProgressTextView.setBackgroundDrawable(new AIOSendMask(2130706432, b * 12.0F));
          if (jdField_a_of_type_AndroidWidgetRelativeLayout != null) {
            jdField_a_of_type_AndroidWidgetRelativeLayout.addView(localMessageProgressTextView, (ViewGroup.LayoutParams)localObject);
          }
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = localMessageProgressTextView;
        }
        jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor((BaseTransProcessor)paramIHttpCommunicatorListener);
        jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(0);
        switch (i)
        {
        }
        for (;;)
        {
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.a();
          return;
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProgress(0);
          return;
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProgress(0);
        }
        if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView == null) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(null);
        jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(4);
        return;
      }
    }
  }
  
  private boolean a(AbsStructMsg paramAbsStructMsg)
  {
    return 19 == mMsgServiceID;
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    paramChatMessage = (MessageForStructing)paramChatMessage;
    if ((paramChatMessage != null) && (structingMsg != null) && (structingMsg.hasFlag(4))) {
      if (QLog.isDevelopLevel()) {
        QLog.d("StructingMsgItemBuilder", 4, "getBubbleType:hasHead不显示头像");
      }
    }
    do
    {
      return 0;
      if (QLog.isDevelopLevel()) {
        QLog.d("StructingMsgItemBuilder", 4, "getBubbleType:hasHead显示头像");
      }
      if ((paramChatMessage != null) && (structingMsg != null) && (structingMsg.mMsgServiceID == 52)) {
        return 1;
      }
    } while ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)));
    return 2;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgTimeReport.a();
    int i;
    MessageForStructing localMessageForStructing;
    AbsStructMsg localAbsStructMsg;
    Object localObject;
    if (paramView == null)
    {
      i = 1;
      localMessageForStructing = (MessageForStructing)paramChatMessage;
      localAbsStructMsg = null;
      if (localMessageForStructing != null) {
        localAbsStructMsg = structingMsg;
      }
      if (!(localMessageForStructing instanceof MessageForTroopTopic)) {
        break label587;
      }
      localObject = (MessageForTroopTopic)localMessageForStructing;
      if (QLog.isColorLevel()) {
        QLog.d(".troop.troop_topic", 2, "StructingMsgItemBuilder getView. structMr instanceof MessageForTroopTopic");
      }
      if (!isExpand) {
        break label584;
      }
      if (QLog.isColorLevel()) {
        QLog.d(".troop.troop_topic", 2, "StructingMsgItemBuilder getView. messageForTroopTopic.isExpand = true");
      }
      localAbsStructMsg = detailTopicContent;
      label98:
      ((TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97)).b((MessageForTroopTopic)localObject);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "dc00899", "Grp_talk", "", "obj", "exp_talk", 0, 0, "" + frienduin, "", "", "");
    }
    label581:
    label584:
    label587:
    for (;;)
    {
      if ((localAbsStructMsg != null) && ((localAbsStructMsg instanceof StructMsgForGeneralShare)) && (!havaPayInfoInit))
      {
        localObject = paramChatMessage.getExtInfoFromExtStr("pa_pay_message");
        if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((String)localObject).equals("1"))) {
          ((StructMsgForGeneralShare)localAbsStructMsg).initPay(jdField_a_of_type_AndroidContentContext, paramChatMessage);
        }
      }
      if (localAbsStructMsg == null)
      {
        return paramView;
        i = 2;
        break;
      }
      message = localMessageForStructing;
      paramView = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
      paramViewGroup = (StructingMsgItemBuilder.StructingMsgViewHolder)paramView.getTag();
      paramOnLongClickAndTouchListener = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout;
      boolean bool;
      if ((localAbsStructMsg instanceof AbsShareMsg))
      {
        paramInt2 = mContentLayout;
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1008) && (localAbsStructMsg.hasFlag(4))) {
          localAbsStructMsg.addFlag(1);
        }
        localObject = jdField_a_of_type_AndroidContentContext.getResources();
        bool = localAbsStructMsg.hasFlag(4);
        if ((!(localAbsStructMsg instanceof AbsShareMsg)) || (!mMsgException)) {
          break label581;
        }
        bool = true;
      }
      for (;;)
      {
        if ((localMessageForStructing instanceof MessageForTroopTopic)) {
          bool = true;
        }
        for (;;)
        {
          if (QLog.isDevelopLevel()) {
            QLog.d("StructingMsgItemBuilder", 4, "getView:position:" + paramInt1 + "hasHead" + bool);
          }
          a(paramViewGroup, paramOnLongClickAndTouchListener, bool);
          a(paramViewGroup, paramOnLongClickAndTouchListener, localMessageForStructing.isSend(), localAbsStructMsg, (Resources)localObject, bool);
          if (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
          {
            a(paramViewGroup, paramOnLongClickAndTouchListener, true);
            paramOnLongClickAndTouchListener = (RelativeLayout)((BaseChatItemLayout)paramView).a();
            paramOnLongClickAndTouchListener.setPadding(0, 0, 0, 0);
            ((RelativeLayout.LayoutParams)paramOnLongClickAndTouchListener.getLayoutParams()).setMargins(0, 0, 0, 0);
          }
          paramView.requestLayout();
          if ((paramViewGroup != null) && (jdField_a_of_type_ComTencentMobileqqDataChatMessage == paramChatMessage) && (localAbsStructMsg.hasFlag(16))) {
            ThreadManager.a(new lay(this, paramViewGroup), 2, null, false);
          }
          jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgTimeReport.a(paramInt2, i);
          return paramView;
          paramInt2 = -1;
          break;
        }
      }
      break label98;
    }
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Bundle localBundle = new Bundle();
    if (((jdField_a_of_type_AndroidContentContext instanceof ChatActivity)) || ((jdField_a_of_type_AndroidContentContext instanceof SplashActivity))) {}
    for (Object localObject2 = ((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a().a();; localObject2 = null)
    {
      Object localObject1;
      int i;
      if (paramView == null)
      {
        paramViewHolder = jdField_a_of_type_AndroidContentContext.getResources();
        paramView = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
        paramView.setId(2131296325);
        paramView.setMinimumHeight(AIOUtils.a(44.0F, paramViewHolder));
        paramView.setClickable(true);
        paramView.setPadding(paramViewHolder.getDimensionPixelSize(2131493039), paramViewHolder.getDimensionPixelSize(2131493037), paramViewHolder.getDimensionPixelSize(2131493040), paramViewHolder.getDimensionPixelSize(2131493038));
        paramView.setBackgroundResource(2130837560);
        localObject1 = new RelativeLayout.LayoutParams(-2, -2);
        i = paramViewHolder.getDimensionPixelSize(2131493082);
        ((RelativeLayout.LayoutParams)localObject1).setMargins(i, 0, i, 0);
        ((RelativeLayout.LayoutParams)localObject1).addRule(1, 2131296683);
        paramView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
        if (MessageForStructing.class.isInstance(paramChatMessage)) {
          break label209;
        }
      }
      label209:
      MessageForStructing localMessageForStructing;
      Object localObject3;
      do
      {
        return paramView;
        if ((paramView instanceof ViewGroup)) {
          ((ViewGroup)paramView).removeAllViews();
        }
        break;
        localMessageForStructing = (MessageForStructing)paramChatMessage;
        paramViewHolder = structingMsg;
        localObject1 = paramViewHolder;
        if (localMessageForStructing != null)
        {
          localObject1 = paramViewHolder;
          if ((localMessageForStructing instanceof MessageForTroopTopic))
          {
            localObject3 = (MessageForTroopTopic)localMessageForStructing;
            localObject1 = paramViewHolder;
            if (isExpand)
            {
              if (QLog.isColorLevel()) {
                QLog.d(".troop.troop_topic", 2, "StructingMsgItemBuilder getBubbleView. messageForTroopTopic.isExpand = true");
              }
              localObject1 = detailTopicContent;
            }
          }
        }
        if (localObject1 != null) {
          break label360;
        }
      } while (!QLog.isColorLevel());
      paramViewHolder = new StringBuilder().append("structMsg is null,msgdata:");
      if (localMessageForStructing == null) {
        paramChatMessage = "null";
      }
      for (;;)
      {
        QLog.d("structMsg", 2, paramChatMessage);
        return paramView;
        if (msgData == null) {
          paramChatMessage = "null";
        } else {
          paramChatMessage = Integer.valueOf(msgData.length);
        }
      }
      label360:
      Object localObject4;
      Object localObject5;
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008))
      {
        localBundle.putBoolean("isPublicAccount", true);
        paramViewHolder = paramChatMessage.getExtInfoFromExtStr("msg_template_id");
        if ((paramViewHolder != null) && (!paramViewHolder.equals("")))
        {
          if (!TextUtils.isEmpty(paramViewHolder)) {
            templateIDForPortal = paramViewHolder;
          }
          if ((localObject1 instanceof AbsShareMsg))
          {
            localObject3 = ((AbsShareMsg)localObject1).getStructMsgItemLists();
            if (localObject3 != null)
            {
              localObject3 = ((List)localObject3).iterator();
              while (((Iterator)localObject3).hasNext())
              {
                localObject4 = (AbsStructMsgElement)((Iterator)localObject3).next();
                if (!TextUtils.isEmpty(paramViewHolder)) {
                  l = paramViewHolder;
                }
                if ((localObject4 instanceof AbsStructMsgItem))
                {
                  localObject4 = (AbsStructMsgItem)localObject4;
                  if (a != null)
                  {
                    localObject4 = a.iterator();
                    while (((Iterator)localObject4).hasNext())
                    {
                      localObject5 = (AbsStructMsgElement)((Iterator)localObject4).next();
                      if (!TextUtils.isEmpty(paramViewHolder)) {
                        l = paramViewHolder;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      uniseq = uniseq;
      uin = frienduin;
      uinType = istroop;
      currentAccountUin = selfuin;
      messageVersion = versionCode;
      localBundle.putBoolean("isSend", localMessageForStructing.isSend());
      if (uinType == 1008)
      {
        sourceAccoutType = AbsStructMsg.SOURCE_ACCOUNT_TYPE_PA;
        label643:
        localBundle.putInt("accostType", sourceAccoutType);
        if (!StructMsgForImageShare.class.isInstance(localObject1)) {
          break label1724;
        }
        paramViewHolder = (StructMsgForImageShare)localObject1;
        mIsSend = issend;
        mUniseq = uniseq;
        mMsgType = msgtype;
        label700:
        paramBaseChatItemLayout.setAddStatesFromChildren(false);
        paramViewHolder = paramBaseChatItemLayout.getTag();
        if (paramViewHolder == null) {
          break label2163;
        }
      }
      label1169:
      label1249:
      label1724:
      label1972:
      label2002:
      label2072:
      label2102:
      label2152:
      label2163:
      for (paramViewHolder = (StructingMsgItemBuilder.StructingMsgViewHolder)paramViewHolder;; paramViewHolder = null)
      {
        if (paramViewHolder == null) {}
        for (localObject3 = new StructingMsgItemBuilder.StructingMsgViewHolder();; localObject3 = paramViewHolder)
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
          paramViewHolder = jdField_a_of_type_AndroidWidgetRelativeLayout;
          localObject4 = paramViewHolder;
          if (paramViewHolder == null)
          {
            localObject4 = (RelativeLayout)paramView;
            jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localObject4);
          }
          if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) && (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
          {
            i = AIOUtils.a(7.5F, jdField_a_of_type_AndroidContentContext.getResources());
            paramBaseChatItemLayout.setPadding(0, i, 0, i);
            paramBaseChatItemLayout.a();
            paramViewHolder = (RelativeLayout.LayoutParams)((RelativeLayout)localObject4).getLayoutParams();
            paramViewHolder.setMargins(0, 0, 0, 0);
            ((RelativeLayout)localObject4).setLayoutParams(paramViewHolder);
            ((RelativeLayout)localObject4).setPadding(0, 0, 0, 0);
            isSubscript = true;
            localBundle.putBoolean("isSubscript", true);
            localBundle.putLong("TimeStamp", time);
          }
          if ((localMessageForStructing != null) && ((localMessageForStructing instanceof MessageForTroopTopic)))
          {
            i = AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources());
            paramBaseChatItemLayout.setPadding(i, 0, i, 0);
            paramViewHolder = (RelativeLayout.LayoutParams)((RelativeLayout)localObject4).getLayoutParams();
            paramViewHolder.setMargins(0, 0, 0, AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources()));
            ((RelativeLayout)localObject4).setLayoutParams(paramViewHolder);
            ((RelativeLayout)localObject4).setPadding(0, 0, 0, 0);
          }
          paramView.setTag(localObject3);
          if ((localObject1 instanceof StructMsgForGeneralShare))
          {
            if (mSType != null) {
              localBundle.putString("sType", mSType);
            }
            if (!StructLongMessageDownloadProcessor.b(paramChatMessage)) {}
          }
          try
          {
            localBundle.putInt("longMsgHolderType", Integer.parseInt(localMessageForStructing.getExtInfoFromExtStr("longMsg_State")));
            if (isDynamicMsg)
            {
              localObject2 = dynamicMsgMergeKey;
              if ((!(jdField_a_of_type_AndroidContentContext instanceof ChatActivity)) && (!(jdField_a_of_type_AndroidContentContext instanceof SplashActivity))) {
                break label2152;
              }
              paramViewHolder = ((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a();
              if (!(paramViewHolder instanceof PublicAccountChatPie)) {
                break label2152;
              }
              if (a == null) {
                a = new StructingMsgItemBuilder.DynamicMsgViewCache();
              }
              localObject5 = a;
              View localView = ((StructingMsgItemBuilder.DynamicMsgViewCache)localObject5).getContentView((String)localObject2, (ViewGroup)paramView);
              paramViewHolder = ((AbsStructMsg)localObject1).getView(jdField_a_of_type_AndroidContentContext, localView, paramOnLongClickAndTouchListener, localBundle);
              if (paramViewHolder != localView) {
                ((StructingMsgItemBuilder.DynamicMsgViewCache)localObject5).put((String)localObject2, paramViewHolder, (ViewGroup)paramView);
              }
              paramView.setOnTouchListener(paramOnLongClickAndTouchListener);
              paramView.setOnLongClickListener(paramOnLongClickAndTouchListener);
              if (!(localObject1 instanceof AbsShareMsg)) {
                break label2002;
              }
              paramOnLongClickAndTouchListener = (AbsShareMsg)localObject1;
              localObject2 = paramOnLongClickAndTouchListener.getOnClickListener();
              paramView.setOnClickListener(new lbb(this, paramOnLongClickAndTouchListener, time, (View.OnClickListener)localObject2, localMessageForStructing));
              if (!StructMsgForImageShare.class.isInstance(localObject1)) {
                break label1972;
              }
              FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(paramBaseChatItemLayout, this);
              if (mMsgServiceID == 70) {
                paramView.setOnClickListener(null);
              }
            }
            try
            {
              for (;;)
              {
                ((RelativeLayout)localObject4).addView(paramViewHolder);
                if (mMsgServiceID == 38)
                {
                  paramViewHolder = (VipGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(75);
                  if (paramViewHolder != null)
                  {
                    if (!paramViewHolder.b(time)) {
                      break label2072;
                    }
                    paramViewHolder = new ProgressBar(jdField_a_of_type_AndroidContentContext);
                    paramViewHolder.setId(2131296323);
                    paramViewHolder.setIndeterminateDrawable(jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130838189));
                    i = AIOUtils.a(16.0F, jdField_a_of_type_AndroidContentContext.getResources());
                    new RelativeLayout.LayoutParams(-2, -2);
                    paramBaseChatItemLayout = new RelativeLayout.LayoutParams(i, i);
                    paramBaseChatItemLayout.addRule(13, 2131296325);
                    ((RelativeLayout)localObject4).addView(paramViewHolder, paramBaseChatItemLayout);
                    d();
                  }
                }
                if (!localMessageForStructing.isSendFromLocal()) {
                  break label2102;
                }
                paramViewHolder = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
                jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localObject4);
                a(paramViewHolder, (StructingMsgItemBuilder.StructingMsgViewHolder)localObject3);
                if (adverSign != 1) {
                  break;
                }
                paramViewHolder = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
                paramBaseChatItemLayout = new ImageView(jdField_a_of_type_AndroidContentContext);
                paramBaseChatItemLayout.setImageResource(2130838596);
                paramViewHolder.setBackgroundColor(0);
                paramOnLongClickAndTouchListener = new RelativeLayout.LayoutParams(AIOUtils.a(80.0F, jdField_a_of_type_AndroidContentContext.getResources()), AIOUtils.a(44.0F, jdField_a_of_type_AndroidContentContext.getResources()));
                paramOnLongClickAndTouchListener.addRule(11);
                paramOnLongClickAndTouchListener.addRule(10);
                paramViewHolder.setLayoutParams(paramOnLongClickAndTouchListener);
                paramOnLongClickAndTouchListener = new RelativeLayout.LayoutParams(-2, -2);
                paramOnLongClickAndTouchListener.addRule(11);
                paramOnLongClickAndTouchListener.addRule(10);
                paramOnLongClickAndTouchListener.setMargins(0, 12, 12, 0);
                paramBaseChatItemLayout.setLayoutParams(paramOnLongClickAndTouchListener);
                paramViewHolder.addView(paramBaseChatItemLayout);
                if ((paramView instanceof RelativeLayout)) {
                  ((RelativeLayout)paramView).addView(paramViewHolder);
                }
                paramOnLongClickAndTouchListener = frienduin;
                long l = msgId;
                if ((jdField_a_of_type_AndroidContentContext instanceof Activity)) {
                  paramViewHolder.setOnClickListener(new lbc(this, paramBaseChatItemLayout, paramChatMessage, paramOnLongClickAndTouchListener, l));
                }
                if ((jdField_a_of_type_ComTencentWidgetPopupMenuDialog == null) || (!jdField_a_of_type_ComTencentWidgetPopupMenuDialog.isShowing())) {
                  break;
                }
                jdField_a_of_type_ComTencentWidgetPopupMenuDialog.dismiss();
                return paramView;
                paramViewHolder = localMessageForStructing.getExtInfoFromExtStr("accostType");
                if ((paramViewHolder == null) || (paramViewHolder.equals(""))) {
                  break label643;
                }
                try
                {
                  sourceAccoutType = Integer.parseInt(paramViewHolder);
                }
                catch (Exception paramViewHolder) {}
                break label643;
                if (!StructMsgForGeneralShare.class.isInstance(localObject1)) {
                  break label700;
                }
                paramViewHolder = (StructMsgForGeneralShare)localObject1;
                isDynamicMsg = MsgProxyUtils.b(paramChatMessage);
                if (!isDynamicMsg) {
                  break label700;
                }
                hasNotReadCount = ((DynamicMsgInfoManager)jdField_a_of_type_AndroidContentContext).app.getManager(99)).a(MsgProxyUtils.b(paramChatMessage));
                break label700;
                localObject5 = ((StructMsgForGeneralShare)localObject1).getLayoutStr();
                paramViewHolder = null;
                if (localObject2 != null) {
                  paramViewHolder = ((StructingMsgItemBuilder.ViewCache)localObject2).a((String)localObject5, (ViewGroup)paramView);
                }
                if (paramViewHolder != null) {
                  paramViewHolder = ((AbsStructMsg)localObject1).getView(jdField_a_of_type_AndroidContentContext, paramViewHolder, paramOnLongClickAndTouchListener, localBundle);
                }
                for (;;)
                {
                  break;
                  paramViewHolder = ((AbsStructMsg)localObject1).getView(jdField_a_of_type_AndroidContentContext, null, paramOnLongClickAndTouchListener, localBundle);
                  if (localObject2 != null) {
                    ((StructingMsgItemBuilder.ViewCache)localObject2).a((String)localObject5, paramViewHolder, (ViewGroup)paramView);
                  }
                }
                if (((RelativeLayout)localObject4).getChildCount() > 0)
                {
                  paramViewHolder = ((RelativeLayout)localObject4).getChildAt(0);
                  if (paramViewHolder != null)
                  {
                    paramViewHolder = paramViewHolder.getTag(2131296311);
                    if (QLog.isColorLevel()) {
                      QLog.d("structMsg", 2, "bindviwfor structmsg tag:" + paramViewHolder);
                    }
                    if ((paramViewHolder == null) || (paramViewHolder.getClass() == localObject1.getClass())) {}
                  }
                }
                ((RelativeLayout)localObject4).removeAllViews();
                paramViewHolder = ((AbsStructMsg)localObject1).getView(jdField_a_of_type_AndroidContentContext, null, paramOnLongClickAndTouchListener, localBundle);
                break label1169;
                if ((!StructMsgForGeneralShare.class.isInstance(localObject1)) || (!a((AbsStructMsg)localObject1))) {
                  break label1249;
                }
                a(paramBaseChatItemLayout, localMessageForStructing);
                break label1249;
                if (mMsgServiceID == 3) {
                  if (a()) {
                    paramView.setClickable(false);
                  } else {
                    paramView.setClickable(true);
                  }
                }
              }
            }
            catch (IllegalStateException paramBaseChatItemLayout)
            {
              for (;;)
              {
                paramBaseChatItemLayout = paramViewHolder.getParent();
                if ((paramBaseChatItemLayout != null) && ((paramBaseChatItemLayout instanceof ViewGroup))) {
                  ((ViewGroup)paramBaseChatItemLayout).removeAllViews();
                }
                ((RelativeLayout)localObject4).addView(paramViewHolder);
                continue;
                if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0)
                {
                  paramViewHolder = paramViewHolder.a();
                  if (paramViewHolder != null)
                  {
                    a(a);
                    continue;
                    if ((localObject1 instanceof StructMsgForImageShare))
                    {
                      paramViewHolder = ((StructMsgForImageShare)localObject1).getFirstImageElement();
                      if ((paramViewHolder != null) && (jdField_a_of_type_ComTencentMobileqqDataMessageForPic != null)) {
                        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageForPic, 2);
                      }
                    }
                  }
                }
              }
            }
          }
          catch (Exception paramViewHolder)
          {
            for (;;)
            {
              continue;
              paramViewHolder = null;
            }
          }
        }
      }
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new StructingMsgItemBuilder.StructingMsgViewHolder();
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (MsgUtils.a(issend)) {
      localStringBuilder.append("发出");
    }
    AbsShareMsg localAbsShareMsg;
    for (;;)
    {
      paramChatMessage = structingMsg;
      if ((paramChatMessage == null) || (!(paramChatMessage instanceof AbsShareMsg))) {
        break label187;
      }
      localAbsShareMsg = (AbsShareMsg)paramChatMessage;
      if (mMsgServiceID != 35) {
        break;
      }
      localStringBuilder.delete(0, localStringBuilder.length());
      localStringBuilder.append(mMsgBrief);
      localStringBuilder.append(localAbsShareMsg.getTalkBackStr());
      localStringBuilder.append("按钮");
      return localStringBuilder.toString();
      localStringBuilder.append("发来");
    }
    if (TextUtils.isEmpty(localAbsShareMsg.getTalkBackStr()))
    {
      if ((mContentTitle != null) && (mContentTitle.trim().length() > 0)) {
        localStringBuilder.append(mContentTitle);
      }
      if ((mContentSummary != null) && (mContentSummary.trim().length() > 0)) {
        localStringBuilder.append(mContentSummary);
      }
      localStringBuilder.append("按钮");
    }
    for (;;)
    {
      label187:
      return localStringBuilder.toString();
      localStringBuilder.append(localAbsShareMsg.getTalkBackStr());
      localStringBuilder.append("按钮");
    }
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    Object localObject5 = AIOGallerySceneWithBusiness.a(paramChatMessage);
    Object localObject1;
    if (paramInt == 2131296308) {
      if ((paramChatMessage != null) && ((paramChatMessage instanceof MessageForStructing)))
      {
        paramContext = (MessageForStructing)paramChatMessage;
        if ((structingMsg != null) && ((structingMsg instanceof StructMsgForImageShare)))
        {
          paramContext = (StructMsgForImageShare)structingMsg;
          paramChatMessage = paramContext.getFirstImageElement();
          if (paramChatMessage != null)
          {
            paramChatMessage = jdField_a_of_type_ComTencentMobileqqDataMessageForPic;
            localObject1 = URLDrawable.getDrawable(URLDrawableHelper.a(paramChatMessage, 1), -1, -1, null, null, false);
            ((URLDrawable)localObject1).setTag(paramChatMessage);
            AIOGalleryUtils.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (URLDrawable)localObject1, frienduin, jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908), paramContext);
          }
        }
        if (AIOGallerySceneWithBusiness.a((String)localObject5)) {
          VipComicReportUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "3009", "2", "40053", AIOGallerySceneWithBusiness.b((String)localObject5), new String[] { "1", "", AIOGallerySceneWithBusiness.a((String)localObject5) });
        }
      }
    }
    Object localObject2;
    Object localObject3;
    Object localObject4;
    label419:
    label438:
    label718:
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
                    do
                    {
                      return;
                      if (paramInt != 2131298639) {
                        break;
                      }
                    } while ((paramChatMessage == null) || (!(paramChatMessage instanceof MessageForStructing)));
                    localObject1 = (MessageForStructing)paramChatMessage;
                  } while (structingMsg == null);
                  if (!(structingMsg instanceof StructMsgForImageShare)) {
                    break label438;
                  }
                  paramContext = (StructMsgForImageShare)structingMsg;
                  localObject2 = paramContext.getFirstImageElement();
                  if (localObject2 == null) {
                    break label718;
                  }
                  if (jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare == null) {
                    jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare = paramContext;
                  }
                  paramContext = ((StructMsgItemImage)localObject2).a();
                  localObject3 = ForwardUtils.a(jdField_a_of_type_AndroidContentContext, paramContext);
                  if (!new File(path).exists()) {
                    break;
                  }
                  o = path;
                  if (!TextUtils.isEmpty(o)) {
                    break label419;
                  }
                } while (!QLog.isColorLevel());
                QLog.d("StructingMsgItemBuilder", 2, "StructingMsgItemBuilder onMenuItemClicked forward imageElement.mShareImageUrl is null!!!");
                return;
                paramChatMessage = null;
                localObject4 = ((URLDrawable)localObject3).getURL().toString();
                if (AbsDownloader.a((String)localObject4))
                {
                  localObject4 = AbsDownloader.a((String)localObject4);
                  paramContext = paramChatMessage;
                  if (localObject4 != null)
                  {
                    paramContext = paramChatMessage;
                    if (((File)localObject4).exists()) {
                      paramContext = ((File)localObject4).getAbsolutePath();
                    }
                  }
                }
                for (;;)
                {
                  o = paramContext;
                  break;
                  localObject4 = AbsDownloader.a(URLDrawableHelper.a(paramContext, 65537).toString());
                  paramContext = paramChatMessage;
                  if (localObject4 != null)
                  {
                    paramContext = paramChatMessage;
                    if (((File)localObject4).exists()) {
                      paramContext = ((File)localObject4).getAbsolutePath();
                    }
                  }
                }
                if (!AbsDownloader.a(((URLDrawable)localObject3).getURL().toString())) {
                  ((URLDrawable)localObject3).startDownload();
                }
                paramContext = new Bundle();
                if ((structingMsg.source_puin != null) && (!"".equals(structingMsg.source_puin))) {
                  paramContext.putString("source_puin", structingMsg.source_puin);
                }
                paramContext.putInt("forward_type", -3);
                structingMsg.mCommentText = null;
                paramContext.putInt("structmsg_service_id", structingMsg.mMsgServiceID);
                paramContext.putByteArray("stuctmsg_bytes", structingMsg.getBytes());
                paramContext.putInt("accostType", structingMsg.sourceAccoutType);
                paramChatMessage = new Intent();
                paramChatMessage.putExtras(paramContext);
                ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
                paramContext = structingMsg.mMsgUrl;
                paramChatMessage = senderuin;
                localObject1 = Long.toString(structingMsg.msgId);
                ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005455", "0X8005455", 0, 0, paramChatMessage, paramContext, (String)localObject1, "");
                ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "", "", "", "");
              } while (!AIOGallerySceneWithBusiness.a((String)localObject5));
              VipComicReportUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "3009", "2", "40053", AIOGallerySceneWithBusiness.b((String)localObject5), new String[] { "2", "", AIOGallerySceneWithBusiness.a((String)localObject5) });
              return;
            } while (!QLog.isColorLevel());
            QLog.d("StructingMsgItemBuilder", 2, "StructingMsgItemBuilder onMenuItemClicked forward imageElement is null!!!");
            return;
            if (paramInt != 2131304463) {
              break;
            }
            ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
          } while (!AIOGallerySceneWithBusiness.a((String)localObject5));
          VipComicReportUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "3009", "2", "40053", AIOGallerySceneWithBusiness.b((String)localObject5), new String[] { "5", "", AIOGallerySceneWithBusiness.a((String)localObject5) });
          return;
          if (paramInt != 2131304473) {
            break;
          }
          super.b(paramChatMessage);
        } while (!AIOGallerySceneWithBusiness.a((String)localObject5));
        VipComicReportUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "3009", "2", "40053", AIOGallerySceneWithBusiness.b((String)localObject5), new String[] { "6", "", AIOGallerySceneWithBusiness.a((String)localObject5) });
        return;
        if (paramInt != 2131299653) {
          break;
        }
      } while ((paramChatMessage == null) || (!(paramChatMessage instanceof MessageForStructing)));
      paramContext = (MessageForStructing)paramChatMessage;
    } while (structingMsg == null);
    AbsShareMsg localAbsShareMsg = (AbsShareMsg)structingMsg;
    if ((localAbsShareMsg instanceof StructMsgForImageShare))
    {
      paramInt = 0;
      if (AIOGallerySceneWithBusiness.a((String)localObject5))
      {
        localObject1 = mMsgActionData.substring(mMsgActionData.indexOf("|") + 1).split("\\|");
        if ((localObject1.length < 8) || ((!localObject1[7].equals("link")) && (!localObject1[7].equals("scrawl_link")))) {
          break label2259;
        }
        paramInt = 1;
        if ((!localObject1[7].equals("scrawl_link")) || (localObject1.length <= 8)) {
          break label2254;
        }
        paramContext = localObject1[8];
      }
    }
    for (;;)
    {
      if ((paramInt == 0) && (!TextUtils.isEmpty(mMsg_A_ActionData)))
      {
        localObject1 = mMsg_A_ActionData.split("\\|");
        if ((localObject1.length >= 8) && (localObject1[7].equals("link"))) {
          paramInt = 1;
        }
      }
      for (;;)
      {
        label1075:
        if (paramInt != 0)
        {
          localObject2 = ((StructMsgForImageShare)localAbsShareMsg).getFirstImageElement();
          if (localObject2 == null) {
            break label2245;
          }
          if (jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare == null) {
            jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare = ((StructMsgForImageShare)localAbsShareMsg);
          }
          localObject4 = AIOGalleryUtils.a(((StructMsgItemImage)localObject2).a());
          localObject3 = ((AIOImageData)localObject4).a(4);
          localObject2 = localObject3;
          if (localObject3 == null) {
            localObject2 = ((AIOImageData)localObject4).a(2);
          }
          if (localObject2 == null) {
            break label2245;
          }
        }
        label1738:
        label2245:
        for (localObject2 = ((File)localObject2).getAbsolutePath();; localObject2 = null)
        {
          Object localObject6 = localObject1[3] + "第" + localObject1[5] + "页";
          localObject4 = "http://imgcache.qq.com/club/client/comic/release/html/read_share.html?_bid=354&ADTAG=comic.plugin.read&_wv=5123&id=" + localObject1[0] + "&name=" + URLEncoder.encode(localObject1[1]) + "&sectionID=" + localObject1[2] + "&sectionName=" + URLEncoder.encode(localObject1[3]) + "&pageID=" + localObject1[4] + "&page=" + localObject1[5] + "&type=" + localObject1[6];
          localObject3 = localObject4;
          if (!TextUtils.isEmpty(paramContext)) {
            localObject3 = (String)localObject4 + "&scrawl_link=" + URLEncoder.encode(paramContext);
          }
          new QfavBuilder(6).a("nLinkType", 0).b("sTitle", localObject1[1]).b("sUrl", (String)localObject3).a("bAppShare", false).a("lAppId", 0L).b("sPublisher", mSourceName).b("sBrief", (String)localObject6).b("sPath", (String)localObject2).b("sResUrl", mSourceUrl).a("lCategory", 1L).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
          QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 2);
          VipComicReportUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "3009", "2", "40053", AIOGallerySceneWithBusiness.b((String)localObject5), new String[] { "3", "", AIOGallerySceneWithBusiness.a((String)localObject5) });
          if (paramInt != 0) {
            break;
          }
          paramContext = QfavUtil.a((StructMsgForImageShare)localAbsShareMsg);
          if (paramContext == null) {
            break;
          }
          QfavBuilder.a(q, uinType, p, c, o, d).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
          QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 3);
          return;
          paramInt = 0;
          break label1075;
          int i;
          if (!TextUtils.isEmpty(mMsgActionData))
          {
            String[] arrayOfString1 = mMsgActionData.split("&");
            i = arrayOfString1.length;
            localObject3 = null;
            localObject2 = null;
            localObject1 = null;
            paramContext = null;
            paramInt = 0;
            if (paramInt < i)
            {
              String[] arrayOfString2 = arrayOfString1[paramInt].split("=");
              localObject4 = localObject3;
              localObject5 = localObject2;
              localObject6 = localObject1;
              Object localObject7 = paramContext;
              if (arrayOfString2.length > 1)
              {
                if (!arrayOfString2[0].trim().equals("lat")) {
                  break label1738;
                }
                localObject7 = arrayOfString2[1];
                localObject6 = localObject1;
                localObject5 = localObject2;
                localObject4 = localObject3;
              }
              for (;;)
              {
                paramInt += 1;
                localObject3 = localObject4;
                localObject2 = localObject5;
                localObject1 = localObject6;
                paramContext = (Context)localObject7;
                break;
                if (arrayOfString2[0].trim().equals("lon"))
                {
                  localObject6 = arrayOfString2[1];
                  localObject4 = localObject3;
                  localObject5 = localObject2;
                  localObject7 = paramContext;
                }
                else if (arrayOfString2[0].trim().equals("loc"))
                {
                  localObject5 = arrayOfString2[1];
                  localObject4 = localObject3;
                  localObject6 = localObject1;
                  localObject7 = paramContext;
                }
                else
                {
                  localObject4 = localObject3;
                  localObject5 = localObject2;
                  localObject6 = localObject1;
                  localObject7 = paramContext;
                  if (arrayOfString2[0].trim().equals("title"))
                  {
                    localObject4 = arrayOfString2[1];
                    localObject5 = localObject2;
                    localObject6 = localObject1;
                    localObject7 = paramContext;
                  }
                }
              }
            }
            if ((mMsgServiceID == 32) && (!TextUtils.isEmpty(paramContext)) && (!TextUtils.isEmpty((CharSequence)localObject1)) && (!TextUtils.isEmpty((CharSequence)localObject2)))
            {
              QfavBuilder.a(Float.valueOf(paramContext).floatValue(), Float.valueOf((String)localObject1).floatValue(), (String)localObject3, (String)localObject2, null).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
              QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 7);
              return;
            }
          }
          paramContext = QfavUtil.a(localAbsShareMsg.getXmlBytes());
          if ((localAbsShareMsg instanceof StructMsgForAudioShare)) {
            i = 10;
          }
          for (paramInt = 2;; paramInt = 0)
          {
            QfavBuilder.a(paramInt, mContentTitle, mMsgUrl, mSourceName, mContentSummary, mContentCover, mContentSrc, paramContext, false, 0L).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
            QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, i);
            return;
            if (paramInt == 2131304469)
            {
              paramContext = (MessageForStructing)paramChatMessage;
              if ((paramContext == null) || (structingMsg == null) || (!"web".equals(structingMsg.mMsgAction)) || (structingMsg.mMsgUrl == null)) {
                break;
              }
              ((ClipboardManager)jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setText(structingMsg.mMsgUrl);
              return;
            }
            if (paramInt == 2131304472)
            {
              b(paramChatMessage);
              return;
            }
            if (paramInt == 2131304475)
            {
              ThreadManager.a(new lav(this, paramChatMessage, paramContext), 8, null, false);
              return;
            }
            if (paramInt == 2131296347)
            {
              super.a(paramChatMessage);
              if (!AIOGallerySceneWithBusiness.a((String)localObject5)) {
                break;
              }
              VipComicReportUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "3009", "2", "40053", AIOGallerySceneWithBusiness.b((String)localObject5), new String[] { "4", "", AIOGallerySceneWithBusiness.a((String)localObject5) });
              return;
            }
            super.a(paramInt, paramContext, paramChatMessage);
            return;
            i = 2;
          }
        }
      }
      label2254:
      paramContext = null;
      continue;
      label2259:
      paramContext = null;
      paramInt = 0;
    }
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    if (aisMultiMsg) {}
    Object localObject1;
    Context localContext;
    Object localObject2;
    do
    {
      do
      {
        return;
        localObject1 = AIOUtils.a(paramView);
      } while (!StructingMsgItemBuilder.StructingMsgViewHolder.class.isInstance(localObject1));
      localContext = jdField_a_of_type_AndroidContentContext;
      localObject1 = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      localObject2 = a((ChatMessage)localObject1);
      if (localObject2 != null)
      {
        a(paramView, (StructMsgForGeneralShare)localObject2);
        return;
      }
      paramView = localContext.getString(2131367611);
      localObject2 = localContext.getString(2131367612);
    } while (!((ChatMessage)localObject1).isSendFromLocal());
    DialogUtil.a(localContext, 230, paramView, (String)localObject2, new lbh(this, (ChatMessage)localObject1, localContext), new law(this)).show();
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    if (!BaseChatItemLayout.class.isInstance(paramView)) {}
    label10:
    ChatMessage localChatMessage;
    do
    {
      do
      {
        do
        {
          break label10;
          do
          {
            return;
          } while ((e != 1) && (e != 131075));
          paramView = AIOUtils.a(paramView);
        } while (!StructingMsgItemBuilder.StructingMsgViewHolder.class.isInstance(paramView));
        paramView = (StructingMsgItemBuilder.StructingMsgViewHolder)paramView;
      } while ((!StructingMsgItemBuilder.StructingMsgViewHolder.class.isInstance(paramView)) || (jdField_a_of_type_AndroidWidgetRelativeLayout == null) || (!MessageForStructing.class.isInstance(jdField_a_of_type_ComTencentMobileqqDataChatMessage)));
      localChatMessage = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      if ((uniseq == c) && (localChatMessage.isSendFromLocal()))
      {
        if (QLog.isColorLevel()) {
          QLog.d("structMsg", 2, "handleMessage status = " + paramInt1 + ", retCode = " + paramInt2 + ", message.uniseq = " + uniseq + ", file.uniseq = " + c);
        }
        a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq), paramView);
        if (paramInt1 == 1005) {
          a();
        }
      }
    } while ((uniseq != c) || (paramInt1 != 2003) || (!(structingMsg instanceof StructMsgForImageShare)));
    jdField_a_of_type_AndroidWidgetRelativeLayout.removeAllViews();
    paramFileMsg = new Bundle();
    jdField_a_of_type_AndroidWidgetRelativeLayout.addView(structingMsg.getView(jdField_a_of_type_AndroidContentContext, null, null, paramFileMsg));
  }
  
  public void a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage)
  {
    paramXListView = AIOUtils.a(paramView);
    if ((paramXListView instanceof StructingMsgItemBuilder.StructingMsgViewHolder)) {}
    for (paramXListView = (StructingMsgItemBuilder.StructingMsgViewHolder)paramXListView;; paramXListView = null)
    {
      if (paramXListView != null)
      {
        paramXListView = (ViewGroup)jdField_a_of_type_AndroidWidgetRelativeLayout.getChildAt(0);
        int i = paramXListView.getChildCount();
        paramInt = 0;
        while (paramInt < i)
        {
          if ((paramXListView.getChildAt(paramInt).getTag() instanceof StructMsgItemLayout10.ViewHolder))
          {
            paramView = (StructMsgItemLayout10.ViewHolder)paramXListView.getChildAt(paramInt).getTag();
            if ((jdField_a_of_type_AndroidViewView.getTag() instanceof StructMsgItemPAAudio.ViewHolder))
            {
              paramView = (ImageView)jdField_a_of_type_AndroidViewView.getTag()).c;
              paramView.clearAnimation();
              paramView.setBackgroundResource(2130838647);
            }
          }
          paramInt += 1;
        }
      }
      return;
    }
  }
  
  public boolean a(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, String paramString9, String paramString10, String paramString11, String paramString12, long paramLong, String paramString13)
  {
    String str1 = "mqqapi://app/action?pkg=com.tencent.mobileqq&cmp=com.tencent.biz.pubaccount.AccountDetailActivity&uin=" + paramString1;
    String str2 = "mqqapi://card/show_pslcard?src_type=internal&card_type=public_account&uin=" + paramString1 + "&version=1";
    paramString1 = new Intent();
    paramString1.setClass(paramContext, ForwardRecentActivity.class);
    paramString1.putExtra("key_flag_from_plugin", true);
    paramString1.putExtra("strurt_msgid", String.valueOf(paramLong));
    paramString1.putExtra("struct_uin", paramString13);
    paramString1.putExtra("forward_type", 1001);
    paramString1.putExtra("image_url_remote", paramString4);
    paramString1.putExtra("title", paramString2);
    paramString1.putExtra("desc", paramString3);
    paramString1.putExtra("pluginName", "public_account");
    paramString1.putExtra("detail_url", paramString6);
    paramString1.putExtra("app_name", paramString5);
    if (("replyMsg".equals(paramString8)) || ("replyCmd".equals(paramString8))) {}
    for (;;)
    {
      paramString1.putExtra("req_type", 1);
      paramString1.putExtra("req_share_id", -1);
      paramString1.putExtra("brief_key", paramString12);
      paramString1.putExtra("struct_share_key_source_icon", paramString7);
      paramString1.putExtra("struct_share_key_source_action", "plugin");
      paramString1.putExtra("struct_share_key_source_action_data", str1);
      paramString1.putExtra("struct_share_key_source_a_action_data", str1);
      paramString1.putExtra("struct_share_key_source_i_action_data", str2);
      paramString2 = StructMsgFactory.a(paramString1.getExtras());
      if (paramString2 == null) {
        break;
      }
      paramString1.putExtra("stuctmsg_bytes", paramString2.getBytes());
      paramString1.putExtra("k_struct_forward", true);
      paramContext.startActivity(paramString1);
      return true;
      paramString1.putExtra("struct_share_key_content_action", paramString8);
      paramString1.putExtra("struct_share_key_content_action_DATA", paramString9);
      paramString1.putExtra("struct_share_key_content_a_action_DATA", paramString10);
      paramString1.putExtra("struct_share_key_content_i_action_DATA", paramString11);
    }
    return false;
  }
  
  protected boolean a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    if (isMultiMsg) {
      return false;
    }
    Object localObject = (MessageForStructing)paramChatMessage;
    if ((structingMsg != null) && (StructMsgForImageShare.class.isInstance(structingMsg)) && (paramChatMessage.isSendFromLocal()))
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq);
      if ((localObject instanceof MessageForStructing))
      {
        localObject = (StructMsgForImageShare)structingMsg;
        if (localObject != null)
        {
          localObject = ((StructMsgForImageShare)localObject).getFirstImageElement();
          if ((localObject != null) && (d <= 0L))
          {
            paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
            if ((paramChatMessage instanceof BaseTransProcessor))
            {
              if (((BaseTransProcessor)paramChatMessage).c() == 1005L) {}
              for (boolean bool = true;; bool = false) {
                return bool;
              }
            }
            return true;
          }
        }
      }
    }
    return super.a(paramChatMessage, paramBaseChatItemLayout);
  }
  
  public boolean a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage)
  {
    paramXListView = AIOUtils.a(paramView);
    if ((paramXListView instanceof StructingMsgItemBuilder.StructingMsgViewHolder)) {}
    for (paramXListView = (StructingMsgItemBuilder.StructingMsgViewHolder)paramXListView;; paramXListView = null)
    {
      if (paramXListView != null)
      {
        paramXListView = (ViewGroup)jdField_a_of_type_AndroidWidgetRelativeLayout.getChildAt(0);
        int i = paramXListView.getChildCount();
        paramInt = 0;
        while (paramInt < i)
        {
          if ((paramXListView.getChildAt(paramInt).getTag() instanceof StructMsgItemLayout10.ViewHolder))
          {
            paramView = (StructMsgItemLayout10.ViewHolder)paramXListView.getChildAt(paramInt).getTag();
            if ((jdField_a_of_type_AndroidViewView.getTag() instanceof StructMsgItemPAAudio.ViewHolder)) {
              return FileUtils.b(jdField_a_of_type_AndroidViewView.getTag()).jdField_a_of_type_JavaLangString);
            }
          }
          paramInt += 1;
        }
      }
      return false;
    }
  }
  
  public boolean a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage, AudioPlayer paramAudioPlayer)
  {
    Object localObject = AIOUtils.a(paramView);
    if ((localObject instanceof StructingMsgItemBuilder.StructingMsgViewHolder)) {}
    for (localObject = (StructingMsgItemBuilder.StructingMsgViewHolder)localObject;; localObject = null)
    {
      if (localObject != null)
      {
        localObject = (ViewGroup)jdField_a_of_type_AndroidWidgetRelativeLayout.getChildAt(0);
        int j = ((ViewGroup)localObject).getChildCount();
        int i = 0;
        while (i < j)
        {
          if (((((ViewGroup)localObject).getChildAt(i).getTag() instanceof StructMsgItemLayout10.ViewHolder)) && (a(paramXListView, paramInt, paramView, paramChatMessage)))
          {
            StructMsgItemLayout10.ViewHolder localViewHolder = (StructMsgItemLayout10.ViewHolder)((ViewGroup)localObject).getChildAt(i).getTag();
            if ((jdField_a_of_type_AndroidViewView.getTag() instanceof StructMsgItemPAAudio.ViewHolder)) {
              paramAudioPlayer.a(jdField_a_of_type_AndroidViewView.getTag()).jdField_a_of_type_JavaLangString);
            }
          }
          i += 1;
        }
        return true;
      }
      return false;
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    int k = 0;
    MessageForStructing localMessageForStructing = (MessageForStructing)AIOUtils.a(paramView);
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    AbsStructMsg localAbsStructMsg = structingMsg;
    int j;
    if (localAbsStructMsg != null)
    {
      if (((localAbsStructMsg instanceof AbsShareMsg)) && (mMsgException))
      {
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        return localQQCustomMenu.a();
      }
      if (mMsgServiceID == 61)
      {
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        return localQQCustomMenu.a();
      }
      if (mMsgServiceID == 70)
      {
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
        return localQQCustomMenu.a();
      }
      if ((localAbsStructMsg instanceof StructMsgForHypertext))
      {
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
        return localQQCustomMenu.a();
      }
      if ((localAbsStructMsg instanceof StructMsgForImageShare))
      {
        StructMsgItemImage localStructMsgItemImage = ((StructMsgForImageShare)localAbsStructMsg).getFirstImageElement();
        paramView = null;
        if (localStructMsgItemImage != null) {
          paramView = jdField_a_of_type_ComTencentMobileqqDataMessageForPic;
        }
        if ((paramView != null) && (URLDrawableHelper.a(jdField_a_of_type_AndroidContentContext, paramView, 65537)))
        {
          i = 1;
          if ((paramView == null) || (imageType != 2000)) {
            break label274;
          }
        }
        label274:
        for (j = 1;; j = 0)
        {
          if ((i != 0) || (j != 0)) {
            break label279;
          }
          return localQQCustomMenu.a();
          i = 0;
          break;
        }
        label279:
        localQQCustomMenu.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
      }
      paramView = jdField_a_of_type_AndroidContentContext.getResources();
      if (fwFlag == 1) {
        break label765;
      }
      if (localAbsStructMsg.hasFlag(8)) {
        localQQCustomMenu.a(2131304469, paramView.getString(2131370811));
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1008) {
        break label720;
      }
      if (!localAbsStructMsg.hasFlag(32))
      {
        localQQCustomMenu.a(2131304475, paramView.getString(2131368986));
        a(localMessageForStructing, localQQCustomMenu);
        if ((!localAbsStructMsg.hasFlag(2)) && ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1008) || (!TextUtils.isEmpty(mMsgUrl)))) {
          break label747;
        }
      }
    }
    else
    {
      label418:
      if ((localMessageForStructing.isSend()) && (extraflag != 32768) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(localMessageForStructing))) {
        if ((istroop != 1) || (localAbsStructMsg == null) || ((mMsgServiceID != 23) && (mMsgServiceID != 19) && (mMsgServiceID != 60) && (!"群问问".equals(localAbsStructMsg.getSourceName())) && ((mMsgUrl == null) || (!mMsgUrl.startsWith("http://qqweb.qq.com/m/qunactivity"))))) {
          break label781;
        }
      }
    }
    label720:
    label747:
    label765:
    label781:
    for (int i = 0;; i = 1)
    {
      if (((1008 != istroop) || (!AppConstants.ad.equals(frienduin))) && ((mMsgUrl == null) || (!mMsgUrl.startsWith("http://ti.qq.com/remind/view.html"))))
      {
        j = i;
        if (mMsgUrl != null)
        {
          j = i;
          if (!mMsgUrl.startsWith("https://mqq.tenpay.com")) {}
        }
      }
      else
      {
        j = 0;
      }
      if ((localAbsStructMsg != null) && (mMsgServiceID == 49)) {}
      for (i = k;; i = j)
      {
        if (i != 0) {
          a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, localMessageForStructing);
        }
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        if ((localAbsStructMsg != null) && (mMsgServiceID != 49)) {
          super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
        }
        return localQQCustomMenu.a();
        if (localAbsStructMsg.hasFlag(1)) {
          break;
        }
        localQQCustomMenu.a(2131298639, paramView.getString(2131368986));
        break;
        if (localAbsStructMsg.hasFlag(1)) {
          break;
        }
        localQQCustomMenu.a(2131298639, paramView.getString(2131368986));
        break;
        localQQCustomMenu.a(2131299653, paramView.getString(2131365741));
        break label418;
        a(localMessageForStructing, localQQCustomMenu);
        break label418;
      }
    }
  }
  
  protected void b(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    AbsStructMsg localAbsStructMsg = structingMsg;
    if ((localAbsStructMsg != null) && (StructMsgForImageShare.class.isInstance(localAbsStructMsg)))
    {
      paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      if ((paramChatMessage != null) && (BaseTransProcessor.class.isInstance(paramChatMessage)))
      {
        a(paramBaseChatItemLayout, ((BaseTransProcessor)paramChatMessage).a(), 0, 0);
        return;
      }
      paramBaseChatItemLayout.setProgressVisable(false);
      return;
    }
    super.b(paramChatMessage, paramBaseChatItemLayout);
  }
  
  public boolean b(ChatMessage paramChatMessage)
  {
    return true;
  }
  
  protected void d()
  {
    long l1 = 1L;
    VipGiftManager localVipGiftManager = (VipGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(75);
    VipGiftDownloadInfo localVipGiftDownloadInfo = localVipGiftManager.a();
    if ((localVipGiftDownloadInfo != null) && (d == 0L) && (a != 0L)) {
      localVipGiftManager.a(a);
    }
    long l2;
    if ((localVipGiftDownloadInfo != null) && (d == 1L))
    {
      l2 = h - (NetConnInfoCenter.getServerTimeMillis() - e);
      if (l2 > 0L) {
        break label127;
      }
    }
    for (;;)
    {
      new Handler(jdField_a_of_type_AndroidContentContext.getMainLooper()).postDelayed(new laz(this, localVipGiftDownloadInfo, localVipGiftManager), l1);
      return;
      label127:
      l1 = l2;
    }
  }
}
