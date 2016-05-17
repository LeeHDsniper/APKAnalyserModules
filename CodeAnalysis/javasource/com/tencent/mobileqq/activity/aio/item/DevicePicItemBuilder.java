package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.dataline.util.widget.AsyncImageView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.device.msg.data.DeviceComnFileMsgProcessor;
import com.tencent.device.msg.data.DeviceGroupChatMsgProcessor;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.customviews.MessageProgressTextView;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForDeviceFile;
import com.tencent.mobileqq.data.MessageForDeviceFile.DeviceFileItemCallback;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.ForwardFileInfo;
import com.tencent.mobileqq.filemanager.fileviewer.FileBrowserActivity;
import com.tencent.mobileqq.filemanager.util.FMToastUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kvh;
import kvi;

public class DevicePicItemBuilder
  extends BaseBubbleBuilder
  implements MessageForDeviceFile.DeviceFileItemCallback
{
  private static final String b;
  protected final float b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangString = DevicePicItemBuilder.class.getSimpleName();
  }
  
  public DevicePicItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_b_of_type_Float = getResourcesgetDisplayMetricsdensity;
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramView = (BaseChatItemLayout)super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    if (("device_groupchat".equals(extStr)) && (paramView != null))
    {
      paramChatMessage = (MessageForDeviceFile)paramChatMessage;
      if ((TextUtils.isEmpty(filePath)) || (FileManagerUtil.a(filePath) == 0L))
      {
        paramViewGroup = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
        if (!TextUtils.isEmpty(strMediaKey)) {
          paramViewGroup.a().a(paramChatMessage, paramView, this);
        }
      }
    }
    return paramView;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    DevicePicItemBuilder.Holder localHolder = (DevicePicItemBuilder.Holder)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      paramView = new AsyncImageView(jdField_a_of_type_AndroidContentContext);
      paramView.setId(2131299562);
      if (!jdField_a_of_type_Boolean) {
        paramView.setAdjustViewBounds(true);
      }
      paramView.setMaxWidth((int)(jdField_b_of_type_Float * 100.0F + 0.5F));
      paramView.setMaxHeight((int)(jdField_b_of_type_Float * 100.0F + 0.5F));
      paramView.setAsyncClipSize((int)(jdField_b_of_type_Float * 100.0F + 0.5F), (int)(jdField_b_of_type_Float * 100.0F + 0.5F));
      paramView.setDefaultImageByMargin();
      paramView.setIsDrawRound(true);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      paramViewHolder.addView(paramView, localLayoutParams);
      jdField_a_of_type_ComDatalineUtilWidgetAsyncImageView = paramView;
      paramView = new MessageProgressTextView(jdField_a_of_type_AndroidContentContext);
      paramView.setTextColor(-1);
      paramView.setTextSize(2, 15.0F);
      paramView.setGravity(17);
      paramView.setBackgroundDrawable(new AIOSendMask(2130706432, jdField_b_of_type_Float * 12.0F));
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(6, 2131299562);
      localLayoutParams.addRule(8, 2131299562);
      localLayoutParams.addRule(5, 2131299562);
      localLayoutParams.addRule(7, 2131299562);
      paramViewHolder.addView(paramView, localLayoutParams);
      paramView.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = paramView;
      paramViewHolder.setOnClickListener(this);
      paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
      paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
    }
    paramBaseChatItemLayout.setTag(localHolder);
    paramChatMessage = (MessageForDeviceFile)paramChatMessage;
    if (("device_groupchat".equals(extStr)) && (msgStatus == 2))
    {
      paramView = BaseApplicationImpl.a().a();
      if ((paramView instanceof QQAppInterface))
      {
        paramView = (QQAppInterface)paramView;
        if (!NetworkUtil.e(BaseApplication.getContext()))
        {
          nFileStatus = 6;
          msgStatus = 1;
          paramChatMessage.serial();
          paramView.a().a(frienduin, istroop, uniseq, msgData);
        }
      }
    }
    a(paramBaseChatItemLayout, paramChatMessage, localHolder);
    ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramViewHolder, this);
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new DevicePicItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "发送了图片";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    if ((paramChatMessage != null) && ((paramChatMessage instanceof MessageForDeviceFile)))
    {
      paramContext = (MessageForDeviceFile)paramChatMessage;
      if (paramInt != 2131304463) {
        break label36;
      }
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
    }
    label36:
    while (paramInt != 2131304473) {
      return;
    }
    super.b(paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    if (aisMultiMsg) {
      return;
    }
    paramView = (MessageForDeviceFile)ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if (paramView.isSendFromLocal())
    {
      localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
      localActionSheet.a(2131367611, 5);
      localActionSheet.d(2131366996);
      localActionSheet.a(new kvh(this, paramView, localActionSheet));
      localActionSheet.show();
      return;
    }
    ActionSheet localActionSheet = ActionSheet.a(jdField_a_of_type_AndroidContentContext);
    localActionSheet.a(2131362405);
    localActionSheet.c(2131362406);
    localActionSheet.d(2131366996);
    localActionSheet.a(new kvi(this, paramView, localActionSheet));
    localActionSheet.show();
  }
  
  public void a(View paramView, MessageForDeviceFile paramMessageForDeviceFile)
  {
    paramView = (DevicePicItemBuilder.Holder)AIOUtils.a(paramView);
    if (paramView == null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_b_of_type_JavaLangString, 2, "error get holder in updateview");
      }
    }
    MessageForDeviceFile localMessageForDeviceFile;
    do
    {
      return;
      localMessageForDeviceFile = (MessageForDeviceFile)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    } while (uniseq != uniseq);
    msgStatus = msgStatus;
    nFileStatus = nFileStatus;
    progress = progress;
    msg = msg;
    a(jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout, localMessageForDeviceFile, paramView);
  }
  
  public void a(BaseChatItemLayout paramBaseChatItemLayout, MessageForDeviceFile paramMessageForDeviceFile, DevicePicItemBuilder.Holder paramHolder)
  {
    boolean bool = false;
    String str = filePath;
    switch (nFileStatus)
    {
    default: 
      if (!TextUtils.isEmpty(str)) {
        jdField_a_of_type_ComDatalineUtilWidgetAsyncImageView.setAsyncImage(str);
      }
      break;
    }
    for (;;)
    {
      paramBaseChatItemLayout.setFailedIconVisable(bool, this);
      return;
      if (issend == 0)
      {
        jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(4);
        break;
      }
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProgress(0);
      break;
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProgress((int)(progress * 100.0F));
      break;
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(4);
      break;
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(4);
      break;
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(4);
      bool = true;
      break;
      jdField_a_of_type_ComDatalineUtilWidgetAsyncImageView.setImageDrawableDefault();
    }
  }
  
  public void a(MessageForDeviceFile paramMessageForDeviceFile)
  {
    if (!NetworkUtil.e(jdField_a_of_type_AndroidContentContext))
    {
      FMToastUtil.a(2131362880);
      return;
    }
    if (FileUtils.b(filePath)) {
      ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(DeviceMsgHandle.d, paramMessageForDeviceFile);
    }
    a();
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(paramView, jdField_a_of_type_AndroidContentContext);
    return paramView.a();
  }
  
  protected void b(View paramView)
  {
    ChatMessage localChatMessage = AIOUtils.a(paramView);
    if (localChatMessage == null) {}
    do
    {
      do
      {
        return;
      } while (istroop != 9501);
      if (localChatMessage.isSendFromLocal())
      {
        super.b(paramView);
        return;
      }
    } while (!"device_groupchat".equals(extStr));
    super.b(paramView);
  }
  
  public void b(MessageForDeviceFile paramMessageForDeviceFile)
  {
    if (!NetworkUtil.e(jdField_a_of_type_AndroidContentContext))
    {
      FMToastUtil.a(2131362880);
      return;
    }
    ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramMessageForDeviceFile);
  }
  
  public void c()
  {
    super.c();
  }
  
  public void onClick(View paramView)
  {
    if (super.a()) {
      return;
    }
    Object localObject1;
    Intent localIntent;
    if (paramView.getId() == 2131296325) {
      try
      {
        Object localObject2 = (MessageForDeviceFile)AIOUtils.a(paramView);
        FileManagerEntity localFileManagerEntity = FileManagerUtil.a((MessageForDeviceFile)localObject2);
        localObject1 = new ForwardFileInfo();
        ((ForwardFileInfo)localObject1).b(10009);
        ((ForwardFileInfo)localObject1).d(8);
        ((ForwardFileInfo)localObject1).b(nSessionId);
        ((ForwardFileInfo)localObject1).d(fileName);
        ((ForwardFileInfo)localObject1).c(uniseq);
        ((ForwardFileInfo)localObject1).d(fileSize);
        ((ForwardFileInfo)localObject1).a(localFileManagerEntity.getFilePath());
        localIntent = new Intent(jdField_a_of_type_AndroidContentContext, FileBrowserActivity.class);
        localIntent.putExtra("fileinfo", (Parcelable)localObject1);
        localObject1 = new ArrayList();
        ((ArrayList)localObject1).add(String.valueOf(nSessionId));
        if (nFileType == 0)
        {
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop);
          if ((localObject2 != null) && (((List)localObject2).size() != 0))
          {
            localObject2 = ((List)localObject2).iterator();
            while (((Iterator)localObject2).hasNext())
            {
              Object localObject3 = (ChatMessage)((Iterator)localObject2).next();
              if (msgtype == 61036)
              {
                localObject3 = (MessageForDeviceFile)localObject3;
                if (FileManagerUtil.a(filePath) == nFileType)
                {
                  localObject3 = FileManagerUtil.a((MessageForDeviceFile)localObject3);
                  if (!((ArrayList)localObject1).contains(String.valueOf(nSessionId)))
                  {
                    ((ArrayList)localObject1).add(String.valueOf(nSessionId));
                    continue;
                    super.onClick(paramView);
                  }
                }
              }
            }
          }
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
    for (;;)
    {
      return;
      localIntent.putStringArrayListExtra("Aio_SessionId_ImageList", (ArrayList)localObject1);
      ((Activity)jdField_a_of_type_AndroidContentContext).startActivityForResult(localIntent, 102);
    }
  }
}
