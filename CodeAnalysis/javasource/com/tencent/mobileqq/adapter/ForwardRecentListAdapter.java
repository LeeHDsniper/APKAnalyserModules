package com.tencent.mobileqq.adapter;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.app.CardHandler;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.widget.XListView;
import java.util.List;

public class ForwardRecentListAdapter
  extends FacePreloadBaseAdapter
{
  private Context jdField_a_of_type_AndroidContentContext;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  CardHandler jdField_a_of_type_ComTencentMobileqqAppCardHandler;
  private CircleManager jdField_a_of_type_ComTencentMobileqqAppCircleManager;
  private DiscussionManager jdField_a_of_type_ComTencentMobileqqAppDiscussionManager;
  private FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private TroopManager jdField_a_of_type_ComTencentMobileqqAppTroopManager;
  private List jdField_a_of_type_JavaUtilList;
  
  public ForwardRecentListAdapter(Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView, List paramList, View.OnClickListener paramOnClickListener)
  {
    super(paramContext, paramQQAppInterface, paramXListView, 1, false);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = paramList;
    a(paramQQAppInterface);
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
  }
  
  protected Object a(int paramInt)
  {
    RecentUser localRecentUser = (RecentUser)getItem(paramInt);
    FacePreloadBaseAdapter.FaceInfo localFaceInfo = new FacePreloadBaseAdapter.FaceInfo(this);
    jdField_a_of_type_JavaLangString = uin;
    jdField_a_of_type_Int = 1;
    return localFaceInfo;
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppCardHandler = ((CardHandler)paramQQAppInterface.a(2));
    jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)paramQQAppInterface.getManager(50));
    jdField_a_of_type_ComTencentMobileqqAppTroopManager = ((TroopManager)paramQQAppInterface.getManager(51));
    jdField_a_of_type_ComTencentMobileqqAppDiscussionManager = ((DiscussionManager)paramQQAppInterface.getManager(52));
    jdField_a_of_type_ComTencentMobileqqAppCircleManager = ((CircleManager)paramQQAppInterface.getManager(34));
  }
  
  public void a(List paramList)
  {
    jdField_a_of_type_JavaUtilList = paramList;
    super.notifyDataSetChanged();
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    return jdField_a_of_type_JavaUtilList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = null;
    int i = 1;
    View localView;
    ForwardRecentListAdapter.ForwardViewHolder localForwardViewHolder;
    String str;
    if (paramView == null)
    {
      localView = View.inflate(jdField_a_of_type_AndroidContentContext, 2130904726, null);
      localForwardViewHolder = new ForwardRecentListAdapter.ForwardViewHolder();
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297636));
      jdField_a_of_type_AndroidWidgetTextView.setMaxWidth(Integer.MAX_VALUE);
      jdField_a_of_type_AndroidWidgetTextView.getLayoutParams().width = -1;
      d = ((ImageView)localView.findViewById(2131296683));
      d.setClickable(false);
      d.setFocusable(false);
      d.setLongClickable(false);
      localView.setTag(localForwardViewHolder);
      localView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      paramView = (RecentUser)jdField_a_of_type_JavaUtilList.get(paramInt);
      jdField_a_of_type_ComTencentMobileqqDataRecentUser = paramView;
      str = uin;
      paramInt = type;
    }
    switch (type)
    {
    default: 
      paramView = null;
      paramInt = i;
    case 6002: 
    case 1008: 
      for (;;)
      {
        paramViewGroup = paramView;
        if (TextUtils.isEmpty(paramView)) {
          paramViewGroup = str;
        }
        jdField_a_of_type_AndroidWidgetTextView.setText(paramViewGroup);
        jdField_a_of_type_JavaLangString = paramViewGroup;
        c = paramInt;
        b = str;
        d.setImageBitmap(a(paramInt, str));
        return localView;
        localForwardViewHolder = (ForwardRecentListAdapter.ForwardViewHolder)paramView.getTag();
        localView = paramView;
        break;
        paramView = displayName;
        paramInt = 104;
        continue;
        PublicAccountInfo localPublicAccountInfo = ((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).b(str);
        paramView = paramViewGroup;
        if (localPublicAccountInfo != null) {
          paramView = name;
        }
        paramInt = i;
      }
    case 1006: 
      paramView = ContactUtils.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str);
      paramViewGroup = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).c(str);
      if (paramViewGroup != null) {
        paramView = name;
      }
      for (;;)
      {
        paramInt = 11;
        break;
        if (paramView != null) {
          paramView = ContactUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramView, true);
        } else {
          paramView = str;
        }
      }
    case 0: 
    case 1000: 
    case 1001: 
    case 1003: 
    case 1004: 
    case 1005: 
    case 1020: 
    case 1022: 
    case 1023: 
    case 1024: 
    case 1025: 
      paramViewGroup = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.c(str);
      if ((paramViewGroup == null) || (uin == null) || (uin.length() <= 0)) {
        break;
      }
    }
    for (paramViewGroup = ContactUtils.a(paramViewGroup);; paramViewGroup = null)
    {
      if ((paramInt == 1000) || (paramInt == 1020))
      {
        paramViewGroup = jdField_a_of_type_ComTencentMobileqqAppTroopManager.b(troopUin);
        paramViewGroup = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str, paramViewGroup, troopUin, true, null);
      }
      for (;;)
      {
        if (paramViewGroup != null)
        {
          paramView = paramViewGroup;
          paramInt = i;
          if (!"".equals(paramViewGroup)) {
            break;
          }
        }
        paramView = ContactUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str, true);
        paramInt = i;
        break;
        if (paramInt == 1004) {
          paramViewGroup = ContactUtils.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, troopUin, str);
        }
      }
      paramView = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(str);
      if (paramView != null) {}
      for (paramViewGroup = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(paramView);; paramViewGroup = null)
      {
        if (paramViewGroup != null)
        {
          paramView = paramViewGroup;
          paramInt = i;
          if (!"".equals(paramViewGroup)) {
            break;
          }
        }
        paramView = ContactUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str, true);
        paramInt = i;
        break;
        paramViewGroup = jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(str);
        i = 4;
        if (paramViewGroup != null) {}
        for (paramViewGroup = troopname;; paramViewGroup = displayName)
        {
          if (paramViewGroup != null)
          {
            paramView = paramViewGroup;
            paramInt = i;
            if (!paramViewGroup.trim().equals("")) {
              break;
            }
          }
          paramView = str;
          paramInt = i;
          break;
        }
        paramViewGroup = jdField_a_of_type_ComTencentMobileqqAppDiscussionManager.a(str);
        if (paramViewGroup == null) {}
        for (paramView = displayName;; paramView = discussionName)
        {
          paramViewGroup = paramView;
          if (TextUtils.isEmpty(paramView)) {
            paramViewGroup = jdField_a_of_type_AndroidContentContext.getResources().getString(2131367987);
          }
          paramInt = 101;
          paramView = paramViewGroup;
          break;
        }
      }
    }
  }
  
  public boolean isEnabled(int paramInt)
  {
    return false;
  }
}
