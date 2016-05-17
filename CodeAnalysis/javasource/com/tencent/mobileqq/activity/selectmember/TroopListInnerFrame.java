package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.app.ContactFacade;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.SlideDetectListView;
import java.util.ArrayList;
import mnu;

public class TroopListInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener
{
  int jdField_a_of_type_Int;
  Context jdField_a_of_type_AndroidContentContext;
  TextView jdField_a_of_type_AndroidWidgetTextView = null;
  private TroopListAdapter jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter;
  SlideDetectListView jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  
  public TroopListInnerFrame(Context paramContext)
  {
    this(paramContext, null, 0);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public TroopListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public TroopListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_Int = paramContext.getResources().getDimensionPixelSize(2131493335);
  }
  
  private void a(int paramInt)
  {
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    if ((paramInt == 0) && (jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildAt(0) != null) && (jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildAt(0).getBottom() == jdField_a_of_type_Int)) {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    }
    do
    {
      return;
      localObject1 = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.getItem(paramInt);
    } while (!(localObject1 instanceof TroopListAdapter.TroopListItem));
    Object localObject2 = (TroopListAdapter.TroopListItem)localObject1;
    Object localObject1 = null;
    switch (i)
    {
    default: 
      label124:
      if (paramInt + 1 < jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.getCount())
      {
        localObject2 = (TroopListAdapter.TroopListItem)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.getItem(paramInt + 1);
        if ((i != 6) && (i != 4) && (i != 2)) {
          break label390;
        }
        localObject2 = jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildAt(0);
        if (localObject2 != null)
        {
          paramInt = ((View)localObject2).getBottom();
          localObject2 = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
          if (paramInt >= jdField_a_of_type_Int) {
            break label382;
          }
          topMargin = (paramInt - jdField_a_of_type_Int);
          label223:
          jdField_a_of_type_AndroidWidgetTextView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
          jdField_a_of_type_AndroidWidgetTextView.requestLayout();
        }
      }
      break;
    }
    while (!TextUtils.isEmpty((CharSequence)localObject1))
    {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
      return;
      localObject1 = jdField_a_of_type_AndroidContentContext.getString(2131364108, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.d) });
      break label124;
      localObject1 = jdField_a_of_type_AndroidContentContext.getString(2131364111, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.c) });
      break label124;
      localObject1 = jdField_a_of_type_AndroidContentContext.getString(2131364109, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.jdField_a_of_type_Int) });
      break label124;
      localObject1 = jdField_a_of_type_AndroidContentContext.getString(2131364110, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.b) });
      break label124;
      label382:
      topMargin = 0;
      break label223;
      label390:
      localObject2 = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
      if (topMargin != 0)
      {
        topMargin = 0;
        jdField_a_of_type_AndroidWidgetTextView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
        jdField_a_of_type_AndroidWidgetTextView.requestLayout();
      }
    }
  }
  
  private void g()
  {
    ContactFacade localContactFacade = (ContactFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(53);
    if (localContactFacade != null) {
      jdField_a_of_type_JavaUtilArrayList = localContactFacade.a("-1003");
    }
    if (jdField_a_of_type_JavaUtilArrayList == null) {
      jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    }
  }
  
  public ContactSearchFragment a()
  {
    return null;
  }
  
  public String a()
  {
    return null;
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130903742);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView = ((SlideDetectListView)findViewById(2131299626));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299438));
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setSelector(2131427378);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter = new TroopListAdapter(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView, 4, false, this);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter);
    g();
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_JavaUtilArrayList);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOnScrollGroupFloatingListener(new mnu(this));
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369858), jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369850));
  }
  
  public void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.b();
    }
    super.d();
  }
  
  public void f()
  {
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopListAdapter.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    paramView = (TroopListAdapter.TroopViewHolder)paramView.getTag();
    TroopInfo localTroopInfo;
    int i;
    if ((paramView != null) && (jdField_a_of_type_ComTencentMobileqqDataTroopInfo != null))
    {
      localTroopInfo = jdField_a_of_type_ComTencentMobileqqDataTroopInfo;
      if (localTroopInfo != null)
      {
        Bundle localBundle = new Bundle();
        localBundle.putString("group_uin", troopuin);
        localBundle.putString("group_name", troopname);
        jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(8, localBundle);
        switch (jdField_a_of_type_Int)
        {
        case 2: 
        case 4: 
        case 6: 
        default: 
          i = 0;
        }
      }
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_contacts", "", "choose_grp", "create_discuss", 0, 0, troopuin + "", String.valueOf(i), "", "");
      return;
      i = 0;
      continue;
      i = 1;
      continue;
      i = 2;
      continue;
      i = 3;
    }
  }
}
