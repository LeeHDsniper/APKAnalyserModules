package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.content.SharedPreferences;
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
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ChnToSpell;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.IndexView;
import com.tencent.mobileqq.widget.IndexView.OnIndexChangedListener;
import com.tencent.mobileqq.widget.PinnedDividerListView;
import com.tencent.mobileqq.widget.PinnedDividerListView.OnLayoutListener;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import mnv;
import mnw;
import mnx;
import mnz;
import moa;
import mob;

public class TroopMemberListInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener, CompoundButton.OnCheckedChangeListener, IndexView.OnIndexChangedListener, PinnedDividerListView.OnLayoutListener
{
  private static final int jdField_a_of_type_Int = 1;
  private static final int jdField_b_of_type_Int = 2;
  private static final String c = "TroopMemberListInnerFrame";
  public Handler a;
  CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  public TextView a;
  public TroopManager a;
  private TroopObserver jdField_a_of_type_ComTencentMobileqqAppTroopObserver;
  private IndexView jdField_a_of_type_ComTencentMobileqqWidgetIndexView;
  public PinnedDividerListView a;
  String jdField_a_of_type_JavaLangString;
  public LinkedHashMap a;
  List jdField_a_of_type_JavaUtilList;
  public moa a;
  public boolean a;
  public int[] a;
  public String[] a;
  public String b;
  List jdField_b_of_type_JavaUtilList;
  boolean jdField_b_of_type_Boolean;
  private String d;
  
  public TroopMemberListInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    jdField_a_of_type_ArrayOfInt = new int[0];
    jdField_a_of_type_ArrayOfJavaLangString = new String[0];
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new mnv(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new mnx(this);
  }
  
  public TroopMemberListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    jdField_a_of_type_ArrayOfInt = new int[0];
    jdField_a_of_type_ArrayOfJavaLangString = new String[0];
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new mnv(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new mnx(this);
  }
  
  public TroopMemberListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    jdField_a_of_type_ArrayOfInt = new int[0];
    jdField_a_of_type_ArrayOfJavaLangString = new String[0];
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new mnv(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new mnx(this);
  }
  
