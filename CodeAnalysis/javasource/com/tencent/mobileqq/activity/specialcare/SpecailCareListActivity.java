package com.tencent.mobileqq.activity.specialcare;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.text.SpannableString;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.Window;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.ForwardFriendListActivity;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGrid;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGrid.GridCallBack;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.ActivateFriendItem;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.SpecialCareInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.mobileqq.richstatus.StatusManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.OverScrollViewListener;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mqm;
import mqn;
import mqo;
import mqp;
import mqq;
import mqr;
import mqs;
import mqt;
import mqu;
import mqv;
import mqw;
import mqx;
import mqz;
import mra;
import mrb;
import mrc;
import mrd;
import mre;
import mrf;
import mrg;
import tencent.im.oidb.cmd0x7df.oidb_0x7df.FriendScore;

public class SpecailCareListActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener, ActivateFriendGrid.GridCallBack, FaceDecoder.DecodeTaskCompletionListener, AbsListView.OnScrollListener
{
  static final int jdField_a_of_type_Int = 300;
  static final long jdField_a_of_type_Long = 500L;
  static final String jdField_a_of_type_JavaLangString = "SpecailCareListActivity";
  static final int jdField_b_of_type_Int = 2000;
  static final long jdField_b_of_type_Long = 1000L;
  static final String jdField_b_of_type_JavaLangString = "管理";
  static final int jdField_c_of_type_Int = 2001;
  static final String jdField_c_of_type_JavaLangString = "完成";
  static final int d = 2002;
  static final int e = 1;
  static final int f = 2;
  Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  public Handler a;
  public View a;
  Button jdField_a_of_type_AndroidWidgetButton;
  public LinearLayout a;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  public ActivateFriendGrid a;
  public FriendListHandler a;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  StatusManager jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager;
  public FaceDecoder a;
  public PullRefreshHeader a;
  public QQProgressDialog a;
  OverScrollViewListener jdField_a_of_type_ComTencentWidgetOverScrollViewListener;
  public XListView a;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  public mrf a;
  mrg jdField_a_of_type_Mrg;
  public boolean a;
  private String[] jdField_a_of_type_ArrayOfJavaLangString;
  View jdField_b_of_type_AndroidViewView;
  public ArrayList b;
  public boolean b;
  public View c;
  public boolean c;
  public int g;
  int h;
  int i;
  public int j;
  
