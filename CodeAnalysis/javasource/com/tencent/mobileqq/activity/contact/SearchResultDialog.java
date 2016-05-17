package com.tencent.mobileqq.activity.contact;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler.Callback;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsFragment;
import com.tencent.mobileqq.adapter.ContactsSearchResultAdapter;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.ContactFacade;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SearchHistoryManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.Groups;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.SearchHistory;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.memoryleak.ActivityLeakSolution;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.qcall.QCallDetailActivity;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.mobileqq.search.ContactSearchableFriend;
import com.tencent.mobileqq.search.ContactSearchablePublicAccount;
import com.tencent.mobileqq.search.ContactSearchableSearchHistory;
import com.tencent.mobileqq.search.ContactSearchableTroop;
import com.tencent.mobileqq.search.ContactsSearchablePhoneContact;
import com.tencent.mobileqq.search.ContactsSearchableRecentUser;
import com.tencent.mobileqq.search.IContactSearchable;
import com.tencent.mobileqq.search.SearchAdapterInterface;
import com.tencent.mobileqq.search.SearchableDiscussionMember;
import com.tencent.mobileqq.search.SearchableTroopMember;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import com.tencent.util.VersionUtils;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.XListView;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import lpc;
import lpd;
import lpe;
import lpf;
import lpg;
import lph;
import lpi;
import lpj;
import lpk;
import lpl;
import mqq.app.MobileQQ;

