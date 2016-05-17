package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.AppShareID;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.config.ConfigUtil;
import com.tencent.mobileqq.transfile.RichMediaUtil;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.utils.AppShareIDUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.open.adapter.OpenAppClient;
import java.net.URL;
import java.util.HashSet;

public class AppSharePicItemBuilder
  extends BaseBubbleBuilder
{
  private static final String jdField_b_of_type_JavaLangString = AppSharePicItemBuilder.class.getSimpleName();
  HashSet a;
  private final float jdField_b_of_type_Float;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public AppSharePicItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_JavaUtilHashSet = new HashSet();
    jdField_b_of_type_Float = getResourcesgetDisplayMetricsdensity;
  }
  
  private void a(AppSharePicItemBuilder.Holder paramHolder)
  {
    if (jdField_a_of_type_ComTencentMobileqqDataMessageForPic.isMixed)
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqDataMessageForPic;
      if (msgtype == 64504)
      {
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        return;
      }
      String str2 = jdField_a_of_type_AndroidContentContext.getString(2131369045);
      String str1;
      if (shareAppID != 0L)
      {
        localObject = AppShareIDUtil.a(shareAppID);
        AppShareID localAppShareID = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((String)localObject);
        if (localAppShareID != null)
        {
          str1 = str2;
          if (messagetail != null) {
            str1 = jdField_a_of_type_AndroidContentContext.getString(2131369044) + messagetail;
          }
        }
      }
      for (;;)
      {
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.setText(str1);
        return;
        str1 = str2;
        if (!jdField_a_of_type_JavaUtilHashSet.contains(localObject))
        {
          ConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), (String)localObject);
          jdField_a_of_type_JavaUtilHashSet.add(localObject);
          str1 = str2;
          continue;
          str1 = str2;
          if (msgtype == 62535) {
            str1 = jdField_a_of_type_AndroidContentContext.getString(2131369497);
          }
        }
      }
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  private void a(MessageForPic paramMessageForPic)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("schemaurl", action);
    localBundle.putString("uin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    localBundle.putString("vkey", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d());
    OpenAppClient.a((Activity)jdField_a_of_type_AndroidContentContext, localBundle);
  }
  
  public static void a(MessageForPic paramMessageForPic, String paramString1, String paramString2)
  {
    RichMediaUtil.b(istroop, paramMessageForPic.isSendFromLocal(), 65537, String.valueOf(uniseq), jdField_b_of_type_JavaLangString + "." + paramString1, paramString2);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = (AppSharePicItemBuilder.Holder)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new LinearLayout(jdField_a_of_type_AndroidContentContext);
      paramViewHolder.setOrientation(1);
      paramView = new ChatThumbView(jdField_a_of_type_AndroidContentContext);
      paramView.setId(2131299562);
      if (!jdField_a_of_type_Boolean) {
        paramView.setAdjustViewBounds(true);
      }
      paramView.setMaxWidth((int)(jdField_b_of_type_Float * 224.0F + 0.5F));
      paramView.setMaxHeight((int)(jdField_b_of_type_Float * 224.0F + 0.5F));
      Object localObject = new LinearLayout.LayoutParams(-2, -2);
      int i = (int)(jdField_b_of_type_Float * 5.0F + 0.5F);
      leftMargin = i;
      topMargin = i;
      rightMargin = i;
      bottomMargin = i;
      paramViewHolder.addView(paramView, (ViewGroup.LayoutParams)localObject);
      localObject = new TextView(jdField_a_of_type_AndroidContentContext);
      ((TextView)localObject).setTextColor(-16777216);
      ((TextView)localObject).setTextSize(2, 12.0F);
      LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
      leftMargin = i;
      rightMargin = i;
      bottomMargin = i;
      paramViewHolder.addView((View)localObject, localLayoutParams);
      paramViewHolder.setOnClickListener(this);
      paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
      paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView = paramView;
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localObject);
    }
    paramChatMessage = (MessageForPic)paramChatMessage;
    jdField_a_of_type_ComTencentMobileqqDataMessageForPic = paramChatMessage;
    if (!paramChatMessage.isSendFromLocal())
    {
      paramView = URLDrawableHelper.a(paramChatMessage, 1);
      if ((jdField_a_of_type_ComTencentImageURLDrawable == null) || (!jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramView)))
      {
        paramChatMessage = PicItemBuilder.a(jdField_a_of_type_AndroidContentContext, paramChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView);
        jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView.setImageDrawable(paramChatMessage);
        jdField_a_of_type_ComTencentImageURLDrawable = paramChatMessage;
      }
    }
    a(paramBaseChatItemLayout);
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new AppSharePicItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "定向分享图片";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    if (paramInt == 2131304463) {
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
    }
    while (paramInt != 2131304473) {
      return;
    }
    super.b(paramChatMessage);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(paramView, jdField_a_of_type_AndroidContentContext);
    return paramView.a();
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
    if (super.a()) {}
    do
    {
      Object localObject;
      do
      {
        do
        {
          return;
          if (paramView.getId() != 2131296325) {
            break;
          }
          localObject = (AppSharePicItemBuilder.Holder)AIOUtils.a(paramView);
          paramView = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
          localObject = jdField_a_of_type_ComTencentImageURLDrawable;
        } while (paramView.isSendFromLocal());
        switch (((URLDrawable)localObject).getStatus())
        {
        default: 
          return;
        }
      } while (((URLDrawable)localObject).isDownloadStarted());
      ((URLDrawable)localObject).startDownload();
      return;
      ((URLDrawable)localObject).restartDownload();
      return;
      if (msgtype == 62535)
      {
        a(paramView);
        return;
      }
      if (msgtype == 62531)
      {
        ChatActivityUtils.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, action, shareAppID, msgtype);
        return;
      }
    } while ((msgtype != 62536) && (msgtype != 62532) && (msgtype != 64504));
    ChatActivityUtils.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, action, shareAppID, msgtype, null);
    return;
    super.onClick(paramView);
  }
}
