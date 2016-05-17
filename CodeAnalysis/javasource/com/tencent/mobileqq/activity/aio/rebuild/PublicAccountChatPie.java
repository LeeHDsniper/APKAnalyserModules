package com.tencent.mobileqq.activity.aio.rebuild;

import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.PorterDuff.Mode;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.hardware.SensorManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.bitapp.BitAppAbilityUtils;
import com.tencent.bitapp.BitAppMsg;
import com.tencent.bitapp.BitAppMsgFactory;
import com.tencent.bitapp.BitAppMsgItemBuilder;
import com.tencent.bitapp.BitAppMsgNode;
import com.tencent.bitapp.MessageForBitApp;
import com.tencent.biz.common.offline.HtmlOffline;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.biz.pubaccount.PublicAccountServlet;
import com.tencent.biz.pubaccount.assistant.PubAccountAssistantManager;
import com.tencent.biz.pubaccount.assistant.PubAccountTipsManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopHandler;
import com.tencent.biz.pubaccount.ecshopassit.EcShopObserver;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.biz.pubaccount.util.PAReportUtil;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.biz.ui.CustomMenuBar;
import com.tencent.biz.ui.MenuItem;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOInputTypeHelper;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.ChatContext;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.item.ItemBuilderFactory;
import com.tencent.mobileqq.activity.aio.item.PAWeatherItemBuilder;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder.DynamicMsgViewCache;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.tips.PubAccountAssistantTipsBar;
import com.tencent.mobileqq.activity.aio.tips.ReaderTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.DynamicMsgInfoManager;
import com.tencent.mobileqq.app.EnterpriseQQHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.app.message.QQMessageFacade.RefreshMessageContext;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.data.AccountDetail;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.emoticonview.FastImagePreviewLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mp.mobileqq_mp.ButtonInfo;
import com.tencent.mobileqq.mp.mobileqq_mp.FollowRequest;
import com.tencent.mobileqq.mp.mobileqq_mp.GetPublicAccountDetailInfoRequest;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.StructMsgForGeneralShare;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.StructLongMessageDownloadProcessor;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.troop.data.TroopEntranceBar;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.vashealth.StepCounterServlert;
import com.tencent.mobileqq.webprocess.WebProcessManager;
import com.tencent.mobileqq.widget.PublicMenuBar;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.AbsListView;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.ListView;
import com.tencent.widget.PatchedButton;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;
import com.tencent.widget.immersive.SystemBarCompact;
import cooperation.comic.PluginPreloader;
import cooperation.comic.QQComicPreloadManager;
import cooperation.huangye.C2BUtils;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Observable;
import java.util.concurrent.atomic.AtomicBoolean;
import lik;
import lip;
import liq;
import lir;
import lis;
import lit;
import liv;
import liw;
import lix;
import liy;
import liz;
import lja;
import ljb;
import ljc;
import ljd;
import ljf;
import ljg;
import ljh;
import lji;
import ljj;
import ljk;
import ljl;
import ljn;
import ljo;
import ljq;
import ljr;
import ljs;
import ljt;
import lju;
import ljv;
import ljw;
import ljx;
import ljy;
import ljz;
import lkc;
import lkd;
import lkf;
import lkg;
import lkh;
import lki;
import lkk;
import lkl;
import lkm;
import mqq.app.MobileQQ;
import mqq.app.NewIntent;
import mqq.observer.BusinessObserver;
import mqq.os.MqqHandler;
import org.json.JSONObject;

