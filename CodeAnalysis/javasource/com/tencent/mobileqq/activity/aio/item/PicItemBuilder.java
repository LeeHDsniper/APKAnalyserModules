package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.os.Process;
import android.support.v4.app.FragmentActivity;
import android.support.v4.util.MQLruCache;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.galleryactivity.AnimationUtils;
import com.tencent.image.NativeGifImage;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.MultiForwardActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.ForwardUtils;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.AIOImageData;
import com.tencent.mobileqq.activity.aio.photo.AIOImageProviderService;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.customviews.MessageProgressTextView;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.drawable.BitmapDrawableWithMargin;
import com.tencent.mobileqq.drawable.EmptyDrawable;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.pic.PicBusiManager;
import com.tencent.mobileqq.pic.PicContants;
import com.tencent.mobileqq.pic.PicDownloadInfo.Builder;
import com.tencent.mobileqq.pic.PicFowardInfo;
import com.tencent.mobileqq.pic.PicPreDownloader;
import com.tencent.mobileqq.pic.PicReq;
import com.tencent.mobileqq.pic.PicUiInterface;
import com.tencent.mobileqq.pic.PicUploadInfo.Builder;
import com.tencent.mobileqq.pic.PicUploadInfo.RetryInfo;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.BaseUploadProcessor;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.PicFowardDbRecordData;
import com.tencent.mobileqq.transfile.RichMediaUtil;
import com.tencent.mobileqq.transfile.TranDbRecord.PicDbRecord;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ActionMsgUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import com.tencent.mobileqq.widget.PhotoProgressDrawable;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinnableBitmapDrawable;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import cooperation.peak.PeakUtils;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.net.URL;
import kzd;
import kze;
import kzf;
import mqq.app.AppRuntime;
import mqq.app.MobileQQ;

