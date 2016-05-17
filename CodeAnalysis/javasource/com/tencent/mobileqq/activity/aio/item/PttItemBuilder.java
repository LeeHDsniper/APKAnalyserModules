package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Paint;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.StatFs;
import android.text.SpannableString;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AudioPlayer;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager.Callback;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.preop.PTTPreDownloader;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.stt.SttManager;
import com.tencent.mobileqq.stt.SttManager.ISttListener;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.PttInfoCollector;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.OffsetableImageSpan;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.XListView;
import cooperation.qqfav.QfavUtil;
import cooperation.qqfav.widget.QfavMicroPhoneDialog;
import java.io.File;
import kzg;
import kzh;
import kzi;
import mqq.manager.ServerConfigManager.ConfigType;

public class PttItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback, MediaPlayerManager.Callback, SttManager.ISttListener
{
  public static final String b = "ConvertText_MaxPtt";
  public static final String c = "Normal_MaxPtt";
  public static final String d = "VIP_MaxPtt";
  private static final boolean d = AppSetting.i;
  public static final String e = "SVIP_MaxPtt";
  private static final String f = "PttItemBuilder";
  private static final String g = "param_FailCode";
  public static final int h = 0;
  public static final int i = 1;
  public static final int j = 4;
  public static final int k = 1;
  public static final int l = 2;
  private static final int m = 20;
  private static final int n = 1;
  private static final int o = 2;
  private SpannableString jdField_a_of_type_AndroidTextSpannableString;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private BaseChatPie jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
  private SttManager jdField_a_of_type_ComTencentMobileqqSttSttManager;
  private SpannableString b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public PttItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner, BaseChatPie paramBaseChatPie)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_ComTencentMobileqqSttSttManager = ((SttManager)paramQQAppInterface.getManager(16));
    jdField_a_of_type_ComTencentMobileqqSttSttManager.a(null);
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
  }
  
  public static int a(Context paramContext, int paramInt1, String paramString, Paint paramPaint, int paramInt2)
  {
    int i1 = Math.min(60, Math.max(1, paramInt1));
    int i2;
    float f1;
    if (i1 > 40)
    {
      i1 += 40;
      i2 = AIOUtils.a(i1 + 20, paramContext.getResources());
      if ((paramString == null) || (paramPaint == null)) {
        break label173;
      }
      i1 = BaseChatItemLayout.i - BaseChatItemLayout.m - BaseChatItemLayout.n - 32;
      f1 = paramPaint.measureText(paramString) + paramInt2;
      if (f1 <= i1) {
        break label176;
      }
      f1 = i1;
    }
    label173:
    label176:
    for (;;)
    {
      float f2;
      if (paramInt1 > 99)
      {
        f2 = 38.0F;
        int i3 = AIOUtils.a(f2, paramContext.getResources());
        paramInt2 = i2 + i3;
        paramInt1 = paramInt2;
        if (paramInt2 > i1) {
          paramInt1 = i1;
        }
        return Math.max(paramInt1, (int)f1) - i3;
        i1 *= 2;
        break;
      }
      if (paramInt1 > 9) {}
      for (paramInt1 = 34;; paramInt1 = 30)
      {
        f2 = paramInt1;
        break;
      }
      return i2;
    }
  }
  
  public static int a(QQAppInterface paramQQAppInterface, MessageForPtt paramMessageForPtt)
  {
    int i2 = 999;
    int i3 = 1005;
    if (paramMessageForPtt == null) {
      return 0;
    }
    int i1;
    if (paramMessageForPtt.isSendFromLocal()) {
      if ((url != null) && (url.startsWith(AppConstants.bb))) {
        if (fileSize > 0L) {
          i1 = 1003;
        }
      }
    }
    for (;;)
    {
      return i1;
      i1 = i3;
      if (fileSize != -1L) {
        if (fileSize == -2L)
        {
          if (a(paramMessageForPtt))
          {
            i1 = 999;
          }
          else
          {
            fileSize = -1L;
            i1 = i3;
          }
        }
        else
        {
          if (fileSize == -3L)
          {
            i3 = paramQQAppInterface.a().b(frienduin, paramMessageForPtt.getLocalFilePath(), uniseq);
            if ((i3 == 1005) || (i3 == -1))
            {
              fileSize = -1L;
              i1 = 1005;
            }
            for (;;)
            {
              break;
              i1 = i2;
              if (i3 != 7000) {
                i1 = 1001;
              }
            }
          }
          i1 = paramQQAppInterface.a().b(frienduin, paramMessageForPtt.getLocalFilePath(), uniseq);
          continue;
          i1 = 1004;
          continue;
          if (QLog.isColorLevel()) {
            QLog.d("PttItemBuilder", 2, "handlePttItem recieve friendUin " + frienduin + " url " + url + " urlAtServer " + urlAtServer + " uniseq " + uniseq);
          }
          if (paramMessageForPtt != null)
          {
            i2 = PTTPreDownloader.a(paramQQAppInterface, paramMessageForPtt);
            i1 = i2;
            if (QLog.isColorLevel())
            {
              QLog.d("PttItemBuilder", 2, "handlePttItem recieve status " + i2 + "   url " + url + " uniseq " + uniseq);
              i1 = i2;
            }
          }
          else
          {
            i1 = 0;
          }
        }
      }
    }
  }
  
  public static int a(QQAppInterface paramQQAppInterface, String paramString)
  {
    int i2 = 120;
    paramQQAppInterface = paramQQAppInterface.a(ServerConfigManager.ConfigType.common, paramString);
    if (QLog.isColorLevel()) {
      QLog.d("PttItemBuilder", 2, "key = " + paramString + ", time = " + paramQQAppInterface);
    }
    if (paramQQAppInterface != null) {}
    do
    {
      do
      {
        do
        {
          try
          {
            i1 = Integer.valueOf(paramQQAppInterface).intValue();
            if (i1 > 0) {
              return i1;
            }
          }
          catch (Exception paramQQAppInterface)
          {
            if (QLog.isColorLevel()) {
              QLog.e("PttItemBuilder", 2, paramQQAppInterface.toString());
            }
          }
          i1 = i2;
        } while ("ConvertText_MaxPtt".equals(paramString));
        i1 = i2;
      } while ("Normal_MaxPtt".equals(paramString));
      if ("VIP_MaxPtt".equals(paramString)) {
        return 180;
      }
      int i1 = i2;
    } while (!"SVIP_MaxPtt".equals(paramString));
    return 300;
  }
  
  public static String a(int paramInt)
  {
    String str = "";
    int i1 = paramInt / 60;
    if (i1 > 0) {
      str = i1 + "'";
    }
    return str + paramInt % 60 + "\"";
  }
  
  private void a(MessageForPtt paramMessageForPtt)
  {
    isReadPtt = true;
    paramMessageForPtt.serial();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, uniseq, msgData);
  }
  
  protected static boolean a(MessageForPtt paramMessageForPtt)
  {
    String str = QQRecorder.a();
    return (fileSize == -2L) && (!TextUtils.isEmpty(str)) && (str.equals(paramMessageForPtt.getLocalFilePath()));
  }
  
  private boolean d(ChatMessage paramChatMessage)
  {
    return vipBubbleID >= 1L;
  }
  
  private void e()
  {
    BluetoothAdapter localBluetoothAdapter;
    if (Build.VERSION.SDK_INT >= 15)
    {
      localBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
      if (localBluetoothAdapter != null) {}
    }
    else
    {
      return;
    }
    if (!localBluetoothAdapter.isEnabled())
    {
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPttPlayBluetooth", true, 0L, 0L, null, "");
      return;
    }
    if (localBluetoothAdapter.getProfileConnectionState(2) == 2)
    {
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPttPlayBluetooth", true, 0L, 0L, null, "");
      return;
    }
    if (localBluetoothAdapter.getProfileConnectionState(1) == 2)
    {
      kzh localKzh = new kzh(this, localBluetoothAdapter);
      localBluetoothAdapter.getProfileProxy(jdField_a_of_type_AndroidContentContext, localKzh, 1);
      return;
    }
    StatisticCollector.a(BaseApplication.getContext()).a(null, "actPttPlayBluetooth", true, 0L, 0L, null, "");
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 1;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = b(paramChatMessage, paramViewHolder, paramView, paramBaseChatItemLayout, paramOnLongClickAndTouchListener);
    FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout, this);
    if (d) {
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setOnClickListener(this);
    }
    return paramChatMessage;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new PttItemBuilder.Holder();
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return "发出语音按钮";
    }
    return "发来语音按钮";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    if ((paramChatMessage == null) || (!(paramChatMessage instanceof MessageForPtt))) {}
    MessageForPtt localMessageForPtt;
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            localMessageForPtt = (MessageForPtt)paramChatMessage;
            if (2131299653 != paramInt) {
              break;
            }
            paramInt = QQRecorder.a(localMessageForPtt);
          } while (paramInt <= 0);
          paramContext = new QfavMicroPhoneDialog(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, voiceType, new kzg(this, localMessageForPtt));
          if (paramContext.a(localMessageForPtt.getLocalFilePath(), paramInt)) {
            paramContext.show();
          }
          for (;;)
          {
            PttInfoCollector.a(1);
            return;
            QfavUtil.a(jdField_a_of_type_AndroidContentContext, 2131365758, 1);
          }
          if (paramInt == 2131304463)
          {
            ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
            PttInfoCollector.a(2);
            return;
          }
          if (paramInt == 2131304473)
          {
            PttInfoCollector.a(6);
            super.b(paramChatMessage);
            return;
          }
          if (paramInt == 2131304469)
          {
            if (TextUtils.isEmpty(sttText)) {}
            for (paramContext = jdField_a_of_type_AndroidContentContext.getString(2131367777);; paramContext = sttText)
            {
              PttInfoCollector.a(3);
              try
              {
                if (Build.VERSION.SDK_INT >= 11) {
                  break;
                }
                ((android.text.ClipboardManager)jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setText(paramContext);
                return;
              }
              catch (Exception paramContext)
              {
                return;
              }
            }
            ((android.content.ClipboardManager)jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setPrimaryClip(ClipData.newPlainText("msg", paramContext));
            return;
          }
          if (paramInt == 2131298639)
          {
            PttInfoCollector.a(4);
            if ((sttText != null) && (sttText.length() > 0))
            {
              paramContext = new Bundle();
              paramContext.putInt("forward_type", -1);
              paramContext.putString("forward_text", sttText);
              paramChatMessage = new Intent();
              paramChatMessage.putExtras(paramContext);
              ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "", "", "", "");
              return;
            }
            QQToast.a(jdField_a_of_type_AndroidContentContext, "语音消息无文本内容", 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
            return;
          }
          if (paramInt != 2131304470) {
            break;
          }
          paramInt = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a(localMessageForPtt);
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.delmsg", 2, "pos is:" + paramInt);
          }
        } while (paramInt < 0);
        int i1 = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.s();
        paramContext = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getChildAt(paramInt - i1);
      } while (paramContext == null);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005B40", "0X8005B40", 0, 0, "", "", "", "");
      paramContext = (PttItemBuilder.Holder)paramContext.getTag();
      PttInfoCollector.a(5);
      if (sttAbility == 1)
      {
        jdField_a_of_type_ComTencentMobileqqSttSttManager.a(localMessageForPtt);
        jdField_a_of_type_ComTencentMobileqqSttSttManager.a(this);
        a(paramContext, localMessageForPtt, a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageForPtt), c(localMessageForPtt));
        return;
      }
    } while ((sttAbility != 2) || (expandStt));
    expandStt = true;
    localMessageForPtt.serial();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, uniseq, msgData);
    a(paramContext, localMessageForPtt, a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageForPtt), c(localMessageForPtt));
    a(paramContext, jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout, localMessageForPtt, jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo);
    return;
    if (paramInt == 2131296347)
    {
      if (c(localMessageForPtt)) {
        MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(true);
      }
      super.a(paramChatMessage);
      return;
    }
    super.a(paramInt, paramContext, paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    MessageForPtt localMessageForPtt = (MessageForPtt)AIOUtils.a(paramView);
    paramView = (PttItemBuilder.Holder)AIOUtils.a(paramView);
    if (localMessageForPtt.isSendFromLocal())
    {
      paramView = ActionSheet.a(jdField_a_of_type_AndroidContentContext);
      paramView.a(2131367612);
      paramView.c(2131367611);
      paramView.d(2131366996);
      paramView.a(new kzi(this, localMessageForPtt, paramView));
      paramView.show();
      return;
    }
    if ((!Environment.getExternalStorageState().equals("mounted")) || (new StatFs(Environment.getExternalStorageDirectory().getAbsolutePath()).getAvailableBlocks() < 1))
    {
      if (!Environment.getExternalStorageState().equals("mounted"))
      {
        QQToast.a(BaseApplication.getContext(), 2131367411, 0).b(BaseApplication.getContext().getResources().getDimensionPixelSize(2131492908));
        return;
      }
      QQToast.a(BaseApplication.getContext(), 2131367412, 0).b(BaseApplication.getContext().getResources().getDimensionPixelSize(2131492908));
      return;
    }
    a(paramView, localMessageForPtt, true);
    if (QLog.isColorLevel()) {
      QLog.d("PTTItem->onErrorIconClick", 2, "fileStatus:2001|url " + url + "|uniseq " + uniseq);
    }
    a(paramView, localMessageForPtt, 2001, false);
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    if ((e != 2) || (paramInt1 == 2002) || (paramInt1 == 1002) || (paramInt1 == 2001)) {}
    MessageForPtt localMessageForPtt;
    do
    {
      return;
      localMessageForPtt = (MessageForPtt)AIOUtils.a(paramView);
    } while ((localMessageForPtt == null) || (uniseq != c));
    paramView = (PttItemBuilder.Holder)AIOUtils.a(paramView);
    if ((paramInt1 == 1003) || (paramInt1 == 2003))
    {
      paramInt2 = paramInt1;
      if (!b)
      {
        paramInt2 = paramInt1;
        if (paramInt1 == 2003)
        {
          a();
          paramInt2 = paramInt1;
        }
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("PTTItem->handleMessage", 2, "fileStatus:" + paramInt2 + "|url " + url + "|uniseq " + uniseq);
      }
      a(paramView, localMessageForPtt, paramInt2, c(localMessageForPtt));
      return;
      if ((M == 1005) || (M == 1004))
      {
        jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
        paramInt2 = paramInt1;
      }
      else if (fileSize == -2L)
      {
        paramInt2 = 999;
      }
      else if (fileSize == -3L)
      {
        paramInt2 = 1001;
      }
      else if (fileSize == -1L)
      {
        paramInt2 = 1005;
      }
      else
      {
        paramInt2 = paramInt1;
        if (paramInt1 == 2005)
        {
          fileSize = -4L;
          paramInt2 = paramInt1;
        }
      }
    }
  }
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo)
  {
    PttItemBuilder.Holder localHolder = (PttItemBuilder.Holder)paramViewHolder;
    if ((c == 0) || (!paramBubbleInfo.a()))
    {
      paramViewHolder = paramView.getResources();
      if (paramChatMessage.isSend())
      {
        paramViewHolder = paramViewHolder.getColorStateList(2131428186);
        if ((jdField_a_of_type_AndroidWidgetTextView != null) && (paramViewHolder != null)) {
          jdField_a_of_type_AndroidWidgetTextView.setTextColor(paramViewHolder);
        }
        if ((jdField_b_of_type_AndroidWidgetTextView != null) && (paramViewHolder != null)) {
          jdField_b_of_type_AndroidWidgetTextView.setTextColor(paramViewHolder);
        }
      }
    }
    label135:
    do
    {
      do
      {
        return;
        paramViewHolder = paramViewHolder.getColorStateList(2131428183);
        break;
        if (d != 0) {
          break label135;
        }
        jdField_a_of_type_AndroidWidgetTextView.setTextColor(-16777216);
      } while (jdField_b_of_type_AndroidWidgetTextView == null);
      jdField_b_of_type_AndroidWidgetTextView.setTextColor(-16777216);
      return;
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(d);
    } while (jdField_b_of_type_AndroidWidgetTextView == null);
    jdField_b_of_type_AndroidWidgetTextView.setTextColor(d);
  }
  
  public void a(PttItemBuilder.Holder paramHolder, MessageForPtt paramMessageForPtt, int paramInt, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PttItemBuilder", 2, "fileStatus is:" + paramInt + ",url is:" + url + ",uniseq is:" + uniseq + ",stt is:" + sttAbility + ",long is:" + longPttVipFlag);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setUnread(false, null, null);
    Object localObject1 = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewViewGroup.getLayoutParams();
    ((RelativeLayout.LayoutParams)localObject1).addRule(0, -1);
    ((RelativeLayout.LayoutParams)localObject1).addRule(1, -1);
    int i3 = 0;
    int i1 = 0;
    localObject1 = "";
    Object localObject2 = null;
    Object localObject3 = null;
    String str = null;
    if (jdField_b_of_type_AndroidWidgetImageView != null)
    {
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(null);
      c.setVisibility(8);
    }
    if (jdField_b_of_type_AndroidWidgetTextView != null)
    {
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(null);
      d.setVisibility(8);
      e.setVisibility(8);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setTailMessage(false, null, null);
    jdField_a_of_type_AndroidViewViewGroup.setOnTouchListener(jdField_a_of_type_ComTencentMobileqqActivityAioOnLongClickAndTouchListener);
    jdField_a_of_type_AndroidViewViewGroup.setOnLongClickListener(jdField_a_of_type_ComTencentMobileqqActivityAioOnLongClickAndTouchListener);
    Resources localResources = jdField_a_of_type_AndroidContentContext.getResources();
    int i2;
    if (voiceChangeFlag != 0)
    {
      i2 = 1;
      switch (paramInt)
      {
      default: 
        paramInt = i1;
        localObject2 = str;
        label395:
        i1 = paramInt;
        if (sttAbility == 1)
        {
          i1 = paramInt;
          if (jdField_a_of_type_ComTencentMobileqqSttSttManager.a(paramMessageForPtt)) {
            i1 = 4;
          }
        }
        switch (i1)
        {
        case 2: 
        case 3: 
        default: 
          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(false, null);
          if (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView != null) {
            jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView.setBackgroundDrawable(null);
          }
          label486:
          if (d)
          {
            if (!paramMessageForPtt.isSend()) {
              break label2726;
            }
            paramMessageForPtt = "我发送语音";
          }
          break;
        }
        break;
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidViewViewGroup.setContentDescription(paramMessageForPtt + (String)localObject1 + "秒按钮");
      if (jdField_a_of_type_JavaLangStringBuilder != null)
      {
        jdField_a_of_type_JavaLangStringBuilder.append("发送了语音.").append((String)localObject1);
        if (localObject2 != null) {
          jdField_a_of_type_JavaLangStringBuilder.append(" ").append((String)localObject2);
        }
      }
      return;
      i2 = 0;
      break;
      jdField_a_of_type_AndroidWidgetTextView.setText("");
      jdField_a_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(10.0F, localResources), BaseChatItemLayout.p, AIOUtils.a(10.0F, localResources), BaseChatItemLayout.q);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout.setAnimating(false);
      if (d(paramMessageForPtt))
      {
        localObject1 = jdField_a_of_type_AndroidWidgetImageView;
        if (i2 != 0) {}
        for (paramInt = 2130841081;; paramInt = 2130841088)
        {
          ((ImageView)localObject1).setImageResource(paramInt);
          paramInt = 1;
          localObject1 = "";
          break;
        }
      }
      localObject1 = jdField_a_of_type_AndroidWidgetImageView;
      if (i2 != 0) {}
      for (paramInt = 2130842516;; paramInt = 2130842515)
      {
        ((ImageView)localObject1).setImageResource(paramInt);
        paramInt = 1;
        localObject1 = "";
        break;
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(null);
      jdField_a_of_type_AndroidWidgetImageView.setPadding(0, 0, 0, 0);
      jdField_a_of_type_AndroidWidgetTextView.setText("");
      jdField_a_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(40.0F, localResources), BaseChatItemLayout.p, AIOUtils.a(40.0F, localResources), BaseChatItemLayout.q);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout.setAnimating(true);
      paramInt = 0;
      localObject1 = "";
      break label395;
      if (QLog.isColorLevel()) {
        QLog.d("PttItemBuilder", 2, "voiceLength showPttItem builder" + voiceLength);
      }
      if (voiceLength <= 1) {
        voiceLength = QQRecorder.a(paramMessageForPtt);
      }
      if (voiceLength <= 0)
      {
        if (QLog.isColorLevel()) {
          QLog.d("PttItemBuilder", 2, "get a amr file length = 0 return now");
        }
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(null);
        jdField_a_of_type_AndroidWidgetImageView.setPadding(0, 0, 0, 0);
        jdField_a_of_type_AndroidWidgetTextView.setText("");
        jdField_a_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(10.0F, localResources), BaseChatItemLayout.p, AIOUtils.a(10.0F, localResources), BaseChatItemLayout.q);
        return;
      }
      localObject1 = localObject3;
      label1044:
      label1152:
      label1170:
      label1287:
      int i4;
      int i5;
      if (voiceLength > a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "Normal_MaxPtt"))
      {
        if (longPttVipFlag == 1)
        {
          if (jdField_a_of_type_AndroidTextSpannableString == null)
          {
            jdField_a_of_type_AndroidTextSpannableString = new SpannableString("[v] QQ会员专享长语音");
            localObject1 = localResources.getDrawable(2130838591);
            ((Drawable)localObject1).setBounds(0, 0, ((Drawable)localObject1).getIntrinsicWidth(), ((Drawable)localObject1).getIntrinsicHeight());
            localObject1 = new OffsetableImageSpan((Drawable)localObject1, 1).a(-0.05F);
            jdField_a_of_type_AndroidTextSpannableString.setSpan(localObject1, 0, 3, 17);
          }
          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setTailMessage(true, jdField_a_of_type_AndroidTextSpannableString, this);
          localObject1 = "QQ会员专享长语音";
        }
      }
      else
      {
        if (voiceLength > a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "ConvertText_MaxPtt")) {
          sttAbility = 0;
        }
        if ((TextUtils.isEmpty(timeStr)) || (TextUtils.equals(timeStr, "0\""))) {
          timeStr = a(voiceLength);
        }
        str = timeStr;
        jdField_a_of_type_AndroidWidgetTextView.setText(str);
        jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout.setAnimating(false);
        jdField_a_of_type_AndroidViewViewGroup.setOnClickListener(this);
        if (!paramMessageForPtt.isSend()) {
          break label1602;
        }
        if (!paramBoolean) {
          break label1526;
        }
        if (i2 == 0) {
          break label1510;
        }
        i1 = 2130968646;
        if (d(paramMessageForPtt))
        {
          if (i2 == 0) {
            break label1518;
          }
          i1 = 2130968741;
        }
        localObject2 = (AnimationDrawable)localResources.getDrawable(i1);
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject2);
        ((AnimationDrawable)localObject2).start();
        i2 = 1;
        if ((paramInt != 2003) && (paramInt != 1003)) {
          break label1756;
        }
        if ((!paramMessageForPtt.isSend()) && (!isReadPtt)) {
          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setUnread(true, null, null);
        }
        i1 = i2;
        paramInt = i3;
        if (sttAbility == 2)
        {
          i1 = i2;
          paramInt = i3;
          if (voiceChangeFlag != 1)
          {
            i1 = i2;
            paramInt = i3;
            if (expandStt)
            {
              i1 = 2;
              paramInt = i3;
            }
          }
        }
        i2 = AIOUtils.a(9.0F, localResources);
        i3 = AIOUtils.a(12.0F, localResources);
        i4 = localResources.getDrawable(2130840226).getIntrinsicHeight();
        i5 = AIOUtils.a(1.0F, localResources);
        if (i1 != 1) {
          break label1821;
        }
        i1 = a(jdField_a_of_type_AndroidContentContext, voiceLength, null, null, 0);
        if (!paramMessageForPtt.isSend()) {
          break label1788;
        }
        jdField_a_of_type_AndroidWidgetImageView.setPadding(0, 0, i2, 0);
        jdField_a_of_type_AndroidWidgetTextView.setPadding(i1, BaseChatItemLayout.p, BaseChatItemLayout.u, BaseChatItemLayout.q);
      }
      for (;;)
      {
        localObject2 = localObject1;
        localObject1 = str;
        break;
        localObject1 = localObject3;
        if (longPttVipFlag != 2) {
          break label1044;
        }
        if (b == null)
        {
          b = new SpannableString("[v] 超级会员专享长语音");
          localObject1 = localResources.getDrawable(2130838590);
          ((Drawable)localObject1).setBounds(0, 0, ((Drawable)localObject1).getIntrinsicWidth(), ((Drawable)localObject1).getIntrinsicHeight());
          localObject1 = new OffsetableImageSpan((Drawable)localObject1, 1).a(-0.05F);
          b.setSpan(localObject1, 0, 3, 17);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setTailMessage(true, b, this);
        localObject1 = "超级会员专享长语音";
        break label1044;
        label1510:
        i1 = 2130968645;
        break label1152;
        label1518:
        i1 = 2130968740;
        break label1170;
        label1526:
        if (d(paramMessageForPtt))
        {
          localObject2 = jdField_a_of_type_AndroidWidgetImageView;
          if (i2 != 0) {}
          for (i1 = 2130841087;; i1 = 2130841089)
          {
            ((ImageView)localObject2).setImageResource(i1);
            break;
          }
        }
        localObject2 = jdField_a_of_type_AndroidWidgetImageView;
        if (i2 != 0) {}
        for (i1 = 2130842522;; i1 = 2130842523)
        {
          ((ImageView)localObject2).setImageResource(i1);
          break;
        }
        label1602:
        if (paramBoolean)
        {
          if (i2 != 0)
          {
            i1 = 2130968786;
            label1617:
            if (d(paramMessageForPtt)) {
              if (i2 == 0) {
                break label1672;
              }
            }
          }
          label1672:
          for (i1 = 2130968739;; i1 = 2130968738)
          {
            localObject2 = (AnimationDrawable)localResources.getDrawable(i1);
            jdField_a_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject2);
            ((AnimationDrawable)localObject2).start();
            break;
            i1 = 2130968785;
            break label1617;
          }
        }
        if (d(paramMessageForPtt))
        {
          localObject2 = jdField_a_of_type_AndroidWidgetImageView;
          if (i2 != 0) {}
          for (i1 = 2130841081;; i1 = 2130841088)
          {
            ((ImageView)localObject2).setImageResource(i1);
            break;
          }
        }
        localObject2 = jdField_a_of_type_AndroidWidgetImageView;
        if (i2 != 0) {}
        for (i1 = 2130842516;; i1 = 2130842515)
        {
          ((ImageView)localObject2).setImageResource(i1);
          break;
        }
        label1756:
        if ((paramInt == 1005) || (paramInt == 1004))
        {
          paramInt = 1;
          i1 = i2;
          break label1287;
        }
        paramInt = 4;
        i1 = i2;
        break label1287;
        label1788:
        jdField_a_of_type_AndroidWidgetImageView.setPadding(i2, 0, 0, 0);
        jdField_a_of_type_AndroidWidgetTextView.setPadding(BaseChatItemLayout.u, BaseChatItemLayout.p, i1, BaseChatItemLayout.q);
      }
      label1821:
      if (jdField_b_of_type_AndroidWidgetTextView == null)
      {
        localObject3 = new ImageView(jdField_a_of_type_AndroidContentContext);
        ((ImageView)localObject3).setImageDrawable(new ColorDrawable(838860800));
        RelativeLayout.LayoutParams localLayoutParams1 = new RelativeLayout.LayoutParams(-1, i5);
        ((ImageView)localObject3).setLayoutParams(localLayoutParams1);
        ((ImageView)localObject3).setId(2131296414);
        TextView localTextView = new TextView(jdField_a_of_type_AndroidContentContext);
        if (paramMessageForPtt.isSend())
        {
          localObject2 = localResources.getColorStateList(2131428186);
          label1913:
          if (localObject2 != null) {
            localTextView.setTextColor((ColorStateList)localObject2);
          }
          localTextView.setId(2131296413);
          localObject2 = new RelativeLayout.LayoutParams(-2, -2);
          localTextView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
          ImageView localImageView = new ImageView(jdField_a_of_type_AndroidContentContext);
          RelativeLayout.LayoutParams localLayoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
          localImageView.setLayoutParams(localLayoutParams2);
          localImageView.setImageResource(2130840226);
          localImageView.setScaleType(ImageView.ScaleType.FIT_END);
          localLayoutParams1.addRule(3, 2131296410);
          localLayoutParams1.addRule(14);
          ((RelativeLayout.LayoutParams)localObject2).addRule(3, 2131296414);
          localLayoutParams2.addRule(3, 2131296414);
          localLayoutParams2.addRule(14);
          localLayoutParams2.addRule(6, 2131296413);
          localLayoutParams2.addRule(8, 2131296413);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout.addView((View)localObject3);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout.addView(localTextView);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout.addView(localImageView);
          d = ((ImageView)localObject3);
          jdField_b_of_type_AndroidWidgetTextView = localTextView;
          e = localImageView;
          label2108:
          jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
          jdField_b_of_type_AndroidWidgetTextView.setOnTouchListener(jdField_a_of_type_ComTencentMobileqqActivityAioOnLongClickAndTouchListener);
          jdField_b_of_type_AndroidWidgetTextView.setOnLongClickListener(jdField_a_of_type_ComTencentMobileqqActivityAioOnLongClickAndTouchListener);
          localObject3 = sttText;
          localObject2 = localObject3;
          if (TextUtils.isEmpty((CharSequence)localObject3)) {
            localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367777);
          }
          if (jdField_a_of_type_AndroidWidgetTextView == null) {
            jdField_a_of_type_AndroidWidgetTextView = new TextView(jdField_a_of_type_AndroidContentContext);
          }
          jdField_a_of_type_AndroidWidgetTextView.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
          i1 = a(jdField_a_of_type_AndroidContentContext, voiceLength, (String)localObject2, jdField_a_of_type_AndroidWidgetTextView.getPaint(), 0);
          jdField_b_of_type_AndroidWidgetTextView.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
          i4 = AIOUtils.a(22.0F, localResources) + i4;
          if (!paramMessageForPtt.isSend()) {
            break label2488;
          }
          localObject2 = (RelativeLayout.LayoutParams)d.getLayoutParams();
          ((RelativeLayout.LayoutParams)localObject2).addRule(5, 2131296410);
          ((RelativeLayout.LayoutParams)localObject2).addRule(7, 2131296410);
          localObject2 = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetTextView.getLayoutParams();
          ((RelativeLayout.LayoutParams)localObject2).addRule(5, 2131296410);
          ((RelativeLayout.LayoutParams)localObject2).addRule(7, 2131296410);
          jdField_a_of_type_AndroidWidgetImageView.setPadding(0, 0, i2, 0);
          jdField_a_of_type_AndroidWidgetTextView.setPadding(i1, BaseChatItemLayout.p, BaseChatItemLayout.u, BaseChatItemLayout.q);
          d.setPadding(i2, 0, i2, 0);
          jdField_b_of_type_AndroidWidgetTextView.setPadding(i2, BaseChatItemLayout.p, i2, i4);
          e.setPadding(0, 0, 0, i3);
        }
      }
      for (;;)
      {
        localObject3 = sttText;
        localObject2 = localObject3;
        if (TextUtils.isEmpty((CharSequence)localObject3)) {
          localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367777);
        }
        jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject2);
        localObject2 = localObject1;
        localObject1 = str;
        break;
        localObject2 = localResources.getColorStateList(2131428183);
        break label1913;
        d.setVisibility(0);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
        e.setVisibility(0);
        break label2108;
        label2488:
        localObject2 = (RelativeLayout.LayoutParams)d.getLayoutParams();
        ((RelativeLayout.LayoutParams)localObject2).addRule(5, 2131296410);
        ((RelativeLayout.LayoutParams)localObject2).addRule(7, 2131296410);
        localObject2 = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetTextView.getLayoutParams();
        ((RelativeLayout.LayoutParams)localObject2).addRule(5, 2131296410);
        ((RelativeLayout.LayoutParams)localObject2).addRule(7, 2131296410);
        jdField_a_of_type_AndroidWidgetImageView.setPadding(i2, 0, 0, 0);
        jdField_a_of_type_AndroidWidgetTextView.setPadding(BaseChatItemLayout.u, BaseChatItemLayout.p, i1, BaseChatItemLayout.q);
        d.setPadding(i2, 0, i2, 0);
        jdField_b_of_type_AndroidWidgetTextView.setPadding(i2, BaseChatItemLayout.p, i2, i4);
        e.setPadding(0, 0, 0, i3);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView.setBackgroundDrawable(null);
      localObject3 = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView;
      if (paramMessageForPtt.isSendFromLocal()) {}
      for (str = "重新发送语音消息";; str = "重新拉取语音消息")
      {
        ((ImageView)localObject3).setContentDescription(str);
        break;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconResource(2130838193, null);
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView.setBackgroundDrawable(null);
      ((Animatable)jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView.getDrawable()).start();
      break label486;
      label2726:
      if ((istroop == 1) || (istroop == 3000)) {
        paramMessageForPtt = "语音";
      } else {
        paramMessageForPtt = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d + "发来语音";
      }
    }
  }
  
  protected void a(PttItemBuilder.Holder paramHolder, MessageForPtt paramMessageForPtt, boolean paramBoolean)
  {
    int i1;
    if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) {
      if (paramBoolean) {
        i1 = 2;
      }
    }
    for (int i2 = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g;; i2 = 0)
    {
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramMessageForPtt, false, i1, i2);
      return;
      i1 = 1;
      break;
      i1 = 5;
    }
  }
  
  public void a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage)
  {
    if (paramView != null)
    {
      paramXListView = AIOUtils.a(paramView);
      if ((paramXListView instanceof PttItemBuilder.Holder))
      {
        paramXListView = (PttItemBuilder.Holder)paramXListView;
        paramView = (MessageForPtt)paramChatMessage;
        a(paramXListView, paramView, a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView), false);
        b();
      }
    }
  }
  
  public void a(boolean paramBoolean, MessageForPtt paramMessageForPtt)
  {
    if (!paramBoolean) {
      QQToast.a(jdField_a_of_type_AndroidContentContext, 1, "转文字失败，请稍候重试", 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
    }
    jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
  }
  
  public boolean a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage)
  {
    paramXListView = (MessageForPtt)paramChatMessage;
    return (!paramXListView.isSend()) && (!isReadPtt) && (paramXListView.isReady());
  }
  
  public boolean a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage, AudioPlayer paramAudioPlayer)
  {
    paramXListView = (MessageForPtt)paramChatMessage;
    PTTPreDownloader.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).c(paramXListView);
    if (paramXListView.isReady())
    {
      paramView = AIOUtils.a(paramView);
      if (!(paramView instanceof PttItemBuilder.Holder))
      {
        if (QLog.isColorLevel()) {
          QLog.d("PttItemBuilder", 2, "play failed not Holder " + paramXListView.getLocalFilePath());
        }
        return false;
      }
      paramView = (PttItemBuilder.Holder)paramView;
      if (paramAudioPlayer.a(paramXListView.getLocalFilePath()))
      {
        a(paramXListView);
        if (paramView != null)
        {
          a(paramView, paramXListView, a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramXListView), true);
          a(jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout, paramXListView, jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo, 0);
        }
        PttInfoCollector.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, istroop, issend);
        if (!paramXListView.isSendFromLocal())
        {
          if (istroop != 0) {
            break label189;
          }
          paramInt = 1;
        }
      }
    }
    for (;;)
    {
      paramXListView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      if (paramChatMessage.getPttStreamFlag() == 10001) {}
      for (boolean bool = true;; bool = false)
      {
        PttInfoCollector.a(paramXListView, paramInt, bool, 1);
        return true;
        label189:
        if (istroop == 1)
        {
          paramInt = 3;
          break;
        }
        if (istroop != 3000) {
          break label297;
        }
        paramInt = 2;
        break;
      }
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("PttItemBuilder", 2, "play failed player return false " + paramXListView.getLocalFilePath());
      return false;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("PttItemBuilder", 2, "play failed not ready " + paramXListView.getLocalFilePath());
      return false;
      label297:
      paramInt = 4;
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    paramView = (MessageForPtt)AIOUtils.a(paramView);
    if (!paramView.isReady())
    {
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
      return localQQCustomMenu.a();
    }
    if (QQRecorder.a(paramView) <= 0)
    {
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
      return localQQCustomMenu.a();
    }
    if (voiceChangeFlag != 1)
    {
      if (sttAbility != 1) {
        break label269;
      }
      if ((!jdField_a_of_type_ComTencentMobileqqSttSttManager.a(paramView)) && ((!paramView.isSend()) || ((extraflag != 32768) && (extraflag != 32768)))) {
        localQQCustomMenu.a(2131304470, jdField_a_of_type_AndroidContentContext.getString(2131371844));
      }
    }
    for (;;)
    {
      a(paramView, localQQCustomMenu);
      localQQCustomMenu.a(jdField_a_of_type_AndroidContentContext.getString(2131367004));
      localQQCustomMenu.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
      if ((paramView.isSend()) && (extraflag != 32768) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramView))) {
        a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramView);
      }
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
      return localQQCustomMenu.a();
      label269:
      if (sttAbility == 2) {
        if (expandStt)
        {
          localQQCustomMenu.a(2131304469, jdField_a_of_type_AndroidContentContext.getString(2131367715));
          localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131367716));
        }
        else
        {
          localQQCustomMenu.a(2131304470, jdField_a_of_type_AndroidContentContext.getString(2131371844));
        }
      }
    }
  }
  
  protected View b(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = (PttItemBuilder.Holder)paramViewHolder;
    MessageForPtt localMessageForPtt = (MessageForPtt)paramChatMessage;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new BreathAnimationLayout(jdField_a_of_type_AndroidContentContext);
      paramView = new ImageView(jdField_a_of_type_AndroidContentContext);
      paramView.setId(2131296409);
      TextView localTextView = new TextView(jdField_a_of_type_AndroidContentContext);
      localTextView.setId(2131296408);
      localTextView.setTextColor(jdField_a_of_type_AndroidContentContext.getResources().getColorStateList(2131428183));
      Object localObject = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject).addRule(15, -1);
      paramView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localObject = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject).addRule(15, -1);
      localTextView.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localObject = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      ((RelativeLayout)localObject).setId(2131296410);
      ((RelativeLayout)localObject).addView(paramView);
      ((RelativeLayout)localObject).addView(localTextView);
      paramViewHolder.addView((View)localObject);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemBreathAnimationLayout = paramViewHolder;
      jdField_a_of_type_AndroidWidgetTextView = localTextView;
      jdField_a_of_type_AndroidWidgetImageView = paramView;
      jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)localObject);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioOnLongClickAndTouchListener = paramOnLongClickAndTouchListener;
    if (paramChatMessage.isSend())
    {
      ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetImageView.getLayoutParams()).addRule(1, 2131296408);
      ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams()).addRule(1, -1);
    }
    for (;;)
    {
      int i2 = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageForPtt);
      int i1 = i2;
      if (i2 == -1)
      {
        a(paramBaseChatItemLayout, localMessageForPtt, false);
        i1 = 2001;
      }
      if (QLog.isColorLevel()) {
        QLog.d("PTTItem->getBubbleView", 2, "fileStatus = " + i1 + " url " + url + " uniseq " + uniseq);
      }
      a(paramBaseChatItemLayout, localMessageForPtt, i1, c(localMessageForPtt));
      PTTPreDownloader.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).b(localMessageForPtt);
      PttInfoCollector.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i1, paramChatMessage);
      return paramViewHolder;
      ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams()).addRule(1, 2131296409);
      ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetImageView.getLayoutParams()).addRule(1, -1);
    }
  }
  
  public boolean b(ChatMessage paramChatMessage)
  {
    return true;
  }
  
  public void c()
  {
    PttInfoCollector.a(7);
    super.c();
  }
  
  protected boolean c(ChatMessage paramChatMessage)
  {
    ChatMessage localChatMessage = MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a();
    return (localChatMessage == paramChatMessage) || (((localChatMessage instanceof MessageForPtt)) && (frienduin != null) && (frienduin.equals(frienduin)) && (uniseq == uniseq));
  }
  
  public void d()
  {
    jdField_a_of_type_ComTencentMobileqqSttSttManager.a(null);
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
    int i1 = paramView.getId();
    if ((d) && (i1 == 2131296407)) {
      paramView.findViewById(2131296410).performClick();
    }
    PttItemBuilder.Holder localHolder;
    MessageForPtt localMessageForPtt;
    do
    {
      for (;;)
      {
        return;
        localHolder = (PttItemBuilder.Holder)AIOUtils.a(paramView);
        localMessageForPtt = (MessageForPtt)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
        if (i1 != 2131296410) {
          break;
        }
        if (c(localMessageForPtt)) {
          MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(false);
        }
        while (istroop == 1008)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005857", "0X8005857", 0, 0, "", "", timeStr, "");
          return;
          if ((localMessageForPtt != MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a()) && (localMessageForPtt.isReady())) {
            if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
              QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131367775, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
            } else if (!MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(AIOUtils.a(paramView))) {
              QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131367776, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
            }
          }
        }
      }
      if (i1 != 2131296413) {
        break;
      }
    } while (!expandStt);
    expandStt = false;
    localMessageForPtt.serial();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, uniseq, msgData);
    a(localHolder, localMessageForPtt, a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageForPtt), c(localMessageForPtt));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8003F37", "0X8003F37", 0, 0, "", "", "", "");
    return;
    if (i1 == 2131296326)
    {
      paramView = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
      paramView.putExtra("uin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      paramView.putExtra("url", "http://m.vip.qq.com/freedom/freedom_longvoice.html");
      jdField_a_of_type_AndroidContentContext.startActivity(paramView);
      return;
    }
    super.onClick(paramView);
  }
}
