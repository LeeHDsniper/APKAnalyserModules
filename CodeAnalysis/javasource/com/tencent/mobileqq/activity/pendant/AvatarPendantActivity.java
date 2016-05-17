package com.tencent.mobileqq.activity.pendant;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.text.TextUtils.TruncateAt;
import android.util.DisplayMetrics;
import android.util.SparseIntArray;
import android.view.Display;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.widget.Button;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.PayBridgeActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.adapter.AvatarPendantAdapter;
import com.tencent.mobileqq.adapter.AvatarPendantAdapter.PendantGridAdapter.GridItemHolder;
import com.tencent.mobileqq.adapter.AvatarPendantAdapter.ViewHolder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.ClubContentUpdateHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.UniPayHandler;
import com.tencent.mobileqq.app.UniPayHandler.UniPayUpdateListener;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.util.ProfileCardUtil;
import com.tencent.mobileqq.util.SystemUtil;
import com.tencent.mobileqq.utils.AvatarPendantUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.vas.AvatarPendantManager;
import com.tencent.mobileqq.vas.AvatarPendantShopItemInfo;
import com.tencent.mobileqq.vas.AvatarPendantShopSeriesInfo;
import com.tencent.mobileqq.vas.ClubContentJsonTask;
import com.tencent.mobileqq.vas.ClubContentJsonTask.TaskInfo;
import com.tencent.mobileqq.vas.PendantInfo;
import com.tencent.mobileqq.vas.VasExtensionHandler;
import com.tencent.mobileqq.vas.VasExtensionObserver;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.vip.DownloaderFactory;
import com.tencent.mobileqq.vip.DownloaderInterface;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.TipsBar;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.GridView;
import com.tencent.widget.XListView;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.io.File;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import lwp;
import lwq;
import lwr;
import lws;
import lwv;
import lww;
import lwx;
import lwy;
import lxa;
import lxc;
import lxd;
import lxe;
import lxf;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;
import org.json.JSONException;
import org.json.JSONObject;

