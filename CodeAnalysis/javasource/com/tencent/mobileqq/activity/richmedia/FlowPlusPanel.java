package com.tencent.mobileqq.activity.richmedia;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout.PanelIconCallback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class FlowPlusPanel
  extends FlowPanel
  implements PanelIconLinearLayout.PanelIconCallback
{
  public static final String a = "selected_item";
  public static final String b = "selected_data";
  int jdField_a_of_type_Int;
  private View jdField_a_of_type_AndroidViewView;
  
  public FlowPlusPanel(FlowActivity paramFlowActivity)
  {
    super(paramFlowActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = -1;
  }
  
  public void a()
  {
    jdField_a_of_type_AndroidViewView.setVisibility(0);
  }
  
  public void a(ViewGroup paramViewGroup)
  {
    PanelIconLinearLayout localPanelIconLinearLayout = new PanelIconLinearLayout(paramViewGroup.getContext(), null);
    localPanelIconLinearLayout.setPanelIconListener(this);
    int i = (int)(40.0F * getResourcesgetDisplayMetricsdensity + 0.5F);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
    localLayoutParams.addRule(2, 2131296783);
    paramViewGroup.addView(localPanelIconLinearLayout, localLayoutParams);
    localPanelIconLinearLayout.setCustomHeight(i);
    paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowActivity.getIntent().getExtras();
    if ((paramViewGroup != null) && (paramViewGroup.containsKey("selected_item")))
    {
      jdField_a_of_type_Int = paramViewGroup.getInt("selected_item");
      if (paramViewGroup.containsKey("selected_data"))
      {
        paramViewGroup = (ArrayList)paramViewGroup.getSerializable("selected_data");
        a.clear();
        a.addAll(paramViewGroup);
      }
      localPanelIconLinearLayout.a();
      localPanelIconLinearLayout.setSelected(jdField_a_of_type_Int);
      jdField_a_of_type_AndroidViewView = localPanelIconLinearLayout;
      return;
    }
    throw new RuntimeException("No pass args SELECTED_ITEM");
  }
  
  public void a(Object paramObject)
  {
    Intent localIntent = ((FlowActivity)a()).getIntent();
    if ((paramObject == null) || (!(paramObject instanceof Integer))) {
      return;
    }
    int i = ((Integer)paramObject).intValue();
    QLog.d("XPanel", 2, " FlowPlusPanel  onPanelIconClick  i==" + i + "panelType===" + jdField_a_of_type_Int);
    localIntent.putExtra("click_item", i);
    ((FlowActivity)a()).setResult(1000, localIntent);
    ((FlowActivity)a()).finish();
  }
  
  public void b()
  {
    jdField_a_of_type_AndroidViewView.setVisibility(4);
  }
}