public class PicItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback
{
  public static long a = 0L;
  static long jdField_b_of_type_Long = 0L;
  private static final String jdField_b_of_type_JavaLangString = "PicItemBuilder";
  public static float c;
  static long c;
  public static float d;
  public static boolean e;
  public static boolean f;
  public static boolean g;
  public static int h;
  public static int i;
  protected final float b;
  protected final boolean d;
  boolean h;
  boolean i = true;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    e = false;
    f = false;
    g = false;
    jdField_h_of_type_Int = 100;
    jdField_a_of_type_Long = 1000L;
    jdField_c_of_type_Float = 0.3F;
    jdField_d_of_type_Float = 1.0F;
    URLDrawableHelper.a();
    jdField_b_of_type_Long = 0L;
    jdField_c_of_type_Long = 1000L;
  }
  
  public PicItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    this(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner, false);
  }
  
  public PicItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner, boolean paramBoolean)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_h_of_type_Boolean = false;
    jdField_b_of_type_Float = getResourcesgetDisplayMetricsdensity;
    jdField_d_of_type_Boolean = paramBoolean;
  }
  
  public static URLDrawable a(Context paramContext, MessageForPic paramMessageForPic)
  {
    return a(paramContext, paramMessageForPic, null);
  }
  
  public static URLDrawable a(Context paramContext, MessageForPic paramMessageForPic, ChatThumbView paramChatThumbView)
  {
    boolean bool2 = PeakUtils.a(imageType);
    Object localObject1;
    if ((imageType == 3) || (imageType == 2000)) {
      if (!e)
      {
        localObject1 = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.aio_gifplay.name());
        if ((localObject1 != null) && (((String)localObject1).length() > 0))
        {
          localObject1 = ((String)localObject1).split("\\|");
          if (localObject1.length >= 3)
          {
            f = localObject1[0].equals("1");
            g = localObject1[1].equals("1");
          }
        }
      }
    }
    for (;;)
    {
      Object localObject3;
      Object localObject4;
      int i2;
      try
      {
        jdField_h_of_type_Int = Integer.parseInt(localObject1[2]);
        if (jdField_h_of_type_Int < 0) {
          jdField_h_of_type_Int = 100;
        }
        com.tencent.image.AbstractGifImage.DoAccumulativeRunnable.DELAY = jdField_h_of_type_Int;
        e = true;
        if (!f) {
          break label1316;
        }
        localObject1 = URLDrawableHelper.a(paramMessageForPic, 1, null);
        localObject2 = AbsDownloader.a(((URL)localObject1).toString());
        if (localObject2 == null) {
          break label1316;
        }
        try
        {
          localObject2 = NativeGifImage.getImageSize((File)localObject2, false);
          bool1 = true;
        }
        catch (IOException localIOException)
        {
          localObject2 = null;
          bool1 = false;
          localURLDrawable = null;
          continue;
          localObject4 = AbsDownloader.a((String)localObject4);
          if (localObject4 == null) {
            break label775;
          }
        }
        localObject3 = localObject1;
        if (localObject1 == null) {
          localObject3 = URLDrawableHelper.a(paramMessageForPic, 65537, null);
        }
        localObject4 = ((URL)localObject3).toString();
        localObject1 = paramContext.getResources();
        i2 = getDisplayMetricsdensityDpi;
        if (paramChatThumbView != null) {
          a = false;
        }
        if (BaseApplicationImpl.a.get(localObject4) != null)
        {
          paramContext = URLDrawableHelper.a((URL)localObject3, 0, 0, null, null, true, 12.0F * (i2 / 160));
          paramContext.setTag(paramMessageForPic);
          return paramContext;
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        jdField_h_of_type_Int = 100;
        continue;
      }
      int k;
      int j;
      label315:
      int n;
      int m;
      float f1;
      float f2;
      if (localObject2 != null)
      {
        k = ((Rect)localObject2).width();
        j = ((Rect)localObject2).height();
        n = URLDrawableHelper.c(bool2);
        m = URLDrawableHelper.d(bool2);
        f1 = i2 / 160 * 12.0F;
        if ((k >= m) && (j >= m)) {
          break label640;
        }
        if (k >= j) {
          break label594;
        }
        f2 = m / k;
        k = (int)(j * f2 + 0.5F);
        j = k;
        if (k > n) {
          j = n;
        }
        k = m;
        f1 = f2 * f1;
        label406:
        k = (k * i2 + 80) / 160;
        j = (j * i2 + 80) / 160;
        if (localObject2 == null) {
          break label1313;
        }
        if (((Rect)localObject2).width() >= k) {
          break label749;
        }
        f1 *= ((Rect)localObject2).width() / k;
      }
      label594:
      label640:
      label673:
      label737:
      label749:
      label775:
      label785:
      label868:
      label988:
      label1045:
      label1052:
      label1098:
      label1138:
      label1197:
      label1209:
      label1264:
      label1305:
      label1313:
      for (;;)
      {
        localURLDrawable = URLDrawableHelper.a((URL)localObject3, k, j, new EmptyDrawable(k, j), URLDrawableHelper.b, true, f1);
        localURLDrawable.setIgnorePause(true);
        localURLDrawable.setFadeInImage(true);
        paramContext = localURLDrawable;
        if (paramChatThumbView == null) {
          break;
        }
        a = true;
        paramContext = localURLDrawable;
        break;
        paramContext = new BitmapFactory.Options();
        inJustDecodeBounds = true;
        BitmapFactory.decodeFile(((File)localObject4).getAbsolutePath(), paramContext);
        k = outWidth;
        j = outHeight;
        m = URLDrawableHelper.a(((File)localObject4).getAbsolutePath());
        if ((m != 90) && (m != 270)) {
          break label315;
        }
        k = outHeight;
        j = outWidth;
        break label315;
        f2 = m / j;
        j = (int)(k * f2 + 0.5F);
        if (j > n) {
          j = n;
        }
        for (;;)
        {
          k = j;
          j = m;
          break;
        }
        if ((k < n) && (j < n)) {
          break label406;
        }
        if (k > j)
        {
          f2 = n / k;
          if (k <= j) {
            break label737;
          }
        }
        for (float f3 = m / j;; f3 = m / k)
        {
          f2 = Math.max(f2, f3);
          k = (int)(k * f2 + 0.5F);
          j = (int)(j * f2 + 0.5F);
          break;
          f2 = n / j;
          break label673;
        }
        if (((Rect)localObject2).height() < j)
        {
          f1 *= ((Rect)localObject2).height() / j;
          continue;
          int i1;
          if (!URLDrawableHelper.a(paramContext))
          {
            m = 1;
            j = URLDrawableHelper.c(bool2);
            k = URLDrawableHelper.d(bool2);
            n = thumbWidth;
            i1 = thumbHeight;
            if ((n <= 0) || (i1 <= 0)) {
              break label1209;
            }
            if ((n >= k) && (i1 >= k)) {
              break label1098;
            }
            if (n >= i1) {
              break label1052;
            }
            f1 = k / n;
            n = (int)(i1 * f1 + 0.5F);
            if (n <= j) {
              break label1045;
            }
            f1 = i2 / 160.0F;
            k = (int)(k * f1 + 0.5F);
            j = (int)(j * f1 + 0.5F);
            paramContext = null;
            paramChatThumbView = URLDrawable.URLDrawableOptions.obtain();
            mRequestWidth = k;
            mRequestHeight = j;
            mLoadingDrawable = URLDrawableHelper.a;
            mFailedDrawable = URLDrawableHelper.b;
            mPlayGifImage = bool1;
            mGifRoundCorner = 12.0F;
            mImgType = imageType;
            if (!(URLDrawableHelper.a instanceof SkinnableBitmapDrawable)) {
              break label1264;
            }
            paramContext = new BitmapDrawableWithMargin(localURLDrawable, ((SkinnableBitmapDrawable)URLDrawableHelper.a).getBitmap(), k, j, -921103);
            if (paramContext != null) {
              mLoadingDrawable = paramContext;
            }
            paramContext = URLDrawable.getDrawable((URL)localObject3, paramChatThumbView);
            if ((!PicContants.b) && (m == 0)) {
              break label1305;
            }
            paramContext.setAutoDownload(true);
          }
          for (;;)
          {
            paramContext.setProgressDrawable(new PhotoProgressDrawable(URLDrawableHelper.a(), 0, false));
            break;
            m = 0;
            break label785;
            j = n;
            break label868;
            n = (int)(k / i1 * n + 0.5F);
            if (n > j) {}
            for (;;)
            {
              n = j;
              j = k;
              k = n;
              break;
              j = n;
            }
            if ((n < j) && (i1 < j))
            {
              j = i1;
              k = n;
              break label868;
            }
            if (n > i1)
            {
              f1 = j / n;
              if (n <= i1) {
                break label1197;
              }
            }
            for (f2 = k / i1;; f2 = k / n)
            {
              f1 = Math.max(f1, f2);
              k = (int)(n * f1 + 0.5F);
              j = (int)(f1 * i1 + 0.5F);
              break;
              f1 = j / i1;
              break label1138;
            }
            if (QLog.isColorLevel()) {
              QLog.d("PicItemBuilder", 2, "MessageForPic without width/height of thumb, width = " + n + ", height = " + i1);
            }
            k = 99;
            j = 99;
            break label868;
            if (!(URLDrawableHelper.a instanceof BitmapDrawable)) {
              break label988;
            }
            paramContext = new BitmapDrawableWithMargin(localURLDrawable, ((BitmapDrawable)URLDrawableHelper.a).getBitmap(), k, j, -921103);
            break label988;
            paramContext.setAutoDownload(false);
          }
        }
      }
      label1316:
      Object localObject2 = null;
      boolean bool1 = false;
      URLDrawable localURLDrawable = null;
    }
  }
  
  public static void a(Context paramContext, View paramView, MessageForPic paramMessageForPic, SessionInfo paramSessionInfo)
  {
    paramView = AnimationUtils.a(paramView);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("KEY_THUMBNAL_BOUND", paramView);
    if ((((paramContext instanceof ChatActivity)) || ((paramContext instanceof SplashActivity))) && (!(paramContext instanceof MultiForwardActivity)))
    {
      int j = ((FragmentActivity)paramContext).getChatFragment().a().f();
      localBundle.putInt("extra.AIO_CURRENT_PANEL_STATE", j);
      if (j == 1)
      {
        paramView = (InputMethodManager)paramContext.getSystemService("input_method");
        if (paramView != null) {
          paramView.toggleSoftInput(1, 0);
        }
      }
    }
    if (jdField_a_of_type_Int == 1)
    {
      localBundle.putBoolean("extra.CAN_FORWARD_TO_GROUP_ALBUM", true);
      localBundle.putString("extra.GROUP_UIN", jdField_a_of_type_JavaLangString);
      localBundle.putString("extra.GROUP_CODE", b);
    }
    if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 3000)) {
      localBundle.putInt("extra.EXTRA_FORWARD_TO_QZONE_SRC", 2);
    }
    for (;;)
    {
      localBundle.putBoolean("extra.IS_FROM_MULTI_MSG", isMultiMsg);
      localBundle.putInt("extra.MOBILE_QQ_PROCESS_ID", Process.myPid());
      str = selfuin;
      paramView = str;
      if (isMultiMsg) {}
      try
      {
        AppRuntime localAppRuntime = MobileQQ.sMobileQQ.waitAppRuntime(null);
        paramView = str;
        if ((localAppRuntime instanceof QQAppInterface)) {
          paramView = localAppRuntime.getAccount();
        }
      }
      catch (Exception paramView)
      {
        for (;;)
        {
          paramView = str;
        }
      }
      localBundle.putInt("forward_source_uin_type", jdField_a_of_type_Int);
      PeakUtils.a(paramContext, localBundle, new AIOImageProviderService(paramView, frienduin, istroop, paramMessageForPic), AIOGalleryUtils.a(paramMessageForPic));
      if (QLog.isColorLevel()) {
        QLog.i("PicItemBuilder", 2, "PicItemBuilder.enterImagePreview()");
      }
      return;
      localBundle.putInt("extra.EXTRA_FORWARD_TO_QZONE_SRC", 1);
    }
  }
  
  public static void a(MessageForPic paramMessageForPic, String paramString1, String paramString2)
  {
    a(paramMessageForPic, paramString1, paramString2, null);
  }
  
  public static void a(MessageForPic paramMessageForPic, String paramString1, String paramString2, Throwable paramThrowable)
  {
    RichMediaUtil.a(istroop, paramMessageForPic.isSendFromLocal(), 65537, String.valueOf(uniseq), "PicItemBuilder." + paramString1, paramString2, paramThrowable);
  }
  
  private void a(IHttpCommunicatorListener paramIHttpCommunicatorListener, PicItemBuilder.Holder paramHolder)
  {
    if (jdField_a_of_type_AndroidViewView == null) {}
    int j;
    Object localObject;
    do
    {
      return;
      if (!(paramIHttpCommunicatorListener instanceof BaseTransProcessor)) {
        break;
      }
      paramIHttpCommunicatorListener = (BaseTransProcessor)paramIHttpCommunicatorListener;
      j = (int)paramIHttpCommunicatorListener.c();
      switch (j)
      {
      default: 
        if (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null)
        {
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(null);
          ((RelativeLayout)jdField_a_of_type_AndroidViewView).removeView(jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView);
          jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = null;
        }
        if (jdField_a_of_type_AndroidWidgetImageView != null) {
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
        return;
      case 1006: 
        if ((paramIHttpCommunicatorListener.b()) && (!jdField_h_of_type_Boolean))
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
          jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
      }
    } while (jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView == null);
    jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.a = true;
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
      ((MessageProgressTextView)localObject).setBackgroundDrawable(new AIOSendMask(2130706432, jdField_b_of_type_Float * 12.0F));
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(6, 2131299562);
      localLayoutParams.addRule(8, 2131299562);
      localLayoutParams.addRule(5, 2131299562);
      localLayoutParams.addRule(7, 2131299562);
      ((RelativeLayout)jdField_a_of_type_AndroidViewView).addView((View)localObject, localLayoutParams);
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView = ((MessageProgressTextView)localObject);
    }
    jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setProcessor(paramIHttpCommunicatorListener);
    jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.setVisibility(0);
    if ((jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView != null) && ((1001 == j) || (1002 == j))) {
      jdField_a_of_type_ComTencentMobileqqCustomviewsMessageProgressTextView.a = false;
    }
    if (j != 1002)
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
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.setProgressVisable(false);
  }
  
  private void b(MessageForPic paramMessageForPic)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq);
    if (paramMessageForPic.isSendFromLocal()) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq));
    }
    PicUploadInfo.Builder localBuilder = new PicUploadInfo.Builder();
    localBuilder.a(path);
    localBuilder.d(5);
    localBuilder.d(frienduin);
    if (fileSizeFlag == 1) {
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
      jdField_a_of_type_Long = msgseq;
      jdField_b_of_type_Long = shmsgseq;
      jdField_a_of_type_Long = msgseq;
      localBuilder.a(localRetryInfo);
      paramMessageForPic = PicBusiManager.a(4, 5);
      paramMessageForPic.a(localBuilder.a());
      PicBusiManager.a(paramMessageForPic, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      return;
      localBuilder.c(TranDbRecord.PicDbRecord.e);
    }
  }
  
  private void c(MessageForPic paramMessageForPic)
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(selfuin, uniseq);
    if ((localObject1 != null) && ((localObject1 instanceof BaseUploadProcessor)))
    {
      ((BaseUploadProcessor)localObject1).a();
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq);
    if (paramMessageForPic.isSendFromLocal()) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq));
    }
    localObject1 = new PicFowardInfo();
    Object localObject2 = new PicUploadInfo.Builder();
    ((PicUploadInfo.Builder)localObject2).d(1009);
    ((PicUploadInfo.Builder)localObject2).a(path);
    ((PicUploadInfo.Builder)localObject2).e(istroop);
    ((PicUploadInfo.Builder)localObject2).c(selfuin);
    ((PicUploadInfo.Builder)localObject2).e(senderuin);
    ((PicUploadInfo.Builder)localObject2).d(frienduin);
    j = extLong;
    i = extStr;
    ((PicUploadInfo.Builder)localObject2).c(TranDbRecord.PicDbRecord.g);
    jdField_a_of_type_ComTencentMobileqqPicPicUploadInfo = ((PicUploadInfo.Builder)localObject2).a();
    if ((!FileUtils.b(path)) && ((picExtraObject instanceof PicFowardDbRecordData)))
    {
      localObject2 = (PicFowardDbRecordData)picExtraObject;
      PicDownloadInfo.Builder localBuilder = new PicDownloadInfo.Builder();
      localBuilder.a(1009);
      localBuilder.a(selfuin);
      localBuilder.b(jdField_a_of_type_JavaLangString);
      localBuilder.b(jdField_a_of_type_Int);
      localBuilder.d(b);
      localBuilder.a(jdField_a_of_type_Long);
      localBuilder.e(md5);
      localBuilder.f(issend);
      jdField_a_of_type_ComTencentMobileqqPicPicDownloadInfo = localBuilder.a();
    }
    paramMessageForPic = PicBusiManager.a(3, 1009);
    paramMessageForPic.a((PicFowardInfo)localObject1);
    PicBusiManager.a(paramMessageForPic, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = (MessageForPic)paramChatMessage;
    boolean bool = PeakUtils.a(imageType);
    paramViewHolder = (PicItemBuilder.Holder)paramViewHolder;
    paramChatMessage = paramView;
    if (paramView == null)
    {
      paramChatMessage = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      paramView = new ChatThumbView(jdField_a_of_type_AndroidContentContext);
      paramView.setId(2131299562);
      paramView.setAdjustViewBounds(true);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      paramChatMessage.addView(paramView, localLayoutParams);
      paramChatMessage.setOnClickListener(this);
      paramChatMessage.setOnTouchListener(paramOnLongClickAndTouchListener);
      paramChatMessage.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView = paramView;
    }
    paramView = jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView;
    int j = URLDrawableHelper.a(bool);
    int k = URLDrawableHelper.b(bool);
    paramView.setMaxWidth(j);
    paramView.setMaxHeight(j);
    paramView.setMinimumWidth(k);
    paramView.setMinimumHeight(k);
    paramView = FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (paramView != null) {
      paramView.a(paramChatMessage, this);
    }
    if (!paramBaseChatItemLayout.isSendFromLocal())
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
      paramView = URLDrawableHelper.a(paramBaseChatItemLayout, 65537);
      if ((jdField_a_of_type_ComTencentImageURLDrawable == null) || (!jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramView)))
      {
        paramView = a(jdField_a_of_type_AndroidContentContext, paramBaseChatItemLayout, jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView);
        jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView.setImageDrawable(paramView);
        jdField_a_of_type_ComTencentImageURLDrawable = paramView;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramBaseChatItemLayout, 2);
      }
      return paramChatMessage;
    }
    paramView = URLDrawableHelper.a(paramBaseChatItemLayout, 65537);
    if ((jdField_a_of_type_ComTencentImageURLDrawable == null) || (!jdField_a_of_type_ComTencentImageURLDrawable.getURL().equals(paramView)))
    {
      paramView = a(jdField_a_of_type_AndroidContentContext, paramBaseChatItemLayout, jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView.setImageDrawable(paramView);
      jdField_a_of_type_ComTencentImageURLDrawable = paramView;
    }
    paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
    jdField_a_of_type_AndroidViewView = paramChatMessage;
    a(paramView, paramViewHolder);
    return paramChatMessage;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new PicItemBuilder.Holder(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return "发出图片";
    }
    return "发来图片";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    Object localObject;
    String str;
    if ((paramChatMessage != null) && ((paramChatMessage instanceof MessageForPic)))
    {
      localObject = (MessageForPic)paramChatMessage;
      if (paramInt != 2131298639) {
        break label838;
      }
      paramContext = new Bundle();
      paramContext.putInt("forward_type", 1);
      paramContext.putInt("forward_source_uin_type", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      paramChatMessage = new Intent();
      paramChatMessage.putExtra("forward_image_width", width);
      paramChatMessage.putExtra("forward_image_height", height);
      paramChatMessage.putExtra("forward_file_size", size);
      paramChatMessage.putExtra("forward_image_type", imageType);
      paramChatMessage.putExtra("forward_filepath", path);
      str = frienduin + uniseq + istroop;
      paramChatMessage.putExtra("BUSI_TYPE", 1009);
      paramChatMessage.putExtra("forward_download_image_task_key", str);
      paramChatMessage.putExtra("forward_download_image_org_uin", frienduin);
      paramChatMessage.putExtra("forward_download_image_org_uin_type", istroop);
      paramChatMessage.putExtra("forward_download_image_server_path", uuid);
      paramChatMessage.putExtra("forward_download_image_item_id", uniseq);
      paramChatMessage.putExtra("forward_photo_isSend", issend);
      paramChatMessage.putExtra("forward_photo_md5", md5);
      paramChatMessage.putExtra("forward_photo_group_fileid", groupFileID);
      paramChatMessage.putExtra("FORWARD_PHOTO_FILE_SIZE_FLAG", fileSizeFlag);
      paramChatMessage.putExtras(paramContext);
      if ((!ActionMsgUtil.a(msgtype)) && (msgtype != 62535) && (msgtype != 35534) && (msgtype != 35533)) {
        break label730;
      }
      paramInt = 1;
      if (paramInt != 0) {
        break label735;
      }
      paramInt = 65537;
      label347:
      paramContext = URLDrawableHelper.a((PicUiInterface)localObject, paramInt);
      paramChatMessage.putExtra("forward_urldrawable", true);
      paramChatMessage.putExtra("forward_urldrawable_thumb_url", paramContext.toString());
      paramChatMessage.putExtra("FORWARD_URL_KEY", localUUID);
      paramContext = ForwardUtils.a(jdField_a_of_type_AndroidContentContext, (MessageForPic)localObject);
      paramChatMessage.putExtra("forward_urldrawable_big_url", paramContext.getURL().toString());
      paramChatMessage.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
      paramChatMessage.putExtra("PhotoConst.MY_UIN", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
      paramChatMessage.putExtra("PhotoConst.MY_NICK", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b());
      if ((((jdField_a_of_type_AndroidContentContext instanceof SplashActivity)) || ((jdField_a_of_type_AndroidContentContext instanceof ChatActivity))) && (((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment() != null)) {
        paramChatMessage.putExtra("isBack2Root", jdField_a_of_type_AndroidContentContext).getChatFragment().a().jdField_h_of_type_Boolean);
      }
      paramChatMessage.putExtra("is_anonymous", AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
      if (!(jdField_a_of_type_AndroidContentContext instanceof SplashActivity)) {
        break label740;
      }
      paramChatMessage.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
      paramChatMessage = AIOUtils.a(paramChatMessage, null);
      label566:
      paramChatMessage.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      paramChatMessage.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SendPhotoActivity.class.getName());
      paramChatMessage.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      paramChatMessage.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", true);
      paramChatMessage.putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1009);
      paramChatMessage.putExtra("PhotoConst.HANDLE_DEST_RESULT", true);
      paramChatMessage.addFlags(603979776);
      paramChatMessage.putExtra("FORWARD_MSG_FOR_PIC", (Parcelable)localObject);
      if (!new File(path).exists()) {
        break label757;
      }
      paramChatMessage.putExtra("forward_extra", path);
      ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "3", "", "", "");
    }
    label730:
    label735:
    label740:
    label757:
    label838:
    label1424:
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            paramInt = 0;
            break;
            paramInt = 1;
            break label347;
            paramChatMessage.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
            break label566;
            str = null;
            paramContext = paramContext.getURL().toString();
            if (AbsDownloader.a(paramContext)) {
              paramContext = AbsDownloader.a(paramContext).getAbsolutePath();
            }
            for (;;)
            {
              paramChatMessage.putExtra("forward_extra", paramContext);
              break;
              localObject = AbsDownloader.a(URLDrawableHelper.a((PicUiInterface)localObject, 65537).toString());
              paramContext = str;
              if (localObject != null)
              {
                paramContext = str;
                if (((File)localObject).exists()) {
                  paramContext = ((File)localObject).getAbsolutePath();
                }
              }
            }
            if (paramInt == 2131296308)
            {
              paramContext = URLDrawableHelper.a(URLDrawableHelper.a((PicUiInterface)localObject, 1), -1, -1, null, null, false);
              paramContext.setTag(localObject);
              AIOGalleryUtils.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramContext, frienduin, jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908), null);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006448", "0X8006448", 0, 0, "3", "", "", "");
              return;
            }
            if (paramInt == 2131304463)
            {
              ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006447", "0X8006447", 0, 0, "3", "", "", "");
              return;
            }
            if (paramInt == 2131304473)
            {
              super.b(paramChatMessage);
              return;
            }
            if (paramInt == 2131304467)
            {
              a((MessageForPic)localObject);
              return;
            }
            if (paramInt == 2131299653)
            {
              QfavBuilder.a((Entity)localObject).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
              QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 3);
              return;
            }
            if (paramInt == 2131304465)
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
              ((FragmentActivity)paramContext).getChatFragment().a().a(paramChatMessage);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800409A", "0X800409A", 0, 0, "", "", "", "");
              return;
            }
            if (paramInt == 2131304466)
            {
              paramContext = new kzd(this);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, paramContext);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800409B", "0X800409B", 0, 0, "", "", "", "");
              return;
            }
            if (paramInt == 2131304472)
            {
              super.b(paramChatMessage);
              return;
            }
            if (paramInt == 2131296347)
            {
              super.a(paramChatMessage);
              return;
            }
            if (paramInt != 2131304483) {
              break label1476;
            }
          } while (istroop != 1);
          paramContext = ((MessageForPic)localObject).getPicDownloadInfo();
          PicBusiManager.a(6, 1536, 1).a((MessageForPic)localObject, paramContext);
          paramContext = AbsDownloader.d(URLDrawableHelper.a((PicUiInterface)localObject, 1, null).toString().toString());
          if (!FileUtils.a(paramContext)) {
            break label1424;
          }
          paramChatMessage = (TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97);
        } while ((paramChatMessage == null) || (!(jdField_a_of_type_AndroidContentContext instanceof FragmentActivity)));
        paramChatMessage.a(((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (ChatMessage)localObject, paramContext);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_talk", "", "Grp_plus", "Clk_app", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
      } while (!QLog.isColorLevel());
      QLog.d("PicItemBuilder", 2, "image has downloaded!");
      return;
      paramContext = AIOGalleryUtils.a((MessageForPic)localObject);
    } while (paramContext == null);
    paramChatMessage = new WeakReference(new kze(this, paramContext, (MessageForPic)localObject));
    TroopTopicMgr.a((MessageForPic)localObject, e, i, 2, paramChatMessage, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    return;
    label1476:
    super.a(paramInt, paramContext, paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    if (aisMultiMsg) {}
    do
    {
      return;
      paramView = (MessageForPic)ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
    } while (!paramView.isSendFromLocal());
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
    localActionSheet.a(2131367611, 5);
    localActionSheet.d(2131366996);
    localActionSheet.a(new kzf(this, paramView, localActionSheet));
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
            paramView = (PicItemBuilder.Holder)AIOUtils.a(paramView);
            if ((paramView != null) && (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null)) {
              break label151;
            }
            if (!QLog.isColorLevel()) {
              break;
            }
            if (paramView != null) {
              break label141;
            }
            QLog.e("PicItemBuilder", 2, "handleMessage(): holder is null");
            return;
          } while ((paramInt1 != 1007) && (paramInt1 != 1003));
        }
        QLog.e("PicItemBuilder", 2, "handleMessage(): holder.mMessage is null");
        return;
        localMessageForPic = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      } while (uniseq != jdField_c_of_type_Long);
      a(localMessageForPic, "transf.in", "status:" + paramInt1 + ",retCode" + paramInt2 + "message.uniseq：" + uniseq + ",file.uniseq:" + jdField_c_of_type_Long);
      if (localMessageForPic.isSendFromLocal())
      {
        a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq), paramView);
        if (paramInt1 == 1005) {
          a();
        }
      }
    } while (paramInt1 != 2003);
    paramFileMsg = a(jdField_a_of_type_AndroidContentContext, (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView);
    jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView.setImageDrawable(paramFileMsg);
    jdField_a_of_type_ComTencentImageURLDrawable = paramFileMsg;
  }
  
  public void a(MessageForPic paramMessageForPic)
  {
    if (FileUtils.b(path)) {
      b(paramMessageForPic);
    }
    for (;;)
    {
      a();
      return;
      if (picExtraFlag == TranDbRecord.PicDbRecord.g) {
        c(paramMessageForPic);
      }
    }
  }
  
  protected boolean a(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout)
  {
    boolean bool = true;
    if (isMultiMsg) {}
    while (!paramChatMessage.isSendFromLocal()) {
      return false;
    }
    paramChatMessage = (MessageForPic)paramChatMessage;
    if (size <= 0L)
    {
      paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      if ((paramChatMessage instanceof BaseTransProcessor))
      {
        if (((BaseTransProcessor)paramChatMessage).c() == 1005L) {}
        for (bool = true;; bool = false) {
          return bool;
        }
      }
      return true;
    }
    if (extraflag == 32768) {}
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    Object localObject = (PicItemBuilder.Holder)AIOUtils.a(paramView);
    MessageForPic localMessageForPic = (MessageForPic)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    boolean bool = URLDrawableHelper.a(jdField_a_of_type_AndroidContentContext, localMessageForPic, 65537);
    paramView = new QQCustomMenu();
    jdField_h_of_type_Boolean = true;
    if (!localMessageForPic.isSendFromLocal())
    {
      if (jdField_a_of_type_ComTencentImageURLDrawable.getStatus() == 1)
      {
        paramView.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
        if (bool)
        {
          paramView.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
          if (istroop == 1) {
            paramView.a(2131304483, jdField_a_of_type_AndroidContentContext.getString(2131365094));
          }
        }
        a(localMessageForPic, paramView);
        paramView.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
        if (localMessageForPic.isSend()) {
          a(paramView, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, localMessageForPic);
        }
        ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        super.b(paramView, jdField_a_of_type_AndroidContentContext);
      }
      return paramView.a();
    }
    if (size > 0L)
    {
      paramView.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
      if (bool)
      {
        paramView.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
        if (istroop == 1) {
          paramView.a(2131304483, jdField_a_of_type_AndroidContentContext.getString(2131365094));
        }
      }
      paramView.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
      if ((localMessageForPic.isSend()) && (i)) {
        a(paramView, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, localMessageForPic);
      }
      ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      super.b(paramView, jdField_a_of_type_AndroidContentContext);
    }
    for (;;)
    {
      return paramView.a();
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, uniseq);
      if ((localObject instanceof BaseTransProcessor))
      {
        localObject = (BaseTransProcessor)localObject;
        if ((((BaseTransProcessor)localObject).c() == 1005L) || (((BaseTransProcessor)localObject).c() == 1003L) || (((BaseTransProcessor)localObject).d() == 1003L))
        {
          paramView.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
          if (bool) {
            paramView.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
          }
          paramView.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
          ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          super.b(paramView, jdField_a_of_type_AndroidContentContext);
        }
        else
        {
          paramView.a(2131304465, jdField_a_of_type_AndroidContentContext.getString(2131367615));
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
            paramView.a(2131304466, jdField_a_of_type_AndroidContentContext.getString(2131367616));
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        }
      }
      else
      {
        paramView.a(2131296308, jdField_a_of_type_AndroidContentContext.getString(2131369770));
        if (bool) {
          paramView.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
        }
        paramView.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
        ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        super.b(paramView, jdField_a_of_type_AndroidContentContext);
      }
    }
  }
  
  public void c()
  {
    super.c();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    jdField_h_of_type_Boolean = false;
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
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
        paramView = (PicItemBuilder.Holder)AIOUtils.a(paramView);
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
    a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
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
    a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemChatThumbView, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    return;
    label354:
    super.onClick(paramView);
  }
}
