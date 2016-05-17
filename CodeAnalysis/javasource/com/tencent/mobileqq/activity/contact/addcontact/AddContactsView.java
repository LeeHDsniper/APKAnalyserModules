package com.tencent.mobileqq.activity.contact.addcontact;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.AddFriendLogicActivity;
import com.tencent.mobileqq.activity.NearbyBaseActivity;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.app.ConditionSearchManager;
import com.tencent.mobileqq.app.ConditionSearchManager.IConfigListener;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.LBSHandler;
import com.tencent.mobileqq.app.LBSObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.conditionsearch.ConditionSearchFriendActivity;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.data.MayKnowRecommend;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.facetoface.Face2FaceAddFriendActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.nearby.NearbySPUtil;
import com.tencent.mobileqq.nearby.guide.NearbyGuideActivity;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.ClearableEditText;
import com.tencent.mobileqq.widget.FormMutiItem;
import com.tencent.mobileqq.widget.FormSimpleItem;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView.LayoutParams;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import lpr;
import lps;
import lpt;
import lpu;
import lpw;
import lpx;
import lpz;

public class AddContactsView
  extends ContactBaseView
  implements View.OnClickListener
{
  private static final int jdField_a_of_type_Int = 3;
  private static final String jdField_a_of_type_JavaLangString = AddContactsView.class.getSimpleName();
  private static short jdField_a_of_type_Short = 8;
  private static final int jdField_b_of_type_Int = 1;
  private static final int jdField_c_of_type_Int = 2;
  private static final int jdField_d_of_type_Int = 3;
  private static final String jdField_d_of_type_JavaLangString = "、";
  private static final int jdField_e_of_type_Int = 4;
  private static final String jdField_e_of_type_JavaLangString = "条件：";
  private static final int f = 5;
  private static final int h = 1;
  private static final int i = 2;
  private static final int j = 3;
  private static final int k = 4;
  private static final int l = 0;
  private static final int m = 1;
  private static final int n = 2;
  private AddContactsView.MayKnowAdapter jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter;
  ConditionSearchManager.IConfigListener jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager$IConfigListener = new lps(this);
  ConditionSearchManager jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new lpr(this);
  LBSObserver jdField_a_of_type_ComTencentMobileqqAppLBSObserver = new lpt(this);
  private MayKnowRecommend jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend;
  private ClearableEditText jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText;
  FormMutiItem jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private List jdField_a_of_type_JavaUtilList;
  private lpz jdField_a_of_type_Lpz = new lpz(this);
  boolean jdField_a_of_type_Boolean = false;
  public String[] a;
  public FormMutiItem b;
  private String jdField_b_of_type_JavaLangString = "PhoneContactRecommendNames";
  private List jdField_b_of_type_JavaUtilList = new ArrayList(3);
  public boolean b;
  FormMutiItem jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem;
  private final String jdField_c_of_type_JavaLangString = "sp_get_mayknow_timestamp";
  public boolean c;
  FormMutiItem jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem;
  private boolean jdField_d_of_type_Boolean = true;
  FormMutiItem jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem;
  private boolean jdField_e_of_type_Boolean = true;
  private int g = 2;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public AddContactsView(ContactBaseView.IAddContactContext paramIAddContactContext)
  {
    super(paramIAddContactContext);
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ArrayOfJavaLangString = null;
    jdField_c_of_type_Boolean = false;
  }
  
  private String a(List paramList)
  {
    PhoneContactManager localPhoneContactManager = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    StringBuffer localStringBuffer = new StringBuffer(100);
    int i1 = 0;
    while (i1 < paramList.size())
    {
      PhoneContact localPhoneContact = localPhoneContactManager.b((String)paramList.get(i1));
      if (localPhoneContact != null)
      {
        localStringBuffer.append(name);
        localStringBuffer.append("、");
      }
      i1 += 1;
    }
    if (localStringBuffer.length() > 1) {
      localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
    }
    return localStringBuffer.toString();
  }
  
  private List a()
  {
    Object localObject = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    List localList = b();
    if (localList.size() < 3)
    {
      localObject = ((PhoneContactManager)localObject).c();
      if ((localObject != null) && (((List)localObject).size() > 1))
      {
        localObject = (List)((List)localObject).get(0);
        if ((localObject != null) && (((List)localObject).size() > 0))
        {
          int i1 = 0;
          while ((i1 < ((List)localObject).size()) && (localList.size() < 3))
          {
            PhoneContact localPhoneContact = (PhoneContact)((List)localObject).get(i1);
            if ((localPhoneContact != null) && (uin != null) && (uin.equals("0")) && (!localFriendsManager.d(nationCode + mobileCode)) && (!localList.contains(mobileNo))) {
              localList.add(mobileNo);
            }
            i1 += 1;
          }
        }
      }
    }
    return localList;
  }
  
  private List a(List paramList)
  {
    if ((paramList == null) || (paramList.size() <= 0)) {
      return null;
    }
    FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    ArrayList localArrayList = new ArrayList(paramList.size());
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      MayKnowRecommend localMayKnowRecommend = (MayKnowRecommend)paramList.next();
      if (!localFriendsManager.b(uin))
      {
        if (localFriendsManager.d(uin)) {}
        for (int i1 = 1;; i1 = 0)
        {
          friendStatus = i1;
          localArrayList.add(localMayKnowRecommend);
          break;
        }
      }
    }
    return localArrayList;
  }
  
  private boolean a(boolean paramBoolean1, boolean paramBoolean2, List paramList)
  {
    int i1;
    if (QLog.isColorLevel())
    {
      String str = jdField_a_of_type_JavaLangString;
      StringBuilder localStringBuilder = new StringBuilder().append("fillMayKnowData force=").append(paramBoolean1).append(" isExpired=").append(paramBoolean2).append(" insize=");
      if (paramList == null)
      {
        i1 = 0;
        QLog.d(str, 2, i1);
      }
    }
    else
    {
      if (NetworkUtil.e(jdField_a_of_type_AndroidContentContext)) {
        break label104;
      }
      g = 4;
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.notifyDataSetChanged();
    }
    label104:
    long l1;
    do
    {
      return false;
      i1 = paramList.size();
      break;
      l1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().getLong("sp_get_mayknow_timestamp", 0L);
    } while ((!paramBoolean1) && (Math.abs(l1 - System.currentTimeMillis()) < 3600000L));
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a(jdField_a_of_type_Short, paramBoolean2, paramList);
    g = 2;
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.notifyDataSetChanged();
    return true;
  }
  
  /* Error */
  private List b()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 132	com/tencent/mobileqq/activity/contact/addcontact/AddContactsView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4: bipush 10
    //   6: invokevirtual 138	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   9: checkcast 140	com/tencent/mobileqq/model/PhoneContactManager
    //   12: astore 13
    //   14: aload_0
    //   15: getfield 132	com/tencent/mobileqq/activity/contact/addcontact/AddContactsView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   18: bipush 50
    //   20: invokevirtual 138	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   23: checkcast 180	com/tencent/mobileqq/app/FriendsManager
    //   26: astore 14
    //   28: new 112	java/util/ArrayList
    //   31: dup
    //   32: iconst_3
    //   33: invokespecial 115	java/util/ArrayList:<init>	(I)V
    //   36: astore 12
    //   38: aload_0
    //   39: getfield 132	com/tencent/mobileqq/activity/contact/addcontact/AddContactsView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   42: invokevirtual 327	com/tencent/mobileqq/app/QQAppInterface:getApplication	()Lmqq/app/MobileQQ;
    //   45: invokevirtual 333	mqq/app/MobileQQ:getContentResolver	()Landroid/content/ContentResolver;
    //   48: getstatic 339	android/provider/CallLog$Calls:CONTENT_URI	Landroid/net/Uri;
    //   51: iconst_2
    //   52: anewarray 155	java/lang/String
    //   55: dup
    //   56: iconst_0
    //   57: ldc_w 341
    //   60: aastore
    //   61: dup
    //   62: iconst_1
    //   63: ldc_w 343
    //   66: aastore
    //   67: aconst_null
    //   68: aconst_null
    //   69: ldc_w 345
    //   72: invokevirtual 351	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   75: astore 8
    //   77: aload 8
    //   79: invokeinterface 356 1 0
    //   84: istore 6
    //   86: new 358	java/util/HashSet
    //   89: dup
    //   90: iconst_4
    //   91: invokespecial 359	java/util/HashSet:<init>	(I)V
    //   94: astore 15
    //   96: iconst_0
    //   97: istore 4
    //   99: iconst_0
    //   100: istore_3
    //   101: iconst_0
    //   102: istore_2
    //   103: iconst_0
    //   104: istore_1
    //   105: aload 8
    //   107: invokeinterface 362 1 0
    //   112: ifeq +242 -> 354
    //   115: aload 8
    //   117: aload 8
    //   119: ldc_w 341
    //   122: invokeinterface 366 2 0
    //   127: invokeinterface 370 2 0
    //   132: invokestatic 375	com/tencent/mobileqq/app/PhoneContactHelper:a	(Ljava/lang/String;)Ljava/lang/String;
    //   135: astore 10
    //   137: aload 10
    //   139: ldc_w 377
    //   142: invokevirtual 380	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   145: ifeq +165 -> 310
    //   148: aload 10
    //   150: iconst_3
    //   151: invokevirtual 383	java/lang/String:substring	(I)Ljava/lang/String;
    //   154: astore 9
    //   156: aload 15
    //   158: aload 10
    //   160: invokevirtual 384	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   163: ifne -58 -> 105
    //   166: aload 15
    //   168: aload 9
    //   170: invokevirtual 384	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   173: ifne -68 -> 105
    //   176: aload 15
    //   178: aload 10
    //   180: invokevirtual 385	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   183: pop
    //   184: aload 15
    //   186: aload 9
    //   188: invokevirtual 385	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   191: pop
    //   192: aload 13
    //   194: aload 10
    //   196: invokeinterface 158 2 0
    //   201: astore 11
    //   203: aload 11
    //   205: astore 10
    //   207: aload 11
    //   209: ifnonnull +14 -> 223
    //   212: aload 13
    //   214: aload 9
    //   216: invokeinterface 158 2 0
    //   221: astore 10
    //   223: aload 10
    //   225: ifnull +577 -> 802
    //   228: ldc -67
    //   230: aload 10
    //   232: getfield 187	com/tencent/mobileqq/data/PhoneContact:uin	Ljava/lang/String;
    //   235: invokevirtual 193	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   238: ifeq +98 -> 336
    //   241: iload_1
    //   242: iconst_1
    //   243: iadd
    //   244: istore_1
    //   245: aload 14
    //   247: new 195	java/lang/StringBuilder
    //   250: dup
    //   251: invokespecial 197	java/lang/StringBuilder:<init>	()V
    //   254: aload 10
    //   256: getfield 200	com/tencent/mobileqq/data/PhoneContact:nationCode	Ljava/lang/String;
    //   259: invokevirtual 203	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   262: aload 10
    //   264: getfield 206	com/tencent/mobileqq/data/PhoneContact:mobileCode	Ljava/lang/String;
    //   267: invokevirtual 203	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   270: invokevirtual 207	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   273: invokevirtual 210	com/tencent/mobileqq/app/FriendsManager:d	(Ljava/lang/String;)Z
    //   276: ifne +516 -> 792
    //   279: aload 12
    //   281: aload 10
    //   283: getfield 213	com/tencent/mobileqq/data/PhoneContact:mobileNo	Ljava/lang/String;
    //   286: invokeinterface 216 2 0
    //   291: ifne +501 -> 792
    //   294: aload 12
    //   296: aload 10
    //   298: getfield 213	com/tencent/mobileqq/data/PhoneContact:mobileNo	Ljava/lang/String;
    //   301: invokeinterface 219 2 0
    //   306: pop
    //   307: goto -202 -> 105
    //   310: new 195	java/lang/StringBuilder
    //   313: dup
    //   314: invokespecial 197	java/lang/StringBuilder:<init>	()V
    //   317: ldc_w 377
    //   320: invokevirtual 203	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   323: aload 10
    //   325: invokevirtual 203	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   328: invokevirtual 207	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   331: astore 9
    //   333: goto -177 -> 156
    //   336: aload 10
    //   338: getfield 187	com/tencent/mobileqq/data/PhoneContact:uin	Ljava/lang/String;
    //   341: invokestatic 391	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   344: ifne +451 -> 795
    //   347: iload_3
    //   348: iconst_1
    //   349: iadd
    //   350: istore_3
    //   351: goto -246 -> 105
    //   354: new 393	java/util/HashMap
    //   357: dup
    //   358: invokespecial 394	java/util/HashMap:<init>	()V
    //   361: astore 9
    //   363: aload 9
    //   365: ldc_w 396
    //   368: aload 15
    //   370: invokevirtual 397	java/util/HashSet:size	()I
    //   373: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   376: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   379: pop
    //   380: aload 9
    //   382: ldc_w 406
    //   385: iload 6
    //   387: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   390: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   393: pop
    //   394: aload 9
    //   396: ldc_w 408
    //   399: iload_3
    //   400: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   403: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   406: pop
    //   407: aload 9
    //   409: ldc_w 410
    //   412: iload_1
    //   413: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   416: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   419: pop
    //   420: aload 9
    //   422: ldc_w 412
    //   425: iload_2
    //   426: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   429: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   432: pop
    //   433: aload 9
    //   435: ldc_w 414
    //   438: iload 4
    //   440: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   443: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   446: pop
    //   447: aload 13
    //   449: invokeinterface 184 1 0
    //   454: astore 10
    //   456: iconst_0
    //   457: istore_2
    //   458: iconst_0
    //   459: istore_3
    //   460: aload 10
    //   462: iconst_1
    //   463: invokeinterface 153 2 0
    //   468: checkcast 145	java/util/List
    //   471: invokeinterface 149 1 0
    //   476: istore_1
    //   477: aload 10
    //   479: iconst_0
    //   480: invokeinterface 153 2 0
    //   485: checkcast 145	java/util/List
    //   488: astore 10
    //   490: aload 10
    //   492: invokeinterface 149 1 0
    //   497: istore 7
    //   499: iconst_0
    //   500: istore 4
    //   502: iload 4
    //   504: iload 7
    //   506: if_icmpge +74 -> 580
    //   509: aload 10
    //   511: iload 4
    //   513: invokeinterface 153 2 0
    //   518: checkcast 160	com/tencent/mobileqq/data/PhoneContact
    //   521: astore 11
    //   523: aload 11
    //   525: ifnull +256 -> 781
    //   528: ldc -67
    //   530: aload 11
    //   532: getfield 187	com/tencent/mobileqq/data/PhoneContact:uin	Ljava/lang/String;
    //   535: invokevirtual 193	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   538: ifeq +16 -> 554
    //   541: iload_3
    //   542: iconst_1
    //   543: iadd
    //   544: istore 5
    //   546: iload_1
    //   547: istore_3
    //   548: iload 5
    //   550: istore_1
    //   551: goto +260 -> 811
    //   554: aload 11
    //   556: getfield 187	com/tencent/mobileqq/data/PhoneContact:uin	Ljava/lang/String;
    //   559: invokestatic 391	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   562: ifne +270 -> 832
    //   565: iload_1
    //   566: istore 5
    //   568: iload_3
    //   569: istore_1
    //   570: iload_2
    //   571: iconst_1
    //   572: iadd
    //   573: istore_2
    //   574: iload 5
    //   576: istore_3
    //   577: goto +234 -> 811
    //   580: aload 9
    //   582: ldc_w 416
    //   585: iload 7
    //   587: iload_1
    //   588: iadd
    //   589: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   592: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   595: pop
    //   596: aload 9
    //   598: ldc_w 418
    //   601: iload_2
    //   602: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   605: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   608: pop
    //   609: aload 9
    //   611: ldc_w 420
    //   614: iload_3
    //   615: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   618: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   621: pop
    //   622: aload 9
    //   624: ldc_w 422
    //   627: iload_1
    //   628: invokestatic 400	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   631: invokevirtual 404	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   634: pop
    //   635: aload_0
    //   636: invokevirtual 426	com/tencent/mobileqq/activity/contact/addcontact/AddContactsView:getContext	()Landroid/content/Context;
    //   639: invokestatic 431	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   642: aconst_null
    //   643: ldc_w 433
    //   646: iconst_1
    //   647: iload 6
    //   649: i2l
    //   650: lconst_0
    //   651: aload 9
    //   653: aconst_null
    //   654: invokevirtual 436	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;)V
    //   657: aload 8
    //   659: ifnull +10 -> 669
    //   662: aload 8
    //   664: invokeinterface 439 1 0
    //   669: aload 12
    //   671: invokeinterface 149 1 0
    //   676: iconst_3
    //   677: if_icmple +101 -> 778
    //   680: aload 12
    //   682: iconst_0
    //   683: iconst_3
    //   684: invokeinterface 443 3 0
    //   689: areturn
    //   690: astore 9
    //   692: aconst_null
    //   693: astore 8
    //   695: invokestatic 259	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   698: ifeq +15 -> 713
    //   701: ldc_w 445
    //   704: iconst_2
    //   705: ldc_w 447
    //   708: aload 9
    //   710: invokestatic 450	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   713: aload 8
    //   715: ifnull -46 -> 669
    //   718: aload 8
    //   720: invokeinterface 439 1 0
    //   725: goto -56 -> 669
    //   728: astore 8
    //   730: goto -61 -> 669
    //   733: astore 9
    //   735: aconst_null
    //   736: astore 8
    //   738: aload 8
    //   740: ifnull +10 -> 750
    //   743: aload 8
    //   745: invokeinterface 439 1 0
    //   750: aload 9
    //   752: athrow
    //   753: astore 8
    //   755: goto -86 -> 669
    //   758: astore 8
    //   760: goto -10 -> 750
    //   763: astore 9
    //   765: goto -27 -> 738
    //   768: astore 9
    //   770: goto -32 -> 738
    //   773: astore 9
    //   775: goto -80 -> 695
    //   778: aload 12
    //   780: areturn
    //   781: iload_1
    //   782: istore 5
    //   784: iload_3
    //   785: istore_1
    //   786: iload 5
    //   788: istore_3
    //   789: goto +22 -> 811
    //   792: goto -687 -> 105
    //   795: iload_2
    //   796: iconst_1
    //   797: iadd
    //   798: istore_2
    //   799: goto -694 -> 105
    //   802: iload 4
    //   804: iconst_1
    //   805: iadd
    //   806: istore 4
    //   808: goto -703 -> 105
    //   811: iload 4
    //   813: iconst_1
    //   814: iadd
    //   815: istore 5
    //   817: iload_3
    //   818: istore 4
    //   820: iload_1
    //   821: istore_3
    //   822: iload 4
    //   824: istore_1
    //   825: iload 5
    //   827: istore 4
    //   829: goto -327 -> 502
    //   832: iload_1
    //   833: iconst_1
    //   834: iadd
    //   835: istore 5
    //   837: iload_3
    //   838: istore_1
    //   839: iload 5
    //   841: istore_3
    //   842: goto -31 -> 811
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	845	0	this	AddContactsView
    //   104	735	1	i1	int
    //   102	697	2	i2	int
    //   100	742	3	i3	int
    //   97	731	4	i4	int
    //   544	296	5	i5	int
    //   84	564	6	i6	int
    //   497	92	7	i7	int
    //   75	644	8	localCursor	android.database.Cursor
    //   728	1	8	localException1	Exception
    //   736	8	8	localObject1	Object
    //   753	1	8	localException2	Exception
    //   758	1	8	localException3	Exception
    //   154	498	9	localObject2	Object
    //   690	19	9	localThrowable1	Throwable
    //   733	18	9	localObject3	Object
    //   763	1	9	localObject4	Object
    //   768	1	9	localObject5	Object
    //   773	1	9	localThrowable2	Throwable
    //   135	375	10	localObject6	Object
    //   201	354	11	localPhoneContact	PhoneContact
    //   36	743	12	localArrayList	ArrayList
    //   12	436	13	localPhoneContactManager	PhoneContactManager
    //   26	220	14	localFriendsManager	FriendsManager
    //   94	275	15	localHashSet	java.util.HashSet
    // Exception table:
    //   from	to	target	type
    //   38	77	690	java/lang/Throwable
    //   718	725	728	java/lang/Exception
    //   38	77	733	finally
    //   662	669	753	java/lang/Exception
    //   743	750	758	java/lang/Exception
    //   77	96	763	finally
    //   105	156	763	finally
    //   156	203	763	finally
    //   212	223	763	finally
    //   228	241	763	finally
    //   245	307	763	finally
    //   310	333	763	finally
    //   336	347	763	finally
    //   354	456	763	finally
    //   460	499	763	finally
    //   509	523	763	finally
    //   528	541	763	finally
    //   554	565	763	finally
    //   580	657	763	finally
    //   695	713	768	finally
    //   77	96	773	java/lang/Throwable
    //   105	156	773	java/lang/Throwable
    //   156	203	773	java/lang/Throwable
    //   212	223	773	java/lang/Throwable
    //   228	241	773	java/lang/Throwable
    //   245	307	773	java/lang/Throwable
    //   310	333	773	java/lang/Throwable
    //   336	347	773	java/lang/Throwable
    //   354	456	773	java/lang/Throwable
    //   460	499	773	java/lang/Throwable
    //   509	523	773	java/lang/Throwable
    //   528	541	773	java/lang/Throwable
    //   554	565	773	java/lang/Throwable
    //   580	657	773	java/lang/Throwable
  }
  
  private void h()
  {
    jdField_a_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a();
    if (jdField_a_of_type_Boolean)
    {
      if ((!NearbySPUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount())) || (!NetworkUtil.e(jdField_a_of_type_AndroidContentContext))) {
        break label83;
      }
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a().a(jdField_a_of_type_ComTencentMobileqqAppLBSObserver);
      ((LBSHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(3)).b();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.c(jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager$IConfigListener);
      return;
      label83:
      jdField_a_of_type_ArrayOfJavaLangString = new String[] { "-1", "-1", "-1", "-1" };
    }
  }
  
  private void i()
  {
    a(2130903064);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131296826));
    AccessibilityUtil.a(jdField_a_of_type_ComTencentWidgetXListView, false);
    View localView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903065, jdField_a_of_type_ComTencentWidgetXListView, false);
    jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText = ((ClearableEditText)localView.findViewById(2131296827));
    jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setPadding(getResources().getDimensionPixelSize(2131493312), 0, 0, 0);
    Object localObject = getResources().getDrawable(2130842718);
    ((Drawable)localObject).setBounds(0, 0, ((Drawable)localObject).getIntrinsicWidth(), ((Drawable)localObject).getIntrinsicHeight());
    jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setCompoundDrawables((Drawable)localObject, null, null, null);
    jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setFocusable(false);
    jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setCursorVisible(false);
    jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setOnClickListener(this);
    if (AppSetting.i) {
      jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setContentDescription("搜索栏、QQ号、手机号、邮箱、群、公共号");
    }
    jdField_a_of_type_ComTencentWidgetXListView.a(localView, null, false);
    jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem = ((FormMutiItem)localView.findViewById(2131296829));
    jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setLeftIcon(getResources().getDrawable(2130840264));
    jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setFirstLineText(jdField_a_of_type_AndroidContentContext.getString(2131369380));
    jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineText("");
    if (((ConditionSearchManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(58)).b()) {
      jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setRightIcon(getResources().getDrawable(2130842774));
    }
    jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.a(true);
    jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setOnClickListener(this);
    jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem = ((FormMutiItem)localView.findViewById(2131296831));
    jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setLeftIcon(getResources().getDrawable(2130840189));
    jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setFirstLineText(getResources().getString(2131369398));
    jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineText("");
    jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.a(true);
    jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setOnClickListener(this);
    if (AppSetting.i) {
      jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setContentDescription("添加手机联系人");
    }
    jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem = ((FormMutiItem)localView.findViewById(2131296832));
    jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem.setLeftIcon(getResources().getDrawable(2130840188));
    jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem.setFirstLineText("查看附近的人");
    jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(false);
    jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem.a(true);
    jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem.setOnClickListener(this);
    if (AppSetting.i) {
      jdField_c_of_type_ComTencentMobileqqWidgetFormMutiItem.setContentDescription("查看附近的人");
    }
    jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem = ((FormMutiItem)localView.findViewById(2131296830));
    AVNotifyCenter localAVNotifyCenter = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localAVNotifyCenter.g())
    {
      jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setVisibility(0);
      String str = localAVNotifyCenter.b();
      localObject = str;
      if (str == null) {
        localObject = "找行家";
      }
      jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setFirstLineText((CharSequence)localObject);
      localObject = localAVNotifyCenter.c();
      if (localObject == null)
      {
        jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(false);
        jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.a(true);
        jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setOnClickListener(this);
        jdField_e_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().getBoolean("sp_famous_person_chatting_show_guid", true);
        if (jdField_e_of_type_Boolean) {
          jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setRightIcon(getResources().getDrawable(2130842774));
        }
        if (localAVNotifyCenter.a() != null) {
          break label837;
        }
        jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setLeftIcon(getResources().getDrawable(2130838878));
      }
    }
    for (;;)
    {
      jdField_d_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().getBoolean("sp_firsttime_shownwe", true);
      jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem = ((FormMutiItem)localView.findViewById(2131296828));
      if (jdField_d_of_type_Boolean) {
        jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.setRightIcon(getResources().getDrawable(2130842774));
      }
      jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.setLeftIcon(getResources().getDrawable(2130838395));
      jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.setFirstLineText(getResources().getString(2131371665));
      jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineText(getResources().getString(2131371666));
      jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(true);
      jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.a(true);
      jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.setOnClickListener(this);
      if (AppSetting.i) {
        jdField_d_of_type_ComTencentMobileqqWidgetFormMutiItem.setContentDescription("当面加好友，添加身边的人和群");
      }
      localObject = new LinearLayout(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a());
      ((LinearLayout)localObject).setLayoutParams(new AbsListView.LayoutParams(-1, DisplayUtil.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a(), 20.0F)));
      jdField_a_of_type_ComTencentWidgetXListView.b((View)localObject, null, false);
      return;
      jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(true);
      jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineText((CharSequence)localObject);
      break;
      label837:
      if ((localAVNotifyCenter.e() == 0) || (localAVNotifyCenter.f() == 0)) {
        localAVNotifyCenter.a(getResources(), 2130838878);
      }
      localObject = localAVNotifyCenter.a();
      localObject = new BitmapDrawable(getResources(), (Bitmap)localObject);
      jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setLeftIcon((Drawable)localObject, localAVNotifyCenter.f(), localAVNotifyCenter.e());
      continue;
      jdField_e_of_type_ComTencentMobileqqWidgetFormMutiItem.setVisibility(8);
    }
  }
  
  private void j()
  {
    h();
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter = new AddContactsView.MayKnowAdapter(this, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentWidgetXListView);
    l();
    k();
  }
  
  private void k()
  {
    PhoneContactManager localPhoneContactManager = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    SharedPreferences localSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences();
    Object localObject = localSharedPreferences.getString(jdField_b_of_type_JavaLangString, "");
    if (((String)localObject).length() > 0)
    {
      localObject = ((String)localObject).split(",");
      if (localObject.length > 0) {
        jdField_b_of_type_JavaUtilList = Arrays.asList((Object[])localObject);
      }
    }
    localObject = a(jdField_b_of_type_JavaUtilList);
    if (TextUtils.isEmpty((CharSequence)localObject))
    {
      jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineText("");
      jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(false);
    }
    for (;;)
    {
      if (localPhoneContactManager != null)
      {
        if (!localPhoneContactManager.c()) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lpu(this, (String)localObject, localSharedPreferences));
      }
      return;
      jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineText((CharSequence)localObject);
      jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(true);
    }
    localSharedPreferences.edit().putString(jdField_b_of_type_JavaLangString, "").commit();
    jdField_b_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(false);
  }
  
  private void l()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lpw(this));
  }
  
  public int a()
  {
    return getResources().getDimensionPixelSize(2131493424);
  }
  
  protected void a()
  {
    super.a();
    jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager = ((ConditionSearchManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(58));
    i();
    j();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
  }
  
  protected void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    }
    do
    {
      return;
    } while (jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend == null);
    paramIntent = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    if (paramIntent.b(jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend.uin))
    {
      jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend.friendStatus = 2;
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.notifyDataSetChanged();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend = null;
      return;
      if (paramIntent.d(jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend.uin))
      {
        jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend.friendStatus = 1;
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.notifyDataSetChanged();
      }
    }
  }
  
  protected void b()
  {
    super.b();
    d();
    jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a(this);
    jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a();
  }
  
  protected void c()
  {
    super.c();
    jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.b(this);
    jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.d(jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager$IConfigListener);
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a().b(jdField_a_of_type_ComTencentMobileqqAppLBSObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.b();
    }
  }
  
  public void d()
  {
    Object localObject2;
    Object localObject1;
    if (QLog.isColorLevel())
    {
      localObject2 = jdField_a_of_type_JavaLangString;
      StringBuilder localStringBuilder = new StringBuilder().append("fillSearchConditions | autoReqLocation = ").append(jdField_a_of_type_Boolean).append(" | code one = ");
      if ((jdField_a_of_type_ArrayOfJavaLangString != null) && (jdField_a_of_type_ArrayOfJavaLangString.length == 4))
      {
        localObject1 = jdField_a_of_type_ArrayOfJavaLangString[0];
        QLog.d((String)localObject2, 2, localObject1);
      }
    }
    else
    {
      localObject1 = new StringBuilder("条件：");
      int i1 = jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.b();
      if (i1 != 0) {
        ((StringBuilder)localObject1).append(ConditionSearchManager.jdField_a_of_type_ArrayOfJavaLangString[i1]).append("、");
      }
      i1 = jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.c();
      if (i1 != 0) {
        ((StringBuilder)localObject1).append(ConditionSearchManager.b[i1]).append("、");
      }
      if (!jdField_a_of_type_Boolean) {
        break label462;
      }
      if ((jdField_a_of_type_ArrayOfJavaLangString != null) && (jdField_b_of_type_Boolean)) {
        if ("-1".equals(jdField_a_of_type_ArrayOfJavaLangString[0]))
        {
          localObject2 = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          if (localObject2 == null) {}
        }
      }
    }
    for (;;)
    {
      try
      {
        jdField_a_of_type_ArrayOfJavaLangString = strLocationCodes.split("-");
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "card.strLocationCodes = " + strLocationCodes);
        }
      }
      catch (Exception localException1)
      {
        try
        {
          jdField_a_of_type_ArrayOfJavaLangString[3] = "0";
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.b(jdField_a_of_type_ArrayOfJavaLangString);
          jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a(jdField_a_of_type_ArrayOfJavaLangString);
          jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a(0, (String)localObject2);
          if (!"0".equals(jdField_a_of_type_ArrayOfJavaLangString[0])) {
            ((StringBuilder)localObject1).append(jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a((String)localObject2)).append("、");
          }
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a(1);
          if (!((String)localObject2).startsWith("不限")) {
            ((StringBuilder)localObject1).append(jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a((String)localObject2));
          }
          localObject2 = ((StringBuilder)localObject1).toString();
          localObject1 = localObject2;
          if (((String)localObject2).endsWith("、")) {
            localObject1 = ((String)localObject2).substring(0, ((String)localObject2).length() - 1);
          }
          if (((String)localObject1).equals("条件：")) {
            break label502;
          }
          jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(true);
          jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineText((CharSequence)localObject1);
          return;
          localObject1 = Integer.valueOf(64536);
          break;
          localException1 = localException1;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "spliteLocationString | exception: ", localException1);
          continue;
        }
        catch (Exception localException2)
        {
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "parseLocationDesc", localException2);
          continue;
        }
      }
      label462:
      String str = jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a(0);
      if (!str.startsWith("不限")) {
        ((StringBuilder)localObject1).append(jdField_a_of_type_ComTencentMobileqqAppConditionSearchManager.a(str)).append("、");
      }
    }
    label502:
    jdField_a_of_type_ComTencentMobileqqWidgetFormMutiItem.setSecondLineVisible(false);
  }
  
  public void onClick(View paramView)
  {
    Object localObject;
    switch (paramView.getId())
    {
    default: 
    case 2131296827: 
    case 2131296829: 
    case 2131296831: 
    case 2131296832: 
    case 2131296828: 
    case 2131296830: 
    case 2131296836: 
    case 2131296834: 
      do
      {
        do
        {
          do
          {
            return;
            jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a();
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004BEC", "0X8004BEC", 1, 0, "", "", "", "");
            return;
            ((FormSimpleItem)findViewById(2131296829)).setRightIcon(null);
            jdField_a_of_type_AndroidContentContext.startActivity(new Intent(jdField_a_of_type_AndroidContentContext, ConditionSearchFriendActivity.class).putExtra("from", "addcontacts"));
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004240", "0X8004240", 0, 0, "", "", "", "");
            return;
            paramView = new Intent(jdField_a_of_type_AndroidContentContext, PhoneFrameActivity.class);
            paramView.putExtra("key_reserved_mobile", (String[])jdField_b_of_type_JavaUtilList.toArray(new String[jdField_b_of_type_JavaUtilList.size()]));
            paramView.putExtra("key_req_type", 3);
            jdField_a_of_type_AndroidContentContext.startActivity(paramView);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800474A", "0X800474A", 0, 0, "", "", "", "");
            return;
            if (!NearbySPUtil.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()))
            {
              paramView = new Intent(jdField_a_of_type_AndroidContentContext, NearbyBaseActivity.class);
              paramView.putExtra("ENTER_TIME", System.currentTimeMillis());
              paramView.putExtra("FROM_WHERE", 1004);
              paramView.putExtra("leftViewText", jdField_a_of_type_AndroidContentContext.getResources().getText(2131368389));
              jdField_a_of_type_AndroidContentContext.startActivity(paramView);
            }
            for (;;)
            {
              ReportController.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004FA1", "0X8004FA1", 0, 0, "", "", "", "");
              return;
              paramView = new Intent(jdField_a_of_type_AndroidContentContext, NearbyGuideActivity.class);
              paramView.putExtra("FROM_WHERE", 1004);
              paramView.putExtra("leftViewText", jdField_a_of_type_AndroidContentContext.getResources().getText(2131368389));
              jdField_a_of_type_AndroidContentContext.startActivity(paramView);
            }
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().edit().putBoolean("sp_firsttime_shownwe", false).commit();
            ((FormSimpleItem)findViewById(2131296828)).setRightIcon(null);
            paramView = new Intent(jdField_a_of_type_AndroidContentContext, Face2FaceAddFriendActivity.class);
            paramView.putExtra("activity_from_type", 0);
            jdField_a_of_type_AndroidContentContext.startActivity(paramView);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80050E8", "0X80050E8", 0, 0, "", "", "", "");
            return;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().edit().putBoolean("sp_famous_person_chatting_show_guid", false).commit();
            ((FormSimpleItem)findViewById(2131296830)).setRightIcon(null);
            Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
            localIntent.putExtra("isShowAd", false);
            localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d();
            paramView = (View)localObject;
            if (localObject == null) {
              paramView = "http://expert.mobile.qq.com/masters/client/masterlist.html?_wv=1027" + "&ADTAG=Client.Hangjia.Zhaoren.01";
            }
            localIntent.putExtra("url", paramView);
            jdField_a_of_type_AndroidContentContext.startActivity(localIntent);
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0x8006493", "0x8006493", 0, 0, "", "", "", "");
            return;
            localObject = (MayKnowRecommend)paramView.getTag();
          } while (localObject == null);
          paramView = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
          if ((!paramView.b(uin)) && (!paramView.d(uin)))
          {
            if (TextUtils.isEmpty(remark)) {
              if (TextUtils.isEmpty(nick)) {
                paramView = uin;
              }
            }
            for (;;)
            {
              paramView = AddFriendLogicActivity.a(jdField_a_of_type_AndroidContentContext, 1, uin, null, 3003, 1, paramView, null, null, jdField_a_of_type_AndroidContentContext.getString(2131369134), null);
              jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend = ((MayKnowRecommend)localObject);
              jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a().startActivityForResult(paramView, 1);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004E40", "0X8004E40", 0, 0, "", "", "", "");
              return;
              paramView = nick;
              continue;
              paramView = remark;
            }
          }
          if (paramView.b(uin))
          {
            friendStatus = 2;
            jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.notifyDataSetChanged();
            return;
          }
          friendStatus = 1;
          jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.notifyDataSetChanged();
          return;
          paramView = (lpx)paramView.getTag();
        } while (paramView == null);
        paramView = jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend;
      } while (paramView == null);
      localObject = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if ((localObject == null) || (!((FriendsManager)localObject).b(uin))) {
        break;
      }
    }
    for (int i1 = 1;; i1 = 77)
    {
      localObject = new ProfileActivity.AllInOne(uin, i1);
      if (!TextUtils.isEmpty(remark)) {
        l = remark;
      }
      if (!TextUtils.isEmpty(nick)) {
        h = nick;
      }
      g = 88;
      jdField_a_of_type_ComTencentMobileqqDataMayKnowRecommend = paramView;
      ProfileActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a(), (ProfileActivity.AllInOne)localObject, 1);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004E3F", "0X8004E3F", 0, 0, "", "", "", "");
      return;
      if ((g != 3) && (g != 4)) {
        break;
      }
      g = 5;
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView$MayKnowAdapter.notifyDataSetChanged();
      return;
    }
  }
}
