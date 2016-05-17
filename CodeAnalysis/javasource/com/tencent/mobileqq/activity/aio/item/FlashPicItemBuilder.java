package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.util.MQLruCache;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
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
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.AIOImageProviderService;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.dating.HotChatFlashPicActivity;
import com.tencent.mobileqq.hitrate.PreloadProcHitSession;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicBusiManager;
import com.tencent.mobileqq.pic.PicContants;
import com.tencent.mobileqq.pic.PicReq;
import com.tencent.mobileqq.pic.PicUploadInfo.Builder;
import com.tencent.mobileqq.pic.PicUploadInfo.RetryInfo;
import com.tencent.mobileqq.structmsg.RoundedColorDrawable;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.TranDbRecord.PicDbRecord;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.urldrawable.URLDrawableDecodeHandler;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.BinderWarpper;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import cooperation.peak.PeakUtils;
import java.net.URL;
import kvz;
import kwa;

public class FlashPicItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback
{
  public static Drawable a;
  private static final String b = FlashPicItemBuilder.class.getSimpleName();
  public static final int h = 130;
  public static final int i = 102;
  private View.OnClickListener a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public FlashPicItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_AndroidViewView$OnClickListener = new kvz(this);
  }
  
  public static Drawable a(Resources paramResources)
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null) {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = a(paramResources, 2131427658);
    }
    return jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  }
  
  public static Drawable a(Resources paramResources, int paramInt)
  {
    try
    {
      int j = (int)(getDisplayMetricsdensityDpi / 160 * 12.0F);
      paramResources = new RoundedColorDrawable(paramResources.getColor(paramInt), AIOUtils.a(130.0F, paramResources), AIOUtils.a(102.0F, paramResources), j);
      return paramResources;
    }
    catch (OutOfMemoryError paramResources)
    {
      if (QLog.isColorLevel()) {
        QLog.d(b, 2, "getReadedDrawable OOM");
      }
    }
    return null;
  }
  
  private static URLDrawable a(Context paramContext, MessageForPic paramMessageForPic, ChatThumbView paramChatThumbView)
  {
    Object localObject = paramContext.getResources();
    int j = getDisplayMetricsdensityDpi;
    int k = AIOUtils.a(130.0F, (Resources)localObject);
    int m = AIOUtils.a(130.0F, (Resources)localObject);
    URL localURL = URLDrawableHelper.a(paramMessageForPic, 65537, null);
    String str = localURL.toString();
    if (paramChatThumbView != null) {
      jdField_a_of_type_Boolean = false;
    }
    if (BaseApplicationImpl.a.get(HotChatHelper.b(str)) != null)
    {
      paramChatThumbView = (URLDrawable)BaseApplicationImpl.a.get(HotChatHelper.b(str));
      paramContext = paramChatThumbView;
      if (QLog.isColorLevel())
      {
        QLog.d("Q.hotchat", 2, "flashpic thumb use cache");
        paramContext = paramChatThumbView;
      }
    }
    for (;;)
    {
      paramContext.setTag(paramMessageForPic);
      return paramContext;
      if (AbsDownloader.a(str) != null)
      {
        URLDrawable.removeMemoryCacheByUrl(str);
        float f = j / 160;
        paramContext = URLDrawable.URLDrawableOptions.obtain();
        mRequestWidth = k;
        mRequestHeight = m;
        mLoadingDrawable = a((Resources)localObject);
        mFailedDrawable = a((Resources)localObject);
        mPlayGifImage = false;
        mGifRoundCorner = (f * 12.0F);
        mUseMemoryCache = false;
        localObject = URLDrawable.getDrawable(localURL, paramContext);
        ((URLDrawable)localObject).setDecodeHandler(URLDrawableDecodeHandler.g);
        ((URLDrawable)localObject).setIgnorePause(true);
        ((URLDrawable)localObject).setFadeInImage(true);
        paramContext = (Context)localObject;
        if (paramChatThumbView != null)
        {
          jdField_a_of_type_Boolean = true;
          paramContext = (Context)localObject;
        }
      }
      else
      {
        if (!URLDrawableHelper.a(paramContext)) {}
        for (j = 1;; j = 0)
        {
          paramContext = URLDrawable.URLDrawableOptions.obtain();
          mRequestWidth = k;
          mRequestHeight = m;
          mLoadingDrawable = a((Resources)localObject);
          mFailedDrawable = a((Resources)localObject);
          mGifRoundCorner = 12.0F;
          mUseMemoryCache = false;
          mImgType = imageType;
          paramContext = URLDrawable.getDrawable(localURL, paramContext);
          paramContext.setDecodeHandler(URLDrawableDecodeHandler.g);
          if ((!PicContants.b) && (j == 0)) {
            break label334;
          }
          paramContext.setAutoDownload(true);
          break;
        }
        label334:
        paramContext.setAutoDownload(false);
      }
    }
  }
  
  private void a(MessageForPic paramMessageForPic)
  {
    AIOImageProviderService localAIOImageProviderService = new AIOImageProviderService(selfuin, frienduin, istroop, paramMessageForPic);
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, HotChatFlashPicActivity.class);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("extra.IMAGE_PROVIDER", new BinderWarpper(localAIOImageProviderService.asBinder()));
    localBundle.putParcelable("extra.EXTRA_CURRENT_IMAGE", AIOGalleryUtils.a(paramMessageForPic));
    localBundle.putBoolean("isreaded", false);
    localBundle.putLong("uniseq", uniseq);
    localBundle.putString("md5", md5);
    localBundle.putBoolean("is_send", paramMessageForPic.isSend());
    localBundle.putString("self_uin", selfuin);
    localIntent.putExtras(localBundle);
    jdField_a_of_type_AndroidContentContext.startActivity(localIntent);
    if (PeakUtils.a != null) {
      PeakUtils.a.b();
    }
  }
  
  private void a(IHttpCommunicatorListener paramIHttpCommunicatorListener, FlashPicItemBuilder.FlashPicHolder paramFlashPicHolder)
  {
    if ((paramFlashPicHolder == null) || (jdField_a_of_type_AndroidViewView == null)) {}
    while (!(paramIHttpCommunicatorListener instanceof BaseTransProcessor)) {
      return;
    }
    switch ((int)((BaseTransProcessor)paramIHttpCommunicatorListener).c())
    {
    default: 
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
      return;
    case 1000: 
    case 1001: 
    case 1002: 
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(true);
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(false, null);
      return;
    case 1003: 
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setFailedIconVisable(true, this);
  }
  
  private void b(MessageForPic paramMessageForPic)
  {
    PicUploadInfo.Builder localBuilder;
    if (FileUtils.b(path))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq);
      if (paramMessageForPic.isSendFromLocal()) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq));
      }
      localBuilder = new PicUploadInfo.Builder();
      localBuilder.a(path);
      localBuilder.d(1039);
      localBuilder.d(frienduin);
      if (fileSizeFlag != 1) {
        break label221;
      }
      localBuilder.c(TranDbRecord.PicDbRecord.f);
    }
    for (;;)
    {
      localBuilder.e(senderuin);
      localBuilder.c(selfuin);
      localBuilder.e(istroop);
      j = extLong;
      i = extStr;
      PicUploadInfo.RetryInfo localRetryInfo = new PicUploadInfo.RetryInfo();
      a = msgseq;
      b = shmsgseq;
      a = msgseq;
      localBuilder.a(localRetryInfo);
      paramMessageForPic = PicBusiManager.a(4, 1039);
      paramMessageForPic.a(localBuilder.a());
      PicBusiManager.a(paramMessageForPic, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      a();
      return;
      label221:
      localBuilder.c(TranDbRecord.PicDbRecord.e);
    }
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = (MessageForPic)paramChatMessage;
    paramViewHolder = (FlashPicItemBuilder.FlashPicHolder)paramViewHolder;
    paramChatMessage = paramView;
    if (paramView == null)
    {
      Object localObject1 = jdField_a_of_type_AndroidContentContext.getResources();
      paramChatMessage = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      paramChatMessage.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
      paramView = new FlashPicItemBuilder.FlashPicAIOThumbView(this, jdField_a_of_type_AndroidContentContext);
      paramView.setAdjustViewBounds(true);
      paramChatMessage.addView(paramView, new RelativeLayout.LayoutParams(-2, -2));
      RelativeLayout localRelativeLayout = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      ImageView localImageView = new ImageView(jdField_a_of_type_AndroidContentContext);
      localImageView.setId(2131296471);
      Object localObject2 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject2).addRule(14);
      localRelativeLayout.addView(localImageView, (ViewGroup.LayoutParams)localObject2);
      localObject2 = new TextView(jdField_a_of_type_AndroidContentContext);
      ((TextView)localObject2).setText(((Resources)localObject1).getText(2131371826));
      ((TextView)localObject2).setTextSize(14.0F);
      ((TextView)localObject2).setTextColor(((Resources)localObject1).getColor(2131427364));
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(3, 2131296471);
      localLayoutParams.addRule(14);
      topMargin = AIOUtils.a(10.0F, (Resources)localObject1);
      localRelativeLayout.addView((View)localObject2, localLayoutParams);
      localObject1 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject1).addRule(13);
      paramChatMessage.addView(localRelativeLayout, (ViewGroup.LayoutParams)localObject1);
      paramChatMessage.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      paramChatMessage.setOnLongClickListener(paramOnLongClickAndTouchListener);
      paramChatMessage.setOnTouchListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemFlashPicItemBuilder$FlashPicAIOThumbView = paramView;
      jdField_a_of_type_AndroidWidgetImageView = localImageView;
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localObject2);
    }
    boolean bool2 = HotChatHelper.b(paramBaseChatItemLayout);
    boolean bool1 = false;
    paramView = URLDrawableHelper.a(paramBaseChatItemLayout, 65537);
    if ((bool2) && (jdField_a_of_type_Boolean)) {
      bool1 = true;
    }
    for (;;)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("FlashPicItemBuilder", 4, "isReuse:" + bool1 + ",isReaded:" + bool2);
      }
      paramView = FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (paramView != null) {
        paramView.a(paramChatMessage, this);
      }
      if (paramBaseChatItemLayout.isSendFromLocal()) {
        a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq), paramViewHolder);
      }
      jdField_a_of_type_AndroidViewView = paramChatMessage;
      return paramChatMessage;
      if ((!bool2) && (jdField_a_of_type_ComTencentImageURLDrawable != null) && (jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramView)))
      {
        bool1 = true;
      }
      else
      {
        jdField_a_of_type_Boolean = bool2;
        if (bool2)
        {
          jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130839221);
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemFlashPicItemBuilder$FlashPicAIOThumbView.setImageDrawable(a(jdField_a_of_type_AndroidContentContext.getResources()));
          jdField_a_of_type_ComTencentImageURLDrawable = null;
        }
        else
        {
          jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130839222);
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
          paramView = a(jdField_a_of_type_AndroidContentContext, paramBaseChatItemLayout, null);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemFlashPicItemBuilder$FlashPicAIOThumbView.setImageDrawable(paramView);
          jdField_a_of_type_ComTencentImageURLDrawable = paramView;
        }
      }
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new FlashPicItemBuilder.FlashPicHolder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return null;
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    if (paramInt == 2131304463) {
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
    }
  }
  
  protected void a(View paramView)
  {
    paramView = (MessageForPic)ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
    if (paramView.isSendFromLocal())
    {
      ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
      localActionSheet.a(2131367611, 5);
      localActionSheet.d(2131366996);
      localActionSheet.a(new kwa(this, paramView, localActionSheet));
      localActionSheet.show();
    }
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d(b, 2, "status:" + paramInt1 + ",retCode:" + paramInt2);
    }
    if (((e != 1) && (e != 131075)) || (paramInt1 == 2002) || (paramInt1 == 2001)) {}
    MessageForPic localMessageForPic;
    do
    {
      do
      {
        return;
        paramView = (FlashPicItemBuilder.FlashPicHolder)AIOUtils.a(paramView);
      } while ((paramView == null) || (jdField_a_of_type_ComTencentMobileqqDataChatMessage == null));
      localMessageForPic = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    } while ((uniseq != c) || (!localMessageForPic.isSendFromLocal()));
    a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq), paramView);
  }
  
  protected boolean a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    boolean bool = true;
    if (!paramChatMessage.isSendFromLocal()) {
      bool = false;
    }
    do
    {
      do
      {
        return bool;
        paramChatMessage = (MessageForPic)paramChatMessage;
        if (size > 0L) {
          break;
        }
        paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      } while (!(paramChatMessage instanceof BaseTransProcessor));
      if (((BaseTransProcessor)paramChatMessage).c() == 1005L) {}
      for (bool = true;; bool = false) {
        return bool;
      }
    } while (extraflag == 32768);
    return false;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    return paramView.a();
  }
}
