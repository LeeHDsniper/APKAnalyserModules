package com.tencent.mobileqq.activity.recent;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler.Callback;
import android.os.Message;
import android.text.Html;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.smallscreen.SmallScreenUtils;
import com.tencent.av.utils.UITools;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.ConfigHandler;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.PhoneUnityBannerData;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.app.upgrade.UpgradeController;
import com.tencent.mobileqq.app.upgrade.UpgradeDetailWrapper;
import com.tencent.mobileqq.app.upgrade.UpgradeDetailWrapper.NewApkInfo;
import com.tencent.mobileqq.config.Config;
import com.tencent.mobileqq.config.ConfigManager;
import com.tencent.mobileqq.config.splashlogo.ConfigServlet;
import com.tencent.mobileqq.config.struct.PicAndAdConf;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.filemanager.fileviewer.FileViewMusicService;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import com.tencent.mobileqq.music.QQPlayerService;
import com.tencent.mobileqq.music.SongInfo;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.mobileqq.redtouch.RedTouchManager;
import com.tencent.mobileqq.redtouch.VipBannerInfo;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.struct.PushBanner;
import com.tencent.mobileqq.util.CommonUtil;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.utils.CustomHandler;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.mobileqq.widget.ADView;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.AppInfo;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView.LayoutParams;
import com.tencent.widget.XListView;
import cooperation.qlink.QQProxyForQlink;
import cooperation.qlink.QlAndQQInterface.WorkState;
import cooperation.qqhotspot.QQHotSpotHelper.APConnInfo;
import cooperation.qqhotspot.WifiConversationManager;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import met;
import meu;
import mev;
import mew;
import mex;
import mey;
import mez;
import mfa;
import mfb;
import mfc;
import mfd;
import mfe;
import mff;
import mfg;
import mfh;
import mfi;
import mfj;
import mfl;
import mfn;
import mfo;
import mfp;
import mfq;
import mfs;
import mft;
import mfu;
import mfv;
import mfw;
import mfx;
import mfy;
import mqq.app.AppRuntime;
import mqq.manager.TicketManager;
import mqq.os.MqqHandler;

