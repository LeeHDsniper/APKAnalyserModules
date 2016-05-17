package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Environment;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.image.Utils;
import com.tencent.image.VideoDrawable;
import com.tencent.image.VideoDrawable.VideoDrawableParams;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.BaseMessageManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.drawable.EmptyDrawable;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicPreDownloadUtils;
import com.tencent.mobileqq.richmedia.dc.DCShortVideo;
import com.tencent.mobileqq.shortvideo.ShortVideoBusiManager;
import com.tencent.mobileqq.shortvideo.ShortVideoConstants;
import com.tencent.mobileqq.shortvideo.ShortVideoDownloadInfo;
import com.tencent.mobileqq.shortvideo.ShortVideoPreDownloader;
import com.tencent.mobileqq.shortvideo.ShortVideoReq;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.ShortVideoForwardProcessor;
import com.tencent.mobileqq.transfile.ShortVideoUploadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.AudioAnimationView;
import com.tencent.mobileqq.widget.CircleProgressView;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.ListView;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import java.io.File;
import java.lang.ref.WeakReference;
import lam;
import lan;
import lao;
import lap;

public class ShortVideoPTVItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback, ShortVideoConstants
{
  static ColorDrawable jdField_a_of_type_AndroidGraphicsDrawableColorDrawable = new EmptyDrawable(-10065297, jdField_h_of_type_Int, i);
  public static WeakReference a;
  static final String jdField_b_of_type_JavaLangString = "ShortVideoPTVItemBuilder";
  private static WeakReference jdField_b_of_type_JavaLangRefWeakReference;
  static int h;
  static int i;
  private ListView jdField_a_of_type_ComTencentWidgetListView;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    Resources localResources = BaseApplicationImpl.a.getResources();
    jdField_h_of_type_Int = AIOUtils.a(160.0F, localResources);
    i = AIOUtils.a(160.0F, localResources);
  }
  
  public ShortVideoPTVItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    if (paramAIOAnimationConatiner != null) {
      jdField_a_of_type_ComTencentWidgetListView = jdField_a_of_type_ComTencentWidgetListView;
    }
    ShortVideoUtils.a(paramQQAppInterface);
    ShortVideoPTVItemBuilder.PtvPlayConfig.a();
  }
  
  public static void a(ListView paramListView)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (jdField_a_of_type_JavaLangRefWeakReference != null)
    {
      bool1 = bool2;
      if (jdField_a_of_type_JavaLangRefWeakReference.get() != null)
      {
        bool1 = bool2;
        if (((VideoDrawable)jdField_a_of_type_JavaLangRefWeakReference.get()).isAudioPlaying())
        {
          ((VideoDrawable)jdField_a_of_type_JavaLangRefWeakReference.get()).stopAudio();
          bool2 = true;
          bool1 = bool2;
          if (b != null)
          {
            bool1 = bool2;
            if (b.get() != null)
            {
              a(paramListView, (ChatMessage)b.get());
              bool1 = bool2;
            }
          }
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "stopAudioIfPlaying(), stopSuccess = " + bool1);
    }
  }
  
  public static void a(ListView paramListView, ChatMessage paramChatMessage)
  {
    if ((paramChatMessage != null) && (paramListView != null))
    {
      j = AIOUtils.a(uniseq, paramListView.a());
      if (j > -1)
      {
        paramListView = AIOUtils.a(paramListView, j);
        if (paramListView != null)
        {
          paramListView = AIOUtils.a(paramListView);
          if ((paramListView != null) && ((paramListView instanceof ShortVideoPTVItemBuilder.Holder)))
          {
            paramListView = (ShortVideoPTVItemBuilder.Holder)paramListView;
            if (paramListView != null) {
              jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.d();
            }
          }
        }
      }
    }
    while (!QLog.isColorLevel())
    {
      int j;
      return;
    }
    QLog.e("ShortVideoPTVItemBuilder", 2, "stopAudioAnimByMsg(), message = " + paramChatMessage);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramView = FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (paramView != null) {
      paramView.a(paramChatMessage, this);
    }
    if ((jdField_a_of_type_ComTencentWidgetListView == null) && (paramViewGroup != null) && ((paramViewGroup instanceof ListView))) {
      jdField_a_of_type_ComTencentWidgetListView = ((ListView)paramViewGroup);
    }
    return paramChatMessage;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = (ShortVideoPTVItemBuilder.Holder)paramViewHolder;
    Object localObject1 = jdField_a_of_type_AndroidContentContext;
    Object localObject2 = ((Context)localObject1).getResources();
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "getBubbleView(), message = " + paramChatMessage);
    }
    paramViewHolder = paramView;
    Object localObject3;
    if (paramView == null)
    {
      paramViewHolder = new RelativeLayout((Context)localObject1);
      int j = AIOUtils.a(160.0F, (Resources)localObject2);
      int k = AIOUtils.a(160.0F, (Resources)localObject2);
      paramView = new lao((Context)localObject1);
      paramView.setId(2131299562);
      paramView.setScaleType(ImageView.ScaleType.FIT_XY);
      localObject3 = new RelativeLayout.LayoutParams(j, k);
      ((RelativeLayout.LayoutParams)localObject3).addRule(13);
      paramViewHolder.addView(paramView, (ViewGroup.LayoutParams)localObject3);
      localObject3 = new CircleProgressView((Context)localObject1);
      ((CircleProgressView)localObject3).setVisibility(8);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(j, k);
      localLayoutParams.addRule(13);
      paramViewHolder.addView((View)localObject3, localLayoutParams);
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(14);
      localLayoutParams.addRule(8, 2131299562);
      bottomMargin = AIOUtils.a(6.0F, (Resources)localObject2);
      localObject2 = new AudioAnimationView((Context)localObject1);
      paramViewHolder.addView((View)localObject2, localLayoutParams);
      localObject1 = new ImageView((Context)localObject1);
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      ((ImageView)localObject1).setVisibility(8);
      paramViewHolder.addView((View)localObject1, localLayoutParams);
      paramViewHolder.setOnClickListener(this);
      paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
      paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_Lao = paramView;
      jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView = ((CircleProgressView)localObject3);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localObject1);
      jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView = ((AudioAnimationView)localObject2);
    }
    paramView = jdField_a_of_type_Lao;
    paramChatMessage = (MessageForShortVideo)paramChatMessage;
    jdField_b_of_type_Boolean = paramChatMessage.isSend();
    jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView.setIsSend(paramChatMessage.isSend());
    if (md5 == null)
    {
      if (paramChatMessage.isSendFromLocal())
      {
        paramOnLongClickAndTouchListener = mThumbFilePath;
        if (!FileUtils.b(paramOnLongClickAndTouchListener)) {
          break label514;
        }
        if (paramView.a(paramOnLongClickAndTouchListener))
        {
          if (QLog.isColorLevel()) {
            QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: 占坑 msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
          }
          localObject1 = URLDrawable.URLDrawableOptions.obtain();
          mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
          mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
          paramView.b(URLDrawable.getDrawable(new File(paramOnLongClickAndTouchListener), (URLDrawable.URLDrawableOptions)localObject1));
          a(paramBaseChatItemLayout);
          Utils.executeAsyncTaskOnSerialExcuter(new lap(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, paramChatMessage), new Void[] { (Void)null });
        }
      }
      label514:
      do
      {
        return paramViewHolder;
        paramView.setImageDrawable(URLDrawableHelper.b);
        b(paramBaseChatItemLayout);
      } while (!QLog.isColorLevel());
      QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView():You must get thumb before send video. msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
      return paramViewHolder;
    }
    localObject1 = ShortVideoUtils.a(thumbMD5, "jpg");
    paramOnLongClickAndTouchListener = ShortVideoUtils.a(paramChatMessage, "mp4");
    if ((ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_b_of_type_Boolean) && (ShortVideoUtils.a()) && (FileUtils.b(paramOnLongClickAndTouchListener)) && ((!paramChatMessage.isSendFromLocal()) || (videoFileStatus == 1003) || (videoFileStatus == 2003)))
    {
      if (!paramChatMessage.isSend()) {
        new DCShortVideo(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2003, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 1002);
      }
      if (paramView.a(paramOnLongClickAndTouchListener))
      {
        if (QLog.isColorLevel()) {
          QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: 刷视频 " + paramOnLongClickAndTouchListener + " msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
        }
        localObject2 = URLDrawable.URLDrawableOptions.obtain();
        mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
        mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
        if (!paramView.a((String)localObject1)) {
          mLoadingDrawable = jdField_b_of_type_ComTencentImageURLDrawable;
        }
        localObject3 = new VideoDrawable.VideoDrawableParams();
        mPlayVideoFrame = true;
        mPlayAudioFrame = false;
        mVideoRoundCorner = 0;
        mRequestedFPS = ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_a_of_type_Int;
        mExtraInfo = localObject3;
        localObject2 = URLDrawable.getDrawable(new File(paramOnLongClickAndTouchListener), (URLDrawable.URLDrawableOptions)localObject2);
        paramView.b((URLDrawable)localObject2);
        if ((((URLDrawable)localObject2).getCurrDrawable() instanceof VideoDrawable))
        {
          boolean bool = ((VideoDrawable)((URLDrawable)localObject2).getCurrDrawable()).isAudioPlaying();
          if (!bool) {
            break label1054;
          }
          jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.c();
          label879:
          if (QLog.isColorLevel()) {
            QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: 刷视频, isAudioPlaying= " + bool + ", videoPath:" + paramOnLongClickAndTouchListener + " msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
          }
        }
      }
      for (;;)
      {
        if (!FileUtils.b((String)localObject1))
        {
          a(paramChatMessage);
          if (QLog.isColorLevel()) {
            QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: Video file exist and status finish. Thumb not exist. msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
          }
        }
        if (!paramChatMessage.isSendFromLocal()) {
          break label1211;
        }
        paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
        if (!BaseTransProcessor.class.isInstance(paramView)) {
          break label1203;
        }
        if (((BaseTransProcessor)paramView).c() != 1002L) {
          break;
        }
        a(paramBaseChatItemLayout, videoFileProgress);
        return paramViewHolder;
        label1054:
        jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.d();
        break label879;
        localObject2 = jdField_b_of_type_ComTencentImageURLDrawable;
        if ((localObject2 != null) && (((URLDrawable)localObject2).getStatus() == 1))
        {
          paramView.b((URLDrawable)localObject2);
          if ((((URLDrawable)localObject2).getCurrDrawable() instanceof VideoDrawable))
          {
            paramView = (VideoDrawable)((URLDrawable)localObject2).getCurrDrawable();
            if (QLog.isColorLevel()) {
              QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: 刷视频用缓存, isAudioPlaying= " + paramView.isAudioPlaying() + ", videoPath:" + paramOnLongClickAndTouchListener + " msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
            }
            if (paramView.isAudioPlaying()) {
              jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.c();
            } else {
              jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.d();
            }
          }
        }
      }
      label1203:
      b(paramBaseChatItemLayout);
      return paramViewHolder;
      label1211:
      b(paramBaseChatItemLayout);
      return paramViewHolder;
    }
    if (FileUtils.b((String)localObject1))
    {
      if (paramView.a((String)localObject1))
      {
        if (QLog.isColorLevel()) {
          QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: 刷缩略图 " + (String)localObject1 + " msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
        }
        localObject2 = URLDrawable.URLDrawableOptions.obtain();
        mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
        mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
        paramView.b(URLDrawable.getDrawable(new File((String)localObject1), (URLDrawable.URLDrawableOptions)localObject2));
      }
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.d();
        if (!FileUtils.b(paramOnLongClickAndTouchListener)) {
          break label1486;
        }
        if ((!paramChatMessage.isSendFromLocal()) || (videoFileProgress > 100) || (videoFileStatus == 1003)) {
          break;
        }
        a(paramBaseChatItemLayout, videoFileProgress);
        return paramViewHolder;
        if (QLog.isColorLevel()) {
          QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: 刷缩略图用缓存 " + (String)localObject1 + " msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
        }
        localObject1 = jdField_b_of_type_ComTencentImageURLDrawable;
        if ((localObject1 != null) && (((URLDrawable)localObject1).getStatus() == 1)) {
          paramView.b((URLDrawable)localObject1);
        }
      }
      if ((ShortVideoUtils.a()) && (ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_b_of_type_Boolean))
      {
        b(paramBaseChatItemLayout);
        return paramViewHolder;
      }
      c(paramBaseChatItemLayout);
      return paramViewHolder;
      label1486:
      if (videoFileStatus == 5002)
      {
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoPTVItemBuilder", 2, "getBubbleView():短视频已过期不启动下载流程 1 msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
        }
        b(paramBaseChatItemLayout, 2131366971);
        return paramViewHolder;
      }
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramChatMessage, true))
      {
        a(paramChatMessage, true);
        a(paramBaseChatItemLayout, videoFileProgress);
        return paramViewHolder;
      }
      if (BaseTransProcessor.class.isInstance(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq)))
      {
        a(paramBaseChatItemLayout, videoFileProgress);
        return paramViewHolder;
      }
      c(paramBaseChatItemLayout);
      return paramViewHolder;
    }
    if (videoFileStatus == 5002)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPTVItemBuilder", 2, "getBubbleView():短视频已过期不启动下载流程 2 msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
      }
      paramView.setImageDrawable(jdField_a_of_type_AndroidGraphicsDrawableColorDrawable);
      b(paramBaseChatItemLayout, 2131366971);
      jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.d();
      return paramViewHolder;
    }
    if (QLog.isColorLevel()) {
      QLog.i("ShortVideoPTVItemBuilder", 2, "getBubbleView: 下占位图 msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
    }
    paramView.setImageDrawable(jdField_a_of_type_AndroidGraphicsDrawableColorDrawable);
    a(paramChatMessage);
    jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.d();
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new ShortVideoPTVItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return "发出视频对讲消息";
    }
    return "发来视频对讲消息";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    MessageForShortVideo localMessageForShortVideo;
    if ((paramChatMessage != null) && ((paramChatMessage instanceof MessageForShortVideo)))
    {
      localMessageForShortVideo = (MessageForShortVideo)paramChatMessage;
      if (paramInt != 2131304463) {
        break label38;
      }
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageForShortVideo);
    }
    label38:
    do
    {
      do
      {
        return;
        if (paramInt == 2131304473)
        {
          super.b(paramChatMessage);
          return;
        }
        if (paramInt == 2131298639)
        {
          paramInt = PicPreDownloadUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, istroop, frienduin);
          if (paramInt == 3) {
            paramContext = "1";
          }
          for (;;)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005624", "0X8005624", 0, 0, paramContext, "", "", "");
            b(localMessageForShortVideo);
            return;
            if (paramInt == 2) {
              paramContext = "2";
            } else if (paramInt == 0) {
              paramContext = "3";
            } else {
              paramContext = "4";
            }
          }
        }
        if (paramInt == 2131299653)
        {
          QfavBuilder.a(localMessageForShortVideo).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
          QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 5);
          return;
        }
        if (paramInt != 2131296347) {
          break label409;
        }
        if (md5 != null) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("ShortVideoPTVItemBuilder", 2, "onMenuItemClicked: msg_revoke => md5 = null");
      return;
      int j = 1;
      paramContext = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      paramInt = j;
      if (paramContext != null) {
        if (!ShortVideoUploadProcessor.class.isInstance(paramContext))
        {
          paramInt = j;
          if (!ShortVideoForwardProcessor.class.isInstance(paramContext)) {}
        }
        else
        {
          boolean bool = ((BaseTransProcessor)paramContext).c();
          int k = videoFileStatus;
          if ((!bool) && (k != 1002))
          {
            paramInt = j;
            if (k != 1001) {}
          }
          else
          {
            j = 0;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(frienduin, uniseq);
            ((QQMessageFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(19)).a(istroop).d(localMessageForShortVideo);
            paramInt = j;
            if (QLog.isColorLevel())
            {
              QLog.d("ShortVideoPTVItemBuilder", 2, "onMenuItemClicked: stop uploading short video");
              paramInt = j;
            }
          }
        }
      }
    } while (paramInt == 0);
    super.a(localMessageForShortVideo);
    return;
    label409:
    super.a(paramInt, paramContext, paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    paramView = (ShortVideoPTVItemBuilder.Holder)AIOUtils.a(paramView);
    MessageForShortVideo localMessageForShortVideo = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if (!localMessageForShortVideo.isSendFromLocal()) {
      return;
    }
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
    localActionSheet.a(2131367611, 5);
    localActionSheet.d(2131366996);
    localActionSheet.a(new lam(this, localMessageForShortVideo, paramView, localActionSheet));
    localActionSheet.show();
  }
  
  protected void a(View paramView, ChatMessage paramChatMessage)
  {
    if (paramChatMessage.isSend())
    {
      paramView.setPadding(0, BaseChatItemLayout.k, 0, BaseChatItemLayout.l);
      return;
    }
    paramView.setPadding(0, BaseChatItemLayout.k, 0, BaseChatItemLayout.l);
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    paramView = (ShortVideoPTVItemBuilder.Holder)AIOUtils.a(paramView);
    Object localObject2 = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    Object localObject3 = "handleMessage() msgSeq: " + uniseq + " ";
    if (uniseq != c) {}
    Object localObject1;
    label878:
    label973:
    label1256:
    label1320:
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            localObject1 = jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView;
            localObject1 = jdField_a_of_type_Lao;
            localObject4 = jdField_a_of_type_AndroidContentContext.getResources();
            paramInt1 = AIOUtils.a(' ', (Resources)localObject4);
            paramInt2 = AIOUtils.a(' ', (Resources)localObject4);
            if ((e != 6) && (e != 17) && (e != 9) && (e != 20)) {
              break;
            }
            switch (M)
            {
            default: 
              return;
            case 1001: 
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "VIDEO STATUS_SEND_START progress " + videoFileProgress);
              }
              jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(false, this);
              return;
            case 1003: 
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "VIDEO STATUS_SEND_FINISHED");
              }
              b(paramView);
              return;
            case 1005: 
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "VIDEO STATUS_SEND_ERROR");
              }
              jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
              b(paramView);
              jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.setVisibility(8);
              return;
            case 1004: 
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "VIDEO STATUS_SEND_CANCEL");
              }
              b(paramView);
              return;
            case 1002: 
              paramInt1 = videoFileProgress;
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "VIDEO STATUS_SEND_PROCESS " + paramInt1);
              }
              a(paramView, paramInt1);
              return;
            case 2001: 
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "VIDEO STATUS_RECV_START");
              }
              a(paramView, videoFileProgress);
              return;
            case 2003: 
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "VIDEO STATUS_RECV_FINISHED");
              }
              if (ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_b_of_type_Boolean)
              {
                paramFileMsg = ShortVideoUtils.a((MessageForShortVideo)localObject2, "mp4");
                if (((lao)localObject1).a(paramFileMsg))
                {
                  QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "handleMessage: 刷视频 " + paramFileMsg);
                  if ((ShortVideoUtils.a()) && (FileUtils.b(paramFileMsg)))
                  {
                    localObject3 = URLDrawable.URLDrawableOptions.obtain();
                    mRequestWidth = paramInt1;
                    mRequestHeight = paramInt2;
                    mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
                    mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
                    localObject4 = new VideoDrawable.VideoDrawableParams();
                    mPlayVideoFrame = true;
                    mVideoRoundCorner = 0;
                    mRequestedFPS = ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_a_of_type_Int;
                    mExtraInfo = localObject4;
                    paramFileMsg = URLDrawable.getDrawable(new File(paramFileMsg), (URLDrawable.URLDrawableOptions)localObject3);
                    if (paramFileMsg.getStatus() != 1) {
                      break label878;
                    }
                    ((lao)localObject1).b(paramFileMsg);
                  }
                }
                for (;;)
                {
                  if (!((MessageForShortVideo)localObject2).isSend()) {
                    new DCShortVideo(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2003, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 1002);
                  }
                  if (subBusiType == 1) {
                    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006199", "0X8006199", 0, 0, "", "", "" + uuid, "" + ((MessageForShortVideo)localObject2).isSend());
                  }
                  b(paramView);
                  jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.setVisibility(0);
                  return;
                  ((lao)localObject1).a(paramFileMsg);
                }
              }
              paramFileMsg = ShortVideoUtils.a(thumbMD5, "jpg");
              if (FileUtils.b(paramFileMsg))
              {
                if (!((lao)localObject1).a(paramFileMsg)) {
                  break label973;
                }
                localObject2 = URLDrawable.URLDrawableOptions.obtain();
                mRequestWidth = paramInt1;
                mRequestHeight = paramInt2;
                mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
                mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
                ((lao)localObject1).b(URLDrawable.getDrawable(new File(paramFileMsg), (URLDrawable.URLDrawableOptions)localObject2));
              }
              for (;;)
              {
                c(paramView);
                return;
                paramFileMsg = jdField_b_of_type_ComTencentImageURLDrawable;
                if ((paramFileMsg != null) && (paramFileMsg.getStatus() == 1)) {
                  ((lao)localObject1).b(paramFileMsg);
                }
              }
            case 5001: 
              if (QLog.isColorLevel()) {
                QLog.i("ShortVideoPTVItemBuilder", 2, "VIDEO STATUS_FILE_UNSAFE");
              }
              b(paramView);
              if (uiOperatorFlag == 2)
              {
                jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
                QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371171, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                return;
              }
              QQToast.a(jdField_a_of_type_AndroidContentContext, 2131371161, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
              return;
            case 2005: 
            case 5002: 
              if (QLog.isColorLevel())
              {
                if (M == 2005) {
                  QLog.i("ShortVideoPTVItemBuilder", 2, "VIDEO STATUS_RECV_ERROR");
                }
              }
              else
              {
                localObject2 = ShortVideoUtils.a(thumbMD5, "jpg");
                if (FileUtils.b((String)localObject2))
                {
                  if (!((lao)localObject1).a((String)localObject2)) {
                    break label1256;
                  }
                  if (QLog.isColorLevel()) {
                    QLog.i("ShortVideoPTVItemBuilder", 2, "STATUS_FILE_EXPIRED: 刷缩略图 " + (String)localObject2);
                  }
                  localObject3 = URLDrawable.URLDrawableOptions.obtain();
                  mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
                  mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
                  ((lao)localObject1).b(URLDrawable.getDrawable(new File((String)localObject2), (URLDrawable.URLDrawableOptions)localObject3));
                }
              }
              for (;;)
              {
                if (M != 2005) {
                  break label1320;
                }
                b(paramView, 2131366972);
                return;
                QLog.i("ShortVideoPTVItemBuilder", 2, "VIDEO STATUS_FILE_EXPIRED");
                break;
                if (QLog.isColorLevel()) {
                  QLog.i("ShortVideoPTVItemBuilder", 2, "STATUS_FILE_EXPIRED: 刷缩略图用缓存 " + (String)localObject2);
                }
                localObject2 = jdField_b_of_type_ComTencentImageURLDrawable;
                if ((localObject2 != null) && (((URLDrawable)localObject2).getStatus() == 1)) {
                  ((lao)localObject1).b((URLDrawable)localObject2);
                }
              }
              b(paramView, 2131366971);
              return;
            }
          } while (!QLog.isColorLevel());
          QLog.i("ShortVideoPTVItemBuilder", 2, "VIDEO STATUS_RECV_CANCEL");
          return;
          paramInt1 = videoFileProgress;
          if (QLog.isColorLevel()) {
            QLog.i("ShortVideoPTVItemBuilder", 2, "VIDEO STATUS_RECV_PROCESS " + paramInt1);
          }
          a(paramView, paramInt1);
          return;
        } while ((e != 7) && (e != 18) && (e != 16));
        switch (M)
        {
        default: 
          return;
        }
      } while (!QLog.isColorLevel());
      QLog.i("ShortVideoPTVItemBuilder", 2, "THUMB STATUS_RECV_START");
      return;
      localObject3 = ShortVideoUtils.a(thumbMD5, "jpg");
      paramFileMsg = ShortVideoUtils.a((MessageForShortVideo)localObject2, "mp4");
      boolean bool = FileUtils.b(paramFileMsg);
      if (QLog.isColorLevel()) {
        QLog.i("ShortVideoPTVItemBuilder", 2, "THUMB STATUS_RECV_FINISHED: videoExists=" + bool + ", sAutoPlayInAIO=" + ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_b_of_type_Boolean);
      }
      if ((bool) && (ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_b_of_type_Boolean))
      {
        if (((lao)localObject1).a(paramFileMsg))
        {
          if (QLog.isColorLevel()) {
            QLog.i("ShortVideoPTVItemBuilder", 2, "STATUS_RECV_FINISHED: 视频存在,刷缩略图 " + (String)localObject3);
          }
          if (ShortVideoUtils.a())
          {
            localObject2 = URLDrawable.URLDrawableOptions.obtain();
            mRequestWidth = paramInt1;
            mRequestHeight = paramInt2;
            mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
            mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
            localObject3 = new VideoDrawable.VideoDrawableParams();
            mPlayVideoFrame = true;
            mVideoRoundCorner = 0;
            mRequestedFPS = ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_a_of_type_Int;
            mExtraInfo = localObject3;
            ((lao)localObject1).b(URLDrawable.getDrawable(new File(paramFileMsg), (URLDrawable.URLDrawableOptions)localObject2));
          }
        }
        for (;;)
        {
          b(paramView);
          return;
          paramFileMsg = jdField_b_of_type_ComTencentImageURLDrawable;
          if ((paramFileMsg != null) && (paramFileMsg.getStatus() == 1)) {
            ((lao)localObject1).b(paramFileMsg);
          }
        }
      }
      if (!FileUtils.b((String)localObject3)) {
        break;
      }
    } while (!((lao)localObject1).a((String)localObject3));
    if (QLog.isColorLevel()) {
      QLog.i("ShortVideoPTVItemBuilder", 2, "STATUS_RECV_FINISHED: 缩略图存在，刷缩略图 " + (String)localObject3);
    }
    Object localObject4 = URLDrawable.URLDrawableOptions.obtain();
    mRequestWidth = paramInt1;
    mRequestHeight = paramInt2;
    mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
    mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
    ((lao)localObject1).b(URLDrawable.getDrawable(new File((String)localObject3), (URLDrawable.URLDrawableOptions)localObject4));
    if (!FileUtils.b(paramFileMsg))
    {
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((MessageForShortVideo)localObject2, true))
      {
        if (QLog.isColorLevel()) {
          QLog.i("ShortVideoPTVItemBuilder", 2, "STATUS_RECV_FINISHED: 刷缩略图，视频文件不存在， isNeedPredownload=true, downloadVideo");
        }
        a((MessageForShortVideo)localObject2, true);
        return;
      }
      if (QLog.isColorLevel()) {
        QLog.i("ShortVideoPTVItemBuilder", 2, "STATUS_RECV_FINISHED: 刷缩略图，视频文件不存在， isNeedPredownload=false, showPauseProgress");
      }
      c(paramView);
      return;
    }
    if (ShortVideoUtils.a())
    {
      b(paramView);
      return;
    }
    c(paramView);
    return;
    ((lao)localObject1).setImageDrawable(URLDrawableHelper.b);
    return;
    if (QLog.isColorLevel()) {
      QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "THUMB STATUS_FILE_EXPIRED");
    }
    if (QLog.isColorLevel()) {
      QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "THUMB STATUS_RECV_ERROR");
    }
    paramFileMsg = ShortVideoUtils.a((MessageForShortVideo)localObject2, "mp4");
    if (FileUtils.b(paramFileMsg)) {
      if (((lao)localObject1).a(paramFileMsg))
      {
        QLog.i("ShortVideoPTVItemBuilder", 2, (String)localObject3 + "STATUS_RECV_ERROR: 缩略图下载失败刷视频 " + paramFileMsg);
        if (ShortVideoUtils.a())
        {
          localObject2 = URLDrawable.URLDrawableOptions.obtain();
          mRequestWidth = paramInt1;
          mRequestHeight = paramInt2;
          mLoadingDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
          mFailedDrawable = jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
          localObject3 = new VideoDrawable.VideoDrawableParams();
          mPlayVideoFrame = true;
          mVideoRoundCorner = 0;
          mRequestedFPS = ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_a_of_type_Int;
          mExtraInfo = localObject3;
          ((lao)localObject1).b(URLDrawable.getDrawable(new File(paramFileMsg), (URLDrawable.URLDrawableOptions)localObject2));
        }
      }
    }
    for (;;)
    {
      b(paramView);
      return;
      paramFileMsg = jdField_b_of_type_ComTencentImageURLDrawable;
      if ((paramFileMsg != null) && (paramFileMsg.getStatus() == 1))
      {
        ((lao)localObject1).b(paramFileMsg);
        continue;
        ((lao)localObject1).setImageDrawable(jdField_a_of_type_AndroidGraphicsDrawableColorDrawable);
      }
    }
  }
  
  void a(ShortVideoPTVItemBuilder.Holder paramHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "showLoading() msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView.setIndeterminate(true);
    jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView.a();
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  void a(ShortVideoPTVItemBuilder.Holder paramHolder, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "showProgress(), progress = " + paramInt + " msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
    }
    CircleProgressView localCircleProgressView = jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView;
    int j = paramInt;
    if (paramInt > 100)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPTVItemBuilder", 2, "startShowProgress, illegal process:" + paramInt + " msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
      }
      j = 100;
    }
    localCircleProgressView.setIndeterminate(false);
    localCircleProgressView.setProgress(j);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  void a(MessageForShortVideo paramMessageForShortVideo)
  {
    ShortVideoReq localShortVideoReq = ShortVideoBusiManager.a(2, 3);
    ShortVideoDownloadInfo localShortVideoDownloadInfo = paramMessageForShortVideo.getDownloadInfo(g);
    i = ShortVideoUtils.a(thumbMD5, "jpg");
    localShortVideoDownloadInfo.a(istroop, 1);
    jdField_h_of_type_Int = 2;
    k = 2;
    localShortVideoReq.a(localShortVideoDownloadInfo);
    localShortVideoReq.a(paramMessageForShortVideo);
    ShortVideoBusiManager.a(localShortVideoReq, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  public void a(MessageForShortVideo paramMessageForShortVideo, ShortVideoPTVItemBuilder.Holder paramHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "startUploadVideo：" + paramMessageForShortVideo.toString());
    }
    Object localObject = ShortVideoUtils.a(paramMessageForShortVideo, "mp4");
    String str = ShortVideoUtils.a(thumbMD5, "jpg");
    if (!FileUtils.b((String)localObject))
    {
      QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131371151, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
      videoFileStatus = 1005;
    }
    do
    {
      return;
      if (!FileUtils.b(str))
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131371152, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
        videoFileStatus = 1005;
        return;
      }
      localObject = ShortVideoBusiManager.a(1, 3);
      ((ShortVideoReq)localObject).a(ShortVideoBusiManager.a(g, paramMessageForShortVideo, (ShortVideoReq)localObject));
      ShortVideoBusiManager.a((ShortVideoReq)localObject, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    } while ((!paramMessageForShortVideo.isSendFromLocal()) || (videoFileStatus != 1005) || (videoFileProgress != 0));
    a(paramHolder, 3);
  }
  
  void a(MessageForShortVideo paramMessageForShortVideo, boolean paramBoolean)
  {
    int k = 1;
    if (videoFileStatus == 5002)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPTVItemBuilder", 2, "downloadVideo():短视频已过期不启动下载流程");
      }
      return;
    }
    Object localObject = Environment.getExternalStorageDirectory();
    if ((((File)localObject).exists()) && (((File)localObject).canWrite()))
    {
      j = 1;
      if ((!Environment.getExternalStorageState().equals("mounted")) || (j == 0)) {
        break label109;
      }
    }
    label109:
    for (int j = 1;; j = 0)
    {
      if (j != 0) {
        break label114;
      }
      QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131368675, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      return;
      j = 0;
      break;
    }
    label114:
    localObject = ShortVideoBusiManager.a(2, 3);
    ShortVideoDownloadInfo localShortVideoDownloadInfo = paramMessageForShortVideo.getDownloadInfo(g);
    jdField_h_of_type_JavaLangString = ShortVideoUtils.a(paramMessageForShortVideo, "mp4");
    localShortVideoDownloadInfo.a(istroop, 0);
    j = k;
    if (paramBoolean) {
      j = 2;
    }
    jdField_h_of_type_Int = j;
    k = 2;
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, " startDownloadVideo downloadvideo fileType==" + g + ", uniseq:" + uniseq);
    }
    ((ShortVideoReq)localObject).a(localShortVideoDownloadInfo);
    ((ShortVideoReq)localObject).a(paramMessageForShortVideo);
    ShortVideoBusiManager.a((ShortVideoReq)localObject, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  protected boolean a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    if (!paramChatMessage.isSendFromLocal()) {}
    do
    {
      do
      {
        return false;
        paramChatMessage = (MessageForShortVideo)paramChatMessage;
      } while ((md5 == null) || (videoFileStatus == 5002));
      paramBaseChatItemLayout = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      if ((paramBaseChatItemLayout instanceof BaseTransProcessor))
      {
        if (((BaseTransProcessor)paramBaseChatItemLayout).c() == 1005L) {}
        for (boolean bool = true;; bool = false) {
          return bool;
        }
      }
      if (videoFileStatus == 1005) {
        return true;
      }
    } while ((videoFileProgress == 100) || (videoFileStatus == 1003) || (videoFileStatus == 2003));
    return true;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    int m = 0;
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    MessageForShortVideo localMessageForShortVideo1 = (MessageForShortVideo)ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if ((md5 != null) && (FileUtils.b(ShortVideoUtils.a(localMessageForShortVideo1, "mp4")))) {
      localQQCustomMenu.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
    }
    paramView = (ShortVideoPTVItemBuilder.Holder)AIOUtils.a(paramView);
    MessageForShortVideo localMessageForShortVideo2 = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if (md5 != null)
    {
      String str = ShortVideoUtils.a(thumbMD5, "jpg");
      ShortVideoUtils.a(localMessageForShortVideo2, "mp4");
      if (FileUtils.b(str)) {
        if ((jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView == null) || (!jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView.a())) {
          break label233;
        }
      }
    }
    label233:
    for (int j = 1;; j = 0)
    {
      int k = m;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.b != null)
      {
        k = m;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.b.getVisibility() == 0) {
          k = 1;
        }
      }
      a(localMessageForShortVideo1, localQQCustomMenu);
      if ((localMessageForShortVideo2.isSend()) && (j == 0) && (k == 0)) {
        a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, localMessageForShortVideo2);
      }
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      return localQQCustomMenu.a();
    }
  }
  
  void b(ShortVideoPTVItemBuilder.Holder paramHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "hideProgress() msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView.c();
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  void b(ShortVideoPTVItemBuilder.Holder paramHolder, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "showWarnProgress() msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView.c();
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840749);
    jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.setVisibility(4);
  }
  
  public void b(MessageForShortVideo paramMessageForShortVideo)
  {
    if (TextUtils.isEmpty(md5))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPTVItemBuilder", 2, "Forward menu clicked, md5 is empty.");
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
      QLog.d("ShortVideoPTVItemBuilder", 2, "Forward menu clicked, videoPath=" + str2 + ",videoPath = " + str2 + ", " + paramMessageForShortVideo.toLogString());
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
  }
  
  public void b(MessageForShortVideo paramMessageForShortVideo, ShortVideoPTVItemBuilder.Holder paramHolder)
  {
    if (paramMessageForShortVideo == null) {}
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPTVItemBuilder", 2, "startUploadVideo：" + paramMessageForShortVideo.toString());
      }
      if (!FileUtils.b(ShortVideoUtils.a(thumbMD5, "jpg")))
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext, 1, 2131371152, 0).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
        videoFileStatus = 1005;
        return;
      }
      if (!TextUtils.isEmpty(videoFileName))
      {
        paramHolder = ShortVideoBusiManager.a(4, 3);
        paramHolder.a(ShortVideoBusiManager.a(g, paramMessageForShortVideo, paramHolder));
        ShortVideoBusiManager.a(paramHolder, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.e("ShortVideoPTVItemBuilder", 2, "ShortVideoRealItemBuilder:reForwardVideo() path is empty");
  }
  
  public void c()
  {
    super.c();
  }
  
  void c(ShortVideoPTVItemBuilder.Holder paramHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoPTVItemBuilder", 2, "showPauseProgress() msgSeq: " + jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetCircleProgressView.c();
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840748);
    jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.setVisibility(4);
  }
  
  public void onClick(View paramView)
  {
    ShortVideoPTVItemBuilder.Holder localHolder = (ShortVideoPTVItemBuilder.Holder)AIOUtils.a(paramView);
    MessageForShortVideo localMessageForShortVideo = (MessageForShortVideo)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if (paramView.getId() == 2131296344) {}
    do
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d())
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext, 2131363375, 1).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
        return;
      }
      if (paramView.getId() != 2131296325) {
        break;
      }
    } while (md5 == null);
    Object localObject = ShortVideoUtils.a(thumbMD5, "jpg");
    if (!FileUtils.b(ShortVideoUtils.a(localMessageForShortVideo, "mp4")))
    {
      a(localMessageForShortVideo, false);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005E96", "0X8005E96", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      if (!localMessageForShortVideo.isSend()) {
        new DCShortVideo(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 2003, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 1003);
      }
      if (isBlessMsg) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006199", "0X8006199", 0, 0, "", "", "" + uuid, "" + localMessageForShortVideo.isSend());
      }
      super.onClick(paramView);
      return;
      if (FileUtils.b((String)localObject))
      {
        if ((ShortVideoPTVItemBuilder.PtvPlayConfig.jdField_b_of_type_Boolean) && (ShortVideoUtils.a()))
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005E95", "0X8005E95", 0, 0, "", "", "", "");
          if (jdField_a_of_type_ComTencentWidgetListView == null) {
            break;
          }
          if ((jdField_a_of_type_Lao.getDrawable() == null) || (!(jdField_a_of_type_Lao.getDrawable() instanceof URLDrawable))) {
            continue;
          }
          localObject = (URLDrawable)jdField_a_of_type_Lao.getDrawable();
          if ((((URLDrawable)localObject).getStatus() != 1) || (!(((URLDrawable)localObject).getCurrDrawable() instanceof VideoDrawable))) {
            continue;
          }
          localObject = (VideoDrawable)((URLDrawable)localObject).getCurrDrawable();
          if (QLog.isColorLevel()) {
            QLog.d("ShortVideoPTVItemBuilder", 2, " videoDrawable.isAudioPlaying(): " + ((VideoDrawable)localObject).isAudioPlaying());
          }
          if (((VideoDrawable)localObject).isAudioPlaying())
          {
            ((VideoDrawable)localObject).stopAudio();
            jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.d();
            b = null;
            continue;
          }
          if (MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).b()) {
            MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(true);
          }
          if ((jdField_a_of_type_JavaLangRefWeakReference != null) && (jdField_a_of_type_JavaLangRefWeakReference.get() != null) && (jdField_a_of_type_JavaLangRefWeakReference.get() != localObject) && (((VideoDrawable)jdField_a_of_type_JavaLangRefWeakReference.get()).isAudioPlaying()))
          {
            if (QLog.isColorLevel()) {
              QLog.d("ShortVideoPTVItemBuilder", 2, "onCLick sPlayingAudioDrawable.get() not null && isAudioPlaying, need stop audio.");
            }
            ((VideoDrawable)jdField_a_of_type_JavaLangRefWeakReference.get()).stopAudio();
            if ((b != null) && (b.get() != null))
            {
              a(jdField_a_of_type_ComTencentWidgetListView, (ChatMessage)b.get());
              b = null;
            }
          }
          ((VideoDrawable)localObject).resetAndPlayAudioOnce();
          jdField_a_of_type_JavaLangRefWeakReference = new WeakReference(localObject);
          jdField_a_of_type_ComTencentMobileqqWidgetAudioAnimationView.c();
          b = new WeakReference(localMessageForShortVideo);
          ((VideoDrawable)localObject).setOnAudioPlayOnceListener(new lan(this));
          continue;
        }
        ShortVideoRealItemBuilder.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, localMessageForShortVideo, jdField_a_of_type_Lao, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      }
    }
  }
}
