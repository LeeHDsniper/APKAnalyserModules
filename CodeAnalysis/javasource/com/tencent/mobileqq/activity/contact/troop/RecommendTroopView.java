package com.tencent.mobileqq.activity.contact.troop;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Bitmap;
import android.os.Message;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RecommendTroopManagerImp;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.activity.NearbyTroopsActivity;
import com.tencent.mobileqq.troop.activity.NearbyTroopsLocationActivity;
import com.tencent.mobileqq.troop.activity.RecommendTroopAdapter;
import com.tencent.mobileqq.troopinfo.GroupCatalogTool;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollToTopListener;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.SwipListView;
import java.util.List;
import java.util.Observable;
import java.util.Observer;
import ltl;
import ltm;
import lto;
import ltp;

public class RecommendTroopView
  extends BaseTroopView
  implements View.OnClickListener, FaceDecoder.DecodeTaskCompletionListener, SlideDetectListView.OnScrollToTopListener, Observer
{
  public static final String b = "nearby_troop_count";
  public static final String c = "troop_num";
  public static final String d = "troop_wording";
  public static final int e = 100;
  public static final int f = 105;
  public static final int g = 106;
  Button jdField_a_of_type_AndroidWidgetButton;
  LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  public TextView a;
  TroopObserver jdField_a_of_type_ComTencentMobileqqAppTroopObserver;
  protected SosoInterface.OnLocationListener a;
  public RecommendTroopAdapter a;
  protected FaceDecoder a;
  public SwipListView a;
  protected final String a;
  protected int b;
  public RelativeLayout b;
  public int c;
  public boolean c;
  public int d;
  public boolean d;
  public View e;
  protected boolean e;
  public View f;
  protected boolean f;
  protected boolean g;
  
  public RecommendTroopView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "RecommendTroopView";
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener = null;
    jdField_b_of_type_Int = 0;
    jdField_d_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new ltl(this);
    jdField_e_of_type_Boolean = true;
    jdField_f_of_type_Boolean = false;
    jdField_c_of_type_Int = 0;
    jdField_d_of_type_Int = 0;
    jdField_f_of_type_AndroidViewView = null;
    g = false;
  }
  
  private boolean c()
  {
    a(2130903736);
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131299807));
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131299810));
    jdField_a_of_type_ComTencentWidgetSwipListView = ((SwipListView)findViewById(2131299808));
    jdField_f_of_type_AndroidViewView = LayoutInflater.from(a()).inflate(2130903870, null);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_f_of_type_AndroidViewView.findViewById(2131300335));
    jdField_e_of_type_AndroidViewView = jdField_f_of_type_AndroidViewView.findViewById(2131300334);
    jdField_e_of_type_AndroidViewView.setOnClickListener(this);
    jdField_a_of_type_ComTencentWidgetSwipListView.a(jdField_f_of_type_AndroidViewView);
    if (a().getSharedPreferences("nearby_troop_count", 0).getInt("troop_num", 0) != 0)
    {
      String str = a().getSharedPreferences("nearby_troop_count", 0).getString("troop_wording", "");
      jdField_a_of_type_AndroidWidgetTextView.setText(str);
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131299809));
      jdField_a_of_type_ComTencentWidgetSwipListView.setTranscriptMode(0);
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131299812));
      jdField_a_of_type_ComTencentWidgetSwipListView.setDragEnable(true);
      jdField_a_of_type_ComTencentMobileqqTroopActivityRecommendTroopAdapter = new RecommendTroopAdapter(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext, a());
      jdField_a_of_type_ComTencentWidgetSwipListView.setAdapter(jdField_a_of_type_ComTencentMobileqqTroopActivityRecommendTroopAdapter);
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      return true;
      jdField_e_of_type_AndroidViewView.setVisibility(8);
      jdField_f_of_type_AndroidViewView.setPadding(0, 0, 0, 0);
    }
  }
  
  private void m()
  {
    RecommendTroopManagerImp localRecommendTroopManagerImp = (RecommendTroopManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(21);
    if (localRecommendTroopManagerImp != null) {}
    for (List localList = localRecommendTroopManagerImp.b(); ((localList == null) || (localList.size() == 0)) && (localRecommendTroopManagerImp != null) && (localRecommendTroopManagerImp.a() != 1); localList = null)
    {
      localRecommendTroopManagerImp.a(0L, 1);
      return;
    }
    n();
  }
  
  private void n()
  {
    jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener = new ltm(this, 3, true, false, 1800000L, false, false, "RecommendTroopView");
    SosoInterface.a(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener);
  }
  
  private void o()
  {
    if (jdField_b_of_type_Boolean)
    {
      l();
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a(new lto(this));
  }
  
  private void p()
  {
    if (((RecommendTroopManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(21) != null) && (!jdField_b_of_type_Boolean) && (RecommendTroopManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface) > 0))
    {
      a(1, true);
      return;
    }
    a(1, false);
  }
  
  protected int a()
  {
    RecommendTroopManagerImp localRecommendTroopManagerImp = (RecommendTroopManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(21);
    int i = RecommendTroopManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (i > 0)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(AppConstants.aB, 9000, 0 - i);
      localRecommendTroopManagerImp.a();
      p();
    }
    if ((localRecommendTroopManagerImp != null) && (!jdField_b_of_type_Boolean) && (i > 0)) {
      return 1;
    }
    return 0;
  }
  
  public void a() {}
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if ((paramBitmap != null) && (TextUtils.isEmpty(paramString))) {}
  }
  
  protected void a(Intent paramIntent, BaseTroopView.ITroopContext paramITroopContext)
  {
    super.a(paramIntent, paramITroopContext);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    c();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().addObserver(this);
    a(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(RecommendTroopView.class, jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a());
  }
  
  public void a(AbsListView paramAbsListView, int paramInt) {}
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public boolean a(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return true;
      l();
      a();
      continue;
      jdField_a_of_type_ComTencentWidgetSwipListView.setEmptyView(jdField_b_of_type_AndroidWidgetRelativeLayout);
      continue;
      int i = arg1;
      if (!a().isFinishing()) {
        if ((i != 0) && (jdField_a_of_type_ComTencentMobileqqTroopActivityRecommendTroopAdapter.getCount() != 0))
        {
          paramMessage = (String)obj;
          jdField_a_of_type_AndroidWidgetTextView.setText(paramMessage);
          jdField_f_of_type_AndroidViewView.setVisibility(0);
          jdField_f_of_type_AndroidViewView.setPadding(0, (int)DisplayUtils.a(getContext(), 10.0F), 0, 0);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_recom", "", "recom", "exp_nearby", 0, 0, "", "", "", "");
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
          jdField_e_of_type_AndroidViewView.setVisibility(0);
          SharedPreferences localSharedPreferences = a().getSharedPreferences("nearby_troop_count", 0);
          localSharedPreferences.edit().putString("troop_wording", paramMessage);
          localSharedPreferences.edit().putInt("troop_num", i);
          localSharedPreferences.edit().commit();
        }
        else
        {
          jdField_e_of_type_AndroidViewView.setVisibility(8);
          jdField_f_of_type_AndroidViewView.setPadding(0, 0, 0, 0);
        }
      }
    }
  }
  
  public void b()
  {
    super.b();
    if (QLog.isDevelopLevel()) {
      QLog.d("RecommendTroopView", 4, "onChecked........");
    }
    if (jdField_e_of_type_Boolean)
    {
      jdField_e_of_type_Boolean = false;
      l();
      m();
    }
    int i = a();
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp_recommend", "Clk_grp_recom", 0, 0, "", i + "", "", "");
    k();
  }
  
  protected void e()
  {
    super.e();
    l();
  }
  
  protected void g()
  {
    super.g();
    RecommendTroopManagerImp localRecommendTroopManagerImp = (RecommendTroopManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(21);
    if (localRecommendTroopManagerImp != null) {
      localRecommendTroopManagerImp.a();
    }
  }
  
  protected void h()
  {
    b(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().deleteObserver(this);
    GroupCatalogTool.a(a()).a();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(getClass());
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
    }
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener != null) {
      SosoInterface.b(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener);
    }
  }
  
  public void k()
  {
    if ((jdField_d_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqTroopActivityRecommendTroopAdapter.a()))
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("RecommendTroopView", 4, "reportPv");
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_recom", "", "msg_page", "exp", 0, 0, "", "", "", "");
    }
  }
  
  public void l()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("RecommendTroopView", 4, "refreshRecommendTroopList");
    }
    if (g) {
      return;
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("RecommendTroopView", 4, "refreshRecommendTroopList start ");
    }
    g = true;
    Object localObject = (RecommendTroopManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(21);
    if (localObject != null) {}
    for (localObject = ((RecommendTroopManagerImp)localObject).b();; localObject = null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a(new ltp(this, (List)localObject));
      g = false;
      return;
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131299812: 
      paramView = new Intent(a(), NearbyTroopsActivity.class);
      paramView.putExtra("lat", 0);
      paramView.putExtra("lon", 0);
      paramView.putExtra("mode", 0);
      paramView.putExtra("from", 25);
      paramView.putExtra("TAB_INDEX", 2);
      NearbyTroopsLocationActivity.a(a(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView);
      ReportController.b(null, "P_CliOper", "Grp_recom", "", "msg_page", "Clk_nearby", 0, 0, "", "", "", "");
      return;
    }
    NearbyTroopsActivity.a(getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0", 25, 0, null, jdField_c_of_type_Int, jdField_d_of_type_Int);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_recom", "", "recom", "Clk_nearby", 0, 0, "", "", "", "");
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    paramObservable = String.valueOf(AppConstants.aB);
    if ((paramObject instanceof MessageRecord))
    {
      paramObject = (MessageRecord)paramObject;
      if ((paramObservable.equals(frienduin)) && ((msgtype == 64497) || (msgtype == 64496))) {
        o();
      }
    }
    while ((!(paramObject instanceof RecentUser)) || (!paramObservable.equals(uin))) {
      return;
    }
    o();
  }
}
