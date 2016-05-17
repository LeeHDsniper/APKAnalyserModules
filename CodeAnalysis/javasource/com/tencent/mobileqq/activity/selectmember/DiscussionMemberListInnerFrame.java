package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.utils.ChnToSpell;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.widget.IndexView;
import com.tencent.mobileqq.widget.IndexView.OnIndexChangedListener;
import com.tencent.mobileqq.widget.PinnedDividerListView;
import com.tencent.mobileqq.widget.PinnedDividerListView.OnLayoutListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mkr;
import mks;
import mkt;

public class DiscussionMemberListInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener, CompoundButton.OnCheckedChangeListener, IndexView.OnIndexChangedListener, PinnedDividerListView.OnLayoutListener
{
  private static final int jdField_a_of_type_Int = 1;
  private static final int jdField_b_of_type_Int = 2;
  private Handler jdField_a_of_type_AndroidOsHandler;
  CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private IndexView jdField_a_of_type_ComTencentMobileqqWidgetIndexView;
  public PinnedDividerListView a;
  private String jdField_a_of_type_JavaLangString;
  public List a;
  private mks jdField_a_of_type_Mks;
  private String jdField_b_of_type_JavaLangString;
  List jdField_b_of_type_JavaUtilList;
  private String c;
  
  public DiscussionMemberListInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_AndroidOsHandler = new mkr(this);
  }
  
  public DiscussionMemberListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_AndroidOsHandler = new mkr(this);
  }
  
  public DiscussionMemberListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_AndroidOsHandler = new mkr(this);
  }
  
  private void a(String paramString, boolean paramBoolean)
  {
    if ((jdField_a_of_type_AndroidWidgetRelativeLayout != null) && (jdField_a_of_type_AndroidWidgetRelativeLayout.getVisibility() == 0))
    {
      if ((paramString == null) || (paramBoolean) || (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked())) {
        break label46;
      }
      paramBoolean = false;
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(paramBoolean);
      return;
      label46:
      int j = jdField_a_of_type_Mks.getCount();
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          break label105;
        }
        paramString = (DiscussionMemberInfo)jdField_a_of_type_Mks.getItem(i);
        if ((paramString != null) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(memberUin)))
        {
          paramBoolean = false;
          break;
        }
        i += 1;
      }
      label105:
      paramBoolean = true;
    }
  }
  
  private void g()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView = ((PinnedDividerListView)findViewById(2131297884));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView = ((IndexView)findViewById(2131298001));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setIndex(new String[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#" });
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setOnIndexChangedListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelector(2131427378);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setOnLayoutListener(this);
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131304010));
    LinearLayout localLinearLayout = (LinearLayout)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131304011);
    jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131304012));
    localLinearLayout.setOnClickListener(this);
  }
  
  private void h()
  {
    jdField_a_of_type_JavaUtilList.clear();
    Object localObject = ((DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(b);
    if (localObject != null)
    {
      String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        DiscussionMemberInfo localDiscussionMemberInfo = (DiscussionMemberInfo)((Iterator)localObject).next();
        if ((localDiscussionMemberInfo != null) && (!str.equalsIgnoreCase(memberUin)) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i.contains(memberUin)))
        {
          displayedNamePinyinFirst = ChnToSpell.a(ContactUtils.a(localDiscussionMemberInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface), 2);
          jdField_a_of_type_JavaUtilList.add(localDiscussionMemberInfo);
        }
      }
    }
  }
  
  public ContactSearchFragment a()
  {
    return ContactSearchFragment.a(-1, 4096, b, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
  }
  
  public String a()
  {
    return b;
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130904779);
    g();
    jdField_a_of_type_Mks = new mks(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Mks);
  }
  
  public void a(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() > 0) || ((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() == 0) && (jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.getChildCount() < jdField_a_of_type_Mks.getCount() + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m()))) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.c()))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(0);
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(4);
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(2);
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a.clearFocus();
    b = paramBundle.getString("group_uin");
    c = paramBundle.getString("group_name");
    boolean bool = paramBundle.getBoolean("param_enable_all_select", false);
    paramBundle = jdField_a_of_type_AndroidWidgetRelativeLayout;
    int i;
    if (bool)
    {
      i = 0;
      paramBundle.setVisibility(i);
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.p) {
        break label134;
      }
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(false, "", c);
    }
    for (;;)
    {
      if (b.equals(jdField_a_of_type_JavaLangString)) {
        break label152;
      }
      h();
      jdField_a_of_type_Mks.a();
      jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(0);
      jdField_a_of_type_JavaLangString = b;
      return;
      i = 8;
      break;
      label134:
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, "讨论组", c);
    }
    label152:
    jdField_a_of_type_Mks.notifyDataSetChanged();
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
      i = jdField_a_of_type_Mks.a(paramString);
    } while (i == -1);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(i + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m());
  }
  
  public void d()
  {
    if (jdField_a_of_type_Mks != null) {
      jdField_a_of_type_Mks.b();
    }
    super.d();
  }
  
  public void f()
  {
    jdField_a_of_type_Mks.notifyDataSetChanged();
    a(null, false);
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    if (2131304012 == paramCompoundButton.getId())
    {
      if (!paramBoolean) {
        break label114;
      }
      paramCompoundButton = new ArrayList();
      int j = jdField_a_of_type_Mks.getCount();
      int i = 0;
      while (i < j)
      {
        DiscussionMemberInfo localDiscussionMemberInfo = (DiscussionMemberInfo)jdField_a_of_type_Mks.getItem(i);
        if (localDiscussionMemberInfo != null)
        {
          SelectMemberActivity localSelectMemberActivity = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity;
          paramCompoundButton.add(SelectMemberActivity.a(memberUin, ContactUtils.a(localDiscussionMemberInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface), 2, b));
        }
        i += 1;
      }
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(paramCompoundButton, false);
    }
    for (;;)
    {
      jdField_a_of_type_Mks.notifyDataSetChanged();
      return;
      label114:
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.b();
    }
  }
  
  public void onClick(View paramView)
  {
    if (2131304011 != paramView.getId())
    {
      mkt localMkt = (mkt)paramView.getTag();
      if ((localMkt != null) && (jdField_a_of_type_AndroidWidgetCheckBox != null) && (c != null) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
      {
        bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, c.getText().toString(), 2, b);
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
        a(b, bool);
        if (AppSetting.i)
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label143;
          }
          paramView.setContentDescription(c.getText().toString() + "已选中,双击取消");
        }
      }
      return;
      label143:
      paramView.setContentDescription(c.getText().toString() + "未选中,双击选中");
      return;
    }
    paramView = jdField_a_of_type_AndroidWidgetCheckBox;
    if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {}
    for (boolean bool = true;; bool = false)
    {
      paramView.setChecked(bool);
      onCheckedChanged(jdField_a_of_type_AndroidWidgetCheckBox, jdField_a_of_type_AndroidWidgetCheckBox.isChecked());
      return;
    }
  }
}
