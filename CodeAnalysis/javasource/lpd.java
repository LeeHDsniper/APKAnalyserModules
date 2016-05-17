import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.ProfileActivity.CardContactInfo;
import com.tencent.mobileqq.activity.UncommonlyUsedContactsActivity;
import com.tencent.mobileqq.activity.contact.SearchResultDialog;
import com.tencent.mobileqq.activity.specialcare.QQSpecialFriendSettingActivity;
import com.tencent.mobileqq.adapter.ContactsSearchResultAdapter;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.SearchHistory;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.ContactSearchableDiscussion;
import com.tencent.mobileqq.search.ContactSearchableFriend;
import com.tencent.mobileqq.search.ContactSearchablePublicAccount;
import com.tencent.mobileqq.search.ContactSearchableSearchHistory;
import com.tencent.mobileqq.search.ContactSearchableTroop;
import com.tencent.mobileqq.search.ContactsSearchableCircleBuddy;
import com.tencent.mobileqq.search.ContactsSearchablePhoneContact;
import com.tencent.mobileqq.search.ContactsSearchableRecentUser;
import com.tencent.mobileqq.search.IContactSearchable;
import com.tencent.mobileqq.search.SearchAdapterInterface;
import com.tencent.mobileqq.search.SearchableDiscussionMember;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.util.ThreadPriorityManager;
import com.tencent.mobileqq.utils.ChnToSpell;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import java.util.ArrayList;

