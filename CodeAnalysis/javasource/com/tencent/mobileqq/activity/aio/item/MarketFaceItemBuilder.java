package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.common.config.AppSetting;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.H5MagicPlayerActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AudioPlayer;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager.Callback;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.data.EmoticonPackage;
import com.tencent.mobileqq.data.MarkFaceMessage;
import com.tencent.mobileqq.data.MessageForMarketFace;
import com.tencent.mobileqq.emosm.EmosmUtils;
import com.tencent.mobileqq.emoticon.EmojiListenerManager;
import com.tencent.mobileqq.emoticon.EmojiManager;
import com.tencent.mobileqq.emoticon.MagicFaceDownloadListener;
import com.tencent.mobileqq.emoticonview.EmoticonUtils;
import com.tencent.mobileqq.emoticonview.PicEmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.magicface.drawable.PngFrameDrawable;
import com.tencent.mobileqq.magicface.drawable.PngFrameManager;
import com.tencent.mobileqq.magicface.drawable.PngFrameUtil;
import com.tencent.mobileqq.magicface.view.MagicfaceViewController;
import com.tencent.mobileqq.model.EmoticonManager;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopGagMgr.SelfGagInfo;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.vaswebviewplugin.EmojiHomeUiPlugin;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.XListView;
import java.io.Serializable;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import kye;
import kyf;
import kyg;
import kyl;
import kym;
import kyn;
import kyo;
import kyp;
import mqq.os.MqqHandler;
import org.apache.http.Header;