public class PublicAccountChatPie
  extends BaseChatPie
{
  public static final String ae = "shouldreport";
  public static final String af = "strurt_msgid";
  public static final String ag = "struct_uin";
  public static final String ah = "from_web";
  public static final String ai = "struct_url";
  public static final String aj = "StructingMsgItemBuildertime";
  public static final String ak = "source_puin";
  private static final String an = "2632129500";
  private static final String ao = "3105932915";
  private static final int dA = 4;
  private static final int dB = 6;
  private static final int dC = 7;
  private static final int dD = 8;
  private static final int dE = 9;
  private static final int dF = 0;
  private static final int dG = 1;
  private static final int dH = 2;
  private static final int dI = 3;
  private static final int dJ = 4;
  private static final int dK = 5;
  public static final int ds = 1001;
  private static final int dx = 1;
  private static final int dy = 2;
  private static final int dz = 3;
  public boolean G;
  public boolean H;
  public boolean I;
  public boolean J;
  public boolean K;
  public boolean L;
  public boolean M;
  public boolean N;
  public boolean O;
  public boolean P;
  boolean Q;
  public boolean R;
  public boolean S;
  public boolean T;
  boolean U;
  boolean V;
  boolean W;
  private boolean X;
  private boolean Y;
  private boolean Z;
  public Handler a;
  protected SpannableString a;
  private ProgressBar jdField_a_of_type_AndroidWidgetProgressBar;
  public PublicAccountManager a;
  PubAccountTipsManager jdField_a_of_type_ComTencentBizPubaccountAssistantPubAccountTipsManager;
  EcShopObserver jdField_a_of_type_ComTencentBizPubaccountEcshopassitEcShopObserver;
  public CustomMenuBar a;
  public StructingMsgItemBuilder.DynamicMsgViewCache a;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  protected MessageObserver a;
  public PublicAccountHandler a;
  public PublicAccountObserver a;
  private AccountDetail jdField_a_of_type_ComTencentMobileqqDataAccountDetail;
  public MessageForPic a;
  public PublicAccountInfo a;
  public AbsStructMsg a;
  public TroopEntranceBar a;
  private QQCustomDialog jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog;
  private PublicMenuBar jdField_a_of_type_ComTencentMobileqqWidgetPublicMenuBar;
  public ActionSheet a;
  public ArrayList a;
  private AtomicBoolean jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean;
  private NewIntent jdField_a_of_type_MqqAppNewIntent;
  BusinessObserver jdField_a_of_type_MqqObserverBusinessObserver;
  public int[] a;
  private boolean aa;
  private boolean ab;
  private boolean ac;
  public String al;
  public String am;
  private String ap;
  protected SpannableString b;
  private LinearLayout jdField_b_of_type_AndroidWidgetLinearLayout;
  public QQProgressDialog b;
  protected PatchedButton b;
  List jdField_b_of_type_JavaUtilList;
  private NewIntent jdField_b_of_type_MqqAppNewIntent;
  private BusinessObserver jdField_b_of_type_MqqObserverBusinessObserver;
  protected PatchedButton c;
  List jdField_c_of_type_JavaUtilList;
  private NewIntent jdField_c_of_type_MqqAppNewIntent;
  private int dL;
  private int dM;
  private int dN;
  private int dO;
  public int dt;
  public int du;
  public int dv;
  public int dw;
  private TextView f;
  long jdField_g_of_type_Long;
  public Dialog g;
  public View g;
  protected ImageView g;
  private TextView jdField_g_of_type_AndroidWidgetTextView;
  long h;
  public View h;
  protected ImageView h;
  long jdField_i_of_type_Long;
  private View jdField_i_of_type_AndroidViewView;
  public ImageView i;
  long jdField_j_of_type_Long;
  private View jdField_j_of_type_AndroidViewView;
  private ImageView jdField_j_of_type_AndroidWidgetImageView;
  private long jdField_k_of_type_Long;
  private View jdField_k_of_type_AndroidViewView;
  private ImageView jdField_k_of_type_AndroidWidgetImageView;
  private View l;
  
  public PublicAccountChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_MqqAppNewIntent = null;
    jdField_c_of_type_MqqAppNewIntent = null;
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = null;
    jdField_g_of_type_AndroidViewView = null;
    jdField_j_of_type_AndroidViewView = null;
    G = false;
    H = false;
    ap = "";
    dt = 0;
    al = "";
    am = "";
    du = -1;
    I = false;
    dv = 0;
    dw = 3;
    J = false;
    K = false;
    dN = 0;
    X = false;
    Y = false;
    Z = false;
    L = false;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
    aa = false;
    ab = false;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_g_of_type_Long = -1L;
    jdField_b_of_type_JavaUtilList = new ArrayList();
    jdField_c_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqActivityAioItemStructingMsgItemBuilder$DynamicMsgViewCache = null;
    M = false;
    N = false;
    jdField_h_of_type_Long = -1L;
    jdField_i_of_type_Long = -1L;
    O = false;
    jdField_k_of_type_Long = Long.MAX_VALUE;
    jdField_j_of_type_Long = 0L;
    P = false;
    jdField_h_of_type_AndroidViewView = null;
    jdField_a_of_type_AndroidOsHandler = new lik(this);
    jdField_b_of_type_MqqObserverBusinessObserver = new lja(this);
    Q = false;
    R = false;
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lip(this);
    jdField_l_of_type_AndroidViewView = null;
    dO = 0;
    S = false;
    T = false;
    ac = false;
    jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver = new lkc(this);
    jdField_a_of_type_MqqObserverBusinessObserver = new lkd(this);
    jdField_a_of_type_ComTencentBizPubaccountEcshopassitEcShopObserver = new lkf(this);
    U = false;
    V = false;
    W = false;
  }
  
  private void a(Editable paramEditable)
  {
    if ((paramEditable.length() > 0) && (jdField_a_of_type_ComTencentWidgetXEditTextEx.getLineCount() > 1)) {
      u(80);
    }
    while (!CustomMenuBar.a()) {
      return;
    }
    u(16);
  }
  
  private void a(View paramView, int paramInt1, int paramInt2, Animator.AnimatorListener paramAnimatorListener)
  {
    ValueAnimator localValueAnimator = ValueAnimator.ofInt(new int[] { 1, 100 });
    localValueAnimator.addUpdateListener(new liq(this, paramView, paramInt1, paramInt2));
    localValueAnimator.addListener(paramAnimatorListener);
    localValueAnimator.setDuration(500L).start();
  }
  
  private void a(RelativeLayout paramRelativeLayout)
  {
    SharedPreferences localSharedPreferences = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
    if (localSharedPreferences.getBoolean("firstIntoAIO", true))
    {
      LinearLayout localLinearLayout = new LinearLayout(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      localLinearLayout.setOrientation(1);
      localLinearLayout.setBackgroundColor(Color.parseColor("#B3000000"));
      localLinearLayout.setVisibility(0);
      localLinearLayout.setClickable(true);
      localLinearLayout.setOnClickListener(new ljy(this, paramRelativeLayout, localLinearLayout));
      Object localObject = new ImageView(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      ((ImageView)localObject).setImageResource(2130838613);
      LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
      Resources localResources = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources();
      width = AIOUtils.a(73.0F, localResources);
      height = AIOUtils.a(73.0F, localResources);
      topMargin = AIOUtils.a(100.0F, localResources);
      gravity = 17;
      ((ImageView)localObject).setLayoutParams(localLayoutParams);
      localLinearLayout.addView((View)localObject);
      localObject = new TextView(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      ((TextView)localObject).setText("下滑拉取更多消息");
      ((TextView)localObject).setTextSize(2, 18.0F);
      ((TextView)localObject).setTextColor(Color.parseColor("#ffffff"));
      localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
      gravity = 17;
      topMargin = AIOUtils.a(28.0F, localResources);
      ((TextView)localObject).setLayoutParams(localLayoutParams);
      localLinearLayout.addView((View)localObject);
      paramRelativeLayout.addView(localLinearLayout, new ViewGroup.LayoutParams(-1, -1));
      localSharedPreferences.edit().putBoolean("firstIntoAIO", false).commit();
    }
  }
  
  private void a(AccountDetail paramAccountDetail)
  {
    if (jdField_g_of_type_AndroidViewView == null) {
      return;
    }
    ((TextView)jdField_g_of_type_AndroidViewView.findViewById(2131296910)).setText(name);
    Object localObject = (TextView)jdField_g_of_type_AndroidViewView.findViewById(2131296911);
    if (al != null) {
      ((TextView)localObject).setText(al);
    }
    localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(ajdField_a_of_type_JavaLangString);
    ImageView localImageView = (ImageView)jdField_g_of_type_AndroidViewView.findViewById(2131296683);
    localImageView.setImageDrawable((Drawable)localObject);
    if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new ljs(this, localImageView);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.addObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    }
    localObject = (ImageView)jdField_g_of_type_AndroidViewView.findViewById(2131296687);
    if (certifiedGrade == 0)
    {
      ((ImageView)localObject).setVisibility(8);
      return;
    }
    ((ImageView)localObject).setVisibility(0);
  }
  
  private void a(MessageForStructing paramMessageForStructing)
  {
    int m = 0;
    if (structingMsg == null) {}
    for (;;)
    {
      return;
      jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg = structingMsg;
      ap = paramMessageForStructing.getExtInfoFromExtStr("msg_template_id");
      dt = structingMsg.mPromotionType;
      al = structingMsg.mPromotionMsg;
      am = structingMsg.mPromotionMenus;
      du = structingMsg.mPromotionMenuDestructiveIndex;
      try
      {
        if (am == null) {
          continue;
        }
        ac = false;
        paramMessageForStructing = am.split(",");
        if (paramMessageForStructing == null) {
          continue;
        }
        int n = paramMessageForStructing.length;
        jdField_a_of_type_ArrayOfInt = new int[n];
        while (m < n)
        {
          paramMessageForStructing[m] = paramMessageForStructing[m].trim();
          jdField_a_of_type_ArrayOfInt[m] = Integer.parseInt(paramMessageForStructing[m]);
          m += 1;
        }
        return;
      }
      catch (Exception paramMessageForStructing)
      {
        ac = true;
      }
    }
  }
  
  private void a(String paramString, int paramInt, Intent paramIntent)
  {
    if (paramIntent.getBooleanExtra("need_report", false))
    {
      PublicAccountHandler.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "Pb_account_lifeservice", "mp_msg_sys_6", "msg_push");
      long l1 = paramIntent.getLongExtra("incoming_msguid", 0L);
      long l2 = paramIntent.getLongExtra("incoming_shmsgseq", 0L);
      if (l1 > 0L) {
        ThreadManager.a(new ljk(this, paramString, paramInt, l1, l2), 5, null, true);
      }
    }
    if (paramIntent.hasExtra("need_report")) {
      paramIntent.removeExtra("need_report");
    }
  }
  
  public static boolean a(String paramString, QQAppInterface paramQQAppInterface)
  {
    Object localObject = (PublicAccountDataManager)paramQQAppInterface.getManager(55);
    if (localObject != null) {}
    for (localObject = ((PublicAccountDataManager)localObject).b(paramString);; localObject = null)
    {
      if (localObject == null)
      {
        paramQQAppInterface = paramQQAppInterface.a();
        if (paramQQAppInterface != null)
        {
          paramString = paramQQAppInterface.a(paramString, 1008);
          if ((paramString != null) && (msgtype == 63525))
          {
            paramQQAppInterface = new MessageForStructing();
            MessageForStructing.copyMessageRecordBaseField(paramQQAppInterface, paramString);
            paramQQAppInterface.parse();
            if ((structingMsg != null) && ((structingMsg.mPromotionType == 1) || (structingMsg.mPromotionType == 2))) {
              return true;
            }
          }
        }
      }
      return false;
    }
  }
  
  private void aI()
  {
    if (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getExtras() == null) {
      v();
    }
  }
  
  private void aJ()
  {
    SharedPreferences localSharedPreferences = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getSharedPreferences("public_aio_setting", 0);
    String str = "firstOpen_" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    if (localSharedPreferences.getBoolean(str, false)) {
      return;
    }
    PublicAccountInfo localPublicAccountInfo = ((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if ((localPublicAccountInfo != null) && ((accountFlag & 0x10000) != 0)) {
      jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0x9e370001hd", false, 0.0D, 0.0D, null);
    }
    ThreadManager.b(new lji(this, localSharedPreferences, str));
  }
  
  private void aK()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "showEqqLbsEnableDialog(): BEGIN");
    }
    if (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getBooleanExtra("isforceRequestDetail", false))
    {
      localObject = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      if (localObject != null) {
        jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo = ((PublicAccountDataManager)localObject).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo != null)
    {
      a(jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo);
      return;
    }
    Object localObject = new NewIntent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), PublicAccountServlet.class);
    ((NewIntent)localObject).putExtra("cmd", "get_detail_info");
    mobileqq_mp.GetPublicAccountDetailInfoRequest localGetPublicAccountDetailInfoRequest = new mobileqq_mp.GetPublicAccountDetailInfoRequest();
    seqno.set(0);
    version.set(1);
    versionInfo.set("6.3.3,3,2755");
    try
    {
      uin.set((int)Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
      ((NewIntent)localObject).putExtra("data", localGetPublicAccountDetailInfoRequest.toByteArray());
      ((NewIntent)localObject).setObserver(new ljl(this));
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet((NewIntent)localObject);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  private void aL()
  {
    if (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo == null)
    {
      PublicAccountDataManager localPublicAccountDataManager = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      if (localPublicAccountDataManager != null) {
        jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo = localPublicAccountDataManager.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      }
    }
    if ((jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.isSyncLbs) && (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.mIsAgreeSyncLbs)) {
      aM();
    }
  }
  
  private void aM()
  {
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
      return;
    }
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
    SosoInterface.a(new ljv(this, 1, true, true, 0L, false, false, "PublicAccountChatPie"));
  }
  
  private void aN()
  {
    if (!N)
    {
      a((RelativeLayout)jdField_a_of_type_ComTencentWidgetXPanelContainer.getParent());
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a(new ljx(this));
    }
    jdField_d_of_type_AndroidViewViewGroup.findViewById(2131297350).getLayoutParams()).topMargin = AIOUtils.a(50.0F, jdField_a_of_type_AndroidContentContext.getResources());
    jdField_a_of_type_AndroidViewViewGroup.setOnClickListener(this);
    Object localObject1 = (ViewGroup)jdField_d_of_type_AndroidViewViewGroup.findViewById(2131297334);
    ((ViewGroup)localObject1).removeAllViews();
    RelativeLayout localRelativeLayout = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
    Object localObject2 = jdField_a_of_type_AndroidContentContext.getResources();
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    localLayoutParams.addRule(10);
    if (jdField_a_of_type_ComTencentWidgetXPanelContainer.getParent() != null) {
      ((ViewGroup)jdField_a_of_type_ComTencentWidgetXPanelContainer.getParent()).removeView(jdField_a_of_type_ComTencentWidgetXPanelContainer);
    }
    localRelativeLayout.addView(jdField_a_of_type_ComTencentWidgetXPanelContainer, localLayoutParams);
    localObject2 = new RelativeLayout.LayoutParams(-1, (int)(TypedValue.applyDimension(1, 50.0F, ((Resources)localObject2).getDisplayMetrics()) + 0.5F));
    ((RelativeLayout.LayoutParams)localObject2).addRule(6, 2131296923);
    jdField_a_of_type_AndroidViewViewGroup.setBackgroundColor(0);
    jdField_a_of_type_AndroidViewViewGroup.setBackgroundResource(2130838638);
    if (jdField_a_of_type_AndroidViewViewGroup.getParent() != null) {
      ((ViewGroup)jdField_a_of_type_AndroidViewViewGroup.getParent()).removeView(jdField_a_of_type_AndroidViewViewGroup);
    }
    localRelativeLayout.addView(jdField_a_of_type_AndroidViewViewGroup, (ViewGroup.LayoutParams)localObject2);
    ((ViewGroup)localObject1).addView(localRelativeLayout);
    localObject2 = ((ViewGroup)localObject1).findViewById(2131297035);
    if ((localObject2 != null) && ((localObject2 instanceof TextView)))
    {
      ((TextView)localObject2).setTextColor(-1);
      localObject2 = ((View)localObject2).getBackground();
      if (localObject2 != null) {
        ((Drawable)localObject2).setColorFilter(-1, PorterDuff.Mode.SRC_ATOP);
      }
    }
    localObject2 = ((ViewGroup)localObject1).findViewById(2131297018);
    if ((localObject2 != null) && ((localObject2 instanceof TextView))) {
      ((TextView)localObject2).setTextColor(-1);
    }
    localObject1 = ((ViewGroup)localObject1).findViewById(2131297324);
    if ((localObject1 != null) && ((localObject1 instanceof ImageView))) {
      ((ImageView)localObject1).setImageResource(2130838644);
    }
    a(localRelativeLayout);
  }
  
  private void aO()
  {
    String str = URLDrawableHelper.a(jdField_a_of_type_ComTencentMobileqqDataMessageForPic, 1, null).toString();
    if (AbsDownloader.a(str) != null)
    {
      Iterator localIterator = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a().iterator();
      while (localIterator.hasNext())
      {
        ChatMessage localChatMessage = (ChatMessage)localIterator.next();
        if ((localChatMessage instanceof MessageForPic))
        {
          URL localURL = URLDrawableHelper.a((MessageForPic)localChatMessage, 1, null);
          if ((aiofileType != 1) && (str.equals(localURL.toString())))
          {
            aiofileType = -1;
            subThumbHeight = -1;
            subThumbWidth = -1;
          }
        }
      }
    }
    jdField_a_of_type_ComTencentMobileqqDataMessageForPic = null;
  }
  
  private void j(boolean paramBoolean)
  {
    i(true);
    jdField_a_of_type_ComTencentWidgetXPanelContainer.a(2, paramBoolean);
    if (jdField_i_of_type_AndroidWidgetImageView != null)
    {
      jdField_i_of_type_AndroidWidgetImageView.setImageResource(jdField_j_of_type_Int);
      jdField_i_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367383));
    }
  }
  
  private void u(int paramInt)
  {
    if (jdField_b_of_type_AndroidWidgetLinearLayout == null) {}
    LinearLayout.LayoutParams localLayoutParams1;
    do
    {
      return;
      localLayoutParams1 = (LinearLayout.LayoutParams)jdField_b_of_type_AndroidWidgetLinearLayout.getLayoutParams();
      LinearLayout.LayoutParams localLayoutParams2 = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetXEditTextEx.getLayoutParams();
      if (gravity != paramInt)
      {
        gravity = paramInt;
        jdField_b_of_type_AndroidWidgetLinearLayout.setLayoutParams(localLayoutParams1);
      }
      if (gravity != paramInt)
      {
        gravity = paramInt;
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams2);
      }
      localLayoutParams1 = (LinearLayout.LayoutParams)jdField_b_of_type_ComTencentWidgetPatchedButton.getLayoutParams();
    } while (gravity == paramInt);
    gravity = paramInt;
    jdField_b_of_type_ComTencentWidgetPatchedButton.setLayoutParams(localLayoutParams1);
  }
  
  protected void A()
  {
    super.A();
    if (U) {
      BitAppAbilityUtils.b();
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.i("bitapp_performance", 2, "PublicaccountChatPie doOnResume, don't contain lolaMsg");
  }
  
  protected void B()
  {
    super.B();
    Y = false;
    Z = false;
  }
  
  protected void R()
  {
    if ((ab) && (TroopBarAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) > 0)) {
      TroopBarAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    }
    super.R();
    Object localObject;
    if (PAWeatherItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
    {
      if (jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler == null) {
        jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler = ((PublicAccountHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(11));
      }
      jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.a(2, new ljn(this));
      localObject = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
      if (localObject != null)
      {
        int n = ((List)localObject).size();
        int m = 0;
        if (m >= n) {
          break label331;
        }
        ChatMessage localChatMessage = (ChatMessage)((List)localObject).get(m);
        if (localChatMessage == null) {}
        while (msgtype != 62530)
        {
          m += 1;
          break;
        }
      }
    }
    label331:
    for (boolean bool = false;; bool = true)
    {
      if (bool) {
        jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.a(0, 0, 0, 0);
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.BaseChatPie", 2, "first time fetch newest weather :" + bool);
      }
      for (;;)
      {
        if (M) {
          aF();
        }
        return;
        if (("3026775809".equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (Build.VERSION.SDK_INT >= 19) && (((SensorManager)jdField_a_of_type_AndroidContentContext.getSystemService("sensor")).getDefaultSensor(19) != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null))
        {
          localObject = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), StepCounterServlert.class);
          ((NewIntent)localObject).putExtra("msf_cmd_type", "cmd_refresh_steps");
          ((NewIntent)localObject).setObserver(jdField_a_of_type_MqqObserverBusinessObserver);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet((NewIntent)localObject);
        }
      }
    }
  }
  
  protected void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().addObserver(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
    EcShopAssistantManager localEcShopAssistantManager = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
    if ((localEcShopAssistantManager != null) && (localEcShopAssistantManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentBizPubaccountEcshopassitEcShopObserver);
    }
  }
  
  protected void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().deleteObserver(this);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
    EcShopAssistantManager localEcShopAssistantManager = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
    if ((localEcShopAssistantManager != null) && (localEcShopAssistantManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentBizPubaccountEcshopassitEcShopObserver);
    }
  }
  
  protected void a()
  {
    super.a();
    jdField_b_of_type_ComTencentWidgetPatchedButton = ((PatchedButton)jdField_d_of_type_AndroidViewViewGroup.findViewById(2131297346));
    jdField_b_of_type_ComTencentWidgetPatchedButton.setContentDescription("发送");
    jdField_b_of_type_ComTencentWidgetPatchedButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetLinearLayout = ((LinearLayout)jdField_d_of_type_AndroidViewViewGroup.findViewById(2131297344));
    jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(0);
    LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)jdField_b_of_type_ComTencentWidgetPatchedButton.getLayoutParams();
    bottomMargin = 0;
    topMargin = 1;
    jdField_b_of_type_ComTencentWidgetPatchedButton.setLayoutParams(localLayoutParams);
    localLayoutParams = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetXEditTextEx.getLayoutParams();
    bottomMargin = 0;
    topMargin = 1;
    jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
    if (CustomMenuBar.a()) {
      jdField_b_of_type_AndroidWidgetLinearLayout.setBackgroundColor(-1);
    }
    for (;;)
    {
      jdField_i_of_type_AndroidWidgetImageView = ((ImageView)jdField_b_of_type_AndroidWidgetLinearLayout.findViewById(2131298592));
      jdField_i_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_h_of_type_AndroidWidgetImageView = ((ImageView)jdField_b_of_type_AndroidWidgetLinearLayout.findViewById(2131298591));
      jdField_h_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_g_of_type_AndroidWidgetImageView = ((ImageView)jdField_b_of_type_AndroidWidgetLinearLayout.findViewById(2131297759));
      jdField_g_of_type_AndroidWidgetImageView.setOnClickListener(this);
      if (!CustomMenuBar.a())
      {
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130841586);
        jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130837559);
      }
      if (jdField_a_of_type_ComTencentWidgetXEditTextEx != null)
      {
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setBackgroundResource(2130842525);
        if (!CustomMenuBar.a()) {
          break;
        }
        jdField_a_of_type_AndroidWidgetLinearLayout.setBackgroundColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427671));
      }
      return;
      u(80);
    }
    int m = AIOUtils.a(3.0F, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources());
    jdField_a_of_type_AndroidWidgetLinearLayout.setPadding(0, m, 0, m);
  }
  
  public void a(int paramInt)
  {
    int m = 0xFFFF0000 & paramInt;
    super.a(paramInt);
    List localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    if (((m == 196608) || (m == 131072)) && (localList.size() > 0))
    {
      m = 0;
      int i1 = localList.size() - 1;
      if (i1 >= 0)
      {
        ChatMessage localChatMessage = (ChatMessage)localList.get(i1);
        int n = m;
        if (m == 0)
        {
          if ((jdField_k_of_type_Long == Long.MAX_VALUE) || (uniseq == jdField_k_of_type_Long)) {
            m = 1;
          }
          n = m;
          if (jdField_k_of_type_Long == Long.MAX_VALUE) {}
        }
        for (;;)
        {
          i1 -= 1;
          break;
          if (n != 0) {
            break label156;
          }
          m = n;
        }
        label156:
        if (((localChatMessage instanceof MessageForStructing)) && (StructLongMessageDownloadProcessor.b(localChatMessage)))
        {
          String str = localChatMessage.getExtInfoFromExtStr("longMsg_State");
          if ((str == null) || (!"3".equals(str))) {
            break label212;
          }
        }
        for (;;)
        {
          jdField_k_of_type_Long = uniseq;
          m = n;
          break;
          label212:
          localChatMessage.saveExtInfoToExtStr("longMsg_State", "1");
          StructLongMessageDownloadProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (MessageForStructing)localChatMessage);
        }
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.BaseChatPie", 2, "REFRESH_FLAG_RELOAD  to load long message");
      }
    }
    if (paramInt != 131072) {
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(20);
    }
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(39);
  }
  
  protected void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
    Z = true;
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    if (M) {
      s(2131364351);
    }
  }
  
  public void a(int paramInt, BusinessObserver paramBusinessObserver)
  {
    EnterpriseQQHandler localEnterpriseQQHandler = (EnterpriseQQHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(21);
    if (localEnterpriseQQHandler != null) {
      localEnterpriseQQHandler.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 3, paramInt, 1, paramBusinessObserver);
    }
  }
  
  public void a(View paramView)
  {
    getLayoutParamsheight = 0;
    paramView.requestLayout();
  }
  
  public void a(View paramView, int paramInt)
  {
    getLayoutParamsheight = paramInt;
    paramView.requestLayout();
  }
  
  protected void a(QQMessageFacade.Message paramMessage)
  {
    if (paramMessage == null) {}
    for (;;)
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar != null)
      {
        Iterator localIterator = jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.jdField_a_of_type_JavaUtilList.iterator();
        do
        {
          if (!localIterator.hasNext()) {
            break;
          }
        } while (!nexttroopuin.equals(frienduin));
      }
      for (int m = 1; (istroop != 1) || (m == 0); m = 0)
      {
        super.a(paramMessage);
        return;
      }
    }
  }
  
  public void a(ChatMessage paramChatMessage)
  {
    super.a(paramChatMessage);
    Object localObject = frienduin;
    int m = istroop;
    if (TroopBarAssistantManager.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject))
    {
      paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      localObject = paramChatMessage.a((String)localObject, m);
      if (localObject != null) {
        paramChatMessage.b((RecentUser)localObject);
      }
    }
  }
  
  public void a(PublicAccountInfo paramPublicAccountInfo)
  {
    PublicAccountDataManager localPublicAccountDataManager;
    if (paramPublicAccountInfo != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.BaseChatPie", 2, "showEqqLbsEnableDialog(): eqqPublicAccountInfo.mIsSyncLbsSelected=" + mIsSyncLbsSelected + ", eqqPublicAccountInfo.isSyncLbs=" + isSyncLbs + ", eqqPublicAccountInfo.mIsAgreeSyncLbs=" + mIsAgreeSyncLbs);
      }
      localPublicAccountDataManager = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      if (localPublicAccountDataManager == null) {
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, "showEqqLbsEnableDialog(): pam is null");
        }
      }
    }
    for (;;)
    {
      return;
      if ((isSyncLbs) && (!mIsSyncLbsSelected) && (!mIsAgreeSyncLbs) && (!aa))
      {
        String str1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131362662);
        String str2 = String.format(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131362663), new Object[] { jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d });
        jdField_g_of_type_AndroidAppDialog = DialogUtil.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 230, str1, str2, 2131362664, 2131362665, new ljo(this, paramPublicAccountInfo, localPublicAccountDataManager), new ljq(this, paramPublicAccountInfo, localPublicAccountDataManager));
        jdField_g_of_type_AndroidAppDialog.setOnDismissListener(new ljr(this));
        jdField_g_of_type_AndroidAppDialog.setCanceledOnTouchOutside(true);
        if ((jdField_a_of_type_AndroidSupportV4AppFragmentActivity != null) && (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing())) {
          jdField_g_of_type_AndroidAppDialog.show();
        }
        aa = true;
      }
      while (QLog.isColorLevel())
      {
        QLog.d("Q.aio.BaseChatPie", 2, "showEqqLbsEnableDialog(): END");
        return;
        if (QLog.isColorLevel()) {
          QLog.e("Q.aio.BaseChatPie", 2, "showEqqLbsEnableDialog(): eqqPublicAccountInfo=NULL, uin=" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        }
      }
    }
  }
  
  void a(AbsListView paramAbsListView)
  {
    ArrayList localArrayList3 = new ArrayList();
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    ArrayList localArrayList4 = new ArrayList();
    int m = paramAbsListView.s();
    ChatMessage localChatMessage;
    if (m <= paramAbsListView.t())
    {
      localChatMessage = (ChatMessage)jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getItem(m);
      if (localChatMessage != null) {}
    }
    for (;;)
    {
      m += 1;
      break;
      String str3;
      long l1;
      try
      {
        String str1;
        if ((!localChatMessage.getExtInfoFromExtStr("pa_msgHasRead").equals("")) && (!localChatMessage.getExtInfoFromExtStr("pa_msgHasRead").equals("true")))
        {
          localArrayList4.add(localChatMessage);
          str3 = localChatMessage.getExtInfoFromExtStr("pa_msgId");
          str1 = str3;
          if (TextUtils.isEmpty(str3)) {
            str1 = "0";
          }
          l1 = Long.parseLong(str1);
          if (localChatMessage.getExtInfoFromExtStr("pa_should_report").equals("true"))
          {
            localArrayList3.add(Long.valueOf(l1));
            if (QLog.isColorLevel()) {
              QLog.d("Q.aio.BaseChatPie", 2, "Report message at index: " + String.valueOf(m) + ". MessageId is " + l1);
            }
          }
          localChatMessage.saveExtInfoToExtStr("pa_msgHasRead", "true");
          str3 = localChatMessage.getExtInfoFromExtStr("msg_template_id");
          str1 = str3;
          if (str3 == null) {
            str1 = "";
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X80057C4", "0X80057C4", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, String.valueOf(l1), str1, "");
        }
        if (!localChatMessage.getExtInfoFromExtStr("ad_msgHasRead").equals("false")) {
          continue;
        }
        localChatMessage.saveExtInfoToExtStr("ad_msgHasRead", "true");
        String str4 = localChatMessage.getExtInfoFromExtStr("pa_msgId");
        String str5 = localChatMessage.getExtInfoFromExtStr("gdt_msgClick");
        str3 = "0";
        try
        {
          JSONObject localJSONObject = new JSONObject(str5);
          str1 = str3;
          if (localJSONObject.has("ad_id")) {
            str1 = localJSONObject.getString("ad_id");
          }
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            String str2 = str3;
            if (QLog.isColorLevel())
            {
              QLog.d("Q.aio.BaseChatPie", 2, " parse ad_id error");
              str2 = str3;
            }
          }
        }
        localArrayList1.add(str4);
        jdField_c_of_type_JavaUtilList.add(str1);
        localArrayList2.add(str5);
        if (localArrayList4.contains(localChatMessage)) {
          continue;
        }
        localArrayList4.add(localChatMessage);
      }
      catch (Exception localException2) {}
      b(localArrayList4);
      if (!localArrayList3.isEmpty()) {}
      try
      {
        l1 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        long l2 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(BaseApplication.getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0L, 0L, l1, l2, 2, localArrayList3);
        paramAbsListView = localArrayList4.iterator();
        while (paramAbsListView.hasNext()) {
          if ("1".equals(((ChatMessage)paramAbsListView.next()).getExtInfoFromExtStr("is_AdArrive_Msg")))
          {
            if (jdField_g_of_type_Long == -1L) {
              jdField_g_of_type_Long = (NetConnInfoCenter.getServerTime() * 1000L);
            }
            jdField_b_of_type_JavaUtilList = localArrayList1;
            PAReportUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "", "", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, localArrayList2, localArrayList1);
          }
        }
        return;
      }
      catch (Exception paramAbsListView)
      {
        return;
      }
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    super.a(paramAbsListView, paramInt);
    if (paramInt == 0) {
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(39);
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    super.a(paramAbsListView, paramInt1, paramInt2, paramInt3);
    if ((jdField_g_of_type_AndroidViewView == null) || (jdField_j_of_type_AndroidViewView == null) || (dw == 5)) {}
    label237:
    label239:
    int m;
    do
    {
      do
      {
        for (;;)
        {
          return;
          if (dN > paramInt3)
          {
            dw = 4;
            dN = paramInt3;
            switch (dw)
            {
            }
          }
          for (;;)
          {
            if ((!X) && (!K)) {
              break label237;
            }
            if ((!S) || (K)) {
              break label239;
            }
            S = false;
            return;
            if (dN >= paramInt3) {
              break;
            }
            dw = 3;
            break;
            if ((paramInt3 > paramInt2) && (!X))
            {
              dM = jdField_j_of_type_AndroidViewView.getLayoutParams().height;
              a(jdField_j_of_type_AndroidViewView);
              X = true;
            }
            dw = 2;
            S = true;
            continue;
            if ((paramInt3 == paramInt2) && (X))
            {
              if (dM != 0) {
                a(jdField_j_of_type_AndroidViewView, dM);
              }
              X = false;
              K = true;
            }
            dw = 2;
            S = true;
          }
        }
        if (jdField_g_of_type_AndroidViewView.getHeight() != 0) {
          dM = jdField_g_of_type_AndroidViewView.getHeight();
        }
        m = dL - h();
        dL = h();
        if (dO * m < 0)
        {
          dO = m;
          return;
        }
        dO = m;
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, "Move = " + String.valueOf(m));
        }
        switch (dv)
        {
        default: 
          return;
        }
      } while (((m <= 5) || (!R)) && ((paramInt1 != jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.m()) || (m <= 0) || (!R) || (J)));
      J = true;
      paramAbsListView = new TranslateAnimation(0.0F, 0.0F, 0.0F, -dM);
      paramAbsListView.setFillAfter(true);
      paramAbsListView.setDuration(250L);
      paramAbsListView.setAnimationListener(new liv(this));
      jdField_g_of_type_AndroidViewView.startAnimation(paramAbsListView);
      return;
    } while (((m >= -5) || (!R)) && (((!K) && ((paramInt1 + paramInt2 != paramInt3) || (m >= 0) || (!R))) || (J)));
    J = true;
    paramAbsListView = new TranslateAnimation(0.0F, 0.0F, -dM, 0.0F);
    paramAbsListView.setFillAfter(true);
    paramAbsListView.setDuration(250L);
    paramAbsListView.setAnimationListener(new liw(this));
    jdField_g_of_type_AndroidViewView.startAnimation(paramAbsListView);
  }
  
  protected void a(List paramList, CharSequence paramCharSequence)
  {
    super.a(paramList, paramCharSequence);
    paramCharSequence = null;
    HashMap localHashMap = new HashMap();
    int n = paramList.size();
    int m = 0;
    if (m < n)
    {
      ChatMessage localChatMessage = (ChatMessage)paramList.get(m);
      if (!MessageForBitApp.class.isInstance(localChatMessage)) {
        break label155;
      }
      localChatMessage.parse();
      if (bitAppMsg == null) {
        break label155;
      }
      localHashMap.put(Integer.valueOf(bitAppMsg.getModuleId()), Integer.valueOf(m));
      paramCharSequence = localChatMessage;
    }
    label155:
    for (;;)
    {
      m += 1;
      break;
      if (paramCharSequence != null)
      {
        if (!U) {
          U = true;
        }
        paramList = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a.a(paramCharSequence, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1);
        if ((paramList instanceof BitAppMsgItemBuilder)) {
          ((BitAppMsgItemBuilder)paramList).a(localHashMap);
        }
      }
      return;
    }
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004EF8", "0X8004EF8", 0, 0, Integer.toString(paramInt), "", "", "");
    if (jdField_b_of_type_MqqAppNewIntent != null)
    {
      PublicAccountManager.a().a(jdField_b_of_type_MqqAppNewIntent);
      jdField_b_of_type_MqqAppNewIntent = null;
    }
    jdField_b_of_type_MqqAppNewIntent = PublicAccountManager.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramInt, paramBoolean, BaseApplication.getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, new ljt(this));
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "listView onViewCompleteVisableAndReleased");
    }
    if (!M) {
      return super.a(paramInt, paramView, paramListView);
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount() > 0))
    {
      O = true;
      b(System.currentTimeMillis());
      jdField_b_of_type_Long = SystemClock.uptimeMillis();
      ((ChatContext)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.a).a(jdField_b_of_type_Long);
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.jdField_e_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.f = true;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 21, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
    }
    return true;
  }
  
  protected boolean a(boolean paramBoolean)
  {
    C = false;
    A = false;
    aI();
    super.a(paramBoolean);
    as();
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar = new TroopEntranceBar();
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), this, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1, jdField_a_of_type_ComTencentMobileqqBubbleChatXListView);
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.addObserver(this);
    Object localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent();
    String str = ((Intent)localObject).getStringExtra("from");
    Q = ((Intent)localObject).getBooleanExtra("shouldreport", false);
    if (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing())
    {
      jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager = PublicAccountManager.a();
      ThreadManager.a(new lki(this), null, true);
      PublicAccountInfo localPublicAccountInfo = ((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((localPublicAccountInfo != null) && (PublicAccountUtil.a(accountFlag)))
      {
        ab = true;
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.a(Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue());
      }
      PublicAccountHandler.b = null;
    }
    if ((str != null) && (str.equals("starShortcut")))
    {
      PublicAccountManager.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, ((Intent)localObject).getStringExtra("starhomeurl"), ((Intent)localObject).getStringExtra("uin"), str);
      return true;
    }
    if ((NetworkUtil.b(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext()) == 1) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals("2632129500"))) {
      HtmlOffline.b("108", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true, new lkk(this));
    }
    if ("3105932915".equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
    {
      localObject = (QQComicPreloadManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(141);
      if (localObject != null) {
        PluginPreloader.a(((QQComicPreloadManager)localObject).a(5));
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setCustomHeight(0);
    }
    jdField_a_of_type_MqqOsMqqHandler.post(new lkl(this));
    M = PublicAccountUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "doOnCreate, isMediaAndOtherSubscript = " + M);
    }
    N = PublicAccountUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_h_of_type_Long = (NetConnInfoCenter.getServerTime() * 1000L);
    if (PublicAccountUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
    {
      localObject = (WebProcessManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(12);
      if (localObject != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, "doOnCreate, preload web process");
        }
        ((WebProcessManager)localObject).e();
      }
    }
    if (M)
    {
      aN();
      aC();
      aE();
    }
    if (M) {
      if (N) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005A22", "0X8005A22", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "new", "", "");
      }
    }
    for (;;)
    {
      if (((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
        I = true;
      }
      return true;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005A22", "0X8005A22", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "old", "", "");
      continue;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005A22", "0X8005A22", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
    }
  }
  
  public void aA()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1008)
    {
      if (C2BUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))
      {
        jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
        jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(this);
      }
    }
    else {
      return;
    }
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  public void aB()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "follow");
    }
    if (jdField_c_of_type_MqqAppNewIntent != null) {
      jdField_c_of_type_MqqAppNewIntent.setObserver(null);
    }
    jdField_c_of_type_MqqAppNewIntent = new NewIntent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), PublicAccountServlet.class);
    jdField_c_of_type_MqqAppNewIntent.putExtra("cmd", "follow");
    Object localObject = new mobileqq_mp.FollowRequest();
    uin.set((int)Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    jdField_c_of_type_MqqAppNewIntent.putExtra("data", ((mobileqq_mp.FollowRequest)localObject).toByteArray());
    localObject = new lju(this);
    jdField_c_of_type_MqqAppNewIntent.setObserver((BusinessObserver)localObject);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(jdField_c_of_type_MqqAppNewIntent);
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "follow exit");
    }
  }
  
  public void aC()
  {
    ThreadManager.a(new ljw(this), 8, null, true);
  }
  
  protected void aD()
  {
    if (jdField_g_of_type_AndroidWidgetImageView == null) {}
    do
    {
      return;
      if (jdField_l_of_type_Int != 1) {
        break;
      }
      jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130840223);
      jdField_g_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_g_of_type_AndroidWidgetImageView.setEnabled(true);
    } while (!VersionUtils.e());
    jdField_g_of_type_AndroidWidgetImageView.setAlpha(1.0F);
    return;
    if (jdField_l_of_type_Int == 2)
    {
      jdField_g_of_type_AndroidWidgetImageView.setEnabled(false);
      if (VersionUtils.e()) {
        jdField_g_of_type_AndroidWidgetImageView.setAlpha(0.6F);
      }
      if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 3)
      {
        if (CustomMenuBar.a()) {
          jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842493);
        }
        for (;;)
        {
          jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367371));
          return;
          jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842684);
        }
      }
      if (CustomMenuBar.a()) {
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842492);
      }
      for (;;)
      {
        jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367370));
        return;
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842685);
      }
    }
    jdField_g_of_type_AndroidWidgetImageView.setEnabled(true);
    if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 3)
    {
      if (CustomMenuBar.a()) {
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842493);
      }
      for (;;)
      {
        jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367371));
        label246:
        if (!VersionUtils.e()) {
          break;
        }
        jdField_g_of_type_AndroidWidgetImageView.setAlpha(1.0F);
        return;
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842684);
      }
    }
    if (CustomMenuBar.a()) {
      jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842492);
    }
    for (;;)
    {
      jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367370));
      break label246;
      break;
      jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842685);
    }
  }
  
  public void aE()
  {
    jdField_k_of_type_AndroidViewView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903462, null);
    jdField_f_of_type_AndroidWidgetTextView = ((TextView)jdField_k_of_type_AndroidViewView.findViewById(2131298616));
    if (!N) {
      jdField_f_of_type_AndroidWidgetTextView.setVisibility(8);
    }
    jdField_g_of_type_AndroidWidgetTextView = ((TextView)jdField_k_of_type_AndroidViewView.findViewById(2131298615));
    jdField_k_of_type_AndroidWidgetImageView = ((ImageView)jdField_k_of_type_AndroidViewView.findViewById(2131297375));
    jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)jdField_k_of_type_AndroidViewView.findViewById(2131296916));
  }
  
  public void aF()
  {
    if (!N) {}
    while ((jdField_f_of_type_AndroidWidgetTextView == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 == null)) {
      return;
    }
    Object localObject = (ChatMessage)jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getItem(0);
    if (localObject != null)
    {
      jdField_f_of_type_AndroidWidgetTextView.setVisibility(0);
      localObject = TimeFormatterUtils.a(jdField_a_of_type_AndroidContentContext, 3, time * 1000L);
      jdField_f_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      return;
    }
    jdField_f_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  public void aG()
  {
    if (jdField_f_of_type_AndroidWidgetTextView != null) {
      jdField_f_of_type_AndroidWidgetTextView.setVisibility(8);
    }
  }
  
  public void aH()
  {
    if (jdField_a_of_type_AndroidOsHandler != null) {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(8, 300L);
    }
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    boolean bool1 = false;
    boolean bool2 = true;
    super.afterTextChanged(paramEditable);
    a(paramEditable);
    PatchedButton localPatchedButton;
    if (jdField_l_of_type_Int == 0)
    {
      if (!jdField_d_of_type_Boolean) {
        break label75;
      }
      jdField_b_of_type_ComTencentWidgetPatchedButton.setSelected(true);
      jdField_b_of_type_ComTencentWidgetPatchedButton.setText(2131367607);
      localPatchedButton = jdField_b_of_type_ComTencentWidgetPatchedButton;
      if (paramEditable.length() <= 0) {
        break label70;
      }
      bool1 = bool2;
      localPatchedButton.setEnabled(bool1);
    }
    label70:
    label75:
    do
    {
      do
      {
        return;
        bool1 = false;
        break;
      } while ((jdField_i_of_type_AndroidWidgetImageView != null) && (jdField_i_of_type_AndroidWidgetImageView.getVisibility() == 0));
      localPatchedButton = jdField_b_of_type_ComTencentWidgetPatchedButton;
      if (paramEditable.length() > 0) {
        bool1 = true;
      }
      localPatchedButton.setEnabled(bool1);
    } while (paramEditable.length() <= 0);
    jdField_b_of_type_ComTencentWidgetPatchedButton.setText(2131367607);
    jdField_b_of_type_ComTencentWidgetPatchedButton.setSelected(true);
  }
  
  public void ao()
  {
    if ((M) && (N) && (jdField_e_of_type_AndroidWidgetTextView != null))
    {
      jdField_e_of_type_AndroidWidgetTextView.setBackgroundColor(Color.parseColor("#80000000"));
      jdField_e_of_type_AndroidWidgetTextView.setTextColor(-1);
    }
  }
  
  public void ar()
  {
    ThreadManager.a(new lkm(this), 5, null, true);
  }
  
  public void as()
  {
    ThreadManager.a(new lkh(this), 8, null, false);
  }
  
  public void at()
  {
    ChatMessage localChatMessage;
    String str1;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount() >= 1)
    {
      localChatMessage = (ChatMessage)jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a().get(jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount() - 1);
      str1 = "0";
      if (localChatMessage != null)
      {
        localObject = localChatMessage.getExtInfoFromExtStr("gdt_msgClick");
        if (TextUtils.isEmpty((CharSequence)localObject)) {}
      }
    }
    try
    {
      localObject = new JSONObject((String)localObject);
      if (((JSONObject)localObject).has("ad_id")) {
        str1 = ((JSONObject)localObject).getString("ad_id");
      }
    }
    catch (Exception localException)
    {
      long l1;
      for (;;)
      {
        String str2 = "0";
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8005D17", "0X8005D17", 0, 1, 0, "old", String.valueOf(l1 - jdField_h_of_type_Long), "", "");
    }
    Object localObject = localChatMessage.getExtInfoFromExtStr("pa_msgId");
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "" + frienduin, "0X8005C38", "0X8005C38", 0, 1, 0, (String)localObject, String.valueOf(NetConnInfoCenter.getServerTime() * 1000L), "", str1);
    if (M)
    {
      l1 = NetConnInfoCenter.getServerTime() * 1000L;
      if (N) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8005D17", "0X8005D17", 0, 1, 0, "new", String.valueOf(l1 - jdField_h_of_type_Long), "", "");
      }
    }
    else
    {
      return;
    }
  }
  
  public void au()
  {
    if ((!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing()) && (jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) && (jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing())) {
      jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    }
  }
  
  public void av()
  {
    if (Build.VERSION.SDK_INT < 11)
    {
      jdField_a_of_type_AndroidWidgetRelativeLayout.post(new lir(this));
      jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.a(jdField_j_of_type_AndroidViewView);
      X = true;
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1);
      return;
    }
    a(jdField_j_of_type_AndroidViewView, jdField_j_of_type_AndroidViewView.getHeight(), 0, new lis(this));
    jdField_g_of_type_AndroidViewView.setTranslationY(0.0F);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, 0.0F, -jdField_g_of_type_AndroidViewView.getHeight());
    localTranslateAnimation.setDuration(500L);
    localTranslateAnimation.setFillAfter(true);
    localTranslateAnimation.setAnimationListener(new lit(this));
    jdField_g_of_type_AndroidViewView.startAnimation(localTranslateAnimation);
  }
  
  public void aw()
  {
    if ((jdField_a_of_type_AndroidWidgetRelativeLayout == null) || (jdField_a_of_type_ComTencentMobileqqBubbleChatXListView == null)) {}
    do
    {
      do
      {
        return;
        jdField_g_of_type_AndroidViewView = LayoutInflater.from(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getBaseContext()).inflate(2130903080, jdField_a_of_type_AndroidWidgetRelativeLayout, false);
      } while (jdField_g_of_type_AndroidViewView == null);
      jdField_g_of_type_AndroidViewView.setClickable(true);
      jdField_g_of_type_AndroidViewView.findViewById(2131296683).setOnClickListener(new liy(this));
      if (dt == 2)
      {
        jdField_g_of_type_AndroidViewView.findViewById(2131296909).setVisibility(8);
        jdField_g_of_type_AndroidViewView.findViewById(2131296912).setVisibility(8);
      }
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_g_of_type_AndroidViewView);
      jdField_j_of_type_AndroidViewView = LayoutInflater.from(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getBaseContext()).inflate(2130903079, jdField_a_of_type_ComTencentMobileqqBubbleChatXListView, false);
    } while (jdField_j_of_type_AndroidViewView == null);
    if (dt == 2) {
      jdField_j_of_type_AndroidViewView.getLayoutParams().height = ((int)jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDimension(2131493439));
    }
    Object localObject = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.a();
    jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setAdapter(null);
    jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.a(jdField_j_of_type_AndroidViewView);
    jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setAdapter((ListAdapter)localObject);
    localObject = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
    if (localObject != null)
    {
      localObject = ((PublicAccountDataManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((localObject != null) && (H))
      {
        a((AccountDetail)localObject);
        H = false;
      }
    }
    localObject = (PublicMenuBar)jdField_g_of_type_AndroidViewView.findViewById(2131296913);
    ((PublicMenuBar)localObject).setOnMenuItemClickListener(new liz(this));
    ((PublicMenuBar)localObject).a();
    MenuItem localMenuItem1 = new MenuItem("DO_NOT_FOLLOW", jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131369986), a().getResources().getDrawable(2130838632), 0);
    MenuItem localMenuItem2 = new MenuItem("DO_FOLLOW", jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131369985), a().getResources().getDrawable(2130838610), 1);
    ((PublicMenuBar)localObject).a(localMenuItem1, 2130903702);
    ((PublicMenuBar)localObject).a(localMenuItem2, 2130903702);
    ((PublicMenuBar)localObject).setSwitchButtonVisibility(false);
    ((PublicMenuBar)localObject).setVisibility(0);
  }
  
  public void ax()
  {
    jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setOnScrollListener(this);
    jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
    if (jdField_a_of_type_AndroidWidgetLinearLayout != null) {
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
    }
    if (jdField_e_of_type_AndroidViewView != null) {
      jdField_e_of_type_AndroidViewView.setVisibility(8);
    }
    if (jdField_f_of_type_AndroidViewView != null) {
      jdField_f_of_type_AndroidViewView.setVisibility(8);
    }
  }
  
  public void ay()
  {
    if (jdField_a_of_type_ComTencentWidgetActionSheet == null)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet = ((ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, null));
      jdField_a_of_type_ComTencentWidgetActionSheet.a("确定后你将不再收到通知消息");
      jdField_a_of_type_ComTencentWidgetActionSheet.a("确定", 3);
      jdField_a_of_type_ComTencentWidgetActionSheet.d(2131366996);
      jdField_a_of_type_ComTencentWidgetActionSheet.setOnDismissListener(new ljb(this));
      jdField_a_of_type_ComTencentWidgetActionSheet.a(new ljc(this));
    }
    if (!jdField_a_of_type_ComTencentWidgetActionSheet.isShowing())
    {
      T = false;
      jdField_a_of_type_ComTencentWidgetActionSheet.show();
    }
  }
  
  public void az()
  {
    if (Y) {
      break label7;
    }
    label7:
    label737:
    for (;;)
    {
      return;
      if (jdField_a_of_type_AndroidWidgetRelativeLayout != null)
      {
        Object localObject1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources();
        jdField_j_of_type_AndroidWidgetImageView = ((ImageView)jdField_d_of_type_AndroidViewViewGroup.findViewById(2131296338));
        if (jdField_a_of_type_ComTencentMobileqqWidgetPublicMenuBar != null) {
          jdField_a_of_type_AndroidWidgetRelativeLayout.removeView(jdField_a_of_type_ComTencentMobileqqWidgetPublicMenuBar);
        }
        if (jdField_g_of_type_AndroidViewView != null) {
          jdField_a_of_type_AndroidWidgetRelativeLayout.removeView(jdField_g_of_type_AndroidViewView);
        }
        if (jdField_j_of_type_AndroidViewView != null) {
          jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.a(jdField_j_of_type_AndroidViewView);
        }
        jdField_a_of_type_ComTencentBizUiCustomMenuBar = ((CustomMenuBar)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296918));
        if (jdField_a_of_type_ComTencentBizUiCustomMenuBar == null)
        {
          jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getLayoutInflater().inflate(2130903081, jdField_a_of_type_AndroidWidgetRelativeLayout);
          jdField_a_of_type_ComTencentBizUiCustomMenuBar = ((CustomMenuBar)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296918));
        }
        for (;;)
        {
          if (jdField_a_of_type_ComTencentBizUiCustomMenuBar == null) {
            break label737;
          }
          jdField_a_of_type_ComTencentBizUiCustomMenuBar.setMenuType(jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.b(a()));
          if (CustomMenuBar.a())
          {
            jdField_a_of_type_ComTencentBizUiCustomMenuBar.setBackgroundColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427671));
            jdField_a_of_type_ComTencentBizUiCustomMenuBar.setMinimumHeight(AIOUtils.a(48.0F, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources()));
          }
          if (jdField_a_of_type_ComTencentMobileqqBubbleChatXListView != null)
          {
            Object localObject3 = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getLayoutParams();
            Object localObject2 = jdField_a_of_type_ComTencentBizUiCustomMenuBar.getLayoutParams();
            if ((localObject3 != null) && (localObject2 != null) && ((localObject3 instanceof RelativeLayout.LayoutParams)) && ((localObject2 instanceof RelativeLayout.LayoutParams)))
            {
              localObject3 = (RelativeLayout.LayoutParams)localObject3;
              int[] arrayOfInt = ((RelativeLayout.LayoutParams)localObject3).getRules();
              if ((arrayOfInt.length > 2) && (arrayOfInt[2] == 2131297342))
              {
                ((RelativeLayout.LayoutParams)localObject3).addRule(2, 2131296918);
                jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setLayoutParams((ViewGroup.LayoutParams)localObject3);
                localObject2 = (RelativeLayout.LayoutParams)localObject2;
                ((RelativeLayout.LayoutParams)localObject2).addRule(2, 2131297342);
                jdField_a_of_type_ComTencentBizUiCustomMenuBar.setLayoutParams((ViewGroup.LayoutParams)localObject2);
              }
            }
          }
          if (L)
          {
            localObject1 = new TranslateAnimation(0.0F, 0.0F, AIOUtils.a(34.0F, (Resources)localObject1), 0.0F);
            ((TranslateAnimation)localObject1).setDuration(250L);
            ((TranslateAnimation)localObject1).setFillAfter(true);
            ((TranslateAnimation)localObject1).setAnimationListener(new ljd(this));
            jdField_a_of_type_ComTencentBizUiCustomMenuBar.startAnimation((Animation)localObject1);
          }
          localObject1 = jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296914);
          ((View)localObject1).setOnClickListener(new ljf(this));
          jdField_a_of_type_ComTencentBizUiCustomMenuBar.setCoverView((View)localObject1);
          jdField_i_of_type_AndroidViewView = jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296915);
          aJ();
          localObject1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getSharedPreferences("menuEventSharePre", 0);
          if (!((SharedPreferences)localObject1).contains(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
          {
            localObject1 = ((SharedPreferences)localObject1).edit();
            ((SharedPreferences.Editor)localObject1).putInt(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 0);
            ((SharedPreferences.Editor)localObject1).commit();
          }
          jdField_j_of_type_AndroidWidgetImageView.setOnClickListener(this);
          jdField_a_of_type_ComTencentBizUiCustomMenuBar.setOnMenuItemClickListener(new ljg(this));
          jdField_a_of_type_ComTencentBizUiCustomMenuBar.setOnBackClickListner(new ljh(this));
          localObject1 = jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a());
          c((List)localObject1);
          jdField_a_of_type_MqqAppNewIntent = jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), jdField_b_of_type_MqqObserverBusinessObserver, false);
          if ((localObject1 != null) && (!((List)localObject1).isEmpty())) {
            h(true);
          }
          Y = true;
          if (jdField_a_of_type_ComTencentBizPubaccountAssistantPubAccountTipsManager == null) {
            jdField_a_of_type_ComTencentBizPubaccountAssistantPubAccountTipsManager = new PubAccountTipsManager(jdField_a_of_type_AndroidContentContext);
          }
          localObject1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent();
          if ((!((Intent)localObject1).hasExtra("pub_account_type")) || (!"type_ecshop_account".equals(((Intent)localObject1).getStringExtra("pub_account_type")))) {
            break;
          }
          localObject1 = ((Intent)localObject1).getStringExtra("ecshop_distance_tip");
          localObject1 = jdField_a_of_type_ComTencentBizPubaccountAssistantPubAccountTipsManager.a((String)localObject1, this);
          jdField_a_of_type_ComTencentBizPubaccountAssistantPubAccountTipsManager.a(jdField_a_of_type_AndroidWidgetRelativeLayout, (View)localObject1);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Shop_lifeservice", "", "Shop_nearbyiconPv", "Pv_shopnearbyicon", 0, 0, "", "", "", "");
          return;
          jdField_a_of_type_ComTencentBizUiCustomMenuBar.setVisibility(8);
        }
      }
    }
  }
  
  public void b(int paramInt1, int paramInt2)
  {
    super.b(paramInt1, paramInt2);
    aD();
    if (paramInt2 == 8) {
      if (jdField_h_of_type_AndroidWidgetImageView != null)
      {
        if (!CustomMenuBar.a()) {
          break label289;
        }
        jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842504);
      }
    }
    for (;;)
    {
      if (!jdField_d_of_type_Boolean)
      {
        SpannableString localSpannableString;
        if (jdField_a_of_type_AndroidTextSpannableString == null)
        {
          localObject = new ImageSpan(jdField_a_of_type_AndroidContentContext, 2130837571);
          localSpannableString = new SpannableString("文字输入");
          localSpannableString.setSpan(localObject, 0, localSpannableString.length(), 33);
          jdField_a_of_type_AndroidTextSpannableString = localSpannableString;
        }
        if (jdField_b_of_type_AndroidTextSpannableString == null)
        {
          localObject = new ImageSpan(jdField_a_of_type_AndroidContentContext, 2130837674);
          localSpannableString = new SpannableString("语音输入");
          localSpannableString.setSpan(localObject, 0, localSpannableString.length(), 33);
          jdField_b_of_type_AndroidTextSpannableString = localSpannableString;
        }
        if ((QLog.isColorLevel()) && (jdField_i_of_type_AndroidWidgetImageView != null)) {
          QLog.d("doPanelChanged", 2, "oldPanel=" + paramInt1 + " newPanel=" + paramInt2 + " text.length " + jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() + "mAudioBtn visibility:" + jdField_i_of_type_AndroidWidgetImageView.getVisibility());
        }
        if (paramInt2 != 2) {
          break;
        }
        jdField_b_of_type_ComTencentWidgetPatchedButton.setSelected(false);
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel != null) && (paramInt1 != 2) && (AIOInputTypeHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface))) {
          jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.a(false);
        }
      }
      return;
      label289:
      jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842488);
      continue;
      if (jdField_h_of_type_AndroidWidgetImageView != null) {
        if (CustomMenuBar.a()) {
          jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842503);
        } else {
          jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842487);
        }
      }
    }
    Object localObject = jdField_b_of_type_ComTencentWidgetPatchedButton;
    if (jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() > 0) {}
    for (boolean bool = true;; bool = false)
    {
      ((PatchedButton)localObject).setSelected(bool);
      if (jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() <= 0) {
        break;
      }
      jdField_b_of_type_ComTencentWidgetPatchedButton.setText(2131367607);
      return;
    }
    jdField_b_of_type_ComTencentWidgetPatchedButton.setSelected(false);
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    if (M) {
      s(2131364352);
    }
  }
  
  public void b(long paramLong)
  {
    try
    {
      jdField_g_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_k_of_type_AndroidWidgetImageView.setVisibility(8);
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
      return;
    }
    catch (Exception localException) {}
  }
  
  protected void b(Intent paramIntent)
  {
    super.b(paramIntent);
    if (PublicAccountUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
      jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    }
  }
  
  public void b(ChatMessage paramChatMessage)
  {
    int m = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a(paramChatMessage) + 1;
    if (m <= jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount() - 1)
    {
      ChatMessage localChatMessage = (ChatMessage)jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getItem(m);
      if ((localChatMessage != null) && (msgtype == 64488))
      {
        super.b(paramChatMessage);
        h(localChatMessage);
        return;
      }
    }
    super.b(paramChatMessage);
  }
  
  void b(List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "saveReadedToDB");
    }
    ThreadManager.a(new lix(this, paramList), null, false);
  }
  
  public void c(Intent paramIntent)
  {
    super.c(paramIntent);
    a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramIntent);
    jdField_a_of_type_ComTencentWidgetXPanelContainer.post(new ljj(this));
    aL();
  }
  
  public void c(List paramList)
  {
    if (jdField_a_of_type_ComTencentBizUiCustomMenuBar == null) {}
    for (;;)
    {
      return;
      jdField_a_of_type_ComTencentBizUiCustomMenuBar.a();
      jdField_a_of_type_ComTencentBizUiCustomMenuBar.setMenuType(jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.b(a()));
      if ((paramList == null) || (paramList.isEmpty()))
      {
        if (jdField_a_of_type_AndroidWidgetLinearLayout != null) {
          jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
        }
        if (jdField_e_of_type_AndroidViewView != null) {
          jdField_e_of_type_AndroidViewView.setVisibility(0);
        }
        if (jdField_f_of_type_AndroidViewView != null) {
          jdField_f_of_type_AndroidViewView.setVisibility(0);
        }
        if (jdField_j_of_type_AndroidWidgetImageView != null) {
          jdField_j_of_type_AndroidWidgetImageView.setVisibility(8);
        }
      }
      else
      {
        if (jdField_j_of_type_AndroidWidgetImageView != null) {
          jdField_j_of_type_AndroidWidgetImageView.setVisibility(0);
        }
        int i1 = paramList.size();
        int m = 0;
        while ((m < i1) && (m <= 2))
        {
          Object localObject2 = (mobileqq_mp.ButtonInfo)paramList.get(m);
          Object localObject1;
          String str;
          label198:
          label218:
          MenuItem localMenuItem;
          label261:
          label285:
          mobileqq_mp.ButtonInfo localButtonInfo;
          if (key.has())
          {
            localObject1 = key.get();
            if (!name.has()) {
              break label408;
            }
            str = name.get();
            if (!id.has()) {
              break label415;
            }
            n = id.get();
            localMenuItem = new MenuItem((String)localObject1, str, null, n);
            localMenuItem.a((mobileqq_mp.ButtonInfo)localObject2);
            if (!sub_button.has()) {
              break label420;
            }
            localObject1 = sub_button.get();
            if ((localObject1 == null) || (((List)localObject1).size() <= 0)) {
              break label445;
            }
            localObject2 = ((List)localObject1).iterator();
            if (!((Iterator)localObject2).hasNext()) {
              break label445;
            }
            localButtonInfo = (mobileqq_mp.ButtonInfo)((Iterator)localObject2).next();
            if (!key.has()) {
              break label426;
            }
            localObject1 = key.get();
            label328:
            if (!name.has()) {
              break label433;
            }
            str = name.get();
            label349:
            if (!id.has()) {
              break label440;
            }
          }
          label408:
          label415:
          label420:
          label426:
          label433:
          label440:
          for (int n = id.get();; n = 0)
          {
            localObject1 = new MenuItem((String)localObject1, str, null, n);
            ((MenuItem)localObject1).a(localButtonInfo);
            localMenuItem.a((MenuItem)localObject1);
            break label285;
            localObject1 = "";
            break;
            str = "";
            break label198;
            n = 0;
            break label218;
            localObject1 = null;
            break label261;
            localObject1 = "";
            break label328;
            str = "";
            break label349;
          }
          label445:
          jdField_a_of_type_ComTencentBizUiCustomMenuBar.a(localMenuItem, a());
          m += 1;
        }
      }
    }
  }
  
  protected boolean c()
  {
    PublicAccountInfo localPublicAccountInfo = ((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    return (localPublicAccountInfo == null) || ((accountFlag & 0x10000000) == 0);
  }
  
  protected void d(boolean paramBoolean)
  {
    if (M)
    {
      if (paramBoolean)
      {
        if (jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.c() == null)
        {
          if (jdField_k_of_type_AndroidViewView == null) {
            aE();
          }
          jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setOverScrollHeader(jdField_k_of_type_AndroidViewView);
        }
        return;
      }
      jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setOverscrollHeader((Drawable)null);
      jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setOverScrollHeader((View)null);
      return;
    }
    super.d(paramBoolean);
  }
  
  protected void f()
  {
    PubAccountAssistantTipsBar localPubAccountAssistantTipsBar = new PubAccountAssistantTipsBar(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, this, jdField_a_of_type_MqqOsMqqHandler);
    ReaderTipsBar localReaderTipsBar = new ReaderTipsBar(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent());
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(localPubAccountAssistantTipsBar);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(localReaderTipsBar);
  }
  
  public void g()
  {
    if (!M) {
      super.g();
    }
  }
  
  protected void g(Intent paramIntent)
  {
    aI();
    super.g(paramIntent);
    if (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing())
    {
      if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount().equals(jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a()))) {
        jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(a());
      }
      localObject = jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a());
      c((List)localObject);
      jdField_a_of_type_MqqAppNewIntent = jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), jdField_b_of_type_MqqObserverBusinessObserver, false);
      if ((localObject != null) && (!((List)localObject).isEmpty())) {
        h(true);
      }
    }
    Object localObject = paramIntent.getStringExtra("from");
    if ((localObject != null) && (((String)localObject).equals("starShortcut"))) {
      PublicAccountManager.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramIntent.getStringExtra("starhomeurl"), paramIntent.getStringExtra("uin"), (String)localObject);
    }
  }
  
  public int h()
  {
    int m = 0;
    View localView = jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getChildAt(0);
    if ((jdField_l_of_type_AndroidViewView != null) && (localView != jdField_l_of_type_AndroidViewView))
    {
      dL = 0;
      jdField_l_of_type_AndroidViewView = localView;
      return 0;
    }
    if (localView != null) {
      m = -localView.getTop();
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "ScrollY: " + String.valueOf(m) + "  OldScrollY: " + String.valueOf(dL));
    }
    jdField_l_of_type_AndroidViewView = localView;
    return m;
  }
  
  /* Error */
  public void h(ChatMessage paramChatMessage)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 9
    //   3: aload_0
    //   4: getfield 875	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1	Lcom/tencent/mobileqq/activity/aio/ChatAdapter1;
    //   7: aload_1
    //   8: invokevirtual 2191	com/tencent/mobileqq/activity/aio/ChatAdapter1:a	(Lcom/tencent/mobileqq/data/ChatMessage;)I
    //   11: istore_2
    //   12: invokestatic 743	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   15: ifeq +30 -> 45
    //   18: ldc_w 2302
    //   21: iconst_2
    //   22: new 705	java/lang/StringBuilder
    //   25: dup
    //   26: invokespecial 706	java/lang/StringBuilder:<init>	()V
    //   29: ldc_w 2304
    //   32: invokevirtual 712	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: iload_2
    //   36: invokevirtual 2156	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   39: invokevirtual 715	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   42: invokestatic 751	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   45: iload_2
    //   46: ifge +4 -> 50
    //   49: return
    //   50: aload_0
    //   51: getfield 1480	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_ComTencentMobileqqBubbleChatXListView	Lcom/tencent/mobileqq/bubble/ChatXListView;
    //   54: invokevirtual 2305	com/tencent/mobileqq/bubble/ChatXListView:s	()I
    //   57: istore_3
    //   58: iload_2
    //   59: iload_3
    //   60: isub
    //   61: istore 4
    //   63: aload_0
    //   64: aload_0
    //   65: getfield 1480	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_ComTencentMobileqqBubbleChatXListView	Lcom/tencent/mobileqq/bubble/ChatXListView;
    //   68: iload 4
    //   70: invokevirtual 2291	com/tencent/mobileqq/bubble/ChatXListView:getChildAt	(I)Landroid/view/View;
    //   73: putfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   76: aload_0
    //   77: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   80: ifnonnull +66 -> 146
    //   83: invokestatic 743	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   86: ifeq +51 -> 137
    //   89: ldc_w 2302
    //   92: iconst_2
    //   93: new 705	java/lang/StringBuilder
    //   96: dup
    //   97: invokespecial 706	java/lang/StringBuilder:<init>	()V
    //   100: ldc_w 2307
    //   103: invokevirtual 712	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   106: iload 4
    //   108: invokevirtual 2156	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   111: ldc_w 2309
    //   114: invokevirtual 712	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: iload_3
    //   118: invokevirtual 2156	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   121: ldc_w 2311
    //   124: invokevirtual 712	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: iload_2
    //   128: invokevirtual 2156	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   131: invokevirtual 715	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   134: invokestatic 751	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   137: aload_0
    //   138: getfield 875	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1	Lcom/tencent/mobileqq/activity/aio/ChatAdapter1;
    //   141: aload_1
    //   142: invokevirtual 2312	com/tencent/mobileqq/activity/aio/ChatAdapter1:a	(Lcom/tencent/mobileqq/data/ChatMessage;)V
    //   145: return
    //   146: aload_0
    //   147: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   150: invokevirtual 2315	android/view/View:isDrawingCacheEnabled	()Z
    //   153: istore 5
    //   155: aload_0
    //   156: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   159: invokevirtual 2318	android/view/View:willNotCacheDrawing	()Z
    //   162: istore 6
    //   164: aload_0
    //   165: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   168: iconst_1
    //   169: invokevirtual 2321	android/view/View:setDrawingCacheEnabled	(Z)V
    //   172: aload_0
    //   173: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   176: iconst_0
    //   177: invokevirtual 2324	android/view/View:setWillNotCacheDrawing	(Z)V
    //   180: aload_0
    //   181: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   184: invokevirtual 2328	android/view/View:getDrawingCache	()Landroid/graphics/Bitmap;
    //   187: astore 7
    //   189: aload 9
    //   191: astore 8
    //   193: aload 7
    //   195: ifnull +10 -> 205
    //   198: aload 7
    //   200: invokestatic 2334	android/graphics/Bitmap:createBitmap	(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    //   203: astore 8
    //   205: invokestatic 743	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   208: ifeq +31 -> 239
    //   211: ldc_w 2302
    //   214: iconst_2
    //   215: new 705	java/lang/StringBuilder
    //   218: dup
    //   219: invokespecial 706	java/lang/StringBuilder:<init>	()V
    //   222: ldc_w 2336
    //   225: invokevirtual 712	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   228: aload 8
    //   230: invokevirtual 2339	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   233: invokevirtual 715	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   236: invokestatic 751	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   239: aload 8
    //   241: ifnull +273 -> 514
    //   244: aload_0
    //   245: getfield 2341	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_c_of_type_AndroidViewViewGroup	Landroid/view/ViewGroup;
    //   248: ifnull -199 -> 49
    //   251: new 430	android/widget/ImageView
    //   254: dup
    //   255: aload_0
    //   256: getfield 900	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   259: invokespecial 431	android/widget/ImageView:<init>	(Landroid/content/Context;)V
    //   262: astore 9
    //   264: aload 9
    //   266: aload 8
    //   268: invokevirtual 2345	android/widget/ImageView:setImageBitmap	(Landroid/graphics/Bitmap;)V
    //   271: new 2347	android/widget/FrameLayout
    //   274: dup
    //   275: aload_0
    //   276: getfield 900	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   279: invokespecial 2348	android/widget/FrameLayout:<init>	(Landroid/content/Context;)V
    //   282: astore 10
    //   284: new 2350	android/widget/FrameLayout$LayoutParams
    //   287: dup
    //   288: aload_0
    //   289: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   292: invokevirtual 2353	android/view/View:getWidth	()I
    //   295: aload_0
    //   296: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   299: invokevirtual 1471	android/view/View:getHeight	()I
    //   302: invokespecial 2354	android/widget/FrameLayout$LayoutParams:<init>	(II)V
    //   305: astore 7
    //   307: aload 7
    //   309: bipush 51
    //   311: putfield 2355	android/widget/FrameLayout$LayoutParams:gravity	I
    //   314: aload 7
    //   316: aload_0
    //   317: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   320: invokevirtual 2358	android/view/View:getLeft	()I
    //   323: putfield 2361	android/widget/FrameLayout$LayoutParams:leftMargin	I
    //   326: aload 7
    //   328: aload_0
    //   329: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   332: invokevirtual 2294	android/view/View:getTop	()I
    //   335: putfield 2362	android/widget/FrameLayout$LayoutParams:topMargin	I
    //   338: aload 7
    //   340: iconst_0
    //   341: putfield 2365	android/widget/FrameLayout$LayoutParams:rightMargin	I
    //   344: aload 7
    //   346: iconst_0
    //   347: putfield 2366	android/widget/FrameLayout$LayoutParams:bottomMargin	I
    //   350: aload_0
    //   351: getfield 2341	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_c_of_type_AndroidViewViewGroup	Landroid/view/ViewGroup;
    //   354: aload 10
    //   356: aload 7
    //   358: invokevirtual 2367	android/view/ViewGroup:addView	(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    //   361: aload 10
    //   363: aload 9
    //   365: new 2350	android/widget/FrameLayout$LayoutParams
    //   368: dup
    //   369: iconst_m1
    //   370: iconst_m1
    //   371: invokespecial 2354	android/widget/FrameLayout$LayoutParams:<init>	(II)V
    //   374: invokevirtual 2368	android/widget/FrameLayout:addView	(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    //   377: aload_0
    //   378: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   381: iconst_4
    //   382: invokevirtual 1911	android/view/View:setVisibility	(I)V
    //   385: new 2370	android/view/animation/LinearInterpolator
    //   388: dup
    //   389: invokespecial 2371	android/view/animation/LinearInterpolator:<init>	()V
    //   392: astore 11
    //   394: new 2373	android/view/animation/AnimationSet
    //   397: dup
    //   398: iconst_1
    //   399: invokespecial 2374	android/view/animation/AnimationSet:<init>	(Z)V
    //   402: astore 12
    //   404: new 2376	android/view/animation/AlphaAnimation
    //   407: dup
    //   408: fconst_1
    //   409: fconst_0
    //   410: invokespecial 2379	android/view/animation/AlphaAnimation:<init>	(FF)V
    //   413: astore 7
    //   415: aload 7
    //   417: ldc2_w 2380
    //   420: invokevirtual 2382	android/view/animation/AlphaAnimation:setDuration	(J)V
    //   423: aload 7
    //   425: aload 11
    //   427: invokevirtual 2386	android/view/animation/AlphaAnimation:setInterpolator	(Landroid/view/animation/Interpolator;)V
    //   430: aload 12
    //   432: aload 7
    //   434: invokevirtual 2389	android/view/animation/AnimationSet:addAnimation	(Landroid/view/animation/Animation;)V
    //   437: aload_1
    //   438: invokevirtual 2392	com/tencent/mobileqq/data/ChatMessage:isSend	()Z
    //   441: ifeq +133 -> 574
    //   444: new 1487	android/view/animation/TranslateAnimation
    //   447: dup
    //   448: fconst_0
    //   449: aload_0
    //   450: getfield 2394	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_b_of_type_AndroidViewView	Landroid/view/View;
    //   453: invokevirtual 2397	android/view/View:getRight	()I
    //   456: i2f
    //   457: fconst_0
    //   458: fconst_0
    //   459: invokespecial 1490	android/view/animation/TranslateAnimation:<init>	(FFFF)V
    //   462: astore 7
    //   464: aload 7
    //   466: ldc2_w 2380
    //   469: invokevirtual 1498	android/view/animation/TranslateAnimation:setDuration	(J)V
    //   472: aload 7
    //   474: aload 11
    //   476: invokevirtual 2398	android/view/animation/TranslateAnimation:setInterpolator	(Landroid/view/animation/Interpolator;)V
    //   479: aload 12
    //   481: aload 7
    //   483: invokevirtual 2389	android/view/animation/AnimationSet:addAnimation	(Landroid/view/animation/Animation;)V
    //   486: aload 9
    //   488: aload 12
    //   490: invokevirtual 2399	android/widget/ImageView:startAnimation	(Landroid/view/animation/Animation;)V
    //   493: aload_0
    //   494: getfield 315	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   497: new 2401	lka
    //   500: dup
    //   501: aload_0
    //   502: aload 10
    //   504: invokespecial 2404	lka:<init>	(Lcom/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie;Landroid/widget/FrameLayout;)V
    //   507: ldc2_w 2380
    //   510: invokevirtual 2408	mqq/os/MqqHandler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   513: pop
    //   514: aload_0
    //   515: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   518: iload 5
    //   520: invokevirtual 2321	android/view/View:setDrawingCacheEnabled	(Z)V
    //   523: aload_0
    //   524: getfield 238	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_h_of_type_AndroidViewView	Landroid/view/View;
    //   527: iload 6
    //   529: invokevirtual 2324	android/view/View:setWillNotCacheDrawing	(Z)V
    //   532: aload 8
    //   534: ifnull +64 -> 598
    //   537: aload_0
    //   538: getfield 315	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   541: new 2410	lkb
    //   544: dup
    //   545: aload_0
    //   546: aload_1
    //   547: invokespecial 2413	lkb:<init>	(Lcom/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie;Lcom/tencent/mobileqq/data/ChatMessage;)V
    //   550: ldc2_w 2414
    //   553: invokevirtual 2408	mqq/os/MqqHandler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   556: pop
    //   557: return
    //   558: astore 7
    //   560: aconst_null
    //   561: astore 7
    //   563: goto -374 -> 189
    //   566: astore 7
    //   568: aconst_null
    //   569: astore 7
    //   571: goto -382 -> 189
    //   574: new 1487	android/view/animation/TranslateAnimation
    //   577: dup
    //   578: fconst_0
    //   579: aload_0
    //   580: getfield 2394	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_b_of_type_AndroidViewView	Landroid/view/View;
    //   583: invokevirtual 2397	android/view/View:getRight	()I
    //   586: ineg
    //   587: i2f
    //   588: fconst_0
    //   589: fconst_0
    //   590: invokespecial 1490	android/view/animation/TranslateAnimation:<init>	(FFFF)V
    //   593: astore 7
    //   595: goto -131 -> 464
    //   598: aload_0
    //   599: getfield 875	com/tencent/mobileqq/activity/aio/rebuild/PublicAccountChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1	Lcom/tencent/mobileqq/activity/aio/ChatAdapter1;
    //   602: aload_1
    //   603: invokevirtual 2312	com/tencent/mobileqq/activity/aio/ChatAdapter1:a	(Lcom/tencent/mobileqq/data/ChatMessage;)V
    //   606: return
    //   607: astore 7
    //   609: aload 9
    //   611: astore 8
    //   613: goto -408 -> 205
    //   616: astore 7
    //   618: aload 9
    //   620: astore 8
    //   622: goto -417 -> 205
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	625	0	this	PublicAccountChatPie
    //   0	625	1	paramChatMessage	ChatMessage
    //   11	117	2	m	int
    //   57	61	3	n	int
    //   61	46	4	i1	int
    //   153	366	5	bool1	boolean
    //   162	366	6	bool2	boolean
    //   187	295	7	localObject1	Object
    //   558	1	7	localException1	Exception
    //   561	1	7	localObject2	Object
    //   566	1	7	localOutOfMemoryError1	OutOfMemoryError
    //   569	25	7	localTranslateAnimation	TranslateAnimation
    //   607	1	7	localException2	Exception
    //   616	1	7	localOutOfMemoryError2	OutOfMemoryError
    //   191	430	8	localObject3	Object
    //   1	618	9	localImageView	ImageView
    //   282	221	10	localFrameLayout	android.widget.FrameLayout
    //   392	83	11	localLinearInterpolator	android.view.animation.LinearInterpolator
    //   402	87	12	localAnimationSet	android.view.animation.AnimationSet
    // Exception table:
    //   from	to	target	type
    //   180	189	558	java/lang/Exception
    //   180	189	566	java/lang/OutOfMemoryError
    //   198	205	607	java/lang/Exception
    //   198	205	616	java/lang/OutOfMemoryError
  }
  
  public void h(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
      if (jdField_a_of_type_ComTencentBizUiCustomMenuBar != null) {
        jdField_a_of_type_ComTencentBizUiCustomMenuBar.setVisibility(0);
      }
      if (jdField_a_of_type_AndroidWidgetLinearLayout != null) {
        jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(4);
      }
      if (jdField_e_of_type_AndroidViewView != null) {
        jdField_e_of_type_AndroidViewView.setVisibility(4);
      }
      if (jdField_f_of_type_AndroidViewView != null) {
        jdField_f_of_type_AndroidViewView.setVisibility(4);
      }
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return super.handleMessage(paramMessage);
      if (jdField_i_of_type_AndroidViewView != null)
      {
        jdField_i_of_type_AndroidViewView.setVisibility(0);
        jdField_a_of_type_MqqOsMqqHandler.removeMessages(20);
        jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(20, 10000L);
        continue;
        jdField_a_of_type_MqqOsMqqHandler.removeMessages(20);
        if ((jdField_i_of_type_AndroidViewView != null) && (jdField_i_of_type_AndroidViewView.getVisibility() == 0))
        {
          jdField_i_of_type_AndroidViewView.setVisibility(8);
          continue;
          a(jdField_a_of_type_ComTencentMobileqqBubbleChatXListView);
          continue;
          if (QLog.isColorLevel()) {
            QLog.d("Q.aio.BaseChatPie", 2, "ChatActivityConstants.MSG_PUBLICACCOUNT_ACCOUNTDETAIL");
          }
          Object localObject = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
          if (localObject != null)
          {
            localObject = ((PublicAccountDataManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
            if (localObject != null)
            {
              jdField_b_of_type_AndroidWidgetTextView.setText(name);
              if (H)
              {
                a((AccountDetail)localObject);
                H = false;
              }
              if (jdField_g_of_type_AndroidAppDialog == null) {}
              aA();
            }
          }
          if (G)
          {
            G = false;
            jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.a(jdField_a_of_type_ComTencentMobileqqDataAccountDetail);
            au();
            continue;
            jdField_a_of_type_ComTencentBizUiCustomMenuBar.b();
          }
        }
      }
    }
  }
  
  protected void i(int paramInt)
  {
    super.i(paramInt);
    ImageSpan localImageSpan;
    SpannableString localSpannableString;
    if (paramInt != jdField_l_of_type_Int)
    {
      if (paramInt != 1) {
        break label84;
      }
      if (jdField_a_of_type_AndroidTextSpannableString == null)
      {
        localImageSpan = new ImageSpan(jdField_a_of_type_AndroidContentContext, 2130837571);
        localSpannableString = new SpannableString("文字输入");
        localSpannableString.setSpan(localImageSpan, 0, localSpannableString.length(), 33);
        jdField_a_of_type_AndroidTextSpannableString = localSpannableString;
      }
      jdField_b_of_type_ComTencentWidgetPatchedButton.setText(jdField_a_of_type_AndroidTextSpannableString);
    }
    label84:
    label323:
    for (;;)
    {
      aD();
      return;
      if (paramInt == 2)
      {
        if (jdField_b_of_type_AndroidTextSpannableString == null)
        {
          localImageSpan = new ImageSpan(jdField_a_of_type_AndroidContentContext, 2130837674);
          localSpannableString = new SpannableString("语音输入");
          localSpannableString.setSpan(localImageSpan, 0, localSpannableString.length(), 33);
          jdField_b_of_type_AndroidTextSpannableString = localSpannableString;
        }
        jdField_b_of_type_ComTencentWidgetPatchedButton.setText(jdField_b_of_type_AndroidTextSpannableString);
        if (VersionUtils.e())
        {
          if (jdField_h_of_type_AndroidWidgetImageView != null) {
            jdField_h_of_type_AndroidWidgetImageView.setAlpha(0.6F);
          }
          jdField_a_of_type_ComTencentWidgetXEditTextEx.setAlpha(0.6F);
          jdField_b_of_type_ComTencentWidgetPatchedButton.setAlpha(0.6F);
        }
      }
      else
      {
        if (jdField_b_of_type_AndroidTextSpannableString == null)
        {
          localImageSpan = new ImageSpan(jdField_a_of_type_AndroidContentContext, 2130837674);
          localSpannableString = new SpannableString("语音输入");
          localSpannableString.setSpan(localImageSpan, 0, localSpannableString.length(), 33);
          jdField_b_of_type_AndroidTextSpannableString = localSpannableString;
        }
        if (jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() > 0) {
          jdField_b_of_type_ComTencentWidgetPatchedButton.setText(2131367607);
        }
        for (;;)
        {
          if (!VersionUtils.e()) {
            break label323;
          }
          if (jdField_h_of_type_AndroidWidgetImageView != null) {
            jdField_h_of_type_AndroidWidgetImageView.setAlpha(1.0F);
          }
          jdField_a_of_type_ComTencentWidgetXEditTextEx.setAlpha(1.0F);
          jdField_b_of_type_ComTencentWidgetPatchedButton.setAlpha(1.0F);
          break;
          jdField_b_of_type_ComTencentWidgetPatchedButton.setText(jdField_b_of_type_AndroidTextSpannableString);
        }
      }
    }
  }
  
  protected void i(boolean paramBoolean)
  {
    int n = 8;
    if (jdField_i_of_type_AndroidWidgetImageView == null) {
      return;
    }
    jdField_i_of_type_AndroidWidgetImageView.clearAnimation();
    Object localObject = jdField_i_of_type_AndroidWidgetImageView;
    if (paramBoolean)
    {
      m = 0;
      label30:
      ((ImageView)localObject).setVisibility(m);
      localObject = jdField_a_of_type_ComTencentWidgetXEditTextEx;
      m = n;
      if (!paramBoolean) {
        m = 0;
      }
      ((XEditTextEx)localObject).setVisibility(m);
      if (jdField_e_of_type_Boolean)
      {
        localObject = jdField_b_of_type_ComTencentWidgetPatchedButton;
        if (!paramBoolean) {
          break label159;
        }
      }
    }
    label159:
    for (int m = 4;; m = 0)
    {
      ((PatchedButton)localObject).setVisibility(m);
      if (!paramBoolean) {
        break;
      }
      if (jdField_a_of_type_AndroidTextSpannableString == null)
      {
        localObject = new ImageSpan(jdField_a_of_type_AndroidContentContext, 2130837571);
        SpannableString localSpannableString = new SpannableString("文字输入");
        localSpannableString.setSpan(localObject, 0, localSpannableString.length(), 33);
        jdField_a_of_type_AndroidTextSpannableString = localSpannableString;
      }
      jdField_b_of_type_ComTencentWidgetPatchedButton.setText(jdField_a_of_type_AndroidTextSpannableString);
      return;
      m = 8;
      break label30;
    }
  }
  
  protected void l()
  {
    super.l();
    aA();
  }
  
  public void m()
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("need_finish", true);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
    localIntent.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    if (jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg != null) {
      localIntent.putExtra("public_account_msg_id", jdField_a_of_type_ComTencentMobileqqStructmsgAbsStructMsg.msgId);
    }
    if ((1 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int) || (1000 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int) || (1020 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int) || (1004 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) {
      localIntent.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    }
    PublicAccountUtil.a(localIntent, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getActivity(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, -1, 2000, 1);
  }
  
  protected void o()
  {
    if (jdField_a_of_type_AndroidWidgetImageView != null)
    {
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130842631);
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getText(2131364407));
    }
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == 2131296338) {
      h(true);
    }
    if (2131297324 == paramView.getId())
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004EFD", "0X8004EFD", 0, 0, "", "", "", "");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8004F08", "0X8004F08", 0, 0, "", "", "", "");
    }
    if (paramView.getId() == 2131297346)
    {
      long l1 = System.currentTimeMillis();
      if ((QLog.isColorLevel()) && (jdField_i_of_type_AndroidWidgetImageView != null)) {
        QLog.d("Q.aio.BaseChatPie", 2, " onClick fun_btn start mInputStat = " + jdField_l_of_type_Int + " text.length " + jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() + "mAudioBtn visibility:" + jdField_i_of_type_AndroidWidgetImageView.getVisibility() + " currentPanel:" + jdField_a_of_type_ComTencentWidgetXPanelContainer.a() + " currenttime:" + System.currentTimeMillis());
      }
      if ((jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() > 0) && (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 2) && (jdField_i_of_type_AndroidWidgetImageView != null) && (jdField_i_of_type_AndroidWidgetImageView.getVisibility() != 0))
      {
        c();
        if (PAWeatherItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
        {
          if ((jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 1) && (((InputMethodManager)jdField_a_of_type_AndroidContentContext.getSystemService("input_method")).isActive(jdField_a_of_type_ComTencentWidgetXEditTextEx))) {
            jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
          }
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "weather_public_account", "", "weather_public_account", "city_search_click", 0, 0, "", "", "", "");
        }
      }
      if (QLog.isColorLevel())
      {
        long l2 = System.currentTimeMillis();
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, " onClick fun_btn end mInputStat = " + jdField_l_of_type_Int + "text.length" + jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() + "cast time :" + (l2 - l1));
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X800584F", "0X800584F", 0, 0, "", "", "", "");
      }
    }
    if ((paramView.getId() == 2131297759) && (jdField_l_of_type_Int != 1))
    {
      if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 3)
      {
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a(1);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "0X8005796", 0, 0, "", "", "", "");
      }
    }
    else
    {
      if (paramView.getId() == 2131298591)
      {
        ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 8) {
          break label926;
        }
        if (jdField_h_of_type_AndroidWidgetImageView != null) {
          jdField_h_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131370848));
        }
        if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewFastImagePreviewLayout != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewFastImagePreviewLayout.getVisibility() == 0))
        {
          if (QLog.isColorLevel()) {
            QLog.d("fastimage", 2, "BaseCHatPie onClick keybordicon removeFastImage");
          }
          a(true);
        }
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a(1);
      }
      label622:
      if (paramView.getId() == 2131298592)
      {
        if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 2) {
          break label996;
        }
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
        if (jdField_i_of_type_AndroidWidgetImageView != null)
        {
          jdField_i_of_type_AndroidWidgetImageView.setImageResource(jdField_i_of_type_Int);
          jdField_i_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367382));
        }
      }
      label689:
      if (paramView.getId() == 2131296333) {
        W();
      }
      if (M)
      {
        if (paramView.getId() == 2131297346) {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8005C9C", "0X8005C9C", 0, 1, 0, "", "", "", "");
        }
        if ((N) && (paramView.getId() == 2131297322))
        {
          jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
          jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.a(0, 0, jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.s() * 100);
        }
      }
      if ((!(paramView.getTag() instanceof String)) || (!PubAccountTipsManager.jdField_a_of_type_JavaLangString.equals((String)paramView.getTag())) || (jdField_a_of_type_AndroidContentContext == null) || (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        break label1169;
      }
      if (System.currentTimeMillis() - jdField_j_of_type_Long >= 1000L) {
        break label1045;
      }
    }
    label926:
    label996:
    label1045:
    Object localObject1;
    Object localObject2;
    label1169:
    do
    {
      return;
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(3);
      if ((jdField_i_of_type_AndroidWidgetImageView != null) && (jdField_i_of_type_AndroidWidgetImageView.getVisibility() == 0)) {
        i(false);
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "0X8005795", 0, 0, "", "", "", "");
      break;
      S();
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(8);
      if ((jdField_i_of_type_AndroidWidgetImageView != null) && (jdField_i_of_type_AndroidWidgetImageView.getVisibility() == 0)) {
        i(false);
      }
      if (jdField_h_of_type_AndroidWidgetImageView != null) {
        jdField_h_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131370849));
      }
      i(0);
      break label622;
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(2);
      if (jdField_i_of_type_AndroidWidgetImageView == null) {
        break label689;
      }
      jdField_i_of_type_AndroidWidgetImageView.setImageResource(jdField_j_of_type_Int);
      jdField_i_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367383));
      break label689;
      jdField_j_of_type_Long = System.currentTimeMillis();
      localObject1 = new StringBuilder("http://gouwu.qq.com/m/html/shop_map.html?_wv=1027&shop_uin=");
      ((StringBuilder)localObject1).append(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      localObject2 = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
      ((Intent)localObject2).putExtra("url", ((StringBuilder)localObject1).toString());
      ((Intent)localObject2).putExtra("hide_more_button", true);
      ((Intent)localObject2).putExtra("webStyle", "noBottomBar");
      jdField_a_of_type_AndroidContentContext.startActivity((Intent)localObject2);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Shop_lifeservice", "", "Shop_nearbyiconClk", "Clk_shopnearbyicon", 0, 0, "", "", "", "");
      if (paramView.getId() != 2131297337) {
        break label1362;
      }
      localObject2 = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
      localObject1 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if ((localObject2 == null) || (localObject1 == null) || (!((EcShopAssistantManager)localObject2).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {
        break label1430;
      }
      localObject2 = (String)EcShopAssistantManager.a.get(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    } while (TextUtils.isEmpty((CharSequence)localObject2));
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, SplashActivity.class);
    localIntent.putExtra("uin", (String)localObject2);
    localIntent = AIOUtils.a(localIntent, null);
    if (((FriendsManager)localObject1).b((String)localObject2))
    {
      localIntent.putExtra("uintype", 0);
      jdField_a_of_type_AndroidContentContext.startActivity(localIntent);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Shop_customservice", "Clk_shopcustomservice", 0, 0, "", "", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    }
    for (;;)
    {
      label1362:
      super.onClick(paramView);
      return;
      localIntent.putExtra("uintype", 1005);
      localIntent.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d + "-客服");
      localIntent.putExtra("key_sub_title_from", "来自\"QQ咨询\"");
      break;
      label1430:
      C2BUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, "publicAccountAIOTitle");
      if (QLog.isColorLevel()) {
        QLog.w("Q.aio.BaseChatPie", 2, "c2bcall button :" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + ", name = " + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
      }
    }
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    R = true;
    return super.onTouch(paramView, paramMotionEvent);
  }
  
  public void q(int paramInt)
  {
    if ((!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing()) && (jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog != null))
    {
      jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(paramInt);
      if (!jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing()) {
        jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
      }
    }
  }
  
  protected boolean q()
  {
    if ((!V) && (M))
    {
      V = true;
      jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setSelection(jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount() - 1);
    }
    while ((W) || (!M)) {
      return true;
    }
    W = true;
    return false;
  }
  
  public void r(int paramInt)
  {
    Toast.makeText(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), paramInt, 0).show();
  }
  
  public void s(int paramInt)
  {
    try
    {
      jdField_g_of_type_AndroidWidgetTextView.setText(paramInt);
      jdField_g_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_k_of_type_AndroidWidgetImageView.setVisibility(8);
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
      return;
    }
    catch (Exception localException) {}
  }
  
  public boolean s()
  {
    Object localObject = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
    if (localObject != null) {}
    for (localObject = ((PublicAccountDataManager)localObject).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);; localObject = null)
    {
      if ((localObject == null) && (PublicAccountUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) == null))
      {
        PublicAccountUtil.a();
        PublicAccountUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplication.getContext(), jdField_a_of_type_MqqOsMqqHandler, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        return true;
      }
      return false;
    }
  }
  
  public void t(int paramInt)
  {
    try
    {
      jdField_k_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_g_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
      switch (paramInt)
      {
      }
      for (;;)
      {
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(7);
        return;
        jdField_g_of_type_AndroidWidgetTextView.setText(2131368314);
        continue;
        jdField_g_of_type_AndroidWidgetTextView.setText(2131368310);
        continue;
        jdField_g_of_type_AndroidWidgetTextView.setText(2131364353);
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  public boolean t()
  {
    boolean bool = false;
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localObject != null)
    {
      localObject = ((QQMessageFacade)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 1008);
      if (localObject != null) {
        if (msgtype == 63525)
        {
          localMessageForStructing = new MessageForStructing();
          MessageForStructing.copyMessageRecordBaseField(localMessageForStructing, (MessageRecord)localObject);
          localMessageForStructing.parse();
          if ((structingMsg != null) && ((structingMsg.mPromotionType == 1) || (structingMsg.mPromotionType == 2))) {
            a(localMessageForStructing);
          }
        }
        else
        {
          while ((msgtype == 63527) && (((QQMessageFacade.Message)localObject).isSend()))
          {
            MessageForStructing localMessageForStructing;
            return true;
          }
          if (msgtype == 60527) {
            try
            {
              localObject = BitAppMsgFactory.a(msgData);
              if (localObject != null)
              {
                localObject = ((BitAppMsg)localObject).getNode();
                if (localObject != null)
                {
                  int m = Integer.parseInt(((BitAppMsgNode)localObject).a("promotionType"));
                  if ((m == 1) || (m == 2)) {
                    bool = true;
                  }
                  return bool;
                }
              }
            }
            catch (Exception localException) {}
          }
        }
      }
    }
    return false;
  }
  
  protected void u()
  {
    if (C)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.BaseChatPie", 2, "hasDestory = true return");
      }
      return;
    }
    PublicAccountUtil.a();
    if (jdField_b_of_type_MqqAppNewIntent != null) {
      PublicAccountManager.a().a(jdField_b_of_type_MqqAppNewIntent);
    }
    if (jdField_c_of_type_MqqAppNewIntent != null) {
      jdField_c_of_type_MqqAppNewIntent.setObserver(null);
    }
    if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver != null)
    {
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.removeObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = null;
    }
    super.u();
    if (jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager != null)
    {
      jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(a());
      jdField_a_of_type_ComTencentBizPubaccountPublicAccountManager.a(jdField_a_of_type_AndroidContentContext);
    }
    Iterator localIterator = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a().iterator();
    while (localIterator.hasNext())
    {
      Object localObject1 = (ChatMessage)localIterator.next();
      if (MessageForStructing.class.isInstance(localObject1))
      {
        Object localObject2 = structingMsg;
        if (StructMsgForGeneralShare.class.isInstance(localObject2))
        {
          localObject2 = (StructMsgForGeneralShare)localObject2;
          if (isDynamicMsg)
          {
            ((StructMsgForGeneralShare)localObject2).clearExpanded();
            hasNotReadCount = 0;
            DynamicMsgInfoManager localDynamicMsgInfoManager = (DynamicMsgInfoManager)jdField_a_of_type_AndroidSupportV4AppFragmentActivity.app.getManager(99);
            if (frienduin != null) {
              localDynamicMsgInfoManager.b(frienduin);
            }
          }
          ((StructMsgForGeneralShare)localObject2).unInitPay();
        }
      }
      if ((M) && (N) && (MessageForPic.class.isInstance(localObject1)))
      {
        localObject1 = (MessageForPic)localObject1;
        aiofileType = -1;
        subThumbWidth = -1;
        subThumbHeight = -1;
      }
    }
    if ((jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) && (jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing()))
    {
      jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      jdField_b_of_type_ComTencentMobileqqWidgetQQProgressDialog = null;
    }
    if ((jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) && (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing()))
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar != null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.a();
    }
    if (jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler != null) {
      jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler.d();
    }
    at();
  }
  
  public boolean u()
  {
    return I;
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    super.update(paramObservable, paramObject);
    if ((paramObservable instanceof TroopEntranceBar))
    {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.b();
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            if (!(paramObservable instanceof QQMessageFacade)) {
              break;
            }
          } while (jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar == null);
          paramObject = (TroopManager)jdField_a_of_type_AndroidSupportV4AppFragmentActivity.app.getManager(51);
          paramObservable = ((QQMessageFacade)paramObservable).a();
        } while (paramObservable == null);
        paramObservable = paramObject.b(frienduin);
      } while ((paramObservable == null) || (associatePubAccount != Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue()));
      paramObject = Message.obtain();
      what = 9;
      Bundle localBundle = new Bundle();
      localBundle.putString("troopUin", troopuin);
      paramObject.setData(localBundle);
      jdField_a_of_type_AndroidOsHandler.sendMessage(paramObject);
      return;
      paramObservable = PubAccountAssistantManager.a();
      if (paramObservable != null) {
        paramObservable.d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
    } while ((!(paramObject instanceof MessageRecord)) || (!(paramObject instanceof MessageForPubAccount)) || (!PAWeatherItemBuilder.a(frienduin)));
    au();
  }
  
  protected void x()
  {
    super.x();
    long l1 = NetConnInfoCenter.getServerTime() * 1000L;
    if (!jdField_b_of_type_JavaUtilList.isEmpty())
    {
      int m = jdField_b_of_type_JavaUtilList.size() - 1;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8005C35", "0X8005C35", 0, 1, 0, (String)jdField_b_of_type_JavaUtilList.get(m), String.valueOf(jdField_g_of_type_Long), String.valueOf(l1), (String)jdField_c_of_type_JavaUtilList.get(m));
    }
    if (M)
    {
      if (N) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8005D16", "0X8005D16", 0, 1, 0, "new", String.valueOf(l1 - jdField_i_of_type_Long), "", "");
      }
    }
    else {
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8005D16", "0X8005D16", 0, 1, 0, "old", String.valueOf(l1 - jdField_i_of_type_Long), "", "");
  }
  
  protected void y()
  {
    super.y();
    if (U) {
      BitAppAbilityUtils.a();
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.i("bitapp_performance", 2, "PublicaccountChatPie doOnPause, don't contain lolaMsg");
  }
  
  protected void z()
  {
    super.z();
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(39, 500L);
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopEntranceBar.c();
    }
    if ((PAWeatherItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_ComTencentWidgetXEditTextEx != null)) {
      jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint("输城市名查天气");
    }
    if ((!Y) && (Z))
    {
      Z = false;
      ThreadManager.a(new ljz(this), null, true);
    }
    if (jdField_a_of_type_AndroidOsHandler != null) {
      jdField_a_of_type_AndroidOsHandler.postDelayed(new lkg(this), 3000L);
    }
    if ((M) && (N)) {
      if (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getChatFragment().a != null) {
        jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getChatFragment().a.b(-16777216);
      }
    }
    try
    {
      Object localObject = new BitmapDrawable(jdField_a_of_type_AndroidContentContext.getResources(), BitmapFactory.decodeResource(jdField_a_of_type_AndroidContentContext.getResources(), 2130838634));
      int m = Color.parseColor("#e0e1e1");
      ((BitmapDrawable)localObject).setAlpha(153);
      ((BitmapDrawable)localObject).setColorFilter(m, PorterDuff.Mode.DST_ATOP);
      ((BitmapDrawable)localObject).setTileModeXY(Shader.TileMode.REPEAT, Shader.TileMode.REPEAT);
      ((BitmapDrawable)localObject).setDither(true);
      if (Build.VERSION.SDK_INT < 16) {
        jdField_a_of_type_ComTencentWidgetXPanelContainer.setBackgroundDrawable((Drawable)localObject);
      }
      for (;;)
      {
        jdField_i_of_type_Long = (NetConnInfoCenter.getServerTime() * 1000L);
        if ((M) && (N) && (jdField_a_of_type_ComTencentMobileqqDataMessageForPic != null)) {
          aO();
        }
        if ((!ChatActivityUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo)) && (!C2BUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int))) {
          break;
        }
        jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
        jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(this);
        localObject = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
        EcShopHandler localEcShopHandler = (EcShopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(68);
        if ((localObject != null) && (localEcShopHandler != null) && (((EcShopAssistantManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          long l1 = 0L;
          if (EcShopAssistantManager.b.get(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) != null) {
            l1 = ((Long)EcShopAssistantManager.b.get(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)).longValue();
          }
          if ((!TextUtils.isEmpty((String)EcShopAssistantManager.a.get(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) && (System.currentTimeMillis() - l1 <= EcShopAssistantManager.c)) {
            break label562;
          }
          EcShopAssistantManager.b.put(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, Long.valueOf(System.currentTimeMillis()));
          localEcShopHandler.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        }
        return;
        jdField_a_of_type_ComTencentWidgetXPanelContainer.setBackground((Drawable)localObject);
      }
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;)
      {
        jdField_a_of_type_ComTencentWidgetXPanelContainer.setBackgroundDrawable(null);
        jdField_a_of_type_ComTencentWidgetXPanelContainer.setBackgroundColor(Color.parseColor("#e0e1e1"));
        continue;
        jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
      }
      label562:
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130841102);
    }
  }
}
