package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.component.network.utils.NetworkUtils;
import com.tencent.image.URLDrawable;
import com.tencent.image.Utils;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager.DpcAccountNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.BaseMessageManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.drawable.EmptyDrawable;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.dc.DCShortVideo;
import com.tencent.mobileqq.shortvideo.ShortVideoBusiManager;
import com.tencent.mobileqq.shortvideo.ShortVideoConstants;
import com.tencent.mobileqq.shortvideo.ShortVideoDownloadInfo;
import com.tencent.mobileqq.shortvideo.ShortVideoReq;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.shortvideo.util.ShortVideoTrimmer;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.ShortVideoDownloadProcessor;
import com.tencent.mobileqq.transfile.ShortVideoForwardProcessor;
import com.tencent.mobileqq.transfile.ShortVideoUploadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.BubbleImageView;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.ProgressPieView;
import java.net.URL;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import lae;
import laf;
import lag;
import lah;
import lai;
import mqq.os.MqqHandler;

public class ShortVideoItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback, ShortVideoConstants
{
  public static AtomicLong a;
  static long jdField_b_of_type_Long = 0L;
  private static final String jdField_b_of_type_JavaLangString = "ShortVideoItemBuilder";
  static long c;
  long jdField_a_of_type_Long;
  private Runnable jdField_a_of_type_JavaLangRunnable = new lah(this);
  boolean d;
  boolean e = false;
  public int h = 0;
  int i = -1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Long = 0L;
    c = 1000L;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicLong = new AtomicLong(-1L);
  }
  
  public ShortVideoItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
  }
  
  public static Drawable a(int paramInt1, int paramInt2)
  {
    return new EmptyDrawable(-16777216, paramInt1, paramInt2);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramView = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramViewGroup = FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (paramViewGroup != null) {
      paramViewGroup.a(paramView, this);
    }
    if (jdField_b_of_type_Boolean) {}
    try
    {
      paramViewGroup = (ShortVideoItemBuilder.Holder)paramView.getTag();
      jdField_b_of_type_JavaLangStringBuilder.append(jdField_a_of_type_AndroidWidgetTextView.getText());
      jdField_b_of_type_JavaLangStringBuilder.append(String.valueOf(videoFileTime));
      jdField_b_of_type_JavaLangStringBuilder.append("秒按钮");
      paramView.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
      return paramView;
    }
    catch (Exception paramChatMessage) {}
    return paramView;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramViewHolder = (ShortVideoItemBuilder.Holder)paramViewHolder;
    Object localObject1 = jdField_a_of_type_AndroidContentContext.getResources();
    paramBaseChatItemLayout = (MessageForShortVideo)paramChatMessage;
    boolean bool = paramBaseChatItemLayout.isSend();
    paramChatMessage = paramView;
    Object localObject2;
    int j;
    if (paramView == null)
    {
      paramChatMessage = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      paramView = new BubbleImageView(jdField_a_of_type_AndroidContentContext);
      paramView.setId(2131299562);
      paramView.setAdjustViewBounds(true);
      paramView.setMinimumWidth((int)(a_ * 100.0F + 0.5F));
      paramView.setMinimumHeight((int)(a_ * 100.0F + 0.5F));
      paramView.setMaxWidth((int)(a_ * 160.0F + 0.5F));
      paramView.setMaxHeight((int)(a_ * 160.0F + 0.5F));
      paramChatMessage.addView(paramView);
      localObject2 = new ProgressBar(jdField_a_of_type_AndroidContentContext, null, 0);
      ((ProgressBar)localObject2).setIndeterminate(true);
      ((ProgressBar)localObject2).setIndeterminateDrawable(jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130838189));
      j = AIOUtils.a(20.0F, jdField_a_of_type_AndroidContentContext.getResources());
      Object localObject3 = new RelativeLayout.LayoutParams(j, j);
      ((RelativeLayout.LayoutParams)localObject3).addRule(13);
      paramChatMessage.addView((View)localObject2, (ViewGroup.LayoutParams)localObject3);
      localObject3 = new ProgressPieView(jdField_a_of_type_AndroidContentContext);
      Object localObject4 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject4).addRule(13);
      ((ProgressPieView)localObject3).setProgressColor(-16723201);
      ((ProgressPieView)localObject3).setStrokeColor(-1);
      ((ProgressPieView)localObject3).setId(2131296344);
      ((ProgressPieView)localObject3).setShowImage(true);
      ((ProgressPieView)localObject3).setOnClickListener(this);
      ((ProgressPieView)localObject3).setOnTouchListener(paramOnLongClickAndTouchListener);
      ((ProgressPieView)localObject3).setOnLongClickListener(paramOnLongClickAndTouchListener);
      paramChatMessage.addView((View)localObject3, (ViewGroup.LayoutParams)localObject4);
      localObject4 = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      ((RelativeLayout)localObject4).setBackgroundResource(2130838057);
      Object localObject5 = new RelativeLayout.LayoutParams(-1, AIOUtils.a(25.0F, (Resources)localObject1));
      ((RelativeLayout.LayoutParams)localObject5).addRule(5, 2131299562);
      ((RelativeLayout.LayoutParams)localObject5).addRule(7, 2131299562);
      ((RelativeLayout.LayoutParams)localObject5).addRule(8, 2131299562);
      paramChatMessage.addView((View)localObject4, (ViewGroup.LayoutParams)localObject5);
      localObject5 = new TextView(jdField_a_of_type_AndroidContentContext);
      ((TextView)localObject5).setTextSize(1, 12.0F);
      ((TextView)localObject5).setTextColor(-1);
      Object localObject6 = new RelativeLayout.LayoutParams(-2, -2);
      leftMargin = AIOUtils.a(5.0F, (Resources)localObject1);
      ((RelativeLayout.LayoutParams)localObject6).addRule(9);
      ((RelativeLayout.LayoutParams)localObject6).addRule(15);
      ((RelativeLayout)localObject4).addView((View)localObject5, (ViewGroup.LayoutParams)localObject6);
      localObject6 = new TextView(jdField_a_of_type_AndroidContentContext);
      ((TextView)localObject6).setTextSize(1, 12.0F);
      ((TextView)localObject6).setTextColor(-1);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      rightMargin = AIOUtils.a(5.0F, (Resources)localObject1);
      localLayoutParams.addRule(11);
      localLayoutParams.addRule(15);
      ((RelativeLayout)localObject4).addView((View)localObject6, localLayoutParams);
      paramChatMessage.setOnClickListener(this);
      paramChatMessage.setOnTouchListener(paramOnLongClickAndTouchListener);
      paramChatMessage.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)localObject2);
      jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView = paramView;
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localObject4);
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localObject5);
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)localObject6);
      jdField_a_of_type_ComTencentWidgetProgressPieView = ((ProgressPieView)localObject3);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.jdField_b_of_type_Boolean = bool;
    paramView = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetRelativeLayout.getLayoutParams();
    label674:
    int k;
    if (bool)
    {
      leftMargin = 0;
      rightMargin = AIOUtils.a(10.0F, (Resources)localObject1);
      jdField_b_of_type_AndroidWidgetTextView.setText(ShortVideoUtils.a(videoFileTime * 1000));
      localObject2 = ShortVideoUtils.a(thumbMD5, "jpg");
      paramView = jdField_a_of_type_ComTencentWidgetProgressPieView;
      if (thumbWidth <= 0) {
        break label883;
      }
      j = thumbWidth;
      if (thumbHeight <= 0) {
        break label890;
      }
      k = thumbHeight;
      label689:
      paramOnLongClickAndTouchListener = ShortVideoUtils.a(new int[] { j, k });
      j = (int)(a_ * paramOnLongClickAndTouchListener[0] + 0.5F);
      float f = a_;
      localObject1 = a(j, (int)(paramOnLongClickAndTouchListener[1] * f + 0.5F));
      if (md5 != null) {
        break label959;
      }
      if (paramBaseChatItemLayout.isSendFromLocal())
      {
        jdField_a_of_type_AndroidWidgetTextView.setText("");
        if (FileUtils.b((String)localObject2))
        {
          paramOnLongClickAndTouchListener = ShortVideoUtils.a((String)localObject2);
          if ((jdField_a_of_type_ComTencentImageURLDrawable == null) || (!jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramOnLongClickAndTouchListener)))
          {
            paramOnLongClickAndTouchListener = URLDrawable.getDrawable(paramOnLongClickAndTouchListener, (Drawable)localObject1, (Drawable)localObject1);
            jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.setImageDrawable(paramOnLongClickAndTouchListener);
            jdField_a_of_type_ComTencentImageURLDrawable = paramOnLongClickAndTouchListener;
          }
          if (videoFileStatus != 1005) {
            break label897;
          }
          paramView.setImageResource(2130842436);
          a(paramViewHolder, false);
        }
      }
    }
    label883:
    label890:
    label897:
    label959:
    label1388:
    label1687:
    label1798:
    label1934:
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
                  return paramChatMessage;
                  leftMargin = AIOUtils.a(10.0F, (Resources)localObject1);
                  rightMargin = 0;
                  break;
                  j = 100;
                  break label674;
                  k = 100;
                  break label689;
                  a(paramViewHolder, true);
                } while (videoFileStatus == 998);
                Utils.executeAsyncTaskOnSerialExcuter(new lai(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, paramBaseChatItemLayout), new Void[0]);
              } while (!QLog.isColorLevel());
              QLog.d("ShortVideoItemBuilder", 2, "getBubbleView(): msg.md5 == null, start compress task..");
              return paramChatMessage;
              a(paramViewHolder, false);
              jdField_a_of_type_AndroidWidgetTextView.setText(ShortVideoUtils.a(jdField_a_of_type_AndroidContentContext, videoFileSize));
              paramOnLongClickAndTouchListener = ShortVideoUtils.a(paramBaseChatItemLayout, "mp4");
              if (FileUtils.b((String)localObject2))
              {
                localObject2 = ShortVideoUtils.a((String)localObject2);
                if ((jdField_a_of_type_ComTencentImageURLDrawable == null) || (!jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(localObject2)))
                {
                  localObject1 = URLDrawable.getDrawable((URL)localObject2, (Drawable)localObject1, (Drawable)localObject1);
                  jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.setImageDrawable((Drawable)localObject1);
                  jdField_a_of_type_ComTencentImageURLDrawable = ((URLDrawable)localObject1);
                }
              }
              do
              {
                for (;;)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("ShortVideoItemBuilder", 2, "getBubbleView ，video no exits: sendFromLocal=" + paramBaseChatItemLayout.isSendFromLocal() + "===>  fileType:" + ShortVideoUtils.a(fileType) + " ===> videoFileStatus:" + ShortVideoUtils.b(videoFileStatus) + "===> videoFileProgress:" + videoFileProgress + ", uniseq:" + uniseq);
                  }
                  localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
                  if ((fileType != 6) && (fileType != 17) && (fileType != 9) && (fileType != 19) && (fileType != 20)) {
                    break label1956;
                  }
                  switch (videoFileStatus)
                  {
                  default: 
                    a(paramView);
                    return paramChatMessage;
                    if (((fileType != 7) && (fileType != 18) && (fileType != 16)) || (videoFileStatus != 5002)) {
                      break label1388;
                    }
                    jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.setImageDrawable((Drawable)localObject1);
                    if (QLog.isColorLevel()) {
                      QLog.d("ShortVideoItemBuilder", 2, "getBubbleView not download pic : 缩略图不存在，而且文件已经过期，不下载, , uniseq:" + uniseq);
                    }
                    break;
                  }
                }
              } while (extraflag == 32768);
              if (QLog.isColorLevel()) {
                QLog.d("ShortVideoItemBuilder", 2, "getBubbleView not SendFromLocal : 缩略图不存在，开始下载缩略图, , uniseq:" + uniseq);
              }
              jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.setImageDrawable((Drawable)localObject1);
              localObject1 = ShortVideoBusiManager.a(2, h);
              localObject2 = paramBaseChatItemLayout.getDownloadInfo(g);
              i = ShortVideoUtils.a(thumbMD5, "jpg");
              if ((istroop == 0) || (istroop == 1008)) {
                g = 1002;
              }
              for (;;)
              {
                if (QLog.isColorLevel()) {
                  QLog.d("ShortVideoItemBuilder", 2, " startDownloadVideoThumb downloadVideo fileType=" + g + ", uniseq:" + uniseq);
                }
                ((ShortVideoReq)localObject1).a((ShortVideoDownloadInfo)localObject2);
                ((ShortVideoReq)localObject1).a(paramBaseChatItemLayout);
                ShortVideoBusiManager.a((ShortVideoReq)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                break;
                if (istroop == 3000) {
                  g = 1006;
                } else if (istroop == 1) {
                  g = 1004;
                }
              }
              if (localObject1 != null) {
                break label1687;
              }
              jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
              a(jdField_a_of_type_ComTencentWidgetProgressPieView);
            } while (!QLog.isColorLevel());
            QLog.d("ShortVideoItemBuilder", 2, "getBubbleView : --> STATUS_SEND_START, 上传开始被杀进程然后恢复, uniseq:" + uniseq);
            return paramChatMessage;
            a(paramView, videoFileProgress);
            return paramChatMessage;
            k = Math.min(videoFileProgress, 100);
            j = k;
            if (k == 0) {
              j = 1;
            }
            paramView.setProgress(j);
            paramView.setImageResource(2130842438);
            return paramChatMessage;
            if (localObject1 != null) {
              break label1798;
            }
            jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
            a(jdField_a_of_type_ComTencentWidgetProgressPieView);
          } while (!QLog.isColorLevel());
          QLog.d("ShortVideoItemBuilder", 2, "getBubbleView : --> STATUS_SEND_PROCESS, 上传过程中被杀进程然后恢复, uniseq:" + uniseq);
          return paramChatMessage;
        } while (jdField_a_of_type_ComTencentWidgetProgressPieView.a() != null);
        a(paramView, videoFileProgress);
        return paramChatMessage;
        a(paramView, videoFileProgress);
        return paramChatMessage;
        if (FileUtils.b(paramOnLongClickAndTouchListener))
        {
          a(paramView);
          return paramChatMessage;
        }
        k = Math.min(videoFileProgress, 100);
        j = k;
        if (k == 0) {
          j = 1;
        }
        paramView.setProgress(j);
        paramView.setImageResource(2130842436);
        return paramChatMessage;
        if (localObject1 != null) {
          break label1934;
        }
        a(paramView);
      } while (!QLog.isColorLevel());
      QLog.d("ShortVideoItemBuilder", 2, "getBubbleView : SHORT_VIDEO <-- STATUS_RECV_PROCESS, 下载过程中被杀进程然后恢复, uniseq:" + uniseq);
      return paramChatMessage;
    } while (jdField_a_of_type_ComTencentWidgetProgressPieView.a() != null);
    a(paramView, videoFileProgress);
    return paramChatMessage;
    label1956:
    a(paramView);
    return paramChatMessage;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new ShortVideoItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return "发出视频";
    }
    return "发来视频";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    MessageForShortVideo localMessageForShortVideo;
    if ((paramChatMessage != null) && ((paramChatMessage instanceof MessageForShortVideo)))
    {
      localMessageForShortVideo = (MessageForShortVideo)paramChatMessage;
      i = paramInt;
      if (paramInt != 2131304463) {
        break label42;
      }
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
    }
    for (;;)
    {
      return;
      label42:
      if (paramInt == 2131304473)
      {
        super.b(paramChatMessage);
        return;
      }
      if (paramInt == 2131298639)
      {
        c(localMessageForShortVideo);
        return;
      }
      if (paramInt == 2131296347)
      {
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoItemBuilder", 2, "onMenuItemClicked(): msg_revoke =>" + localMessageForShortVideo.toLogString());
        }
        if (md5 == null)
        {
          ShortVideoTrimmer.a.set(false);
          paramContext = ShortVideoTrimmer.a();
          if (paramContext != null) {
            paramContext.destroy();
          }
          jdField_a_of_type_JavaUtilConcurrentAtomicAtomicLong.set(uniseq);
          ((QQMessageFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(19)).a(istroop).d(localMessageForShortVideo);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80056B1", "0X80056B1", 0, 0, "", "", "", "");
          return;
        }
        paramContext = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
        if ((paramContext == null) || ((!ShortVideoUploadProcessor.class.isInstance(paramContext)) && (!ShortVideoForwardProcessor.class.isInstance(paramContext)))) {
          break label409;
        }
        boolean bool = ((BaseTransProcessor)paramContext).c();
        paramInt = videoFileStatus;
        if ((!bool) && (paramInt != 1002) && (paramInt != 1001)) {
          break label409;
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(frienduin, uniseq);
        ((QQMessageFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(19)).a(istroop).d(localMessageForShortVideo);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80056B1", "0X80056B1", 0, 0, "", "", "", "");
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoItemBuilder", 2, "onMenuItemClicked: stop uploading short video");
        }
      }
      label409:
      for (paramInt = 0; paramInt != 0; paramInt = 1)
      {
        super.a(localMessageForShortVideo);
        return;
        super.a(paramInt, paramContext, paramChatMessage);
        return;
      }
    }
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    paramView = (ShortVideoItemBuilder.Holder)AIOUtils.a(paramView);
    MessageForShortVideo localMessageForShortVideo = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if (localMessageForShortVideo.isSendFromLocal())
    {
      ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
      localActionSheet.a(2131367611, 5);
      localActionSheet.d(2131366996);
      localActionSheet.a(new lag(this, localMessageForShortVideo, paramView, localActionSheet));
      localActionSheet.show();
    }
  }
  
  protected void a(View paramView, ChatMessage paramChatMessage)
  {
    int j = jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131493057);
    if (paramChatMessage.isSend())
    {
      paramView.setPadding(BaseChatItemLayout.n, BaseChatItemLayout.k, j, BaseChatItemLayout.l);
      return;
    }
    paramView.setPadding(j, BaseChatItemLayout.k, BaseChatItemLayout.n, BaseChatItemLayout.l);
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    paramView = (ShortVideoItemBuilder.Holder)AIOUtils.a(paramView);
    Object localObject1 = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    Object localObject2 = jdField_a_of_type_ComTencentWidgetProgressPieView;
    if (uniseq != c) {}
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
                if ((e != 6) && (e != 17) && (e != 9) && (e != 20)) {
                  break;
                }
                switch (M)
                {
                case 1004: 
                case 2004: 
                default: 
                  return;
                case 1001: 
                  if (a != 0L) {
                    a((ProgressPieView)localObject2, (int)(100L * f / a));
                  }
                  jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(false, this);
                  return;
                case 1003: 
                  a(jdField_a_of_type_ComTencentWidgetProgressPieView);
                  return;
                case 1005: 
                  a(jdField_a_of_type_ComTencentWidgetProgressPieView);
                  jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
                  return;
                }
              } while (!((MessageForShortVideo)localObject1).isSendFromLocal());
              if (a != 0L)
              {
                a((ProgressPieView)localObject2, (int)(100L * f / a));
                return;
              }
            } while (!QLog.isColorLevel());
            QLog.e("ShortVideoItemBuilder", 2, "handleMessage VIDEO ==> STATUS_SEND_PROCESS: fileSize == 0 ");
            return;
          } while (a == 0L);
          a((ProgressPieView)localObject2, (int)(100L * f / a));
          return;
          a((ProgressPieView)localObject2);
          paramView = ShortVideoUtils.a(thumbMD5, "jpg");
        } while (FileUtils.b(paramView));
        paramFileMsg = ShortVideoBusiManager.a(2, h);
        localObject2 = ((MessageForShortVideo)localObject1).getDownloadInfo(g);
        i = paramView;
        if ((istroop == 0) || (istroop == 1008)) {
          g = 1002;
        }
        for (;;)
        {
          paramFileMsg.a((ShortVideoDownloadInfo)localObject2);
          paramFileMsg.a((MessageForShortVideo)localObject1);
          ShortVideoBusiManager.a(paramFileMsg, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          return;
          if (istroop == 3000) {
            g = 1006;
          } else if (istroop == 1) {
            g = 1004;
          }
        }
        a(jdField_a_of_type_ComTencentWidgetProgressPieView);
        QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371160, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
        return;
        a(jdField_a_of_type_ComTencentWidgetProgressPieView);
        if (uiOperatorFlag == 2)
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
          QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371171, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
          return;
        }
        QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371161, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
        return;
        a(jdField_a_of_type_ComTencentWidgetProgressPieView);
        if (uiOperatorFlag == 2)
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
          QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371172, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
          return;
        }
        QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371162, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
        return;
      } while (a == 0L);
      a((ProgressPieView)localObject2, (int)(100L * f / a));
      return;
    } while ((e != 7) && (e != 18) && (e != 16));
    switch (M)
    {
    case 2001: 
    case 2002: 
    default: 
      return;
    }
    paramFileMsg = ShortVideoUtils.a(ShortVideoUtils.a(thumbMD5, "jpg"));
    if (thumbWidth > 0)
    {
      paramInt1 = thumbWidth;
      label806:
      if (thumbHeight <= 0) {
        break label933;
      }
    }
    label933:
    for (paramInt2 = thumbHeight;; paramInt2 = 100)
    {
      localObject1 = ShortVideoUtils.a(new int[] { paramInt1, paramInt2 });
      paramInt1 = (int)(a_ * localObject1[0] + 0.5F);
      float f = a_;
      localObject1 = a(paramInt1, (int)(localObject1[1] * f + 0.5F));
      if ((jdField_a_of_type_ComTencentImageURLDrawable != null) && (jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramFileMsg))) {
        break;
      }
      try
      {
        paramFileMsg = URLDrawable.getDrawable(paramFileMsg, (Drawable)localObject1, (Drawable)localObject1);
        jdField_a_of_type_ComTencentMobileqqWidgetBubbleImageView.setImageDrawable(paramFileMsg);
        jdField_a_of_type_ComTencentImageURLDrawable = paramFileMsg;
        return;
      }
      catch (Exception paramView)
      {
        paramView.printStackTrace();
        return;
      }
      paramInt1 = 100;
      break label806;
    }
  }
  
  public void a(ShortVideoItemBuilder.Holder paramHolder, boolean paramBoolean)
  {
    if (paramHolder == null) {
      return;
    }
    if (paramBoolean)
    {
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
      jdField_a_of_type_ComTencentWidgetProgressPieView.setVisibility(8);
      return;
    }
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
    jdField_a_of_type_ComTencentWidgetProgressPieView.setVisibility(0);
  }
  
  public void a(MessageForShortVideo paramMessageForShortVideo)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d())
    {
      QQToast.a(jdField_a_of_type_AndroidContentContext, 0, 2131371170, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      return;
    }
    if (!paramMessageForShortVideo.isSend()) {
      new DCShortVideo(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2002, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 1001);
    }
    String str = ShortVideoUtils.a(thumbMD5, "jpg");
    Bundle localBundle = new Bundle();
    localBundle.putInt("uintype", istroop);
    localBundle.putString("from_uin", ShortVideoUtils.c(paramMessageForShortVideo));
    localBundle.putInt("from_uin_type", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    localBundle.putString("from_session_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localBundle.putInt("from_busi_type", busiType);
    localBundle.putInt("file_send_size", videoFileSize);
    localBundle.putInt("file_send_duration", videoFileTime);
    localBundle.putString("file_name", videoFileName);
    localBundle.putInt("file_format", videoFileFormat);
    localBundle.putString("thumbfile_send_path", str);
    localBundle.putString("file_shortvideo_md5", md5);
    localBundle.putInt("thumbfile_send_width", thumbWidth);
    localBundle.putInt("thumbfile_send_height", thumbHeight);
    localBundle.putString("thumbfile_md5", thumbMD5);
    localBundle.putString("file_source", fileSource);
    localBundle.putString("file_uuid", uuid);
    localBundle.putInt("file_thumb_Size", thumbFileSize);
    localBundle.putBoolean("support_progressive", supportProgressive);
    localBundle.putInt("file_width", fileWidth);
    localBundle.putInt("file_height", fileHeight);
    localBundle.putInt("video_play_caller", 0);
    localBundle.putParcelable("key_message_for_shortvideo", paramMessageForShortVideo);
    paramMessageForShortVideo = new Intent(jdField_a_of_type_AndroidContentContext, ShortVideoPlayActivity.class);
    paramMessageForShortVideo.putExtras(localBundle);
    ((Activity)jdField_a_of_type_AndroidContentContext).startActivityForResult(paramMessageForShortVideo, 13002);
    ((Activity)jdField_a_of_type_AndroidContentContext).overridePendingTransition(2130968619, 2130968620);
    ThreadManager.a().post(jdField_a_of_type_JavaLangRunnable);
  }
  
  public void a(MessageForShortVideo paramMessageForShortVideo, ShortVideoItemBuilder.Holder paramHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoItemBuilder", 2, "startUploadVideo：" + paramMessageForShortVideo.toString());
    }
    String str1 = videoFileName;
    String str2 = ShortVideoUtils.a(thumbMD5, "jpg");
    if (!FileUtils.b(str1))
    {
      QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131371151, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      a(jdField_a_of_type_ComTencentWidgetProgressPieView);
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
      videoFileStatus = 1005;
      return;
    }
    if (!FileUtils.b(str2))
    {
      QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131371152, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      a(jdField_a_of_type_ComTencentWidgetProgressPieView);
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
      videoFileStatus = 1005;
      return;
    }
    paramHolder = ShortVideoBusiManager.a(1, h);
    paramHolder.a(ShortVideoBusiManager.a(h, paramMessageForShortVideo, paramHolder));
    ShortVideoBusiManager.a(paramHolder, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  protected void a(ProgressPieView paramProgressPieView)
  {
    paramProgressPieView.setProgress(0);
    paramProgressPieView.setImageResource(2130842436);
  }
  
  protected void a(ProgressPieView paramProgressPieView, int paramInt)
  {
    if (paramInt < 100)
    {
      int j = paramInt;
      if (paramInt <= 0) {
        j = 1;
      }
      paramProgressPieView.setProgress(j);
      paramProgressPieView.setImageResource(2130842435);
      return;
    }
    a(paramProgressPieView);
  }
  
  protected boolean a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramChatMessage.isSendFromLocal())
    {
      paramChatMessage = (MessageForShortVideo)paramChatMessage;
      if (videoFileStatus != 1005) {
        break label35;
      }
      bool1 = true;
    }
    label35:
    do
    {
      return bool1;
      bool1 = bool2;
    } while (md5 == null);
    int j;
    if (uiOperatorFlag == 2) {
      if ((videoFileStatus == 5002) || (videoFileStatus == 5001)) {
        j = 1;
      }
    }
    for (;;)
    {
      label76:
      if ((videoFileStatus == 1005) || (extraflag == 32768)) {}
      for (int k = 1;; k = 0)
      {
        int m = k;
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq) == null)
        {
          m = k;
          if (videoFileProgress != 100)
          {
            m = k;
            if (videoFileStatus != 1003)
            {
              m = k;
              if (videoFileStatus != 1004) {
                m = 1;
              }
            }
          }
        }
        if (j == 0)
        {
          bool1 = bool2;
          if (m == 0) {
            break;
          }
        }
        return true;
        j = 0;
        break label76;
      }
      j = 0;
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    boolean bool3 = false;
    ShortVideoItemBuilder.Holder localHolder = (ShortVideoItemBuilder.Holder)AIOUtils.a(paramView);
    MessageForShortVideo localMessageForShortVideo = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoItemBuilder", 2, "getMenuItem, msg.uniseq:" + uniseq + ",fileType===>" + ShortVideoUtils.a(fileType) + " ===> fileStatus:" + ShortVideoUtils.b(videoFileStatus));
    }
    int j;
    boolean bool1;
    label198:
    boolean bool2;
    if ((localMessageForShortVideo != null) && (!TextUtils.isEmpty(md5)))
    {
      paramView = ShortVideoUtils.a(thumbMD5, "jpg");
      if (FileUtils.b(paramView))
      {
        paramView = "";
        j = 1;
        if (j == 0) {
          break label509;
        }
        if (!"1".equals(DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.shortvideo_forward_switch.name(), "1"))) {
          break label497;
        }
        boolean bool4 = localMessageForShortVideo.checkForward();
        if ((jdField_a_of_type_ComTencentWidgetProgressPieView == null) || (jdField_a_of_type_ComTencentWidgetProgressPieView.a() <= 0)) {
          break label504;
        }
        bool1 = true;
        bool2 = bool3;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.b != null)
        {
          bool2 = bool3;
          if (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.b.getVisibility() == 0) {
            bool2 = true;
          }
        }
        if ((!bool4) || (bool1) || (bool2)) {
          break label458;
        }
        localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
        paramView = paramView + "inMiddleStatus = false, progeressBarShowing = false, errorIconShowing = false, show forward menu.";
      }
    }
    label458:
    label497:
    label504:
    label509:
    for (;;)
    {
      a(localMessageForShortVideo, localQQCustomMenu);
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoItemBuilder", 2, "getMenuItem: " + paramView);
      }
      if ((localMessageForShortVideo != null) && (localMessageForShortVideo.isSend()) && ((jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.b == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.b.getVisibility() != 0))) {
        a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, localMessageForShortVideo);
      }
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
      e = true;
      return localQQCustomMenu.a();
      paramView = "thumbFilePath=" + paramView + " , not exits.";
      j = 0;
      break;
      paramView = " msg == null or md5 is empty.";
      j = 0;
      break;
      paramView = paramView + "progeressBarShowing=" + bool1 + ", errorIconShowing=" + bool2;
      continue;
      paramView = " not inDPCWhiteList.";
      continue;
      bool1 = false;
      break label198;
    }
  }
  
  public void b(MessageForShortVideo paramMessageForShortVideo, ShortVideoItemBuilder.Holder paramHolder)
  {
    if (paramMessageForShortVideo == null) {}
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoItemBuilder", 2, "reForwardVideo：" + paramMessageForShortVideo.toString());
      }
      if (!FileUtils.b(ShortVideoUtils.a(thumbMD5, "jpg")))
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131371152, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
        a(jdField_a_of_type_ComTencentWidgetProgressPieView);
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
        videoFileStatus = 1005;
        return;
      }
      if (!TextUtils.isEmpty(videoFileName))
      {
        paramHolder = ShortVideoBusiManager.a(4, h);
        paramHolder.a(ShortVideoBusiManager.a(h, paramMessageForShortVideo, paramHolder));
        ShortVideoBusiManager.a(paramHolder, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.e("ShortVideoItemBuilder", 2, "ShortVideoItemBuilder:reForwardVideo() path is empty");
  }
  
  public void c()
  {
    super.c();
    i = -1;
    e = false;
  }
  
  public void c(MessageForShortVideo paramMessageForShortVideo)
  {
    if (TextUtils.isEmpty(md5))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoItemBuilder", 2, "Forward menu clicked, md5 is empty.");
      }
      return;
    }
    Bundle localBundle = new Bundle();
    localBundle.putInt("forward_type", 21);
    String str1 = ShortVideoUtils.a(thumbMD5, "jpg");
    localBundle.putString("forward_thumb", str1);
    localBundle.putString("from_uin", ShortVideoUtils.c(paramMessageForShortVideo));
    localBundle.putInt("from_uin_type", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    localBundle.putString("from_session_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localBundle.putInt("from_busi_type", busiType);
    localBundle.putInt("file_send_size", videoFileSize);
    localBundle.putInt("file_send_duration", videoFileTime);
    localBundle.putString("file_name", videoFileName);
    localBundle.putInt("file_format", videoFileFormat);
    String str2 = ShortVideoUtils.b(paramMessageForShortVideo);
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoItemBuilder", 2, "Forward menu clicked, videoPath=" + str2 + ",videoPath = " + str2 + ", " + paramMessageForShortVideo.toLogString());
    }
    localBundle.putString("file_send_path", str2);
    localBundle.putString("thumbfile_send_path", str1);
    localBundle.putString("file_shortvideo_md5", md5);
    localBundle.putInt("thumbfile_send_width", thumbWidth);
    localBundle.putInt("thumbfile_send_height", thumbHeight);
    localBundle.putString("thumbfile_md5", thumbMD5);
    localBundle.putString("file_source", fileSource);
    localBundle.putString("file_uuid", uuid);
    localBundle.putInt("file_thumb_Size", thumbFileSize);
    localBundle.putBoolean("support_progressive", supportProgressive);
    localBundle.putInt("file_width", fileWidth);
    localBundle.putInt("file_height", fileHeight);
    paramMessageForShortVideo = new Intent();
    paramMessageForShortVideo.putExtras(localBundle);
    ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramMessageForShortVideo, 21);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80052CC", "0X80052CC", 0, 0, "", "1", "", "");
  }
  
  public void d(MessageForShortVideo paramMessageForShortVideo)
  {
    String str = ShortVideoUtils.a(paramMessageForShortVideo, "mp4");
    boolean bool = NetworkUtils.isMobileConnected(jdField_a_of_type_AndroidContentContext);
    if ((!FileUtils.a(str)) && (bool)) {
      paramMessageForShortVideo = DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, null, jdField_a_of_type_AndroidContentContext.getString(2131371182), 2131366993, 2131366992, new lae(this, paramMessageForShortVideo), new laf(this));
    }
    try
    {
      paramMessageForShortVideo.show();
      return;
    }
    catch (Throwable paramMessageForShortVideo) {}
    a(paramMessageForShortVideo);
    return;
  }
  
  public void onClick(View paramView)
  {
    super.onClick(paramView);
    AIOUtils.l = true;
    long l = System.currentTimeMillis();
    if ((l - jdField_b_of_type_Long < c) && (l > jdField_b_of_type_Long)) {
      if (QLog.isColorLevel()) {
        QLog.e("ShortVideoItemBuilder", 2, "click too offen,please try again later ");
      }
    }
    for (;;)
    {
      return;
      jdField_b_of_type_Long = l;
      if (paramView.getId() == 2131296325)
      {
        paramView = (MessageForShortVideo)ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoItemBuilder", 2, "click bubble, msg.uniseq:" + uniseq + ",fileType===>" + ShortVideoUtils.a(fileType) + " ===> fileStatus:" + ShortVideoUtils.b(videoFileStatus));
        }
        if (videoFileStatus != 998) {
          d(paramView);
        }
      }
      else if (paramView.getId() == 2131296344)
      {
        Object localObject1 = (ShortVideoItemBuilder.Holder)AIOUtils.a(paramView);
        paramView = jdField_a_of_type_ComTencentWidgetProgressPieView;
        MessageForShortVideo localMessageForShortVideo = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
        int j = videoFileStatus;
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoItemBuilder", 2, "click ppv, msg.uniseq:" + uniseq + ",fileType: " + ShortVideoUtils.a(fileType) + ", fileStatus:" + ShortVideoUtils.b(j));
        }
        StringBuilder localStringBuilder = new StringBuilder("");
        localStringBuilder.append("......click ppv, msg.uniseq:" + uniseq);
        Object localObject2 = ShortVideoUtils.a(localMessageForShortVideo, "mp4");
        boolean bool;
        if (!localMessageForShortVideo.isSendFromLocal())
        {
          localStringBuilder.append(" sendFromLocal:false ");
          if (!FileUtils.b((String)localObject2))
          {
            localStringBuilder.append(" videoPathExists:false ");
            if ((fileType == 6) || (fileType == 17) || (fileType == 9))
            {
              localStringBuilder.append(" fileType:video, =" + ShortVideoUtils.a(fileType));
              localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
              if (localObject1 != null) {
                if (ShortVideoDownloadProcessor.class.isInstance(localObject1))
                {
                  bool = ((ShortVideoDownloadProcessor)localObject1).c();
                  localStringBuilder.append(" processor:Download, pause:" + bool + " ");
                  if (bool)
                  {
                    paramView.setImageResource(2130842435);
                    d(localMessageForShortVideo);
                    localStringBuilder.append("pause, result:download ");
                  }
                }
              }
            }
          }
        }
        while (QLog.isColorLevel())
        {
          QLog.i("ShortVideoItemBuilder", 2, localStringBuilder.toString());
          return;
          if (j == 2005)
          {
            a(paramView);
            QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371160, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
            localStringBuilder.append(" result:toast recv_error ");
          }
          else if ((j == 2002) || (j == 2000) || (j == 2008) || (j == 2001))
          {
            paramView.setImageResource(2130842436);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
            localStringBuilder.append("status:process or r p s, result: pauseRecving ");
          }
          else if (j == 5001)
          {
            a(paramView);
            QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371161, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
            localStringBuilder.append(" result: toast file_unsafe ");
          }
          else if (j == 5002)
          {
            a(paramView);
            QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371162, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
            localStringBuilder.append(" result: toast file_expired ");
          }
          else
          {
            paramView.setImageResource(2130842435);
            d(localMessageForShortVideo);
            localStringBuilder.append(" status:other, result: download ");
            continue;
            localStringBuilder.append("fileType:video,videoPathExits:false,processor:not download, result:none");
            continue;
            paramView.setImageResource(2130842435);
            d(localMessageForShortVideo);
            localStringBuilder.append(" processor:null, result:download ");
            continue;
            if (j == 5002)
            {
              a(paramView);
              QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371162, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
              localStringBuilder.append("fileType:not video,videoPathExits:false, result:toast file_expired ");
            }
            else
            {
              paramView.setImageResource(2130842435);
              d(localMessageForShortVideo);
              localStringBuilder.append("fileType:not video,videoPathExits:false, result: download");
              continue;
              a(paramView);
              d(localMessageForShortVideo);
              localStringBuilder.append("videoPathExists:true, result:play ");
              continue;
              localStringBuilder.append(" sendFromLocal:true ");
              if (FileUtils.b(videoFileName))
              {
                localStringBuilder.append(" localUploadPath Exists:true ");
                if ((fileType == 6) || (fileType == 17) || (fileType == 9))
                {
                  localStringBuilder.append(" fileType:video ");
                  localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
                  if (localObject2 != null)
                  {
                    if ((ShortVideoUploadProcessor.class.isInstance(localObject2)) || (ShortVideoForwardProcessor.class.isInstance(localObject2)))
                    {
                      bool = ((BaseTransProcessor)localObject2).c();
                      localStringBuilder.append(" processor:up or forward, pause:" + bool);
                      if (bool)
                      {
                        paramView.setImageResource(2130842435);
                        if (uiOperatorFlag == 2)
                        {
                          b(localMessageForShortVideo, (ShortVideoItemBuilder.Holder)localObject1);
                          localStringBuilder.append(" uiOper:forward, result:reforward ");
                        }
                        else if (uiOperatorFlag == 1)
                        {
                          a(localMessageForShortVideo, (ShortVideoItemBuilder.Holder)localObject1);
                          localStringBuilder.append(" uiOper:upload, result:upload ");
                        }
                      }
                      else if (j == 1005)
                      {
                        a(paramView);
                        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
                        localStringBuilder.append(" status:send_error, result:show send error ");
                      }
                      else if ((j == 1002) || (j == 1001))
                      {
                        paramView.setImageResource(2130842438);
                        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, uniseq);
                        localStringBuilder.append(" status:process or start, result:pauseSending ");
                      }
                      else
                      {
                        a(paramView);
                        d(localMessageForShortVideo);
                        localStringBuilder.append(" status:other, result:play ");
                      }
                    }
                    else if (ShortVideoDownloadProcessor.class.isInstance(localObject2))
                    {
                      localStringBuilder.append(" processor:not up of forward, result: none");
                    }
                  }
                  else if ((j == 1004) && (extraflag == 32772))
                  {
                    paramView.setImageResource(2130842435);
                    a(localMessageForShortVideo, (ShortVideoItemBuilder.Holder)localObject1);
                    localStringBuilder.append(" processor:null, but send_cancel && msg_sending, result:upload ");
                  }
                  else
                  {
                    a(paramView);
                    d(localMessageForShortVideo);
                    localStringBuilder.append(" processor:null, result:play ");
                  }
                }
                else
                {
                  a(paramView);
                  d(localMessageForShortVideo);
                  localStringBuilder.append(" fileType:not video, result: play ");
                }
              }
              else
              {
                localStringBuilder.append(" localUploadPath Exists:false ");
                if (!FileUtils.b(ShortVideoUtils.a(localMessageForShortVideo, "mp4")))
                {
                  localStringBuilder.append(" downloadPath Exists:false ");
                  if ((fileType == 6) || (fileType == 17) || (fileType == 9))
                  {
                    localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
                    if (localObject2 != null)
                    {
                      if (ShortVideoDownloadProcessor.class.isInstance(localObject2))
                      {
                        bool = ((ShortVideoDownloadProcessor)localObject2).c();
                        localStringBuilder.append(" processor:download, pause:" + bool);
                        if (bool)
                        {
                          paramView.setImageResource(2130842435);
                          d(localMessageForShortVideo);
                          localStringBuilder.append(" pause:true, result:download ");
                        }
                        else if (j == 2005)
                        {
                          a(paramView);
                          QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371160, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                          localStringBuilder.append(" status:recv_error, result:toast recv_error ");
                        }
                        else if ((j == 2002) || (j == 2000) || (j == 2008) || (j == 2001))
                        {
                          paramView.setImageResource(2130842436);
                          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
                          localStringBuilder.append(" result:pauseReceiving ");
                        }
                        else if (j == 5001)
                        {
                          a(paramView);
                          QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371161, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                          localStringBuilder.append(" status:file_unsafe, result:toast unsafe ");
                        }
                        else if (j == 5002)
                        {
                          a(paramView);
                          QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371162, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                          localStringBuilder.append(" status:file_expired, result:toast expired ");
                        }
                        else
                        {
                          paramView.setImageResource(2130842435);
                          d(localMessageForShortVideo);
                          localStringBuilder.append(" status:other, result:download ");
                        }
                      }
                      else if (ShortVideoUploadProcessor.class.isInstance(localObject2))
                      {
                        a(jdField_a_of_type_ComTencentWidgetProgressPieView);
                        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
                        QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371151, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                        localStringBuilder.append(" processor:upload, result:show upload error and show toast");
                      }
                      else if (ShortVideoForwardProcessor.class.isInstance(localObject2))
                      {
                        bool = ((ShortVideoForwardProcessor)localObject2).c();
                        localStringBuilder.append(" processor:forward, pause:" + bool);
                        if (bool)
                        {
                          paramView.setImageResource(2130842435);
                          b(localMessageForShortVideo, (ShortVideoItemBuilder.Holder)localObject1);
                          localStringBuilder.append(" pause:true, result:reforward ");
                        }
                        else if (j == 5001)
                        {
                          a(paramView);
                          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
                          QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371171, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                          localStringBuilder.append(" status:unsafe, result:toast unsafe ");
                        }
                        else if (j == 5002)
                        {
                          a(paramView);
                          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
                          QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371172, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                          localStringBuilder.append(" status:expired, result:toast expired ");
                        }
                        else if (j == 1005)
                        {
                          a(paramView);
                          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
                          localStringBuilder.append(" status:send_error, result:show send_error ");
                        }
                        else if ((j == 1002) || (j == 1001))
                        {
                          paramView.setImageResource(2130842438);
                          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, uniseq);
                          localStringBuilder.append(" status:send_process|start, result:pauseSending ");
                        }
                        else
                        {
                          a(paramView);
                          d(localMessageForShortVideo);
                          localStringBuilder.append(" status:other, result:plau ");
                        }
                      }
                      else
                      {
                        localStringBuilder.append(" processor:not down or forward or up, result:none ");
                      }
                    }
                    else
                    {
                      paramView.setImageResource(2130842435);
                      localStringBuilder.append(" processor:null, result:download ");
                      d(localMessageForShortVideo);
                    }
                  }
                  else
                  {
                    paramView.setImageResource(2130842435);
                    d(localMessageForShortVideo);
                    localStringBuilder.append(" fileType:not video, result:download ");
                  }
                }
                else
                {
                  a(paramView);
                  d(localMessageForShortVideo);
                  localStringBuilder.append(" downloadPath Exists:true，result:play ");
                }
              }
            }
          }
        }
      }
    }
  }
}
