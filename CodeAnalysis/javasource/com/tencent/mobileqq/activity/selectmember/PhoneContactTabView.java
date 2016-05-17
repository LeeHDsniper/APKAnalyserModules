package com.tencent.mobileqq.activity.selectmember;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.Context;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.av.utils.PstnUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.search.ContactsSearchablePhoneContact;
import com.tencent.mobileqq.search.IContactSearchable;
import com.tencent.mobileqq.widget.IndexView;
import com.tencent.mobileqq.widget.IndexView.OnIndexChangedListener;
import com.tencent.mobileqq.widget.PinnedDividerListView;
import com.tencent.mobileqq.widget.PinnedDividerListView.OnLayoutListener;
import com.tencent.mobileqq.widget.TipsBar;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mlr;
import mls;
import mlt;
import mlu;
import mqq.os.MqqHandler;

public class PhoneContactTabView
  extends TroopDiscussionBaseV
  implements View.OnClickListener, View.OnTouchListener, IndexView.OnIndexChangedListener, PinnedDividerListView.OnLayoutListener
{
  public static final int a = 3;
  public static final String a = "pstn";
  public static final int b = 100;
  private static final int jdField_c_of_type_Int = 1;
  private static final String jdField_c_of_type_JavaLangString = "ContactsInnerFrame";
  private static final int d = 2;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  public ContactFriendInnerFrame a;
  public PhoneContactSelectActivity a;
  private PhoneContactManager jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  private IndexView jdField_a_of_type_ComTencentMobileqqWidgetIndexView;
  PinnedDividerListView jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView;
  public List a;
  private mlu jdField_a_of_type_Mlu;
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  private String jdField_b_of_type_JavaLangString;
  
  public PhoneContactTabView(SelectMemberActivity paramSelectMemberActivity, ContactFriendInnerFrame paramContactFriendInnerFrame)
  {
    super(paramSelectMemberActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_MqqOsMqqHandler = new mls(this);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactFriendInnerFrame = paramContactFriendInnerFrame;
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity = ((PhoneContactSelectActivity)paramSelectMemberActivity);
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface)
  {
    long l1 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    Object localObject = (PhoneContactManager)paramQQAppInterface.getManager(10);
    if (localObject != null)
    {
      localObject = ((PhoneContactManager)localObject).d();
      if (localObject != null)
      {
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext()) {
          localArrayList.add(new ContactsSearchablePhoneContact(paramContext, paramQQAppInterface, (PhoneContact)((Iterator)localObject).next(), IContactSearchable.E));
        }
      }
    }
    long l2 = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("ContactsInnerFrame", 2, "getPhoneContactsForSearch time cost = " + (l2 - l1) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  private void g()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.a.setVisibility(8);
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.a())
    {
      jdField_a_of_type_AndroidViewViewGroup.setVisibility(0);
      jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
      return;
    }
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(0);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
  }
  
  private void h()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView = ((PinnedDividerListView)findViewById(2131297884));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView = ((IndexView)findViewById(2131298001));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setIndex(new String[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#" });
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setOnIndexChangedListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelector(2131427378);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setOnLayoutListener(this);
    jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131300231));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131304014));
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(new mlr(this));
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131304015));
    jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131304016));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
  }
  
  private void i()
  {
    if (jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager == null) {
      jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10));
    }
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null) {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new mlt(this);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
  }
  
  private void j()
  {
    PstnUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity, 100, true);
  }
  
  public String a()
  {
    return "-1";
  }
  
  public List a()
  {
    return a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  public void a(Bundle paramBundle)
  {
    a(2130904779);
    jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10));
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(PhoneContactTabView.class, jdField_a_of_type_MqqOsMqqHandler);
    h();
    jdField_a_of_type_Mlu = new mlu(this, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, false);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Mlu);
    jdField_b_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.m;
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(false, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369857), jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.aa);
    int i = jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.d();
    if (QLog.isColorLevel()) {
      QLog.i("ContactsInnerFrame", 2, "onStart state:" + i);
    }
    switch (i)
    {
    case 5: 
    default: 
      i();
      return;
    case 6: 
      d();
      return;
    case 0: 
    case 1: 
    case 2: 
    case 4: 
      g();
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.a().lastUsedFlag == 2L)
    {
      d();
      return;
    }
    g();
  }
  
  public void a(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() > 0) || ((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() == 0) && (jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.getChildCount() < jdField_a_of_type_Mlu.getCount() + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m()))) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.c()))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(0);
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(1);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(4);
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(2);
  }
  
  public void b()
  {
    super.b();
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(3);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(PhoneContactTabView.class);
    if (jdField_a_of_type_Mlu != null) {
      jdField_a_of_type_Mlu.b();
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
  }
  
  public void b(String paramString)
  {
    if ("$".equals(paramString)) {
      jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(0);
    }
    int i;
    do
    {
      return;
      i = jdField_a_of_type_Mlu.a(paramString);
    } while (i == -1);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(i + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m());
  }
  
  public void c()
  {
    jdField_a_of_type_Mlu.notifyDataSetChanged();
  }
  
  public void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.b)
    {
      jdField_a_of_type_JavaUtilList = jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.d();
      if (jdField_a_of_type_JavaUtilList != null) {
        break label122;
      }
      jdField_a_of_type_MqqOsMqqHandler.removeMessages(3);
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(3, 1000L);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.a()) {
        break label175;
      }
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.a.setVisibility(0);
      return;
      jdField_a_of_type_JavaUtilList = jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.e();
      break;
      label122:
      if (jdField_a_of_type_Mlu == null)
      {
        jdField_a_of_type_Mlu = new mlu(this, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, false);
        jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Mlu);
      }
      jdField_a_of_type_Mlu.a();
    }
    label175:
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.a.setVisibility(8);
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    }
    PstnUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, 2, 2);
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() == 1) {}
    return true;
  }
}
