package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.ContactFacade;
import com.tencent.mobileqq.app.ContactSorter;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.Groups;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.utils.ChnToSpell;
import com.tencent.mobileqq.widget.IndexView;
import com.tencent.mobileqq.widget.IndexView.OnIndexChangedListener;
import com.tencent.mobileqq.widget.PinnedDividerListView;
import com.tencent.mobileqq.widget.PinnedDividerListView.OnLayoutListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mku;
import mkv;
import mkw;

public class FriendListInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener, IndexView.OnIndexChangedListener, PinnedDividerListView.OnLayoutListener
{
  private static final int jdField_a_of_type_Int = 1;
  private static final int b = 2;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  public RelativeLayout a;
  private IndexView jdField_a_of_type_ComTencentMobileqqWidgetIndexView;
  public PinnedDividerListView a;
  private String jdField_a_of_type_JavaLangString;
  public List a;
  private mkv jdField_a_of_type_Mkv;
  private int c;
  private int d;
  
  public FriendListInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    c = Integer.MIN_VALUE;
    jdField_a_of_type_AndroidOsHandler = new mku(this);
  }
  
  public FriendListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaUtilList = new ArrayList();
    c = Integer.MIN_VALUE;
    jdField_a_of_type_AndroidOsHandler = new mku(this);
  }
  
  public FriendListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaUtilList = new ArrayList();
    c = Integer.MIN_VALUE;
    jdField_a_of_type_AndroidOsHandler = new mku(this);
  }
  
  private void g()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView = ((PinnedDividerListView)findViewById(2131297884));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView = ((IndexView)findViewById(2131298001));
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setIndex(new String[] { "$", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#" });
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setOnIndexChangedListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelector(2131427378);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setOnLayoutListener(this);
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getLayoutInflater().inflate(2130904750, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, false));
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131300511));
    ((Button)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131300492)).setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.a(jdField_a_of_type_AndroidWidgetRelativeLayout);
  }
  
  private void h()
  {
    jdField_a_of_type_JavaUtilList.clear();
    Object localObject2 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    Object localObject1 = (ContactFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(53);
    String str;
    if ((localObject2 != null) && (localObject1 != null))
    {
      str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      Object localObject3 = ((ContactFacade)localObject1).a(String.valueOf(d));
      if (localObject3 != null)
      {
        localObject3 = ((List)localObject3).iterator();
        while (((Iterator)localObject3).hasNext())
        {
          Object localObject4 = (Entity)((Iterator)localObject3).next();
          if (localObject4 != null)
          {
            localObject4 = (Friends)localObject4;
            if (((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.u) || (!uin.equals(str))) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i.contains(uin))) {
              jdField_a_of_type_JavaUtilList.add(localObject4);
            }
          }
        }
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.u) && (d == 0))
      {
        localObject2 = ((FriendsManager)localObject2).c();
        if ((localObject2 == null) || (((ArrayList)localObject2).size() <= 0)) {
          break label359;
        }
        localObject2 = ((ArrayList)localObject2).iterator();
        do
        {
          while (!((Iterator)localObject3).hasNext())
          {
            do
            {
              if (!((Iterator)localObject2).hasNext()) {
                break;
              }
              localObject3 = ((ContactFacade)localObject1).a(String.valueOf(nextgroup_id));
            } while ((localObject3 == null) || (((List)localObject3).size() <= 0));
            localObject3 = ((List)localObject3).iterator();
          }
        } while (!nextuin.equals(str));
      }
    }
    label359:
    for (int i = 1;; i = 0)
    {
      if (i == 0)
      {
        localObject1 = new Friends();
        uin = str;
        name = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b();
        mCompareSpell = ChnToSpell.a(ContactSorter.a((Friends)localObject1), 1);
        jdField_a_of_type_JavaUtilList.add(localObject1);
      }
      return;
    }
  }
  
  public ContactSearchFragment a()
  {
    return ((SelectMemberInnerFrame)jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getChildAt(1)).a();
  }
  
  public String a()
  {
    return "-1";
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130904779);
    g();
    jdField_a_of_type_Mkv = new mkv(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Mkv);
  }
  
  public void a(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() > 0) || ((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() == 0) && (jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.getChildCount() < jdField_a_of_type_Mkv.getCount() + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m()))) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.c()))
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
    d = paramBundle.getInt("friend_team_id");
    jdField_a_of_type_JavaLangString = paramBundle.getString("group_name");
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369858), jdField_a_of_type_JavaLangString);
    if (d != c)
    {
      h();
      jdField_a_of_type_Mkv.a();
      jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(0);
      c = d;
    }
    while (jdField_a_of_type_Mkv == null) {
      return;
    }
    jdField_a_of_type_Mkv.notifyDataSetChanged();
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
      i = jdField_a_of_type_Mkv.a(paramString);
    } while (i == -1);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(i + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m());
  }
  
  public void d()
  {
    if (jdField_a_of_type_Mkv != null) {
      jdField_a_of_type_Mkv.b();
    }
    super.d();
  }
  
  public void f()
  {
    jdField_a_of_type_Mkv.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    mkw localMkw = (mkw)paramView.getTag();
    if ((localMkw != null) && (a != null) && (c != null) && (a.isEnabled()))
    {
      boolean bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, c.getText().toString(), 0, "-1");
      a.setChecked(bool);
      if (AppSetting.i)
      {
        if (!a.isChecked()) {
          break label124;
        }
        paramView.setContentDescription(c.getText().toString() + "已选中,双击取消");
      }
    }
    return;
    label124:
    paramView.setContentDescription(c.getText().toString() + "未选中,双击选中");
  }
}
