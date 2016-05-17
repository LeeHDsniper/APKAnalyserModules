package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.app.ContactFacade;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.utils.ChnToSpell;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import mko;
import mkp;
import mkq;

public class DiscussionListInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener
{
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  public ArrayList a;
  private mkp jdField_a_of_type_Mkp;
  
  public DiscussionListInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public DiscussionListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public DiscussionListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void g()
  {
    DiscussionManager localDiscussionManager = (DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52);
    Object localObject1 = (ContactFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(53);
    if (localObject1 != null) {
      jdField_a_of_type_JavaUtilArrayList = ((ArrayList)((ContactFacade)localObject1).a("-1004").clone());
    }
    if (jdField_a_of_type_JavaUtilArrayList == null) {
      jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    }
    localObject1 = new HashMap();
    String str1 = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getResources().getString(2131367302);
    String str2 = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getResources().getString(2131367305);
    int i = jdField_a_of_type_JavaUtilArrayList.size() - 1;
    while (i >= 0)
    {
      DiscussionInfo localDiscussionInfo = (DiscussionInfo)jdField_a_of_type_JavaUtilArrayList.get(i);
      Object localObject2 = localDiscussionManager.a(uin);
      if ((localObject2 != null) && (((List)localObject2).size() == 1) && (get0memberUin.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())))
      {
        jdField_a_of_type_JavaUtilArrayList.remove(i);
        i -= 1;
      }
      else
      {
        long l = 0L;
        localObject2 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, localDiscussionInfo);
        String str3 = ChnToSpell.a((String)localObject2, 1);
        if ((((String)localObject2).matches(str1)) || (((String)localObject2).contains(str2))) {
          l = 65536L;
        }
        if ((str3 == null) || (str3.length() == 0)) {
          l |= 0xFFFF;
        }
        for (;;)
        {
          ((HashMap)localObject1).put(uin, Long.valueOf(l));
          break;
          if (StringUtil.c(str3.charAt(0))) {
            l |= str3.charAt(0);
          } else if (Character.isDigit(str3.charAt(0))) {
            l |= 0xFFFE;
          } else {
            l |= 0xFFFF;
          }
        }
      }
    }
    Collections.sort(jdField_a_of_type_JavaUtilArrayList, new mko(this, (HashMap)localObject1));
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
    setContentView(2130904802);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299626));
    jdField_a_of_type_ComTencentWidgetXListView.setSelector(2131427378);
    g();
    jdField_a_of_type_Mkp = new mkp(this, null);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Mkp);
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369858), jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369852));
  }
  
  public void d()
  {
    super.d();
  }
  
  public void f()
  {
    jdField_a_of_type_Mkp.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    paramView = (mkq)paramView.getTag();
    if ((paramView != null) && (a != null))
    {
      paramView = a;
      if (paramView != null)
      {
        Bundle localBundle = new Bundle();
        localBundle.putString("group_uin", uin);
        localBundle.putString("group_name", discussionName);
        jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(9, localBundle);
      }
    }
  }
}