public class MarketFaceItemBuilder
  extends BaseBubbleBuilder
  implements MediaPlayerManager.Callback
{
  public static long a = 0L;
  public static ChatMessage a;
  public static PicEmoticonInfo a;
  private static final long b = 3000L;
  public static final int h = 1;
  public static final int i = 2;
  public static final int j = 3;
  public static final int k = 1;
  public static final int l = 2;
  public static final int m = 3;
  public static final int n = 1;
  public static final int o = 2;
  public static int p;
  public EmojiManager a;
  MagicFaceDownloadListener jdField_a_of_type_ComTencentMobileqqEmoticonMagicFaceDownloadListener = new kyg(this);
  public PngFrameUtil a;
  public List a;
  kyo jdField_a_of_type_Kyo = new kye(this);
  public Context b;
  public String b;
  private long c;
  public boolean d = false;
  public int q = 320;
  public int r = getContextgetResourcesgetDisplayMetricsdensityDpi;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    p = 1;
    jdField_a_of_type_Long = 0L;
  }
  
  public MarketFaceItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_b_of_type_JavaLangString = "MarketFaceItemBuilder";
    jdField_b_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager = ((EmojiManager)paramQQAppInterface.getManager(42));
    jdField_a_of_type_ComTencentMobileqqMagicfaceDrawablePngFrameUtil = new PngFrameUtil();
    if ((jdField_b_of_type_AndroidContentContext instanceof SplashActivity)) {
      d = true;
    }
  }
  
  private URLDrawable a(ChatMessage paramChatMessage, MarketFaceItemBuilder.Holder paramHolder, Context paramContext)
  {
    if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.b()) {
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a()) {
        if (c(paramChatMessage))
        {
          paramHolder = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.b();
          paramChatMessage = paramHolder;
          if (QLog.isColorLevel())
          {
            QLog.d(jdField_b_of_type_JavaLangString, 2, "generateEmotionDrawable| local existBig getSoundBigDrawable");
            paramChatMessage = paramHolder;
          }
        }
      }
    }
    do
    {
      do
      {
        do
        {
          return paramChatMessage;
          paramHolder = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a(true);
          paramChatMessage = paramHolder;
        } while (!QLog.isColorLevel());
        QLog.d(jdField_b_of_type_JavaLangString, 2, "generateEmotionDrawable| local existBig sound getLoadingDrawable");
        return paramHolder;
        paramHolder = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a(paramContext, BaseChatItemLayout.d);
        paramChatMessage = paramHolder;
      } while (!QLog.isColorLevel());
      QLog.d(jdField_b_of_type_JavaLangString, 2, "generateEmotionDrawable| local existBig getBigDrawable");
      return paramHolder;
      int i1 = NetworkUtil.a(jdField_b_of_type_AndroidContentContext);
      if ((i1 != 1) && (i1 != 3) && (i1 != 4))
      {
        if (jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a, 4)) {
          return jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a(true);
        }
        if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.c()) {
          return jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a();
        }
      }
      paramHolder = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a(false);
      paramChatMessage = paramHolder;
    } while (!QLog.isColorLevel());
    QLog.d(jdField_b_of_type_JavaLangString, 2, "generateEmotionDrawable| getLoadingDrawable local not exist");
    return paramHolder;
  }
  
  private void a(MarketFaceItemBuilder.Holder paramHolder)
  {
    EmoticonPackage localEmoticonPackage;
    if (!jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, Boolean.valueOf(false)))
    {
      EmojiListenerManager.a().a(jdField_a_of_type_ComTencentMobileqqEmoticonMagicFaceDownloadListener);
      localEmoticonPackage = new EmoticonPackage();
      name = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.name;
      epId = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
      jobType = 3;
      type = 1;
      isMagicFaceDownloading = true;
      if (jdField_d_of_type_Int != -1) {
        break label224;
      }
    }
    label224:
    for (rscType = PngFrameUtil.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.magicValue);; rscType = jdField_d_of_type_Int)
    {
      ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a);
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay = true;
      jdField_a_of_type_JavaUtilList.add(paramHolder);
      f.setVisibility(8);
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(localEmoticonPackage, false);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbJieshou", "MbZhudongXiazai", 0, 0, "", "", "", "");
      return;
    }
  }
  
  private void a(ChatMessage paramChatMessage, MarketFaceItemBuilder.Holder paramHolder)
  {
    URLDrawable localURLDrawable = a(paramChatMessage, paramHolder, jdField_b_of_type_AndroidContentContext);
    int i2;
    int i1;
    if ((localURLDrawable != null) && (localURLDrawable.getStatus() == 1) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.m != 3))
    {
      i2 = localURLDrawable.getIntrinsicWidth();
      i1 = localURLDrawable.getIntrinsicHeight();
      i2 = (i2 * r + (q >> 1)) / q;
      i1 = (i1 * r + (q >> 1)) / q;
      e.setLayoutParams(new FrameLayout.LayoutParams(i2, i1));
      e.setImageDrawable(localURLDrawable);
      if (localURLDrawable != null) {}
      switch (localURLDrawable.getStatus())
      {
      default: 
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
        label160:
        jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
        if ((isMarketFaceFlow) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType == 0))
        {
          if (!paramChatMessage.isSend()) {
            break label591;
          }
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130841118);
          jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
        }
        break;
      }
    }
    for (;;)
    {
      if (localURLDrawable != null) {
        a(paramHolder, localURLDrawable);
      }
      c(paramHolder);
      return;
      if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a == null) || (localURLDrawable.getStatus() == 1)) {
        break;
      }
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.width == 0)
      {
        i1 = 200;
        label278:
        if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.height != 0) {
          break label389;
        }
      }
      label389:
      for (i2 = 200;; i2 = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.height)
      {
        int i3 = i1;
        if (i1 != i2) {
          i3 = i2;
        }
        i1 = (i3 * r + (q >> 1)) / q;
        i2 = (i2 * r + (q >> 1)) / q;
        e.setLayoutParams(new FrameLayout.LayoutParams(i1, i2));
        break;
        i1 = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.width;
        break label278;
      }
      if (!MagicfaceViewController.a()) {
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
      }
      i1 = NetworkUtil.a(jdField_b_of_type_AndroidContentContext);
      boolean bool = SettingCloneUtil.readValue(jdField_b_of_type_AndroidContentContext, null, jdField_b_of_type_AndroidContentContext.getString(2131367548), "qqsetting_auto_receive_magic_face_key", true);
      if (((i1 == 1) || (i1 == 3) || (i1 == 4)) && (2 == jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType) && (!jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.f(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId)) && (((i1 != 3) && (i1 != 4)) || (bool))) {
        break label160;
      }
      float f = jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
      if ((f >= 0.0F) && (1.0F != f)) {
        break label160;
      }
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
      break label160;
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
      if (!AppSetting.i) {
        break label160;
      }
      jdField_a_of_type_AndroidWidgetFrameLayout.setContentDescription("表情下载失败");
      break label160;
      label591:
      jdField_d_of_type_AndroidWidgetImageView.setImageResource(2130841118);
      jdField_d_of_type_AndroidWidgetImageView.setVisibility(0);
    }
  }
  
  private void b(MarketFaceItemBuilder.Holder paramHolder)
  {
    if ((4 != jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType) || (jdField_a_of_type_ComTencentMobileqqDataChatMessage).mMarkFaceMessage == null)) {}
    do
    {
      return;
      int i1 = NetworkUtil.a(jdField_b_of_type_AndroidContentContext);
      if (jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, true, true)) {
        break;
      }
      if ((i1 != 1) && (i1 != 3) && (i1 != 4))
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_b_of_type_JavaLangString, 2, "magicFaceIcon gone: H5MagicSource isnot Intact , and network isnot 2 3 4G or wifi;epId = " + jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
        }
        f.setVisibility(8);
        return;
      }
    } while (-1.0F != jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId));
    EmojiListenerManager.a().a(jdField_a_of_type_ComTencentMobileqqEmoticonMagicFaceDownloadListener);
    Object localObject1 = new EmoticonPackage();
    name = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.name;
    epId = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
    jobType = 5;
    type = 1;
    isMagicFaceDownloading = true;
    ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a);
    jdField_a_of_type_JavaUtilList.add(paramHolder);
    jdField_a_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay;
    f.setVisibility(8);
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay = false;
    jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a((EmoticonPackage)localObject1, false);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_b_of_type_JavaLangString, 2, "magicFaceIcon gone,start download epId = " + jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbJieshou", "MbZhudongXiazai", 0, 0, epId, "", "", "");
    return;
    if ((d) && (jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.b()))
    {
      f.setVisibility(0);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_b_of_type_JavaLangString, 2, "magicFaceIcon visible,h5source intacat epId = " + jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
      }
    }
    for (;;)
    {
      f.setImageResource(2130837549);
      if ((((MessageForMarketFace)jdField_a_of_type_ComTencentMobileqqDataChatMessage).isSend()) || (!jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay) || (!jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a()) || (System.currentTimeMillis() - c <= 3000L) || (((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment() == null) || (((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment().a() == null) || (((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment().a().h())) {
        break;
      }
      c = System.currentTimeMillis();
      jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay = false;
      localObject1 = new Intent(jdField_b_of_type_AndroidContentContext, H5MagicPlayerActivity.class);
      ((Intent)localObject1).putExtra("clickTime", System.currentTimeMillis());
      ((Intent)localObject1).putExtra("autoPlay", "1");
      ((Intent)localObject1).putExtra("senderUin", jdField_a_of_type_ComTencentMobileqqDataChatMessage.senderuin);
      ((Intent)localObject1).putExtra("selfUin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      ((Intent)localObject1).putExtra("sessionInfo", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      ((Intent)localObject1).putExtra("emoticon", jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a);
      Object localObject2 = (EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13);
      EmoticonPackage localEmoticonPackage = ((EmoticonManager)localObject2).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
      if (localEmoticonPackage != null)
      {
        localObject2 = ((EmoticonManager)localObject2).a(childEpId);
        if ((localObject2 != null) && (((List)localObject2).size() > 0)) {
          ((Intent)localObject1).putExtra("childEmoticon", (Serializable)((List)localObject2).get(0));
        }
      }
      jdField_b_of_type_AndroidContentContext.startActivity((Intent)localObject1);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbJieshou", "MbZidongBofang", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, "", "", "");
      return;
      f.setVisibility(8);
    }
  }
  
  private void c(MarketFaceItemBuilder.Holder paramHolder)
  {
    jdField_a_of_type_Boolean = false;
    if ((2 != jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType) || (jdField_a_of_type_ComTencentMobileqqDataChatMessage).mMarkFaceMessage == null) || (!MagicfaceViewController.a())) {}
    for (;;)
    {
      return;
      int i1 = NetworkUtil.a(jdField_b_of_type_AndroidContentContext);
      Object localObject;
      if (!jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.f(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId))
      {
        if ((i1 != 1) && (i1 != 3) && (i1 != 4))
        {
          f.setVisibility(8);
          return;
        }
        boolean bool = SettingCloneUtil.readValue(jdField_b_of_type_AndroidContentContext, null, jdField_b_of_type_AndroidContentContext.getString(2131367548), "qqsetting_auto_receive_magic_face_key", true);
        if (((i1 != 3) && (i1 != 4)) || ((bool) && (!jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, Boolean.valueOf(false))) && (-1.0F == jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId))))
        {
          EmojiListenerManager.a().a(jdField_a_of_type_ComTencentMobileqqEmoticonMagicFaceDownloadListener);
          localObject = new EmoticonPackage();
          name = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.name;
          epId = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
          jobType = 3;
          rscType = PngFrameUtil.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.magicValue);
          type = 1;
          isMagicFaceDownloading = true;
          ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a);
          jdField_a_of_type_JavaUtilList.add(paramHolder);
          jdField_a_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay;
          f.setVisibility(8);
          jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay = false;
          jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a((EmoticonPackage)localObject, false);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbJieshou", "MbZidongXiazai", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, "", "", "");
        }
      }
      else
      {
        if (PngFrameUtil.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.magicValue) == 1) {
          f.setVisibility(8);
        }
        while (jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay)
        {
          jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay = false;
          localObject = new Emoticon();
          eId = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.eId;
          epId = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
          magicValue = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.magicValue;
          jobType = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType;
          if ((((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment() != null) && (((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment().a() != null) && (MagicfaceViewController.a())) {
            ((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment().a().a((Emoticon)localObject, 1, jdField_a_of_type_ComTencentMobileqqDataChatMessage).senderuin, false);
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbJieshou", "MbZidongBofang", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, "", "", "");
          return;
          f.setImageResource(2130837549);
          f.setVisibility(0);
        }
      }
    }
  }
  
  private boolean c(ChatMessage paramChatMessage)
  {
    if (paramChatMessage == null) {}
    ChatMessage localChatMessage;
    do
    {
      return false;
      localChatMessage = MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a();
    } while ((localChatMessage != paramChatMessage) && ((!(localChatMessage instanceof MessageForMarketFace)) || (frienduin == null) || (!frienduin.equals(frienduin)) || (uniseq != uniseq)));
    return true;
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    long l1 = System.currentTimeMillis();
    paramBaseChatItemLayout = (MessageForMarketFace)paramChatMessage;
    MarketFaceItemBuilder.Holder localHolder = (MarketFaceItemBuilder.Holder)paramViewHolder;
    long l2;
    if (paramView == null)
    {
      paramViewHolder = new RelativeLayout(jdField_b_of_type_AndroidContentContext);
      paramView = new ImageView(jdField_b_of_type_AndroidContentContext);
      paramView.setId(2131296366);
      Object localObject1 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject1).addRule(0, 2131296325);
      ((RelativeLayout.LayoutParams)localObject1).addRule(15, 2131296325);
      paramViewHolder.addView(paramView, (ViewGroup.LayoutParams)localObject1);
      paramView.setOnClickListener(this);
      localObject1 = new FrameLayout(jdField_b_of_type_AndroidContentContext);
      ((FrameLayout)localObject1).setId(2131296370);
      Object localObject2 = new RelativeLayout.LayoutParams(-2, -2);
      leftMargin = 8;
      ((RelativeLayout.LayoutParams)localObject2).addRule(1, 2131296366);
      paramViewHolder.addView((View)localObject1, (ViewGroup.LayoutParams)localObject2);
      ((FrameLayout)localObject1).setOnClickListener(this);
      ((FrameLayout)localObject1).setOnTouchListener(paramOnLongClickAndTouchListener);
      ((FrameLayout)localObject1).setOnLongClickListener(paramOnLongClickAndTouchListener);
      paramOnLongClickAndTouchListener = new kyp(this, jdField_b_of_type_AndroidContentContext);
      ((FrameLayout)localObject1).addView(paramOnLongClickAndTouchListener, -2, -2);
      localObject2 = new ImageView(jdField_b_of_type_AndroidContentContext);
      Object localObject3 = new FrameLayout.LayoutParams(-2, -2);
      gravity = 85;
      ((FrameLayout)localObject1).addView((View)localObject2, (ViewGroup.LayoutParams)localObject3);
      localObject3 = new ImageView(jdField_b_of_type_AndroidContentContext);
      ((ImageView)localObject3).setId(2131296365);
      Object localObject4 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject4).addRule(1, 2131296370);
      ((RelativeLayout.LayoutParams)localObject4).addRule(8, 2131296370);
      leftMargin = 10;
      paramViewHolder.addView((View)localObject3, (ViewGroup.LayoutParams)localObject4);
      ((ImageView)localObject3).setOnClickListener(this);
      localObject4 = new ImageView(jdField_b_of_type_AndroidContentContext);
      ((ImageView)localObject4).setId(2131296367);
      Object localObject5 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject5).addRule(1, 2131296370);
      ((RelativeLayout.LayoutParams)localObject5).addRule(15, 2131296370);
      leftMargin = 10;
      paramViewHolder.addView((View)localObject4, (ViewGroup.LayoutParams)localObject5);
      ((ImageView)localObject4).setOnClickListener(this);
      localObject5 = new ImageView(jdField_b_of_type_AndroidContentContext);
      ((ImageView)localObject5).setId(2131296368);
      Object localObject6 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject6).addRule(1, 2131296370);
      ((RelativeLayout.LayoutParams)localObject6).addRule(8, 2131296370);
      leftMargin = (-AIOUtils.a(9.0F, jdField_b_of_type_AndroidContentContext.getResources()));
      bottomMargin = (-AIOUtils.a(12.0F, jdField_b_of_type_AndroidContentContext.getResources()));
      paramViewHolder.addView((View)localObject5, (ViewGroup.LayoutParams)localObject6);
      ((ImageView)localObject5).setOnClickListener(this);
      localObject6 = new ProgressBar(jdField_b_of_type_AndroidContentContext, null, 0);
      ((ProgressBar)localObject6).setId(2131296323);
      ((ProgressBar)localObject6).setIndeterminateDrawable(jdField_b_of_type_AndroidContentContext.getResources().getDrawable(2130838189));
      int i1 = AIOUtils.a(16.0F, jdField_b_of_type_AndroidContentContext.getResources());
      FrameLayout.LayoutParams localLayoutParams = new FrameLayout.LayoutParams(i1, i1);
      gravity = 17;
      ((FrameLayout)localObject1).addView((View)localObject6, localLayoutParams);
      e = paramOnLongClickAndTouchListener;
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localObject2);
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)localObject3);
      jdField_c_of_type_AndroidWidgetImageView = paramView;
      jdField_d_of_type_AndroidWidgetImageView = ((ImageView)localObject4);
      f = ((ImageView)localObject5);
      jdField_a_of_type_AndroidWidgetFrameLayout = ((FrameLayout)localObject1);
      jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)localObject6);
      if ((AppSetting.i) && (a(paramChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout)) && (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView != null)) {
        jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout.jdField_b_of_type_AndroidWidgetImageView.setContentDescription("表情发送失败");
      }
      jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo = EmoticonUtils.a(mMarkFaceMessage, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      l2 = jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq;
      jdField_a_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq;
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) {
        break label914;
      }
      e.setImageResource(2130837544);
    }
    for (;;)
    {
      l2 = System.currentTimeMillis();
      if ((QLog.isColorLevel()) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a != null)) {
        QLog.d("MarketFaceItemBuilder", 1, "epid = " + jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId + ":view time = " + (l2 - l1));
      }
      return paramViewHolder;
      e.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
      if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a()) && (jdField_b_of_type_AndroidWidgetImageView != null) && ((jdField_b_of_type_AndroidWidgetImageView.getDrawable() instanceof AnimationDrawable))) {
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130841141);
      }
      paramViewHolder = paramView;
      if (!AppSetting.i) {
        break;
      }
      jdField_a_of_type_AndroidWidgetFrameLayout.setContentDescription("");
      paramViewHolder = paramView;
      break;
      label914:
      if ((2 != jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType) && (4 != jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType))
      {
        a(paramChatMessage, localHolder);
      }
      else
      {
        if (2 == jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType)
        {
          paramView = (PngFrameManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(82);
          boolean bool = false;
          if (jdField_b_of_type_Int == jdField_c_of_type_Int - 1) {
            bool = paramView.a(jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq);
          }
          paramView.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.magicValue, localHolder, l2, bool, true, new kyf(this, paramChatMessage, localHolder));
          jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
          jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
          if ((isMarketFaceFlow) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType == 0))
          {
            if (!paramChatMessage.isSend()) {
              break label1143;
            }
            jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
          }
          for (;;)
          {
            jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
            jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
            f.setVisibility(8);
            c(localHolder);
            break;
            label1143:
            jdField_d_of_type_AndroidWidgetImageView.setImageResource(2130841118);
            jdField_d_of_type_AndroidWidgetImageView.setVisibility(0);
          }
        }
        if (4 == jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType)
        {
          if (!paramChatMessage.isSend()) {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbJieshou", "mbjieshou", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, "", "", "");
          }
          a(paramChatMessage, localHolder);
          b(localHolder);
        }
      }
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new MarketFaceItemBuilder.Holder();
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Object localObject;
    int i1;
    if ((paramChatMessage != null) && ((paramChatMessage instanceof MessageForMarketFace)))
    {
      if (!MsgUtils.a(issend)) {
        break label137;
      }
      localStringBuilder.append("发出表情");
      localObject = (MessageForMarketFace)paramChatMessage;
      if (mMarkFaceMessage != null)
      {
        paramChatMessage = EmosmUtils.a(mMarkFaceMessage.sbufID, mMarkFaceMessage.mediaType);
        i1 = mMarkFaceMessage.dwTabID;
        localObject = (EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13);
        if (localObject == null) {
          break label148;
        }
      }
    }
    label137:
    label148:
    for (paramChatMessage = ((EmoticonManager)localObject).a(String.valueOf(i1), paramChatMessage);; paramChatMessage = null)
    {
      if ((paramChatMessage != null) && (name != null)) {
        localStringBuilder.append(name);
      }
      return localStringBuilder.toString();
      localStringBuilder.append("发来表情");
      break;
    }
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    if (paramInt == 2131304463)
    {
      ChatActivityFacade.b(jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006447", "0X8006447", 0, 0, "4", "", "", "");
      return;
    }
    if (paramInt == 2131304473)
    {
      super.b(paramChatMessage);
      return;
    }
    int i1;
    if (paramInt == 2131296308)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006448", "0X8006448", 0, 0, "4", "", "", "");
      paramContext = new QQProgressDialog(jdField_b_of_type_AndroidContentContext);
      EmoticonUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataChatMessagefrienduin, "ep_mall", "Clk_collect", 0);
      paramContext.a(jdField_b_of_type_AndroidContentContext.getString(2131369945));
      paramContext.show();
      paramChatMessage = ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfoa.epId);
      if ((paramChatMessage != null) && (name != null) && ((mobileFeetype != 0) || (downloadCount != 0)))
      {
        paramInt = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().getInt("emosm_json_last_download_timestamp", 0);
        i1 = (int)(System.currentTimeMillis() / 1000L);
        if ((i1 - paramInt > 86400) || (i1 < paramInt))
        {
          jdField_a_of_type_Kyo.a(6, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, paramContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfoa.epId, EmojiManager.e, jdField_a_of_type_Kyo);
          return;
        }
        EmoticonUtils.a(6, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, null, paramContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
        return;
      }
      jdField_a_of_type_Kyo.a(6, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, paramContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfoa.epId, EmojiManager.e, jdField_a_of_type_Kyo);
      return;
    }
    if ((paramInt == 2131296309) || (paramInt == 2131296310))
    {
      i1 = 0;
      paramContext = new QQProgressDialog(jdField_b_of_type_AndroidContentContext);
      if (paramInt == 2131296309)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006448", "0X8006448", 0, 0, "4", "", "", "");
        if ((2 == jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfoa.jobType) && (!jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.c()))
        {
          ChatActivityUtils.a(jdField_b_of_type_AndroidContentContext, 2131370127, 0);
          return;
        }
        p = 1;
        EmoticonUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataChatMessagefrienduin, "ep_mall", "Clk_button_forward_aio", 0);
        i1 = 7;
        paramContext.a(jdField_b_of_type_AndroidContentContext.getString(2131369946));
      }
      for (;;)
      {
        paramContext.show();
        if (((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfoa.epId) != null) {
          break;
        }
        jdField_a_of_type_Kyo.a(i1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, paramContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
        jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfoa.epId, EmojiManager.e, jdField_a_of_type_Kyo);
        return;
        if (paramInt == 2131296310)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006449", "0X8006449", 0, 0, "4", "", "", "");
          if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(47)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true).jdField_a_of_type_Boolean))
          {
            ChatActivityUtils.a(jdField_b_of_type_AndroidContentContext, 2131364574, 0);
            return;
          }
          paramContext.a(jdField_b_of_type_AndroidContentContext.getString(2131369947));
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "ep_mall", "Clk_button_follow_aio", 0, 0, "", jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfoa.epId, "", "");
          i1 = 107;
        }
      }
      EmoticonUtils.a(i1, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, null, paramContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      return;
    }
    if (paramInt == 2131296347)
    {
      super.a(paramChatMessage);
      return;
    }
    super.a(paramInt, paramContext, paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    paramView = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
    String str1;
    String str2;
    if (jdField_a_of_type_ComTencentMobileqqDataChatMessage.isSendFromLocal())
    {
      str1 = jdField_b_of_type_AndroidContentContext.getString(2131367611);
      str2 = jdField_b_of_type_AndroidContentContext.getString(2131367612);
      if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage.sendFailCode == 41) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a != null)) {
        a((MessageForMarketFace)jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo);
      }
    }
    do
    {
      return;
      DialogUtil.a(jdField_b_of_type_AndroidContentContext, 230, str1, str2, new kyl(this, paramView), new kym(this)).show();
      return;
      paramView = e.getDrawable();
    } while (!(paramView instanceof URLDrawable));
    ((URLDrawable)paramView).restartDownload();
  }
  
  public void a(MarketFaceItemBuilder.Holder paramHolder, URLDrawable paramURLDrawable)
  {
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    f.setVisibility(8);
    String str = paramURLDrawable.getURL().getHost();
    int i1 = paramURLDrawable.getStatus();
    if ("aio_preview".equals(str)) {
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a())
      {
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130841141);
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      }
    }
    do
    {
      do
      {
        do
        {
          return;
        } while ((i1 != 1) || (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.m != 3));
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130837546);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
        return;
        if (!"big_img".equals(str)) {
          break;
        }
        paramURLDrawable = paramURLDrawable.getHeader("image_dl_extra_info");
      } while ((paramURLDrawable == null) || (!Boolean.TRUE.toString().equals(paramURLDrawable.getValue())) || (i1 == 1));
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a())
      {
        jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130841141);
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
        return;
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130837546);
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      return;
    } while (!"big_sound".equals(str));
    if (c(jdField_a_of_type_ComTencentMobileqqDataChatMessage))
    {
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      paramURLDrawable = (AnimationDrawable)jdField_b_of_type_AndroidContentContext.getResources().getDrawable(2130968742);
      jdField_b_of_type_AndroidWidgetImageView.setImageDrawable(paramURLDrawable);
      paramURLDrawable.start();
      return;
    }
    jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130841141);
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
  }
  
  protected void a(MessageForMarketFace paramMessageForMarketFace, PicEmoticonInfo paramPicEmoticonInfo)
  {
    if ((paramMessageForMarketFace == null) || (paramPicEmoticonInfo == null) || (a == null) || (a.epId == null)) {
      return;
    }
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_b_of_type_AndroidContentContext, null);
    localActionSheet.a(jdField_b_of_type_AndroidContentContext.getString(2131369942));
    localActionSheet.a(jdField_b_of_type_AndroidContentContext.getResources().getString(2131369943), 1);
    localActionSheet.a(jdField_b_of_type_AndroidContentContext.getResources().getString(2131369944), 1);
    localActionSheet.d(2131366996);
    localActionSheet.a(new kyn(this, paramPicEmoticonInfo, localActionSheet, paramMessageForMarketFace));
    localActionSheet.show();
  }
  
  public void a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage)
  {
    if (paramView != null)
    {
      paramXListView = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
      jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130841141);
      paramView = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a(true);
      e.setImageDrawable(paramView);
    }
  }
  
  public boolean a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage)
  {
    return false;
  }
  
  public boolean a(XListView paramXListView, int paramInt, View paramView, ChatMessage paramChatMessage, AudioPlayer paramAudioPlayer)
  {
    paramXListView = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
    if ((paramXListView == null) || (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo == null) || (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a == null)) {
      return false;
    }
    if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a()) && (paramAudioPlayer.a(EmosmUtils.j(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.eId))))
    {
      paramView = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.b();
      e.setImageDrawable(paramView);
      PicEmoticonInfo.a(paramView);
      paramView = (AnimationDrawable)jdField_b_of_type_AndroidContentContext.getResources().getDrawable(2130968742);
      jdField_b_of_type_AndroidWidgetImageView.setImageDrawable(paramView);
      paramView.start();
      return true;
    }
    return false;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 1)
    {
      jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo;
      jdField_a_of_type_ComTencentMobileqqDataChatMessage = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      localQQCustomMenu.a(2131296308, jdField_b_of_type_AndroidContentContext.getString(2131369770));
      localQQCustomMenu.a(2131296309, jdField_b_of_type_AndroidContentContext.getString(2131368986));
      a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, localQQCustomMenu);
      if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 2) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 4)) {
        localQQCustomMenu.a(2131296310, jdField_b_of_type_AndroidContentContext.getString(2131369769));
      }
      EmoticonUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataChatMessagefrienduin, "ep_mall", "Ap_show_forward", 0);
    }
    if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage.isSend()) && (jdField_a_of_type_ComTencentMobileqqDataChatMessage.extraflag != 32768) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqDataChatMessage))) {
      a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqDataChatMessage);
    }
    ChatActivityFacade.a(localQQCustomMenu, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    super.b(localQQCustomMenu, jdField_b_of_type_AndroidContentContext);
    return localQQCustomMenu.a();
  }
  
  public boolean b(ChatMessage paramChatMessage)
  {
    return true;
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
    if (super.a()) {}
    MarketFaceItemBuilder.Holder localHolder;
    Object localObject1;
    Object localObject2;
    label660:
    do
    {
      do
      {
        return;
        if (paramView.getId() != 2131296370) {
          break;
        }
        localHolder = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
        paramView = e.getDrawable();
        if ((paramView instanceof URLDrawable))
        {
          localObject1 = (URLDrawable)paramView;
          localObject2 = ((URLDrawable)localObject1).getURL().getHost();
          switch (((URLDrawable)paramView).getStatus())
          {
          }
          for (;;)
          {
            if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType == 2) && (MagicfaceViewController.a())) {
              a(localHolder);
            }
            if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo == null) || (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a == null) || ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 0) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 2) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 4)) || ((((URLDrawable)paramView).getStatus() != 1) && (!jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.c()))) {
              break;
            }
            localObject1 = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
            if (((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).b((String)localObject1) == null) {
              break label660;
            }
            paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ChatActivity.class);
            if (paramView == null) {
              break;
            }
            paramView.obtainMessage(22, localObject1).sendToTarget();
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "Clk_aio_pkg_tab", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, (String)localObject1, "", "");
            return;
            ((URLDrawable)localObject1).restartDownload();
            if (QLog.isColorLevel()) {
              QLog.d("PicEmoticonInfo", 2, "msgOnclickListener| urldrawable restartDownload status=" + ((URLDrawable)localObject1).getStatus());
            }
            a(localHolder, (URLDrawable)localObject1);
            jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
            if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a()) && ("big_sound".equals(localObject2)))
            {
              jdField_a_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq;
              continue;
              if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 0) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 2) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 4))
              {
                jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
                if ("big_sound".equals(localObject2))
                {
                  if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.isSound)) {
                    if (c(jdField_a_of_type_ComTencentMobileqqDataChatMessage)) {
                      MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(false);
                    } else if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
                      QQToast.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 2131367775, 0).b(jdField_b_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
                    } else {
                      MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqDataChatMessage);
                    }
                  }
                }
                else if ("aio_preview".equals(localObject2))
                {
                  localObject1 = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a(true);
                  if (localObject1 != null)
                  {
                    e.setImageDrawable((Drawable)localObject1);
                    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
                    a(localHolder, (URLDrawable)localObject1);
                    if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a()) {
                      jdField_a_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataChatMessage.uniseq;
                    }
                  }
                }
              }
            }
          }
          jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo;
          jdField_a_of_type_ComTencentMobileqqDataChatMessage = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
          paramView = "0";
          if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType == 2) {
            paramView = "1";
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "Ep_detail_aio", 0, 0, "", paramView, "", "");
          EmojiHomeUiPlugin.openEmojiDetailPage((Activity)jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 8, (String)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid(), false);
          return;
        }
      } while ((!(paramView instanceof PngFrameDrawable)) || (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo == null) || (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a == null) || ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 0) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 2) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType != 4)) || (!jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.c()));
      localObject1 = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
      if (((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).b((String)localObject1) == null) {
        break;
      }
      paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ChatActivity.class);
    } while (paramView == null);
    paramView.obtainMessage(22, localObject1).sendToTarget();
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "Clk_aio_pkg_tab", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, (String)localObject1, "", "");
    return;
    jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo;
    jdField_a_of_type_ComTencentMobileqqDataChatMessage = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    paramView = "0";
    if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType == 2) {
      paramView = "1";
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "Ep_detail_aio", 0, 0, "", paramView, "", "");
    EmojiHomeUiPlugin.openEmojiDetailPage((Activity)jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 8, (String)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid(), false);
    return;
    if (paramView.getId() == 2131296365)
    {
      localHolder = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
      if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.isSound))
      {
        if (!c(jdField_a_of_type_ComTencentMobileqqDataChatMessage)) {
          break label1108;
        }
        MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(false);
      }
    }
    label1108:
    label1599:
    do
    {
      do
      {
        for (;;)
        {
          super.onClick(paramView);
          return;
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d())
          {
            QQToast.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 2131367775, 0).b(jdField_b_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
          }
          else
          {
            MediaPlayerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqDataChatMessage);
            continue;
            if ((paramView.getId() != 2131296367) && (paramView.getId() != 2131296366)) {
              break;
            }
            localHolder = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
            localObject1 = new QQProgressDialog(jdField_b_of_type_AndroidContentContext);
            ((QQProgressDialog)localObject1).a(jdField_b_of_type_AndroidContentContext.getString(2131369947));
            ((QQProgressDialog)localObject1).show();
            localObject2 = ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "ep_mall", "Clk_button_follow", 0, 0, "", "", jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.eId, "");
            if (localObject2 == null)
            {
              jdField_a_of_type_Kyo.a(107, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, (QQProgressDialog)localObject1, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
              jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, EmojiManager.e, jdField_a_of_type_Kyo);
            }
            else
            {
              EmoticonUtils.a(107, jdField_b_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, null, (QQProgressDialog)localObject1, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
            }
          }
        }
      } while (paramView.getId() != 2131296368);
      localHolder = (MarketFaceItemBuilder.Holder)AIOUtils.a(paramView);
      if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a != null) && (2 == jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType))
      {
        if (jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, Boolean.valueOf(false))) {
          break;
        }
        EmojiListenerManager.a().a(jdField_a_of_type_ComTencentMobileqqEmoticonMagicFaceDownloadListener);
        localObject1 = new EmoticonPackage();
        name = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.name;
        epId = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
        jobType = 3;
        type = 1;
        isMagicFaceDownloading = true;
        jdField_a_of_type_Boolean = false;
        jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay = false;
        ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a);
        jdField_a_of_type_JavaUtilList.add(localHolder);
        f.setVisibility(8);
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a((EmoticonPackage)localObject1, false);
        ReportController.b(null, "CliOper", "", "", "MbJieshou", "MbZhudongBofang", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, "", "", "");
      }
    } while ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo == null) || (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a == null) || (4 != jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType) || (System.currentTimeMillis() - c <= 3000L) || (!jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a()));
    c = System.currentTimeMillis();
    if (jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, true, true))
    {
      localObject1 = new Intent(jdField_b_of_type_AndroidContentContext, H5MagicPlayerActivity.class);
      ((Intent)localObject1).putExtra("clickTime", System.currentTimeMillis());
      ((Intent)localObject1).putExtra("autoPlay", "0");
      ((Intent)localObject1).putExtra("senderUin", jdField_a_of_type_ComTencentMobileqqDataChatMessage.senderuin);
      ((Intent)localObject1).putExtra("selfUin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      ((Intent)localObject1).putExtra("sessionInfo", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      ((Intent)localObject1).putExtra("emoticon", jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a);
      localObject2 = (EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13);
      EmoticonPackage localEmoticonPackage = ((EmoticonManager)localObject2).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId);
      if (localEmoticonPackage != null)
      {
        localObject2 = ((EmoticonManager)localObject2).a(childEpId);
        if ((localObject2 != null) && (((List)localObject2).size() > 0)) {
          ((Intent)localObject1).putExtra("childEmoticon", (Serializable)((List)localObject2).get(0));
        }
      }
      jdField_b_of_type_AndroidContentContext.startActivity((Intent)localObject1);
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "MbFasong", "MbZhudongBofang", 0, 0, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId, "", "", "");
      break;
      if ((((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment() == null) || (((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment().a() == null) || (!MagicfaceViewController.a())) {
        break label1599;
      }
      jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo = EmoticonUtils.a(jdField_a_of_type_ComTencentMobileqqDataChatMessage).mMarkFaceMessage, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if ((((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment() == null) || (((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment().a() == null)) {
        break label1599;
      }
      ((FragmentActivity)jdField_b_of_type_AndroidContentContext).getChatFragment().a().a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a, 1, jdField_a_of_type_ComTencentMobileqqDataChatMessage.senderuin, true);
      break label1599;
      EmojiListenerManager.a().a(jdField_a_of_type_ComTencentMobileqqEmoticonMagicFaceDownloadListener);
      localObject1 = new EmoticonPackage();
      name = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.name;
      epId = jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId;
      jobType = 5;
      type = 1;
      isMagicFaceDownloading = true;
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqDataChatMessage).needToPlay = false;
      ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a);
      jdField_a_of_type_JavaUtilList.add(localHolder);
      f.setVisibility(8);
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqEmoticonEmojiManager.a((EmoticonPackage)localObject1, false);
    }
  }
}