public class SearchResultDialog
  extends Dialog
  implements Handler.Callback
{
  public static final int a = 1;
  public static final String a = "SearchResultDialog";
  public static final int b = 2;
  public static final String b = "search_keyword";
  public static final int c = 3;
  public static final String c = "circle_contacts_search_count";
  public static final int d = 4;
  public static final int e = 5;
  public static final int f = 6;
  public static final int g = 7;
  public static final int h = 8;
  public static final int i = 9;
  public static final int j = 10;
  private static final int k = 555;
  private static final int l = 556;
  private static final int m = 1;
  private static final int n = 2;
  long jdField_a_of_type_Long;
  private Context jdField_a_of_type_AndroidContentContext;
  private LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private SearchContactsFragment jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment;
  private ContactsSearchResultAdapter jdField_a_of_type_ComTencentMobileqqAdapterContactsSearchResultAdapter;
  private CircleManager jdField_a_of_type_ComTencentMobileqqAppCircleManager;
  private FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private QQMessageFacade jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
  private ForwardBaseOption jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption;
  private SearchAdapterInterface jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface;
  private MqqWeakReferenceHandler jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler;
  private AdapterView.OnItemClickListener jdField_a_of_type_ComTencentWidgetAdapterView$OnItemClickListener;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private List jdField_a_of_type_JavaUtilList;
  private Map jdField_a_of_type_JavaUtilMap;
  private boolean jdField_a_of_type_Boolean;
  private AdapterView.OnItemClickListener jdField_b_of_type_ComTencentWidgetAdapterView$OnItemClickListener;
  private XListView jdField_b_of_type_ComTencentWidgetXListView;
  private List jdField_b_of_type_JavaUtilList;
  private boolean jdField_b_of_type_Boolean;
  private String d;
  private String e;
  private int o;
  private int p;
  
  public SearchResultDialog(Context paramContext, QQAppInterface paramQQAppInterface, int paramInt1, int paramInt2)
  {
    super(paramContext, 2131558915);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = null;
    e = null;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_ComTencentWidgetAdapterView$OnItemClickListener = new lpd(this);
    p = paramInt2;
    AIOUtils.l = false;
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "SearchResultDialog() from = " + paramInt1);
    }
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade = paramQQAppInterface.a();
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    o = paramInt1;
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler = new MqqWeakReferenceHandler(this);
    if (jdField_a_of_type_ComTencentMobileqqAppFriendsManager == null) {
      jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)paramQQAppInterface.getManager(50));
    }
    requestWindowFeature(1);
    getWindow().setSoftInputMode(36);
    if (!VersionUtils.e()) {
      getWindow().setBackgroundDrawable(new ColorDrawable());
    }
    for (;;)
    {
      setContentView(2130903211);
      findViewById(2131297661).setOnClickListener(new lpc(this));
      Object localObject = getWindow().getAttributes();
      x = 0;
      y = 0;
      width = -1;
      windowAnimations = 16973824;
      gravity = 51;
      if (ImmersiveUtils.isSupporImmersive() == 1)
      {
        getWindow().addFlags(67108864);
        new SystemBarCompact(this, true, jdField_a_of_type_AndroidContentContext.getResources().getColor(2131428205)).init();
        localObject = (LinearLayout)findViewById(2131297661);
        ((LinearLayout)localObject).setFitsSystemWindows(true);
        ((LinearLayout)localObject).setPadding(0, ImmersiveUtils.b(), 0, 0);
      }
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131296985));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297663));
      jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131297664));
      jdField_a_of_type_ComTencentMobileqqAdapterContactsSearchResultAdapter = new ContactsSearchResultAdapter(paramQQAppInterface, paramContext, jdField_a_of_type_ComTencentWidgetXListView, null, new lpe(this), false);
      jdField_a_of_type_ComTencentWidgetXListView.setOnTouchListener(new lpf(this, paramContext));
      jdField_b_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131297662));
      com.tencent.mobileqq.search.ContactsSearchableCircleBuddy.jdField_b_of_type_Boolean = false;
      com.tencent.mobileqq.search.ContactsSearchableCircleBuddy.jdField_a_of_type_Boolean = false;
      ThreadManager.a(new lpg(this), 8, null, false);
      c();
      d();
      e();
      a(paramContext, paramQQAppInterface);
      return;
      getWindow().setBackgroundDrawable(new ColorDrawable(jdField_a_of_type_AndroidContentContext.getResources().getColor(2131427372)));
    }
  }
  
  public SearchResultDialog(Context paramContext, QQAppInterface paramQQAppInterface, int paramInt1, ForwardBaseOption paramForwardBaseOption, int paramInt2)
  {
    this(paramContext, paramQQAppInterface, paramInt1, paramInt2);
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption = paramForwardBaseOption;
  }
  
  public SearchResultDialog(Context paramContext, QQAppInterface paramQQAppInterface, int paramInt1, AdapterView.OnItemClickListener paramOnItemClickListener, int paramInt2)
  {
    this(paramContext, paramQQAppInterface, paramInt1, paramInt2);
    jdField_a_of_type_ComTencentWidgetAdapterView$OnItemClickListener = paramOnItemClickListener;
    jdField_a_of_type_Boolean = true;
  }
  
  private static long a(int paramInt)
  {
    return 0L;
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface)
  {
    long l1 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    Object localObject = (PhoneContactManager)paramQQAppInterface.getManager(10);
    if (localObject != null)
    {
      localObject = ((PhoneContactManager)localObject).a();
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
      QLog.d("SearchResultDialog", 2, "getBindNofriendPhoneContacts() time cost = " + (l2 - l1) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt, String paramString, boolean paramBoolean, ArrayList paramArrayList)
  {
    Object localObject = ((DiscussionManager)paramQQAppInterface.getManager(52)).a(paramString);
    paramString = new ArrayList();
    if (localObject != null)
    {
      long l1 = a(paramInt);
      String str = paramQQAppInterface.a();
      paramQQAppInterface.a();
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        DiscussionMemberInfo localDiscussionMemberInfo = (DiscussionMemberInfo)((Iterator)localObject).next();
        if ((localDiscussionMemberInfo != null) && ((!paramBoolean) || (!memberUin.equals(str))) && ((paramArrayList == null) || (!paramArrayList.contains(memberUin)))) {
          paramString.add(new SearchableDiscussionMember(paramContext, paramQQAppInterface, localDiscussionMemberInfo, l1, paramLong));
        }
      }
    }
    return paramString;
  }
  
  @Deprecated
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt, ArrayList paramArrayList)
  {
    return a(paramContext, paramQQAppInterface, paramLong, paramInt, paramArrayList, (List)a(paramQQAppInterface)[1]);
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt, ArrayList paramArrayList, List paramList)
  {
    long l1 = System.currentTimeMillis();
    FriendsManager localFriendsManager = (FriendsManager)paramQQAppInterface.getManager(50);
    ArrayList localArrayList = new ArrayList();
    if (localFriendsManager != null)
    {
      long l2 = a(paramInt);
      String str = paramQQAppInterface.a();
      if (paramList != null)
      {
        paramList = paramList.iterator();
        while (paramList.hasNext())
        {
          Iterator localIterator = ((ArrayList)paramList.next()).iterator();
          while (localIterator.hasNext())
          {
            DiscussionMemberInfo localDiscussionMemberInfo = (DiscussionMemberInfo)localIterator.next();
            if ((localDiscussionMemberInfo != null) && (memberUin != null) && (!memberUin.equals(str)))
            {
              Friends localFriends = localFriendsManager.a(memberUin);
              if (((localFriends == null) || (!localFriends.isFriend())) && (!a(localArrayList, localDiscussionMemberInfo)) && ((paramArrayList == null) || (!paramArrayList.contains(memberUin)))) {
                localArrayList.add(new SearchableDiscussionMember(paramContext, paramQQAppInterface, localDiscussionMemberInfo, l2, paramLong));
              }
            }
          }
        }
      }
    }
    paramLong = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "getAllDiscussionMembersExcludeFriends() time cost = " + (paramLong - l1) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt, List paramList, boolean paramBoolean, ArrayList paramArrayList)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramList != null)
    {
      long l1 = a(paramInt);
      String str = paramQQAppInterface.a();
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        TroopMemberInfo localTroopMemberInfo = (TroopMemberInfo)paramList.next();
        if ((localTroopMemberInfo != null) && (!memberuin.equals("0")) && ((!paramBoolean) || (!memberuin.equals(str))) && ((paramArrayList == null) || (!paramArrayList.contains(memberuin)))) {
          localArrayList.add(new SearchableTroopMember(paramContext, paramQQAppInterface, localTroopMemberInfo, l1, paramLong));
        }
      }
    }
    return localArrayList;
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt, boolean paramBoolean, ArrayList paramArrayList)
  {
    long l1 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = (FriendsManager)paramQQAppInterface.getManager(50);
    ContactFacade localContactFacade = (ContactFacade)paramQQAppInterface.getManager(53);
    Object localObject2 = (FriendsManager)paramQQAppInterface.getManager(50);
    if ((localObject1 != null) && (localContactFacade != null) && (localObject2 != null))
    {
      localObject1 = ((FriendsManager)localObject1).a();
      localObject2 = paramQQAppInterface.a();
      if (localObject1 != null)
      {
        long l2 = a(paramInt);
        Iterator localIterator1 = ((List)localObject1).iterator();
        while (localIterator1.hasNext())
        {
          Groups localGroups = (Groups)localIterator1.next();
          localObject1 = localContactFacade.a(String.valueOf(group_id));
          if (localObject1 != null)
          {
            Iterator localIterator2 = ((List)localObject1).iterator();
            label150:
            Friends localFriends;
            while (localIterator2.hasNext())
            {
              localFriends = (Friends)localIterator2.next();
              if (((!paramBoolean) || (!uin.equals(localObject2))) && ((paramArrayList == null) || (!paramArrayList.contains(uin)))) {
                if (gathtertype != 1) {
                  break label259;
                }
              }
            }
            label259:
            for (localObject1 = paramContext.getResources().getString(2131371533);; localObject1 = group_name)
            {
              localArrayList.add(new ContactSearchableFriend(paramContext, paramQQAppInterface, localFriends, (String)localObject1, l2, paramLong));
              break label150;
              break;
            }
          }
        }
      }
    }
    paramLong = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "getFriends() time cost = " + (paramLong - l1) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface, boolean paramBoolean)
  {
    long l1 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = (PhoneContactManager)paramQQAppInterface.getManager(10);
    if (localObject1 != null)
    {
      localObject1 = ((PhoneContactManager)localObject1).c();
      if (localObject1 != null)
      {
        Object localObject2 = (List)((List)localObject1).get(0);
        if (localObject2 != null)
        {
          localObject2 = ((List)localObject2).iterator();
          while (((Iterator)localObject2).hasNext()) {
            localArrayList.add(new ContactsSearchablePhoneContact(paramContext, paramQQAppInterface, (PhoneContact)((Iterator)localObject2).next(), IContactSearchable.E));
          }
        }
        if (paramBoolean)
        {
          localObject1 = (List)((List)localObject1).get(1);
          if (localObject1 != null)
          {
            localObject1 = ((List)localObject1).iterator();
            while (((Iterator)localObject1).hasNext()) {
              localArrayList.add(new ContactsSearchablePhoneContact(paramContext, paramQQAppInterface, (PhoneContact)((Iterator)localObject1).next(), IContactSearchable.L));
            }
          }
        }
      }
    }
    long l2 = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "getPhoneContacts() time cost = " + (l2 - l1) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  private void a(Context paramContext, QQAppInterface paramQQAppInterface)
  {
    paramQQAppInterface = (TextView)findViewById(2131297663);
    paramQQAppInterface.setCompoundDrawables(null, null, null, null);
    paramQQAppInterface.setText(2131367797);
    jdField_b_of_type_ComTencentWidgetXListView.setAdapter((BaseAdapter)jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface);
    jdField_b_of_type_ComTencentWidgetXListView.setOnTouchListener(new lpl(this, paramContext));
  }
  
  private static boolean a(List paramList, DiscussionMemberInfo paramDiscussionMemberInfo)
  {
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      if (nextamemberUin.equals(memberUin)) {
        return true;
      }
    }
    return false;
  }
  
  public static Object[] a(QQAppInterface paramQQAppInterface)
  {
    Object localObject1 = null;
    DiscussionManager localDiscussionManager = (DiscussionManager)paramQQAppInterface.getManager(52);
    Object localObject2 = (ContactFacade)paramQQAppInterface.getManager(53);
    if ((localDiscussionManager != null) && (localObject2 != null))
    {
      paramQQAppInterface.a();
      paramQQAppInterface = ((ContactFacade)localObject2).a("-1004");
      localObject2 = new String[paramQQAppInterface.size()];
      paramQQAppInterface = paramQQAppInterface.iterator();
      int i1 = 0;
      while (paramQQAppInterface.hasNext())
      {
        localObject1 = (DiscussionInfo)paramQQAppInterface.next();
        if ((localObject1 == null) || (uin == null) || (uin.length() <= 0)) {
          break label193;
        }
        localObject2[i1] = uin;
        i1 += 1;
      }
      paramQQAppInterface = localDiscussionManager.a((String[])localObject2);
      localObject1 = new ArrayList();
      int i2 = localObject2.length;
      i1 = 0;
      while (i1 < i2)
      {
        ((List)localObject1).add((ArrayList)paramQQAppInterface.get(localObject2[i1]));
        i1 += 1;
      }
    }
    for (;;)
    {
      return new Object[] { paramQQAppInterface, localObject1 };
      label193:
      break;
      paramQQAppInterface = null;
    }
  }
  
  private List c()
  {
    long l1 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    Object localObject = (SearchHistoryManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(54);
    if (localObject == null) {
      return localArrayList;
    }
    localObject = ((SearchHistoryManager)localObject).a().iterator();
    while (((Iterator)localObject).hasNext())
    {
      SearchHistory localSearchHistory = (SearchHistory)((Iterator)localObject).next();
      localArrayList.add(new ContactSearchableSearchHistory(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localSearchHistory));
    }
    if (QLog.isColorLevel())
    {
      long l2 = System.currentTimeMillis();
      QLog.d("SearchResultDialog", 2, "initSearchHistoryData() time cost = " + (l2 - l1) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  private void c()
  {
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300511));
    jdField_a_of_type_AndroidWidgetEditText.setImeOptions(3);
    jdField_a_of_type_AndroidWidgetEditText.setOnEditorActionListener(new lph(this));
    jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(new lpi(this));
    jdField_a_of_type_AndroidWidgetEditText.setSelection(0);
    jdField_a_of_type_AndroidWidgetEditText.requestFocus();
  }
  
  public static List d(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt)
  {
    DiscussionManager localDiscussionManager = (DiscussionManager)paramQQAppInterface.getManager(52);
    Object localObject1 = ((ContactFacade)paramQQAppInterface.getManager(53)).a("-1004");
    ArrayList localArrayList = new ArrayList();
    if (localObject1 != null)
    {
      long l1 = a(paramInt);
      paramQQAppInterface.a();
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        Object localObject2 = (DiscussionInfo)((Iterator)localObject1).next();
        if ((localObject2 != null) && (uin != null) && (uin.length() > 0))
        {
          localObject2 = localDiscussionManager.a(uin);
          if (localObject2 != null)
          {
            localObject2 = ((List)localObject2).iterator();
            while (((Iterator)localObject2).hasNext())
            {
              DiscussionMemberInfo localDiscussionMemberInfo = (DiscussionMemberInfo)((Iterator)localObject2).next();
              if ((localDiscussionMemberInfo != null) && (!a(localArrayList, localDiscussionMemberInfo))) {
                localArrayList.add(new SearchableDiscussionMember(paramContext, paramQQAppInterface, localDiscussionMemberInfo, l1, paramLong));
              }
            }
          }
        }
      }
    }
    return localArrayList;
  }
  
  private void d()
  {
    ((ImageButton)findViewById(2131300496)).setOnClickListener(new lpj(this));
  }
  
  private void e()
  {
    Button localButton = (Button)findViewById(2131300492);
    localButton.setVisibility(0);
    localButton.setOnClickListener(new lpk(this));
  }
  
  private void f()
  {
    if (getContextgetResourcesgetConfigurationorientation == 2) {
      jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessageDelayed(556, 0L);
    }
  }
  
  private void g()
  {
    if (isShowing())
    {
      long l1 = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l1, l1, 0, 0.0F, 0.0F, 0);
      jdField_a_of_type_AndroidWidgetEditText.dispatchTouchEvent(localMotionEvent);
      localMotionEvent.recycle();
      localMotionEvent = MotionEvent.obtain(l1, l1, 1, 0.0F, 0.0F, 0);
      jdField_a_of_type_AndroidWidgetEditText.dispatchTouchEvent(localMotionEvent);
      localMotionEvent.recycle();
    }
  }
  
  private void h()
  {
    try
    {
      if (jdField_a_of_type_JavaUtilMap == null)
      {
        Object[] arrayOfObject = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        jdField_a_of_type_JavaUtilMap = ((Map)arrayOfObject[0]);
        jdField_a_of_type_JavaUtilList = ((List)arrayOfObject[1]);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private void i()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment != null)
    {
      View localView = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.getView();
      if (localView.getParent() == null) {
        jdField_a_of_type_AndroidWidgetRelativeLayout.addView(localView, -1, -1);
      }
    }
  }
  
  private void j()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment != null)
    {
      View localView = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.getView();
      if (localView.getParent() != null) {
        ((ViewGroup)localView.getParent()).removeView(localView);
      }
    }
  }
  
  public int a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return 999;
    case 0: 
      return 0;
    case 1006: 
      return 1;
    case 3000: 
      return 2;
    case 1: 
      return 3;
    case 1004: 
      return 4;
    case 3: 
      return 6;
    }
    return 7;
  }
  
  protected List a()
  {
    long l1 = System.currentTimeMillis();
    if (jdField_a_of_type_ComTencentMobileqqAppCircleManager == null) {
      jdField_a_of_type_ComTencentMobileqqAppCircleManager = ((CircleManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(34));
    }
    ArrayList localArrayList = new ArrayList();
    if (jdField_a_of_type_ComTencentMobileqqAppCircleManager != null) {}
    for (;;)
    {
      long l2 = System.currentTimeMillis();
      if (QLog.isColorLevel()) {
        QLog.d("SearchResultDialog", 2, "getCircleContacts() time cost = " + (l2 - l1) + " , size = " + localArrayList.size());
      }
      return localArrayList;
      if (QLog.isColorLevel()) {
        QLog.d("SearchResultDialog", 2, "getCircleContacts(), mApp.getManager return null");
      }
    }
  }
  
  public List a(Context paramContext, QQAppInterface paramQQAppInterface, int paramInt)
  {
    long l1 = System.currentTimeMillis();
    ArrayList localArrayList1 = new ArrayList();
    if ((FriendsManager)paramQQAppInterface.getManager(50) == null) {
      return localArrayList1;
    }
    ExecutorService localExecutorService = Executors.newFixedThreadPool(5);
    ArrayList localArrayList2 = new ArrayList();
    localArrayList2.add(localExecutorService.submit(new SearchResultDialog.CallableForSearchData(this, paramContext, paramQQAppInterface, IContactSearchable.B, paramInt)));
    localArrayList2.add(localExecutorService.submit(new SearchResultDialog.CallableForSearchData(this, paramContext, paramQQAppInterface, IContactSearchable.E, paramInt)));
    localArrayList2.add(localExecutorService.submit(new SearchResultDialog.CallableForSearchData(this, paramContext, paramQQAppInterface, IContactSearchable.D, paramInt)));
    localArrayList2.add(localExecutorService.submit(new SearchResultDialog.CallableForSearchData(this, paramContext, paramQQAppInterface, IContactSearchable.M, paramInt)));
    localArrayList2.add(localExecutorService.submit(new SearchResultDialog.CallableForSearchData(this, paramContext, paramQQAppInterface, IContactSearchable.G, paramInt)));
    paramInt = 0;
    try
    {
      while (paramInt < localArrayList2.size())
      {
        paramContext = (List)((Future)localArrayList2.get(paramInt)).get();
        localArrayList1.addAll(paramContext);
        paramContext.clear();
        paramInt += 1;
      }
      localArrayList2.clear();
      localExecutorService.shutdown();
    }
    catch (InterruptedException paramContext)
    {
      for (;;)
      {
        long l2;
        paramContext.printStackTrace();
      }
    }
    catch (ExecutionException paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
    l2 = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "initSearchData() time cost = " + (l2 - l1) + " , size = " + localArrayList1.size());
    }
    StatisticCollector.a(BaseApplicationImpl.a()).a(null, "SearchInitSearchData", true, l2 - l1, localArrayList1.size(), null, "", true);
    return localArrayList1;
  }
  
  protected List a(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt)
  {
    long l1 = System.currentTimeMillis();
    Object localObject1 = (FriendsManager)paramQQAppInterface.getManager(50);
    Object localObject2 = (ContactFacade)paramQQAppInterface.getManager(53);
    paramContext = new ArrayList();
    if ((localObject1 != null) && (localObject2 != null))
    {
      long l2 = a(paramInt);
      localObject1 = ((ContactFacade)localObject2).a(String.valueOf(64530));
      if (localObject1 != null)
      {
        if (paramInt != 3)
        {
          localObject1 = ((List)localObject1).iterator();
          while (((Iterator)localObject1).hasNext()) {
            paramContext.add(new ContactSearchablePublicAccount(paramQQAppInterface, (PublicAccountInfo)((Iterator)localObject1).next(), paramQQAppInterface.getApplication().getString(2131369395), l2, paramLong));
          }
        }
        localObject1 = ((List)localObject1).iterator();
        while (((Iterator)localObject1).hasNext())
        {
          localObject2 = (PublicAccountInfo)((Iterator)localObject1).next();
          if (((PublicAccountInfo)localObject2).hasIvrAbility()) {
            paramContext.add(new ContactSearchablePublicAccount(paramQQAppInterface, (PublicAccountInfo)localObject2, paramQQAppInterface.getApplication().getString(2131369395), l2, IContactSearchable.u));
          } else {
            paramContext.add(new ContactSearchablePublicAccount(paramQQAppInterface, (PublicAccountInfo)localObject2, paramQQAppInterface.getApplication().getString(2131369395), l2, paramLong));
          }
        }
      }
    }
    paramLong = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "getPublicAccount() time cost = " + (paramLong - l1) + " , size = " + paramContext.size());
    }
    return paramContext;
  }
  
  public Map a()
  {
    h();
    return jdField_a_of_type_JavaUtilMap;
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidWidgetEditText != null) {
      jdField_a_of_type_AndroidWidgetEditText.setText("");
    }
  }
  
  public void a(Context paramContext, QQAppInterface paramQQAppInterface, String paramString1, int paramInt, String paramString2)
  {
    b(paramContext, paramQQAppInterface, paramString1, paramInt, paramString2, null);
  }
  
  public void a(Context paramContext, QQAppInterface paramQQAppInterface, String paramString1, int paramInt, String paramString2, String paramString3)
  {
    if ((paramQQAppInterface != null) && ((QCallFacade)paramQQAppInterface.getManager(37) != null))
    {
      paramQQAppInterface = new Intent(paramContext, QCallDetailActivity.class);
      paramQQAppInterface.putExtra("uin", paramString1);
      paramQQAppInterface.putExtra("troop_uin", paramString3);
      paramQQAppInterface.putExtra("uintype", paramInt);
      paramQQAppInterface.putExtra("uinname", paramString2);
      paramQQAppInterface.putExtra("entrance", "Call");
      paramContext.startActivity(paramQQAppInterface);
    }
    if (paramString3 == null) {}
    dismiss();
  }
  
  public void a(String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "refreshSearchResultList() search start keyword = " + paramString1);
    }
    if (paramString1.equals(""))
    {
      if (TextUtils.isEmpty(e)) {
        jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      }
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface.a();
        jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface.b();
        return;
        j();
        jdField_a_of_type_ComTencentWidgetXListView.setVisibility(0);
      }
    }
    if (jdField_a_of_type_ComTencentWidgetXListView.getVisibility() == 0) {
      jdField_a_of_type_ComTencentWidgetXListView.setVisibility(8);
    }
    if (QLog.isColorLevel()) {
      jdField_a_of_type_Long = System.currentTimeMillis();
    }
    jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface.a(paramString1, paramString2);
    d = paramString2;
  }
  
  public void a(List paramList)
  {
    if (paramList != null) {
      jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface.a(paramList);
    }
  }
  
  public int b(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return 999;
    case 0: 
      return 11;
    case 4: 
      return 0;
    case 2: 
      return 13;
    case 7: 
      return 8;
    case 8: 
      return 9;
    case 9: 
    case 11: 
      return 10;
    case 10: 
      return 6;
    case 6: 
      return 7;
    case 5: 
      return 14;
    case 3: 
      return 15;
    }
    return 12;
  }
  
  public List b()
  {
    h();
    return jdField_a_of_type_JavaUtilList;
  }
  
  protected List b(Context paramContext, QQAppInterface paramQQAppInterface)
  {
    long l2 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    Object localObject = paramQQAppInterface.a().a().a(false);
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      label350:
      while (((Iterator)localObject).hasNext())
      {
        RecentUser localRecentUser = (RecentUser)((Iterator)localObject).next();
        l1 = 0L;
        switch (type)
        {
        }
        for (;;)
        {
          if ((type == -1) || (uin == null)) {
            break label350;
          }
          localArrayList.add(new ContactsSearchableRecentUser(paramContext, paramQQAppInterface, localRecentUser, l1, a()));
          break;
          l1 = IContactSearchable.w;
          continue;
          l1 = IContactSearchable.J;
          continue;
          l1 = IContactSearchable.y;
          continue;
          l1 = IContactSearchable.z;
        }
      }
    }
    long l1 = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "getRecentUsers() time cost = " + (l1 - l2) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  protected List b(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt)
  {
    long l1 = System.currentTimeMillis();
    Object localObject = (ContactFacade)paramQQAppInterface.getManager(53);
    ArrayList localArrayList = new ArrayList();
    if (localObject != null)
    {
      localObject = ((ContactFacade)localObject).a("-1003");
      if (localObject != null)
      {
        if (paramInt == 1) {}
        for (;;)
        {
          localObject = ((List)localObject).iterator();
          while (((Iterator)localObject).hasNext()) {
            localArrayList.add(new ContactSearchableTroop(paramContext, paramQQAppInterface, (TroopInfo)((Iterator)localObject).next(), 0L, paramLong));
          }
        }
      }
    }
    paramLong = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "getTroops() time cost = " + (paramLong - l1) + " , size = " + localArrayList.size());
    }
    return localArrayList;
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentWidgetAdapterView$OnItemClickListener = null;
    setOnDismissListener(null);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    if (QLog.isColorLevel()) {
      QLog.i("SearchResultDialog", 2, "destroy");
    }
  }
  
  public void b(Context paramContext, QQAppInterface paramQQAppInterface, String paramString1, int paramInt, String paramString2, String paramString3)
  {
    Intent localIntent;
    String str;
    if (jdField_a_of_type_Boolean)
    {
      localIntent = new Intent(paramContext, ChatActivity.class);
      if (paramInt == 1008) {
        localIntent.putExtra("chat_subType", PublicAccountManager.a(paramString1, paramQQAppInterface));
      }
      localIntent.putExtra("uin", paramString1);
      if ((paramInt != 1) && (paramInt != 1004)) {
        break label215;
      }
      str = paramString2;
      if (paramString3 != null)
      {
        localIntent.putExtra("troop_uin", paramString3);
        str = paramString2;
      }
    }
    for (;;)
    {
      localIntent.putExtra("uintype", paramInt);
      localIntent.putExtra("uinname", str);
      localIntent.putExtra("aio_msg_source", 1);
      paramContext.startActivity(localIntent);
      if (!jdField_a_of_type_Boolean) {
        dismiss();
      }
      int i1 = b(o);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Search", "Search_into_AIO", i1, 0, String.valueOf(a(paramInt)), String.valueOf(i1), "", "");
      return;
      localIntent = AIOUtils.a(new Intent(paramContext, SplashActivity.class), null);
      break;
      label215:
      str = paramString2;
      if (paramInt == 0)
      {
        paramString3 = (FriendsManager)paramQQAppInterface.getManager(50);
        str = paramString2;
        if (paramString3 != null)
        {
          paramString3 = paramString3.c(String.valueOf(paramString1));
          str = paramString2;
          if (paramString3 != null)
          {
            paramString1 = ContactUtils.a(paramString3);
            localIntent.putExtra("cSpecialFlag", cSpecialFlag);
            if (cSpecialFlag == 1)
            {
              localIntent.setClass(paramContext, ChatActivity.class);
              localIntent.putExtra("chat_subType", 1);
            }
            str = paramString1;
            if (gathtertype == 1)
            {
              ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8004C58", "0X8004C58", 2, 0, "", "", "", "");
              str = paramString1;
            }
          }
        }
      }
    }
  }
  
  /* Error */
  protected List c(Context paramContext, QQAppInterface paramQQAppInterface, long paramLong, int paramInt)
  {
    // Byte code:
    //   0: invokestatic 364	java/lang/System:currentTimeMillis	()J
    //   3: lstore 6
    //   5: new 969	java/util/HashSet
    //   8: dup
    //   9: invokespecial 970	java/util/HashSet:<init>	()V
    //   12: astore 10
    //   14: iconst_4
    //   15: iload 5
    //   17: if_icmpeq +10 -> 27
    //   20: bipush 16
    //   22: iload 5
    //   24: if_icmpne +69 -> 93
    //   27: aload_2
    //   28: invokevirtual 860	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/proxy/ProxyManager;
    //   31: invokevirtual 865	com/tencent/mobileqq/app/proxy/ProxyManager:a	()Lcom/tencent/mobileqq/app/proxy/RecentUserProxy;
    //   34: iconst_0
    //   35: invokevirtual 870	com/tencent/mobileqq/app/proxy/RecentUserProxy:a	(Z)Ljava/util/List;
    //   38: astore 8
    //   40: aload 8
    //   42: ifnull +44 -> 86
    //   45: aload 8
    //   47: invokeinterface 378 1 0
    //   52: astore 9
    //   54: aload 9
    //   56: invokeinterface 383 1 0
    //   61: ifeq +25 -> 86
    //   64: aload 10
    //   66: aload 9
    //   68: invokeinterface 389 1 0
    //   73: checkcast 872	com/tencent/mobileqq/data/RecentUser
    //   76: getfield 876	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   79: invokevirtual 971	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   82: pop
    //   83: goto -29 -> 54
    //   86: aload 8
    //   88: invokeinterface 735 1 0
    //   93: new 366	java/util/ArrayList
    //   96: dup
    //   97: invokespecial 367	java/util/ArrayList:<init>	()V
    //   100: astore 11
    //   102: aload_2
    //   103: bipush 53
    //   105: invokevirtual 153	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   108: checkcast 480	com/tencent/mobileqq/app/ContactFacade
    //   111: astore 8
    //   113: aload 8
    //   115: ifnull +335 -> 450
    //   118: aload 8
    //   120: ldc_w 551
    //   123: invokevirtual 495	com/tencent/mobileqq/app/ContactFacade:a	(Ljava/lang/String;)Ljava/util/ArrayList;
    //   126: astore 13
    //   128: aload 13
    //   130: ifnull +320 -> 450
    //   133: iload 5
    //   135: iconst_2
    //   136: if_icmpne +270 -> 406
    //   139: new 973	java/util/HashMap
    //   142: dup
    //   143: invokespecial 974	java/util/HashMap:<init>	()V
    //   146: astore 12
    //   148: aconst_null
    //   149: astore 9
    //   151: aload_2
    //   152: invokevirtual 977	com/tencent/mobileqq/app/QQAppInterface:b	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   155: new 100	java/lang/StringBuilder
    //   158: dup
    //   159: invokespecial 103	java/lang/StringBuilder:<init>	()V
    //   162: ldc_w 979
    //   165: invokevirtual 109	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: new 425	com/tencent/mobileqq/data/DiscussionMemberInfo
    //   171: dup
    //   172: invokespecial 980	com/tencent/mobileqq/data/DiscussionMemberInfo:<init>	()V
    //   175: invokevirtual 983	com/tencent/mobileqq/data/DiscussionMemberInfo:getTableName	()Ljava/lang/String;
    //   178: invokevirtual 109	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   181: ldc_w 985
    //   184: invokevirtual 109	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   187: invokevirtual 116	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   190: aconst_null
    //   191: invokevirtual 990	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   194: astore 8
    //   196: aload 8
    //   198: astore 9
    //   200: aload 8
    //   202: invokeinterface 995 1 0
    //   207: ifeq +210 -> 417
    //   210: aload 8
    //   212: astore 9
    //   214: aload 12
    //   216: aload 8
    //   218: iconst_0
    //   219: invokeinterface 996 2 0
    //   224: aload 8
    //   226: iconst_1
    //   227: invokeinterface 999 2 0
    //   232: invokestatic 1004	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   235: invokevirtual 1008	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   238: pop
    //   239: goto -43 -> 196
    //   242: astore 8
    //   244: aload 9
    //   246: ifnull +10 -> 256
    //   249: aload 9
    //   251: invokeinterface 1011 1 0
    //   256: aload 13
    //   258: invokeinterface 378 1 0
    //   263: astore 13
    //   265: aload 13
    //   267: invokeinterface 383 1 0
    //   272: ifeq +178 -> 450
    //   275: aload 13
    //   277: invokeinterface 389 1 0
    //   282: checkcast 485	com/tencent/mobileqq/persistence/Entity
    //   285: checkcast 553	com/tencent/mobileqq/data/DiscussionInfo
    //   288: astore 14
    //   290: iconst_4
    //   291: iload 5
    //   293: if_icmpeq +10 -> 303
    //   296: bipush 16
    //   298: iload 5
    //   300: if_icmpne +16 -> 316
    //   303: aload 10
    //   305: aload 14
    //   307: getfield 554	com/tencent/mobileqq/data/DiscussionInfo:uin	Ljava/lang/String;
    //   310: invokevirtual 1012	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   313: ifne -48 -> 265
    //   316: aload 12
    //   318: aload 14
    //   320: getfield 554	com/tencent/mobileqq/data/DiscussionInfo:uin	Ljava/lang/String;
    //   323: invokevirtual 1013	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   326: checkcast 1001	java/lang/Integer
    //   329: astore 8
    //   331: aload 8
    //   333: ifnonnull +179 -> 512
    //   336: iconst_0
    //   337: invokestatic 1004	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   340: astore 8
    //   342: aconst_null
    //   343: astore 9
    //   345: aload_0
    //   346: invokevirtual 880	com/tencent/mobileqq/activity/contact/SearchResultDialog:a	()Ljava/util/Map;
    //   349: astore 15
    //   351: aload 15
    //   353: ifnull +20 -> 373
    //   356: aload 15
    //   358: aload 14
    //   360: getfield 554	com/tencent/mobileqq/data/DiscussionInfo:uin	Ljava/lang/String;
    //   363: invokeinterface 565 2 0
    //   368: checkcast 374	java/util/List
    //   371: astore 9
    //   373: aload 11
    //   375: new 1015	com/tencent/mobileqq/search/ContactSearchableDiscussion
    //   378: dup
    //   379: aload_1
    //   380: aload_2
    //   381: aload 14
    //   383: aload 8
    //   385: invokevirtual 1018	java/lang/Integer:intValue	()I
    //   388: lconst_0
    //   389: lload_3
    //   390: iload 5
    //   392: aload 9
    //   394: invokespecial 1021	com/tencent/mobileqq/search/ContactSearchableDiscussion:<init>	(Landroid/content/Context;Lcom/tencent/mobileqq/app/QQAppInterface;Lcom/tencent/mobileqq/data/DiscussionInfo;IJJILjava/util/List;)V
    //   397: invokeinterface 403 2 0
    //   402: pop
    //   403: goto -138 -> 265
    //   406: iload 5
    //   408: ifne +6 -> 414
    //   411: goto -272 -> 139
    //   414: goto -275 -> 139
    //   417: aload 8
    //   419: ifnull -163 -> 256
    //   422: aload 8
    //   424: invokeinterface 1011 1 0
    //   429: goto -173 -> 256
    //   432: astore_1
    //   433: aconst_null
    //   434: astore 8
    //   436: aload 8
    //   438: ifnull +10 -> 448
    //   441: aload 8
    //   443: invokeinterface 1011 1 0
    //   448: aload_1
    //   449: athrow
    //   450: invokestatic 364	java/lang/System:currentTimeMillis	()J
    //   453: lstore_3
    //   454: invokestatic 98	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   457: ifeq +48 -> 505
    //   460: ldc 12
    //   462: iconst_2
    //   463: new 100	java/lang/StringBuilder
    //   466: dup
    //   467: invokespecial 103	java/lang/StringBuilder:<init>	()V
    //   470: ldc_w 1023
    //   473: invokevirtual 109	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   476: lload_3
    //   477: lload 6
    //   479: lsub
    //   480: invokevirtual 408	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   483: ldc_w 410
    //   486: invokevirtual 109	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   489: aload 11
    //   491: invokeinterface 413 1 0
    //   496: invokevirtual 112	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   499: invokevirtual 116	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   502: invokestatic 119	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   505: aload 11
    //   507: areturn
    //   508: astore_1
    //   509: goto -73 -> 436
    //   512: goto -170 -> 342
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	515	0	this	SearchResultDialog
    //   0	515	1	paramContext	Context
    //   0	515	2	paramQQAppInterface	QQAppInterface
    //   0	515	3	paramLong	long
    //   0	515	5	paramInt	int
    //   3	475	6	l1	long
    //   38	187	8	localObject1	Object
    //   242	1	8	localException	Exception
    //   329	113	8	localInteger	Integer
    //   52	341	9	localObject2	Object
    //   12	292	10	localHashSet	java.util.HashSet
    //   100	406	11	localArrayList	ArrayList
    //   146	171	12	localHashMap	java.util.HashMap
    //   126	150	13	localObject3	Object
    //   288	94	14	localDiscussionInfo	DiscussionInfo
    //   349	8	15	localMap	Map
    // Exception table:
    //   from	to	target	type
    //   151	196	242	java/lang/Exception
    //   200	210	242	java/lang/Exception
    //   214	239	242	java/lang/Exception
    //   151	196	432	finally
    //   200	210	508	finally
    //   214	239	508	finally
  }
  
  public void dismiss()
  {
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "dismiss() this = " + this);
    }
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(555);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(556);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(1);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(2);
    ((InputMethodManager)BaseApplicationImpl.getContext().getSystemService("input_method")).hideSoftInputFromWindow(jdField_a_of_type_AndroidWidgetEditText.getWindowToken(), 0);
    if (jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface != null) {
      jdField_a_of_type_ComTencentMobileqqSearchSearchAdapterInterface.e();
    }
    if (jdField_a_of_type_ComTencentMobileqqAdapterContactsSearchResultAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqAdapterContactsSearchResultAdapter.e();
    }
    try
    {
      if (isShowing()) {
        super.dismiss();
      }
      ActivityLeakSolution.a(this);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException = localException;
        ActivityLeakSolution.a(this);
      }
    }
    finally
    {
      localObject = finally;
      ActivityLeakSolution.a(this);
      throw localObject;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment != null)
    {
      j();
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.k();
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment = null;
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (555 == what) {
      f();
    }
    do
    {
      do
      {
        return true;
        if (556 == what)
        {
          g();
          return true;
        }
        if (1 == what)
        {
          a((List)obj);
          return true;
        }
      } while (2 != what);
      if ((jdField_b_of_type_JavaUtilList != null) && (jdField_b_of_type_JavaUtilList.size() > 0)) {
        jdField_a_of_type_ComTencentMobileqqAdapterContactsSearchResultAdapter.b(jdField_b_of_type_JavaUtilList);
      }
    } while (!QLog.isColorLevel());
    QLog.d("SearchResultDialog", 2, "load history data finish");
    return true;
  }
  
  public void show()
  {
    super.show();
    if (QLog.isColorLevel()) {
      QLog.d("SearchResultDialog", 2, "show() this = " + this);
    }
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(555);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(556);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessage(555);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005021", "0X8005021", p, 0, "", "", "", "");
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment == null) && ((p == 2) || (p == 1)) && ((jdField_a_of_type_AndroidContentContext instanceof BaseActivity))) {
      if (p != 1) {
        break label165;
      }
    }
    label165:
    for (int i1 = 3;; i1 = 4)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment = SearchContactsFragment.a((BaseActivity)jdField_a_of_type_AndroidContentContext, i1);
      return;
    }
  }
}