  private void a(String paramString)
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(paramString);
      if (localObject == null) {
        break label152;
      }
    }
    label152:
    for (Object localObject = troopcode;; localObject = "0")
    {
      if ((localObject != null) && (((String)localObject).length() > 0))
      {
        if (!NetworkUtil.e(BaseApplication.getContext()))
        {
          jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.n();
          QQToast.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131366990), 0).b(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.b.getHeight());
        }
      }
      else {
        return;
      }
      jdField_a_of_type_Boolean = true;
      if (QLog.isColorLevel()) {
        QLog.d("TroopMemberListInnerFrame", 2, "get troop members from server, troopUin: " + paramString + " troopCode: " + (String)localObject);
      }
      ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).a(true, paramString, (String)localObject);
      return;
    }
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
      int j = jdField_a_of_type_Moa.getCount();
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          break label105;
        }
        paramString = (TroopMemberInfo)jdField_a_of_type_Moa.getItem(i);
        if ((paramString != null) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(memberuin)))
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
  
  private Object[] a(String arg1)
  {
    Object localObject4;
    int i;
    Object localObject5;
    Object localObject6;
    for (;;)
    {
      try
      {
        localObject4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
        Object localObject1 = ((EntityManager)localObject4).a(TroopMemberInfo.class, false, "troopuin=? ", new String[] { ??? }, null, null, null, null);
        ((EntityManager)localObject4).a();
        if (QLog.isColorLevel())
        {
          ??? = new StringBuilder().append("read troop members from database, troop uin: ").append(???).append(" member count: ");
          if (localObject1 == null)
          {
            i = 0;
            QLog.d("TroopMemberListInnerFrame", 2, i);
          }
        }
        else
        {
          localObject4 = new LinkedHashMap();
          localObject5 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          if ((localObject1 == null) || (((List)localObject1).size() <= 0)) {
            break label812;
          }
          synchronized (jdField_a_of_type_JavaUtilList)
          {
            jdField_a_of_type_JavaUtilList.clear();
            localObject1 = ((List)localObject1).iterator();
            if (!((Iterator)localObject1).hasNext()) {
              break;
            }
            localObject6 = (TroopMemberInfo)((Iterator)localObject1).next();
            if (((!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.u) && (((String)localObject5).equalsIgnoreCase(memberuin))) || (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i.contains(memberuin)) || (!Utils.c(memberuin))) {
              continue;
            }
            displayedNamePinyinFirst = ChnToSpell.a(ContactUtils.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, troopuin, memberuin), 2);
            jdField_a_of_type_JavaUtilList.add(localObject6);
          }
        }
        i = localObject2.size();
      }
      finally {}
      i -= 1;
    }
    Object localObject3 = jdField_a_of_type_JavaUtilList.iterator();
    label370:
    label375:
    char c1;
    if (((Iterator)localObject3).hasNext())
    {
      localObject5 = (TroopMemberInfo)((Iterator)localObject3).next();
      if (displayedNamePinyinFirst != null)
      {
        if (displayedNamePinyinFirst.length() == 0) {
          break label775;
        }
        for (;;)
        {
          i = ???.charAt(0);
          if ((65 > i) || (i > 90)) {
            break label782;
          }
          ??? = ???.toUpperCase();
          if (((LinkedHashMap)localObject4).get(???) == null) {
            ((LinkedHashMap)localObject4).put(???, new ArrayList());
          }
          ((List)((LinkedHashMap)localObject4).get(???)).add(localObject5);
          break;
          ??? = displayedNamePinyinFirst.substring(0, 1);
        }
      }
    }
    else
    {
      ??? = ((LinkedHashMap)localObject4).keySet().iterator();
      while (???.hasNext()) {
        Collections.sort((List)((LinkedHashMap)localObject4).get((String)???.next()), new mnz(this, null));
      }
      localObject5 = new LinkedHashMap();
      c1 = 'A';
      label496:
      if (c1 <= 'Z')
      {
        if (((LinkedHashMap)localObject4).get(String.valueOf(c1)) == null) {
          break label804;
        }
        ((LinkedHashMap)localObject5).put(String.valueOf(c1), ((LinkedHashMap)localObject4).get(String.valueOf(c1)));
        break label804;
      }
      if (((LinkedHashMap)localObject4).get("#") != null) {
        ((LinkedHashMap)localObject5).put("#", ((LinkedHashMap)localObject4).get("#"));
      }
      ((LinkedHashMap)localObject4).clear();
      localObject6 = new int[((LinkedHashMap)localObject5).keySet().size()];
      String[] arrayOfString = new String[((LinkedHashMap)localObject5).keySet().size()];
      ??? = ((LinkedHashMap)localObject5).keySet().iterator();
      if (localObject6.length == 0)
      {
        ??? = new Object[0];
        label620:
        return ???;
      }
      localObject6[0] = 0;
      i = 1;
      while (i < localObject6.length)
      {
        int j = localObject6[i];
        int k = localObject6[(i - 1)];
        localObject6[i] = (((List)((LinkedHashMap)localObject5).get(???.next())).size() + k + 1 + j);
        i += 1;
      }
      Iterator localIterator = ((LinkedHashMap)localObject5).keySet().iterator();
      i = 0;
      for (;;)
      {
        ??? = arrayOfString;
        localObject3 = localObject6;
        localObject4 = localObject5;
        if (!localIterator.hasNext()) {
          break;
        }
        arrayOfString[i] = ((String)localIterator.next());
        i += 1;
      }
    }
    for (;;)
    {
      localObject5 = new Object[3];
      localObject5[0] = localObject4;
      localObject5[1] = localObject3;
      localObject5[2] = ???;
      ??? = (String)localObject5;
      break label620;
      label775:
      ??? = "#";
      break;
      label782:
      if ((97 <= i) && (i <= 122)) {
        break label370;
      }
      ??? = "#";
      break label375;
      label804:
      c1 = (char)(c1 + '\001');
      break label496;
      label812:
      localObject3 = new int[0];
      ??? = new String[0];
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
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131304013));
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131304010));
    LinearLayout localLinearLayout = (LinearLayout)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131304011);
    jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)findViewById(2131304012));
    localLinearLayout.setOnClickListener(this);
  }
  
  private void h()
  {
    mnw localMnw = new mnw(this);
    long l1 = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getSharedPreferences("last_update_time" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0).getLong("key_last_update_time" + jdField_b_of_type_JavaLangString, 0L);
    long l2 = System.currentTimeMillis();
    long l3 = Math.abs(l2 - l1);
    if (QLog.isColorLevel()) {
      QLog.d("TroopMemberListInnerFrame", 2, "troop member last update time: " + l1 + " current time: " + l2 + " time difference: " + l3);
    }
    if ((l1 == 0L) || ((l1 > 0L) && (l3 > 300000L))) {
      a(jdField_b_of_type_JavaLangString);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(localMnw);
  }
  
  public ContactSearchFragment a()
  {
    return ContactSearchFragment.a(-1, 8192, jdField_b_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
  }
  
  public String a()
  {
    return jdField_b_of_type_JavaLangString;
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130904779);
    jdField_a_of_type_ComTencentMobileqqAppTroopManager = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51));
    g();
    jdField_a_of_type_Moa = new moa(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setAdapter(jdField_a_of_type_Moa);
  }
  
  public void a(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() > 0) || ((jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.s() == 0) && (jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.getChildCount() < jdField_a_of_type_Moa.getCount() + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m()))) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.c()))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(0);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetIndexView.setVisibility(4);
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a.clearFocus();
    jdField_b_of_type_JavaLangString = paramBundle.getString("group_uin");
    d = paramBundle.getString("group_name");
    boolean bool = paramBundle.getBoolean("param_enable_all_select", false);
    paramBundle = jdField_a_of_type_AndroidWidgetRelativeLayout;
    int i;
    if (bool)
    {
      i = 0;
      paramBundle.setVisibility(i);
      if (((d == null) || (d.length() == 0)) && (jdField_b_of_type_JavaLangString != null) && (jdField_b_of_type_JavaLangString.length() > 0) && (jdField_a_of_type_ComTencentMobileqqAppTroopManager != null))
      {
        paramBundle = jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(jdField_b_of_type_JavaLangString);
        if (paramBundle != null) {
          d = troopname;
        }
      }
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.o) {
        break label279;
      }
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(false, "", d);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.addObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
      if ((jdField_b_of_type_JavaLangString != null) && (jdField_b_of_type_JavaLangString.length() > 0))
      {
        if (jdField_b_of_type_JavaLangString.equals(jdField_a_of_type_JavaLangString)) {
          break label297;
        }
        jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
        jdField_a_of_type_ArrayOfInt = new int[0];
        jdField_a_of_type_ArrayOfJavaLangString = new String[0];
        jdField_a_of_type_Moa.notifyDataSetChanged();
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.m();
        jdField_b_of_type_Boolean = false;
        h();
        jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(0);
        jdField_a_of_type_JavaLangString = jdField_b_of_type_JavaLangString;
      }
      return;
      i = 8;
      break;
      label279:
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, "群", d);
    }
    label297:
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_Moa.notifyDataSetChanged();
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
      i = jdField_a_of_type_Moa.a(paramString);
    } while (i == -1);
    jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.setSelection(i + jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView.m());
  }
  
  public void c()
  {
    super.c();
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.removeObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
  }
  
  public void d()
  {
    if (jdField_a_of_type_Moa != null) {
      jdField_a_of_type_Moa.b();
    }
    super.d();
  }
  
  public void f()
  {
    jdField_a_of_type_Moa.notifyDataSetChanged();
    a(null, false);
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    if (2131304012 == paramCompoundButton.getId())
    {
      if (!paramBoolean) {
        break label115;
      }
      paramCompoundButton = new ArrayList();
      int j = jdField_a_of_type_Moa.getCount();
      int i = 0;
      while (i < j)
      {
        TroopMemberInfo localTroopMemberInfo = (TroopMemberInfo)jdField_a_of_type_Moa.getItem(i);
        if (localTroopMemberInfo != null)
        {
          SelectMemberActivity localSelectMemberActivity = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity;
          paramCompoundButton.add(SelectMemberActivity.a(memberuin, jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(localTroopMemberInfo), 1, jdField_b_of_type_JavaLangString));
        }
        i += 1;
      }
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(paramCompoundButton, false);
    }
    for (;;)
    {
      jdField_a_of_type_Moa.notifyDataSetChanged();
      return;
      label115:
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.b();
    }
  }
  
  public void onClick(View paramView)
  {
    if (2131304011 != paramView.getId())
    {
      Object localObject = (mob)paramView.getTag();
      if ((localObject != null) && (jdField_a_of_type_AndroidWidgetCheckBox != null) && (c != null) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
      {
        bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(jdField_b_of_type_JavaLangString, c.getText().toString(), 1, jdField_b_of_type_JavaLangString);
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
        a(jdField_b_of_type_JavaLangString, bool);
        if (AppSetting.i)
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label164;
          }
          paramView.setContentDescription(c.getText().toString() + "已选中");
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label202;
          }
        }
      }
      label164:
      label202:
      for (localObject = "已选中";; localObject = "未选中")
      {
        AccessibilityUtil.a(paramView, (String)localObject);
        return;
        paramView.setContentDescription(c.getText().toString() + "未选中");
        break;
      }
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
