package com.tencent.mobileqq.activity.selectmember;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.widget.IndexView;
import com.tencent.mobileqq.widget.IndexView.OnIndexChangedListener;
import com.tencent.mobileqq.widget.PinnedDividerListView;
import com.tencent.mobileqq.widget.PinnedDividerListView.OnLayoutListener;
import java.util.List;
import mjz;
import mka;
import mkb;
import mkc;
import mqq.os.MqqHandler;

public class ContactsInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener, IndexView.OnIndexChangedListener, PinnedDividerListView.OnLayoutListener
{
  public static final int a = 3;
  public static final String a = "pstn";
  public static final int b = 1;
  private static final String b = "ContactsInnerFrame";
  private static final int c = 1;
  private static final int d = 2;
  private PhoneContactManager jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  private IndexView jdField_a_of_type_ComTencentMobileqqWidgetIndexView;
  PinnedDividerListView jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView;
  public List a;
  private mkb jdField_a_of_type_Mkb;
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  
  public ContactsInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_MqqOsMqqHandler = new mjz(this);
  }
  
  public ContactsInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_MqqOsMqqHandler = new mjz(this);
  }
  
  public ContactsInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_MqqOsMqqHandler = new mjz(this);
  }
  
  private void g()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView = ((PinnedDividerListView)findViewById(2131297884));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView = ((IndexView)findViewById(2131298001));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setIndex(new String[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#" });
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setOnIndexChangedListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelector(2131427378);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setOnLayoutListener(this);
  }
  
  private void h()
  {
    jdField_a_of_type_JavaUtilList = jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.d();
    if (jdField_a_of_type_JavaUtilList == null)
    {
      jdField_a_of_type_MqqOsMqqHandler.removeMessages(3);
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(3, 1000L);
      return;
    }
    if (jdField_a_of_type_Mkb == null)
    {
      jdField_a_of_type_Mkb = new mkb(this, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, false);
      jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Mkb);
    }
    jdField_a_of_type_Mkb.a();
  }
  
  private void i()
  {
    if (jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager == null) {
      jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10));
    }
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null) {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new mka(this);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
  }
  
  private void j() {}
  
  public ContactSearchFragment a()
  {
    return ContactSearchFragment.a(-1, 768, null, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
  }
  
  public String a()
  {
    return "-1";
  }
  
  public void a()
  {
    super.a();
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130904779);
    jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10));
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ContactsInnerFrame.class, jdField_a_of_type_MqqOsMqqHandler);
    g();
    jdField_a_of_type_Mkb = new mkb(this, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, false);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Mkb);
  }
  
  public void a(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() > 0) || ((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() == 0) && (jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.getChildCount() < jdField_a_of_type_Mkb.getCount() + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m()))) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.c()))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(0);
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(1);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(4);
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(2);
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369858), jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131370010));
    switch (jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.d())
    {
    case 5: 
    default: 
      i();
      return;
    case 0: 
    case 4: 
    case 6: 
      h();
      return;
    case 1: 
    case 2: 
      j();
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.a().lastUsedFlag == 2L)
    {
      h();
      return;
    }
    j();
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
      i = jdField_a_of_type_Mkb.a(paramString);
    } while (i == -1);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(i + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m());
  }
  
  public void d()
  {
    super.d();
    jdField_a_of_type_MqqOsMqqHandler.removeMessages(3);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ContactsInnerFrame.class);
    if (jdField_a_of_type_Mkb != null) {
      jdField_a_of_type_Mkb.b();
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
  }
  
  public void f()
  {
    jdField_a_of_type_Mkb.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    mkc localMkc = (mkc)paramView.getTag();
    PhoneContact localPhoneContact;
    boolean bool;
    if ((localMkc != null) && (jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_ComTencentMobileqqDataPhoneContact != null))
    {
      localPhoneContact = jdField_a_of_type_ComTencentMobileqqDataPhoneContact;
      if (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled())
      {
        if (!jdField_a_of_type_Boolean) {
          break label150;
        }
        bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, name, 5, "-1");
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
      if (AppSetting.i)
      {
        if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
          break label249;
        }
        if (!jdField_a_of_type_Boolean) {
          break;
        }
        paramView.setContentDescription(c.getText() + jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369866));
      }
      return;
      label150:
      if (b.startsWith("+")) {
        bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, name, 4, "-1");
      } else {
        bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, name, 0, "-1");
      }
    }
    paramView.setContentDescription(c.getText().toString() + "已选中,双击取消");
    return;
    label249:
    if (jdField_a_of_type_Boolean) {}
    for (int i = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b);; i = 0)
    {
      if ((jdField_a_of_type_Boolean) && (i != 0))
      {
        paramView.setContentDescription(c.getText() + jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(i));
        return;
      }
      paramView.setContentDescription(c.getText().toString() + "未选中,双击选中");
      return;
    }
  }
}
