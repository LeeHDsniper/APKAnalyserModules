package com.tencent.mobileqq.activity.selectmember;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.app.ContactFacade;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ChnToSpell;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import mnq;
import mnr;
import mns;

public class TroopDiscussionDiscussion
  extends TroopDiscussionBaseV
  implements View.OnClickListener
{
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  public ArrayList a;
  private mnr jdField_a_of_type_Mnr;
  
  public TroopDiscussionDiscussion(SelectMemberActivity paramSelectMemberActivity)
  {
    super(paramSelectMemberActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void d()
  {
    DiscussionManager localDiscussionManager = (DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52);
    Object localObject1 = (ContactFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(53);
    QQMessageFacade localQQMessageFacade = (QQMessageFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(19);
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
      lastMsgTime = 0L;
      if (localQQMessageFacade != null)
      {
        localObject2 = localQQMessageFacade.b(uin, 3000);
        if ((localObject2 != null) && (((List)localObject2).size() > 0))
        {
          lastMsgTime = getsize1time;
          if (QLog.isColorLevel()) {
            QLog.d("TroopDiscussionDiscussion", 2, "discuss:" + discussionName + " last:" + lastMsgTime);
          }
        }
      }
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
    Collections.sort(jdField_a_of_type_JavaUtilArrayList, new mnq(this, (HashMap)localObject1));
  }
  
  public String a()
  {
    return null;
  }
  
  public List a()
  {
    return null;
  }
  
  public void a(Bundle paramBundle)
  {
    a(2130904802);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299626));
    jdField_a_of_type_ComTencentWidgetXListView.setSelector(2131427378);
    d();
    jdField_a_of_type_Mnr = new mnr(this, null);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Mnr);
  }
  
  public void b()
  {
    super.b();
  }
  
  public void b(Bundle paramBundle) {}
  
  public void c()
  {
    jdField_a_of_type_Mnr.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    paramView = (mns)paramView.getTag();
    Bundle localBundle;
    if ((paramView != null) && (a != null))
    {
      paramView = a;
      if (paramView != null)
      {
        localBundle = new Bundle();
        localBundle.putString("group_uin", uin);
        localBundle.putString("group_name", discussionName);
        if (!(jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a instanceof PhoneContactSelectActivity)) {
          break label81;
        }
        jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(3, localBundle);
      }
    }
    return;
    label81:
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(9, localBundle);
  }
}
