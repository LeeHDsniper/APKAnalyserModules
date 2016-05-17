package com.tencent.mobileqq.activity.selectmember;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.animation.AlphaAnimation;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TableLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.LbsBaseActivity;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.NearFieldDiscussObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoCell;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLocation;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoWifi;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.MessageMicro;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import mkd;
import mke;
import mkf;
import mkg;
import mkh;
import mki;
import mkj;
import mkk;
import mkm;
import mkn;
import tencent.im.nearfield_discuss.nearfield_discuss.Cell;
import tencent.im.nearfield_discuss.nearfield_discuss.GPS;
import tencent.im.nearfield_discuss.nearfield_discuss.LBSInfo;
import tencent.im.nearfield_discuss.nearfield_discuss.UserProfile;
import tencent.im.nearfield_discuss.nearfield_discuss.Wifi;

public class CreateFaceToFaceDiscussionActivity
  extends LbsBaseActivity
  implements View.OnClickListener, FaceDecoder.DecodeTaskCompletionListener
{
  public static final String a = "CreateFaceToFaceDiscussionActivity";
  private static final int g = 0;
  private static final int h = 1;
  private static final int i = 2;
  private static final int j = 3;
  public long a;
  BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  public Context a;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  public Drawable a;
  public Handler a;
  public View a;
  AlphaAnimation jdField_a_of_type_AndroidViewAnimationAlphaAnimation;
  TranslateAnimation jdField_a_of_type_AndroidViewAnimationTranslateAnimation;
  Button jdField_a_of_type_AndroidWidgetButton;
  public GridView a;
  public ImageView a;
  public LinearLayout a;
  TableLayout jdField_a_of_type_AndroidWidgetTableLayout;
  public TextView a;
  FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  private NearFieldDiscussObserver jdField_a_of_type_ComTencentMobileqqAppNearFieldDiscussObserver;
  FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  public QQProgressDialog a;
  public StringBuffer a;
  StringBuilder jdField_a_of_type_JavaLangStringBuilder;
  public List a;
  public mkm a;
  nearfield_discuss.LBSInfo jdField_a_of_type_TencentImNearfield_discussNearfield_discuss$LBSInfo;
  public nearfield_discuss.UserProfile a;
  boolean jdField_a_of_type_Boolean;
  public int b;
  View jdField_b_of_type_AndroidViewView;
  public TranslateAnimation b;
  public ImageView b;
  public LinearLayout b;
  TableLayout jdField_b_of_type_AndroidWidgetTableLayout;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  public boolean b;
  final int jdField_c_of_type_Int;
  public View c;
  public ImageView c;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  public boolean c;
  final int jdField_d_of_type_Int;
  public ImageView d;
  private TextView jdField_d_of_type_AndroidWidgetTextView;
  private boolean jdField_d_of_type_Boolean;
  final int jdField_e_of_type_Int;
  public ImageView e;
  private TextView jdField_e_of_type_AndroidWidgetTextView;
  final int jdField_f_of_type_Int;
  public ImageView f;
  private TextView jdField_f_of_type_AndroidWidgetTextView;
  public ImageView g;
  public ImageView h;
  public ImageView i;
  public ImageView j;
  public ImageView k;
  public ImageView l;
  public ImageView m;
  public ImageView n;
  public ImageView o;
  
  public CreateFaceToFaceDiscussionActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangStringBuffer = new StringBuffer(4);
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Int = -1;
    jdField_c_of_type_Int = 0;
    jdField_d_of_type_Int = 1;
    jdField_a_of_type_Long = 60000L;
    jdField_e_of_type_Int = 50;
    jdField_f_of_type_Int = 11;
    jdField_a_of_type_AndroidOsHandler = new mkh(this);
    jdField_a_of_type_ComTencentMobileqqAppNearFieldDiscussObserver = new mkj(this);
    jdField_c_of_type_Boolean = true;
    jdField_a_of_type_JavaLangStringBuilder = new StringBuilder();
    jdField_a_of_type_JavaUtilList = new ArrayList();
  }
  
  private nearfield_discuss.LBSInfo a(SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    if (paramSosoLbsInfo == null) {
      return jdField_a_of_type_TencentImNearfield_discussNearfield_discuss$LBSInfo;
    }
    nearfield_discuss.LBSInfo localLBSInfo = new nearfield_discuss.LBSInfo();
    Object localObject1 = new nearfield_discuss.GPS();
    int32_lat.set((int)(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.c * 1000000.0D));
    int32_lon.set((int)(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.d * 1000000.0D));
    int32_alt.set(-1);
    eType.set(0);
    msg_gps.set((MessageMicro)localObject1);
    localStringBuffer.append(" GPS: ").append(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.c * 1000000.0D).append(",").append(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.d * 1000000.0D);
    Object localObject2;
    if (b != null)
    {
      localObject1 = b.iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (SosoInterface.SosoWifi)((Iterator)localObject1).next();
        nearfield_discuss.Wifi localWifi = new nearfield_discuss.Wifi();
        uint64_mac.set(jdField_a_of_type_Long);
        int32_rssi.set(jdField_a_of_type_Int);
        rpt_msg_wifis.add(localWifi);
        localStringBuffer.append("| WIFI: ").append(jdField_a_of_type_Long).append(",").append(jdField_a_of_type_Int);
      }
    }
    if (jdField_a_of_type_JavaUtilArrayList != null)
    {
      paramSosoLbsInfo = jdField_a_of_type_JavaUtilArrayList.iterator();
      while (paramSosoLbsInfo.hasNext())
      {
        localObject1 = (SosoInterface.SosoCell)paramSosoLbsInfo.next();
        localObject2 = new nearfield_discuss.Cell();
        int32_mcc.set(jdField_a_of_type_Int);
        int32_mnc.set(jdField_b_of_type_Int);
        int32_lac.set(jdField_c_of_type_Int);
        int32_cellid.set(jdField_d_of_type_Int);
        int32_rssi.set(jdField_e_of_type_Int);
        rpt_msg_cells.add((MessageMicro)localObject2);
        localStringBuffer.append("| CELL: ").append(jdField_a_of_type_Int).append(",").append(jdField_b_of_type_Int).append(",").append(jdField_c_of_type_Int).append(",").append(jdField_d_of_type_Int).append(",").append(jdField_e_of_type_Int);
      }
    }
    jdField_a_of_type_TencentImNearfield_discussNearfield_discuss$LBSInfo = localLBSInfo;
    if (QLog.isColorLevel()) {
      QLog.i("CreateFaceToFaceDiscussionActivity", 2, localStringBuffer.toString());
    }
    return localLBSInfo;
  }
  
  private void a(int paramInt)
  {
    ThreadManager.a(new mkk(this, paramInt), 8, null, false);
  }
  
  private void a(View paramView)
  {
    paramView = (mkn)paramView.getTag();
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840442);
    jdField_a_of_type_AndroidWidgetTextView.setText(null);
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_AndroidWidgetTextView.setContentDescription(null);
    jdField_a_of_type_AndroidWidgetImageView.setContentDescription(null);
  }
  
  private void a(View paramView, nearfield_discuss.UserProfile paramUserProfile)
  {
    String str = String.valueOf(uint64_uin.get());
    paramUserProfile = str_nick.get();
    mkn localMkn = (mkn)paramView.getTag();
    Bitmap localBitmap = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, str);
    paramView = localBitmap;
    if (localBitmap == null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(str, 1, false, (byte)1);
      if (jdField_a_of_type_AndroidGraphicsBitmap == null) {
        jdField_a_of_type_AndroidGraphicsBitmap = ImageUtil.a();
      }
      paramView = jdField_a_of_type_AndroidGraphicsBitmap;
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramView);
    if (jdField_a_of_type_ComTencentMobileqqAppFriendsManager == null) {
      jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)app.getManager(50));
    }
    if ((str != null) && (jdField_a_of_type_ComTencentMobileqqAppFriendsManager.b(str))) {}
    for (paramView = ContactUtils.a(app, str);; paramView = paramUserProfile)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(paramView);
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription(paramView);
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription(paramView + "头像");
      jdField_a_of_type_JavaLangString = str;
      return;
    }
  }
  
  private void e()
  {
    jdField_e_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131304018));
    jdField_f_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131304019));
    g = ((ImageView)findViewById(2131304020));
    h = ((ImageView)findViewById(2131304021));
    i = ((ImageView)findViewById(2131304022));
    j = ((ImageView)findViewById(2131304023));
    k = ((ImageView)findViewById(2131304024));
    l = ((ImageView)findViewById(2131304025));
    m = ((ImageView)findViewById(2131304026));
    n = ((ImageView)findViewById(2131304028));
    o = ((ImageView)findViewById(2131303872));
    jdField_e_of_type_AndroidWidgetImageView.setOnClickListener(this);
    jdField_f_of_type_AndroidWidgetImageView.setOnClickListener(this);
    g.setOnClickListener(this);
    h.setOnClickListener(this);
    i.setOnClickListener(this);
    j.setOnClickListener(this);
    k.setOnClickListener(this);
    l.setOnClickListener(this);
    m.setOnClickListener(this);
    n.setOnClickListener(this);
    o.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131304030));
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131304031));
    jdField_c_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131304032));
    jdField_d_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131304033));
    jdField_a_of_type_AndroidViewView = findViewById(2131298598);
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130838193);
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131296680));
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131304037));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131304034));
    jdField_a_of_type_AndroidWidgetTextView.setContentDescription(getString(2131369846));
    jdField_a_of_type_AndroidWidgetTableLayout = ((TableLayout)findViewById(2131304017));
    jdField_b_of_type_AndroidWidgetTableLayout = ((TableLayout)findViewById(2131304029));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131304035));
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_b_of_type_AndroidViewView = findViewById(2131298389);
    jdField_b_of_type_AndroidViewView.setVisibility(4);
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297034));
    jdField_c_of_type_AndroidWidgetTextView.setText(getString(2131369388));
    jdField_c_of_type_AndroidWidgetTextView.setContentDescription(getString(2131369388));
    jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    jdField_e_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297323));
    jdField_f_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297081));
    if (jdField_d_of_type_Boolean)
    {
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_f_of_type_AndroidWidgetTextView.setVisibility(4);
      jdField_e_of_type_AndroidWidgetTextView.setVisibility(4);
      jdField_d_of_type_AndroidWidgetTextView.setText(2131367694);
      jdField_d_of_type_AndroidWidgetTextView.setContentDescription("返回，按钮");
      jdField_d_of_type_AndroidWidgetTextView.setOnClickListener(new mkf(this));
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131299227));
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(4);
      jdField_c_of_type_AndroidViewView = findViewById(2131304036);
      jdField_c_of_type_AndroidViewView.setVisibility(4);
      return;
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(4);
      jdField_e_of_type_AndroidWidgetTextView.setVisibility(4);
      jdField_f_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_f_of_type_AndroidWidgetTextView.setText(2131366996);
      jdField_f_of_type_AndroidWidgetTextView.setContentDescription("取消，按钮");
      jdField_f_of_type_AndroidWidgetTextView.setOnClickListener(new mkg(this));
    }
  }
  
  private void f()
  {
    jdField_b_of_type_Boolean = true;
    if (jdField_a_of_type_AndroidViewAnimationAlphaAnimation == null)
    {
      jdField_a_of_type_AndroidViewAnimationAlphaAnimation = new AlphaAnimation(1.0F, 0.2F);
      jdField_a_of_type_AndroidViewAnimationAlphaAnimation.setDuration(400L);
    }
    jdField_a_of_type_AndroidWidgetTextView.setAnimation(jdField_a_of_type_AndroidViewAnimationAlphaAnimation);
    jdField_a_of_type_AndroidWidgetTableLayout.setAnimation(jdField_a_of_type_AndroidViewAnimationAlphaAnimation);
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation.start();
    jdField_a_of_type_AndroidWidgetTableLayout.setVisibility(4);
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_b_of_type_AndroidViewView.setVisibility(0);
    jdField_b_of_type_AndroidViewAnimationTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, 0.0F, -jdField_a_of_type_AndroidWidgetTextView.getBottom());
    jdField_b_of_type_AndroidViewAnimationTranslateAnimation.setAnimationListener(new mki(this));
    jdField_b_of_type_AndroidViewAnimationTranslateAnimation.setDuration(500L);
    jdField_a_of_type_AndroidWidgetLinearLayout.setAnimation(jdField_b_of_type_AndroidViewAnimationTranslateAnimation);
    jdField_a_of_type_AndroidViewAnimationTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, jdField_b_of_type_AndroidWidgetLinearLayout.getHeight(), 0.0F);
    jdField_a_of_type_AndroidViewAnimationTranslateAnimation.setDuration(500L);
    jdField_b_of_type_AndroidWidgetLinearLayout.setAnimation(jdField_a_of_type_AndroidViewAnimationTranslateAnimation);
    jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(0);
    ReportController.b(app, "CliOper", "", "", "0X80041AA", "0X80041AA", 0, 0, jdField_a_of_type_JavaLangStringBuffer.toString(), "", "", "");
  }
  
  private void g()
  {
    if (NetworkUtil.e(this))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getResources().getDimensionPixelSize(2131492908));
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(2131367972);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
      a(0);
      return;
    }
    a(1, getString(2131368515));
  }
  
  String a()
  {
    int i1 = 0;
    jdField_a_of_type_JavaLangStringBuilder.delete(0, jdField_a_of_type_JavaLangStringBuilder.length());
    int i2 = jdField_a_of_type_JavaLangStringBuffer.length();
    if (i2 > 0) {
      while (i1 < i2)
      {
        jdField_a_of_type_JavaLangStringBuilder.append(jdField_a_of_type_JavaLangStringBuffer.charAt(i1));
        if (i1 < i2 - 1) {
          jdField_a_of_type_JavaLangStringBuilder.append(65292);
        }
        i1 += 1;
      }
    }
    return jdField_a_of_type_JavaLangStringBuilder.toString();
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    paramInt2 = jdField_a_of_type_AndroidWidgetGridView.getChildCount();
    paramInt1 = 0;
    while (paramInt1 < paramInt2)
    {
      Object localObject = jdField_a_of_type_AndroidWidgetGridView.getChildAt(paramInt1).getTag();
      if ((localObject != null) && ((localObject instanceof mkn)))
      {
        localObject = (mkn)localObject;
        if (jdField_a_of_type_JavaLangString.equals(paramString)) {
          jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
        }
      }
      paramInt1 += 1;
    }
  }
  
  void a(boolean paramBoolean, String paramString1, String paramString2)
  {
    jdField_d_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_e_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_c_of_type_AndroidWidgetTextView.setText(paramString2);
  }
  
  protected void b()
  {
    ReportController.b(app, "CliOper", "", "", "0X80041AC", "0X80041AC", 0, 0, "", "", "", "");
  }
  
  protected void c()
  {
    ReportController.b(app, "CliOper", "", "", "0X80041AB", "0X80041AB", 0, 0, "", "", "", "");
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    setTheme(2131559121);
    super.doOnCreate(paramBundle);
    setContentView(2130904783);
    jdField_a_of_type_AndroidContentContext = getApplicationContext();
    jdField_d_of_type_Boolean = getIntent().getBooleanExtra("fromFace2FaceActivity", false);
    e();
    app.a(jdField_a_of_type_ComTencentMobileqqAppNearFieldDiscussObserver);
    jdField_b_of_type_Int = Math.abs(new Random().nextInt());
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(this, app);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    jdField_a_of_type_Mkm = new mkm(this);
    jdField_a_of_type_AndroidWidgetGridView = ((GridView)findViewById(2131296583));
    jdField_a_of_type_AndroidWidgetGridView.setAdapter(jdField_a_of_type_Mkm);
    jdField_a_of_type_TencentImNearfield_discussNearfield_discuss$UserProfile = new nearfield_discuss.UserProfile();
    jdField_a_of_type_TencentImNearfield_discussNearfield_discuss$UserProfile.uint64_uin.set(Long.parseLong(app.getAccount()));
    jdField_a_of_type_TencentImNearfield_discussNearfield_discuss$UserProfile.str_nick.set(app.b());
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_AndroidContentBroadcastReceiver = new mkd(this);
    paramBundle = new IntentFilter();
    paramBundle.addAction("android.net.conn.CONNECTIVITY_CHANGE");
    registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, paramBundle);
    a(new mke(this));
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    app.b(jdField_a_of_type_ComTencentMobileqqAppNearFieldDiscussObserver);
    jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    if ((jdField_a_of_type_Boolean) && (NetworkUtil.e(this))) {
      a(3);
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = null;
    }
    try
    {
      unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      return;
    }
    catch (Exception localException) {}
  }
  
  protected boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4) {
      if (jdField_b_of_type_Boolean)
      {
        ReportController.b(app, "CliOper", "", "", "0X80041AE", "0X80041AE", 0, 0, "", "", "", "");
        finish();
        if (jdField_d_of_type_Boolean) {
          overridePendingTransition(2130968587, 2130968588);
        }
      }
    }
    for (;;)
    {
      return super.doOnKeyDown(paramInt, paramKeyEvent);
      ReportController.b(app, "CliOper", "", "", "0X80041A9", "0X80041A9", 0, 0, "", "", "", "");
      break;
      switch (paramInt)
      {
      default: 
        break;
      case 7: 
        n.performClick();
        break;
      case 8: 
        jdField_e_of_type_AndroidWidgetImageView.performClick();
        break;
      case 9: 
        jdField_f_of_type_AndroidWidgetImageView.performClick();
        break;
      case 10: 
        g.performClick();
        break;
      case 11: 
        h.performClick();
        break;
      case 12: 
        i.performClick();
        break;
      case 13: 
        j.performClick();
        break;
      case 14: 
        k.performClick();
        break;
      case 15: 
        l.performClick();
        break;
      case 16: 
        m.performClick();
        break;
      case 67: 
        o.performClick();
      }
    }
  }
  
  protected void doOnPause()
  {
    super.doOnPause();
    if ((jdField_b_of_type_Boolean) && (jdField_a_of_type_AndroidOsHandler.hasMessages(0))) {
      jdField_a_of_type_AndroidOsHandler.removeMessages(0);
    }
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (jdField_b_of_type_Boolean)
    {
      if (jdField_a_of_type_AndroidOsHandler.hasMessages(0)) {
        jdField_a_of_type_AndroidOsHandler.removeMessages(0);
      }
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(0);
    }
  }
  
  protected void doOnStart()
  {
    super.doOnStart();
    getWindow().setSoftInputMode(16);
  }
  
  public void finish()
  {
    super.finish();
    overridePendingTransition(0, 2130968584);
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetButton)
    {
      jdField_a_of_type_Boolean = false;
      g();
      ReportController.b(app, "CliOper", "", "", "0X80041AF", "0X80041AF", 0, 0, String.valueOf(jdField_a_of_type_JavaUtilList.size()), "", "", "");
    }
    int i1;
    do
    {
      return;
      i1 = jdField_a_of_type_JavaLangStringBuffer.length();
    } while (i1 >= 4);
    label180:
    int i2;
    switch (paramView.getId())
    {
    default: 
      jdField_b_of_type_AndroidWidgetTableLayout.setContentDescription(a());
      i2 = jdField_a_of_type_JavaLangStringBuffer.length();
      i1 = -1;
      switch (jdField_a_of_type_JavaLangStringBuffer.charAt(i2 - 1))
      {
      }
      break;
    }
    for (;;)
    {
      switch (i2)
      {
      default: 
        return;
      case 1: 
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(i1);
        return;
        jdField_a_of_type_JavaLangStringBuffer.append('1');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('2');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('3');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('4');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('5');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('6');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('7');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('8');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('9');
        break label180;
        jdField_a_of_type_JavaLangStringBuffer.append('0');
        break label180;
        if ((i1 > 0) && (i1 < 4)) {
          jdField_a_of_type_JavaLangStringBuffer.deleteCharAt(i1 - 1);
        }
        jdField_b_of_type_AndroidWidgetTableLayout.setContentDescription(a());
        switch (i1)
        {
        default: 
          return;
        case 1: 
          jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840467);
          return;
        case 2: 
          jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130840467);
          return;
        case 3: 
          jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130840467);
          return;
        }
        jdField_d_of_type_AndroidWidgetImageView.setImageResource(2130840467);
        return;
        i1 = 2130840457;
        continue;
        i1 = 2130840458;
        continue;
        i1 = 2130840459;
        continue;
        i1 = 2130840460;
        continue;
        i1 = 2130840461;
        continue;
        i1 = 2130840462;
        continue;
        i1 = 2130840463;
        continue;
        i1 = 2130840464;
        continue;
        i1 = 2130840465;
        continue;
        i1 = 2130840466;
      }
    }
    jdField_b_of_type_AndroidWidgetImageView.setImageResource(i1);
    return;
    jdField_c_of_type_AndroidWidgetImageView.setImageResource(i1);
    return;
    jdField_d_of_type_AndroidWidgetImageView.setImageResource(i1);
    jdField_e_of_type_AndroidWidgetImageView.setEnabled(false);
    jdField_f_of_type_AndroidWidgetImageView.setEnabled(false);
    g.setEnabled(false);
    h.setEnabled(false);
    i.setEnabled(false);
    j.setEnabled(false);
    k.setEnabled(false);
    l.setEnabled(false);
    m.setEnabled(false);
    n.setEnabled(false);
    o.setEnabled(false);
    if ((jdField_a_of_type_JavaLangStringBuffer.toString().equals("1234")) || (jdField_a_of_type_JavaLangStringBuffer.toString().equals("1111")) || (jdField_a_of_type_JavaLangStringBuffer.toString().equals("2222")) || (jdField_a_of_type_JavaLangStringBuffer.toString().equals("3333")) || (jdField_a_of_type_JavaLangStringBuffer.toString().equals("0000")))
    {
      if (jdField_a_of_type_AndroidOsHandler.hasMessages(1)) {
        jdField_a_of_type_AndroidOsHandler.removeMessages(1);
      }
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 600L);
      QQToast.a(jdField_a_of_type_AndroidContentContext, getString(2131370966), 0).a();
      ReportController.b(app, "CliOper", "", "", "0X80041AD", "0X80041AD", 0, 0, "", "", "", "");
      return;
    }
    jdField_a_of_type_AndroidViewView.setVisibility(0);
    jdField_a_of_type_AndroidViewView.setBackgroundDrawable(jdField_a_of_type_AndroidGraphicsDrawableDrawable);
    ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).start();
    if (NetworkUtil.e(this))
    {
      jdField_a_of_type_AndroidWidgetTableLayout.setEnabled(false);
      a(1);
      jdField_a_of_type_Boolean = true;
      return;
    }
    a(1, getString(2131368515));
    ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
    jdField_a_of_type_AndroidViewView.setVisibility(4);
    if (jdField_a_of_type_AndroidOsHandler.hasMessages(1)) {
      jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    }
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 600L);
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
