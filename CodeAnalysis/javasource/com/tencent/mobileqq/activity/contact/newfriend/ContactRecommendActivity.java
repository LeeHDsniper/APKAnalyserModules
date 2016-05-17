package com.tencent.mobileqq.activity.contact.newfriend;

import android.content.Intent;
import android.os.Bundle;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.MainFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import lrn;
import lro;

public class ContactRecommendActivity
  extends IphoneTitleBarActivity
{
  private FrameLayout jdField_a_of_type_AndroidWidgetFrameLayout;
  private BaseNewFriendView.INewFriendContext jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext;
  private RecommendListView jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView;
  
  public ContactRecommendActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void b()
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext = new lrn(this);
  }
  
  private void c()
  {
    setContentBackgroundResource(2130837739);
    jdField_a_of_type_AndroidWidgetFrameLayout = new FrameLayout(this);
    Object localObject = new FrameLayout.LayoutParams(-1, -1);
    jdField_a_of_type_AndroidWidgetFrameLayout.setLayoutParams((ViewGroup.LayoutParams)localObject);
    setContentView(jdField_a_of_type_AndroidWidgetFrameLayout);
    setTitle(2131367319);
    leftView.setVisibility(8);
    setRightHighlightButton(2131370321, new lro(this));
    enableRightHighlight(true);
    localObject = getIntent();
    ((Intent)localObject).putExtra("key_work_mode", 1);
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView = new RecommendListView(this);
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.a((Intent)localObject, jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext);
    jdField_a_of_type_AndroidWidgetFrameLayout.addView(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView);
  }
  
  public void a()
  {
    Intent localIntent = new Intent(this, SplashActivity.class);
    localIntent.putExtra("tab_index", MainFragment.a);
    localIntent.addFlags(67108864);
    startActivity(localIntent);
    overridePendingTransition(2130968633, 0);
    finish();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    b();
    c();
    return true;
  }
  
  protected void doOnDestroy()
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.h();
    super.doOnDestroy();
  }
  
  protected void doOnStart()
  {
    super.doOnStart();
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.d();
  }
  
  protected void doOnStop()
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.g();
    super.doOnStop();
  }
  
  public void onBackPressed()
  {
    a();
  }
}
