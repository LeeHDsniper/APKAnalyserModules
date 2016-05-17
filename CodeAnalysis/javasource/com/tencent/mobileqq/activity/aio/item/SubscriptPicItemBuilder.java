package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.util.MQLruCache;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.NativeGifImage;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.customviews.MessageProgressTextView;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.drawable.BitmapDrawableWithMargin;
import com.tencent.mobileqq.drawable.EmptyDrawable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicContants;
import com.tencent.mobileqq.pic.PicPreDownloader;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.RichMediaUtil;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import com.tencent.mobileqq.widget.CustomScaleType;
import com.tencent.mobileqq.widget.PhotoProgressDrawable;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinnableBitmapDrawable;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import cooperation.peak.PeakUtils;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import lbj;

public class SubscriptPicItemBuilder
  extends PicItemBuilder
{
  private static final String b = "SubscriptPicItemBuilder";
  public static long d;
  public static float e;
  static long e;
  public static float f;
  static long f;
  protected static int j;
  public static boolean j;
  protected static int k;
  public static boolean k;
  protected static int l;
  public static boolean l;
  public static int m;
  public static int n;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_j_of_type_Boolean = false;
    jdField_k_of_type_Boolean = false;
    jdField_l_of_type_Boolean = false;
    m = 100;
    d = 1000L;
    jdField_e_of_type_Float = 0.3F;
    jdField_f_of_type_Float = 1.0F;
    URLDrawableHelper.a();
    jdField_e_of_type_Long = 0L;
    jdField_f_of_type_Long = 1000L;
  }
  
  public SubscriptPicItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    this(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner, false);
  }
  
  public SubscriptPicItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner, boolean paramBoolean)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner, paramBoolean);
    jdField_j_of_type_Int = getResourcesgetDisplayMetricsdensityDpi;
    jdField_k_of_type_Int = getResourcesgetDisplayMetricswidthPixels;
    jdField_l_of_type_Int = AIOUtils.a(135.0F, paramContext.getResources());
  }
  
  public static RelativeLayout.LayoutParams a(int paramInt1, int paramInt2)
  {
    int i3 = URLDrawableHelper.c(true);
    int i2 = URLDrawableHelper.d(true);
    int i1;
    int i;
    if ((paramInt1 < i2) || (paramInt2 < i2)) {
      if (paramInt1 < paramInt2)
      {
        paramInt1 = (int)(i2 / paramInt1 * paramInt2 + 0.5F);
        if (paramInt1 > i3)
        {
          paramInt2 = i2;
          paramInt1 = i3;
          i1 = paramInt1;
          i = paramInt2;
        }
      }
    }
    do
    {
      return new RelativeLayout.LayoutParams((jdField_j_of_type_Int * i + 80) / 160, (jdField_j_of_type_Int * i1 + 80) / 160);
      paramInt2 = i2;
      break;
      paramInt1 = (int)(i2 / paramInt2 * paramInt1 + 0.5F);
      if (paramInt1 > i3) {
        paramInt1 = i3;
      }
      for (;;)
      {
        paramInt2 = paramInt1;
        paramInt1 = i2;
        break;
      }
      if (paramInt1 >= i3) {
        break label153;
      }
      i = paramInt1;
      i1 = paramInt2;
    } while (paramInt2 < i3);
    label153:
    float f1;
    if (paramInt1 > paramInt2)
    {
      f1 = i3 / paramInt1;
      label165:
      if (paramInt1 <= paramInt2) {
        break label216;
      }
    }
    label216:
    for (float f2 = i2 / paramInt2;; f2 = i2 / paramInt1)
    {
      f1 = Math.max(f1, f2);
      i = (int)(paramInt1 * f1 + 0.5F);
      i1 = (int)(f1 * paramInt2 + 0.5F);
      break;
      f1 = i3 / paramInt2;
      break label165;
    }
  }
  
  private void a(QQCustomMenu paramQQCustomMenu, Context paramContext, MessageForPic paramMessageForPic)
  {
    paramQQCustomMenu.a(2131299653, paramContext.getString(2131365741));
  }
  
  private void a(IHttpCommunicatorListener paramIHttpCommunicatorListener, SubscriptPicItemBuilder.Holder paramHolder)
  {
    if (jdField_a_of_type_AndroidViewView == null) {}
    int i;
    Object localObject;
    do
    {
      return;
      if (!(paramIHttpCommunicatorListener instanceof BaseTransProcessor)) {
        break;
      }
      paramIHttpCommunicatorListener = (BaseTransProcessor)paramIHttpCommunicatorListener;
      i = (int)paramIHttpCommunicatorListener.c();
      switch (i)
      {
      default: 
        if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null)
        {
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(null);
          ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView);
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = null;
        }
        if (b != null)
        {
          ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(b);
          b = null;
        }
        if (jdField_a_of_type_AndroidWidgetImageView != null) {
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
        return;
      case 1006: 
        if ((paramIHttpCommunicatorListener.b()) && (!h))
        {
          if (jdField_a_of_type_AndroidWidgetImageView == null)
          {
            paramIHttpCommunicatorListener = new ImageView(jdField_a_of_type_AndroidContentContext);
            paramIHttpCommunicatorListener.setImageResource(2130842326);
            paramIHttpCommunicatorListener.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            localObject = new RelativeLayout.LayoutParams(-2, -2);
            ((RelativeLayout.LayoutParams)localObject).addRule(6, 2131299562);
            ((RelativeLayout.LayoutParams)localObject).addRule(8, 2131299562);
            ((RelativeLayout.LayoutParams)localObject).addRule(5, 2131299562);
            ((RelativeLayout.LayoutParams)localObject).addRule(7, 2131299562);
            ((RelativeLayout)jdField_a_of_type_AndroidViewView).addView(paramIHttpCommunicatorListener, (ViewGroup.LayoutParams)localObject);
            jdField_a_of_type_AndroidWidgetImageView = paramIHttpCommunicatorListener;
          }
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
          if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null)
          {
            jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(null);
            ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView);
            jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = null;
          }
          if (b != null)
          {
            ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(b);
            b = null;
          }
          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
      }
    } while (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView == null);
    jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.jdField_a_of_type_Boolean = true;
    return;
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView == null)
    {
      localObject = new MessageProgressTextView(jdField_a_of_type_AndroidContentContext);
      ((MessageProgressTextView)localObject).setTextColor(-1);
      ((MessageProgressTextView)localObject).setTextSize(2, 15.0F);
      ((MessageProgressTextView)localObject).setGravity(17);
      new AIOSendMask(2130706432, 0.0F);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      ((MessageProgressTextView)localObject).setPadding(0, AIOUtils.a(41.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
      ((RelativeLayout)jdField_a_of_type_AndroidViewView).addView((View)localObject, localLayoutParams);
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = ((MessageProgressTextView)localObject);
    }
    if (b == null)
    {
      b = new View(jdField_a_of_type_AndroidContentContext);
      b.setBackgroundColor(2130706432);
      ((RelativeLayout)jdField_a_of_type_AndroidViewView).addView(b, new RelativeLayout.LayoutParams(-1, -1));
    }
    jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(paramIHttpCommunicatorListener);
    jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(0);
    if (b != null) {
      b.setVisibility(0);
    }
    if ((jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null) && ((1001 == i) || (1002 == i))) {
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.jdField_a_of_type_Boolean = false;
    }
    if (i != 1002)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(true);
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProgress(0);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
    jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.a();
    return;
    if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null)
    {
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(null);
      ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView);
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = null;
    }
    if (b != null)
    {
      ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(b);
      b = null;
    }
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
  }
  
  public static RelativeLayout.LayoutParams b(int paramInt1, int paramInt2)
  {
    int i = -1;
    if ((paramInt1 <= 0) || (paramInt2 <= 0))
    {
      paramInt2 = -1;
      paramInt1 = i;
    }
    for (;;)
    {
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(paramInt2, paramInt1);
      localLayoutParams.addRule(13);
      return localLayoutParams;
      if ((paramInt1 < 200) && (paramInt2 < 200))
      {
        localLayoutParams = a(paramInt1, paramInt2);
        paramInt2 = width;
        paramInt1 = height;
      }
      else
      {
        float f1 = Math.min(jdField_k_of_type_Int / paramInt1, (float)(jdField_k_of_type_Int / 1.8D) / paramInt2);
        i = (int)(paramInt1 * f1);
        paramInt1 = (int)(f1 * paramInt2);
        paramInt2 = i;
      }
    }
  }
  
  public static void b(Context paramContext, View paramView, MessageForPic paramMessageForPic, SessionInfo paramSessionInfo)
  {
    getChatFragmentaa = paramMessageForPic;
    PicItemBuilder.a(paramContext, paramView, paramMessageForPic, paramSessionInfo);
  }
  
  public static void b(MessageForPic paramMessageForPic, String paramString1, String paramString2)
  {
    b(paramMessageForPic, paramString1, paramString2, null);
  }
  
  public static void b(MessageForPic paramMessageForPic, String paramString1, String paramString2, Throwable paramThrowable)
  {
    RichMediaUtil.a(istroop, paramMessageForPic.isSendFromLocal(), 65537, String.valueOf(uniseq), "SubscriptPicItemBuilder." + paramString1, paramString2, paramThrowable);
  }
  
  public static RelativeLayout.LayoutParams c(int paramInt1, int paramInt2)
  {
    int i = -1;
    if ((paramInt1 <= 0) || (paramInt2 <= 0))
    {
      paramInt2 = -1;
      paramInt1 = i;
    }
    for (;;)
    {
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(paramInt2, paramInt1);
      localLayoutParams.addRule(13);
      return localLayoutParams;
      if ((paramInt1 < 200) && (paramInt2 < 200))
      {
        localLayoutParams = a(paramInt1, paramInt2);
        paramInt2 = width;
        paramInt1 = height;
      }
      else if ((paramInt1 >= 250) && (paramInt2 >= 150))
      {
        paramInt2 = jdField_k_of_type_Int;
        paramInt1 = (int)(jdField_k_of_type_Int * 0.556F);
      }
      else if ((paramInt1 >= 250) && (paramInt2 < 150))
      {
        i = jdField_k_of_type_Int;
        paramInt1 = jdField_k_of_type_Int * paramInt2 / paramInt1;
        paramInt2 = i;
      }
      else if ((paramInt1 < 250) && (paramInt2 >= 150))
      {
        i = (int)(jdField_k_of_type_Int * 0.556F);
        paramInt2 = (int)(paramInt1 * (i / paramInt2));
        paramInt1 = i;
      }
      else
      {
        localLayoutParams = a(paramInt1, paramInt2);
        paramInt2 = width;
        paramInt1 = height;
      }
    }
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout.setHeadIconVisible(false);
    MessageForPic localMessageForPic = (MessageForPic)paramChatMessage;
    subMsgType = 2;
    boolean bool = PeakUtils.a(imageType);
    SubscriptPicItemBuilder.Holder localHolder = (SubscriptPicItemBuilder.Holder)paramViewHolder;
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView == null) && (paramView != null)) {
      paramBaseChatItemLayout.removeView(paramView);
    }
    for (paramViewHolder = null;; paramViewHolder = paramView)
    {
      if (paramViewHolder == null)
      {
        paramViewHolder = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
        paramView = new SubscriptChatThumbView(jdField_a_of_type_AndroidContentContext);
        paramView.setId(2131299562);
        Object localObject = new RelativeLayout.LayoutParams(-2, -2);
        ((RelativeLayout.LayoutParams)localObject).addRule(13);
        paramViewHolder.addView(paramView, (ViewGroup.LayoutParams)localObject);
        paramViewHolder.setLayoutParams(new RelativeLayout.LayoutParams(-1, (int)(jdField_k_of_type_Int * 0.556F)));
        localObject = new ImageView(jdField_a_of_type_AndroidContentContext);
        ((ImageView)localObject).setImageBitmap(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(selfuin, (byte)3, true));
        ((ImageView)localObject).setId(2131296317);
        ((ImageView)localObject).setClickable(true);
        ((ImageView)localObject).setOnClickListener(this);
        RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(AIOUtils.a(40.0F, jdField_a_of_type_AndroidContentContext.getResources()), AIOUtils.a(40.0F, jdField_a_of_type_AndroidContentContext.getResources()));
        topMargin = AIOUtils.a(15.0F, jdField_a_of_type_AndroidContentContext.getResources());
        rightMargin = AIOUtils.a(20.0F, jdField_a_of_type_AndroidContentContext.getResources());
        localLayoutParams.addRule(11, -1);
        localLayoutParams.addRule(10, -1);
        paramViewHolder.addView((View)localObject, localLayoutParams);
        if (!jdField_a_of_type_Boolean) {
          paramView.setAdjustViewBounds(true);
        }
        paramViewHolder.setOnClickListener(this);
        paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
        jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView = paramView;
      }
      for (;;)
      {
        paramView = jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView;
        int i;
        if (paramView != null)
        {
          i = URLDrawableHelper.a(bool);
          paramView.setMaxWidth(i);
          paramView.setMaxHeight(i);
        }
        paramOnLongClickAndTouchListener = FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        if (paramOnLongClickAndTouchListener != null) {
          paramOnLongClickAndTouchListener.a(paramViewHolder, this);
        }
        if (!localMessageForPic.isSendFromLocal())
        {
          if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null)
          {
            jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(8);
            jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.clearAnimation();
            jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(null);
            ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView);
            jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = null;
          }
          if (jdField_a_of_type_AndroidWidgetImageView != null) {
            jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
          }
          paramOnLongClickAndTouchListener = URLDrawableHelper.a(localMessageForPic, 65537);
          if ((jdField_a_of_type_ComTencentImageURLDrawable == null) || (!jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramOnLongClickAndTouchListener)))
          {
            paramOnLongClickAndTouchListener = a(jdField_a_of_type_AndroidContentContext, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView);
            jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView.setImageDrawable(paramOnLongClickAndTouchListener);
            jdField_a_of_type_ComTencentImageURLDrawable = paramOnLongClickAndTouchListener;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageForPic, 2);
            paramOnLongClickAndTouchListener = paramViewHolder.findViewById(2131296317);
            if (!paramChatMessage.isSend()) {
              break label880;
            }
            if (paramOnLongClickAndTouchListener != null) {
              paramOnLongClickAndTouchListener.setVisibility(0);
            }
            label556:
            paramBaseChatItemLayout.a();
            if (jdField_a_of_type_ComTencentImageURLDrawable != null) {
              if ((imageType != 3) && (imageType != 2000)) {
                break label895;
              }
            }
          }
        }
        label880:
        label895:
        for (paramChatMessage = b(subThumbWidth, subThumbHeight);; paramChatMessage = c(subThumbWidth, subThumbHeight))
        {
          if (subThumbWidth <= 0)
          {
            int i1 = (int)(jdField_k_of_type_Int / 1.8D);
            i = i1;
            if (i1 > jdField_l_of_type_Int) {
              i = jdField_l_of_type_Int;
            }
            width = i;
            height = i;
          }
          paramView.setDisplayRuleDef(CustomScaleType.b);
          paramView.setLayoutParams(paramChatMessage);
          paramViewHolder.setBackgroundColor(-1);
          return paramViewHolder;
          if (thumbWidth > 0) {
            break;
          }
          paramOnLongClickAndTouchListener = a(jdField_a_of_type_AndroidContentContext, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView);
          jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView.setImageDrawable(paramOnLongClickAndTouchListener);
          jdField_a_of_type_ComTencentImageURLDrawable = paramOnLongClickAndTouchListener;
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageForPic, 2);
          break;
          paramOnLongClickAndTouchListener = URLDrawableHelper.a(localMessageForPic, 65537);
          if ((jdField_a_of_type_ComTencentImageURLDrawable == null) || (!jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramOnLongClickAndTouchListener)))
          {
            paramOnLongClickAndTouchListener = a(jdField_a_of_type_AndroidContentContext, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView);
            jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView.setImageDrawable(paramOnLongClickAndTouchListener);
            jdField_a_of_type_ComTencentImageURLDrawable = paramOnLongClickAndTouchListener;
          }
          for (;;)
          {
            paramOnLongClickAndTouchListener = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
            jdField_a_of_type_AndroidViewView = paramViewHolder;
            a(paramOnLongClickAndTouchListener, localHolder);
            break;
            if (subThumbWidth <= 0)
            {
              paramOnLongClickAndTouchListener = a(jdField_a_of_type_AndroidContentContext, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView);
              jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView.setImageDrawable(paramOnLongClickAndTouchListener);
              jdField_a_of_type_ComTencentImageURLDrawable = paramOnLongClickAndTouchListener;
            }
          }
          if (paramOnLongClickAndTouchListener == null) {
            break label556;
          }
          paramOnLongClickAndTouchListener.setVisibility(8);
          break label556;
        }
      }
    }
  }
  
  public URLDrawable a(Context paramContext, MessageForPic paramMessageForPic, SubscriptChatThumbView paramSubscriptChatThumbView)
  {
    boolean bool2 = PeakUtils.a(imageType);
    int i;
    Object localObject1;
    if ((imageType == 3) || (imageType == 2000))
    {
      i = 1;
      if (i == 0) {
        break label1527;
      }
      if (!jdField_j_of_type_Boolean)
      {
        localObject1 = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.aio_gifplay.name());
        if ((localObject1 != null) && (((String)localObject1).length() > 0))
        {
          localObject1 = ((String)localObject1).split("\\|");
          if (localObject1.length >= 3)
          {
            jdField_k_of_type_Boolean = localObject1[0].equals("1");
            jdField_l_of_type_Boolean = localObject1[1].equals("1");
          }
        }
      }
    }
    for (;;)
    {
      try
      {
        m = Integer.parseInt(localObject1[2]);
        if (m < 0) {
          m = 100;
        }
        com.tencent.image.AbstractGifImage.DoAccumulativeRunnable.DELAY = m;
        jdField_j_of_type_Boolean = true;
        if (jdField_k_of_type_Boolean)
        {
          localObject3 = URLDrawableHelper.a(paramMessageForPic, 1, null);
          localObject1 = AbsDownloader.a(((URL)localObject3).toString());
          if (localObject1 != null)
          {
            try
            {
              localRect = NativeGifImage.getImageSize((File)localObject1, false);
              bool1 = true;
            }
            catch (IOException localIOException)
            {
              String str;
              int i5;
              label410:
              localRect = null;
              bool1 = false;
              localObject3 = null;
              continue;
              localObject3 = URLDrawableHelper.a(paramMessageForPic, 131075, null);
              if (AbsDownloader.a(((URL)localObject3).toString()) == null) {
                break label1524;
              }
              aiofileType = 131075;
              Object localObject2 = localObject3;
              continue;
              aiofileType = 1;
              localObject2 = localObject3;
              continue;
              if (AbsDownloader.a(((URL)localObject3).toString()) == null) {
                break label1524;
              }
              aiofileType = 1;
              localObject2 = localObject3;
              continue;
              localObject3 = URLDrawableHelper.a(paramMessageForPic, 65537, null);
              continue;
              File localFile = AbsDownloader.a(str);
              if (localFile == null) {
                break label829;
              }
              if (localRect == null) {
                break label754;
              }
              int i1 = localRect.width();
              i = localRect.height();
              int i4 = 760;
              if (760 <= jdField_k_of_type_Int) {
                break label587;
              }
              i4 = jdField_k_of_type_Int;
              int i2 = i;
              int i3 = i1;
              if (i1 <= i4) {
                break label654;
              }
              i2 = i;
              i3 = i1;
              if (i <= i4) {
                break label654;
              }
              float f1 = Math.min(i1 / i4, i / i4);
              i3 = (int)(i1 / f1);
              i2 = (int)(i / f1);
              subThumbWidth = i3;
              subThumbHeight = i2;
              if (!str.startsWith("chatthumb")) {
                break label1513;
              }
              paramContext = a(i3, i2);
              i = width;
              for (i1 = height;; i1 = i2)
              {
                localObject2 = URLDrawableHelper.a((URL)localObject3, i, i1, new EmptyDrawable(i, i1), URLDrawableHelper.b, true, 0.0F);
                ((URLDrawable)localObject2).setIgnorePause(true);
                ((URLDrawable)localObject2).setFadeInImage(true);
                paramContext = (Context)localObject2;
                if (paramSubscriptChatThumbView == null) {
                  break;
                }
                jdField_a_of_type_Boolean = true;
                paramContext = (Context)localObject2;
                break;
                paramContext = new BitmapFactory.Options();
                inJustDecodeBounds = true;
                BitmapFactory.decodeFile(localFile.getAbsolutePath(), paramContext);
                i1 = outWidth;
                i = outHeight;
                i2 = URLDrawableHelper.a(localFile.getAbsolutePath());
                if ((i2 != 90) && (i2 != 270)) {
                  break label568;
                }
                i1 = outHeight;
                i = outWidth;
                break label568;
                if (!URLDrawableHelper.a(paramContext))
                {
                  i2 = 1;
                  i = URLDrawableHelper.c(bool2);
                  i1 = URLDrawableHelper.d(bool2);
                  i3 = thumbWidth;
                  i4 = thumbHeight;
                  if ((i3 <= 0) || (i4 <= 0)) {
                    break label1329;
                  }
                  if ((i3 >= i1) && (i4 >= i1)) {
                    break label1212;
                  }
                  if (i3 >= i4) {
                    break label1166;
                  }
                  f1 = i1 / i3;
                  i3 = (int)(i4 * f1 + 0.5F);
                  if (i3 <= i) {
                    break label1159;
                  }
                  f1 = i5 / 160.0F;
                  i1 = (int)(i1 * f1 + 0.5F);
                  i = (int)(i * f1 + 0.5F);
                  paramContext = null;
                  paramSubscriptChatThumbView = URLDrawable.URLDrawableOptions.obtain();
                  mRequestWidth = i1;
                  mRequestHeight = i;
                  mLoadingDrawable = URLDrawableHelper.a;
                  mFailedDrawable = URLDrawableHelper.b;
                  mPlayGifImage = bool1;
                  mGifRoundCorner = 0.0F;
                  mImgType = imageType;
                  if (aiofileType == 1)
                  {
                    mRequestWidth = jdField_k_of_type_Int;
                    mRequestHeight = ((int)(jdField_k_of_type_Int * 1.5D));
                  }
                  i1 = (int)(jdField_k_of_type_Int / 1.8D);
                  i = i1;
                  if (i1 > jdField_l_of_type_Int) {
                    i = jdField_l_of_type_Int;
                  }
                  if (!(URLDrawableHelper.a instanceof SkinnableBitmapDrawable)) {
                    break label1384;
                  }
                  paramContext = new BitmapDrawableWithMargin((Resources)localObject2, ((SkinnableBitmapDrawable)URLDrawableHelper.a).getBitmap(), i, i, -921103);
                  if (paramContext != null) {
                    mLoadingDrawable = paramContext;
                  }
                  paramContext = URLDrawable.getDrawable((URL)localObject3, paramSubscriptChatThumbView);
                  if ((!PicContants.b) && (i2 == 0)) {
                    break label1425;
                  }
                  paramContext.setAutoDownload(true);
                }
                for (;;)
                {
                  paramContext.setProgressDrawable(new PhotoProgressDrawable(URLDrawableHelper.a(), 0, false));
                  break;
                  i2 = 0;
                  break label839;
                  i = i3;
                  break label924;
                  i3 = (int)(i1 / i4 * i3 + 0.5F);
                  if (i3 > i) {}
                  for (;;)
                  {
                    i3 = i;
                    i = i1;
                    i1 = i3;
                    break;
                    i = i3;
                  }
                  if ((i3 < i) && (i4 < i))
                  {
                    i = i4;
                    i1 = i3;
                    break label924;
                  }
                  if (i3 > i4)
                  {
                    f1 = i / i3;
                    if (i3 <= i4) {
                      break label1317;
                    }
                  }
                  for (float f2 = i1 / i4;; f2 = i1 / i3)
                  {
                    f1 = Math.max(f1, f2);
                    i1 = (int)(i3 * f1 + 0.5F);
                    i = (int)(f1 * i4 + 0.5F);
                    break;
                    f1 = i / i4;
                    break label1253;
                  }
                  if (QLog.isColorLevel()) {
                    QLog.d("SubscriptPicItemBuilder", 2, "MessageForPic without width/height of thumb, width = " + i3 + ", height = " + i4);
                  }
                  i1 = 99;
                  i = 99;
                  break label924;
                  if (!(URLDrawableHelper.a instanceof BitmapDrawable)) {
                    break label1102;
                  }
                  paramContext = new BitmapDrawableWithMargin((Resources)localObject2, ((BitmapDrawable)URLDrawableHelper.a).getBitmap(), i, i, -921103);
                  break label1102;
                  paramContext.setAutoDownload(false);
                }
                localObject2 = new BitmapFactory.Options();
                inJustDecodeBounds = true;
                BitmapFactory.decodeFile(paramSubscriptChatThumbView.getAbsolutePath(), (BitmapFactory.Options)localObject2);
                i1 = outWidth;
                i = outHeight;
                i2 = URLDrawableHelper.a(paramSubscriptChatThumbView.getAbsolutePath());
                if ((i2 != 90) && (i2 != 270)) {
                  break label410;
                }
                i1 = outHeight;
                i = outWidth;
                break label410;
                i = i3;
              }
              continue;
            }
            localObject1 = localObject3;
            if (localObject3 == null)
            {
              localObject1 = localObject3;
              if (aiofileType == -1)
              {
                localObject1 = localObject3;
                if (i == 0)
                {
                  localObject1 = URLDrawableHelper.a(paramMessageForPic, 65537, null);
                  localObject3 = URLDrawableHelper.a(paramMessageForPic, 1, null);
                  aiofileType = 65537;
                  if (!NetworkUtil.b(jdField_a_of_type_AndroidContentContext)) {
                    break label501;
                  }
                  if (!MsgUtils.a(issend)) {
                    break label489;
                  }
                  if (AbsDownloader.a(((URL)localObject3).toString()) == null) {
                    break label454;
                  }
                  aiofileType = 1;
                  localObject1 = localObject3;
                }
              }
            }
            localObject3 = localObject1;
            if (localObject1 == null)
            {
              if (aiofileType != -1) {
                localObject3 = URLDrawableHelper.a(paramMessageForPic, aiofileType, null);
              }
            }
            else
            {
              str = ((URL)localObject3).toString();
              localObject1 = paramContext.getResources();
              i5 = getDisplayMetricsdensityDpi;
              if (paramSubscriptChatThumbView != null) {
                jdField_a_of_type_Boolean = false;
              }
              if (BaseApplicationImpl.a.get(str) == null) {
                break label537;
              }
              paramContext = URLDrawableHelper.a((URL)localObject3, 0, 0, null, null, true, 0.0F);
              paramContext.setTag(paramMessageForPic);
              if ((subThumbWidth == -1) || (subThumbHeight == -1))
              {
                paramSubscriptChatThumbView = AbsDownloader.a(str);
                if (paramSubscriptChatThumbView != null)
                {
                  if (localRect == null) {
                    break label1433;
                  }
                  i1 = localRect.width();
                  i = localRect.height();
                  subThumbWidth = i1;
                  subThumbHeight = i;
                }
              }
              return paramContext;
              i = 0;
            }
          }
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        m = 100;
        continue;
      }
      label454:
      label489:
      label501:
      label537:
      label568:
      label587:
      label654:
      label754:
      label829:
      label839:
      label924:
      label1102:
      label1159:
      label1166:
      label1212:
      label1253:
      label1317:
      label1329:
      label1384:
      label1425:
      label1433:
      label1513:
      label1524:
      label1527:
      Rect localRect = null;
      boolean bool1 = false;
      Object localObject3 = null;
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new SubscriptPicItemBuilder.Holder(this);
  }
  
  protected void a(View paramView)
  {
    if (aisMultiMsg) {}
    do
    {
      return;
      paramView = (MessageForPic)ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
    } while (!paramView.isSendFromLocal());
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
    localActionSheet.a(2131367611, 5);
    localActionSheet.d(2131366996);
    localActionSheet.a(new lbj(this, paramView, localActionSheet));
    localActionSheet.show();
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    if (((e != 1) && (e != 131075)) || (paramInt1 == 2002) || (paramInt1 == 2001)) {}
    label141:
    label151:
    do
    {
      MessageForPic localMessageForPic;
      do
      {
        return;
        if ((paramInt1 == 1001) || (paramInt1 == 1000) || (paramInt1 == 4001) || (paramInt1 == 1002) || (paramInt1 == 1004) || (paramInt1 == 1005)) {}
        for (i = false;; i = true) {
          do
          {
            paramView = (SubscriptPicItemBuilder.Holder)AIOUtils.a(paramView);
            if ((paramView != null) && (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null)) {
              break label151;
            }
            if (!QLog.isColorLevel()) {
              break;
            }
            if (paramView != null) {
              break label141;
            }
            QLog.e("SubscriptPicItemBuilder", 2, "handleMessage(): holder is null");
            return;
          } while ((paramInt1 != 1007) && (paramInt1 != 1003));
        }
        QLog.e("SubscriptPicItemBuilder", 2, "handleMessage(): holder.mMessage is null");
        return;
        localMessageForPic = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      } while (uniseq != c);
      b(localMessageForPic, "transf.in", "status:" + paramInt1 + ",retCode" + paramInt2 + "message.uniseq：" + uniseq + ",file.uniseq:" + c);
      if (localMessageForPic.isSendFromLocal())
      {
        a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq), paramView);
        if (paramInt1 == 1005) {
          a();
        }
      }
    } while (paramInt1 != 2003);
    paramFileMsg = a(jdField_a_of_type_AndroidContentContext, (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView);
    jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView.setImageDrawable(paramFileMsg);
    jdField_a_of_type_ComTencentImageURLDrawable = paramFileMsg;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    Object localObject = (SubscriptPicItemBuilder.Holder)AIOUtils.a(paramView);
    paramView = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    boolean bool = URLDrawableHelper.a(jdField_a_of_type_AndroidContentContext, paramView, 65537);
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    h = true;
    if (!paramView.isSendFromLocal())
    {
      if (jdField_a_of_type_ComTencentImageURLDrawable.getStatus() == 1)
      {
        localQQCustomMenu.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
        if (bool) {
          localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
        }
        a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, paramView);
        if (paramView.isSend()) {
          a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramView);
        }
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
      }
      return localQQCustomMenu.a();
    }
    if (size > 0L)
    {
      localQQCustomMenu.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
      if (bool) {
        localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
      }
      a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, paramView);
      if ((paramView.isSend()) && (i)) {
        a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramView);
      }
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
    }
    for (;;)
    {
      return localQQCustomMenu.a();
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      if ((localObject instanceof BaseTransProcessor))
      {
        localObject = (BaseTransProcessor)localObject;
        if ((((BaseTransProcessor)localObject).c() == 1005L) || (((BaseTransProcessor)localObject).c() == 1003L) || (((BaseTransProcessor)localObject).d() == 1003L))
        {
          localQQCustomMenu.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
          if (bool) {
            localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
          }
          a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, paramView);
          ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
        }
        else
        {
          localQQCustomMenu.a(2131304465, jdField_a_of_type_AndroidContentContext.getString(2131367615));
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
            localQQCustomMenu.a(2131304466, jdField_a_of_type_AndroidContentContext.getString(2131367616));
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        }
      }
      else
      {
        localQQCustomMenu.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
        if (bool) {
          localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
        }
        a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, paramView);
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
      }
    }
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.jdField_l_of_type_Boolean = true;
    if (super.a()) {}
    MessageForPic localMessageForPic;
    do
    {
      do
      {
        return;
        if (paramView.getId() != 2131296325) {
          break label354;
        }
        paramView = (SubscriptPicItemBuilder.Holder)AIOUtils.a(paramView);
        localMessageForPic = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
        localObject = jdField_a_of_type_ComTencentImageURLDrawable;
        if (localMessageForPic.isSendFromLocal()) {
          break;
        }
        switch (((URLDrawable)localObject).getStatus())
        {
        default: 
          return;
        }
      } while (((URLDrawable)localObject).isDownloadStarted());
      ((URLDrawable)localObject).startDownload();
      return;
      if ((Utils.d()) && (Utils.b() < 20971520L))
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext, "手机存储空间已满，请清理后重新进入QQ。", 0).a();
        return;
      }
    } while (!FileUtils.a(jdField_a_of_type_AndroidContentContext));
    ((URLDrawable)localObject).restartDownload();
    return;
    Object localObject = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
    if ((!TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)) {
      ((TroopHandler)localObject).d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true);
    }
    b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    return;
    if (((URLDrawable)localObject).getStatus() == 2)
    {
      if ((Utils.d()) && (Utils.b() < 20971520L))
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext, "手机存储空间已满，请清理后重试。", 0).a();
        return;
      }
      if (FileUtils.a(jdField_a_of_type_AndroidContentContext)) {
        ((URLDrawable)localObject).restartDownload();
      }
    }
    if (size <= 0L)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      if ((localObject instanceof BaseTransProcessor))
      {
        localObject = (BaseTransProcessor)localObject;
        if ((((BaseTransProcessor)localObject).b()) && (((BaseTransProcessor)localObject).c()))
        {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, String.valueOf(uniseq));
          return;
        }
      }
    }
    b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemSubscriptChatThumbView, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    return;
    label354:
    super.onClick(paramView);
  }
}
