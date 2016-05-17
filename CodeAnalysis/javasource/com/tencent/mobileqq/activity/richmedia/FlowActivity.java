package com.tencent.mobileqq.activity.richmedia;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.aio.photo.PeakActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class FlowActivity
  extends PeakActivity
{
  protected int a;
  protected ViewGroup a;
  protected boolean a;
  
  public FlowActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
  }
  
  public View a()
  {
    return jdField_a_of_type_AndroidViewViewGroup;
  }
  
  protected FlowPanel a()
  {
    return null;
  }
  
  protected void a(Bundle paramBundle)
  {
    if (paramBundle == null) {
      return;
    }
    jdField_a_of_type_Int = paramBundle.getInt("flow_camera_height", (int)getResources().getDimension(2131493533));
  }
  
  protected abstract void a(ViewGroup paramViewGroup);
  
  public void a(FlowPanel paramFlowPanel)
  {
    paramFlowPanel.a((ViewGroup)a(2131296782));
  }
  
  public void finish()
  {
    super.finish();
    if (jdField_a_of_type_Boolean)
    {
      overridePendingTransition(0, 2130968593);
      return;
    }
    overridePendingTransition(0, 0);
  }
  
  public void onBackPressed()
  {
    super.onBackPressed();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    paramBundle = getIntent().getExtras();
    if (paramBundle == null) {
      jdField_a_of_type_Int = ((int)getResources().getDimension(2131493533));
    }
    a(paramBundle);
    setContentView(2130903061);
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)a(2131296783));
    if (jdField_a_of_type_AndroidViewViewGroup != null) {
      a(jdField_a_of_type_AndroidViewViewGroup);
    }
    paramBundle = a();
    if (paramBundle != null) {
      paramBundle.a((ViewGroup)a(2131296782));
    }
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
  }
  
  protected void onPause()
  {
    super.onPause();
  }
  
  protected void onResume()
  {
    super.onResume();
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() != 0) {
      return super.onTouchEvent(paramMotionEvent);
    }
    View localView = a();
    if (localView == null) {
      return super.onTouchEvent(paramMotionEvent);
    }
    int i = localView.getTop();
    if (paramMotionEvent.getY() < i) {
      onBackPressed();
    }
    return super.onTouchEvent(paramMotionEvent);
  }
}
