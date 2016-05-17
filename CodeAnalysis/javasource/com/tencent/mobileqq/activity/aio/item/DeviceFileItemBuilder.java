package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.device.msg.data.DeviceComnFileMsgProcessor;
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
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForDeviceFile;
import com.tencent.mobileqq.data.MessageForDeviceFile.DeviceFileItemCallback;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.ForwardFileInfo;
import com.tencent.mobileqq.filemanager.fileviewer.FileBrowserActivity;
import com.tencent.mobileqq.filemanager.util.FMToastUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.filemanager.widget.AsyncImageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kve;
import kvf;
import kvg;

public class DeviceFileItemBuilder
  extends BaseBubbleBuilder
  implements MessageForDeviceFile.DeviceFileItemCallback
{
  boolean d;
  
  public DeviceFileItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = false;
  }
  
  private RelativeLayout a(kvg paramKvg)
  {
    int i = AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources());
    int j = AIOUtils.a(50.0F, jdField_a_of_type_AndroidContentContext.getResources());
    int k = AIOUtils.a(70.0F, jdField_a_of_type_AndroidContentContext.getResources());
    RelativeLayout localRelativeLayout = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
    localRelativeLayout.setId(2131296325);
    Object localObject2 = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
    ((RelativeLayout)localObject2).setId(2131296374);
    ((RelativeLayout)localObject2).setBackgroundResource(2130839789);
    ((RelativeLayout)localObject2).setPadding(AIOUtils.a(12.0F, jdField_a_of_type_AndroidContentContext.getResources()), i, i, AIOUtils.a(7.0F, jdField_a_of_type_AndroidContentContext.getResources()));
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localObject2);
    Object localObject1 = new RelativeLayout.LayoutParams(-1, -2);
    ((RelativeLayout.LayoutParams)localObject1).addRule(10, 2131296325);
    localRelativeLayout.addView((View)localObject2, (ViewGroup.LayoutParams)localObject1);
    localObject1 = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
    ((RelativeLayout)localObject1).setId(2131296375);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, k);
    localLayoutParams.addRule(10, 2131296374);
    ((RelativeLayout)localObject2).addView((View)localObject1, localLayoutParams);
    localObject2 = new AsyncImageView(jdField_a_of_type_AndroidContentContext, k, k);
    ((AsyncImageView)localObject2).setId(2131296376);
    ((AsyncImageView)localObject2).setScaleType(ImageView.ScaleType.CENTER_CROP);
    localLayoutParams = new RelativeLayout.LayoutParams(k, k);
    localLayoutParams.addRule(9, 2131296375);
    localLayoutParams.addRule(15, 2131296375);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView = ((AsyncImageView)localObject2);
    localObject2 = new ImageView(jdField_a_of_type_AndroidContentContext);
    ((ImageView)localObject2).setId(2131296331);
    ((ImageView)localObject2).setScaleType(ImageView.ScaleType.CENTER_CROP);
    localLayoutParams = new RelativeLayout.LayoutParams(j, j);
    localLayoutParams.addRule(9, 2131296375);
    localLayoutParams.addRule(15, 2131296375);
    localLayoutParams.setMargins(i, 0, 0, 0);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localObject2);
    localObject2 = new TextView(jdField_a_of_type_AndroidContentContext);
    ((TextView)localObject2).setId(2131296378);
    ((TextView)localObject2).setGravity(16);
    ((TextView)localObject2).setIncludeFontPadding(false);
    ((TextView)localObject2).setMaxLines(2);
    ((TextView)localObject2).setTextSize(1, 14.0F);
    ((TextView)localObject2).setTextColor(2131428183);
    localLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
    localLayoutParams.addRule(1, 2131296376);
    localLayoutParams.addRule(11, 2131296375);
    localLayoutParams.addRule(10, 2131296375);
    localLayoutParams.setMargins(i, 0, 0, 0);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localObject2);
    localObject2 = new TextView(jdField_a_of_type_AndroidContentContext);
    ((TextView)localObject2).setId(2131296379);
    ((TextView)localObject2).setSingleLine();
    if (VersionUtils.e()) {
      ((TextView)localObject2).setAlpha(0.75F);
    }
    ((TextView)localObject2).setGravity(17);
    ((TextView)localObject2).setTextColor(Color.parseColor("#777777"));
    ((TextView)localObject2).setTextSize(1, 12.0F);
    localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams.addRule(5, 2131296378);
    localLayoutParams.addRule(12, 2131296375);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    b = ((TextView)localObject2);
    localObject2 = new TextView(jdField_a_of_type_AndroidContentContext);
    ((TextView)localObject2).setId(2131296380);
    ((TextView)localObject2).setSingleLine();
    ((TextView)localObject2).setGravity(5);
    ((TextView)localObject2).setTextColor(Color.parseColor("#777777"));
    ((TextView)localObject2).setTextSize(1, 12.0F);
    localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams.addRule(11, 2131296375);
    localLayoutParams.addRule(12, 2131296375);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    c = ((TextView)localObject2);
    return localRelativeLayout;
  }
  
  private void a(BaseChatItemLayout paramBaseChatItemLayout, MessageForDeviceFile paramMessageForDeviceFile, kvg paramKvg)
  {
    jdField_a_of_type_AndroidWidgetTextView.setText(srcFileName);
    b.setText(FileUtil.a(fileSize));
    FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView, filePath, FileManagerUtil.a(filePath));
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    if ((strServiceName != null) && (strServiceName.compareTo(DeviceMsgHandle.c) == 0)) {
      d = true;
    }
    b(paramKvg, paramMessageForDeviceFile);
    a(paramKvg, paramMessageForDeviceFile);
    paramBaseChatItemLayout.setFailedIconVisable(a(paramMessageForDeviceFile), this);
  }
  
  private void a(kvg paramKvg, MessageForDeviceFile paramMessageForDeviceFile)
  {
    if (paramMessageForDeviceFile == null) {
      c.setVisibility(8);
    }
    String str;
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            str = jdField_a_of_type_AndroidContentContext.getString(2131362721);
            switch (nFileStatus)
            {
            case 0: 
            default: 
              return;
            case -1: 
              if (paramMessageForDeviceFile.isSend())
              {
                c.setVisibility(8);
                return;
              }
              c.setVisibility(0);
              c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362808));
              return;
            case 1: 
            case 2: 
            case 3: 
              if (d)
              {
                c.setVisibility(0);
                if (paramMessageForDeviceFile.isSend())
                {
                  c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131368474));
                  return;
                }
                c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371598));
                return;
              }
              c.setVisibility(8);
              return;
            case 4: 
              if (paramMessageForDeviceFile.isSend())
              {
                c.setVisibility(8);
                return;
              }
              c.setVisibility(0);
              c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362200));
              return;
            case 6: 
              c.setVisibility(0);
              if (paramMessageForDeviceFile.isSend())
              {
                c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362811));
                return;
              }
              if (d)
              {
                c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371601));
                return;
              }
              c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362812));
              return;
            case 5: 
              c.setVisibility(0);
              if (paramMessageForDeviceFile.isSend())
              {
                if (d)
                {
                  c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371599));
                  return;
                }
                c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362807));
                return;
              }
              if (d)
              {
                c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371602));
                return;
              }
              c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362805));
              return;
            case 9: 
              c.setVisibility(0);
            }
          } while ((paramMessageForDeviceFile.isSend()) || (!d));
          c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371603));
          return;
          c.setVisibility(0);
        } while ((paramMessageForDeviceFile.isSend()) || (!d));
        c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371604));
        return;
        c.setVisibility(0);
      } while ((paramMessageForDeviceFile.isSend()) || (!d));
      c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371605));
      return;
      c.setVisibility(0);
    } while (!d);
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131371600));
  }
  
  private boolean a(MessageForDeviceFile paramMessageForDeviceFile)
  {
    if (paramMessageForDeviceFile == null) {
      return false;
    }
    switch (nFileStatus)
    {
    default: 
      return false;
    }
    return true;
  }
  
  private void b(kvg paramKvg, MessageForDeviceFile paramMessageForDeviceFile)
  {
    if (paramMessageForDeviceFile != null) {}
    int i;
    switch (nFileStatus)
    {
    default: 
      i = 0;
      if (i != 0)
      {
        if (jdField_a_of_type_AndroidWidgetProgressBar == null)
        {
          localProgressBar = new ProgressBar(jdField_a_of_type_AndroidContentContext, null, 16842872);
          localProgressBar.setId(2131296381);
          localProgressBar.setMax(100);
          localProgressBar.setMinimumHeight(AIOUtils.a(4.0F, jdField_a_of_type_AndroidContentContext.getResources()));
          localProgressBar.setProgressDrawable(jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130837558));
          localLayoutParams = new RelativeLayout.LayoutParams(-1, AIOUtils.a(4.0F, jdField_a_of_type_AndroidContentContext.getResources()));
          localLayoutParams.addRule(3, 2131296375);
          localLayoutParams.addRule(12, 2131296374);
          localLayoutParams.setMargins(0, AIOUtils.a(2.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
          jdField_a_of_type_AndroidWidgetRelativeLayout.addView(localProgressBar, localLayoutParams);
          jdField_a_of_type_AndroidWidgetProgressBar = localProgressBar;
        }
        jdField_a_of_type_AndroidWidgetProgressBar.setProgress((int)(progress * 100.0F));
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
      }
      break;
    }
    while (jdField_a_of_type_AndroidWidgetProgressBar == null)
    {
      ProgressBar localProgressBar;
      RelativeLayout.LayoutParams localLayoutParams;
      return;
      i = 1;
      break;
    }
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
  }
  
  private void c(MessageForDeviceFile paramMessageForDeviceFile) {}
  
  private void d(View paramView)
  {
    Object localObject2 = (MessageForDeviceFile)AIOUtils.a(paramView);
    paramView = FileManagerUtil.a((MessageForDeviceFile)localObject2);
    Object localObject1 = new ForwardFileInfo();
    if ((d) && (nFileType != 0)) {
      ((ForwardFileInfo)localObject1).b(10000);
    }
    Intent localIntent;
    for (;;)
    {
      ((ForwardFileInfo)localObject1).d(8);
      ((ForwardFileInfo)localObject1).b(nSessionId);
      ((ForwardFileInfo)localObject1).d(fileName);
      ((ForwardFileInfo)localObject1).c(uniseq);
      ((ForwardFileInfo)localObject1).d(fileSize);
      ((ForwardFileInfo)localObject1).a(paramView.getFilePath());
      ((ForwardFileInfo)localObject1).b(Uuid);
      localIntent = new Intent(jdField_a_of_type_AndroidContentContext, FileBrowserActivity.class);
      localIntent.putExtra("fileinfo", (Parcelable)localObject1);
      localObject1 = new ArrayList();
      if ((nFileType != 0) && (nFileType != 1)) {
        break;
      }
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop);
      if ((localObject2 == null) || (((List)localObject2).size() == 0)) {
        break;
      }
      localObject2 = ((List)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        Object localObject3 = (ChatMessage)((Iterator)localObject2).next();
        if (msgtype == 61036)
        {
          localObject3 = (MessageForDeviceFile)localObject3;
          if (FileManagerUtil.a(filePath) == nFileType) {
            ((ArrayList)localObject1).add(String.valueOf(anSessionId));
          }
        }
      }
      ((ForwardFileInfo)localObject1).b(10009);
    }
    localIntent.putStringArrayListExtra("Aio_SessionId_ImageList", (ArrayList)localObject1);
    ((Activity)jdField_a_of_type_AndroidContentContext).startActivityForResult(localIntent, 102);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    getTagjdField_a_of_type_AndroidViewView.getLayoutParams().width = BaseChatItemLayout.h;
    return paramChatMessage;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    kvg localKvg = (kvg)paramViewHolder;
    MessageForDeviceFile localMessageForDeviceFile = (MessageForDeviceFile)paramChatMessage;
    paramChatMessage = paramView;
    if (paramView == null) {
      paramChatMessage = a((kvg)paramViewHolder);
    }
    c(localMessageForDeviceFile);
    a(paramBaseChatItemLayout, localMessageForDeviceFile, localKvg);
    paramChatMessage.setOnLongClickListener(paramOnLongClickAndTouchListener);
    paramChatMessage.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramChatMessage.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
    ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramChatMessage, this);
    return paramChatMessage;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new kvg(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "发送了文件";
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
    if (aisMultiMsg) {}
    do
    {
      return;
      paramView = (MessageForDeviceFile)ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
      if (paramView.isSendFromLocal())
      {
        localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
        localActionSheet.a(2131367611, 5);
        localActionSheet.d(2131366996);
        localActionSheet.a(new kve(this, paramView, localActionSheet));
        localActionSheet.show();
        return;
      }
    } while (d);
    ActionSheet localActionSheet = ActionSheet.a(jdField_a_of_type_AndroidContentContext);
    localActionSheet.a(2131362405);
    localActionSheet.c(2131362406);
    localActionSheet.d(2131366996);
    localActionSheet.a(new kvf(this, paramView, localActionSheet));
    localActionSheet.show();
  }
  
  public void a(View paramView, MessageForDeviceFile paramMessageForDeviceFile)
  {
    paramView = (kvg)AIOUtils.a(paramView);
    if (paramView == null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "error get holder in updateview");
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
  
  public void a(MessageForDeviceFile paramMessageForDeviceFile)
  {
    if (!NetworkUtil.e(jdField_a_of_type_AndroidContentContext))
    {
      FMToastUtil.a(2131362880);
      return;
    }
    if (FileUtils.b(filePath)) {
      ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(strServiceName, paramMessageForDeviceFile);
    }
    super.a();
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(paramView, jdField_a_of_type_AndroidContentContext);
    return paramView.a();
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
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
    if (super.a()) {}
    MessageForDeviceFile localMessageForDeviceFile;
    do
    {
      return;
      localMessageForDeviceFile = (MessageForDeviceFile)AIOUtils.a(paramView);
    } while (((paramView.getId() == 2131296317) && (localMessageForDeviceFile != null) && (uint32_src_uin_type == 1)) || (d));
    super.onClick(paramView);
    switch (paramView.getId())
    {
    case 2131296316: 
    case 2131296331: 
    default: 
      return;
    }
    d(paramView);
  }
}