public class BannerManager
  implements Handler.Callback
{
  public static final int A = 23;
  public static final int B = 23;
  public static final int C = 24;
  public static final int D = 24;
  public static final int E = 25;
  public static final int F = 26;
  public static final int G = 26;
  public static final int H = 26;
  public static final int I = 3;
  public static final int J = 0;
  public static final int K = 1;
  public static final int L = 2;
  public static final int M = 900000;
  public static final int O = 0;
  public static final int P = 1;
  public static final int Q = 4;
  public static final int R = 6;
  public static final int S = 8;
  public static final int T = 7;
  public static final int U = 9;
  public static final int V = 10;
  public static final int W = 12;
  private static final int X = 11;
  private static final int Y = 13;
  private static final int Z = 14;
  public static final int a = 1;
  public static final String a = "0X8004028";
  public static final boolean a;
  private static final int aa = 15;
  private static final int ab = 101;
  public static final int b = 1;
  public static final String b = "0X8004029";
  public static final int c = 1;
  public static final String c = "Q.recent.banner";
  public static final int d = 2;
  public static final int e = 3;
  public static final int f = 4;
  private static final boolean f = false;
  public static final int g = 5;
  public static final int h = 6;
  private static final String h = "0X80040AA";
  public static final int i = 7;
  public static final int j = 8;
  public static final int k = 9;
  public static final int l = 10;
  public static final int m = 11;
  public static final int n = 12;
  public static final int o = 13;
  public static final int p = 14;
  public static final int q = 15;
  public static final int r = 16;
  public static final int s = 17;
  public static final int t = 18;
  public static final int u = 19;
  public static final int v = 19;
  public static final int w = 20;
  public static final int x = 20;
  public static final int y = 21;
  public static final int z = 22;
  public int N;
  private SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  private PollBanner jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner;
  public RecentCallHelper a;
  private BaseActivity jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
  private PhoneContactManager.IPhoneContactListener jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler = new CustomHandler(this);
  private Banner[] jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner = new Banner[27];
  private SparseArray b;
  public boolean b;
  boolean c = false;
  public String d;
  private boolean d;
  public String e;
  private boolean e;
  public String f;
  private String jdField_g_of_type_JavaLangString = "";
  private boolean jdField_g_of_type_Boolean = true;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = AppSetting.i;
  }
  
  public BannerManager(BaseActivity paramBaseActivity, XListView paramXListView, RecentCallHelper paramRecentCallHelper)
  {
    jdField_d_of_type_Boolean = true;
    jdField_e_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    jdField_a_of_type_ComTencentWidgetXListView = paramXListView;
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentCallHelper = paramRecentCallHelper;
    jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner = new PollBanner(jdField_a_of_type_ComTencentMobileqqAppBaseActivity);
  }
  
  private void a(SparseArray paramSparseArray)
  {
    if (paramSparseArray == null) {}
    for (;;)
    {
      return;
      int i1 = a(paramSparseArray, 0);
      int i2 = a(paramSparseArray, 1);
      int i3 = a(paramSparseArray, 2);
      if ((i2 >= 20) && (i1 >= 1)) {
        switch (i1)
        {
        }
      }
      while ((i3 >= 24) && (i1 >= 1))
      {
        switch (i1)
        {
        case 10: 
        case 11: 
        case 12: 
        case 14: 
        case 15: 
        default: 
          return;
        }
        ((ArrayList)paramSparseArray.get(0)).clear();
        return;
        ((ArrayList)paramSparseArray.get(0)).clear();
      }
    }
  }
  
  private void a(View paramView)
  {
    paramView.findViewById(2131298451).setVisibility(0);
    ((TextView)paramView.findViewById(2131297718)).setText(2131369828);
  }
  
  private void a(View paramView, Message paramMessage)
  {
    paramView.findViewById(2131298451).setVisibility(0);
    TextView localTextView = (TextView)paramView.findViewById(2131297718);
    localTextView.setText(2131371846);
    if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null)
    {
      paramView = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app;
      if (paramView != null) {
        break label51;
      }
    }
    label51:
    TicketManager localTicketManager;
    do
    {
      do
      {
        return;
        paramView = null;
        break;
      } while ((paramMessage == null) || (obj == null));
      paramMessage = (String)obj;
      localTicketManager = (TicketManager)BaseApplicationImpl.a().a().getManager(2);
      paramView = paramView.a();
    } while (TextUtils.isEmpty(paramView));
    localTextView.setOnClickListener(new mfe(this, paramMessage, paramView, localTicketManager.getSid(paramView)));
  }
  
  private void a(View paramView, Message paramMessage, int paramInt)
  {
    if ((paramMessage == null) || (obj == null) || (!(obj instanceof PhoneUnityBannerData))) {
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X8005B72", "0X8005B72", 0, 0, "", "", "", "");
    paramView.findViewById(2131300902).setVisibility(0);
    paramMessage = (PhoneUnityBannerData)obj;
    ((TextView)paramView.findViewById(2131300904)).setText(jdField_b_of_type_JavaLangString);
    paramView.setOnClickListener(new mfs(this, paramMessage));
  }
  
  private void a(Banner paramBanner)
  {
    if ((paramBanner == null) || (jdField_a_of_type_AndroidViewView != null)) {
      return;
    }
    for (;;)
    {
      try
      {
        int i1 = d;
        switch (i1)
        {
        }
      }
      catch (Throwable localThrowable)
      {
        localThrowable.printStackTrace();
        continue;
        jdField_a_of_type_AndroidViewView = i();
        continue;
        jdField_a_of_type_AndroidViewView = a();
        continue;
        jdField_a_of_type_AndroidViewView = k();
        continue;
        jdField_a_of_type_AndroidViewView = h();
        continue;
        jdField_a_of_type_AndroidViewView = f();
        continue;
        jdField_a_of_type_AndroidViewView = d();
        continue;
        jdField_a_of_type_AndroidViewView = g();
        continue;
        jdField_a_of_type_AndroidViewView = j();
        continue;
        jdField_a_of_type_AndroidViewView = m();
        continue;
        jdField_a_of_type_AndroidViewView = l();
        continue;
        jdField_a_of_type_AndroidViewView = l();
        continue;
        jdField_a_of_type_AndroidViewView = s();
        continue;
        jdField_a_of_type_AndroidViewView = n();
        continue;
        jdField_a_of_type_AndroidViewView = v();
        continue;
        jdField_a_of_type_AndroidViewView = u();
        continue;
        jdField_a_of_type_AndroidViewView = e();
        continue;
        jdField_a_of_type_AndroidViewView = x();
        continue;
        jdField_a_of_type_AndroidViewView = o();
        continue;
        jdField_a_of_type_AndroidViewView = p();
        continue;
        jdField_a_of_type_AndroidViewView = r();
        continue;
        jdField_a_of_type_AndroidViewView = q();
        continue;
        jdField_a_of_type_AndroidViewView = t();
        continue;
        jdField_a_of_type_AndroidViewView = w();
        continue;
        jdField_a_of_type_AndroidViewView = c();
        continue;
        jdField_a_of_type_AndroidViewView = b();
        continue;
      }
      if (!QLog.isDevelopLevel()) {
        break;
      }
      QLog.d("Q.recent.banner", 4, "initBannerView | banner = " + paramBanner);
      return;
      jdField_a_of_type_AndroidViewView = g();
    }
  }
  
  private void a(Banner paramBanner, Message paramMessage)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("Q.recent.banner", 4, "updateBanner| banner = " + paramBanner + ", msg = " + paramMessage);
    }
    if ((paramBanner == null) || (jdField_a_of_type_AndroidViewView == null)) {
      return;
    }
    try
    {
      switch (d)
      {
      case 1: 
        b(jdField_a_of_type_AndroidViewView);
        return;
      }
    }
    catch (Throwable paramBanner)
    {
      paramBanner.printStackTrace();
      return;
    }
    f(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    c(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    e(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    b(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    a(jdField_a_of_type_AndroidViewView);
    return;
    g(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    c(jdField_a_of_type_AndroidViewView);
    return;
    jdField_a_of_type_AndroidViewView.findViewById(2131304321).setVisibility(0);
    return;
    jdField_a_of_type_AndroidViewView.findViewById(2131304321).setVisibility(0);
    return;
    d(jdField_a_of_type_AndroidViewView);
    return;
    k(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    jdField_a_of_type_AndroidViewView.findViewById(2131304003).setVisibility(0);
    return;
    e(jdField_a_of_type_AndroidViewView);
    return;
    h(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    j(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    i(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    l(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    f(jdField_a_of_type_AndroidViewView);
    return;
    b(jdField_a_of_type_AndroidViewView, paramMessage, e);
    return;
    a(jdField_a_of_type_AndroidViewView, paramMessage, e);
    return;
    h(jdField_a_of_type_AndroidViewView);
    return;
    a(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
    d(jdField_a_of_type_AndroidViewView, paramMessage);
    return;
  }
  
  private boolean a(int paramInt, View paramView)
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a());
    PushBanner localPushBanner = new PushBanner(((Config)localObject1).a(0, paramInt), ((Config)localObject1).c(0, paramInt), ((Config)localObject1).a(0, paramInt));
    String str = ((Config)localObject1).b(0, paramInt);
    l = str;
    m = ((Config)localObject1).d(0, paramInt);
    boolean bool = localPushBanner.a(((Config)localObject1).b(0, paramInt));
    if ((c != null) && (c.contains("|")) && (!CommonUtil.a(Long.parseLong(c.substring(0, c.indexOf("|"))), Long.parseLong(c.substring(c.indexOf("|") + 1))))) {}
    label494:
    for (;;)
    {
      return false;
      if ((bool) && (!"".equals(j)))
      {
        a = JumpParser.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, jdField_a_of_type_ComTencentMobileqqAppBaseActivity, j);
        if (a == null) {}
        for (int i1 = 0;; i1 = 1)
        {
          if (i1 == 0) {
            break label494;
          }
          Object localObject2 = ((Config)localObject1).a(0, paramInt);
          if (QLog.isDevelopLevel()) {
            QLog.i("PUSH BANNER", 4, "addPushBanner, bannerPic = " + localObject2);
          }
          if (localObject2 == null) {
            break;
          }
          localObject1 = (FrameLayout)jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getLayoutInflater().inflate(2130903469, null);
          ImageView localImageView = (ImageView)((FrameLayout)localObject1).findViewById(2131298631);
          localImageView.setScaleType(ImageView.ScaleType.FIT_XY);
          localImageView.setImageBitmap((Bitmap)localObject2);
          DisplayMetrics localDisplayMetrics = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getResources().getDisplayMetrics();
          FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)localImageView.getLayoutParams();
          i1 = ((Bitmap)localObject2).getHeight() * Math.min(widthPixels, heightPixels) / ((Bitmap)localObject2).getWidth();
          height = Math.max((int)(30.0F * density), Math.min(Math.min(widthPixels, heightPixels) * 68 / 320, i1));
          localImageView.setLayoutParams(localLayoutParams);
          localObject2 = (ImageView)((FrameLayout)localObject1).findViewById(2131298632);
          ((ImageView)localObject2).setTag(localPushBanner);
          ((ImageView)localObject2).setContentDescription("图片推广位");
          ((ImageView)localObject2).setOnClickListener(new mfq(this, paramView, paramInt, (FrameLayout)localObject1, str));
          ((FrameLayout)localObject1).setTag(localPushBanner);
          ((ADView)paramView.findViewById(2131298629)).a((View)localObject1, paramInt);
          return true;
        }
      }
    }
  }
  
  private boolean a(View paramView)
  {
    int i4 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a()).a(0);
    if (i4 > 0)
    {
      ((ADView)paramView.findViewById(2131298629)).a();
      int i1 = 0;
      int i3;
      for (int i2 = 0; i1 < i4; i2 = i3)
      {
        i3 = i2;
        if (a(i1, paramView)) {
          i3 = i2 + 1;
        }
        i1 += 1;
      }
      if (QLog.isDevelopLevel()) {
        QLog.i("Q.recent.banner", 4, "loadPushBanner, addnum = " + i2);
      }
      if (i2 > 0)
      {
        j();
        return true;
      }
    }
    return false;
  }
  
  private View b()
  {
    return View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904919, null);
  }
  
  private void b(View paramView)
  {
    paramView.findViewById(2131298451).setVisibility(0);
    ((TextView)paramView.findViewById(2131297718)).setText(2131369827);
    if (a(8))
    {
      a(8, 0);
      jdField_e_of_type_JavaLangString = null;
    }
  }
  
  private void b(View paramView, Message paramMessage)
  {
    paramMessage = paramView.findViewById(2131298410);
    paramView = (TextView)paramView.findViewById(2131298412);
    if ((jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null) && (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app != null))
    {
      if (FileViewMusicService.a().a())
      {
        String str1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370232);
        String str2 = FileViewMusicService.a().a();
        if (str2 != null)
        {
          paramView.setText(Html.fromHtml(str1 + " " + str2));
          paramMessage.setVisibility(0);
          return;
        }
        paramMessage.setVisibility(8);
        return;
      }
      paramMessage.setVisibility(8);
      return;
    }
    paramMessage.setVisibility(8);
  }
  
  private void b(View paramView, Message paramMessage, int paramInt)
  {
    paramMessage = (QCallFacade)jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getManager(37);
    if (paramMessage != null) {}
    for (int i1 = paramMessage.a();; i1 = 0)
    {
      if (i1 == 0) {}
      do
      {
        do
        {
          return;
          if (paramInt != 0) {
            break;
          }
        } while (paramView.getVisibility() != 0);
        paramView.setVisibility(8);
        return;
        paramView.findViewById(2131300900).setVisibility(0);
        ((TextView)paramView.findViewById(2131300901)).setText(String.format(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370783), new Object[] { Integer.valueOf(i1) }));
      } while (i1 > 0);
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(7);
      return;
    }
  }
  
  private boolean b()
  {
    return jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getResources().getConfiguration().orientation == 1;
  }
  
  private View c()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903413, null);
    ((TextView)localView.findViewById(2131297718)).setText(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131371846));
    localView.findViewById(2131298451).setVisibility(8);
    return localView;
  }
  
  private void c(View paramView)
  {
    if ((f != null) && ("1600000104".equals(f.trim())))
    {
      paramView.findViewById(2131298478).setVisibility(8);
      paramView.findViewById(2131298481).setVisibility(0);
      return;
    }
    paramView.findViewById(2131298481).setVisibility(8);
    paramView.findViewById(2131298478).setVisibility(0);
  }
  
  private void c(View paramView, Message paramMessage)
  {
    if ((paramMessage == null) || (arg1 == 0))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.recent.banner", 2, "updateNetNeedSignOn return, msg == null || msg.arg1==HIDE");
      }
      return;
    }
    if ((paramMessage != null) && ((obj instanceof String))) {}
    for (paramMessage = String.valueOf(obj);; paramMessage = "http://qq.com")
    {
      paramView = paramView.findViewById(2131298451);
      if (paramView.getVisibility() != 0) {
        paramView.setVisibility(0);
      }
      paramView.setOnClickListener(new mft(this, paramMessage));
      ReportController.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X8004028", "0X8004028", 0, 0, "", "", "", "");
      return;
    }
  }
  
  private boolean c()
  {
    return jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getSharedPreferences("mobileQQ", 0).getBoolean("reveive_newpb" + jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getAccount(), false);
  }
  
  private View d()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903406, null);
    localView.setOnClickListener(new mfu(this, localView));
    localView.findViewById(2131298410).setVisibility(8);
    return localView;
  }
  
  private void d(View paramView)
  {
    paramView.findViewById(2131297720).setVisibility(0);
    if (jdField_d_of_type_Boolean)
    {
      TroopAssistantManager.a().i(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "P_CliOper", "Grp_msg", "", "Msglist", "exp_setmsg", 0, 0, "", "", "", "");
    }
    jdField_d_of_type_Boolean = false;
    jdField_e_of_type_Boolean = true;
  }
  
  private void d(View paramView, Message paramMessage)
  {
    paramMessage = (TextView)paramView.findViewById(2131304392);
    WifiConversationManager localWifiConversationManager = WifiConversationManager.a();
    String str1 = localWifiConversationManager.b();
    String str2 = localWifiConversationManager.a();
    String str3 = localWifiConversationManager.c();
    if ((TextUtils.isEmpty(str1)) || (TextUtils.isEmpty(str2)) || (localWifiConversationManager.a() == null))
    {
      a(3, 0);
      return;
    }
    int i1 = aConnStatus;
    int i2 = aConnErrorCode;
    if ((i1 != 2) && (i1 != 7))
    {
      a(3, 0);
      return;
    }
    paramMessage.setText(String.format(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131366236), new Object[] { str1 }));
    paramView.setOnClickListener(new mfw(this, str3, localWifiConversationManager.a()));
  }
  
  private boolean d()
  {
    return jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getSharedPreferences("mobileQQ", 0).getBoolean("push_banner_display" + jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getAccount(), true);
  }
  
  private View e()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904774, null);
    ((TextView)localView.findViewById(2131304004)).setText(jdField_d_of_type_JavaLangString);
    localView.setOnClickListener(new mfv(this));
    localView.findViewById(2131304003).setVisibility(8);
    return localView;
  }
  
  private void e(View paramView)
  {
    if (QQPlayerService.a())
    {
      paramView.findViewById(2131298410).setVisibility(0);
      paramView = (TextView)paramView.findViewById(2131298412);
      SongInfo localSongInfo = QQPlayerService.a();
      if (localSongInfo != null)
      {
        String str = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370232);
        paramView.setText(Html.fromHtml(str + " " + jdField_b_of_type_JavaLangString));
      }
      return;
    }
    paramView.findViewById(2131298410).setVisibility(8);
    a(20, 0);
    a(-1, null);
  }
  
  private void e(View paramView, Message paramMessage)
  {
    View localView = paramView.findViewById(2131300796);
    paramMessage = (TextView)paramView.findViewById(2131300797);
    if ((jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null) && (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app != null))
    {
      int i1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().a();
      if (i1 != 0)
      {
        localView.setVisibility(0);
        int i2 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().a().mMode;
        paramView = "传输";
        if (1 == i2) {
          paramView = "发送";
        }
        for (;;)
        {
          paramMessage.setText(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131366112) + paramView + String.valueOf(i1) + jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131366113));
          return;
          if (2 == i2) {
            paramView = "接收";
          }
        }
      }
      localView.setVisibility(8);
      return;
    }
    localView.setVisibility(8);
  }
  
  private View f()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903978, null);
    localView.setOnClickListener(new mfx(this));
    localView.findViewById(2131300796).setVisibility(8);
    return localView;
  }
  
  private void f(View paramView)
  {
    paramView.findViewById(2131298628).setVisibility(0);
    RelativeLayout localRelativeLayout = (RelativeLayout)paramView.findViewById(2131298627);
    paramView = (ADView)paramView.findViewById(2131298629);
    if (b())
    {
      localRelativeLayout.setPadding(0, 0, 0, 0);
      paramView.b();
      return;
    }
    localRelativeLayout.setPadding(0, -1, 0, 0);
  }
  
  private void f(View paramView, Message paramMessage)
  {
    TextView localTextView = (TextView)paramView.findViewById(2131300658);
    if (paramMessage != null)
    {
      if (arg1 != 1) {
        break label42;
      }
      localTextView.setText(2131362155);
    }
    for (;;)
    {
      paramView.findViewById(2131300657).setVisibility(0);
      return;
      label42:
      if (arg1 == 2) {
        localTextView.setText(2131362154);
      }
    }
  }
  
  private View g()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903413, null);
    ((TextView)localView.findViewById(2131297718)).setText(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131369827));
    localView.setOnClickListener(new mfy(this));
    localView.findViewById(2131298451).setVisibility(8);
    return localView;
  }
  
  private void g(View paramView)
  {
    paramView.findViewById(2131301034).setVisibility(0);
  }
  
  private void g(View paramView, Message paramMessage)
  {
    if ((paramMessage != null) && (what == 8)) {
      if ((obj instanceof VipBannerInfo))
      {
        paramMessage = (VipBannerInfo)obj;
        localObject2 = jdField_b_of_type_JavaLangString;
        localObject1 = (TextView)paramView.findViewById(2131302732);
        ((TextView)localObject1).setText((CharSequence)localObject2);
        if ((jdField_e_of_type_JavaLangString != null) && (!TextUtils.isEmpty(jdField_e_of_type_JavaLangString)))
        {
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().getResources().getDrawable(2130841281);
          localObject2 = URLDrawable.getDrawable(jdField_e_of_type_JavaLangString, (Drawable)localObject2, (Drawable)localObject2);
          if (localObject2 != null)
          {
            ((Drawable)localObject2).setBounds(0, 0, DisplayUtil.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 22.0F), DisplayUtil.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 22.0F));
            ((TextView)localObject1).setCompoundDrawables((Drawable)localObject2, null, null, null);
          }
        }
        localObject1 = (Button)paramView.findViewById(2131302733);
        if ((f != null) && (!TextUtils.isEmpty(f))) {
          ((Button)localObject1).setText(f);
        }
        localObject2 = jdField_a_of_type_ComTencentPbGetbusiinfoBusinessInfoCheckUpdate$AppInfo;
        localRedTouchManager = (RedTouchManager)jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getManager(35);
        if ((jdField_a_of_type_JavaLangString != null) && (localObject2 != null) && (localRedTouchManager != null))
        {
          ((Button)localObject1).setOnClickListener(new mew(this, paramMessage, localRedTouchManager, (BusinessInfoCheckUpdate.AppInfo)localObject2));
          jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(9, jdField_b_of_type_Long);
          localRedTouchManager.a((BusinessInfoCheckUpdate.AppInfo)localObject2, jdField_a_of_type_JavaLangString);
          paramView.setVisibility(0);
        }
      }
    }
    while (paramView.getVisibility() != 8)
    {
      Object localObject2;
      Object localObject1;
      RedTouchManager localRedTouchManager;
      return;
    }
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(9);
  }
  
  private View h()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903413, null);
    ((TextView)localView.findViewById(2131297718)).setText(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367214));
    localView.findViewById(2131298451).setVisibility(8);
    return localView;
  }
  
  private void h(View paramView)
  {
    paramView.findViewById(2131302333).setVisibility(0);
    ((TextView)paramView.findViewById(2131302334)).setText("当前有免费的QQ WiFi，点击连接");
  }
  
  private void h(View paramView, Message paramMessage)
  {
    if ((paramMessage == null) || (what != 1134027)) {
      if (QLog.isColorLevel()) {
        QLog.d("ReaderBar", 2, "updateReaderBar msg " + paramMessage);
      }
    }
    TextView localTextView;
    do
    {
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("ReaderBar", 2, "updateReaderBar msg.obj = " + obj);
        }
        localTextView = (TextView)paramView.findViewById(2131296955);
      } while ((!(obj instanceof String)) || (localTextView == null));
      paramMessage = ((String)obj).split("@#");
    } while (paramMessage.length != 2);
    String str = paramMessage[0];
    long l1 = Long.parseLong(paramMessage[1]);
    localTextView.setText("正在阅读《" + str + "》");
    paramView.setOnClickListener(new mfc(this, l1));
    paramView.findViewById(2131296949).setVisibility(0);
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(13);
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(13, 900000L);
  }
  
  private View i()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904007, null);
    ((TextView)localView.findViewById(2131300901)).setText(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370783));
    localView.setOnClickListener(new meu(this));
    localView.findViewById(2131300900).setVisibility(8);
    return localView;
  }
  
  private void i(View paramView, Message paramMessage)
  {
    if ((paramMessage == null) || ((what != 1134041) && (what != 1134042))) {
      if (QLog.isColorLevel()) {
        QLog.d("BrowserBar", 2, "updateBrowserBar msg " + paramMessage);
      }
    }
    TextView localTextView;
    String str;
    do
    {
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("BrowserBar", 2, "updateBrowserBar msg.obj = " + obj);
        }
        if (what == 1134042)
        {
          paramView.setVisibility(8);
          return;
        }
        localTextView = (TextView)paramView.findViewById(2131296948);
      } while ((!(obj instanceof Bundle)) || (localTextView == null));
      paramMessage = (Bundle)obj;
      str = (String)paramMessage.getCharSequence("tips");
      int i1 = paramMessage.getInt("icon");
      if (i1 != -1) {
        ((ImageView)paramView.findViewById(2131296946)).setImageResource(i1);
      }
    } while (TextUtils.isEmpty(str));
    localTextView.setText(str);
    paramView.setOnClickListener(new mfd(this, paramMessage));
    paramView.findViewById(2131296945).setVisibility(0);
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(15);
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(15, paramMessage.getInt("timeout", 120000));
  }
  
  private View j()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904462, null);
    localView.setVisibility(8);
    return localView;
  }
  
  private void j()
  {
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(101);
    long l1 = System.currentTimeMillis();
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.add(5, 1);
    localCalendar.set(11, 0);
    localCalendar.clear(12);
    localCalendar.clear(13);
    localCalendar.clear(14);
    l1 = localCalendar.getTimeInMillis() - (l1 - 10L) + 300000L;
    if (QLog.isColorLevel()) {
      QLog.d("PushBanner", 2, "Check banner delay: " + l1);
    }
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(101, l1);
  }
  
  private void j(View paramView, Message paramMessage)
  {
    if ((paramMessage == null) || (what != 1134039)) {
      if (QLog.isColorLevel()) {
        QLog.d("ComicBar", 2, "updateComicBar msg " + paramMessage);
      }
    }
    TextView localTextView;
    String str;
    int i2;
    do
    {
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("ComicBar", 2, "updateComicBar msg.obj = " + obj);
        }
        localTextView = (TextView)paramView.findViewById(2131296952);
      } while ((!(obj instanceof Bundle)) || (localTextView == null));
      localObject = (Bundle)obj;
      paramMessage = ((Bundle)localObject).getString("comicName");
      str = ((Bundle)localObject).getString("comicId");
      i2 = ((Bundle)localObject).getInt("type", -1);
    } while (TextUtils.isEmpty(paramMessage));
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getResources().getDisplayMetrics();
    int i3 = (int)(localTextView.getPaint().measureText(paramMessage) / paramMessage.length());
    int i1;
    if (widthPixels > heightPixels)
    {
      i1 = heightPixels;
      i1 = (int)((i1 - density * 65.0F) / i3) - 8;
      if (paramMessage.length() <= i1) {
        break label398;
      }
      paramMessage = paramMessage.substring(0, i1) + "...";
    }
    label398:
    for (;;)
    {
      if ((i2 >= 100) && (i2 <= 300)) {
        localTextView.setText("正在观看《" + paramMessage + "》");
      }
      for (;;)
      {
        paramView.setOnClickListener(new mff(this, str));
        paramView.findViewById(2131296949).setVisibility(0);
        jdField_a_of_type_MqqOsMqqHandler.removeMessages(14);
        jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(14, 900000L);
        return;
        i1 = widthPixels;
        break;
        localTextView.setText("正在阅读《" + paramMessage + "》");
      }
    }
  }
  
  private View k()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903963, null);
    localView.findViewById(2131300658).setOnClickListener(new mev(this));
    localView.findViewById(2131300657).setVisibility(8);
    return localView;
  }
  
  private void k()
  {
    a(12, 0);
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(11);
    if (jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener != null)
    {
      ((PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getManager(10)).b(jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener);
      jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener = null;
    }
  }
  
  private void k(View paramView, Message paramMessage)
  {
    paramView.findViewById(2131304321).setVisibility(0);
    TextView localTextView = (TextView)paramView.findViewById(2131299829);
    if (paramMessage != null)
    {
      if (!ConfigHandler.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app))
      {
        paramMessage = "新版本QQ ";
        UpgradeDetailWrapper localUpgradeDetailWrapper = UpgradeController.a().a();
        paramView = paramMessage;
        if (localUpgradeDetailWrapper != null)
        {
          paramView = paramMessage;
          if (a != null)
          {
            paramView = paramMessage;
            if (a.jdField_a_of_type_JavaLangString != null) {
              paramView = a.jdField_a_of_type_JavaLangString + " ";
            }
          }
        }
        localTextView.setText(String.format("已下载%s,点击安装", new Object[] { paramView }));
      }
    }
    else {
      return;
    }
    localTextView.setText("已通过Wi-Fi下载手机新版本，点击安装");
  }
  
  private View l()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904895, null);
    TextView localTextView = (TextView)localView.findViewById(2131299829);
    localTextView.setOnClickListener(new mex(this));
    localTextView.setText(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367782));
    ((ImageView)localView.findViewById(2131304322)).setOnClickListener(new mey(this));
    localView.findViewById(2131304321).setVisibility(8);
    return localView;
  }
  
  private void l()
  {
    if (jdField_a_of_type_AndroidUtilSparseArray == null) {}
    int i1;
    for (;;)
    {
      return;
      i1 = 0;
      while (i1 < 3)
      {
        localObject = (ArrayList)jdField_a_of_type_AndroidUtilSparseArray.get(i1);
        if ((localObject != null) && (((ArrayList)localObject).size() != 0)) {
          break label45;
        }
        i1 += 1;
      }
    }
    label45:
    Object localObject = ((ArrayList)localObject).iterator();
    label50:
    Banner localBanner;
    while (((Iterator)localObject).hasNext())
    {
      int i2 = ((Integer)((Iterator)localObject).next()).intValue();
      localBanner = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i2];
      if ((localBanner != null) && (jdField_a_of_type_AndroidViewView != null) && (jdField_a_of_type_Boolean))
      {
        if (i1 == 1) {
          break label142;
        }
        jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_AndroidViewView);
      }
    }
    for (;;)
    {
      jdField_a_of_type_Boolean = false;
      if (localBanner.a()) {
        break label50;
      }
      jdField_a_of_type_AndroidViewView = null;
      break label50;
      break;
      label142:
      if (!jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner.a())
      {
        jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner.b();
        jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner.a());
      }
    }
  }
  
  private void l(View paramView, Message paramMessage)
  {
    View localView;
    TextView localTextView;
    Object localObject;
    int i1;
    int i2;
    long l1;
    boolean bool;
    if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null)
    {
      paramMessage = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app;
      if ((paramMessage != null) && (jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null))
      {
        localView = paramView.findViewById(2131298405);
        localTextView = (TextView)paramView.findViewById(2131298407);
        localObject = (ImageView)paramView.findViewById(2131298406);
        i1 = paramMessage.a().g();
        i2 = paramMessage.a().b();
        l1 = paramMessage.a().b();
        if (QLog.isColorLevel()) {
          QLog.d("Q.recent.banner", 2, "updateMultiVideoBar randomstatus:" + i2 + ", session:" + i1);
        }
        if (paramMessage.a().i() != 2) {
          break label190;
        }
        bool = true;
        label142:
        if (l1 <= 0L) {
          break label263;
        }
        i1 = paramMessage.a().d();
        if (i1 >= 2) {
          break label196;
        }
        localTextView.setText(2131367747);
      }
    }
    for (;;)
    {
      SmallScreenUtils.a(localView, bool, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
      return;
      paramMessage = null;
      break;
      label190:
      bool = false;
      break label142;
      label196:
      paramView = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363698);
      paramMessage = paramMessage.a().g();
      paramView = String.format(paramView, new Object[] { Integer.valueOf(i1) });
      localTextView.setText(paramView + " " + paramMessage);
    }
    label263:
    if (i2 >= 5)
    {
      paramView = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363698);
      paramView = paramView + " ";
      localTextView.setText(paramView + paramMessage.a().g());
      SmallScreenUtils.a(localView, bool, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
      return;
    }
    if ((i2 >= 1) && (i2 < 5))
    {
      localTextView.setText(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363701));
      SmallScreenUtils.a(localView, bool, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
      return;
    }
    label484:
    label542:
    int i3;
    String str;
    if (i1 == 3)
    {
      l1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().a();
      i1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().b(l1);
      i2 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().h();
      if (paramMessage.a().d())
      {
        localTextView.setText(2131367747);
        if ((i1 == 2) && (!paramMessage.a().a(String.valueOf(l1)))) {
          ((ImageView)localObject).setImageResource(2130842476);
        }
        if (i2 == 1)
        {
          localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363286);
          paramView = (View)localObject;
          if (i1 == 2) {
            paramView = ((String)localObject).replace(paramMessage.a().getString(2131367817), paramMessage.a().getString(2131367818));
          }
          UITools.a(localView, paramView);
          SmallScreenUtils.a(localView, bool, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
        }
      }
      else
      {
        l1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().a();
        i3 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().a();
        str = paramMessage.a().g();
        if (i2 == 3000)
        {
          localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367745);
          paramView = (View)localObject;
          if (i1 == 2) {
            paramView = ((String)localObject).replace(paramMessage.a().getString(2131367817), paramMessage.a().getString(2131367818));
          }
        }
      }
    }
    label1180:
    for (;;)
    {
      l1 = paramMessage.a().a(i3, l1);
      if ((localView != null) && (l1 == 0L))
      {
        SmallScreenUtils.a(localView, false, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
        return;
        if (i2 == 1)
        {
          paramView = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367746);
          if (i1 != 2) {
            break label1180;
          }
          paramView = paramView.replace(paramMessage.a().getString(2131367817), paramMessage.a().getString(2131367818));
          ((ImageView)localObject).setImageResource(2130842476);
          continue;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.e("Q.recent.banner", 2, "updateMultiVideoBar-->wrong type of UinType.uintype=" + i2);
        return;
      }
      if (localView == null)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.recent.banner", 2, "updateMultiVideoBar-->multiVideoBar is null");
        return;
      }
      paramView = String.format(paramView, new Object[] { Long.valueOf(l1) });
      localTextView.setText(paramView + " " + str);
      break label484;
      if (i2 != 3000) {
        break label542;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363285);
      paramView = (View)localObject;
      if (i1 == 2) {
        paramView = ((String)localObject).replace(paramMessage.a().getString(2131367817), paramMessage.a().getString(2131367818));
      }
      UITools.a(localView, paramView);
      break label542;
      if (i1 == 1)
      {
        if (paramMessage.a().d()) {
          localTextView.setText(2131363468);
        }
        for (;;)
        {
          UITools.a(localView, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363273));
          SmallScreenUtils.a(localView, bool, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
          return;
          paramView = paramMessage.a().g();
          paramMessage = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363468);
          localTextView.setText(paramMessage + " " + paramView);
        }
      }
      if (i1 == 5)
      {
        localTextView.setText(2131363878);
        UITools.a(localView, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363879));
        SmallScreenUtils.a(localView, bool, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
        return;
      }
      if (i1 == 2)
      {
        if (paramMessage.a().d()) {
          localTextView.setText(2131363469);
        }
        for (;;)
        {
          UITools.a(localView, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363273));
          SmallScreenUtils.a(localView, bool, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
          return;
          paramView = paramMessage.a().g();
          paramMessage = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131363469);
          localTextView.setText(paramMessage + " " + paramView);
        }
      }
      SmallScreenUtils.a(localView, false, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume());
      return;
    }
  }
  
  private View m()
  {
    View localView1 = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903420, null);
    View localView2 = localView1.findViewById(2131298479);
    View localView3 = localView1.findViewById(2131298480);
    localView1.findViewById(2131298482);
    View localView4 = localView1.findViewById(2131298483);
    mez localMez = new mez(this);
    localView2.setOnClickListener(localMez);
    localView3.setOnClickListener(localMez);
    localView4.setOnClickListener(localMez);
    localView1.findViewById(2131298478).setVisibility(8);
    localView1.findViewById(2131298481).setVisibility(8);
    return localView1;
  }
  
  private View n()
  {
    View localView1 = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903221, null);
    View localView2 = localView1.findViewById(2131297720);
    localView1.setOnClickListener(new mfa(this));
    localView2.setVisibility(8);
    return localView1;
  }
  
  private View o()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903406, null);
    localView.setOnClickListener(new mfb(this));
    localView.findViewById(2131298410).setVisibility(8);
    return localView;
  }
  
  private View p()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ReaderBar", 2, "initReaderBar");
    }
    View localView = LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqAppBaseActivity).inflate(2130903087, null);
    localView.findViewById(2131296949).setVisibility(8);
    return localView;
  }
  
  private View q()
  {
    if (QLog.isColorLevel()) {
      QLog.d("BrowserBar", 2, "initBrowserBar");
    }
    View localView = LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqAppBaseActivity).inflate(2130903085, null);
    localView.findViewById(2131296945).setVisibility(8);
    return localView;
  }
  
  private View r()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ComicBar", 2, "initComicBar");
    }
    View localView = LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqAppBaseActivity).inflate(2130903086, null);
    localView.findViewById(2131296949).setVisibility(8);
    return localView;
  }
  
  private View s()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904895, null);
    TextView localTextView = (TextView)localView.findViewById(2131299829);
    localTextView.setOnClickListener(new mfg(this));
    localTextView.setText("");
    if (AppSetting.i) {
      localTextView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367791));
    }
    ((ImageView)localView.findViewById(2131304322)).setOnClickListener(new mfh(this));
    localView.findViewById(2131304321).setVisibility(8);
    return localView;
  }
  
  private View t()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903405, null);
    localView.setOnClickListener(new mfi(this));
    localView.findViewById(2131298405).setVisibility(8);
    return localView;
  }
  
  private View u()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130903220, null);
    localView.setOnClickListener(new mfj(this));
    return localView;
  }
  
  private View v()
  {
    View localView = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getLayoutInflater().inflate(2130903468, null);
    localView.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
    localView.findViewById(2131298628).setVisibility(8);
    ((LinearLayout)localView.findViewById(2131297055)).setOnClickListener(new mfl(this));
    return localView;
  }
  
  private View w()
  {
    View localView = LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqAppBaseActivity).inflate(2130904036, jdField_a_of_type_ComTencentWidgetXListView, false);
    localView.setOnClickListener(new mfn(this));
    return localView;
  }
  
  private View x()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904360, null);
    ImageView localImageView = (ImageView)localView.findViewById(2131302335);
    localView.setOnClickListener(new mfo(this));
    localImageView.setOnClickListener(new mfp(this));
    return localView;
  }
  
  public int a(int paramInt)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramInt >= 0)
    {
      localObject1 = localObject2;
      if (paramInt < jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner.length) {
        localObject1 = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[paramInt];
      }
    }
    if (localObject1 == null) {
      return 0;
    }
    return e;
  }
  
  public int a(SparseArray paramSparseArray, int paramInt)
  {
    int i3 = 0;
    int i2 = 0;
    int i1;
    if (paramSparseArray == null) {
      i1 = i2;
    }
    do
    {
      do
      {
        return i1;
        paramSparseArray = (ArrayList)paramSparseArray.get(paramInt);
        i1 = i2;
      } while (paramSparseArray == null);
      i1 = i2;
    } while (paramSparseArray.size() <= 0);
    paramSparseArray = paramSparseArray.iterator();
    for (paramInt = i3;; paramInt = ((Integer)paramSparseArray.next()).intValue() + paramInt)
    {
      i1 = paramInt;
      if (!paramSparseArray.hasNext()) {
        break;
      }
    }
  }
  
  public View a()
  {
    View localView = View.inflate(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130904008, null);
    localView.findViewById(2131300902).setVisibility(8);
    return localView;
  }
  
  public MqqHandler a()
  {
    return jdField_a_of_type_MqqOsMqqHandler;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().b() <= 0) {
        break label34;
      }
      a(24, 2);
    }
    label34:
    int i1;
    do
    {
      return;
      if (!jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.d()) {
        break;
      }
      i1 = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().g();
      if (i1 == 3)
      {
        if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().a() > 0L)
        {
          a(24, 2);
          return;
        }
        a(24, 0);
        return;
      }
      if (i1 == 1)
      {
        a(24, 2);
        return;
      }
      if (i1 == 2)
      {
        a(24, 2);
        return;
      }
    } while (i1 != 5);
    a(24, 2);
    return;
    a(24, 0);
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if ((paramInt1 >= 1) && (paramInt1 <= 26))
    {
      if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[paramInt1] == null) {
        break label31;
      }
      jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[paramInt1].e = paramInt2;
    }
    label31:
    while ((jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[paramInt1] != null) || (!Banner.a(paramInt2))) {
      return;
    }
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[paramInt1] = new Banner(paramInt1, paramInt2);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, Object paramObject, long paramLong)
  {
    Message localMessage = Message.obtain();
    what = paramInt1;
    arg1 = paramInt2;
    arg2 = paramInt3;
    obj = paramObject;
    if (paramLong > 0L)
    {
      jdField_a_of_type_MqqOsMqqHandler.sendMessageDelayed(localMessage, paramLong);
      return;
    }
    jdField_a_of_type_MqqOsMqqHandler.sendMessage(localMessage);
  }
  
  public void a(int paramInt, Message paramMessage)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("Q.recent.banner", 4, "refreshBanner");
    }
    if (jdField_b_of_type_AndroidUtilSparseArray == null) {
      jdField_b_of_type_AndroidUtilSparseArray = new SparseArray(3);
    }
    int i1 = 0;
    Object localObject1;
    if (i1 < 3)
    {
      localObject1 = (ArrayList)jdField_b_of_type_AndroidUtilSparseArray.get(i1);
      if (localObject1 == null)
      {
        localObject1 = new ArrayList(1);
        jdField_b_of_type_AndroidUtilSparseArray.put(i1, localObject1);
      }
      for (;;)
      {
        i1 += 1;
        break;
        ((ArrayList)localObject1).clear();
      }
    }
    if (jdField_a_of_type_AndroidUtilSparseArray == null) {
      jdField_a_of_type_AndroidUtilSparseArray = new SparseArray(3);
    }
    i1 = 1;
    for (;;)
    {
      if (i1 <= 19)
      {
        if ((jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i1] == null) || (!jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i1].a())) {
          break label239;
        }
        localObject1 = (ArrayList)jdField_b_of_type_AndroidUtilSparseArray.get(0);
        if (jdField_b_of_type_AndroidUtilSparseArray != null) {
          ((ArrayList)localObject1).add(Integer.valueOf(i1));
        }
      }
      i1 = 20;
      while (i1 <= 23)
      {
        if ((jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i1] != null) && (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i1].a()))
        {
          localObject1 = (ArrayList)jdField_b_of_type_AndroidUtilSparseArray.get(1);
          if (jdField_b_of_type_AndroidUtilSparseArray != null) {
            ((ArrayList)localObject1).add(Integer.valueOf(i1));
          }
        }
        i1 += 1;
      }
      label239:
      i1 += 1;
    }
    i1 = 24;
    if (i1 <= 26)
    {
      if ((jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i1] == null) || (!jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i1].a())) {
        break label391;
      }
      localObject1 = (ArrayList)jdField_b_of_type_AndroidUtilSparseArray.get(2);
      if (localObject1 != null) {
        ((ArrayList)localObject1).add(Integer.valueOf(i1));
      }
    }
    a(jdField_b_of_type_AndroidUtilSparseArray);
    int i4 = 0;
    i1 = 1;
    int i3 = 0;
    int i2 = 0;
    label323:
    int i5;
    int i6;
    if (i4 < 3)
    {
      i5 = a(jdField_b_of_type_AndroidUtilSparseArray, i4);
      i6 = a(jdField_a_of_type_AndroidUtilSparseArray, i4);
      if (1 == i4) {
        if (i5 != i6) {
          i1 = 0;
        }
      }
    }
    label391:
    Object localObject2;
    label641:
    label650:
    label947:
    for (;;)
    {
      i4 += 1;
      i3 += i6;
      i2 += i5;
      break label323;
      i1 += 1;
      break;
      localObject2 = (ArrayList)jdField_b_of_type_AndroidUtilSparseArray.get(1);
      localObject1 = (ArrayList)jdField_a_of_type_AndroidUtilSparseArray.get(1);
      if (localObject2 == null) {}
      for (;;)
      {
        return;
        localObject2 = ((ArrayList)localObject2).iterator();
        Integer localInteger;
        do
        {
          if (!((Iterator)localObject2).hasNext()) {
            break;
          }
          localInteger = (Integer)((Iterator)localObject2).next();
        } while ((localObject1 == null) || (((ArrayList)localObject1).contains(localInteger)));
        i1 = 0;
        break;
        if (i5 == i6) {
          break label947;
        }
        i1 = 0;
        break;
        if ((i2 != 0) || (i3 != 0))
        {
          if ((i2 == 0) && (i3 != 0))
          {
            l();
            return;
          }
          i5 = a(jdField_b_of_type_AndroidUtilSparseArray, 1) - a(jdField_a_of_type_AndroidUtilSparseArray, 1);
          if (i1 == 0)
          {
            l();
            i1 = 0;
            while (i1 < 3)
            {
              localObject1 = (ArrayList)jdField_b_of_type_AndroidUtilSparseArray.get(i1);
              if (localObject1 != null) {
                jdField_a_of_type_AndroidUtilSparseArray.put(i1, (ArrayList)((ArrayList)localObject1).clone());
              }
              i1 += 1;
            }
          }
          i4 = 0;
          while (i4 < 3)
          {
            localObject1 = (ArrayList)jdField_a_of_type_AndroidUtilSparseArray.get(i4);
            if ((localObject1 != null) && (((ArrayList)localObject1).size() != 0)) {
              break label641;
            }
            i4 += 1;
          }
        }
      }
      localObject1 = ((ArrayList)localObject1).iterator();
      i1 = 0;
      while (((Iterator)localObject1).hasNext())
      {
        i2 = ((Integer)((Iterator)localObject1).next()).intValue();
        localObject2 = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[i2];
        if (localObject2 != null)
        {
          a((Banner)localObject2);
          i3 = i1;
          i2 = i1;
        }
      }
      for (;;)
      {
        try
        {
          if (jdField_a_of_type_AndroidViewView != null)
          {
            i3 = i1;
            i2 = i1;
            if (!jdField_a_of_type_Boolean)
            {
              if (i4 == 1) {
                continue;
              }
              i2 = i1;
              jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_AndroidViewView);
              i2 = i1;
              jdField_a_of_type_Boolean = true;
              i3 = i1;
            }
          }
          i1 = i3;
        }
        catch (Exception localException)
        {
          if (!QLog.isDevelopLevel()) {
            continue;
          }
          QLog.d("Q.recent.banner", 4, "initBanner|" + localException.toString());
          i1 = i2;
          continue;
          if (i1 != 0) {
            continue;
          }
          boolean bool = true;
          i3 = 1;
          continue;
          if (paramInt != d) {
            continue;
          }
          a((Banner)localObject2, paramMessage);
          continue;
          bool = false;
          i3 = i1;
          continue;
        }
        if ((paramMessage != null) && (paramInt == d)) {
          continue;
        }
        a((Banner)localObject2, null);
        break label650;
        break;
        if (i5 <= 0) {
          continue;
        }
        i2 = i1;
        if (d != i5) {
          continue;
        }
        bool = true;
        i3 = i1;
        i2 = i3;
        jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner.a((Banner)localObject2, bool);
        i1 = i3;
        i2 = i3;
        if (!jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner.b())
        {
          i2 = i3;
          jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_ComTencentMobileqqActivityRecentPollBanner.a());
          i1 = i3;
        }
      }
    }
  }
  
  public void a(String paramString)
  {
    if ((a(13)) && (!TextUtils.isEmpty(jdField_g_of_type_JavaLangString)) && (!TextUtils.isEmpty(paramString)) && (jdField_g_of_type_JavaLangString.equals(paramString)))
    {
      jdField_g_of_type_JavaLangString = "";
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(1, 1000L);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[12] != null) {
      a(12, 0);
    }
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(11);
    if (paramBoolean)
    {
      PhoneContactManagerImp localPhoneContactManagerImp = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getManager(10);
      int i1;
      if (localPhoneContactManagerImp != null)
      {
        i1 = localPhoneContactManagerImp.c();
        if (i1 == 0) {
          jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(11, 1000L);
        }
      }
      else
      {
        return;
      }
      if ((jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener == null) && (!c))
      {
        jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener = new met(this);
        localPhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener);
      }
      paramBoolean = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getSharedPreferences("contact_bind_info" + jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getAccount(), 0).getBoolean("key_show_contact_banner", true);
      if (QLog.isColorLevel()) {
        QLog.d("Q.recent.banner", 2, "checkContactBanner, state = " + i1 + ", isFirstShow = " + paramBoolean);
      }
      if ((i1 == 1) && (paramBoolean))
      {
        if ((jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[12] != null) && (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[12].e != 2)) {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X80053D8", "0X80053D8", 0, 0, "", "", "", "");
        }
        a(12, 2);
        return;
      }
      a(12, 0);
      return;
    }
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(11);
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(11, 1000L);
  }
  
  public boolean a()
  {
    boolean bool1 = true;
    boolean bool2 = c();
    if ((jdField_b_of_type_Boolean) && (!bool2)) {}
    for (;;)
    {
      if (QLog.isDevelopLevel()) {
        QLog.i("Q.recent.banner", 4, "isNeedShowPushBanner, isNeedShow = " + bool1);
      }
      return bool1;
      if (d())
      {
        if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[16] == null) {
          jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[16] = new Banner(16, 0);
        }
        a(jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[16]);
        View localView = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[16].jdField_a_of_type_AndroidViewView;
        if (localView != null) {}
        for (bool1 = a(localView);; bool1 = false)
        {
          if (bool1)
          {
            localView.findViewById(2131298628).setVisibility(0);
            jdField_b_of_type_Boolean = true;
            jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getSharedPreferences("mobileQQ", 0).edit().putBoolean("reveive_newpb" + jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getAccount(), false).commit();
          }
          break;
        }
      }
      bool1 = false;
    }
  }
  
  public boolean a(int paramInt)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramInt >= 0)
    {
      localObject1 = localObject2;
      if (paramInt < jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner.length) {
        localObject1 = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[paramInt];
      }
    }
    return (localObject1 != null) && (((Banner)localObject1).a());
  }
  
  public void b()
  {
    if (a(8))
    {
      a(8, 0);
      jdField_e_of_type_JavaLangString = null;
      a(-1, null);
    }
  }
  
  public void c()
  {
    Object localObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[16];
    ViewGroup localViewGroup;
    int i2;
    int i1;
    if ((localObject != null) && (jdField_a_of_type_AndroidViewView != null))
    {
      localObject = (ADView)jdField_a_of_type_AndroidViewView.findViewById(2131298629);
      localViewGroup = ((ADView)localObject).a(0);
      if (localViewGroup != null)
      {
        i2 = localViewGroup.getChildCount();
        i1 = 0;
        i2 -= 1;
        if (i2 >= 0)
        {
          View localView = localViewGroup.getChildAt(i2);
          PushBanner localPushBanner = (PushBanner)localView.getTag();
          String str = c;
          int i3 = str.indexOf("|");
          if (CommonUtil.a(Long.parseLong(str.substring(0, i3)), Long.parseLong(str.substring(i3 + 1)))) {
            break label296;
          }
          ((ADView)localObject).a(0, i2, localView);
          Config.a.b(l);
          i1 = 1;
        }
      }
    }
    label296:
    for (;;)
    {
      i2 -= 1;
      break;
      if (i1 != 0)
      {
        if (localViewGroup.getChildCount() == 0)
        {
          jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getSharedPreferences("mobileQQ", 0).edit().putBoolean("push_banner_display" + jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getAppRuntime().getAccount(), false).commit();
          ((ADView)localObject).a();
          a(16, 0);
          a(-1, null);
          jdField_b_of_type_Boolean = false;
        }
        for (;;)
        {
          localObject = new ConfigManager(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getApplicationContext(), ConfigServlet.h);
          if (localObject != null)
          {
            ((ConfigManager)localObject).b();
            ((ConfigManager)localObject).c();
          }
          return;
          j();
        }
      }
      j();
      return;
    }
  }
  
  public void d()
  {
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(101);
    a(9, 0);
    a(11, 0);
    Object localObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentBanner[16];
    if ((localObject != null) && (jdField_a_of_type_AndroidViewView != null))
    {
      RelativeLayout localRelativeLayout = (RelativeLayout)jdField_a_of_type_AndroidViewView.findViewById(2131298627);
      localObject = (ADView)jdField_a_of_type_AndroidViewView.findViewById(2131298629);
      if (localObject != null)
      {
        ((ADView)localObject).c();
        ((ADView)localObject).a();
      }
      if (localRelativeLayout != null) {
        localRelativeLayout.setPadding(0, -1, 0, 0);
      }
    }
    jdField_b_of_type_Boolean = false;
    b();
    a(13, 0);
    jdField_d_of_type_Boolean = true;
    jdField_e_of_type_Boolean = false;
    jdField_g_of_type_JavaLangString = "";
    a(14, 0);
    a(18, 0);
    a(4, 0);
    a();
    h();
    a(-1, null);
    a(false);
  }
  
  public void e()
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.recent.banner", 2, "onDestroy");
      }
      c = true;
      if (jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener != null)
      {
        ((PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getManager(10)).b(jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener);
        jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager$IPhoneContactListener = null;
      }
      jdField_a_of_type_MqqOsMqqHandler.removeCallbacksAndMessages(null);
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("Q.recent.banner", 2, "onDestroy", localException);
    }
  }
  
  public void f()
  {
    k();
  }
  
  public void g()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.recent.banner", 2, "checkIsShowTroopTip");
    }
    QQAppInterface localQQAppInterface;
    List localList;
    int i1;
    label71:
    int i2;
    if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity != null)
    {
      localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app;
      if ((localQQAppInterface != null) && ((TroopAssistantManager.a().e(localQQAppInterface)) || (jdField_e_of_type_Boolean)))
      {
        localList = localQQAppInterface.a().a().a(false);
        if (localList != null) {
          break label120;
        }
        i1 = 0;
        i2 = 0;
        label73:
        if (i2 >= i1) {
          break label138;
        }
        if (gettype != 5000) {
          break label131;
        }
        if (jdField_e_of_type_Boolean) {
          jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(1);
        }
      }
    }
    label120:
    label131:
    label138:
    do
    {
      return;
      localQQAppInterface = null;
      break;
      i1 = localList.size();
      break label71;
      i2 += 1;
      break label73;
      i2 = 0;
      if (i2 < i1)
      {
        RecentUser localRecentUser = (RecentUser)localList.get(i2);
        if (type != 1) {}
        do
        {
          do
          {
            i2 += 1;
            break;
          } while ((TextUtils.isEmpty(uin)) || (TroopAssistantManager.a().b(localQQAppInterface, uin)) || (TroopAssistantManager.a().a(localQQAppInterface, uin) != 1));
          if (localQQAppInterface.a().a(uin, type) > 99)
          {
            if ((jdField_e_of_type_Boolean) && (!TextUtils.isEmpty(jdField_g_of_type_JavaLangString)) && (jdField_g_of_type_JavaLangString.equals(uin))) {
              break;
            }
            jdField_g_of_type_JavaLangString = uin;
            if ((!jdField_d_of_type_Boolean) || (!TroopAssistantManager.a().e(localQQAppInterface))) {
              break;
            }
            jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(0);
            return;
          }
        } while ((TextUtils.isEmpty(jdField_g_of_type_JavaLangString)) || (!jdField_g_of_type_JavaLangString.equals(uin)));
        jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(1);
        return;
      }
    } while ((!jdField_e_of_type_Boolean) || (TextUtils.isEmpty(jdField_g_of_type_JavaLangString)));
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(1);
  }
  
  public void h()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity == null) {}
    for (;;)
    {
      return;
      boolean bool = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.k;
      if (bool)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.recent.banner", 2, "checkShowMissedCall, isShowMissedCallBanner=" + bool);
        }
      }
      else
      {
        QCallFacade localQCallFacade = (QCallFacade)jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.getManager(37);
        if (localQCallFacade != null)
        {
          int i1 = localQCallFacade.a();
          if (i1 > 0) {
            if (!jdField_a_of_type_MqqOsMqqHandler.hasMessages(6)) {
              jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(6, 0L);
            }
          }
          while (QLog.isDevelopLevel())
          {
            QLog.d("Q.recent.banner", 4, "checkShowMissedCall。 count=" + i1);
            return;
            jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(7, 0L);
          }
        }
      }
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
    case 0: 
    case 1: 
    case 4: 
    case 6: 
    case 7: 
    case 12: 
    case 8: 
    case 9: 
    case 101: 
      do
      {
        return true;
        a(13, 2);
        a(13, paramMessage);
        return true;
        a(13, 0);
        jdField_g_of_type_JavaLangString = "";
        a(13, paramMessage);
        return true;
        a(14, 0);
        a(14, paramMessage);
        return true;
        a(2, 2);
        a(2, paramMessage);
        return true;
        a(2, 0);
        a(2, paramMessage);
        return true;
        a(19, 0);
        a(19, paramMessage);
        return true;
        a(18, 2);
        a(18, paramMessage);
        return true;
        a(18, 0);
        a(18, paramMessage);
        return true;
        try
        {
          if (QLog.isColorLevel()) {
            QLog.d("PushBanner", 2, "checkAndClosePushBanner");
          }
          c();
          return true;
        }
        catch (Exception paramMessage) {}
      } while (!QLog.isColorLevel());
      QLog.d("PushBanner", 2, "checkAndClosePushBanner Exception:", paramMessage);
      return true;
    case 11: 
      a(true);
      return true;
    case 13: 
      a(21, 0);
      a(21, paramMessage);
      return true;
    case 14: 
      a(22, 0);
      a(22, paramMessage);
      return true;
    }
    a(23, 0);
    a(23, paramMessage);
    return true;
  }
  
  public void i()
  {
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(7, 0L);
  }
}
