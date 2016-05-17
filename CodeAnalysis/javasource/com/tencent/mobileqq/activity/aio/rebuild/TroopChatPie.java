package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.text.Editable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.animation.AlphaAnimation;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.biz.TroopMemberLbs.TroopMemberLbsHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousExtInfo;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousInfo;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousStatusListener;
import com.tencent.biz.anonymous.QQAnonymousDialog;
import com.tencent.biz.helper.TroopCardAppInfoHelper;
import com.tencent.biz.helper.TroopCardAppInfoHelper.IGetAppInfoCB;
import com.tencent.biz.troop.feeds.TroopNewGuidePopWindow;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.ChatSettingForTroop;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.TroopMemberListActivity;
import com.tencent.mobileqq.activity.TroopPrivateSettingActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.ChatContext;
import com.tencent.mobileqq.activity.aio.PlusPanel;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.item.TroopGiftMsgItemBuilder;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.activity.aio.tips.TroopAssistTipsBar;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.app.TroopQZoneUploadAlbumObserver;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.app.message.QQMessageFacade.RefreshMessageContext;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.ProxyObserver;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForDeliverGiftTips;
import com.tencent.mobileqq.data.MessageForQQWalletTips;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForSafeGrayTips;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.SystemMsg;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberCard;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.emoticonview.EmoticonMainPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.StructMsgForGeneralShare;
import com.tencent.mobileqq.troop.data.TroopAioAgent;
import com.tencent.mobileqq.troop.data.TroopAioAgent.Message;
import com.tencent.mobileqq.troop.data.TroopAioMsgNavigateBar;
import com.tencent.mobileqq.troop.data.TroopAioTips;
import com.tencent.mobileqq.troop.data.TroopFeedsDataManager;
import com.tencent.mobileqq.troop.data.TroopMessageManager;
import com.tencent.mobileqq.troop.data.TroopMessageManager.UserActionStateInParallelPullPeriod;
import com.tencent.mobileqq.troop.logic.TroopFeedsCenterLogic;
import com.tencent.mobileqq.troop.logic.VideoPlayLogic;
import com.tencent.mobileqq.troop.text.AtTroopMemberSpan;
import com.tencent.mobileqq.troop.utils.NearbyTroopMemMgr;
import com.tencent.mobileqq.troop.utils.NearbyTroopMemMgr.RadarInstanceState;
import com.tencent.mobileqq.troop.utils.TroopAioADManager;
import com.tencent.mobileqq.troop.utils.TroopBarUtils;
import com.tencent.mobileqq.troop.utils.TroopBindPublicAccountMgr;
import com.tencent.mobileqq.troop.utils.TroopFileError;
import com.tencent.mobileqq.troop.utils.TroopFileError.TroopFileErrorObserver;
import com.tencent.mobileqq.troop.utils.TroopFileUtils;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopGagMgr.SelfGagInfo;
import com.tencent.mobileqq.troop.utils.TroopGiftManager;
import com.tencent.mobileqq.troop.utils.TroopGiftUtil;
import com.tencent.mobileqq.troop.utils.TroopNotificationHelper;
import com.tencent.mobileqq.troop.utils.TroopTipsMsgMgr;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.troop.utils.TroopTopicObserver;
import com.tencent.mobileqq.troop.widget.FloatView;
import com.tencent.mobileqq.troop.widget.MediaControllerX.MediaControllerListener;
import com.tencent.mobileqq.troop.widget.TroopUsageTimeReport;
import com.tencent.mobileqq.troopgift.TroopGiftAnimationController;
import com.tencent.mobileqq.utils.AlbumConstants;
import com.tencent.mobileqq.utils.AudioUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.utils.RecordParams;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.ScrollerRunnable;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.ListView;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;
import com.tencent.widget.immersive.SystemBarCompact;
import cooperation.troop.TroopOrgProxyActivity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Observable;
import java.util.Set;
import lkq;
import lkr;
import lks;
import lkt;
import lku;
import lkv;
import lkx;
import llf;
import llg;
import llh;
import lli;
import llj;
import llk;
import lll;
import llm;
import lln;
import llo;
import llq;
import llr;
import lls;
import llt;
import llu;
import llv;
import llw;
import lly;
import llz;
import lma;
import lmb;
import lmc;
import lmd;
import lme;
import lmg;
import lmh;
import lmi;
import lmj;
import lmk;
import lml;
import lmn;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;