public class AvatarPendantActivity
  extends IphoneTitleBarActivity
  implements Handler.Callback, View.OnClickListener, AdapterView.OnItemClickListener
{
  public static int a = 0;
  static final String jdField_a_of_type_JavaLangString = "http://imgcache.qq.com/club/themes/mobile/act/2014/actTpl/html/home.html?app=vipActTpl_mobile_widgetLink";
  public static int b = 0;
  static final String jdField_b_of_type_JavaLangString = "sp_pendant_market_request";
  public static int c = 0;
  static final String jdField_c_of_type_JavaLangString = "PendantMarketLastJsonTimeSpKey";
  public static int d = 0;
  static final String e = "http://imgcache.qq.com/club/themes/mobile/act/2014/actTpl/html/home.html?app=gjjbzh&type=1&_wv=1025";
  static final int r = 1000;
  static final int s = 10;
  static final int t = 11;
  double jdField_a_of_type_Double;
  long jdField_a_of_type_Long;
  public Uri a;
  public Handler a;
  SparseIntArray jdField_a_of_type_AndroidUtilSparseIntArray = new SparseIntArray();
  View jdField_a_of_type_AndroidViewView;
  public Button a;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  public ProfileActivity.AllInOne a;
  public AvatarPendantAdapter a;
  UniPayHandler.UniPayUpdateListener jdField_a_of_type_ComTencentMobileqqAppUniPayHandler$UniPayUpdateListener = new lwy(this);
  UniPayHandler jdField_a_of_type_ComTencentMobileqqAppUniPayHandler;
  AvatarPendantShopItemInfo jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopItemInfo;
  public AvatarPendantShopSeriesInfo a;
  VasExtensionObserver jdField_a_of_type_ComTencentMobileqqVasVasExtensionObserver = new lws(this);
  public DownloadListener a;
  TipsBar jdField_a_of_type_ComTencentMobileqqWidgetTipsBar;
  XListView jdField_a_of_type_ComTencentWidgetXListView;
  boolean jdField_a_of_type_Boolean;
  double jdField_b_of_type_Double;
  View jdField_b_of_type_AndroidViewView;
  public Button b;
  public ImageView b;
  boolean jdField_b_of_type_Boolean;
  public ImageView c;
  boolean jdField_c_of_type_Boolean;
  String d;
  public int e;
  int f;
  int g;
  int h;
  int i;
  int j;
  int k;
  int l;
  int m;
  int n;
  int o;
  int p;
  int q;
  public int u;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = 1;
    jdField_c_of_type_Int = 2;
    jdField_d_of_type_Int = 3;
  }
  
  public AvatarPendantActivity()
  {
    jdField_a_of_type_ComTencentMobileqqVipDownloadListener = new lwr(this);
  }
  
  private void a(List paramList1, List paramList2, int paramInt)
  {
    if (Build.VERSION.SDK_INT < 14) {
      return;
    }
    ValueAnimator localValueAnimator = ValueAnimator.ofInt(new int[] { 1, 100 });
    localValueAnimator.setInterpolator(new DecelerateInterpolator());
    localValueAnimator.addUpdateListener(new lww(this, paramList1, paramList2));
    localValueAnimator.addListener(new lwx(this));
    localValueAnimator.setDuration(paramInt).start();
  }
  
  private void a(boolean paramBoolean)
  {
    String str = jdField_d_of_type_JavaLangString;
    ThreadManager.a().post(new lwq(this, str, paramBoolean));
  }
  
  private void g()
  {
    DownloaderInterface localDownloaderInterface = ((DownloaderFactory)app.getManager(46)).a(1);
    Object localObject1 = new File(AvatarPendantUtil.b);
    if (!((File)localObject1).exists()) {
      ((File)localObject1).mkdir();
    }
    Object localObject2 = new File(AvatarPendantUtil.b + "/icon.zip");
    if ((((File)localObject1).exists()) && (!((File)localObject2).exists()) && (localDownloaderInterface != null)) {
      ThreadManager.b().post(new lwp(this, localDownloaderInterface, (File)localObject2));
    }
    localObject1 = ((AvatarPendantManager)app.getManager(45)).a();
    boolean bool = app.a().getSharedPreferences("clubContentPendantMarketJsonUpdate", 0).getBoolean("clubContentPendantMarketJsonUpdate", false);
    if ((((List)localObject1).size() > 0) && (!bool))
    {
      jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter.a((List)localObject1);
      e();
    }
    do
    {
      do
      {
        return;
        jdField_a_of_type_AndroidOsHandler = new Handler(ThreadManager.a(), this);
        if (new File(jdField_d_of_type_JavaLangString).exists())
        {
          ((List)localObject1).clear();
          a(true);
          return;
        }
      } while (localDownloaderInterface == null);
      localObject1 = new DownloadTask(lb, new File(jdField_d_of_type_JavaLangString));
      m = false;
      k = true;
      localObject2 = new Bundle();
      localDownloaderInterface.a((DownloadTask)localObject1, jdField_a_of_type_ComTencentMobileqqVipDownloadListener, (Bundle)localObject2);
    } while (!QLog.isColorLevel());
    QLog.d("AvatarPendantActivity", 2, "checkAvatarPendantMarketIcon start download xydata.android.v1.json...");
  }
  
  private void h()
  {
    jdField_a_of_type_AndroidViewView = super.findViewById(2131302379);
    View localView = super.findViewById(2131301939);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)super.findViewById(2131302380));
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)super.findViewById(2131302378));
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)super.findViewById(2131302382));
    jdField_c_of_type_AndroidWidgetImageView = ((ImageView)super.findViewById(2131302384));
    jdField_b_of_type_AndroidViewView = super.findViewById(2131302383);
    jdField_a_of_type_ComTencentMobileqqWidgetTipsBar = ((TipsBar)super.findViewById(2131298511));
    jdField_a_of_type_AndroidWidgetButton = ((Button)super.findViewById(2131302385));
    jdField_b_of_type_AndroidWidgetButton = ((Button)super.findViewById(2131302386));
    jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
    Object localObject1 = (TextView)super.findViewById(2131297035);
    ((TextView)localObject1).setText(super.getString(2131367694));
    ((TextView)localObject1).setOnClickListener(this);
    ((TextView)super.findViewById(2131297034)).setText(super.getString(2131370515));
    Object localObject2 = (RelativeLayout)super.findViewById(2131297033);
    localObject1 = getWindowManager().getDefaultDisplay();
    int i1 = ((Display)localObject1).getHeight();
    int i2 = ((Display)localObject1).getWidth();
    double d3 = i1 / i2;
    double d1 = d3 - 1.78D;
    f = (i1 - a());
    e = jdField_a_of_type_Int;
    double d2 = 0.58D * (d3 - 2.0D * d1) / 1.8D;
    d1 = (1.85D - d1 * 2.0D) * 0.38D / d3;
    Object localObject3;
    if ((mNeedStatusTrans) && (ImmersiveUtils.isSupporImmersive() == 1))
    {
      d1 = d3 - 1.67D;
      i1 = a();
      localObject3 = (FrameLayout.LayoutParams)((RelativeLayout)localObject2).getLayoutParams();
      topMargin = i1;
      ((RelativeLayout)localObject2).setLayoutParams((ViewGroup.LayoutParams)localObject3);
      i1 = super.getResources().getDimensionPixelSize(2131492908);
      localObject2 = (RelativeLayout)super.findViewById(2131302381);
      localObject3 = (RelativeLayout.LayoutParams)((RelativeLayout)localObject2).getLayoutParams();
      topMargin = (i1 / 2 + 14 - (int)(Math.abs(d1) * 24.0D));
      ((RelativeLayout)localObject2).setLayoutParams((ViewGroup.LayoutParams)localObject3);
      d2 = 0.58D * (1.8D + 2.0D * d1) / d3;
      d1 = 0.38D * (d1 * 2.0D + 1.95D) / d3;
    }
    for (;;)
    {
      g = ((int)(f * d2));
      h = ((int)(f * d1));
      if (!jdField_b_of_type_Boolean)
      {
        super.findViewById(2131302387).setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setTipsText("没有SD卡无法使用头像挂件");
        jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.a(false);
        g = ((int)((d2 + 0.06D) * f));
        h = ((int)(d1 * f));
        jdField_a_of_type_Boolean = true;
        i = ((int)(g * 0.383D));
        k = ((int)(186.05F * i / 150.0F));
        m = ((int)(222.05F * k / 186.0F));
        o = ((k - i) / 2);
        jdField_a_of_type_Double = ((h + 0.05F) / g);
        jdField_a_of_type_Double -= 0.24D;
        j = ((int)(i * jdField_a_of_type_Double));
        l = ((int)(k * jdField_a_of_type_Double));
        n = ((int)(m * jdField_a_of_type_Double));
        p = ((int)(o * jdField_a_of_type_Double));
        jdField_b_of_type_Double = ((i - j + 0.05F) / (g - h));
        localObject1 = (FrameLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetXListView.getLayoutParams();
        localObject2 = (FrameLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams();
        topMargin = h;
        height = g;
        jdField_a_of_type_ComTencentWidgetXListView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
        jdField_a_of_type_AndroidViewView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
        localObject1 = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetImageView.getLayoutParams();
        localObject2 = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetImageView.getLayoutParams();
        localObject3 = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidViewView.getLayoutParams();
        width = i;
        height = i;
        width = k;
        height = m;
        height = o;
        jdField_b_of_type_AndroidWidgetImageView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
        jdField_b_of_type_AndroidViewView.setLayoutParams((ViewGroup.LayoutParams)localObject3);
        jdField_c_of_type_AndroidWidgetImageView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
        localObject1 = app.a(jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne.a, true);
        if (localObject1 == null) {
          break label1113;
        }
        jdField_b_of_type_AndroidWidgetImageView.setImageBitmap((Bitmap)localObject1);
        label944:
        l();
        if (!ThemeUtil.isInNightMode(app)) {
          break label1120;
        }
        if (localView != null) {
          localView.setVisibility(0);
        }
      }
      label1113:
      label1120:
      while (localView == null)
      {
        return;
        if (jdField_c_of_type_Boolean)
        {
          super.findViewById(2131302387).setVisibility(8);
          jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setTipsText("SD卡已满，可能无法使用头像挂件");
          jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.a(false);
          g = ((int)((d2 + 0.06D) * f));
          h = ((int)(d1 * f));
          jdField_a_of_type_Boolean = true;
          break;
        }
        jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter = new AvatarPendantAdapter(this, this, this, ((Display)localObject1).getWidth(), app, jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne.a, g - h);
        jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter);
        break;
        j();
        break label944;
      }
      localView.setVisibility(8);
      return;
    }
  }
  
  private void i()
  {
    if ((e == jdField_a_of_type_Int) || (e == jdField_d_of_type_Int)) {}
    while (Build.VERSION.SDK_INT < 14) {
      return;
    }
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams();
    RelativeLayout.LayoutParams localLayoutParams1 = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetImageView.getLayoutParams();
    RelativeLayout.LayoutParams localLayoutParams2 = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetImageView.getLayoutParams();
    Object localObject = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidViewView.getLayoutParams();
    height = o;
    jdField_b_of_type_AndroidViewView.setLayoutParams((ViewGroup.LayoutParams)localObject);
    localObject = new lxf();
    lxf localLxf1 = new lxf();
    lxf localLxf2 = new lxf();
    jdField_c_of_type_Int = height;
    jdField_d_of_type_Int = g;
    int i1 = topMargin;
    jdField_b_of_type_Int = i1;
    jdField_a_of_type_Int = i1;
    g = ((int)(Math.abs(g - height) * 1.0D / g * g));
    i1 = topMargin;
    jdField_b_of_type_Int = i1;
    jdField_a_of_type_Int = i1;
    e = width;
    f = i;
    jdField_c_of_type_Int = height;
    jdField_d_of_type_Int = i;
    g = g;
    i1 = topMargin;
    jdField_b_of_type_Int = i1;
    jdField_a_of_type_Int = i1;
    e = width;
    f = k;
    jdField_c_of_type_Int = height;
    jdField_d_of_type_Int = m;
    g = g;
    localArrayList2.add(jdField_a_of_type_AndroidViewView);
    localArrayList2.add(jdField_b_of_type_AndroidWidgetImageView);
    localArrayList2.add(jdField_c_of_type_AndroidWidgetImageView);
    localArrayList1.add(localObject);
    localArrayList1.add(localLxf1);
    localArrayList1.add(localLxf2);
    a(localArrayList2, localArrayList1, g);
  }
  
  private void j()
  {
    ThreadManager.a().post(new lxa(this));
  }
  
  private void k()
  {
    if (!ProfileActivity.AllInOne.f(jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne))
    {
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(4);
      return;
    }
    Object localObject = ((FriendsManager)app.getManager(50)).a(jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne.a);
    if ((localObject != null) && (((ExtensionInfo)localObject).isPendantValid()))
    {
      jdField_a_of_type_Long = pendantId;
      localObject = (AvatarPendantManager)app.getManager(45);
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      if (AvatarPendantUtil.a(jdField_a_of_type_Long)) {
        ((AvatarPendantManager)localObject).a(jdField_a_of_type_Long).a(jdField_c_of_type_AndroidWidgetImageView, 2, PendantInfo.o);
      }
      for (;;)
      {
        jdField_b_of_type_AndroidWidgetButton.setVisibility(0);
        return;
        ((AvatarPendantManager)localObject).a(jdField_a_of_type_Long).a(jdField_c_of_type_AndroidWidgetImageView, 5, PendantInfo.o);
      }
    }
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(4);
    jdField_b_of_type_AndroidWidgetButton.setVisibility(4);
  }
  
  private void l()
  {
    Object localObject = new File(AvatarPendantUtil.c + "/widget_display_bg.jpg");
    if (((File)localObject).exists())
    {
      ColorDrawable localColorDrawable = new ColorDrawable(-16741938);
      URLDrawable.URLDrawableOptions localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
      mRequestWidth = jdField_a_of_type_AndroidViewView.getWidth();
      mRequestHeight = jdField_a_of_type_AndroidViewView.getHeight();
      mFailedDrawable = localColorDrawable;
      mLoadingDrawable = localColorDrawable;
      localObject = URLDrawable.getDrawable((File)localObject, localURLDrawableOptions);
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject);
    }
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
  }
  
  public int a()
  {
    Object localObject1 = new Rect();
    getWindow().getDecorView().getWindowVisibleDisplayFrame((Rect)localObject1);
    int i2 = top;
    int i1 = i2;
    if (i2 == 0) {}
    try
    {
      localObject1 = Class.forName("com.android.internal.R$dimen");
      Object localObject2 = ((Class)localObject1).newInstance();
      i1 = Integer.parseInt(((Class)localObject1).getField("status_bar_height").get(localObject2).toString());
      i1 = super.getResources().getDimensionPixelSize(i1);
      return i1;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      localClassNotFoundException.printStackTrace();
      return i2;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      localIllegalAccessException.printStackTrace();
      return i2;
    }
    catch (InstantiationException localInstantiationException)
    {
      localInstantiationException.printStackTrace();
      return i2;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      localNumberFormatException.printStackTrace();
      return i2;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      localIllegalArgumentException.printStackTrace();
      return i2;
    }
    catch (SecurityException localSecurityException)
    {
      localSecurityException.printStackTrace();
      return i2;
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      localNoSuchFieldException.printStackTrace();
    }
    return i2;
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(new lwv(this));
  }
  
  public void a(TextView paramTextView, View paramView)
  {
    int i2 = getWindowManager().getDefaultDisplay().getWidth();
    int i3 = View.MeasureSpec.makeMeasureSpec(0, 0);
    int i4 = View.MeasureSpec.makeMeasureSpec(0, 0);
    paramTextView.measure(i3, i4);
    int i1 = paramTextView.getMeasuredWidth();
    paramView.measure(i3, i4);
    i3 = paramView.getMeasuredWidth();
    float f1 = getResourcesgetDisplayMetricsdensity;
    i2 = i2 - i3 - (int)(55 * f1 + 0.5F);
    if (i1 > i2)
    {
      paramTextView.setMaxWidth(i2 - 10);
      paramTextView.setSingleLine(true);
      paramTextView.setEllipsize(TextUtils.TruncateAt.END);
    }
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (paramAdapterView.getId() != 2131302406) {}
    while ((!(paramAdapterView instanceof GridView)) || (paramAdapterView.getTag() == null) || (paramView == null) || (paramView.getTag() == null)) {
      return;
    }
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
    f();
    jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopItemInfo = ((AvatarPendantShopItemInfo)getTaga.getTag());
    jdField_a_of_type_Long = jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopItemInfo.jdField_a_of_type_Int;
    Object localObject = (AvatarPendantManager)app.getManager(45);
    List localList = ((AvatarPendantManager)localObject).a();
    AvatarPendantShopSeriesInfo localAvatarPendantShopSeriesInfo1 = jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo;
    AvatarPendantShopSeriesInfo localAvatarPendantShopSeriesInfo2 = (AvatarPendantShopSeriesInfo)paramAdapterView.getTag();
    int i1 = 0;
    if (i1 < localList.size())
    {
      AvatarPendantShopSeriesInfo localAvatarPendantShopSeriesInfo3 = (AvatarPendantShopSeriesInfo)localList.get(i1);
      if (localAvatarPendantShopSeriesInfo3 != null)
      {
        if (jdField_a_of_type_Int != jdField_a_of_type_Int) {
          break label184;
        }
        jdField_c_of_type_Int = paramInt;
        jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo = localAvatarPendantShopSeriesInfo2;
      }
      for (;;)
      {
        i1 += 1;
        break;
        label184:
        if ((localAvatarPendantShopSeriesInfo1 != null) && (jdField_a_of_type_Int == jdField_a_of_type_Int)) {
          jdField_c_of_type_Int = -1;
        }
      }
    }
    jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter.a(localList);
    i1 = jdField_a_of_type_AndroidWidgetButton.getPaddingBottom();
    int i2 = jdField_a_of_type_AndroidWidgetButton.getPaddingTop();
    int i3 = jdField_a_of_type_AndroidWidgetButton.getPaddingRight();
    int i4 = jdField_a_of_type_AndroidWidgetButton.getPaddingLeft();
    label283:
    label377:
    label477:
    int i5;
    if (a())
    {
      jdField_a_of_type_AndroidWidgetButton.setTextColor(-1711276033);
      jdField_a_of_type_AndroidWidgetButton.setBackgroundResource(2130841263);
      jdField_a_of_type_AndroidWidgetButton.setPadding(i4, i2, i3, i1);
      ReportController.b(app, "CliOper", "", "", "0X8005FD5", "0X8005FD5", 0, 0, String.valueOf(jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo.jdField_a_of_type_Int), String.valueOf(jdField_a_of_type_Long), "", "");
      if (jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopItemInfo.jdField_b_of_type_Int != 1) {
        break label604;
      }
      ((AvatarPendantManager)localObject).a(jdField_a_of_type_Long).a(jdField_c_of_type_AndroidWidgetImageView, 2, PendantInfo.o);
      if (Build.VERSION.SDK_INT < 14) {
        break label626;
      }
      if ((e == jdField_b_of_type_Int) || (e == jdField_c_of_type_Int))
      {
        paramAdapterView = (ViewGroup)paramAdapterView.getParent();
        localObject = (ViewGroup)paramAdapterView.getParent();
        i1 = paramAdapterView.getHeight();
        i2 = paramView.getHeight();
        i3 = DisplayUtil.a(this, 7.0F);
        if (!jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo.jdField_a_of_type_Boolean) {
          break label660;
        }
        i4 = (jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo.jdField_a_of_type_JavaUtilList.size() - 1) / 4;
        if (paramInt != 0) {
          break label628;
        }
        paramInt = 0;
        i5 = DisplayUtil.a(this, 4.0F);
      }
    }
    label604:
    label626:
    label628:
    label635:
    label660:
    for (paramInt = i1 - (i4 + 1 - paramInt) * (i2 + i5) + i5 - i3;; paramInt = i1 - i2 - i3)
    {
      i2 = g - h;
      i1 = ((ViewGroup)localObject).getTop();
      if (((ViewGroup)localObject).getTag() != null)
      {
        i3 = getTagjdField_a_of_type_Int;
        if (i1 >= 0) {
          break label635;
        }
        i1 = paramInt;
        if (paramInt < 0) {
          i1 = 0 - paramInt;
        }
        jdField_a_of_type_ComTencentWidgetXListView.setSelectionFromTop(i3, i2 - i1);
      }
      for (;;)
      {
        i();
        return;
        jdField_a_of_type_AndroidWidgetButton.setTextColor(-1);
        jdField_a_of_type_AndroidWidgetButton.setBackgroundResource(2130841262);
        break label283;
        ((AvatarPendantManager)localObject).a(jdField_a_of_type_Long).a(jdField_c_of_type_AndroidWidgetImageView, 5, PendantInfo.o);
        break label377;
        break;
        paramInt /= 4;
        break label477;
        if (paramInt + i1 < i2) {
          jdField_a_of_type_ComTencentWidgetXListView.setSelectionFromTop(i3, i2 - paramInt);
        }
      }
    }
  }
  
  public void a(String paramString1, String paramString2, boolean paramBoolean, int paramInt)
  {
    JSONObject localJSONObject = new JSONObject();
    String str1;
    if (paramBoolean)
    {
      str1 = "mvip.gxh.android.faceaddon_nati_dft";
      if (!paramBoolean) {
        break label139;
      }
    }
    for (String str2 = "pendantNativeVipDefault";; str2 = "pendantNativeVip" + jdField_a_of_type_Long)
    {
      try
      {
        localJSONObject.put("userId", app.a());
        localJSONObject.put("openMonth", paramInt);
        localJSONObject.put("aid", str1);
        localJSONObject.put("offerId", "1450000515");
        localJSONObject.put("serviceName", paramString2);
        localJSONObject.put("serviceCode", paramString1);
        PayBridgeActivity.tenpay(this, localJSONObject.toString(), 4, str2);
        return;
      }
      catch (JSONException paramString1)
      {
        label139:
        paramString1.printStackTrace();
      }
      str1 = "mvip.gxh.android.faceaddon_nati_" + jdField_a_of_type_Long;
      break;
    }
  }
  
  public boolean a()
  {
    if ((app != null) && (jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne != null))
    {
      ExtensionInfo localExtensionInfo = ((FriendsManager)app.getManager(50)).a(jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne.a);
      if ((localExtensionInfo != null) && (pendantId == jdField_a_of_type_Long)) {
        return true;
      }
    }
    return false;
  }
  
  public int b()
  {
    int i1 = 0;
    View localView = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(0);
    if (localView == null) {
      return 0;
    }
    int i2 = -localView.getTop();
    jdField_a_of_type_AndroidUtilSparseIntArray.put(jdField_a_of_type_ComTencentWidgetXListView.s(), localView.getHeight());
    if (i1 < jdField_a_of_type_ComTencentWidgetXListView.s())
    {
      if (jdField_a_of_type_AndroidUtilSparseIntArray.get(i1) == 0) {
        jdField_a_of_type_Boolean = true;
      }
      for (;;)
      {
        i1 += 1;
        break;
        i2 += jdField_a_of_type_AndroidUtilSparseIntArray.get(i1);
      }
    }
    return i2;
  }
  
  public void b()
  {
    int i1 = b();
    int i2 = i1 - q;
    q = i1;
    FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams();
    RelativeLayout.LayoutParams localLayoutParams1 = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetImageView.getLayoutParams();
    RelativeLayout.LayoutParams localLayoutParams2 = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetImageView.getLayoutParams();
    RelativeLayout.LayoutParams localLayoutParams3 = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidViewView.getLayoutParams();
    if ((i2 >= 0) || ((i2 <= 0) && (q <= g - h))) {
      height -= i2;
    }
    if (height <= h)
    {
      height = h;
      i1 = j;
      height = i1;
      width = i1;
      width = l;
      height = n;
      height = p;
      e = jdField_b_of_type_Int;
      if ((e == jdField_c_of_type_Int) && ((i2 >= 0) || ((i2 <= 0) && (q <= g - h))))
      {
        i1 = i2;
        if (i2 != 0)
        {
          i1 = i2;
          if (i2 != 1) {
            if (i2 != -1) {
              break label423;
            }
          }
        }
      }
    }
    label423:
    for (i1 = i2;; i1 = (int)(i2 * jdField_b_of_type_Double))
    {
      width -= i1;
      height = width;
      width -= (int)(i1 * 186.05F / 150.0F);
      height = ((int)(222.05F * width / 186.0F));
      height = ((width - width) / 2);
      jdField_a_of_type_AndroidViewView.setLayoutParams(localLayoutParams);
      jdField_b_of_type_AndroidWidgetImageView.setLayoutParams(localLayoutParams1);
      jdField_c_of_type_AndroidWidgetImageView.setLayoutParams(localLayoutParams2);
      jdField_b_of_type_AndroidViewView.setLayoutParams(localLayoutParams3);
      return;
      if (height >= g)
      {
        height = g;
        i1 = i;
        height = i1;
        width = i1;
        width = k;
        height = m;
        height = o;
        e = jdField_a_of_type_Int;
        break;
      }
      e = jdField_c_of_type_Int;
      break;
    }
  }
  
  public void c()
  {
    ImageView localImageView = (ImageView)super.findViewById(2131302388);
    TextView localTextView = (TextView)super.findViewById(2131302389);
    Button localButton = (Button)super.findViewById(2131302390);
    String str2 = app.a();
    SharedPreferences localSharedPreferences = app.a().getSharedPreferences("uniPaySp_" + str2, 0);
    String str3 = localSharedPreferences.getString("sUin", "");
    int i1 = localSharedPreferences.getInt("isShowOpen", 0);
    int i2 = localSharedPreferences.getInt("iUinpPayType", 0);
    Object localObject3 = "LTMCLUB";
    String str1 = "QQ会员";
    String str4 = super.getString(2131370706);
    Object localObject2 = str1;
    Object localObject1 = localObject3;
    if (str3 != null)
    {
      localObject2 = str1;
      localObject1 = localObject3;
      if (str2 != null)
      {
        localObject2 = str1;
        localObject1 = localObject3;
        if (str3.equals(str2))
        {
          if (1 == i1)
          {
            localImageView.setVisibility(0);
            localTextView.setVisibility(0);
            localButton.setVisibility(0);
          }
          switch (i2)
          {
          default: 
            localObject1 = "QQ会员";
            localObject2 = "LTMCLUB";
          }
        }
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("AvatarPendantActivity", 2, "UniPayUpdateListener back showTitleBtn isShowOpen:" + i1);
      }
      a(localTextView, localButton);
      localObject3 = localObject1;
      localObject1 = localObject2;
      localObject2 = localObject3;
      localButton.setOnClickListener(new lxc(this, (String)localObject1, (String)localObject2, Integer.valueOf(localSharedPreferences.getString("open_month", "3")).intValue()));
      return;
      localButton.setText(2131370020);
      localTextView.setText(super.getString(2131370071, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839240));
      localObject1 = "QQ会员";
      localObject2 = "LTMCLUB";
      continue;
      localButton.setText(2131370021);
      localTextView.setText(super.getString(2131370072, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839702));
      localObject1 = "QQ会员";
      localObject2 = "LTMCLUB";
      continue;
      localButton.setText(2131370020);
      localTextView.setText(super.getString(2131370073, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839240));
      localObject2 = "CJCLUBT";
      localObject1 = "超级会员";
      continue;
      localButton.setText(2131370021);
      localTextView.setText(super.getString(2131370074, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839351));
      localObject2 = "CJCLUBT";
      localObject1 = "超级会员";
      continue;
      localButton.setText(2131370021);
      localTextView.setText(super.getString(2131370078, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839703));
      localObject2 = "CJCLUBT";
      localObject1 = "超级会员";
      continue;
      localButton.setText(2131370022);
      localTextView.setText(super.getString(2131370079, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839703));
      localObject2 = "CJCLUBT";
      localObject1 = "超级会员";
      continue;
      localButton.setText(2131370022);
      localTextView.setText(super.getString(2131370075, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839351));
      localObject2 = "CJCLUBT";
      localObject1 = "超级会员";
      continue;
      localButton.setText(2131370021);
      localTextView.setText(super.getString(2131370076, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839704));
      localObject2 = "LTMCLUB";
      localObject1 = "QQ会员";
      continue;
      localButton.setText(2131370022);
      localTextView.setText(super.getString(2131370077, new Object[] { str4 }));
      localImageView.setBackgroundDrawable(super.getResources().getDrawable(2130839704));
      localObject2 = "LTMCLUB";
      localObject1 = "QQ会员";
    }
  }
  
  public void d()
  {
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(this, null);
    String[] arrayOfString = super.getResources().getStringArray(2131230742);
    localActionSheet.a(arrayOfString[13], 1);
    localActionSheet.a(arrayOfString[14], 1);
    localActionSheet.d(arrayOfString[16]);
    localActionSheet.a(new lxd(this, localActionSheet));
    try
    {
      if (!isFinishing()) {
        localActionSheet.show();
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    int i1 = -1;
    if (paramInt1 == 4) {
      if (paramIntent != null)
      {
        str = paramIntent.getStringExtra("callbackSn");
        if ((str != null) && (str.startsWith("pendantNativeVip"))) {
          break label38;
        }
      }
    }
    label38:
    label188:
    label195:
    while (paramInt2 != -1)
    {
      String str;
      return;
      paramIntent = paramIntent.getStringExtra("result");
      for (;;)
      {
        try
        {
          localObject = new JSONObject(paramIntent);
        }
        catch (JSONException paramIntent)
        {
          try
          {
            paramInt2 = Integer.parseInt(((JSONObject)localObject).getString("resultCode"));
          }
          catch (JSONException paramIntent)
          {
            for (;;)
            {
              Object localObject;
              int i2;
              paramInt1 = -1;
              paramInt2 = -1;
            }
          }
          try
          {
            paramInt1 = Integer.parseInt(((JSONObject)localObject).getString("payState"));
          }
          catch (JSONException paramIntent)
          {
            paramInt1 = -1;
            break label188;
          }
          try
          {
            i2 = Integer.parseInt(((JSONObject)localObject).getString("provideState"));
            i1 = i2;
            if ((localObject == null) || (paramInt2 != 0) || (paramInt1 != 0) || (i1 != 0)) {
              break;
            }
            if (jdField_a_of_type_ComTencentMobileqqAppUniPayHandler != null) {
              jdField_a_of_type_ComTencentMobileqqAppUniPayHandler.a("");
            }
            if (!str.equals("pendantNativeVipDefault")) {
              break label195;
            }
            ReportController.b(app, "CliOper", "", "", "0X8005FDF", "0X8005FDF", 0, 0, "", "", "", "");
            return;
          }
          catch (JSONException paramIntent)
          {
            break label188;
          }
          paramIntent = paramIntent;
          paramInt2 = -1;
          localObject = null;
          paramInt1 = -1;
        }
        paramIntent.printStackTrace();
      }
      ReportController.b(app, "CliOper", "", "", "0X8005FDF", "0X8005FDF", 0, 0, str.substring(16, str.length()), "", "", "");
      return;
    }
    switch (paramInt1)
    {
    default: 
      return;
    }
    paramIntent = ImageUtil.c(this, jdField_a_of_type_AndroidNetUri);
    paramInt1 = Math.min(482, ProfileCardUtil.a(this));
    localObject = new Intent();
    ((Intent)localObject).putExtra("Business_Origin", 100);
    ((Intent)localObject).putExtra("fromWhereClick", 10);
    PhotoUtils.a((Intent)localObject, this, AvatarPendantActivity.class.getName(), paramInt1, paramInt1, 640, 640, paramIntent, ProfileCardUtil.a());
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    super.setContentViewNoTitle(2130904375);
    getWindow().setBackgroundDrawable(null);
    paramBundle = super.getIntent();
    boolean bool;
    if (paramBundle.getParcelableExtra("AllInOne") != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne = ((ProfileActivity.AllInOne)paramBundle.getParcelableExtra("AllInOne"));
      c();
      jdField_a_of_type_ComTencentMobileqqAppUniPayHandler = ((UniPayHandler)app.a(44));
      jdField_a_of_type_ComTencentMobileqqAppUniPayHandler.a(jdField_a_of_type_ComTencentMobileqqAppUniPayHandler$UniPayUpdateListener);
      super.addObserver(jdField_a_of_type_ComTencentMobileqqVasVasExtensionObserver);
      jdField_a_of_type_ComTencentMobileqqAppUniPayHandler.a("");
      if ((!NetworkUtil.e(this)) && (QLog.isColorLevel())) {
        QLog.d("AvatarPendantActivity", 2, "net is not connected");
      }
      jdField_b_of_type_Boolean = SystemUtil.a();
      if (SystemUtil.a() >= 1024L) {
        break label241;
      }
      bool = true;
      jdField_c_of_type_Boolean = bool;
      jdField_d_of_type_JavaLangString = (app.getApplication().getApplicationContext().getFilesDir() + File.separator + la);
      h();
      if ((!jdField_b_of_type_Boolean) || (jdField_c_of_type_Boolean)) {
        break label246;
      }
      a();
      g();
    }
    label241:
    label246:
    while (!QLog.isColorLevel())
    {
      return true;
      if (QLog.isColorLevel()) {
        QLog.d("AvatarPendantActivity", 2, "AllinOne info is null");
      }
      finish();
      return true;
      bool = false;
      break;
    }
    QLog.d("AvatarPendantActivity", 2, "sdcard exist:" + jdField_b_of_type_Boolean + " sdcard full:" + jdField_c_of_type_Boolean);
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (jdField_a_of_type_ComTencentMobileqqAppUniPayHandler != null) {
      jdField_a_of_type_ComTencentMobileqqAppUniPayHandler.b(jdField_a_of_type_ComTencentMobileqqAppUniPayHandler$UniPayUpdateListener);
    }
    super.removeObserver(jdField_a_of_type_ComTencentMobileqqVasVasExtensionObserver);
    if (jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo != null) {
      jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo.jdField_c_of_type_Int = -1;
    }
    if ((app != null) && (jdField_a_of_type_Long != 0L)) {
      ((AvatarPendantManager)app.getManager(45)).a(jdField_a_of_type_Long).b();
    }
    if (jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter != null)
    {
      jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter.a();
      URLDrawable.resume();
    }
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    String str = paramIntent.getStringExtra("PhotoConst.SINGLE_PHOTO_PATH");
    if (str != null)
    {
      if (!ProfileCardUtil.a(app, str)) {
        break label183;
      }
      ReportController.b(app, "CliOper", "", "", "0X8005FDE", "0X8005FDE", 0, 0, "", "", "", "");
      j();
      switch (paramIntent.getIntExtra("fromWhereClick", -1))
      {
      }
    }
    for (;;)
    {
      k();
      return;
      ReportController.b(app, "CliOper", "", "", "0X8005FDE", "0X8005FDE", 1, 0, "", "", "", "");
      continue;
      ReportController.b(app, "CliOper", "", "", "0X8005FDE", "0X8005FDE", 0, 0, "", "", "", "");
      continue;
      label183:
      QQToast.a(this, 1, 2131369817, 0).b(getTitleBarHeight());
    }
  }
  
  protected void doOnPause()
  {
    ((AvatarPendantManager)app.getManager(45)).c();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    List localList = ((AvatarPendantManager)app.getManager(45)).a();
    if ((jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter != null) && (localList.size() > 0)) {
      jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter.a(localList);
    }
    k();
  }
  
  public void e()
  {
    if (app == null) {}
    long l1;
    long l2;
    do
    {
      return;
      SharedPreferences localSharedPreferences = app.getApplication().getSharedPreferences("sp_pendant_market_request", 0);
      l1 = localSharedPreferences.getLong("PendantMarketLastJsonTimeSpKey", 0L);
      l2 = NetConnInfoCenter.getServerTimeMillis();
      if (l2 - l1 > 1800000L)
      {
        ClubContentUpdateHandler.b(app);
        localSharedPreferences.edit().putLong("PendantMarketLastJsonTimeSpKey", l2).commit();
      }
    } while (!QLog.isColorLevel());
    QLog.d("AvatarPendantActivity", 2, "sendCheckUpdateReq, lastRequestTime=" + l1 + ", AppSetting.isDebugVersion=" + false + ",serverTime:" + l2);
  }
  
  public void f()
  {
    if (jdField_a_of_type_Long != 0L) {
      ((AvatarPendantManager)app.getManager(45)).a(jdField_a_of_type_Long).b();
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (isFinishing()) {}
    while (what != 1000) {
      return true;
    }
    runOnUiThread(new lxe(this, ((AvatarPendantManager)app.getManager(45)).a()));
    return true;
  }
  
  public void onClick(View paramView)
  {
    if (paramView == null) {}
    int i1;
    label537:
    do
    {
      Object localObject;
      do
      {
        do
        {
          return;
          switch (paramView.getId())
          {
          default: 
            return;
          case 2131297035: 
            finish();
            return;
          case 2131302385: 
            if (!NetworkUtil.e(this))
            {
              QQToast.a(this, 2131370258, 0).b(getTitleBarHeight());
              return;
            }
            if ((jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopItemInfo != null) && (jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopItemInfo.jdField_a_of_type_Boolean))
            {
              paramView = "http://imgcache.qq.com/club/themes/mobile/act/2014/actTpl/html/home.html?app=vipActTpl_mobile_widgetLink" + jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopItemInfo.jdField_a_of_type_Int;
              localObject = new Intent(this, QQBrowserActivity.class);
              ((Intent)localObject).putExtra("url", paramView);
              ((Intent)localObject).putExtra("hide_more_button", true);
              ((Intent)localObject).putExtra("webStyle", "noBottomBar");
              startActivity((Intent)localObject);
              return;
            }
            break;
          }
        } while (jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo == null);
        if (!a()) {
          ((VasExtensionHandler)app.a(71)).a(jdField_a_of_type_Long, jdField_a_of_type_ComTencentMobileqqVasAvatarPendantShopSeriesInfo.jdField_a_of_type_Int);
        }
        ReportController.b(app, "CliOper", "", "", "0X8005FDB", "0X8005FDB", 0, 0, "", "", "", "");
        return;
        if (!NetworkUtil.e(this))
        {
          QQToast.a(this, 2131370258, 0).b(getTitleBarHeight());
          return;
        }
        ((VasExtensionHandler)app.a(71)).a(0L, 0);
        ReportController.b(app, "CliOper", "", "", "0X8005FD3", "0X8005FD3", 0, 0, "", "", "", "");
        return;
        if (ProfileCardUtil.a()) {
          QQToast.a(this, 1, 2131368475, 0).b(getTitleBarHeight());
        }
        for (;;)
        {
          ReportController.b(app, "CliOper", "", "", "0X8004174", "0X8004174", jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne.g, 0, "", "", "", "");
          return;
          d();
        }
      } while (paramView.getTag() == null);
      long l1 = ((Integer)paramView.getTag()).intValue();
      paramView = ((AvatarPendantManager)app.getManager(45)).a();
      i1 = 0;
      if (i1 < paramView.size())
      {
        localObject = (AvatarPendantShopSeriesInfo)paramView.get(i1);
        if ((localObject != null) && (jdField_a_of_type_Int == l1)) {
          if (jdField_a_of_type_Boolean) {
            break label537;
          }
        }
        for (boolean bool = true;; bool = false)
        {
          jdField_a_of_type_Boolean = bool;
          i1 += 1;
          break;
        }
      }
      jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter.a(paramView);
      return;
      i1 = jdField_a_of_type_AndroidViewView.getLayoutParams()).height;
    } while ((jdField_a_of_type_ComTencentMobileqqAdapterAvatarPendantAdapter == null) || (i1 == g));
    i();
    return;
    paramView = new Intent(this, QQBrowserActivity.class);
    paramView.putExtra("url", "http://imgcache.qq.com/club/themes/mobile/act/2014/actTpl/html/home.html?app=gjjbzh&type=1&_wv=1025");
    paramView.putExtra("isShowAd", false);
    super.startActivity(paramView);
    ReportController.b(app, "CliOper", "", "", "0X8006334", "0X8006334", 0, 0, "", "", "", "");
  }
}
