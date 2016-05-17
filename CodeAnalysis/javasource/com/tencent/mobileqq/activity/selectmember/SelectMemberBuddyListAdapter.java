package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Build.VERSION;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.av.config.ConfigSystemImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.adapter.BaseFacePreloadExpandableListAdapter;
import com.tencent.mobileqq.app.ContactFacade;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.Groups;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.BubbleContextMenu;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.ExpandableListView;
import com.tencent.widget.TraceUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import mnh;
import mni;
import mnj;
import mnk;
import mnl;
import mnm;
import mnn;
import mno;

public class SelectMemberBuddyListAdapter
  extends BaseFacePreloadExpandableListAdapter
  implements View.OnClickListener, View.OnLongClickListener, PhoneContactManager.IPhoneContactListener
{
  private static final int jdField_a_of_type_Int = 3;
  private static final String jdField_a_of_type_JavaLangString = "FriendTeamListInnerFrameBuddyListAdapter";
  private static final mnm jdField_a_of_type_Mnm = new mnm(null);
  private static final int jdField_b_of_type_Int = 0;
  private static final int c = 1;
  private static final int d = 2;
  private final Context jdField_a_of_type_AndroidContentContext;
  private final SparseArray jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
  private final View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  protected SelectMemberActivity a;
  private PhoneContactManagerImp jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp = null;
  private final QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private AbsListView.OnScrollListener jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener;
  private final ArrayList jdField_a_of_type_JavaUtilArrayList = new ArrayList();
  private final boolean jdField_a_of_type_Boolean;
  private final View.OnClickListener jdField_b_of_type_AndroidViewView$OnClickListener = new mnj(this);
  private ExpandableListView jdField_b_of_type_ComTencentWidgetExpandableListView;
  private final int e;
  private final int f;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SelectMemberBuddyListAdapter(Context paramContext, QQAppInterface paramQQAppInterface, ExpandableListView paramExpandableListView, View.OnClickListener paramOnClickListener)
  {
    super(paramContext, paramQQAppInterface, paramExpandableListView);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity = ((SelectMemberActivity)paramContext);
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp = ((PhoneContactManagerImp)paramQQAppInterface.getManager(10));
    jdField_b_of_type_ComTencentWidgetExpandableListView = paramExpandableListView;
    paramExpandableListView.post(new mnh(this));
    if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.k) {
      jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a(this);
    }
    e = ((int)DisplayUtils.a(jdField_a_of_type_AndroidContentContext, 12.0F));
    f = ((int)DisplayUtils.a(jdField_a_of_type_AndroidContentContext, 9.0F));
    if ((Build.MODEL.equals("Lenovo A366t")) && (Build.VERSION.SDK_INT == 10)) {}
    for (boolean bool = true;; bool = false)
    {
      jdField_a_of_type_Boolean = bool;
      return;
    }
  }
  
  private int a(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_JavaUtilArrayList.get(paramInt1)).group_id == 64530) {
      return 1;
    }
    if (jdField_a_of_type_JavaUtilArrayList.get(paramInt1)).group_id == 64531) {
      return 2;
    }
    return 0;
  }
  
  private View a(int paramInt1, int paramInt2, boolean paramBoolean, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject;
    Friends localFriends;
    if (paramView == null)
    {
      paramView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903738, paramViewGroup, false);
      paramViewGroup = new mno();
      jdField_d_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296683));
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296718));
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)paramView.findViewById(2131297677));
      if (jdField_a_of_type_AndroidViewView$OnClickListener != null) {
        paramView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      }
      paramView.findViewById(2131297675).setVisibility(8);
      paramView.setTag(paramViewGroup);
      localObject = getChild(paramInt1, paramInt2);
      localFriends = (Friends)localObject;
      jdField_a_of_type_JavaLangObject = localObject;
      jdField_b_of_type_JavaLangString = uin;
      a(paramViewGroup, null);
      jdField_d_of_type_AndroidWidgetImageView.setImageDrawable(null);
      localObject = ContactUtils.a(localFriends);
      jdField_d_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(jdField_b_of_type_JavaLangString)) {
        break label380;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
      label200:
      if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h == null) || (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h.contains(uin))) {
        break label392;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
    }
    for (;;)
    {
      if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity instanceof PhoneContactSelectActivity))
      {
        PhoneContactSelectActivity localPhoneContactSelectActivity = (PhoneContactSelectActivity)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity;
        if ((c != null) && (c.contains(uin)))
        {
          jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
          jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
        }
      }
      if ((AppSetting.i) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
      {
        if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
          break label404;
        }
        paramView.setContentDescription((String)localObject + "已选中");
      }
      return paramView;
      paramViewGroup = (mno)paramView.getTag();
      jdField_d_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
      break;
      label380:
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      break label200;
      label392:
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
    }
    label404:
    paramView.setContentDescription((String)localObject + "未选中");
    return paramView;
  }
  
  private void a(List paramList)
  {
    try
    {
      Collections.sort(paramList, jdField_a_of_type_Mnm);
      return;
    }
    catch (ArrayIndexOutOfBoundsException paramList)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("FriendTeamListInnerFrameBuddyListAdapter", 2, "", paramList);
    }
  }
  
  private View b(int paramInt1, int paramInt2, boolean paramBoolean, View paramView, ViewGroup paramViewGroup)
  {
    PhoneContact localPhoneContact;
    if (paramView == null)
    {
      paramView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903738, paramViewGroup, false);
      paramViewGroup = new mno();
      jdField_d_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296683));
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296718));
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)paramView.findViewById(2131297677));
      if (jdField_a_of_type_AndroidViewView$OnClickListener != null) {
        paramView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      }
      paramView.setTag(paramViewGroup);
      Object localObject = getChild(paramInt1, paramInt2);
      localPhoneContact = (PhoneContact)localObject;
      jdField_a_of_type_JavaLangObject = localObject;
      jdField_b_of_type_JavaLangString = mobileCode;
      a(paramViewGroup, null);
      jdField_d_of_type_AndroidWidgetImageView.setImageDrawable(null);
      jdField_d_of_type_AndroidWidgetTextView.setText(name);
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(jdField_b_of_type_JavaLangString)) {
        break label320;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
      label184:
      if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h == null) || ("0".equals(uin)) || (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h.contains(uin))) {
        break label332;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
    }
    for (;;)
    {
      if ((AppSetting.i) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
      {
        if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
          break label344;
        }
        paramView.setContentDescription(name + "已选中");
      }
      return paramView;
      paramViewGroup = (mno)paramView.getTag();
      jdField_d_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
      break;
      label320:
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      break label184;
      label332:
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
    }
    label344:
    paramView.setContentDescription(name + "未选中");
    return paramView;
  }
  
  private View c(int paramInt1, int paramInt2, boolean paramBoolean, View paramView, ViewGroup paramViewGroup)
  {
    if ((paramView == null) || ((paramView.getTag() instanceof mno)))
    {
      paramView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903455, paramViewGroup, false);
      paramViewGroup = new mnn();
      jdField_d_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296683));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131298607));
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131297636));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131298605));
      c = ((TextView)paramView.findViewById(2131298604));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131298606));
      e = ((TextView)paramView.findViewById(2131297640));
      paramView.setTag(paramViewGroup);
      if (jdField_a_of_type_AndroidViewView$OnClickListener == null) {
        break label483;
      }
      paramView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    }
    label483:
    for (;;)
    {
      Object localObject = getChild(paramInt1, paramInt2);
      PublicAccountInfo localPublicAccountInfo = (PublicAccountInfo)localObject;
      jdField_a_of_type_JavaLangObject = localObject;
      jdField_b_of_type_JavaLangString = Long.toString(uin);
      jdField_d_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidContentContext.getResources().getColorStateList(2131428173));
      if (PublicAccountInfo.isLooker(localPublicAccountInfo))
      {
        c.setVisibility(0);
        jdField_d_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_d_of_type_AndroidWidgetImageView.setImageDrawable(null);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
        e.setVisibility(8);
        if (AppSetting.i) {
          paramView.setContentDescription(jdField_d_of_type_AndroidWidgetTextView.getText());
        }
        return paramView;
        paramViewGroup = (mnn)paramView.getTag();
        jdField_d_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
      }
      else
      {
        c.setVisibility(8);
        jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
        e.setVisibility(0);
        jdField_d_of_type_AndroidWidgetTextView.setText(name);
        if (certifiedGrade > 0L)
        {
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
          jdField_a_of_type_AndroidWidgetImageView.setBackgroundResource(2130838643);
        }
        for (;;)
        {
          e.setText(summary);
          a(paramViewGroup, null);
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
          jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
          break;
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        }
      }
    }
  }
  
  private void c()
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
    if (localObject1 != null)
    {
      Object localObject3 = ((RecentUserProxy)localObject1).a(true);
      if (localObject3 != null)
      {
        Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        localObject1 = new ArrayList();
        localObject3 = ((List)localObject3).iterator();
        while (((Iterator)localObject3).hasNext())
        {
          Object localObject4 = (RecentUser)((Iterator)localObject3).next();
          if (localObject4 != null) {
            try
            {
              if ((type == 0) && (Long.parseLong(uin) >= 10000L) && (!uin.equals(localObject2)) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i.contains(uin)))
              {
                localObject4 = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).a(uin);
                if ((localObject4 != null) && (((Friends)localObject4).isFriend())) {
                  ((List)localObject1).add(localObject4);
                }
              }
            }
            catch (NumberFormatException localNumberFormatException) {}
          }
        }
        if (!((List)localObject1).isEmpty())
        {
          localObject2 = new Groups();
          group_id = 64528;
          group_name = jdField_a_of_type_AndroidContentContext.getString(2131367326);
          group_friend_count = ((List)localObject1).size();
          group_online_friend_count = ((List)localObject1).size();
          seqid = 0;
          sqqOnLine_count = 0;
          jdField_a_of_type_JavaUtilArrayList.add(localObject2);
          jdField_a_of_type_AndroidUtilSparseArray.put(group_id, localObject1);
        }
      }
    }
  }
  
  private void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.k) {}
    ArrayList localArrayList;
    do
    {
      do
      {
        int i;
        do
        {
          return;
          i = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
        } while ((!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.c()) && (i != 5));
        localObject = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a();
      } while (localObject == null);
      localArrayList = new ArrayList();
      localArrayList.addAll((Collection)localObject);
    } while (localArrayList.isEmpty());
    Object localObject = new Groups();
    group_id = 64531;
    group_name = jdField_a_of_type_AndroidContentContext.getString(2131370010);
    group_friend_count = 1;
    group_online_friend_count = 1;
    seqid = 0;
    sqqOnLine_count = 0;
    jdField_a_of_type_JavaUtilArrayList.add(localObject);
    jdField_a_of_type_AndroidUtilSparseArray.put(group_id, localArrayList);
  }
  
  private void e()
  {
    jdField_a_of_type_JavaUtilArrayList.clear();
    jdField_a_of_type_AndroidUtilSparseArray.clear();
    c();
    if ((!ConfigSystemImpl.b(jdField_a_of_type_AndroidContentContext)) || ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 10) && (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 11))) {
      d();
    }
    Object localObject1 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    Object localObject3;
    Object localObject2;
    if (localObject1 != null)
    {
      localObject1 = ((FriendsManager)localObject1).a();
      if ((localObject1 != null) && (((List)localObject1).size() != 0)) {
        break label710;
      }
      if (QLog.isColorLevel())
      {
        localObject3 = new StringBuilder().append("group list is ");
        if (localObject1 != null) {
          break label424;
        }
        localObject2 = "null";
        label121:
        QLog.d("FriendTeamListInnerFrameBuddyListAdapter", 2, (String)localObject2);
      }
      if (localObject1 != null) {
        break label710;
      }
      localObject1 = new ArrayList();
    }
    label424:
    label500:
    label511:
    label695:
    label698:
    label710:
    for (;;)
    {
      localObject2 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      ContactFacade localContactFacade = (ContactFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(53);
      if (localObject2 != null) {}
      for (localObject2 = ((FriendsManager)localObject2).c();; localObject2 = null)
      {
        Iterator localIterator = ((List)localObject1).iterator();
        Groups localGroups;
        while (localIterator.hasNext())
        {
          localGroups = (Groups)localIterator.next();
          if ((group_id != 64533) && (group_id != 64532) && (group_id != 64530))
          {
            jdField_a_of_type_JavaUtilArrayList.add(localGroups);
            if (localObject2 == null) {
              break label698;
            }
          }
        }
        for (localObject3 = localContactFacade.a(String.valueOf(group_id));; localObject3 = null)
        {
          if (localObject3 == null) {}
          Object localObject5;
          for (localObject3 = new ArrayList();; localObject3 = new ArrayList((Collection)localObject3))
          {
            if ((((List)localObject3).size() == 0) && (group_id == 64530)) {
              ((List)localObject3).add(PublicAccountInfo.createLooker(jdField_a_of_type_AndroidContentContext));
            }
            if (group_id == 64530) {
              break label500;
            }
            localObject4 = new ArrayList();
            localObject5 = ((List)localObject3).iterator();
            while (((Iterator)localObject5).hasNext()) {
              ((ArrayList)localObject4).add(new mnk((Friends)((Iterator)localObject5).next(), -1));
            }
            if (QLog.isColorLevel()) {
              QLog.d("FriendTeamListInnerFrameBuddyListAdapter", 2, "FriendManager is null");
            }
            localObject1 = null;
            break;
            localObject2 = "empty";
            break label121;
          }
          a((List)localObject4);
          ((List)localObject3).clear();
          Object localObject4 = ((ArrayList)localObject4).iterator();
          while (((Iterator)localObject4).hasNext()) {
            ((List)localObject3).add(nexta);
          }
          localObject4 = ((List)localObject3).iterator();
          int i = 0;
          if (((Iterator)localObject4).hasNext())
          {
            localObject5 = (Friends)((Iterator)localObject4).next();
            int j = ContactUtils.a(detalStatusFlag, iTermType);
            if ((j == 0) || (j == 6)) {
              break label695;
            }
            i += 1;
          }
          for (;;)
          {
            break label511;
            localObject4 = new ArrayList();
            i = 0;
            while (i < ((List)localObject3).size())
            {
              localObject5 = (Friends)((List)localObject3).get(i);
              if ((!uin.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i.contains(uin))) {
                ((ArrayList)localObject4).add(((List)localObject3).get(i));
              }
              i += 1;
            }
            jdField_a_of_type_AndroidUtilSparseArray.put(group_id, localObject4);
            break;
            if (!((List)localObject1).isEmpty()) {
              jdField_b_of_type_ComTencentWidgetExpandableListView.a(0);
            }
            return;
          }
        }
      }
    }
  }
  
  public int a()
  {
    return 2130903202;
  }
  
  public void a()
  {
    super.notifyDataSetChanged();
  }
  
  public void a(int paramInt)
  {
    notifyDataSetChanged();
  }
  
  public void a(long paramLong) {}
  
  public void a(View paramView, int paramInt)
  {
    mnl localMnl = (mnl)paramView.getTag();
    if (localMnl == null)
    {
      localMnl = new mnl();
      paramView.findViewById(2131297603).setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131297605));
      paramView.setTag(localMnl);
    }
    for (;;)
    {
      Groups localGroups = (Groups)getGroup(paramInt);
      jdField_a_of_type_AndroidWidgetTextView.setText(group_name);
      ((CheckBox)paramView.findViewById(2131297603)).setChecked(jdField_b_of_type_ComTencentWidgetExpandableListView.e(paramInt));
      return;
    }
  }
  
  public void a(AbsListView.OnScrollListener paramOnScrollListener)
  {
    jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener = paramOnScrollListener;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    super.a(paramAbsListView, paramInt);
    if (jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener != null) {
      jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener.a(paramAbsListView, paramInt);
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    super.a(paramAbsListView, paramInt1, paramInt2, paramInt3);
    if (jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener != null) {
      jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener.a(paramAbsListView, paramInt1, paramInt2, paramInt3);
    }
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FriendTeamListInnerFrameBuddyListAdapter", 2, "onRecommendCountChanged count=" + paramInt);
    }
    notifyDataSetChanged();
  }
  
  public boolean a(int paramInt)
  {
    return getGroupgroup_id == 0;
  }
  
  public void b()
  {
    if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.k) {
      jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.b(this);
    }
    super.b();
  }
  
  public void b(int paramInt) {}
  
  public void c(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FriendTeamListInnerFrameBuddyListAdapter", 2, "onUpdateContactList, " + paramInt);
    }
    notifyDataSetChanged();
  }
  
  public Object getChild(int paramInt1, int paramInt2)
  {
    return ((List)jdField_a_of_type_AndroidUtilSparseArray.get(jdField_a_of_type_JavaUtilArrayList.get(paramInt1)).group_id)).get(paramInt2);
  }
  
  public long getChildId(int paramInt1, int paramInt2)
  {
    Object localObject = getChild(paramInt1, paramInt2);
    if ((localObject instanceof Friends))
    {
      localObject = (Friends)localObject;
      try
      {
        l = Long.parseLong(uin);
        return l;
      }
      catch (Throwable localThrowable)
      {
        if (QLog.isColorLevel()) {
          QLog.i("FriendTeamListInnerFrameBuddyListAdapter", 2, QLog.getStackTraceString(localThrowable));
        }
      }
    }
    while (!(localThrowable instanceof PublicAccountInfo))
    {
      long l;
      return 0L;
    }
    return uin;
  }
  
  public int getChildType(int paramInt1, int paramInt2)
  {
    return a(paramInt1, paramInt2);
  }
  
  public int getChildTypeCount()
  {
    return 3;
  }
  
  public View getChildView(int paramInt1, int paramInt2, boolean paramBoolean, View paramView, ViewGroup paramViewGroup)
  {
    TraceUtils.a("getChildView");
    if (a(paramInt1, paramInt2) == 0) {
      paramView = a(paramInt1, paramInt2, paramBoolean, paramView, paramViewGroup);
    }
    for (;;)
    {
      TraceUtils.a();
      return paramView;
      if (a(paramInt1, paramInt2) == 2) {
        paramView = b(paramInt1, paramInt2, paramBoolean, paramView, paramViewGroup);
      } else {
        paramView = c(paramInt1, paramInt2, paramBoolean, paramView, paramViewGroup);
      }
    }
  }
  
  public int getChildrenCount(int paramInt)
  {
    Groups localGroups = (Groups)jdField_a_of_type_JavaUtilArrayList.get(paramInt);
    if ((localGroups == null) || (jdField_a_of_type_AndroidUtilSparseArray.get(group_id) == null)) {
      return 0;
    }
    return ((List)jdField_a_of_type_AndroidUtilSparseArray.get(jdField_a_of_type_JavaUtilArrayList.get(paramInt)).group_id)).size();
  }
  
  public Object getGroup(int paramInt)
  {
    return jdField_a_of_type_JavaUtilArrayList.get(paramInt);
  }
  
  public int getGroupCount()
  {
    return jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public long getGroupId(int paramInt)
  {
    return getGroupgroup_id;
  }
  
  public View getGroupView(int paramInt, boolean paramBoolean, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject;
    if (paramView != null)
    {
      localObject = (mnl)paramView.getTag();
      paramViewGroup = paramView;
      paramView = (View)localObject;
      localObject = (Groups)getGroup(paramInt);
      jdField_a_of_type_Int = paramInt;
      jdField_a_of_type_AndroidWidgetTextView.setText(group_name);
      if (AppSetting.i)
      {
        if (!paramBoolean) {
          break label150;
        }
        paramViewGroup.setContentDescription(group_name + "分组已展开");
      }
    }
    for (;;)
    {
      paramViewGroup.setOnLongClickListener(this);
      return paramViewGroup;
      paramViewGroup = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903737, paramViewGroup, false);
      paramView = new mnl();
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131297605));
      paramViewGroup.setTag(paramView);
      paramViewGroup.setOnClickListener(this);
      break;
      label150:
      paramViewGroup.setContentDescription(group_name + "分组已折叠");
    }
  }
  
  public boolean hasStableIds()
  {
    return false;
  }
  
  public boolean isChildSelectable(int paramInt1, int paramInt2)
  {
    return true;
  }
  
  public void notifyDataSetChanged()
  {
    e();
    super.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    paramView = (mnl)paramView.getTag();
    if (jdField_a_of_type_ComTencentWidgetExpandableListView.e(jdField_a_of_type_Int))
    {
      jdField_a_of_type_ComTencentWidgetExpandableListView.b(jdField_a_of_type_Int);
      return;
    }
    try
    {
      jdField_a_of_type_ComTencentWidgetExpandableListView.a(jdField_a_of_type_Int);
      paramView = (Groups)getGroup(jdField_a_of_type_Int);
      if (group_id == 64528)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005442", "0X8005442", 0, 0, "", "", "", "");
        return;
      }
      if (group_id == 64531)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005444", "0X8005444", 0, 0, "", "", "", "");
        return;
      }
      if (group_id == 0)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005443", "0X8005443", 0, 0, "", "", "", "");
        return;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005445", "0X8005445", 0, 0, "", "", "", "");
      return;
    }
    catch (Throwable paramView) {}
  }
  
  public boolean onLongClick(View paramView)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    localQQCustomMenu.a(0, jdField_a_of_type_AndroidContentContext.getResources().getString(2131369426));
    BubbleContextMenu.a(paramView, localQQCustomMenu, jdField_b_of_type_AndroidViewView$OnClickListener, new mni(this));
    return true;
  }
}