public class TroopChatPie
  extends BaseChatPie
{
  static final String aj = "Q.aio.TroopChatPie";
  public static final String ak = "param_newly_created_hot_chat";
  static final String al = "request_timestamp";
  static final int dB = 1;
  static final int dC = 2;
  static final int dD = 3;
  static final int dE = 4;
  static final int dF = 5;
  static final int dG = 6;
  static final int dH = 7;
  public static final int dJ = 0;
  public static final int dK = 1;
  public static final int dL = 2;
  public static final int dM = 3;
  public static final int dN = 4;
  static final int dO = 1;
  public static final int dy = 200;
  public boolean J;
  public boolean K;
  protected boolean L;
  public boolean M;
  boolean N;
  protected boolean O;
  boolean P;
  public boolean Q;
  boolean R;
  public boolean S;
  protected AnimationDrawable a;
  Handler jdField_a_of_type_AndroidOsHandler;
  ViewTreeObserver.OnGlobalLayoutListener jdField_a_of_type_AndroidViewViewTreeObserver$OnGlobalLayoutListener;
  public Toast a;
  AnonymousChatHelper.AnonymousStatusListener jdField_a_of_type_ComTencentBizAnonymousAnonymousChatHelper$AnonymousStatusListener;
  public QQAnonymousDialog a;
  TroopCardAppInfoHelper.IGetAppInfoCB jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper$IGetAppInfoCB;
  TroopCardAppInfoHelper jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper;
  public TroopNewGuidePopWindow a;
  TroopAssistTipsBar jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar;
  BizTroopObserver jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver;
  protected MessageObserver a;
  TroopObserver jdField_a_of_type_ComTencentMobileqqAppTroopObserver;
  TroopQZoneUploadAlbumObserver jdField_a_of_type_ComTencentMobileqqAppTroopQZoneUploadAlbumObserver;
  ProxyObserver jdField_a_of_type_ComTencentMobileqqAppProxyProxyObserver;
  TroopMessageManager.UserActionStateInParallelPullPeriod jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod;
  public TroopFeedsCenterLogic a;
  VideoPlayLogic jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic;
  TroopFileError.TroopFileErrorObserver jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver;
  TroopTopicObserver jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopTopicObserver;
  FloatView jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView;
  MediaControllerX.MediaControllerListener jdField_a_of_type_ComTencentMobileqqTroopWidgetMediaControllerX$MediaControllerListener;
  TroopGiftAnimationController jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController;
  protected QQCustomDialog a;
  public Handler b;
  View.OnClickListener jdField_b_of_type_AndroidViewView$OnClickListener;
  QQProgressDialog jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  Runnable jdField_b_of_type_JavaLangRunnable;
  Runnable c;
  public int dA;
  public int dI;
  public int dz;
  public View g;
  View h;
  public View i;
  ImageView i;
  public View j;
  
  public TroopChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    J = false;
    jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = null;
    jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = null;
    K = false;
    L = false;
    M = false;
    N = false;
    dz = 0;
    dA = 2;
    jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow = null;
    jdField_a_of_type_ComTencentMobileqqTroopWidgetMediaControllerX$MediaControllerListener = new llu(this);
    jdField_c_of_type_JavaLangRunnable = new lmk(this);
    jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopTopicObserver = new lkv(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new lkx(this);
    jdField_b_of_type_AndroidOsHandler = new llf(this, Looper.getMainLooper());
    O = false;
    jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver = new lll(this);
    jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper$IGetAppInfoCB = new llm(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopQZoneUploadAlbumObserver = new lln(this);
    dI = 0;
    P = false;
    Q = true;
    jdField_a_of_type_AndroidWidgetToast = null;
    R = false;
    S = false;
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyObserver = new llt(this);
    jdField_b_of_type_AndroidViewView$OnClickListener = new llv(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lmd(this);
    jdField_i_of_type_AndroidWidgetImageView = null;
  }
  
  protected void A()
  {
    super.A();
    as();
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) == 2)
    {
      L = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, true);
      if (L) {
        ax();
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView != null) {
      jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView.setVisibility(0);
    }
  }
  
  protected void B()
  {
    super.B();
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null)
    {
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.f();
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.j();
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = null;
    }
    Intent localIntent = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent();
    if (localIntent == null) {
      return;
    }
    String str = localIntent.getStringExtra("uin");
    int k = localIntent.getIntExtra("uintype", -1);
    if ((!str.equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != k)) {}
    for (k = 1;; k = 0)
    {
      if ((k != 0) && (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null))
      {
        jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.e();
        jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = null;
      }
      if (k != 0) {
        NearbyTroopMemMgr.a();
      }
      if (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver != null)
      {
        TroopFileError.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver);
        jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver = null;
      }
      jdField_g_of_type_Boolean = true;
      return;
    }
  }
  
  public void C()
  {
    if (((jdField_a_of_type_AndroidSupportV4AppFragmentActivity instanceof SplashActivity)) && (jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController != null)) {
      jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController.c();
    }
    super.C();
  }
  
  protected void I()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a();
    }
    super.I();
  }
  
  protected void R()
  {
    aD();
    TroopInfo localTroopInfo = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    TroopManager localTroopManager = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if ((localTroopInfo != null) && (localTroopInfo.isTroopOwner(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) && (localTroopManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) - NetConnInfoCenter.getServerTime() < 259200L)) {
      a(0L, 0L);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
      ay();
    }
    super.R();
    if (N == true)
    {
      ThreadManager.a(new lml(this), 1, null, true);
      N = false;
    }
  }
  
  public void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.c(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopTopicObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppTroopQZoneUploadAlbumObserver);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqAppProxyProxyObserver);
    }
  }
  
  public void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopTopicObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppTroopQZoneUploadAlbumObserver);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqAppProxyProxyObserver);
    }
  }
  
  public View a(int paramInt)
  {
    if (paramInt == 3)
    {
      long l = System.currentTimeMillis();
      jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel = ((EmoticonMainPanel)jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getLayoutInflater().inflate(2130903325, null));
      jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel.setCallBack(this);
      jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight(), f);
      if (QLog.isColorLevel()) {
        QLog.d("OpenPanel", 2, "OpenEmoticonMainPanel:" + (System.currentTimeMillis() - l));
      }
      if (K) {
        jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel.a(K);
      }
      return jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel;
    }
    return super.a(paramInt);
  }
  
  public TroopGiftAnimationController a()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController == null) {
      jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController = new TroopGiftAnimationController(this);
    }
    return jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController;
  }
  
  public QQRecorder.RecorderParam a()
  {
    boolean bool = super.l();
    return RecordParams.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, bool);
  }
  
  public String a(TroopMemberInfo paramTroopMemberInfo)
  {
    int k = (int)(mUniqueTitleExpire - NetConnInfoCenter.getServerTime()) / 86400;
    return String.format("<{\"text\":\"%1$s\", \"cmd\": \"5\", \"data\":\"%2$s\"}>专属头衔\"%3$s\"将在%4$d天后到期，<{\"text\":\"点击续期\", \"cmd\": \"3\", \"data_a\":\"mqqapi://app/action?pkg=com.tencent.mobileqq&cmp=com.tencent.biz.troop.EditUniqueTitleActivity&troopUin=%5$s&memberUin=%2$s&uniqueTitle=%6$s&uniqueTitleExpire=%7$d&from=2\"}>", new Object[] { friendnick, memberuin, mUniqueTitle, Integer.valueOf(k + 1), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, mUniqueTitle, Integer.valueOf(mUniqueTitleExpire) });
  }
  
  protected void a()
  {
    super.a();
    if (jdField_a_of_type_AndroidViewViewTreeObserver$OnGlobalLayoutListener != null)
    {
      jdField_a_of_type_AndroidViewViewTreeObserver$OnGlobalLayoutListener = new lli(this);
      jdField_a_of_type_ComTencentWidgetXEditTextEx.getViewTreeObserver().addOnGlobalLayoutListener(jdField_a_of_type_AndroidViewViewTreeObserver$OnGlobalLayoutListener);
    }
    jdField_b_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428171));
    jdField_c_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428171));
    jdField_a_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428169));
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    c(false);
    super.a(paramInt1, paramInt2);
  }
  
  protected void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 2000) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar.a()) && (TroopAssistantManager.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
    }
    if ((paramInt1 != 5) && (paramInt1 != 2000) && (c(true))) {
      return;
    }
    if (paramInt2 == -1) {
      switch (paramInt1)
      {
      }
    }
    Object localObject;
    int k;
    do
    {
      do
      {
        for (;;)
        {
          super.a(paramInt1, paramInt2, paramIntent);
          return;
          localObject = AIOUtils.a(new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, SplashActivity.class), null);
          ((Intent)localObject).putExtras(new Bundle(paramIntent.getExtras()));
          jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivity((Intent)localObject);
          continue;
          Bundle localBundle = paramIntent.getExtras();
          localObject = Boolean.valueOf(false);
          String str = "";
          if (localBundle.containsKey("TroopFile_DeleteFile")) {
            localObject = Boolean.valueOf(localBundle.getBoolean("TroopFile_DeleteFile"));
          }
          if (localBundle.containsKey("TroopFile_FileName")) {
            str = localBundle.getString("TroopFile_FileName");
          }
          if (((Boolean)localObject).booleanValue())
          {
            localObject = String.format(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364073), new Object[] { TroopFileUtils.a(str) });
            TroopFileError.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, (String)localObject);
            continue;
            a(paramIntent.getExtras().getString("member_uin"), paramIntent.getExtras().getString("member_display_name"), true, 4);
            continue;
            TroopGiftUtil.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramIntent, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
            continue;
            aa();
            k = jdField_a_of_type_ComTencentWidgetXEditTextEx.getSelectionStart();
            if (k > 0)
            {
              int m = jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().charAt(k - 1);
              if ((m == 36) || (m == 65509) || (m == 165) || (m == 65284))
              {
                jdField_a_of_type_ComTencentWidgetXEditTextEx.removeTextChangedListener(this);
                jdField_a_of_type_ComTencentWidgetXEditTextEx.setText(jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().delete(k - 1, k));
                jdField_a_of_type_ComTencentWidgetXEditTextEx.addTextChangedListener(this);
                jdField_a_of_type_ComTencentWidgetXEditTextEx.setSelection(k - 1);
                continue;
                a(paramIntent.getExtras().getString("member_uin"), paramIntent.getExtras().getString("member_display_name"), false, 3);
                continue;
                localObject = jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().toString();
                if ((((String)localObject).length() == 1) && ((((String)localObject).charAt(0) == '#') || (((String)localObject).charAt(0) == 65283)))
                {
                  jdField_a_of_type_ComTencentWidgetXEditTextEx.setText("");
                  continue;
                  if (paramInt2 != 8001) {
                    break;
                  }
                  if (jdField_a_of_type_ComTencentWidgetXPanelContainer != null) {
                    jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
                  }
                }
              }
            }
          }
        }
      } while (paramInt1 != 12005);
      localObject = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    } while (localObject == null);
    if (((TroopInfo)localObject).isTroopOwner(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {
      k = 0;
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "mber", "un", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, k + "", "", "");
      break;
      if (((TroopInfo)localObject).isAdmin()) {
        k = 1;
      } else {
        k = 2;
      }
    }
  }
  
  public void a(int paramInt1, long paramLong, int paramInt2, MessageRecord paramMessageRecord)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie.troop.special_msg", 2, "refreshHeadMessage==>type:" + paramInt1 + "|value:" + paramLong);
    }
    long l2 = 0L;
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
    long l1 = l2;
    Object localObject2;
    if (localObject1 != null)
    {
      localObject1 = ((List)localObject1).iterator();
      do
      {
        l1 = l2;
        if (!((Iterator)localObject1).hasNext()) {
          break;
        }
        localObject2 = (ChatMessage)((Iterator)localObject1).next();
      } while (MsgProxyUtils.q(msgtype));
      l1 = shmsgseq;
    }
    localObject1 = new lku(this);
    int k = 0;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a() == 9) {
      k = 1;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie.troop.special_msg", 2, "refreshHeadMessage==>fistseq:" + l1 + "|value:" + paramLong);
    }
    if (k == 0)
    {
      if (paramInt1 != 1) {
        break label258;
      }
      if ((int)l1 >= 1L + paramLong)
      {
        if (l1 - paramLong <= 200L) {
          break label1267;
        }
        paramLong = l1 - 200L;
      }
    }
    label258:
    label663:
    label1255:
    label1261:
    label1267:
    for (;;)
    {
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(l1, paramLong, true);
      }
      jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(0, -1, (Runnable)localObject1);
      do
      {
        do
        {
          return;
          if ((paramInt1 != 12) && (paramInt1 != 7) && (paramInt1 != 3) && (paramInt1 != 14) && (paramInt1 != 10) && (paramInt1 != 2)) {
            break;
          }
          paramMessageRecord = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramLong);
        } while ((paramMessageRecord == null) || (paramInt2 > 200));
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.TroopChatPie.troop.special_msg", 2, "refreshHeadMessage==>fistseq:" + l1 + ", mr.shmsgseq:" + shmsgseq);
        }
        if ((int)l1 >= shmsgseq + 1L)
        {
          if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
            jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(l1, shmsgseq, false);
          }
          if (paramInt1 == 2) {
            jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(uniseq);
          }
          jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, 0, -1, (Runnable)localObject1);
          return;
        }
        paramInt2 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a((ChatMessage)paramMessageRecord);
      } while (paramInt2 == -1);
      jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, paramInt2, paramInt2, null);
      return;
      if (paramInt1 == 11) {
        if (!(paramMessageRecord instanceof MessageForReplyText)) {
          break label1261;
        }
      }
      for (paramMessageRecord = (MessageForReplyText)paramMessageRecord;; paramMessageRecord = null)
      {
        if (paramInt2 <= 200)
        {
          if ((int)l1 >= 1L + paramLong)
          {
            if (!NetworkUtil.g(jdField_a_of_type_AndroidSupportV4AppFragmentActivity))
            {
              QQToast.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131364602, 0).b(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
              TroopTopicMgr.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "obj", "locate_post", paramMessageRecord, false);
              return;
            }
            if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
              jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(l1, paramLong, false);
            }
            jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, 0, -1, (Runnable)localObject1);
            TroopTopicMgr.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "obj", "locate_post", paramMessageRecord, true);
            return;
          }
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramLong, 0L);
          if ((localObject2 == null) || (((List)localObject2).size() <= 0)) {
            break label1255;
          }
          paramInt2 = 0;
          if (paramInt2 >= ((List)localObject2).size()) {
            break label1255;
          }
          localObject1 = (MessageRecord)((List)localObject2).get(paramInt2);
          if ((MsgProxyUtils.q(msgtype)) || ((localObject1 instanceof MessageForSafeGrayTips))) {}
        }
        for (;;)
        {
          if ((localObject1 != null) && (!MsgProxyUtils.p(msgtype)))
          {
            paramInt2 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a(uniseq);
            if (paramInt2 == -1) {
              break;
            }
            jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, paramInt2, paramInt2, null);
            TroopTopicMgr.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "obj", "locate_post", paramMessageRecord, true);
            return;
            paramInt2 += 1;
            break label663;
          }
          QQToast.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131365107, 0).b(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          TroopTopicMgr.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "obj", "locate_post", paramMessageRecord, false);
          return;
          QQToast.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131365106, 0).b(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
          TroopTopicMgr.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "obj", "locate_post", paramMessageRecord, false);
          return;
          if (paramInt1 != 9) {
            break;
          }
          paramMessageRecord = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramLong);
          if ((paramMessageRecord != null) && (paramInt2 <= 200))
          {
            if (QLog.isColorLevel()) {
              QLog.d("Q.aio.TroopChatPie.troop.special_msg", 2, "refreshHeadMessage==>unreadMsgCount:" + paramInt2 + ", fistseq:" + l1 + ", mr.shmsgseq:" + shmsgseq);
            }
            if ((int)l1 >= shmsgseq + 1L)
            {
              if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
                jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(l1, shmsgseq, false);
              }
              jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, 0, -1, (Runnable)localObject1, jdField_a_of_type_MqqOsMqqHandler);
              return;
            }
            paramInt2 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.c(paramLong);
            if (paramInt2 == -1) {
              break;
            }
            jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, paramInt2, paramInt2, null, jdField_a_of_type_MqqOsMqqHandler);
            return;
          }
          boolean bool = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          if (QLog.isColorLevel()) {
            QLog.d("Q.aio.TroopChatPie.trooptroop_pull_msg", 2, "所要定位的消息还没拉回来本地，并发拉取中...mUserActionState create, natvigateSeq:" + paramLong + ",isAioParallelPullMsgDone:" + bool);
          }
          if (bool)
          {
            if ((int)l1 >= 1L + paramLong)
            {
              if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
                jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(l1, paramLong, false);
              }
              jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, 0, -1, (Runnable)localObject1, jdField_a_of_type_MqqOsMqqHandler);
              return;
            }
            paramInt2 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.c(paramLong);
            if (paramInt2 == -1) {
              break;
            }
            jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, paramInt2, paramInt2, null, jdField_a_of_type_MqqOsMqqHandler);
            return;
          }
          jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod = new TroopMessageManager.UserActionStateInParallelPullPeriod();
          jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.d = TroopMessageManager.UserActionStateInParallelPullPeriod.c;
          jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.a = TroopAioAgent.Message.a(paramInt1, paramLong, paramInt2);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().addObserver(this);
          return;
          localObject1 = null;
        }
      }
    }
  }
  
  public void a(int paramInt, String paramString)
  {
    if (jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog == null) {
      jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog = new QQAnonymousDialog(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
    }
    jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog.a(paramInt, paramString);
    jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog.show();
    if ((paramInt == 1) || (paramInt == 3)) {
      jdField_a_of_type_MqqOsMqqHandler.postDelayed(new lma(this), 1000L);
    }
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    Object localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getSupportFragmentManager().findFragmentByTag(ChatFragment.class.getName());
    if (localObject != null)
    {
      localObject = a;
      if (localObject != null) {
        ((SystemBarCompact)localObject).b(paramInt);
      }
    }
  }
  
  public void a(long paramLong1, long paramLong2)
  {
    TroopManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramLong1, paramLong2, new lks(this, false));
  }
  
  public void a(long paramLong, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.i("troop.credit.act", 2, "showLowCreditLevelDialog:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "," + paramLong + "," + paramBoolean);
    }
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing())) {
      if ((paramLong == 1L) || (paramLong == 2L)) {
        if (QLog.isColorLevel()) {
          QLog.i("troop.credit.act", 2, "showLowCreditLevelDialog, CreditLevelTipDialog isShowing:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "," + paramLong + "," + paramBoolean);
        }
      }
    }
    do
    {
      return;
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      if ((paramLong == 1L) || ((paramLong == 2L) && (!paramBoolean)))
      {
        int k = 2131365064;
        if (paramLong == 1L) {
          k = 2131365065;
        }
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230).setTitle(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131368686)).setMessage(k);
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setPositiveButton(2131365066, new llh(this));
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setNegativeButton("", null);
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setCancelable(false);
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
        return;
      }
    } while ((paramLong != 2L) || (!paramBoolean));
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230).setTitle(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131368686)).setMessage(2131365063);
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setNegativeButton(2131365066, new llj(this));
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setPositiveButton(2131365067, new llk(this));
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setCancelable(false);
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
  }
  
  protected void a(Intent paramIntent)
  {
    if ((K) && (!AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
      k(false);
    }
    for (;;)
    {
      if ((K) && (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131364804) + aajdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).jdField_a_of_type_JavaLangString);
      }
      super.a(paramIntent);
      if (K)
      {
        jdField_a_of_type_AndroidWidgetLinearLayout.getBackground().setVisible(true, false);
        jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131297343).setVisibility(8);
      }
      int k = paramIntent.getIntExtra("input_panel_status", 0);
      if (k > 0) {
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a(k, false);
      }
      return;
      if (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
      {
        k(true);
        jdField_a_of_type_ComTencentWidgetXPanelContainer.setBackgroundResource(2130839527);
        jdField_a_of_type_AndroidViewViewGroup.setBackgroundResource(2130839527);
        jdField_g_of_type_AndroidViewView.setVisibility(0);
      }
    }
  }
  
  protected void a(Intent paramIntent, int paramInt)
  {
    int k = paramIntent.getIntExtra(AlbumConstants.i, -1);
    if (((k == 2) || (k == 1)) && (c(true))) {
      return;
    }
    super.a(paramIntent, paramInt);
  }
  
  public void a(Configuration paramConfiguration)
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null) {
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a(paramConfiguration);
    }
    super.a(paramConfiguration);
  }
  
  protected void a(QQMessageFacade.Message paramMessage)
  {
    if ((jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null) && (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.b())) {
      return;
    }
    super.a(paramMessage);
  }
  
  public void a(TroopGagMgr.SelfGagInfo paramSelfGagInfo)
  {
    if (jdField_a_of_type_Boolean) {
      if ((1 != jdField_a_of_type_ComTencentWidgetXPanelContainer.a()) && (3 != jdField_a_of_type_ComTencentWidgetXPanelContainer.a()) && (8 != jdField_a_of_type_ComTencentWidgetXPanelContainer.a()) && ((l != 1) || (v != 0)))
      {
        T();
        if (jdField_d_of_type_AndroidWidgetTextView != null) {
          jdField_d_of_type_AndroidWidgetTextView.setText(b);
        }
        jdField_b_of_type_AndroidOsHandler.removeMessages(1);
        jdField_b_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, jdField_a_of_type_Long * 1000L);
        jdField_g_of_type_Boolean = false;
        if (QLog.isColorLevel()) {
          QLog.d("fastimage", 2, "updateGagStatus disable fastimage,  mAllowFastImage = " + jdField_g_of_type_Boolean);
        }
      }
    }
    do
    {
      return;
      O = true;
      break;
      O = false;
      aB();
      jdField_g_of_type_Boolean = true;
    } while (!QLog.isColorLevel());
    QLog.d("fastimage", 2, "updateGagStatus enable fastimage,  mAllowFastImage = " + jdField_g_of_type_Boolean);
  }
  
  public void a(TroopGagMgr.SelfGagInfo paramSelfGagInfo, boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
    {
      if (paramSelfGagInfo == null) {
        ThreadManager.a(new llg(this, paramBoolean), 8, null, true);
      }
    }
    else {
      return;
    }
    a(paramSelfGagInfo);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) && (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.d()) && (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 != null) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)))
    {
      if (!TroopAioMsgNavigateBar.a(jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a())) {
        break label106;
      }
      List localList = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a().subList(paramInt1, paramInt1 + paramInt2 - 1);
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(localList);
    }
    for (;;)
    {
      super.a(paramAbsListView, paramInt1, paramInt2, paramInt3);
      return;
      label106:
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.b(0);
    }
  }
  
  protected void a(CharSequence paramCharSequence)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
    {
      paramCharSequence = new ArrayList();
      paramCharSequence = AtTroopMemberSpan.a(jdField_a_of_type_ComTencentWidgetXEditTextEx.getEditableText(), paramCharSequence);
    }
    super.a(paramCharSequence);
  }
  
  public void a(Object paramObject)
  {
    AIOUtils.l = true;
    if ((paramObject == null) || (!(paramObject instanceof Integer))) {}
    int k;
    do
    {
      return;
      k = ((Integer)paramObject).intValue();
    } while (k == jdField_a_of_type_ComTencentWidgetXPanelContainer.a());
    switch (k)
    {
    }
    for (;;)
    {
      q(k);
      super.a(paramObject);
      return;
      if (K)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_anon", "", "anon_aio", "Clk_face", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
        continue;
        if (K)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_anon", "", "anon_aio", "Clk_PTT", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
          continue;
          if (K)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_anon", "", "anon_aio", "Clk_pic", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
            continue;
            if (K)
            {
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_anon", "", "anon_aio", "Clk_shoot", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
              continue;
              if (!t()) {
                ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Clk_plusentry", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
              }
            }
          }
        }
      }
    }
  }
  
  public void a(String paramString1, String paramString2, boolean paramBoolean, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(47)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true).jdField_a_of_type_Boolean) {}
    while ((TextUtils.isEmpty(paramString1)) || (TextUtils.isEmpty(paramString2))) {
      return;
    }
    if ((jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 2) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getConfiguration().orientation == 2)) {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
    }
    jdField_a_of_type_MqqOsMqqHandler.postDelayed(new lmc(this, paramBoolean, paramString1, paramString2, paramInt), 300L);
  }
  
  public void a(boolean paramBoolean1, ChatMessage paramChatMessage, boolean paramBoolean2)
  {
    super.a(paramBoolean1, paramChatMessage, paramBoolean2);
    if (paramBoolean1) {
      if (jdField_i_of_type_AndroidWidgetImageView != null) {
        jdField_i_of_type_AndroidWidgetImageView.setVisibility(8);
      }
    }
    while (jdField_i_of_type_AndroidWidgetImageView == null) {
      return;
    }
    jdField_i_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  public void a(boolean paramBoolean, Object paramObject)
  {
    if (!paramBoolean) {}
    Object localObject1;
    do
    {
      return;
      localObject1 = a();
    } while ((TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) || (paramObject == null));
    for (;;)
    {
      int k;
      try
      {
        paramObject = (Object[])paramObject;
        long l = ((Long)paramObject[0]).longValue();
        if (Long.parseLong(jdField_a_of_type_JavaLangString) != l) {
          break;
        }
        paramObject = (TroopMemberCard)paramObject[2];
        k = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.s();
        int m = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.t();
        if (k > m) {
          break;
        }
        localObject1 = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.a().getItem(k);
        if (!(localObject1 instanceof MessageForQQWalletTips)) {
          break label462;
        }
        localObject1 = (MessageForQQWalletTips)localObject1;
        if ((istroop != 1) || (paramObject == null) || (!memberUin.equals(String.valueOf(memberUin))) || (!frienduin.equals(String.valueOf(l)))) {
          break label462;
        }
        Object localObject2 = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
        if (localObject2 == null) {
          break label462;
        }
        String str = nick;
        paramBoolean = ((TroopManager)localObject2).a(frienduin, memberUin, card, -100, str, null, -100, -100, -100, -100L, (byte)-100, -100L, -100.0D);
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.TroopChatPie", 2, "handGetTroopMemberCard troopUin=" + frienduin + ", memberUin=" + memberUin + ",card=" + card + ",remark=" + remark + ",nick=" + nick + ",saveTroopMemberEx succ=" + paramBoolean);
        }
        if (!paramBoolean) {
          break label462;
        }
        localObject2 = AIOUtils.a(jdField_a_of_type_ComTencentMobileqqBubbleChatXListView, k);
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.TroopChatPie", 2, "handGetTroopMemberCard ref itemView=" + localObject2 + ",index=" + k);
        }
        if (localObject2 == null) {
          break label462;
        }
        localObject2 = (TextView)((View)localObject2).findViewById(2131297569);
        ((MessageForQQWalletTips)localObject1).buildQQWalletTips(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, (TextView)localObject2);
      }
      catch (Throwable paramObject) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.w("Q.aio.TroopChatPie", 2, "handGetTroopMemberCard e=" + paramObject);
      return;
      label462:
      k += 1;
    }
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "troop chatPie listView onViewCompleteVisableAndReleased");
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount() > 0)
    {
      jdField_b_of_type_Long = SystemClock.uptimeMillis();
      ((ChatContext)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.a).a(jdField_b_of_type_Long);
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
        if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.jdField_b_of_type_Boolean)
        {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.e = true;
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.jdField_a_of_type_Long, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.jdField_b_of_type_Long, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.c, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
          jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.i();
          if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) == 3)) {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOchat", "Get_more_history", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
          }
        }
      }
    }
    for (;;)
    {
      return true;
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.e = false;
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.f = true;
      if (!L)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 20, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
        break;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
      L = false;
      break;
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.e = false;
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.f = true;
      if (!L)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 20, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
        break;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
      L = false;
      break;
      d(false);
    }
  }
  
  protected boolean a(boolean paramBoolean)
  {
    super.a(paramBoolean);
    aA();
    r(1);
    return true;
  }
  
  void aA() {}
  
  protected void aB()
  {
    i(0);
  }
  
  protected void aC()
  {
    boolean bool3 = false;
    TroopManager localTroopManager = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    Object localObject = null;
    if (localTroopManager != null) {
      localObject = localTroopManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    }
    if (localObject == null) {
      if (QLog.isColorLevel()) {
        QLog.i("troop.credit.act", 2, "checkTroopCreditLevel, troopInfo==null:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      }
    }
    long l;
    do
    {
      return;
      l = troopCreditLevel;
      if ((l == 1L) || (l == 2L)) {
        break;
      }
      if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing())) {
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      }
    } while (!QLog.isColorLevel());
    QLog.i("troop.credit.act", 2, "checkTroopCreditLevel, normal:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "," + l);
    return;
    boolean bool1;
    if ((dwAdditionalFlag & 1L) == 1L)
    {
      bool1 = true;
      if ((dwCmdUinUinFlag & 1L) != 1L) {
        break label362;
      }
    }
    label362:
    for (boolean bool2 = true;; bool2 = false)
    {
      if ((bool1) || (bool2)) {
        bool3 = true;
      }
      if (QLog.isColorLevel()) {
        QLog.i("troop.credit.act", 2, "checkTroopCreditLevel:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "," + bool1 + ", " + bool2);
      }
      localObject = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
      if (localObject != null)
      {
        if (QLog.isColorLevel()) {
          QLog.i("troop.credit.act", 2, "checkTroopCreditLevel, getTroopCreditInfo:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        }
        ((TroopHandler)localObject).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true);
      }
      a(l, bool3);
      return;
      bool1 = false;
      break;
    }
  }
  
  protected void aD()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips == null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips = new TroopAioTips();
    }
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.g();
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, this, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1, jdField_a_of_type_ComTencentMobileqqBubbleChatXListView, jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable);
    at();
    dI = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    ThreadManager.b().post(new llo(this));
    int k;
    Object localObject;
    if ((jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getExtras().containsKey("forward_type")) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("uin"))))
    {
      k = 1;
      if ((!R) && (k == 0) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) == 3))
      {
        jdField_a_of_type_AndroidWidgetToast = ChatActivityUtils.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367335));
        jdField_a_of_type_AndroidWidgetToast.show();
        R = true;
      }
      aG();
      if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a() != 9)) {
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.d();
      }
      aL();
      localObject = new llq(this);
      ThreadManager.b().post((Runnable)localObject);
      localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent();
      if (localObject != null)
      {
        String str1 = ((Intent)localObject).getStringExtra("at_member_name");
        String str2 = ((Intent)localObject).getStringExtra("at_member_uin");
        k = ((Intent)localObject).getIntExtra("at_member_source", 0);
        if ((!TextUtils.isEmpty(str1)) && (!TextUtils.isEmpty(str2))) {
          a(str2, str1, false, k);
        }
      }
      if ((P) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1)) {
        break label622;
      }
      if (!BaseApplicationImpl.getContext().getSharedPreferences("troop_new_guid", 0).getBoolean(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, false)) {
        break label591;
      }
    }
    for (;;)
    {
      try
      {
        long l1 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        long l2 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        TroopNotificationHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0, l1, l1, l2, "", (int)System.currentTimeMillis(), "OidbSvc.0x852_48", (short)34, true, false);
        TroopNewGuidePopWindow.b("http://gdynamic.qpic.cn/gdynamic/");
        bool1 = false;
      }
      catch (Exception localException)
      {
        boolean bool2;
        localException.printStackTrace();
        bool1 = false;
        continue;
      }
      if (!bool1)
      {
        if ((jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow != null) && (jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.isShowing()))
        {
          bool1 = true;
          bool2 = false;
          localObject = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
          if (localObject != null) {
            bool2 = ((TroopGiftManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          }
          if ((localObject != null) && (bool2) && (bool1)) {
            jdField_b_of_type_Boolean = false;
          }
          if ((!bool1) && (bool2))
          {
            TroopGiftManager.jdField_a_of_type_Boolean = true;
            i(true);
          }
          if ((bool2) || (bool1)) {
            break label606;
          }
          aF();
          P = true;
          return;
          k = 0;
          break;
          label591:
          bool1 = w();
          continue;
        }
        bool1 = false;
        continue;
        label606:
        Q = false;
        j(false);
        continue;
      }
      continue;
      label622:
      boolean bool1 = false;
    }
  }
  
  public void aE()
  {
    TroopBindPublicAccountMgr localTroopBindPublicAccountMgr = (TroopBindPublicAccountMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(131);
    Object localObject = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if ((localObject != null) && (localTroopBindPublicAccountMgr != null))
    {
      localObject = ((TroopManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((localObject != null) && (associatePubAccount > 0L))
      {
        if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) {
          jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = new TroopFeedsCenterLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_c_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips, K);
        }
        if (localTroopBindPublicAccountMgr.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
        {
          jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.f(true);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_public", "", "oper", "tag_red", 0, 0, troopuin, "", "", "");
        }
      }
    }
  }
  
  public void aF()
  {
    if (!v()) {}
    for (boolean bool = true;; bool = false)
    {
      Message localMessage = jdField_b_of_type_AndroidOsHandler.obtainMessage(3);
      obj = Boolean.valueOf(bool);
      jdField_b_of_type_AndroidOsHandler.sendMessage(localMessage);
      return;
    }
  }
  
  void aG()
  {
    Object localObject;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
    {
      localObject = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
      if (localObject != null) {
        break label29;
      }
    }
    label29:
    do
    {
      for (;;)
      {
        return;
        localObject = ((TroopManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        if ((localObject != null) && ((wMemberNum == 0) || (TextUtils.isEmpty(troopowneruin)))) {
          try
          {
            long l = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
            localObject = new ArrayList();
            ((ArrayList)localObject).add(Long.valueOf(l));
            ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).a((ArrayList)localObject);
            if (QLog.isColorLevel())
            {
              QLog.d("Q.aio.TroopChatPie", 2, "getTroopInfoIfNeed, sessionInfo.curFriendUin = " + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
              return;
            }
          }
          catch (Exception localException) {}
        }
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.aio.TroopChatPie", 2, "getTroopInfoIfNeed failed");
  }
  
  public void aH()
  {
    TroopHandler localTroopHandler = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
    if (localTroopHandler != null) {}
    try
    {
      localTroopHandler.a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), 0L, 2, null, 0, 0);
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.i("Q.aio.TroopChatPie", 2, localException.toString());
    }
  }
  
  void aI()
  {
    if (jdField_a_of_type_AndroidWidgetLinearLayout.getBackground() != null) {
      i();
    }
    a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428205), true);
    jdField_i_of_type_Int = 2130837538;
    jdField_j_of_type_Int = 2130837537;
    jdField_a_of_type_ComTencentWidgetXEditTextEx.setBackgroundResource(2130842483);
    jdField_b_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428171));
    jdField_a_of_type_AndroidWidgetTextView.setBackgroundResource(2130842902);
    jdField_a_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428169));
    jdField_a_of_type_AndroidWidgetImageView.setBackgroundResource(2130842905);
    jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839510);
    if ((jdField_a_of_type_JavaLangCharSequence != null) && (!jdField_a_of_type_JavaLangCharSequence.toString().startsWith(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131364804)))) {
      e(jdField_a_of_type_JavaLangCharSequence.toString());
    }
    for (;;)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a.jdField_a_of_type_Boolean = false;
        jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a();
      }
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel != null) {
        jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel.a(false);
      }
      jdField_g_of_type_AndroidViewView.setVisibility(8);
      jdField_h_of_type_AndroidViewView.setVisibility(8);
      AnonymousChatHelper.a().b();
      aK();
      if (jdField_a_of_type_ComTencentWidgetXEditTextEx != null)
      {
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setShadowLayer(1.0F, 0.0F, 1.0F, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427532));
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint("");
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setTextColor(jdField_a_of_type_AndroidContentContext.getResources().getColor(2131428228));
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setBackgroundResource(2130842498);
      }
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(1);
      return;
      jdField_c_of_type_AndroidWidgetTextView.setText("");
      jdField_c_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428171));
      b(false);
    }
  }
  
  public void aJ()
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    localAlphaAnimation.setDuration(200L);
    localAlphaAnimation.setAnimationListener(new lly(this));
    if ((jdField_j_of_type_AndroidViewView != null) && (jdField_i_of_type_AndroidViewView != null))
    {
      jdField_j_of_type_AndroidViewView.startAnimation(localAlphaAnimation);
      jdField_i_of_type_AndroidViewView.startAnimation(localAlphaAnimation);
    }
  }
  
  public void aK()
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
    localAlphaAnimation.setDuration(200L);
    localAlphaAnimation.setAnimationListener(new llz(this));
    jdField_j_of_type_AndroidViewView.startAnimation(localAlphaAnimation);
    jdField_i_of_type_AndroidViewView.startAnimation(localAlphaAnimation);
  }
  
  void aL()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "handleGrayTipsMsg");
    }
    Object localObject = (TroopTipsMsgMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(80);
    if (localObject == null) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.TroopChatPie", 2, "troopTipsMsgMgr == null");
      }
    }
    while ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) || (!((TroopTipsMsgMgr)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "troopAIO has unread troopTipMsg");
    }
    localObject = new lmb(this, (TroopTipsMsgMgr)localObject);
    ThreadManager.b().post((Runnable)localObject);
  }
  
  void aM()
  {
    String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).b(Long.parseLong(str));
  }
  
  public void aN()
  {
    if (jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) {
      jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    }
  }
  
  public void aO()
  {
    if (jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog == null)
    {
      jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(jdField_a_of_type_AndroidContentContext, a());
      jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.a("正在加载...");
    }
    jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
  }
  
  public void ar()
  {
    Object localObject = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if (localObject != null)
    {
      localObject = ((TroopManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((localObject == null) || (associatePubAccount <= 0L)) {
        break label113;
      }
      if (!K) {
        break label100;
      }
      jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839505);
      jdField_c_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131365177));
    }
    for (;;)
    {
      jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(new lmh(this));
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      return;
      label100:
      jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839504);
      break;
      label113:
      if ((jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null) && (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a()))
      {
        jdField_c_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364186));
        if (K) {
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839526);
        } else {
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839511);
        }
      }
      else
      {
        jdField_c_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364184));
        if (K) {
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839525);
        } else {
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130839510);
        }
      }
    }
  }
  
  void as()
  {
    boolean bool = false;
    if (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver == null)
    {
      lmn localLmn = new lmn(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver = new TroopFileError.TroopFileErrorObserver(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, localLmn, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    TroopFileError.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver);
    jdField_d_of_type_Long = System.currentTimeMillis();
    jdField_a_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367689));
    c(false);
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null) {
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.d();
    }
    d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "--->current AIO info<--- onresume. troopUin:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b + ",curFriendUin:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + ",type:" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    }
    if (K != AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
    {
      if (!K) {
        bool = true;
      }
      K = bool;
      k(K);
    }
    ((TroopBindPublicAccountMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(131)).e(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
  }
  
  protected void at()
  {
    ThreadManager.a(new lme(this), 8, null, true);
  }
  
  protected void ax()
  {
    d(true);
    lmj localLmj = new lmj(this);
    jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(0, -1, localLmj);
  }
  
  void ay()
  {
    ThreadManager.a(new lkr(this), 5, null, true);
  }
  
  public void az()
  {
    if (((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) - NetConnInfoCenter.getServerTime() < 259200L) {
      ThreadManager.a(jdField_c_of_type_JavaLangRunnable, 8, null, true);
    }
  }
  
  protected void b(int paramInt1, int paramInt2)
  {
    super.b(paramInt1, paramInt2);
    if (paramInt2 == 8) {
      if (!K) {}
    }
    for (;;)
    {
      if ((paramInt2 == 2) && (K)) {
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.a(0);
      }
      return;
      if (!K) {}
    }
  }
  
  public void b(long paramLong)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) {
      return;
    }
    if (paramLong <= 0L)
    {
      b(false);
      return;
    }
    Object localObject = paramLong + "";
    if (paramLong > 99L) {
      localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364226);
    }
    String str = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364222, new Object[] { localObject });
    NearbyTroopMemMgr localNearbyTroopMemMgr = NearbyTroopMemMgr.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if (!localNearbyTroopMemMgr.a()) {
      if (ajdField_a_of_type_Int == 0) {
        localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364223, new Object[] { localObject, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364224) });
      }
    }
    for (;;)
    {
      if (K)
      {
        jdField_a_of_type_JavaLangCharSequence = ((CharSequence)localObject);
        return;
        if (ajdField_a_of_type_Int == 1) {
          localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364223, new Object[] { localObject, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364225) });
        } else {
          localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131364222, new Object[] { localObject });
        }
      }
      else
      {
        b(true);
        e((String)localObject);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "nearby_mber", "exp_nearby_mber", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
        return;
        localObject = str;
      }
    }
  }
  
  protected void b(Intent paramIntent)
  {
    paramIntent = paramIntent.getStringExtra("uinname");
    if (paramIntent != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = paramIntent;
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
      if (AppSetting.i)
      {
        paramIntent = jdField_b_of_type_AndroidWidgetTextView.getText() + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131362063);
        jdField_b_of_type_AndroidWidgetTextView.setContentDescription(paramIntent);
        a().setTitle(jdField_b_of_type_AndroidWidgetTextView.getText());
      }
      return;
      q();
    }
  }
  
  public void b(boolean paramBoolean)
  {
    if ((paramBoolean) && (jdField_c_of_type_AndroidWidgetTextView.getVisibility() == 8))
    {
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setTextSize(1, 16.0F);
    }
    while ((paramBoolean) || (jdField_c_of_type_AndroidWidgetTextView.getVisibility() != 0) || (K)) {
      return;
    }
    jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
    jdField_b_of_type_AndroidWidgetTextView.setTextSize(2, 19.0F);
  }
  
  public void c()
  {
    if (c(true)) {
      return;
    }
    super.c();
  }
  
  public boolean c(boolean paramBoolean)
  {
    boolean bool = false;
    if (O)
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
      if (paramBoolean) {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 2131364574, 0).b(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
      }
      T();
      bool = true;
    }
    return bool;
  }
  
  protected void d(Intent paramIntent)
  {
    super.d(paramIntent);
    StartupTracker.a(null, "AIO_updateSession_business");
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b.length() == 0))
    {
      paramIntent = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (paramIntent != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b = troopcode;
      }
    }
    dA = 2;
    StartupTracker.a("AIO_updateSession_business", null);
  }
  
  public void d(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) {}
    do
    {
      return;
      if (!((TroopInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36)).c(paramString))
      {
        b(false);
        return;
      }
      NearbyTroopMemMgr localNearbyTroopMemMgr = NearbyTroopMemMgr.a(paramString);
      if (localNearbyTroopMemMgr.a())
      {
        if (NetworkUtil.g(jdField_a_of_type_AndroidSupportV4AppFragmentActivity))
        {
          ThreadManager.b().postDelayed(new lmg(this, localNearbyTroopMemMgr, paramString), 5000L);
          return;
        }
        b(false);
        return;
      }
      paramString = ab;
    } while (paramString == null);
    b(paramString.size());
  }
  
  protected boolean d()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a();
    }
    if ((jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null) && (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a()))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.TroopChatPie", 2, "troopChatPie_onBackEvent 1");
      }
      return true;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar.a();
    }
    return super.d();
  }
  
  protected void e()
  {
    super.e();
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper = new TroopCardAppInfoHelper(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getBooleanExtra("PhotoConst.IS_JUMPTO_TROOP_ALBUM", false)) {
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent());
    }
    N = true;
  }
  
  public void e(int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder != null) && (!jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder.b()) && (!jdField_a_of_type_MqqOsMqqHandler.hasMessages(16711686)))
    {
      jdField_a_of_type_MqqOsMqqHandler.removeMessages(16711688);
      jdField_a_of_type_MqqOsMqqHandler.removeMessages(16711686);
      jdField_a_of_type_MqqOsMqqHandler.removeMessages(16711687);
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.TroopChatPie", 2, "stopRecord() is called,time is:" + System.currentTimeMillis());
      }
      v = paramInt;
      if (!O) {
        break label133;
      }
      jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder.c();
      AudioUtil.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), false);
      c(true);
    }
    label133:
    while (jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder == null) {
      return;
    }
    Message localMessage = jdField_a_of_type_MqqOsMqqHandler.obtainMessage(16711686);
    jdField_a_of_type_MqqOsMqqHandler.sendMessageDelayed(localMessage, 200L);
  }
  
  public void e(ChatMessage paramChatMessage)
  {
    super.e(paramChatMessage);
    paramChatMessage = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if ((paramChatMessage != null) && (paramChatMessage.hasOrgs()))
    {
      if (jdField_i_of_type_AndroidWidgetImageView == null)
      {
        jdField_i_of_type_AndroidWidgetImageView = new ImageView(jdField_a_of_type_AndroidContentContext);
        jdField_i_of_type_AndroidWidgetImageView.setId(2131296349);
        int k = jdField_a_of_type_AndroidContentContext.getApplicationContext().getResources().getDimensionPixelSize(2131492908) - 5;
        paramChatMessage = new RelativeLayout.LayoutParams(k, k);
        paramChatMessage.addRule(12);
        paramChatMessage.addRule(14);
        jdField_i_of_type_AndroidWidgetImageView.setLayoutParams(paramChatMessage);
        jdField_i_of_type_AndroidWidgetImageView.setPadding(k / 5, k / 5, k / 5, k / 5);
        jdField_i_of_type_AndroidWidgetImageView.setOnClickListener(this);
        paramChatMessage = new StateListDrawable();
        Drawable localDrawable = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839644);
        paramChatMessage.addState(new int[] { 16842919 }, localDrawable);
        localDrawable = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839644);
        paramChatMessage.addState(new int[] { 16842910 }, localDrawable);
        jdField_i_of_type_AndroidWidgetImageView.setImageDrawable(paramChatMessage);
        ((RelativeLayout)jdField_d_of_type_AndroidViewViewGroup.findViewById(2131297340)).addView(jdField_i_of_type_AndroidWidgetImageView);
        jdField_i_of_type_AndroidWidgetImageView.setContentDescription("选中消息通过短信发送，按钮");
      }
      jdField_i_of_type_AndroidWidgetImageView.setVisibility(0);
    }
  }
  
  protected void e(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (jdField_c_of_type_AndroidWidgetTextView == null) || (jdField_c_of_type_AndroidWidgetTextView.getVisibility() == 8) || (jdField_b_of_type_AndroidViewViewGroup == null)) {
      return;
    }
    jdField_b_of_type_AndroidViewViewGroup.setOnClickListener(jdField_b_of_type_AndroidViewView$OnClickListener);
    if (jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable == null)
    {
      jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable = ((AnimationDrawable)jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDrawable(2130839618));
      Drawable localDrawable = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDrawable(2130842908);
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable, null, localDrawable, null);
      jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable.start();
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(46, 5000L);
    }
    jdField_c_of_type_AndroidWidgetTextView.setText(paramString);
    jdField_c_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428171));
  }
  
  public void e(boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) {}
    while (((jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 0) && (!paramBoolean)) || (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) || (!jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a())) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.b();
  }
  
  protected void f()
  {
    super.f();
    if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.d()) && (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a() == 9)) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar = new TroopAssistTipsBar(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar);
  }
  
  protected void h(Intent paramIntent)
  {
    if (paramIntent.getBooleanExtra("PhotoConst.IS_JUMPTO_TROOP_ALBUM", false)) {
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, paramIntent);
    }
    super.h(paramIntent);
    if (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver != null)
    {
      TroopFileError.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver);
      jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver = null;
    }
    paramIntent = new lmn(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver = new TroopFileError.TroopFileErrorObserver(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, paramIntent, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    TroopFileError.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return super.handleMessage(paramMessage);
      if ((jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow != null) && (jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.isShowing())) {
        jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.dismiss();
      }
      jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow = new TroopNewGuidePopWindow(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      int[] arrayOfInt1 = new int[2];
      jdField_b_of_type_AndroidViewViewGroup.getLocationOnScreen(arrayOfInt1);
      int k = a();
      int[] arrayOfInt2 = new int[2];
      jdField_a_of_type_ComTencentWidgetXEditTextEx.getLocationInWindow(arrayOfInt2);
      int m = arrayOfInt2[1];
      int n = arrayOfInt1[1];
      jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.a(k, m - n);
      jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.a(1);
      continue;
      if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) {
        jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = new TroopFeedsCenterLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_c_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips, K);
      }
      jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a(false, true);
      continue;
      if ((jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable != null) && (jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable.isRunning()))
      {
        jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable.stop();
        continue;
        if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) && (jdField_a_of_type_AndroidSupportV4AppFragmentActivity != null)) {
          if (arg1 == 1)
          {
            jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.j();
          }
          else
          {
            jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 2130839463, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131365125), new lkt(this));
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_work", "", "edit_data", "exp_blue", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0", "", "");
            continue;
            if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) && (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.b()) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))) {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
            }
          }
        }
      }
    }
  }
  
  protected void i(Intent paramIntent)
  {
    int m = 0;
    Object localObject1 = paramIntent.getExtras();
    Object localObject2 = paramIntent.getStringExtra("uin");
    int k = paramIntent.getIntExtra("uintype", -1);
    boolean bool = paramIntent.getBooleanExtra("isNeedUpdate", false);
    if ((!((String)localObject2).equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != k)) {}
    for (B = false; (!B) || (((Bundle)localObject1).containsKey("forward_type")); B = true)
    {
      c(paramIntent);
      return;
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (paramIntent.getExtras().containsKey("video_play_url")))
    {
      localObject1 = paramIntent.getStringExtra("video_play_url");
      long l = paramIntent.getLongExtra("video_play_msg", 0L);
      k = m;
      if (paramIntent.getBooleanExtra("video_play_feed", false))
      {
        k = m;
        if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null)
        {
          if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic == null) {
            jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = new VideoPlayLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_AndroidWidgetLinearLayout, jdField_a_of_type_ComTencentMobileqqTroopWidgetMediaControllerX$MediaControllerListener);
          }
          jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
          if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
            jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.f();
          }
          jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a((String)localObject1, null, jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a);
          return;
        }
      }
      do
      {
        k += 1;
        if (k >= jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount()) {
          break;
        }
      } while (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getItemId(k) != l);
    }
    for (;;)
    {
      m = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.s();
      int n = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getChildCount();
      if ((k < m) || (k > n + m - 1)) {
        break;
      }
      paramIntent = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getChildAt(k - m);
      if (paramIntent == null) {
        break;
      }
      localObject2 = (ChatMessage)jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getItem(k);
      if ((localObject2 == null) || (!(localObject2 instanceof MessageForStructing))) {
        break;
      }
      localObject2 = (MessageForStructing)localObject2;
      if ((structingMsg == null) || (!(structingMsg instanceof StructMsgForGeneralShare))) {
        break;
      }
      localObject2 = (StructMsgForGeneralShare)structingMsg;
      if (localObject2 == null) {
        break;
      }
      if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic == null) {
        jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = new VideoPlayLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_AndroidWidgetLinearLayout, jdField_a_of_type_ComTencentMobileqqTroopWidgetMediaControllerX$MediaControllerListener);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.f();
      }
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a((String)localObject1, (StructMsgForGeneralShare)localObject2, paramIntent);
      return;
      if ((jdField_h_of_type_Int != 0) || (bool))
      {
        a(true, false);
        return;
      }
      if (((Bundle)localObject1).getLong("res_share_id", 0L) <= 0L) {
        break;
      }
      a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, null, paramIntent);
      return;
      k = -1;
    }
  }
  
  public void i(boolean paramBoolean)
  {
    if (((a() instanceof SplashActivity)) && (SplashActivity.c != 2)) {}
    TroopGiftManager localTroopGiftManager;
    do
    {
      return;
      localTroopGiftManager = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
    } while (localTroopGiftManager == null);
    localTroopGiftManager.a(this);
    if (paramBoolean) {
      localTroopGiftManager.a();
    }
    if (QLog.isColorLevel()) {
      QLog.d(".troop.send_gift", 2, "playTroopGiftAnimationPlayList");
    }
    jdField_a_of_type_MqqOsMqqHandler.post(new lkq(this));
  }
  
  public void j(boolean paramBoolean)
  {
    if (ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()) == null) {
      jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper$IGetAppInfoCB);
    }
    do
    {
      do
      {
        do
        {
          return;
          if (-1 != ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).intValue()) {
            break;
          }
        } while (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null);
        jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.e(true);
      } while (!paramBoolean);
      jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a(1005);
      return;
    } while (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null);
    jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.e(false);
  }
  
  public void k(Intent paramIntent)
  {
    int k = 0;
    String str;
    long l;
    if (paramIntent.getExtras().containsKey("video_play_url"))
    {
      str = paramIntent.getStringExtra("video_play_url");
      l = paramIntent.getLongExtra("video_play_msg", 0L);
      if ((paramIntent.getBooleanExtra("video_play_feed", false)) && (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null))
      {
        if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic == null) {
          jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = new VideoPlayLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_AndroidWidgetLinearLayout, jdField_a_of_type_ComTencentMobileqqTroopWidgetMediaControllerX$MediaControllerListener);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
        if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
          jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.f();
        }
        jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a(str, null, jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a);
      }
    }
    else
    {
      return;
    }
    label137:
    if (k < jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount()) {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getItemId(k) != l) {}
    }
    for (;;)
    {
      int m = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.s();
      int n = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getChildCount();
      if ((k < m) || (k > n + m - 1)) {
        break;
      }
      paramIntent = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getChildAt(k - m);
      if (paramIntent == null) {
        break;
      }
      Object localObject = (ChatMessage)jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getItem(k);
      if ((localObject == null) || (!(localObject instanceof MessageForStructing))) {
        break;
      }
      localObject = (MessageForStructing)localObject;
      if ((structingMsg == null) || (!(structingMsg instanceof StructMsgForGeneralShare))) {
        break;
      }
      localObject = (StructMsgForGeneralShare)structingMsg;
      if (localObject == null) {
        break;
      }
      if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic == null) {
        jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = new VideoPlayLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_AndroidWidgetLinearLayout, jdField_a_of_type_ComTencentMobileqqTroopWidgetMediaControllerX$MediaControllerListener);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.f();
      }
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a(str, (StructMsgForGeneralShare)localObject, paramIntent);
      return;
      k += 1;
      break label137;
      k = -1;
    }
  }
  
  public void k(boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.a(paramBoolean, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    }
    K = paramBoolean;
    AnonymousChatHelper.a().a(paramBoolean, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    RelativeLayout.LayoutParams localLayoutParams;
    if (jdField_g_of_type_AndroidViewView == null)
    {
      jdField_g_of_type_AndroidViewView = new View(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      jdField_g_of_type_AndroidViewView.setBackgroundColor(Color.rgb(19, 19, 21));
      jdField_g_of_type_AndroidViewView.setVisibility(8);
      localLayoutParams = new RelativeLayout.LayoutParams(-1, 1);
      localLayoutParams.addRule(12, -1);
      jdField_a_of_type_AndroidViewViewGroup.addView(jdField_g_of_type_AndroidViewView, localLayoutParams);
    }
    if (jdField_j_of_type_AndroidViewView == null)
    {
      jdField_j_of_type_AndroidViewView = new View(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      jdField_j_of_type_AndroidViewView.setBackgroundResource(2130839527);
      jdField_j_of_type_AndroidViewView.setVisibility(8);
      localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
      jdField_j_of_type_AndroidViewView.setLayoutParams(localLayoutParams);
      jdField_a_of_type_AndroidViewViewGroup.addView(jdField_j_of_type_AndroidViewView, 0);
    }
    if (jdField_i_of_type_AndroidViewView == null)
    {
      jdField_i_of_type_AndroidViewView = new View(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      jdField_i_of_type_AndroidViewView.setBackgroundResource(2130839527);
      jdField_i_of_type_AndroidViewView.setVisibility(8);
      localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
      jdField_i_of_type_AndroidViewView.setLayoutParams(localLayoutParams);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_i_of_type_AndroidViewView, 0);
    }
    if (jdField_h_of_type_AndroidViewView == null)
    {
      jdField_h_of_type_AndroidViewView = new View(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      jdField_h_of_type_AndroidViewView.setBackgroundColor(Color.rgb(19, 19, 21));
      jdField_h_of_type_AndroidViewView.setVisibility(8);
      localLayoutParams = new RelativeLayout.LayoutParams(-1, 1);
      localLayoutParams.addRule(2, 2131297342);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_h_of_type_AndroidViewView, localLayoutParams);
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null) {
      jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a(paramBoolean);
    }
    if (paramBoolean)
    {
      a(-16777216, false);
      jdField_i_of_type_Int = 2130839520;
      jdField_j_of_type_Int = 2130839519;
      jdField_a_of_type_AndroidWidgetLinearLayout.getBackground().setVisible(true, false);
      jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131297343).setVisibility(8);
      jdField_a_of_type_AndroidWidgetLinearLayout.setBackgroundResource(2130839527);
      if (jdField_a_of_type_ComTencentWidgetXEditTextEx != null)
      {
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setBackgroundResource(2130839539);
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setTextColor(-16777216);
      }
      jdField_b_of_type_AndroidWidgetTextView.setTextColor(AnonymousChatHelper.c);
      jdField_a_of_type_AndroidWidgetTextView.setBackgroundResource(2130839545);
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(AnonymousChatHelper.c);
      if (jdField_c_of_type_AndroidWidgetTextView.getVisibility() == 0) {
        jdField_a_of_type_JavaLangCharSequence = jdField_c_of_type_AndroidWidgetTextView.getText();
      }
      jdField_b_of_type_AndroidViewViewGroup.setOnClickListener(null);
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
      jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131364804) + aajdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).jdField_a_of_type_JavaLangString);
      jdField_c_of_type_AndroidWidgetTextView.setTextColor(AnonymousChatHelper.c);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(null);
      b(true);
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a.jdField_a_of_type_Boolean = true;
        jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a();
      }
      if (jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel != null) {
        jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel.a(true);
      }
      jdField_h_of_type_AndroidViewView.setVisibility(0);
      jdField_a_of_type_ComTencentBizAnonymousAnonymousChatHelper$AnonymousStatusListener = new llw(this);
      AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentBizAnonymousAnonymousChatHelper$AnonymousStatusListener);
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
      if (jdField_a_of_type_ComTencentWidgetXEditTextEx != null)
      {
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint(2131364822);
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setShadowLayer(0.0F, 0.0F, 0.0F, 0);
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setBackgroundColor(-16777216);
        if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 8) {
          jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setSelected(8);
        }
      }
    }
    for (;;)
    {
      o();
      l();
      jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.notifyDataSetChanged();
      return;
      aI();
    }
  }
  
  public void l()
  {
    ThreadManager.a(new lmi(this), 8, null, true);
  }
  
  public void l(Intent paramIntent)
  {
    if (paramIntent.getExtras().containsKey("video_play_url"))
    {
      paramIntent = paramIntent.getStringExtra("video_play_url");
      if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic == null) {
        jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = new VideoPlayLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_AndroidWidgetLinearLayout, jdField_a_of_type_ComTencentMobileqqTroopWidgetMediaControllerX$MediaControllerListener);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.f();
      }
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a(paramIntent, null, null);
    }
  }
  
  public void m()
  {
    Object localObject1 = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    Intent localIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, ChatSettingForTroop.class);
    localIntent.putExtra("troop_code", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    localIntent.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("vistor_type", 1);
    Object localObject2;
    int k;
    if ((jdField_b_of_type_AndroidWidgetImageView != null) && (jdField_b_of_type_AndroidWidgetImageView.getVisibility() == 0))
    {
      if (localObject1 == null) {
        break label235;
      }
      localObject1 = ((TroopManager)localObject1).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (localObject1 == null) {
        break label235;
      }
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      if ((TextUtils.isEmpty((CharSequence)localObject2)) || (TextUtils.isEmpty(Administrator))) {
        break label235;
      }
      if ((!((String)localObject2).equals(Administrator)) && (!Administrator.contains((CharSequence)localObject2))) {
        break label223;
      }
      k = 1;
    }
    for (;;)
    {
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
      if (k != 0) {}
      for (localObject1 = "0";; localObject1 = "1")
      {
        ReportController.b((QQAppInterface)localObject2, "P_CliOper", "Grp_set", "", "AIOchat", "Clk_dataEntry_new", 0, 0, str, (String)localObject1, "", "");
        jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(localIntent, 2000);
        return;
        label223:
        k = 0;
        break;
      }
      label235:
      k = 0;
    }
  }
  
  protected void m(int paramInt)
  {
    if (!K) {
      super.m(paramInt);
    }
  }
  
  protected void o()
  {
    if (K)
    {
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130839542);
      return;
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130842628);
  }
  
  public void onClick(View paramView)
  {
    if ((paramView.getId() == 2131297346) && (c(true))) {}
    do
    {
      return;
      super.onClick(paramView);
      if ((paramView.getId() == 2131296333) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTroopAssistTipsBar.a()))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
        TroopAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      }
    } while (paramView.getId() != 2131296349);
    new ArrayList();
    paramView = new ArrayList();
    HashMap localHashMap = aa;
    Iterator localIterator = localHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (((Boolean)localHashMap.get(localEntry.getKey())).booleanValue()) {
        paramView.add((ChatMessage)localEntry.getKey());
      }
    }
    if (paramView.size() == 0)
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 2131367395, 0).b(a());
      return;
    }
    if (TroopOrgProxyActivity.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), paramView, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 0, this)) {
      a(false, null, false);
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_work", "", "function", "Clk_more_msg", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    TroopInfo localTroopInfo;
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b.length() != 0))
    {
      if ((paramInt3 != 1) || ((paramCharSequence.charAt(paramInt1) != '@') && (paramCharSequence.charAt(paramInt1) != 65312)) || (n)) {
        break label281;
      }
      localTroopInfo = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (localTroopInfo != null)
      {
        paramCharSequence = TroopMemberListActivity.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, troopuin, 3);
        paramCharSequence.putExtra("param_is_pop_up_style", true);
        paramCharSequence.setFlags(603979776);
        if (!K) {
          break label235;
        }
        paramCharSequence.putExtra("param_chat_mode", 1);
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(paramCharSequence, 6001);
      String str1 = "2";
      try
      {
        String str2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        if ((troopowneruin != null) && (troopowneruin.equals(str2)))
        {
          paramCharSequence = "0";
          label198:
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_mber", "", "mber_list", "Clk_mberlist", 0, 0, troopuin, "2", paramCharSequence, "");
        }
        label235:
        label281:
        label420:
        label584:
        do
        {
          do
          {
            do
            {
              return;
              paramCharSequence.putExtra("param_chat_mode", 0);
              break;
              paramCharSequence = str1;
              if (Administrator == null) {
                break label198;
              }
              paramCharSequence = str1;
              if (!Administrator.contains(str2)) {
                break label198;
              }
              paramCharSequence = "1";
              break label198;
              if ((paramInt3 != 1) || ((paramCharSequence.charAt(paramInt1) != '$') && (paramCharSequence.charAt(paramInt1) != 65509) && (paramCharSequence.charAt(paramInt1) != '¥') && (paramCharSequence.charAt(paramInt1) != 65284)) || (n)) {
                break label584;
              }
              paramInt2 = 0;
              for (;;)
              {
                if (paramInt2 >= paramCharSequence.length()) {
                  break label420;
                }
                if ((paramInt2 != paramInt1) && ((paramCharSequence.charAt(paramInt2) == '$') || (paramCharSequence.charAt(paramInt2) == 65509) || (paramCharSequence.charAt(paramInt2) == '¥') || (paramCharSequence.charAt(paramInt2) == 65284))) {
                  break;
                }
                paramInt2 += 1;
              }
              paramCharSequence = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
            } while ((paramCharSequence == null) || (!TroopInfo.hasPayPrivilege(troopPrivilegeFlag, 32)));
            if (paramCharSequence.isTroopOwner(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {
              paramInt1 = 0;
            }
            for (;;)
            {
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_flower", "", "grp_aio", "sign", 0, 0, troopuin + "", paramInt1 + "", "", "");
              TroopGiftUtil.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, troopuin, "input", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
              return;
              if (paramCharSequence.isAdmin()) {
                paramInt1 = 1;
              } else {
                paramInt1 = 2;
              }
            }
          } while ((paramInt1 != 0) || (paramInt3 != 1) || (paramCharSequence.length() != 1) || ((paramCharSequence.charAt(0) != '#') && (paramCharSequence.charAt(0) != 65283)) || (n) || ((K) && (AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) || ((jdField_a_of_type_ComTencentWidgetXEditTextEx.getTag(2131296521) != null) && (jdField_a_of_type_ComTencentMobileqqDataMessageForReplyText$SourceMsgInfo != null)));
          if (QLog.isColorLevel())
          {
            QLog.d("Q.aio.TroopChatPie", 2, "input # ---------------");
            QLog.d("Q.aio.TroopChatPie", 2, "s = " + paramCharSequence + ", start = " + paramInt1 + ", before = " + paramInt2 + ", count = " + paramInt3);
          }
          paramCharSequence = (TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97);
        } while (paramCharSequence == null);
        TroopBarUtils.a.clear();
        paramCharSequence.a(this, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "dc00899", "Grp_talk", "", "pub_talk", "Clk_call", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
        return;
      }
      catch (Exception paramCharSequence) {}
    }
  }
  
  protected void q()
  {
    String str = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = str;
  }
  
  void q(int paramInt)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    switch (paramInt)
    {
    default: 
      localObject1 = localObject2;
    }
    for (;;)
    {
      if (localObject1 != null) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_AIO", "", "AIOshortcut", "Clk_shortcut", 0, 0, (String)localObject1, "", "", "");
      }
      return;
      localObject1 = "1";
      continue;
      localObject1 = "2";
      continue;
      localObject1 = "3";
      continue;
      localObject1 = "4";
      continue;
      localObject1 = "5";
      continue;
      localObject1 = "7";
    }
  }
  
  public void r(int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) == 3)) {
      ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramInt);
    }
  }
  
  public boolean t()
  {
    return false;
  }
  
  protected void u()
  {
    if (C)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.TroopChatPie", 2, "hasDestory = true return");
      }
      return;
    }
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacksAndMessages(null);
    if (jdField_a_of_type_AndroidOsHandler != null) {
      jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_b_of_type_JavaLangRunnable);
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView != null)
    {
      jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView.a();
      jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView = null;
    }
    if (jdField_b_of_type_AndroidOsHandler != null) {
      jdField_b_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null)
    {
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.f();
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.j();
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic = null;
      ChatFragment.a(false, a());
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a();
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null)
    {
      jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.e();
      jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = null;
    }
    if (jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog != null)
    {
      jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog.dismiss();
      jdField_a_of_type_ComTencentBizAnonymousQQAnonymousDialog = null;
    }
    if (jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper != null) {
      jdField_a_of_type_ComTencentBizHelperTroopCardAppInfoHelper.a();
    }
    if (jdField_a_of_type_ComTencentWidgetXEditTextEx != null)
    {
      if (Build.VERSION.SDK_INT >= 16) {
        break label453;
      }
      jdField_a_of_type_ComTencentWidgetXEditTextEx.getViewTreeObserver().removeGlobalOnLayoutListener(jdField_a_of_type_AndroidViewViewTreeObserver$OnGlobalLayoutListener);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidViewViewTreeObserver$OnGlobalLayoutListener = null;
      AnonymousChatHelper.a().b();
      TroopMemberLbsHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      NearbyTroopMemMgr.a();
      if (K) {
        a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131428205), true);
      }
      aB();
      if (jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable != null)
      {
        if (jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable.isRunning()) {
          jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable.stop();
        }
        jdField_a_of_type_AndroidGraphicsDrawableAnimationDrawable = null;
      }
      TroopGiftMsgItemBuilder.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow != null)
      {
        jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.dismiss();
        jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow = null;
      }
      ((TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      ((TroopAioADManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(132)).deleteObserver(this);
      TroopBindPublicAccountMgr localTroopBindPublicAccountMgr = (TroopBindPublicAccountMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(131);
      localTroopBindPublicAccountMgr.e("");
      if (localTroopBindPublicAccountMgr.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
        localTroopBindPublicAccountMgr.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      }
      r(0);
      dA = 0;
      P = false;
      R = false;
      S = false;
      TroopUsageTimeReport.a().d();
      TroopUsageTimeReport.a().e();
      super.u();
      return;
      label453:
      jdField_a_of_type_ComTencentWidgetXEditTextEx.getViewTreeObserver().removeOnGlobalLayoutListener(jdField_a_of_type_AndroidViewViewTreeObserver$OnGlobalLayoutListener);
    }
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    super.update(paramObservable, paramObject);
    if (paramObject == null) {
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod != null)
      {
        if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.d == TroopMessageManager.UserActionStateInParallelPullPeriod.c) && (jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.a != null)) {
          a(jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.a.c, jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.a.a(), jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.a.d, null);
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.TroopChatPie.trooptroop_pull_msg", 2, "update,mUserActionState.actionType" + jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod.d);
        }
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopMessageManager$UserActionStateInParallelPullPeriod = null;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().deleteObservers();
      }
    }
    label461:
    label496:
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
                if (!(paramObject instanceof MessageRecord)) {
                  break label496;
                }
                if (!(paramObject instanceof ChatMessage)) {
                  break;
                }
                paramObservable = (MessageRecord)paramObject;
              } while ((paramObservable.isSendFromLocal()) || (!jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(frienduin)) || ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != istroop) && ((!MsgProxyUtils.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) || (!MsgProxyUtils.c(istroop)))) || (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isResume()));
              QQMessageFacade.Message localMessage;
              if ((!SystemMsg.isTroopSystemMessage(msgtype)) && (msgtype != 64523) && (msgtype != 63506) && (msgtype != 64489) && (!"1000000".equalsIgnoreCase(senderuin)) && (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null))
              {
                localMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop);
                if (uniseq == uniseq)
                {
                  paramObservable = nickName;
                  if ((selfuin == null) || (!selfuin.equals(senderuin))) {
                    break label461;
                  }
                  paramObservable = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b();
                }
              }
              for (;;)
              {
                Object localObject = paramObservable;
                if (paramObservable != null)
                {
                  localObject = paramObservable;
                  if (paramObservable.length() > 12) {
                    localObject = paramObservable.substring(0, 11) + "...";
                  }
                }
                paramObservable = new MsgSummary();
                MsgUtils.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessage, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramObservable, (String)localObject, true, false);
                paramObservable = paramObservable.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
                jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.a((CharSequence)localObject, paramObservable);
                if (!(paramObject instanceof MessageForDeliverGiftTips)) {
                  break;
                }
                i(false);
                return;
                if (AnonymousChatHelper.a(localMessage)) {
                  paramObservable = ab;
                }
              }
            } while (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic == null);
            jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.g();
            return;
            if (!(paramObject instanceof TroopAioAgent.Message)) {
              break;
            }
            paramObservable = (TroopAioAgent.Message)paramObject;
          } while (paramObservable == null);
          if (jdField_a_of_type_Int == TroopAioAgent.jdField_a_of_type_Int)
          {
            a(c, paramObservable.a(), d, null);
            return;
          }
          if (jdField_a_of_type_Int != TroopAioAgent.b) {
            break;
          }
        } while (jdField_c_of_type_AndroidViewView == null);
        ((RelativeLayout.LayoutParams)jdField_c_of_type_AndroidViewView.getLayoutParams()).addRule(2, b);
        return;
      } while (jdField_a_of_type_Int != TroopAioAgent.c);
      paramObservable = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, TroopPrivateSettingActivity.class);
      paramObservable.putExtra("troop_code", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
      paramObservable.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      paramObservable.putExtra("vistor_type", 1);
      paramObservable.putExtra("selection", 3);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(paramObservable, 2000);
      return;
    } while (!(paramObject instanceof Integer));
    switch (((Integer)paramObject).intValue())
    {
    default: 
      return;
    }
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(32);
  }
  
  protected boolean v()
  {
    boolean bool = false;
    Object localObject = (TroopInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36);
    for (;;)
    {
      try
      {
        localObject = ((TroopInfoManager)localObject).a(Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), true);
        if (localObject != null)
        {
          localObject = ((TroopFeedsDataManager)localObject).a();
          bool = ((LinkedHashMap)localObject).isEmpty();
          if (bool) {
            continue;
          }
          bool = true;
          if (!bool) {}
        }
      }
      catch (NumberFormatException localNumberFormatException1)
      {
        bool = false;
      }
      try
      {
        if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null) {
          jdField_a_of_type_MqqOsMqqHandler.post(new llr(this));
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.TroopChatPie.troop.notification_center.auto_pull_down", 2, "autoPullDownFlags:" + ((LinkedHashMap)localObject).toString());
        }
        return bool;
      }
      catch (NumberFormatException localNumberFormatException2)
      {
        for (;;) {}
      }
      bool = false;
    }
    if (QLog.isColorLevel()) {
      QLog.e("Q.aio.TroopChatPie", 2, "handleTroopNotificationCenterAutoPullDownLogic, NumberFormatException");
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "BizTechReport", ".troop.notification_center", ".troop.notification_center.auto_pull_down", "", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
    return bool;
  }
  
  boolean w()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.TroopChatPie", 2, "handleTroopNotificationMsg");
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) {
      jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = new TroopFeedsCenterLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_c_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips, K);
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) && (TroopNotificationHelper.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (!TroopNotificationHelper.d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
    {
      lls localLls = new lls(this);
      ThreadManager.b().post(localLls);
      return true;
    }
    return false;
  }
  
  protected void x()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver != null)
    {
      TroopFileError.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver);
      jdField_a_of_type_ComTencentMobileqqTroopUtilsTroopFileError$TroopFileErrorObserver = null;
    }
    Object localObject = (TroopInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36);
    if (localObject != null)
    {
      ((TroopInfoManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 0);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    }
    if ((jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow == null) || (!jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.isShowing()))
    {
      localObject = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
      if (localObject != null) {
        ((TroopGiftManager)localObject).b();
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController != null) {
      jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController.c();
    }
    if (jdField_a_of_type_AndroidWidgetToast != null) {
      jdField_a_of_type_AndroidWidgetToast.cancel();
    }
    aN();
    TroopUsageTimeReport.a().c();
    super.x();
  }
  
  public boolean x()
  {
    return C;
  }
  
  protected void y()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController != null) {
      jdField_a_of_type_ComTencentMobileqqTroopgiftTroopGiftAnimationController.c();
    }
    if (jdField_a_of_type_AndroidWidgetToast != null) {
      jdField_a_of_type_AndroidWidgetToast.cancel();
    }
    super.y();
    if (jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView != null) {
      jdField_a_of_type_ComTencentMobileqqTroopWidgetFloatView.setVisibility(8);
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic != null) {
      jdField_a_of_type_ComTencentMobileqqTroopLogicVideoPlayLogic.c();
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.h();
    }
    if ((jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow == null) || (!jdField_a_of_type_ComTencentBizTroopFeedsTroopNewGuidePopWindow.isShowing()))
    {
      localTroopGiftManager = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
      if (localTroopGiftManager != null) {
        localTroopGiftManager.b();
      }
    }
    TroopGiftManager localTroopGiftManager = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
    if (localTroopGiftManager != null) {
      localTroopGiftManager.b();
    }
  }
  
  protected void z()
  {
    super.z();
    if (K)
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.setBackgroundResource(2130839527);
      AnonymousChatHelper.a().a(jdField_a_of_type_ComTencentBizAnonymousAnonymousChatHelper$AnonymousStatusListener);
      a(-16777216, false);
    }
    aC();
  }
}