  public SpecailCareListActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_b_of_type_JavaUtilArrayList = new ArrayList();
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new mqm(this);
    jdField_a_of_type_ComTencentWidgetOverScrollViewListener = new mqv(this);
    jdField_a_of_type_Mrg = new mrg(this, null);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new mqw(this);
    j = 0;
  }
  
  public SpannableString a(Friends paramFriends, SpecailCareListActivity.ViewHolder paramViewHolder)
  {
    int n = 1;
    int i1 = 0;
    Object localObject1 = (StatusManager)app.getManager(14);
    Object localObject2 = (FriendsManager)app.getManager(50);
    if ((localObject1 == null) || (localObject2 == null)) {
      return null;
    }
    localObject1 = ((FriendsManager)localObject2).a(uin);
    int k;
    boolean bool;
    if ((localObject1 != null) && (!TextUtils.isEmpty(feedContent)))
    {
      k = 1;
      if (localObject1 == null) {
        break label376;
      }
      if (j == 0) {
        break label220;
      }
      bool = true;
    }
    label90:
    label112:
    label127:
    label220:
    label232:
    label238:
    label244:
    label376:
    for (paramFriends = ((ExtensionInfo)localObject1).getRichStatus(bool);; paramFriends = null)
    {
      int m;
      if ((paramFriends != null) && (!paramFriends.a()))
      {
        m = 1;
        if ((m == 0) || (TextUtils.isEmpty(c))) {
          break label232;
        }
        if ((k == 0) || ((feedTime <= richTime) && (m != 0))) {
          break label244;
        }
        paramFriends = new SpannableString(feedContent);
        jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
        e.setVisibility(0);
        localObject2 = f;
        if (!feedHasPhoto) {
          break label238;
        }
      }
      for (k = i1;; k = 8)
      {
        ((ImageView)localObject2).setVisibility(k);
        jdField_b_of_type_AndroidWidgetTextView.setText(paramFriends);
        return paramFriends;
        k = 0;
        break;
        bool = false;
        break label90;
        m = 0;
        break label112;
        n = 0;
        break label127;
      }
      if (n != 0)
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.a(d, 200);
        localObject1 = new BitmapDrawable(getResources(), (Bitmap)localObject1);
        k = h;
        ((Drawable)localObject1).setBounds(0, 0, Math.round(((Drawable)localObject1).getIntrinsicWidth() * 1.0F / ((Drawable)localObject1).getIntrinsicHeight() * k), k);
        jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawables((Drawable)localObject1, null, null, null);
      }
      for (;;)
      {
        paramFriends = paramFriends.a(null);
        e.setVisibility(8);
        f.setVisibility(8);
        break;
        if (m == 0)
        {
          paramFriends = RichStatus.a();
          jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
        }
      }
    }
  }
  
  public void a()
  {
    long l1 = System.currentTimeMillis();
    jdField_b_of_type_JavaUtilArrayList.clear();
    List localList = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.b();
    if ((localList == null) || (localList.size() <= 0))
    {
      b();
      leftView.setVisibility(0);
      jdField_c_of_type_Boolean = false;
      rightViewText.setVisibility(4);
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      if (QLog.isColorLevel()) {
        QLog.d("SpecailCareListActivity", 2, "getSpecailCareInfos: empty...");
      }
    }
    for (;;)
    {
      long l2 = System.currentTimeMillis();
      if (QLog.isColorLevel()) {
        QLog.d("SpecailCareListActivity", 2, "refreshSpecialCareData cost time = " + (l2 - l1));
      }
      return;
      rightViewText.setVisibility(0);
      if (jdField_c_of_type_Boolean)
      {
        rightViewText.setText("完成");
        jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("SpecailCareListActivity", 2, "getSpecailCareInfos return size:" + localList.size());
        }
        int k = 0;
        while (k < localList.size())
        {
          Object localObject = (SpecialCareInfo)localList.get(k);
          localObject = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.a(uin);
          if (localObject != null) {
            jdField_b_of_type_JavaUtilArrayList.add(localObject);
          }
          k += 1;
        }
        rightViewText.setText("管理");
        jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      }
      ThreadManager.a(new mqx(this), 8, null, true);
    }
  }
  
  public void a(int paramInt)
  {
    if (paramInt > 0)
    {
      jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
      return;
    }
    jdField_a_of_type_AndroidWidgetButton.setEnabled(false);
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "uin=" + paramString + ", type=" + paramInt2 + ",avatar= " + paramBitmap);
    }
    if ((paramBitmap == null) || (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())) {}
    for (;;)
    {
      return;
      if (j != 0)
      {
        jdField_b_of_type_Boolean = true;
        return;
      }
      paramInt2 = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
      paramInt1 = 0;
      while (paramInt1 < paramInt2)
      {
        Object localObject = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(paramInt1);
        if (localObject != null)
        {
          localObject = (SpecailCareListActivity.ViewHolder)((View)localObject).getTag();
          if ((localObject != null) && (!TextUtils.isEmpty(paramString)) && (paramString.equals(jdField_a_of_type_ComTencentMobileqqDataFriends.uin)))
          {
            jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(new BitmapDrawable(paramBitmap));
            return;
          }
        }
        paramInt1 += 1;
      }
    }
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    getPreferences(0).edit().putBoolean("enterSpecailCare" + app.a() + "_" + paramInt, paramBoolean).commit();
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    j = paramInt;
    if ((jdField_b_of_type_Boolean) && (paramInt == 0))
    {
      jdField_a_of_type_Mrf.notifyDataSetChanged();
      jdField_b_of_type_Boolean = false;
    }
    for (;;)
    {
      return;
      if (paramInt == 0)
      {
        int k = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
        paramInt = 0;
        while (paramInt < k)
        {
          paramAbsListView = (SpecailCareListActivity.ViewHolder)jdField_a_of_type_ComTencentWidgetXListView.getChildAt(paramInt).getTag();
          if ((paramAbsListView != null) && (jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_JavaLangString.length() > 0)) {
            a(jdField_a_of_type_ComTencentMobileqqDataFriends, paramAbsListView);
          }
          paramInt += 1;
        }
      }
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((jdField_b_of_type_JavaUtilArrayList.size() <= 0) || (paramAbsListView == null)) {
      return;
    }
    if (jdField_c_of_type_Boolean)
    {
      jdField_a_of_type_AndroidViewView.setVisibility(8);
      return;
    }
    int k = jdField_a_of_type_AndroidWidgetLinearLayout.getBottom();
    int m = paramAbsListView.getBottom();
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "onScroll.firstVisibleItem=" + paramInt1 + ", visibleItemCount=" + paramInt2 + ",totalItemCount=" + paramInt3 + ",addBtnBottom=" + k + ",listviewBottom=" + m + ",mBottomBtnBottomMargin=" + i);
    }
    if (paramInt1 + paramInt2 == paramInt3)
    {
      if ((k > i) && (m >= k - i))
      {
        jdField_a_of_type_AndroidViewView.setVisibility(8);
        return;
      }
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      return;
    }
    jdField_a_of_type_AndroidViewView.setVisibility(0);
  }
  
  public boolean a(int paramInt)
  {
    boolean bool = false;
    if (!getPreferences(0).getBoolean("enterSpecailCare" + app.a() + "_" + paramInt, false)) {
      bool = true;
    }
    return bool;
  }
  
  void b()
  {
    if ((jdField_a_of_type_Mrf != null) && (jdField_a_of_type_Mrf.a() != null)) {
      return;
    }
    if (((FriendsManager)app.getManager(50)).c() > 0) {
      ReportController.b(app, "CliOper", "", "", "0X80050E0", "0X80050E0", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      View localView = getLayoutInflater().inflate(2130904288, null);
      if (jdField_a_of_type_Mrf == null) {
        break;
      }
      jdField_a_of_type_Mrf.a(localView);
      return;
      ReportController.b(app, "CliOper", "", "", "0X80050DF", "0X80050DF", 0, 0, "", "", "", "");
    }
  }
  
  void c()
  {
    if (jdField_c_of_type_AndroidViewView != null) {
      return;
    }
    ReportController.b(app, "CliOper", "", "", "0X80050DA", "0X80050DA", 0, 0, "", "", "", "");
    jdField_c_of_type_AndroidViewView = LayoutInflater.from(this).inflate(2130904291, null);
    Object localObject1 = new FrameLayout.LayoutParams(-1, -1);
    ((FrameLayout.LayoutParams)localObject1).setMargins(0, AIOUtils.a(75.0F, getResources()), 0, 0);
    jdField_c_of_type_AndroidViewView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
    jdField_c_of_type_AndroidViewView.setOnClickListener(new mqz(this));
    jdField_a_of_type_AndroidWidgetButton = ((Button)jdField_c_of_type_AndroidViewView.findViewById(2131302147));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid = ((ActivateFriendGrid)jdField_c_of_type_AndroidViewView.findViewById(2131296583));
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setGridCallBack(this);
    localObject1 = new ArrayList();
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    int k = 0;
    while (localIterator.hasNext())
    {
      Object localObject2 = (mre)localIterator.next();
      if ((jdField_a_of_type_ComTencentMobileqqAppFriendsManager != null) && (!jdField_a_of_type_ComTencentMobileqqAppFriendsManager.b(jdField_a_of_type_JavaLangString)))
      {
        if (QLog.isColorLevel()) {
          QLog.d("SpecialCare", 2, jdField_a_of_type_JavaLangString + " is not friend.. ");
        }
      }
      else
      {
        localObject2 = new ActivateFriendItem(1, Long.valueOf(jdField_a_of_type_JavaLangString).longValue(), b);
        if (k >= 6) {
          break label423;
        }
        ((ArrayList)localObject1).add(localObject2);
        k += 1;
      }
    }
    label403:
    label423:
    for (;;)
    {
      break;
      ReportController.b(app, "CliOper", "", "", "0X80050DC", "0X80050DC", 0, 0, String.valueOf(k), "", "", "");
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setData(app, (ArrayList)localObject1);
      if (jdField_c_of_type_AndroidViewView.getParent() == null)
      {
        if (Build.VERSION.SDK_INT >= 14) {
          break label403;
        }
        ((ViewGroup)jdField_a_of_type_AndroidWidgetRelativeLayout.getParent().getParent()).addView(jdField_c_of_type_AndroidViewView);
      }
      for (;;)
      {
        setRightButton(2131371498, this);
        return;
        ((FrameLayout)getWindow().getDecorView()).addView(jdField_c_of_type_AndroidViewView);
      }
    }
  }
  
  public void d()
  {
    if ((jdField_c_of_type_AndroidViewView != null) && (jdField_c_of_type_AndroidViewView.getParent() != null))
    {
      if (Build.VERSION.SDK_INT >= 14) {
        break label80;
      }
      ((ViewGroup)jdField_a_of_type_AndroidWidgetRelativeLayout.getParent().getParent()).removeView(jdField_c_of_type_AndroidViewView);
      jdField_c_of_type_AndroidViewView = null;
      if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.a();
        jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid = null;
      }
    }
    for (;;)
    {
      rightViewText.setVisibility(4);
      return;
      label80:
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(1, 0.0F, 1, 0.0F, 1, 0.0F, 2, -1.0F);
      localTranslateAnimation.setInterpolator(new AccelerateInterpolator());
      localTranslateAnimation.setDuration(500L);
      localTranslateAnimation.setFillAfter(true);
      localTranslateAnimation.setAnimationListener(new mra(this));
      jdField_c_of_type_AndroidViewView.startAnimation(localTranslateAnimation);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    long l1 = System.currentTimeMillis();
    super.doOnCreate(paramBundle);
    setContentView(2130904290);
    super.setTitle(2131370655);
    super.setRightButton(2131367083, this);
    app.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    g = ((int)DisplayUtils.a(this, 9.0F));
    h = ((int)DisplayUtils.a(this, 12.0F));
    i = ((int)DisplayUtils.a(this, 20.0F));
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)super.findViewById(2131297957));
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)super.findViewById(2131297844));
    jdField_a_of_type_AndroidViewView = super.findViewById(2131302145);
    jdField_a_of_type_AndroidViewView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)getLayoutInflater().inflate(2130904287, null));
    jdField_a_of_type_AndroidWidgetLinearLayout.setOnClickListener(this);
    jdField_a_of_type_ComTencentWidgetXListView.b(jdField_a_of_type_AndroidWidgetLinearLayout);
    jdField_a_of_type_Mrf = new mrf(this);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Mrf);
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)getLayoutInflater().inflate(2130903697, jdField_a_of_type_ComTencentWidgetXListView, false));
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeight(getResources().getDimensionPixelSize(2131492895));
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollListener(jdField_a_of_type_ComTencentWidgetOverScrollViewListener);
    jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(this);
    jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(2130837739);
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130840260);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(this, app);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    jdField_a_of_type_ComTencentMobileqqAppFriendListHandler = ((FriendListHandler)app.a(1));
    jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)app.getManager(50));
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager = ((StatusManager)app.getManager(14));
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.a(jdField_a_of_type_Mrg);
    a();
    if ((jdField_b_of_type_JavaUtilArrayList.size() <= 0) && (a(1)))
    {
      jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a(true);
      FriendListHandler.bQ = 2;
      paramBundle = jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a();
      if ((paramBundle == null) || (paramBundle.size() <= 0)) {
        break label701;
      }
      if (QLog.isColorLevel()) {
        QLog.d("SpecailCareListActivity", 2, "fh.getRecommendList() return size:" + paramBundle.size());
      }
      jdField_a_of_type_JavaUtilArrayList.clear();
      paramBundle = paramBundle.iterator();
      while (paramBundle.hasNext())
      {
        oidb_0x7df.FriendScore localFriendScore = (oidb_0x7df.FriendScore)paramBundle.next();
        mre localMre = new mre();
        jdField_a_of_type_JavaLangString = String.valueOf(uint64_friend_uin.get());
        Friends localFriends = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.a(jdField_a_of_type_JavaLangString);
        if (localFriends != null) {
          b = ContactUtils.a(localFriends);
        }
        if ((TextUtils.isEmpty(b)) && (bytes_nick != null) && (bytes_nick.get() != null)) {
          b = bytes_nick.get().toStringUtf8();
        }
        jdField_a_of_type_JavaUtilArrayList.add(localMre);
      }
      c();
    }
    for (;;)
    {
      a(1, true);
      a(2, true);
      long l2 = System.currentTimeMillis();
      if (QLog.isColorLevel()) {
        QLog.d("SpecailCareListActivity", 2, "doOnCreate cost time = " + (l2 - l1));
      }
      if (AppSetting.i)
      {
        leftView.setContentDescription(leftView.getText() + " 返回按钮");
        jdField_a_of_type_AndroidViewView.setContentDescription("添加特别关心 按钮");
      }
      return true;
      label701:
      if (QLog.isColorLevel()) {
        QLog.d("SpecailCareListActivity", 2, "fh.getRecommendList(): empty...");
      }
    }
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
    }
    app.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.b(jdField_a_of_type_Mrg);
    h();
    if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.a();
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid = null;
    }
  }
  
  public void e()
  {
    if (jdField_b_of_type_AndroidViewView != null) {}
    FrameLayout localFrameLayout;
    do
    {
      do
      {
        return;
      } while (jdField_c_of_type_AndroidViewView != null);
      ReportController.b(app, "CliOper", "", "", "0X80050DB", "0X80050DB", 0, 0, "", "", "", "");
      localFrameLayout = (FrameLayout)getWindow().getDecorView();
      jdField_b_of_type_AndroidViewView = LayoutInflater.from(this).inflate(2130904289, null);
      Button localButton = (Button)jdField_b_of_type_AndroidViewView.findViewById(2131302144);
      jdField_b_of_type_AndroidViewView.findViewById(2131302141).setOnClickListener(this);
      localButton.setOnClickListener(this);
    } while (jdField_b_of_type_AndroidViewView.getParent() != null);
    localFrameLayout.addView(jdField_b_of_type_AndroidViewView);
  }
  
  void f()
  {
    if ((jdField_b_of_type_AndroidViewView != null) && (jdField_b_of_type_AndroidViewView.getParent() != null))
    {
      ((FrameLayout)getWindow().getDecorView()).removeView(jdField_b_of_type_AndroidViewView);
      jdField_b_of_type_AndroidViewView = null;
    }
  }
  
  void g()
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.a(getTitleBarHeight());
    }
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(2131367105);
    if (!jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing()) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
    }
  }
  
  public void h()
  {
    if ((jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) && (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing()))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = null;
    }
  }
  
  void i()
  {
    rightViewText.setClickable(false);
    int m = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    Object localObject1 = rightViewText.getText().toString();
    if ("管理".equals(localObject1))
    {
      if (jdField_a_of_type_AndroidViewView.getVisibility() == 0)
      {
        localObject1 = new AlphaAnimation(1.0F, 0.0F);
        ((AlphaAnimation)localObject1).setDuration(300L);
        ((AlphaAnimation)localObject1).setAnimationListener(new mrb(this));
        jdField_a_of_type_AndroidViewView.startAnimation((Animation)localObject1);
      }
      int k = 0;
      while (k < m)
      {
        localObject1 = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(k).getTag();
        if ((localObject1 != null) && ((localObject1 instanceof SpecailCareListActivity.ViewHolder)))
        {
          localObject1 = (SpecailCareListActivity.ViewHolder)localObject1;
          Object localObject2 = new TranslateAnimation(-(mDensity * 34.0F), 0.0F, 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          Object localObject3 = new AlphaAnimation(0.0F, 1.0F);
          ((AlphaAnimation)localObject3).setStartOffset(120L);
          ((AlphaAnimation)localObject3).setDuration(180L);
          AnimationSet localAnimationSet = new AnimationSet(true);
          localAnimationSet.addAnimation((Animation)localObject2);
          localAnimationSet.addAnimation((Animation)localObject3);
          c.setVisibility(0);
          ((TranslateAnimation)localObject2).setAnimationListener(new mrc(this, (SpecailCareListActivity.ViewHolder)localObject1));
          c.startAnimation(localAnimationSet);
          localObject2 = new TranslateAnimation(0.0F, mDensity * 34.0F, 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          ((TranslateAnimation)localObject2).setAnimationListener(new mrd(this, (SpecailCareListActivity.ViewHolder)localObject1));
          jdField_a_of_type_AndroidWidgetImageView.startAnimation((Animation)localObject2);
          localObject2 = new TranslateAnimation(0.0F, mDensity * 34.0F, 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          localObject3 = new TranslateAnimation(0.0F, 0.0F, 0.0F, 12.0F * mDensity);
          ((TranslateAnimation)localObject3).setDuration(300L);
          localAnimationSet = new AnimationSet(true);
          localAnimationSet.addAnimation((Animation)localObject2);
          localAnimationSet.addAnimation((Animation)localObject3);
          localAnimationSet.setFillAfter(true);
          localAnimationSet.setAnimationListener(new mqn(this, (SpecailCareListActivity.ViewHolder)localObject1));
          jdField_a_of_type_AndroidWidgetTextView.startAnimation(localAnimationSet);
          localObject2 = new TranslateAnimation(0.0F, mDensity * 34.0F, 0.0F, -12.0F * mDensity);
          ((TranslateAnimation)localObject2).setDuration(300L);
          localObject3 = new AlphaAnimation(1.0F, 0.0F);
          ((AlphaAnimation)localObject3).setDuration(300L);
          localAnimationSet = new AnimationSet(true);
          localAnimationSet.addAnimation((Animation)localObject2);
          localAnimationSet.addAnimation((Animation)localObject3);
          localAnimationSet.setAnimationListener(new mqo(this, (SpecailCareListActivity.ViewHolder)localObject1));
          jdField_a_of_type_AndroidViewView.startAnimation(localAnimationSet);
          localObject2 = new TranslateAnimation(0.0F, 28.0F * mDensity, 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          localObject3 = new AlphaAnimation(1.0F, 0.0F);
          ((AlphaAnimation)localObject3).setDuration(240L);
          localAnimationSet = new AnimationSet(true);
          localAnimationSet.addAnimation((Animation)localObject2);
          localAnimationSet.addAnimation((Animation)localObject3);
          localAnimationSet.setFillAfter(true);
          jdField_b_of_type_AndroidWidgetImageView.startAnimation(localAnimationSet);
          localObject2 = new AlphaAnimation(0.0F, 1.0F);
          ((AlphaAnimation)localObject2).setDuration(300L);
          ((AlphaAnimation)localObject2).setFillAfter(true);
          d.setVisibility(0);
          d.startAnimation((Animation)localObject2);
        }
        if (k == m - 2)
        {
          localObject1 = new AlphaAnimation(1.0F, 0.0F);
          ((AlphaAnimation)localObject1).setDuration(300L);
          ((AlphaAnimation)localObject1).setAnimationListener(new mqp(this));
          leftView.startAnimation((Animation)localObject1);
          jdField_a_of_type_AndroidWidgetLinearLayout.startAnimation((Animation)localObject1);
        }
        k += 1;
      }
    }
    if ("完成".equals(localObject1)) {
      j();
    }
  }
  
  void j()
  {
    int k = jdField_a_of_type_ComTencentWidgetXListView.t();
    int m = jdField_a_of_type_AndroidWidgetLinearLayout.getBottom();
    int n = jdField_a_of_type_ComTencentWidgetXListView.getBottom();
    if (k == jdField_a_of_type_ComTencentWidgetXListView.c_() - 1) {
      if ((m > i) && (n >= m - i)) {
        jdField_a_of_type_AndroidViewView.setVisibility(8);
      }
    }
    for (;;)
    {
      m = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
      k = 0;
      while (k < m)
      {
        Object localObject1 = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(k).getTag();
        if ((localObject1 != null) && ((localObject1 instanceof SpecailCareListActivity.ViewHolder)))
        {
          localObject1 = (SpecailCareListActivity.ViewHolder)localObject1;
          Object localObject2 = new TranslateAnimation(0.0F, -(34.0F * mDensity), 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          Object localObject3 = new AlphaAnimation(1.0F, 0.0F);
          ((AlphaAnimation)localObject3).setDuration(180L);
          Object localObject4 = new AnimationSet(true);
          ((AnimationSet)localObject4).addAnimation((Animation)localObject2);
          ((AnimationSet)localObject4).addAnimation((Animation)localObject3);
          ((TranslateAnimation)localObject2).setAnimationListener(new mqq(this, (SpecailCareListActivity.ViewHolder)localObject1));
          c.startAnimation((Animation)localObject4);
          localObject2 = new TranslateAnimation(0.0F, -(34.0F * mDensity), 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          ((TranslateAnimation)localObject2).setAnimationListener(new mqr(this, (SpecailCareListActivity.ViewHolder)localObject1));
          jdField_a_of_type_AndroidWidgetImageView.startAnimation((Animation)localObject2);
          localObject2 = new TranslateAnimation(0.0F, -34.0F * mDensity, 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          localObject3 = new TranslateAnimation(0.0F, 0.0F, 0.0F, -12.0F * mDensity);
          ((TranslateAnimation)localObject3).setDuration(300L);
          localObject4 = new AnimationSet(true);
          ((AnimationSet)localObject4).addAnimation((Animation)localObject2);
          ((AnimationSet)localObject4).addAnimation((Animation)localObject3);
          ((AnimationSet)localObject4).setFillAfter(true);
          ((AnimationSet)localObject4).setAnimationListener(new mqs(this, (SpecailCareListActivity.ViewHolder)localObject1));
          jdField_a_of_type_AndroidWidgetTextView.startAnimation((Animation)localObject4);
          localObject2 = new TranslateAnimation(0.0F, -34.0F * mDensity, 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          localObject3 = new TranslateAnimation(0.0F, 0.0F, 0.0F, 12.0F * mDensity);
          ((TranslateAnimation)localObject3).setDuration(300L);
          localObject4 = new AlphaAnimation(0.0F, 1.0F);
          ((AlphaAnimation)localObject4).setDuration(300L);
          AnimationSet localAnimationSet = new AnimationSet(true);
          localAnimationSet.addAnimation((Animation)localObject2);
          localAnimationSet.addAnimation((Animation)localObject3);
          localAnimationSet.addAnimation((Animation)localObject4);
          localAnimationSet.setFillAfter(true);
          localAnimationSet.setAnimationListener(new mqt(this, (SpecailCareListActivity.ViewHolder)localObject1));
          jdField_a_of_type_AndroidViewView.startAnimation(localAnimationSet);
          localObject2 = new TranslateAnimation(24.0F * mDensity, 0.0F, 0.0F, 0.0F);
          ((TranslateAnimation)localObject2).setDuration(300L);
          ((TranslateAnimation)localObject2).setFillAfter(true);
          localObject3 = new AlphaAnimation(0.0F, 1.0F);
          ((AlphaAnimation)localObject3).setStartOffset(60L);
          ((AlphaAnimation)localObject3).setDuration(240L);
          localObject4 = new AnimationSet(true);
          ((AnimationSet)localObject4).addAnimation((Animation)localObject2);
          ((AnimationSet)localObject4).addAnimation((Animation)localObject3);
          ((AnimationSet)localObject4).setFillAfter(true);
          jdField_b_of_type_AndroidWidgetImageView.startAnimation((Animation)localObject4);
          localObject2 = new AlphaAnimation(1.0F, 0.0F);
          ((AlphaAnimation)localObject2).setDuration(300L);
          ((AlphaAnimation)localObject2).setFillAfter(true);
          d.startAnimation((Animation)localObject2);
        }
        if (k == m - 2)
        {
          localObject1 = new AlphaAnimation(0.0F, 1.0F);
          ((AlphaAnimation)localObject1).setDuration(300L);
          ((AlphaAnimation)localObject1).setAnimationListener(new mqu(this));
          leftView.startAnimation((Animation)localObject1);
          jdField_a_of_type_AndroidWidgetLinearLayout.startAnimation((Animation)localObject1);
        }
        k += 1;
      }
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      continue;
      jdField_a_of_type_AndroidViewView.setVisibility(0);
    }
  }
  
  protected boolean onBackEvent()
  {
    if (jdField_c_of_type_Boolean)
    {
      jdField_c_of_type_Boolean = false;
      j();
      return true;
    }
    return super.onBackEvent();
  }
  
  public void onClick(View paramView)
  {
    if (((paramView instanceof ImageView)) && (paramView.getTag() != null) && ((paramView.getTag() instanceof String)))
    {
      paramView = (String)paramView.getTag();
      if (!StringUtil.b(paramView))
      {
        ReportController.b(app, "CliOper", "", "", "0X80050E1", "0X80050E1", 0, 0, "", "", "", "");
        if (!NetworkUtil.e(this)) {
          break label134;
        }
        localObject = (FriendListHandler)app.a(1);
        jdField_a_of_type_ArrayOfJavaLangString = new String[] { paramView };
        ((FriendListHandler)localObject).a(1, jdField_a_of_type_ArrayOfJavaLangString, new boolean[] { false });
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(2002);
      }
    }
    label134:
    do
    {
      return;
      QQToast.a(this, getString(2131366990), 0).b(getTitleBarHeight());
      return;
      switch (paramView.getId())
      {
      case 2131302141: 
      default: 
        paramView = paramView.getTag();
        if ((paramView != null) && ((paramView instanceof SpecailCareListActivity.ViewHolder))) {
          break;
        }
        ReportController.b(app, "CliOper", "", "", "0X80050D9", "0X80050D9", 0, 0, "", "", "", "");
        paramView = new Intent(this, ForwardFriendListActivity.class);
        paramView.putExtra("extra_choose_friend", 1);
        paramView.putExtra("extra_add_special_friend", 2);
        startActivity(paramView);
        overridePendingTransition(2130968585, 2130968583);
        return;
      case 2131297081: 
        if (jdField_c_of_type_AndroidViewView != null)
        {
          d();
          ReportController.b(app, "CliOper", "", "", "0X80050DE", "0X80050DE", 0, 0, "", "", "", "");
          return;
        }
        i();
        return;
      case 2131302147: 
        if (NetworkUtil.e(this)) {
          break label402;
        }
        QQToast.a(this, getString(2131366990), 0).b(getTitleBarHeight());
      }
    } while (!QLog.isColorLevel());
    QLog.i("SpecailCareListActivity", 2, "No Network!");
    return;
    label402:
    paramView = jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.a();
    Object localObject = new boolean[paramView.length];
    String[] arrayOfString = new String[paramView.length];
    jdField_a_of_type_ArrayOfJavaLangString = new String[arrayOfString.length];
    int k = 0;
    while (k < paramView.length)
    {
      localObject[k] = 1;
      arrayOfString[k] = String.valueOf(paramView[k]);
      jdField_a_of_type_ArrayOfJavaLangString[k] = arrayOfString[k];
      k += 1;
    }
    g();
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "setSpecialCareSwitch  start...");
    }
    jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a(1, arrayOfString, (boolean[])localObject);
    ReportController.b(app, "CliOper", "", "", "0X80050DD", "0X80050DD", 0, 0, String.valueOf(paramView.length), "", "", "");
    return;
    f();
    return;
    ReportController.b(app, "CliOper", "", "", "0X80050D9", "0X80050D9", 0, 0, "", "", "", "");
    paramView = new Intent(this, ForwardFriendListActivity.class);
    paramView.putExtra("extra_choose_friend", 1);
    paramView.putExtra("extra_add_special_friend", 2);
    startActivity(paramView);
    overridePendingTransition(2130968585, 2130968583);
    return;
    paramView = (SpecailCareListActivity.ViewHolder)paramView;
    localObject = jdField_a_of_type_ComTencentMobileqqDataFriends;
    if (jdField_c_of_type_Boolean)
    {
      localObject = new Intent(this, QQSpecialFriendSettingActivity.class);
      ((Intent)localObject).putExtra("key_friend_uin", jdField_a_of_type_JavaLangString);
      ((Intent)localObject).putExtra("key_is_from_management_activity", true);
      startActivity((Intent)localObject);
      return;
    }
    paramView = new ProfileActivity.AllInOne(uin, 1);
    g = 59;
    i = 3;
    ProfileActivity.b(getActivity(), paramView);
  }
}