public class lpd
  implements AdapterView.OnItemClickListener
{
  public lpd(SearchResultDialog paramSearchResultDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    Object localObject1;
    boolean bool;
    Object localObject2;
    if (!TextUtils.isEmpty(SearchResultDialog.a(a)))
    {
      localObject1 = ChnToSpell.a(SearchResultDialog.a(a), 1).toLowerCase();
      if (!SearchResultDialog.a(a).equalsIgnoreCase((String)localObject1))
      {
        bool = true;
        StatisticCollector.a(BaseApplicationImpl.a()).a(null, "SearchChineseKeyword", bool, 0L, 0L, null, "", true);
      }
    }
    else
    {
      ThreadPriorityManager.a(true);
      localObject2 = null;
      if (paramAdapterView != SearchResultDialog.a(a)) {
        break label920;
      }
      if (SearchResultDialog.a(a) != null) {
        break label102;
      }
    }
    label102:
    label920:
    label1219:
    label1408:
    label2855:
    label2914:
    label3354:
    label3443:
    for (;;)
    {
      return;
      bool = false;
      break;
      paramAdapterView = (IContactSearchable)SearchResultDialog.a(a).getItem(paramInt);
      if ((paramAdapterView instanceof ContactSearchableSearchHistory))
      {
        paramView = ((ContactSearchableSearchHistory)paramAdapterView).a();
        if (type == 56938) {
          if (16 == SearchResultDialog.a(a)) {
            a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, type, displayName, troopUin);
          }
        }
        Object localObject3;
        for (;;)
        {
          ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "Search", "May_find", a.b(SearchResultDialog.a(a)), 0, "", "", "", "");
          return;
          localObject1 = new ProfileActivity.AllInOne(uin, 33);
          a = new ArrayList();
          k = displayName;
          if (!TextUtils.isEmpty(uin))
          {
            paramView = uin.split("\\|");
            if (paramView != null)
            {
              paramInt = 0;
              if (paramInt < paramView.length)
              {
                localObject2 = a;
                localObject3 = new StringBuilder().append("电话");
                if (paramView.length > 0) {}
                for (paramAdapterView = Integer.valueOf(paramInt + 1);; paramAdapterView = "")
                {
                  ((ArrayList)localObject2).add(new ProfileActivity.CardContactInfo(paramAdapterView, paramView[paramInt], null));
                  paramInt += 1;
                  break;
                }
              }
            }
          }
          f = 3;
          ProfileActivity.b(SearchResultDialog.a(a), (ProfileActivity.AllInOne)localObject1);
          continue;
          if (SearchResultDialog.a(a) == 0)
          {
            paramAdapterView = null;
            switch (type)
            {
            }
            for (;;)
            {
              if (paramAdapterView != null)
              {
                ProfileActivity.b(SearchResultDialog.a(a), paramAdapterView);
                a.dismiss();
                paramAdapterView = (FriendsManager)SearchResultDialog.a(a).getManager(50);
                if (paramAdapterView == null) {
                  break;
                }
                paramAdapterView = paramAdapterView.c(uin);
                if ((paramAdapterView == null) || (gathtertype != 1)) {
                  break;
                }
                if ((SearchResultDialog.a(a) instanceof UncommonlyUsedContactsActivity))
                {
                  ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "0X8004C58", "0X8004C58", 3, 0, "", "", "", "");
                  break;
                  paramAdapterView = new ProfileActivity.AllInOne(uin, 1);
                  continue;
                  paramAdapterView = new ProfileActivity.AllInOne(uin, 31);
                  a = new ArrayList();
                  k = displayName;
                  continue;
                  paramAdapterView = new ProfileActivity.AllInOne(uin, 71);
                  n = displayName;
                  continue;
                  paramAdapterView = new ProfileActivity.AllInOne(uin, 71);
                  jdField_d_of_type_JavaLangString = troopUin;
                  continue;
                  paramAdapterView = new ProfileActivity.AllInOne(uin, 47);
                  jdField_d_of_type_JavaLangString = troopUin;
                  continue;
                }
                ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "0X8004C58", "0X8004C58", 1, 0, "", "", "", "");
                break;
              }
            }
            a.b(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, type, displayName, troopUin);
          }
          else if (4 == SearchResultDialog.a(a))
          {
            a.b(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, type, displayName, troopUin);
          }
          else if (16 == SearchResultDialog.a(a))
          {
            if (1 == type) {
              a.b(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, type, displayName, troopUin);
            } else {
              a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, type, displayName, troopUin);
            }
          }
        }
        if (paramAdapterView == SearchResultDialog.b(a))
        {
          if (SearchResultDialog.a(a) != null) {
            localObject2 = (IContactSearchable)SearchResultDialog.a(a).getItem(paramInt);
          }
        }
        else if (localObject2 != null)
        {
          if ((12 == SearchResultDialog.a(a)) && ((localObject2 instanceof ContactSearchableFriend)))
          {
            paramAdapterView = ((ContactSearchableFriend)localObject2).a();
            if (SearchResultDialog.a(a).a(uin) != null)
            {
              QQToast.a(SearchResultDialog.a(a), SearchResultDialog.a(a).getString(2131370696), 0).b(((BaseActivity)SearchResultDialog.a(a)).getTitleBarHeight());
              return;
            }
            paramView = new Intent(SearchResultDialog.a(a), QQSpecialFriendSettingActivity.class);
            paramView.putExtra("key_friend_uin", uin);
            paramView.putExtra("key_is_from_friendsforward_activity", true);
            SearchResultDialog.a(a).startActivity(paramView);
            a.dismiss();
            return;
          }
          int i;
          if ((SearchResultDialog.a(a) == 7) || (SearchResultDialog.a(a) == 8) || (SearchResultDialog.a(a) == 9) || (SearchResultDialog.a(a) == 6) || (SearchResultDialog.a(a) == 10) || (SearchResultDialog.a(a) == 11) || (SearchResultDialog.a(a) == 14))
          {
            paramAdapterView = (TextView)paramView.findViewById(2131297391);
            if (paramAdapterView != null)
            {
              localObject1 = paramAdapterView.getText().toString();
              paramInt = ForwardAbility.ForwardAbilityType.a.intValue();
              if (!(localObject2 instanceof ContactSearchableFriend)) {
                break label1408;
              }
              paramView = auin;
              paramInt = ForwardAbility.ForwardAbilityType.b.intValue();
              i = 0;
              paramAdapterView = paramView;
            }
          }
          for (;;)
          {
            if (StringUtil.b(paramView)) {
              break label3443;
            }
            localObject2 = new Bundle();
            ((Bundle)localObject2).putString("uin", paramView);
            ((Bundle)localObject2).putInt("uintype", i);
            ((Bundle)localObject2).putString("uinname", (String)localObject1);
            ((Bundle)localObject2).putString("troop_uin", paramAdapterView);
            SearchResultDialog.a(a).a(paramInt, (Bundle)localObject2);
            SearchResultDialog.a(a).e();
            paramInt = a.b(SearchResultDialog.a(a));
            ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "Search", "Search_into_AIO", paramInt, 0, String.valueOf(a.a(i)), String.valueOf(paramInt), "", "");
            a.dismiss();
            return;
            localObject1 = "";
            break label1219;
            if ((localObject2 instanceof ContactSearchableTroop))
            {
              paramView = atroopuin;
              paramInt = ForwardAbility.ForwardAbilityType.c.intValue();
              i = 1;
              paramAdapterView = paramView;
            }
            else if ((localObject2 instanceof ContactSearchableDiscussion))
            {
              paramView = auin;
              paramInt = ForwardAbility.ForwardAbilityType.d.intValue();
              i = 3000;
              paramAdapterView = paramView;
            }
            else if ((localObject2 instanceof ContactsSearchableRecentUser))
            {
              localObject3 = ((ContactsSearchableRecentUser)localObject2).a();
              localObject2 = uin;
              paramAdapterView = troopUin;
              paramView = (TextView)paramView.findViewById(16908308);
              if (paramView != null) {
                localObject1 = paramView.getText().toString();
              }
              i = type;
              paramView = (View)localObject2;
            }
            else
            {
              if ((localObject2 instanceof ContactsSearchablePhoneContact))
              {
                paramAdapterView = ((ContactsSearchablePhoneContact)localObject2).a();
                if ((TextUtils.isEmpty(uin)) || (uin.equals("0"))) {
                  paramAdapterView = nationCode + mobileCode;
                }
                for (paramInt = 1006;; paramInt = 0)
                {
                  int j = ForwardAbility.ForwardAbilityType.i.intValue();
                  i = paramInt;
                  paramInt = j;
                  paramView = paramAdapterView;
                  paramAdapterView = "";
                  break;
                  paramAdapterView = uin;
                }
              }
              if ((localObject2 instanceof SearchableDiscussionMember))
              {
                paramAdapterView = (DiscussionMemberInfo)((SearchableDiscussionMember)localObject2).a();
                paramView = memberUin;
                paramAdapterView = discussionUin;
                paramInt = ForwardAbility.ForwardAbilityType.j.intValue();
                i = 1004;
              }
              else
              {
                if ((localObject2 instanceof ContactsSearchableCircleBuddy))
                {
                  paramAdapterView = ((ContactsSearchableCircleBuddy)localObject2).a();
                  paramView = uin;
                  paramAdapterView = uin;
                  paramInt = ForwardAbility.ForwardAbilityType.h.intValue();
                  ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "Network_circle", "Search_circle_clk", 83, 0, "", "", "", "");
                  i = 1021;
                  continue;
                  if ((localObject2 instanceof ContactSearchableFriend))
                  {
                    paramAdapterView = ((ContactSearchableFriend)localObject2).a();
                    if (SearchResultDialog.a(a) == 16)
                    {
                      a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, 0, ContactUtils.a(paramAdapterView), null);
                      return;
                    }
                    a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, 0, ContactUtils.a(paramAdapterView));
                    return;
                  }
                  if ((localObject2 instanceof ContactSearchableTroop))
                  {
                    paramAdapterView = ((ContactSearchableTroop)localObject2).a();
                    a.b(SearchResultDialog.a(a), SearchResultDialog.a(a), troopuin, 1, troopname, troopcode);
                    return;
                  }
                  if ((localObject2 instanceof ContactSearchableDiscussion))
                  {
                    paramAdapterView = ((ContactSearchableDiscussion)localObject2).a();
                    if (SearchResultDialog.a(a) == 16)
                    {
                      a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, 3000, discussionName, null);
                      return;
                    }
                    a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), uin, 3000, discussionName);
                    return;
                  }
                  if ((localObject2 instanceof SearchableDiscussionMember))
                  {
                    paramAdapterView = (DiscussionMemberInfo)((SearchableDiscussionMember)localObject2).a();
                    if (SearchResultDialog.a(a) == 16)
                    {
                      a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), memberUin, 1004, inteRemark, discussionUin);
                      return;
                    }
                    a.b(SearchResultDialog.a(a), SearchResultDialog.a(a), memberUin, 1004, inteRemark, discussionUin);
                    return;
                  }
                  if ((localObject2 instanceof ContactSearchablePublicAccount))
                  {
                    paramAdapterView = (PublicAccountInfo)((IContactSearchable)localObject2).a();
                    a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), String.valueOf(uin), 1008, name);
                    a.dismiss();
                    return;
                  }
                  if ((localObject2 instanceof ContactsSearchableRecentUser))
                  {
                    if (SearchResultDialog.b(a) == null) {
                      break;
                    }
                    localObject1 = a;
                    if ((SearchResultDialog.a(a) == 16) && (uin != null) && (type != 1008))
                    {
                      a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), String.valueOf(uin), type, ((ContactsSearchableRecentUser)localObject2).a(), null);
                      return;
                    }
                    com.tencent.mobileqq.activity.recent.RecentUtil.a = true;
                    SearchResultDialog.b(a).a(paramAdapterView, paramView, paramInt, paramLong);
                    if (((uin == null) || (uin.length() != 4)) && (!AppConstants.ar.equals(uin)) && (type != 7000) && (type != 1008)) {
                      break;
                    }
                    a.dismiss();
                    return;
                  }
                  if ((localObject2 instanceof ContactsSearchablePhoneContact))
                  {
                    localObject1 = ((ContactsSearchablePhoneContact)localObject2).a();
                    if ((TextUtils.isEmpty(uin)) || (SearchResultDialog.a(a) == 0) || (SearchResultDialog.a(a) == 5) || (SearchResultDialog.a(a) == 15))
                    {
                      if (TextUtils.isEmpty(uin))
                      {
                        paramView = new ProfileActivity.AllInOne(nationCode + mobileCode, 33);
                        a = new ArrayList();
                        k = name;
                        h = nickName;
                        localObject2 = mobileNo.split("\\|");
                        paramInt = 0;
                        if (paramInt < localObject2.length)
                        {
                          localObject3 = a;
                          StringBuilder localStringBuilder = new StringBuilder().append("电话");
                          if (localObject2.length > 0) {}
                          for (paramAdapterView = Integer.valueOf(paramInt + 1);; paramAdapterView = "")
                          {
                            ((ArrayList)localObject3).add(new ProfileActivity.CardContactInfo(paramAdapterView, localObject2[paramInt], nationCode));
                            paramInt += 1;
                            break;
                          }
                        }
                        jdField_d_of_type_Int = ability;
                        f = 3;
                        paramAdapterView = paramView;
                        if (!TextUtils.isEmpty(uin)) {
                          break label2855;
                        }
                        paramView = mobileNo;
                        paramInt = 56938;
                      }
                      for (;;)
                      {
                        if ((SearchResultDialog.a(a) != 16) && (SearchResultDialog.a(a) != 5)) {
                          break label2914;
                        }
                        a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), paramView, paramInt, name, null);
                        return;
                        if (!uin.equals("0"))
                        {
                          paramAdapterView = new ProfileActivity.AllInOne(uin, 1);
                          break;
                        }
                        paramAdapterView = nationCode + mobileCode;
                        if (originBinder == 3L) {}
                        for (paramInt = 32;; paramInt = 31)
                        {
                          paramAdapterView = new ProfileActivity.AllInOne(paramAdapterView, paramInt);
                          a = new ArrayList();
                          h = nickName;
                          k = name;
                          a.add(new ProfileActivity.CardContactInfo(name, mobileCode, nationCode));
                          jdField_d_of_type_Int = ability;
                          f = 3;
                          break;
                        }
                        if (uin.equals("0"))
                        {
                          paramView = nationCode + mobileCode;
                          paramInt = 1006;
                        }
                        else
                        {
                          paramView = uin;
                          paramInt = 0;
                        }
                      }
                      ProfileActivity.b(SearchResultDialog.a(a), paramAdapterView);
                      if (SearchResultDialog.a(a) != 15)
                      {
                        paramInt = a.b(SearchResultDialog.a(a));
                        ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "Search", "Search_into_AIO", paramInt, 0, String.valueOf(a.a(1006)), String.valueOf(paramInt), "", "");
                      }
                      a.dismiss();
                      return;
                    }
                    if (uin.equals("0")) {
                      paramAdapterView = nationCode + mobileCode;
                    }
                    for (paramInt = 1006; SearchResultDialog.a(a) == 16; paramInt = 0)
                    {
                      a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), paramAdapterView, paramInt, name, null);
                      return;
                      paramAdapterView = uin;
                    }
                    a.a(SearchResultDialog.a(a), SearchResultDialog.a(a), paramAdapterView, paramInt, name);
                    return;
                  }
                  if (!(localObject2 instanceof ContactsSearchableCircleBuddy)) {
                    break;
                  }
                  paramAdapterView = (CircleBuddy)((IContactSearchable)localObject2).a();
                  if (SearchResultDialog.a(a) == 4)
                  {
                    paramView = new Intent(SearchResultDialog.a(a), ChatActivity.class);
                    paramView.putExtra("uin", uin);
                    paramView.putExtra("uinname", SearchResultDialog.a(a).a(paramAdapterView));
                    paramView.putExtra("uintype", 1021);
                    SearchResultDialog.a(a).startActivity(paramView);
                  }
                  for (i = 1;; i = 0)
                  {
                    if (SearchResultDialog.a(a) != 13) {
                      break label3354;
                    }
                    ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "P_prof", "Prof_in_client", 84, 0, "", "", "", "");
                    if ((i != 0) && (SearchResultDialog.b(a))) {
                      break;
                    }
                    a.dismiss();
                    return;
                    paramView = new ProfileActivity.AllInOne(uin, 71);
                    n = remark;
                    h = nickName;
                    g = 84;
                    ProfileActivity.b(SearchResultDialog.a(a), paramView);
                  }
                  paramInt = 0;
                  switch (SearchResultDialog.a(a))
                  {
                  }
                  for (;;)
                  {
                    ReportController.b(SearchResultDialog.a(a), "CliOper", "", "", "Network_circle", "Search_circle_clk", paramInt, 0, "", "", "", "");
                    break;
                    paramInt = 81;
                    continue;
                    paramInt = 59;
                  }
                }
                i = -1;
                paramAdapterView = null;
                paramView = null;
              }
            }
          }
        }
      }
    }
  }
}
