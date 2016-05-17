package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.dataline.activities.LiteActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.FontSettingManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForTroopFile;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.ForwardFileInfo;
import com.tencent.mobileqq.filemanager.util.FMToastUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.filemanager.widget.AsyncImageView;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.TestStructMsg;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.troop.data.TroopFileInfo;
import com.tencent.mobileqq.troop.data.TroopFileItemOperation;
import com.tencent.mobileqq.troop.data.TroopFileStatusInfo;
import com.tencent.mobileqq.troop.utils.TroopFileError;
import com.tencent.mobileqq.troop.utils.TroopFileManager;
import com.tencent.mobileqq.troop.utils.TroopFileTransferManager;
import com.tencent.mobileqq.troop.utils.TroopFileUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqfav.QfavBuilder;
import cooperation.troop.TroopFileProxyActivity;
import cooperation.troop.TroopProxyActivity;
import java.util.UUID;
import lby;
import lbz;
import lca;
import lcb;

public class TroopFileItemBuilder
  extends BaseBubbleBuilder
{
  public static final String b;
  public Handler a;
  public View.OnClickListener a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangString = TroopFileItemBuilder.class.getSimpleName();
  }
  
  public TroopFileItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_AndroidOsHandler = new Handler();
    jdField_a_of_type_AndroidViewView$OnClickListener = new lby(this);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramViewGroup = (ViewGroup)super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramOnLongClickAndTouchListener = (lcb)paramViewGroup.getTag();
    if (jdField_a_of_type_AndroidWidgetLinearLayout == null)
    {
      jdField_a_of_type_AndroidWidgetLinearLayout = new LinearLayout(jdField_a_of_type_AndroidContentContext);
      jdField_a_of_type_AndroidWidgetLinearLayout.setId(2131296328);
      paramView = new RelativeLayout.LayoutParams(-2, -2);
      if (!paramChatMessage.isSend()) {
        break label417;
      }
      paramView.addRule(0, 2131296317);
      paramView.addRule(1, 0);
    }
    for (;;)
    {
      paramView.addRule(5, 2131296325);
      paramView.addRule(3, 2131296325);
      topMargin = AIOUtils.a(2.0F, jdField_a_of_type_AndroidContentContext.getResources());
      leftMargin = AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources());
      paramViewGroup.addView(jdField_a_of_type_AndroidWidgetLinearLayout, paramView);
      paramView = null;
      if (jdField_a_of_type_AndroidWidgetLinearLayout.getChildCount() > 0) {
        paramView = jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(0);
      }
      paramView = a(jdField_a_of_type_AndroidContentContext, paramView);
      d = ((TextView)paramView.findViewById(2131304236));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131304235));
      jdField_a_of_type_AndroidWidgetLinearLayout.removeAllViews();
      FrameLayout.LayoutParams localLayoutParams = new FrameLayout.LayoutParams(-2, -2);
      localLayoutParams.setMargins(AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0);
      jdField_a_of_type_AndroidWidgetLinearLayout.addView(paramView, localLayoutParams);
      a(jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout, paramChatMessage, paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidViewView.getLayoutParams().width = BaseChatItemLayout.h;
      if (jdField_b_of_type_Boolean) {}
      try
      {
        jdField_b_of_type_JavaLangStringBuilder.append(jdField_a_of_type_AndroidWidgetTextView.getText()).append(" ");
        jdField_b_of_type_JavaLangStringBuilder.append(jdField_b_of_type_AndroidWidgetTextView.getText());
        jdField_b_of_type_JavaLangStringBuilder.append(c.getText());
        jdField_b_of_type_JavaLangStringBuilder.append("按钮");
        paramViewGroup.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
        return paramViewGroup;
      }
      catch (Exception paramChatMessage) {}
      paramViewGroup.removeView(jdField_a_of_type_AndroidWidgetLinearLayout);
      break;
      label417:
      paramView.addRule(1, 2131296317);
      paramView.addRule(0, 0);
    }
    return paramViewGroup;
  }
  
  public View a(Context paramContext, View paramView)
  {
    View localView = paramView;
    if (paramView == null) {
      localView = LayoutInflater.from(paramContext).inflate(2130904866, null);
    }
    localView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    return localView;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramViewHolder = (lcb)paramViewHolder;
    paramChatMessage = paramView;
    if (paramView == null)
    {
      paramChatMessage = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903163, null);
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramChatMessage.findViewById(2131296378));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramChatMessage.findViewById(2131296379));
      c = ((TextView)paramChatMessage.findViewById(2131296380));
      jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView = ((AsyncImageView)paramChatMessage.findViewById(2131296376));
      jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)paramChatMessage.findViewById(2131296381));
    }
    paramChatMessage.setOnLongClickListener(paramOnLongClickAndTouchListener);
    paramChatMessage.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramChatMessage.setOnClickListener(this);
    return paramChatMessage;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new lcb(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return "发出文件";
    }
    return "发来文件";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    Object localObject2 = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(frienduin));
    if (localObject2 == null) {}
    Object localObject3;
    do
    {
      do
      {
        do
        {
          int i;
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
                          localObject1 = (MessageForTroopFile)paramChatMessage;
                          localObject1 = TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (MessageForTroopFile)localObject1);
                        } while (localObject1 == null);
                        i = NetworkUtil.a((Activity)paramContext);
                        localObject3 = new TroopFileItemOperation(Long.parseLong(frienduin), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)paramContext);
                        switch (paramInt)
                        {
                        case 2131304475: 
                        case 2131304476: 
                        case 2131304477: 
                        case 2131304478: 
                        case 2131304479: 
                        case 2131304480: 
                        case 2131304481: 
                        case 2131304482: 
                        case 2131304483: 
                        case 2131304484: 
                        case 2131304485: 
                        case 2131304486: 
                        case 2131304487: 
                        case 2131304488: 
                        case 2131304489: 
                        case 2131304490: 
                        case 2131304492: 
                        default: 
                          super.a(paramInt, paramContext, paramChatMessage);
                          return;
                        case 2131304493: 
                          if (i == 0)
                          {
                            TroopFileError.a(paramContext, jdField_a_of_type_AndroidContentContext.getString(2131364053));
                            return;
                          }
                          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Down_pause_download", 0, 0, "", frienduin, "", "");
                        }
                      } while (jdField_b_of_type_Int != 8);
                      ((TroopFileTransferManager)localObject2).f(jdField_a_of_type_JavaUtilUUID);
                      return;
                      if (i == 0)
                      {
                        TroopFileError.a(paramContext, jdField_a_of_type_AndroidContentContext.getString(2131364053));
                        return;
                      }
                      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Up_pause_upload", 0, 0, "", frienduin, "", "");
                    } while ((jdField_b_of_type_Int != 0) && (jdField_b_of_type_Int != 1));
                    ((TroopFileTransferManager)localObject2).c(jdField_a_of_type_JavaUtilUUID);
                    return;
                  } while (jdField_b_of_type_Int != 9);
                  ((TroopFileItemOperation)localObject3).b(jdField_a_of_type_JavaUtilUUID);
                  return;
                } while (jdField_b_of_type_Int != 2);
                ((TroopFileItemOperation)localObject3).a(jdField_a_of_type_JavaUtilUUID);
                return;
              } while ((jdField_b_of_type_Int != 8) && (jdField_b_of_type_Int != 9) && (jdField_b_of_type_Int != 10));
              ((TroopFileTransferManager)localObject2).f(jdField_a_of_type_JavaUtilUUID);
              a(jdField_a_of_type_Long, (Activity)paramContext, jdField_a_of_type_JavaUtilUUID);
              return;
              if (i == 0)
              {
                TroopFileError.a(paramContext, jdField_a_of_type_AndroidContentContext.getString(2131364053));
                return;
              }
            } while ((jdField_b_of_type_Int != 1) && (jdField_b_of_type_Int != 0) && (jdField_b_of_type_Int != 2) && (jdField_b_of_type_Int != 3));
            ((TroopFileTransferManager)localObject2).c(jdField_a_of_type_JavaUtilUUID);
            a(jdField_a_of_type_Long, (Activity)paramContext, jdField_a_of_type_JavaUtilUUID, paramChatMessage);
            return;
            if (i == 0)
            {
              TroopFileError.a(paramContext, jdField_a_of_type_AndroidContentContext.getString(2131364053));
              return;
            }
            paramContext = new Bundle();
            paramContext.putInt("forward_type", 0);
            localObject2 = FileManagerUtil.a((TroopFileStatusInfo)localObject1);
            status = 2;
            nOpType = 24;
            localObject3 = new ForwardFileInfo();
            ((ForwardFileInfo)localObject3).b(nSessionId);
            ((ForwardFileInfo)localObject3).b(10006);
            if (!TextUtils.isEmpty(((FileManagerEntity)localObject2).getFilePath())) {
              ((ForwardFileInfo)localObject3).a(jdField_a_of_type_JavaLangString);
            }
            ((ForwardFileInfo)localObject3).d(f);
            ((ForwardFileInfo)localObject3).d(jdField_b_of_type_Long);
            ((ForwardFileInfo)localObject3).a(Long.parseLong(frienduin));
            if (jdField_a_of_type_JavaUtilUUID != null) {
              ((ForwardFileInfo)localObject3).e(jdField_a_of_type_JavaUtilUUID.toString());
            }
            ((ForwardFileInfo)localObject3).d(1);
            ((ForwardFileInfo)localObject3).a(1);
            paramContext.putParcelable("fileinfo", (Parcelable)localObject3);
            paramContext.putBoolean("not_forward", true);
            paramChatMessage = new Intent();
            paramChatMessage.putExtras(paramContext);
            paramChatMessage.putExtra("forward_text", f);
            paramChatMessage.putExtra("forward_from_troop_file", true);
            ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "", "", "", "");
            return;
          } while (d == null);
          if (i == 0)
          {
            TroopFileError.a(paramContext, jdField_a_of_type_AndroidContentContext.getString(2131364053));
            return;
          }
          FMToastUtil.b(FileManagerUtil.d(f) + jdField_a_of_type_AndroidContentContext.getString(2131362754));
          ((TroopFileTransferManager)localObject2).a(d, f, jdField_b_of_type_Long, e);
          return;
          FileManagerUtil.a((Activity)paramContext, jdField_a_of_type_JavaLangString);
          return;
        } while (jdField_b_of_type_Int != 3);
        ((TroopFileItemOperation)localObject3).a(jdField_a_of_type_JavaUtilUUID);
        return;
      } while (jdField_b_of_type_Int != 10);
      ((TroopFileItemOperation)localObject3).b(jdField_a_of_type_JavaUtilUUID);
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Down__start_download", 0, 0, "", frienduin, "", "");
    } while ((localObject1 != null) && (jdField_b_of_type_Int != 7));
    ((TroopFileItemOperation)localObject3).a(d, f, jdField_b_of_type_Long, e);
    return;
    paramContext = new Intent(jdField_a_of_type_AndroidContentContext, LiteActivity.class);
    paramContext.putExtra("dataline_forward_type", 100);
    paramContext.putExtra("dataline_forward_path", jdField_a_of_type_JavaLangString);
    jdField_a_of_type_AndroidContentContext.startActivity(paramContext);
    return;
    paramContext = FileManagerUtil.a((TroopFileStatusInfo)localObject1);
    Object localObject1 = TroopFileManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_Long).a(strTroopFilePath);
    if (localObject1 != null)
    {
      lastTime = c;
      selfUin = String.valueOf(jdField_b_of_type_Long);
    }
    new QfavBuilder(3).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_AndroidContentContext, paramContext, paramChatMessage, false);
    return;
    try
    {
      paramContext = TestStructMsg.a(TestStructMsg.a(FileManagerUtil.a((TroopFileStatusInfo)localObject1).getFilePath()));
      localObject1 = new SessionInfo();
      jdField_a_of_type_JavaLangString = frienduin;
      jdField_a_of_type_Int = istroop;
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (SessionInfo)localObject1, paramContext);
      return;
    }
    catch (Exception paramContext)
    {
      QQToast.a(jdField_a_of_type_AndroidContentContext, "请先下载。。。。。。", 1).a();
    }
  }
  
  public void a(long paramLong, Activity paramActivity, UUID paramUUID)
  {
    paramUUID = new lbz(this, paramLong, paramUUID, paramActivity);
    DialogUtil.a(paramActivity, 230, jdField_a_of_type_AndroidContentContext.getString(2131364037), jdField_a_of_type_AndroidContentContext.getString(2131364081), 2131364002, 2131364003, paramUUID, paramUUID).show();
  }
  
  public void a(long paramLong, Activity paramActivity, UUID paramUUID, ChatMessage paramChatMessage)
  {
    paramUUID = new lca(this, paramLong, paramUUID, paramChatMessage, paramActivity);
    DialogUtil.a(paramActivity, 230, jdField_a_of_type_AndroidContentContext.getString(2131364036), jdField_a_of_type_AndroidContentContext.getString(2131364082), 2131364000, 2131364001, paramUUID, paramUUID).show();
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    d(paramView);
  }
  
  public void a(BaseChatItemLayout paramBaseChatItemLayout, ChatMessage paramChatMessage, lcb paramLcb)
  {
    MessageForTroopFile localMessageForTroopFile = (MessageForTroopFile)paramChatMessage;
    localMessageForTroopFile.doParse();
    if (!bReported)
    {
      bReported = true;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Down_appear_AIO", 0, 0, "", frienduin, "", "");
      if (QLog.isDevelopLevel()) {
        QLog.d(jdField_b_of_type_JavaLangString, 4, "Build TroopFileItem");
      }
    }
    TroopFileStatusInfo localTroopFileStatusInfo = TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageForTroopFile);
    if (localTroopFileStatusInfo == null)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d(jdField_b_of_type_JavaLangString, 4, "get fileStatusInfo fail ");
      }
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.MIDDLE);
    jdField_a_of_type_AndroidWidgetTextView.setMaxLines(2);
    jdField_a_of_type_AndroidWidgetTextView.setText(f);
    boolean bool2 = false;
    int m = 0;
    int n = 0;
    int i1 = 0;
    Object localObject = "";
    boolean bool1;
    int k;
    int j;
    int i;
    switch (jdField_b_of_type_Int)
    {
    default: 
      bool1 = bool2;
      k = m;
      j = n;
      i = i1;
      label244:
      if (!senderuin.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))
      {
        m = 1;
        label264:
        if (k == 0) {
          break label1025;
        }
        jdField_a_of_type_AndroidWidgetProgressBar.setProgress(j);
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
        label286:
        if (i == 0) {
          break label1037;
        }
        c.setText((CharSequence)localObject);
        c.setVisibility(0);
        label308:
        jdField_b_of_type_AndroidWidgetTextView.setText(FileUtil.a(jdField_b_of_type_Long));
        paramBaseChatItemLayout.setFailedIconVisable(bool1, this);
        paramBaseChatItemLayout = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(frienduin));
        if (jdField_b_of_type_JavaLangString != null) {
          break label1075;
        }
        FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView, f);
        if (jdField_a_of_type_JavaUtilUUID == null) {
          break label1049;
        }
        paramBaseChatItemLayout.a(jdField_a_of_type_JavaUtilUUID, 128);
        label386:
        if (m == 0) {
          break label1139;
        }
        jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
        if (jdField_a_of_type_AndroidWidgetLinearLayout.getChildCount() > 0) {
          jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(0).setVisibility(0);
        }
        d.setVisibility(0);
        d.setText("群文件");
      }
      break;
    }
    while (FontSettingManager.a() > 17.0F)
    {
      paramBaseChatItemLayout = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetTextView.getLayoutParams();
      if (c.getVisibility() != 0) {
        break label1151;
      }
      jdField_b_of_type_AndroidWidgetTextView.setGravity(5);
      paramBaseChatItemLayout.addRule(3, 2131296378);
      paramBaseChatItemLayout.addRule(2, 2131296380);
      paramBaseChatItemLayout.addRule(7, 2131296378);
      return;
      k = 1;
      j = 0;
      localObject = "上传中";
      i = 1;
      bool1 = bool2;
      break label244;
      String str = "未下载";
      localObject = str;
      i = i1;
      j = n;
      k = m;
      bool1 = bool2;
      if (msgtype != 63519) {
        break label244;
      }
      if (extraflag != 32772)
      {
        localObject = str;
        i = i1;
        j = n;
        k = m;
        bool1 = bool2;
        if (extraflag != 32768) {
          break label244;
        }
      }
      localObject = str;
      i = i1;
      j = n;
      k = m;
      bool1 = bool2;
      if (!localMessageForTroopFile.isSendFromLocal()) {
        break label244;
      }
      localObject = str;
      i = i1;
      j = n;
      k = m;
      bool1 = bool2;
      if (!TextUtils.isEmpty(FromUin)) {
        break label244;
      }
      localObject = str;
      i = i1;
      j = n;
      k = m;
      bool1 = bool2;
      if (!TextUtils.isEmpty(d)) {
        break label244;
      }
      c(paramChatMessage);
      localObject = str;
      i = i1;
      j = n;
      k = m;
      bool1 = bool2;
      break label244;
      localObject = "未下载";
      c(paramChatMessage);
      i = i1;
      j = n;
      k = m;
      bool1 = bool2;
      break label244;
      localObject = "上传中";
      i = 1;
      k = 1;
      j = TroopFileUtils.a(c, jdField_b_of_type_Long);
      bool1 = bool2;
      break label244;
      localObject = "下载中";
      k = 1;
      j = TroopFileUtils.a(c, jdField_b_of_type_Long);
      i = i1;
      bool1 = bool2;
      break label244;
      i = 1;
      localObject = "已暂停";
      k = 1;
      j = TroopFileUtils.a(c, jdField_b_of_type_Long);
      bool1 = bool2;
      break label244;
      i = 1;
      localObject = "已暂停";
      k = 1;
      j = TroopFileUtils.a(c, jdField_b_of_type_Long);
      bool1 = bool2;
      break label244;
      localObject = "已上传";
      i = 1;
      j = n;
      k = m;
      bool1 = bool2;
      break label244;
      localObject = "已下载";
      i = 1;
      j = n;
      k = m;
      bool1 = bool2;
      break label244;
      localObject = "失败";
      bool1 = true;
      i = i1;
      j = n;
      k = m;
      break label244;
      localObject = "失败";
      bool1 = true;
      i = i1;
      j = n;
      k = m;
      break label244;
      localObject = "已取消";
      i = i1;
      j = n;
      k = m;
      bool1 = bool2;
      break label244;
      localObject = "转发中";
      i = 1;
      j = n;
      k = m;
      bool1 = bool2;
      break label244;
      m = 0;
      break label264;
      label1025:
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
      break label286;
      label1037:
      c.setVisibility(8);
      break label308;
      label1049:
      paramBaseChatItemLayout.a(d, f, e, 128);
      break label386;
      label1075:
      if ((TextUtils.isEmpty(jdField_b_of_type_JavaLangString)) || (!FileUtils.a(jdField_b_of_type_JavaLangString)))
      {
        FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView, f);
        break label386;
      }
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView, f);
      jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView.setAsyncImage(jdField_b_of_type_JavaLangString);
      break label386;
      label1139:
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
    }
    label1151:
    jdField_b_of_type_AndroidWidgetTextView.setGravity(3);
    paramBaseChatItemLayout.addRule(3, -1);
    paramBaseChatItemLayout.addRule(2, -1);
    paramBaseChatItemLayout.addRule(12);
    paramBaseChatItemLayout.addRule(5, 2131296378);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    ChatMessage localChatMessage = AIOUtils.a(paramView);
    paramView = (MessageForTroopFile)localChatMessage;
    TroopFileStatusInfo localTroopFileStatusInfo = TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView);
    if (localTroopFileStatusInfo == null)
    {
      localQQCustomMenu.a(2131304504, jdField_a_of_type_AndroidContentContext.getString(2131364029));
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Down_press_files", 0, 0, "", frienduin, "", "");
      return localQQCustomMenu.a();
    }
    Boolean localBoolean = Boolean.valueOf(false);
    paramView = localBoolean;
    switch (jdField_b_of_type_Int)
    {
    default: 
      paramView = localBoolean;
    case 4: 
    case 5: 
    case 12: 
      if (paramView.booleanValue()) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Up_press_files", 0, 0, "", frienduin, "", "");
      }
      break;
    }
    for (;;)
    {
      return localQQCustomMenu.a();
      localQQCustomMenu.a(2131304494, jdField_a_of_type_AndroidContentContext.getString(2131364020));
      paramView = Boolean.valueOf(true);
      break;
      localQQCustomMenu.a(2131304496, jdField_a_of_type_AndroidContentContext.getString(2131364021));
      localQQCustomMenu.a(2131304498, jdField_a_of_type_AndroidContentContext.getString(2131364023));
      paramView = Boolean.valueOf(true);
      break;
      localQQCustomMenu.a(2131304502, jdField_a_of_type_AndroidContentContext.getString(2131364027));
      localQQCustomMenu.a(2131304498, jdField_a_of_type_AndroidContentContext.getString(2131364023));
      paramView = Boolean.valueOf(true);
      break;
      localQQCustomMenu.a(2131304493, jdField_a_of_type_AndroidContentContext.getString(2131364020));
      localQQCustomMenu.a(2131304499, jdField_a_of_type_AndroidContentContext.getString(2131364024));
      a(localChatMessage, localQQCustomMenu);
      localQQCustomMenu.a(2131304505, jdField_a_of_type_AndroidContentContext.getString(2131364030));
      localQQCustomMenu.a(2131304500, jdField_a_of_type_AndroidContentContext.getString(2131364025));
      paramView = localBoolean;
      break;
      localQQCustomMenu.a(2131304495, jdField_a_of_type_AndroidContentContext.getString(2131364021));
      localQQCustomMenu.a(2131304497, jdField_a_of_type_AndroidContentContext.getString(2131364022));
      localQQCustomMenu.a(2131304499, jdField_a_of_type_AndroidContentContext.getString(2131364024));
      a(localChatMessage, localQQCustomMenu);
      localQQCustomMenu.a(2131304505, jdField_a_of_type_AndroidContentContext.getString(2131364030));
      localQQCustomMenu.a(2131304500, jdField_a_of_type_AndroidContentContext.getString(2131364025));
      paramView = localBoolean;
      break;
      localQQCustomMenu.a(2131304503, jdField_a_of_type_AndroidContentContext.getString(2131364028));
      localQQCustomMenu.a(2131304497, jdField_a_of_type_AndroidContentContext.getString(2131364022));
      a(localChatMessage, localQQCustomMenu);
      paramView = localBoolean;
      break;
      localQQCustomMenu.a(2131304499, jdField_a_of_type_AndroidContentContext.getString(2131364024));
      localQQCustomMenu.a(2131304505, jdField_a_of_type_AndroidContentContext.getString(2131364030));
      localQQCustomMenu.a(2131304500, jdField_a_of_type_AndroidContentContext.getString(2131364025));
      localQQCustomMenu.a(2131304491, jdField_a_of_type_AndroidContentContext.getString(2131362182));
      a(localChatMessage, localQQCustomMenu);
      paramView = Boolean.valueOf(true);
      break;
      if (!FileUtil.a(jdField_a_of_type_JavaLangString))
      {
        TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(frienduin)).b();
        paramView = localBoolean;
        break;
      }
      if ((!TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) && (FileUtils.e(jdField_a_of_type_JavaLangString))) {
        localQQCustomMenu.a(2131304501, jdField_a_of_type_AndroidContentContext.getString(2131364026));
      }
      localQQCustomMenu.a(2131304499, jdField_a_of_type_AndroidContentContext.getString(2131364024));
      a(localChatMessage, localQQCustomMenu);
      localQQCustomMenu.a(2131304505, jdField_a_of_type_AndroidContentContext.getString(2131364030));
      localQQCustomMenu.a(2131304500, jdField_a_of_type_AndroidContentContext.getString(2131364025));
      localQQCustomMenu.a(2131304491, jdField_a_of_type_AndroidContentContext.getString(2131362182));
      paramView = localBoolean;
      break;
      localQQCustomMenu.a(2131304504, jdField_a_of_type_AndroidContentContext.getString(2131364029));
      localQQCustomMenu.a(2131304499, jdField_a_of_type_AndroidContentContext.getString(2131364024));
      a(localChatMessage, localQQCustomMenu);
      localQQCustomMenu.a(2131304505, jdField_a_of_type_AndroidContentContext.getString(2131364030));
      localQQCustomMenu.a(2131304500, jdField_a_of_type_AndroidContentContext.getString(2131364025));
      paramView = localBoolean;
      break;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Down_press_files", 0, 0, "", frienduin, "", "");
    }
  }
  
  public void c(ChatMessage paramChatMessage)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().f(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
  }
  
  void d(View paramView)
  {
    Activity localActivity = (Activity)paramView.getContext();
    Intent localIntent = new Intent();
    paramView = AIOUtils.a(paramView);
    MessageForTroopFile localMessageForTroopFile = (MessageForTroopFile)paramView;
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_files", "", "AIOchat", "Clk_filesbubble", 0, 0, frienduin + "", "", "", "");
    TroopFileStatusInfo localTroopFileStatusInfo = TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageForTroopFile);
    switch (jdField_b_of_type_Int)
    {
    case 4: 
    case 5: 
    default: 
      return;
    case 0: 
    case 1: 
    case 2: 
    case 3: 
      localIntent.putExtra(TroopProxyActivity.h, frienduin);
      TroopFileProxyActivity.b(localActivity, localIntent);
      return;
    case 6: 
    case 7: 
    case 8: 
    case 9: 
    case 10: 
    case 11: 
      new TroopFileItemOperation(Long.valueOf(frienduin).longValue(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localActivity).a(localTroopFileStatusInfo, senderuin, lastTime);
      return;
    }
    TroopFileError.a(localActivity, String.format(localActivity.getString(2131364073), new Object[] { TroopFileUtils.a(f) }));
  }
  
  public void d(ChatMessage paramChatMessage)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq);
    if (paramChatMessage.isSendFromLocal()) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq));
    }
  }
  
  public void onClick(View paramView)
  {
    super.onClick(paramView);
    switch (paramView.getId())
    {
    default: 
      return;
    }
    d(paramView);
    AIOUtils.l = true;
  }
}
