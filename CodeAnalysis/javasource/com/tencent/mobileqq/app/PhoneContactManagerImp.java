package com.tencent.mobileqq.app;

import SecurityAccountServer.AddressBookItem;
import SecurityAccountServer.MobileContactsFriendInfo;
import SecurityAccountServer.MobileContactsNotFriendInfo;
import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.ContentObserver;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.Message;
import android.provider.ContactsContract.CommonDataKinds.Phone;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.phone.BindNumberActivity;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.activity.phone.DialogBaseActivity;
import com.tencent.mobileqq.activity.selectmember.ContactsInnerFrame;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.PhoneNumInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.EntityTransaction;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.phonecontact.ContactBindServlet;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import friendlist.GetOnlineInfoResp;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import mqq.app.MobileQQ;
import mqq.app.NewIntent;
import mqq.os.MqqHandler;
import nbb;
import nbc;
import nbd;
import nbe;
import nbf;
import nbg;
import nbh;
import nbi;
import nbj;
import nbk;
import nbl;
import nbm;
import nbo;
import nbp;
import nbq;
import nbr;
import nbs;
import nbt;
import nbu;
import nbv;
import nbw;
import nbx;
import nby;
import ncb;

public class PhoneContactManagerImp
  implements PhoneContactManager
{
  private static final char jdField_a_of_type_Char = '|';
  public static volatile long a = 0L;
  public static final String a = "key_contacts_switches";
  private static final String[] jdField_a_of_type_ArrayOfJavaLangString;
  public static int b = 0;
  public static int c = 0;
  public static final int d = 0;
  private static final String jdField_d_of_type_JavaLangString = "k_b_version";
  public static final int e = 1;
  private static final String jdField_e_of_type_JavaLangString = "k_b_limit";
  public static final int f = 2;
  private static final long jdField_f_of_type_Long = 120000L;
  private static final String jdField_f_of_type_JavaLangString = "k_b_count";
  public static boolean f = false;
  private static final long jdField_g_of_type_Long = 180000L;
  private static final String jdField_g_of_type_JavaLangString = "k_b_time";
  private static final String jdField_h_of_type_JavaLangString = "K_b_msg";
  public static boolean h = false;
  private static final String jdField_i_of_type_JavaLangString = "key_contact_last_login";
  private static final boolean jdField_i_of_type_Boolean = false;
  private static final String jdField_j_of_type_JavaLangString = "key_req_last_login_time";
  private static final String jdField_k_of_type_JavaLangString = "key_login_info_timestamp";
  private static final String jdField_l_of_type_JavaLangString = "key_req_login_interval";
  private static final boolean m = false;
  private static final boolean o = true;
  public volatile int a;
  public SharedPreferences a;
  private ContentObserver jdField_a_of_type_AndroidDatabaseContentObserver;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private EntityManager jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new nbm(this);
  private Runnable jdField_a_of_type_JavaLangRunnable = new nbr(this);
  private LinkedList jdField_a_of_type_JavaUtilLinkedList = new LinkedList();
  private List jdField_a_of_type_JavaUtilList;
  private volatile Set jdField_a_of_type_JavaUtilSet = new HashSet();
  private ConcurrentHashMap jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  private nby jdField_a_of_type_Nby;
  private ncb jdField_a_of_type_Ncb = null;
  public volatile boolean a;
  private byte[] jdField_a_of_type_ArrayOfByte;
  public volatile long b;
  private SharedPreferences jdField_b_of_type_AndroidContentSharedPreferences;
  private Runnable jdField_b_of_type_JavaLangRunnable = new nbu(this);
  private List jdField_b_of_type_JavaUtilList;
  private ConcurrentHashMap jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  public volatile boolean b;
  public volatile long c;
  private Runnable jdField_c_of_type_JavaLangRunnable = new nbc(this);
  private String jdField_c_of_type_JavaLangString;
  private List jdField_c_of_type_JavaUtilList = null;
  private ConcurrentHashMap jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  public volatile boolean c;
  public volatile long d;
  private Runnable jdField_d_of_type_JavaLangRunnable = new nbd(this);
  private List jdField_d_of_type_JavaUtilList = null;
  private ConcurrentHashMap jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  volatile boolean jdField_d_of_type_Boolean;
  public long e;
  private volatile List jdField_e_of_type_JavaUtilList = null;
  private ConcurrentHashMap jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  public boolean e;
  private List jdField_f_of_type_JavaUtilList = null;
  private ConcurrentHashMap jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  private List jdField_g_of_type_JavaUtilList = null;
  public boolean g;
  private List jdField_h_of_type_JavaUtilList = null;
  private boolean jdField_j_of_type_Boolean;
  private boolean jdField_k_of_type_Boolean;
  private volatile boolean jdField_l_of_type_Boolean;
  private volatile boolean n = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 120000L;
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "data1", "display_name", "contact_id", "data2", "data3" };
    jdField_f_of_type_Boolean = false;
    jdField_b_of_type_Int = 0;
    jdField_c_of_type_Int = 2;
    jdField_h_of_type_Boolean = false;
  }
  
  public PhoneContactManagerImp(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_Boolean = false;
    jdField_b_of_type_Long = 0L;
    jdField_c_of_type_Long = 0L;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Long = 0L;
    jdField_a_of_type_Int = -1;
    jdField_e_of_type_Boolean = false;
    j = false;
    k = false;
    l = false;
    jdField_g_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidContentSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences("contact_bind_info" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0);
    jdField_b_of_type_AndroidContentSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences("contact_bind_info_global", 0);
    jdField_a_of_type_ArrayOfByte = jdField_a_of_type_AndroidContentSharedPreferences.getString("session_id", "").getBytes();
    jdField_a_of_type_Long = jdField_b_of_type_AndroidContentSharedPreferences.getLong("query_contact_list_min_interval", jdField_a_of_type_Long);
    jdField_a_of_type_Int = a(a());
    jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    ThreadManager.a(new nbb(this), 2, null, false);
  }
  
  private int a(RespondQueryQQBindingStat paramRespondQueryQQBindingStat)
  {
    if (paramRespondQueryQQBindingStat == null) {}
    do
    {
      return 0;
      if (QLog.isColorLevel()) {
        QLog.d("PhoneContact", 2, "getSelfBindState : " + a() + " " + mobileNo + " " + originBinder + " " + MobileUniqueNo + " " + lastUsedFlag + " " + isRecommend + " " + bindingTime);
      }
      if (TextUtils.isEmpty(mobileNo)) {
        return 1;
      }
      if ((originBinder == 2L) || (originBinder == 3L)) {
        return 2;
      }
    } while (originBinder != 1L);
    if (MobileUniqueNo.equals("init padding")) {
      MobileUniqueNo = null;
    }
    if ((TextUtils.isEmpty(MobileUniqueNo)) || (isStopFindMatch)) {
      return 4;
    }
    if (a().equalsIgnoreCase(MobileUniqueNo)) {
      return 6;
    }
    return 3;
  }
  
  private String a(byte[] paramArrayOfByte, String paramString)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0)) {
      return paramString;
    }
    paramString = paramString.getBytes();
    int i2 = paramString.length;
    paramArrayOfByte = a(paramArrayOfByte);
    paramString = a(paramString);
    int i1 = 0;
    while (i1 < i2)
    {
      paramArrayOfByte[i1] = ((byte)(paramString[i1] ^ paramArrayOfByte[i1]));
      i1 += 1;
    }
    i2 = paramArrayOfByte.length;
    i1 = i2 - 1;
    if (i1 >= 0) {
      if (paramArrayOfByte[i1] == 0) {}
    }
    for (;;)
    {
      if (i1 != i2 - 1)
      {
        paramString = new byte[i1 + 1];
        System.arraycopy(paramArrayOfByte, 0, paramString, 0, i1 + 1);
        paramArrayOfByte = paramString;
      }
      for (;;)
      {
        return new String(a(paramArrayOfByte));
        i1 -= 1;
        break;
      }
      i1 = 0;
    }
  }
  
  /* Error */
  private ArrayList a()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 9
    //   3: aconst_null
    //   4: astore 8
    //   6: aload_0
    //   7: invokespecial 373	com/tencent/mobileqq/app/PhoneContactManagerImp:m	()V
    //   10: aload_0
    //   11: getfield 200	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   14: invokevirtual 205	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   17: invokevirtual 377	com/tencent/qphone/base/util/BaseApplication:getContentResolver	()Landroid/content/ContentResolver;
    //   20: getstatic 383	android/provider/ContactsContract$CommonDataKinds$Phone:CONTENT_URI	Landroid/net/Uri;
    //   23: getstatic 93	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ArrayOfJavaLangString	[Ljava/lang/String;
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: invokevirtual 389	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore 7
    //   34: new 391	java/util/ArrayList
    //   37: dup
    //   38: invokespecial 392	java/util/ArrayList:<init>	()V
    //   41: astore 12
    //   43: aload 7
    //   45: ifnull +779 -> 824
    //   48: invokestatic 396	java/lang/System:currentTimeMillis	()J
    //   51: lstore_3
    //   52: aload 7
    //   54: invokeinterface 402 1 0
    //   59: istore_1
    //   60: aload 12
    //   62: iload_1
    //   63: invokevirtual 406	java/util/ArrayList:ensureCapacity	(I)V
    //   66: new 122	java/util/concurrent/ConcurrentHashMap
    //   69: dup
    //   70: iload_1
    //   71: invokespecial 408	java/util/concurrent/ConcurrentHashMap:<init>	(I)V
    //   74: astore 13
    //   76: aload 8
    //   78: astore 6
    //   80: aload 9
    //   82: astore 5
    //   84: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   87: ifeq +38 -> 125
    //   90: aload 8
    //   92: astore 6
    //   94: aload 9
    //   96: astore 5
    //   98: ldc_w 410
    //   101: iconst_2
    //   102: new 207	java/lang/StringBuilder
    //   105: dup
    //   106: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   109: ldc_w 412
    //   112: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: iload_1
    //   116: invokevirtual 415	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   119: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   122: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   125: aload 8
    //   127: astore 6
    //   129: aload 9
    //   131: astore 5
    //   133: aload_0
    //   134: getfield 272	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager	Lcom/tencent/mobileqq/persistence/EntityManager;
    //   137: invokevirtual 420	com/tencent/mobileqq/persistence/EntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   140: astore 8
    //   142: aload 8
    //   144: astore 6
    //   146: aload 8
    //   148: astore 5
    //   150: aload 8
    //   152: invokevirtual 424	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   155: aload 8
    //   157: astore 6
    //   159: aload 8
    //   161: astore 5
    //   163: aload 7
    //   165: invokeinterface 427 1 0
    //   170: pop
    //   171: aload 8
    //   173: astore 6
    //   175: aload 8
    //   177: astore 5
    //   179: aload 7
    //   181: invokeinterface 430 1 0
    //   186: ifne +600 -> 786
    //   189: aload 8
    //   191: astore 6
    //   193: aload 8
    //   195: astore 5
    //   197: aload 7
    //   199: aload 7
    //   201: ldc 83
    //   203: invokeinterface 434 2 0
    //   208: invokeinterface 437 2 0
    //   213: invokestatic 442	com/tencent/mobileqq/app/PhoneContactHelper:a	(Ljava/lang/String;)Ljava/lang/String;
    //   216: astore 10
    //   218: aload 8
    //   220: astore 6
    //   222: aload 8
    //   224: astore 5
    //   226: aload 7
    //   228: aload 7
    //   230: ldc 85
    //   232: invokeinterface 434 2 0
    //   237: invokeinterface 437 2 0
    //   242: astore 11
    //   244: aload 11
    //   246: astore 9
    //   248: aload 8
    //   250: astore 6
    //   252: aload 8
    //   254: astore 5
    //   256: aload 11
    //   258: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   261: ifeq +7 -> 268
    //   264: aload 10
    //   266: astore 9
    //   268: aload 8
    //   270: astore 6
    //   272: aload 8
    //   274: astore 5
    //   276: aload 7
    //   278: aload 7
    //   280: ldc 87
    //   282: invokeinterface 434 2 0
    //   287: invokeinterface 446 2 0
    //   292: istore_1
    //   293: aload 8
    //   295: astore 6
    //   297: aload 8
    //   299: astore 5
    //   301: aload 7
    //   303: aload 7
    //   305: ldc 89
    //   307: invokeinterface 434 2 0
    //   312: invokeinterface 446 2 0
    //   317: istore_2
    //   318: aload 8
    //   320: astore 6
    //   322: aload 8
    //   324: astore 5
    //   326: aload 7
    //   328: aload 7
    //   330: ldc 91
    //   332: invokeinterface 434 2 0
    //   337: invokeinterface 437 2 0
    //   342: astore 11
    //   344: aload 8
    //   346: astore 6
    //   348: aload 8
    //   350: astore 5
    //   352: aload 10
    //   354: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   357: ifne +19 -> 376
    //   360: aload 8
    //   362: astore 6
    //   364: aload 8
    //   366: astore 5
    //   368: aload 9
    //   370: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   373: ifeq +147 -> 520
    //   376: aload 8
    //   378: astore 6
    //   380: aload 8
    //   382: astore 5
    //   384: aload 7
    //   386: invokeinterface 449 1 0
    //   391: pop
    //   392: goto -221 -> 171
    //   395: astore 8
    //   397: aload 6
    //   399: astore 5
    //   401: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   404: ifeq +18 -> 422
    //   407: aload 6
    //   409: astore 5
    //   411: ldc_w 410
    //   414: iconst_2
    //   415: ldc -19
    //   417: aload 8
    //   419: invokestatic 452	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   422: aload 6
    //   424: ifnull +8 -> 432
    //   427: aload 6
    //   429: invokevirtual 454	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   432: aload 7
    //   434: invokeinterface 457 1 0
    //   439: aload_0
    //   440: aload 13
    //   442: invokespecial 460	com/tencent/mobileqq/app/PhoneContactManagerImp:a	(Ljava/util/concurrent/ConcurrentHashMap;)V
    //   445: aload_0
    //   446: getfield 158	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   449: invokevirtual 464	java/util/concurrent/ConcurrentHashMap:values	()Ljava/util/Collection;
    //   452: invokeinterface 470 1 0
    //   457: astore 5
    //   459: aload 5
    //   461: invokeinterface 475 1 0
    //   466: ifeq +358 -> 824
    //   469: aload 5
    //   471: invokeinterface 479 1 0
    //   476: checkcast 481	com/tencent/mobileqq/data/PhoneContact
    //   479: astore 6
    //   481: aload 12
    //   483: new 483	SecurityAccountServer/AddressBookItem
    //   486: dup
    //   487: aload 6
    //   489: getfield 484	com/tencent/mobileqq/data/PhoneContact:mobileNo	Ljava/lang/String;
    //   492: aload 6
    //   494: getfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   497: invokespecial 490	SecurityAccountServer/AddressBookItem:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   500: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   503: pop
    //   504: goto -45 -> 459
    //   507: astore 5
    //   509: aload 5
    //   511: invokevirtual 496	java/lang/Exception:printStackTrace	()V
    //   514: aconst_null
    //   515: astore 7
    //   517: goto -483 -> 34
    //   520: aload 8
    //   522: astore 6
    //   524: aload 8
    //   526: astore 5
    //   528: new 481	com/tencent/mobileqq/data/PhoneContact
    //   531: dup
    //   532: invokespecial 497	com/tencent/mobileqq/data/PhoneContact:<init>	()V
    //   535: astore 14
    //   537: aload 8
    //   539: astore 6
    //   541: aload 8
    //   543: astore 5
    //   545: aload 14
    //   547: aload 10
    //   549: putfield 484	com/tencent/mobileqq/data/PhoneContact:mobileNo	Ljava/lang/String;
    //   552: aload 8
    //   554: astore 6
    //   556: aload 8
    //   558: astore 5
    //   560: aload 14
    //   562: aload 9
    //   564: putfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   567: aload 8
    //   569: astore 6
    //   571: aload 8
    //   573: astore 5
    //   575: aload 14
    //   577: iload_1
    //   578: putfield 500	com/tencent/mobileqq/data/PhoneContact:contactID	I
    //   581: aload 8
    //   583: astore 6
    //   585: aload 8
    //   587: astore 5
    //   589: aload 14
    //   591: iload_2
    //   592: putfield 503	com/tencent/mobileqq/data/PhoneContact:type	I
    //   595: aload 8
    //   597: astore 6
    //   599: aload 8
    //   601: astore 5
    //   603: aload 14
    //   605: aload 11
    //   607: putfield 506	com/tencent/mobileqq/data/PhoneContact:label	Ljava/lang/String;
    //   610: aload 8
    //   612: astore 6
    //   614: aload 8
    //   616: astore 5
    //   618: aload 14
    //   620: lload_3
    //   621: putfield 509	com/tencent/mobileqq/data/PhoneContact:lastScanTime	J
    //   624: aload 8
    //   626: astore 6
    //   628: aload 8
    //   630: astore 5
    //   632: aload 14
    //   634: aload 9
    //   636: iconst_1
    //   637: invokestatic 514	com/tencent/mobileqq/utils/ChnToSpell:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   640: putfield 517	com/tencent/mobileqq/data/PhoneContact:pinyinAll	Ljava/lang/String;
    //   643: aload 8
    //   645: astore 6
    //   647: aload 8
    //   649: astore 5
    //   651: aload 14
    //   653: aload 9
    //   655: iconst_2
    //   656: invokestatic 514	com/tencent/mobileqq/utils/ChnToSpell:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   659: putfield 520	com/tencent/mobileqq/data/PhoneContact:pinyinInitial	Ljava/lang/String;
    //   662: aload 8
    //   664: astore 6
    //   666: aload 8
    //   668: astore 5
    //   670: aload 14
    //   672: aload 14
    //   674: getfield 520	com/tencent/mobileqq/data/PhoneContact:pinyinInitial	Ljava/lang/String;
    //   677: invokestatic 522	com/tencent/mobileqq/app/PhoneContactHelper:b	(Ljava/lang/String;)Ljava/lang/String;
    //   680: putfield 525	com/tencent/mobileqq/data/PhoneContact:pinyinFirst	Ljava/lang/String;
    //   683: aload 8
    //   685: astore 6
    //   687: aload 8
    //   689: astore 5
    //   691: aload 14
    //   693: aload 9
    //   695: aload 10
    //   697: invokestatic 527	com/tencent/mobileqq/app/PhoneContactHelper:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   700: putfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   703: aload 8
    //   705: astore 6
    //   707: aload 8
    //   709: astore 5
    //   711: aload 13
    //   713: aload 10
    //   715: aload 14
    //   717: invokevirtual 534	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   720: pop
    //   721: aload 8
    //   723: astore 6
    //   725: aload 8
    //   727: astore 5
    //   729: aload_0
    //   730: getfield 164	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   733: aload 14
    //   735: getfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   738: aload 14
    //   740: invokevirtual 534	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   743: pop
    //   744: aload 8
    //   746: astore 6
    //   748: aload 8
    //   750: astore 5
    //   752: aload_0
    //   753: getfield 272	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager	Lcom/tencent/mobileqq/persistence/EntityManager;
    //   756: aload 14
    //   758: invokevirtual 537	com/tencent/mobileqq/persistence/EntityManager:b	(Lcom/tencent/mobileqq/persistence/Entity;)V
    //   761: goto -385 -> 376
    //   764: astore 6
    //   766: aload 5
    //   768: ifnull +8 -> 776
    //   771: aload 5
    //   773: invokevirtual 454	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   776: aload 7
    //   778: invokeinterface 457 1 0
    //   783: aload 6
    //   785: athrow
    //   786: aload 8
    //   788: astore 6
    //   790: aload 8
    //   792: astore 5
    //   794: aload 8
    //   796: invokevirtual 539	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   799: aload 8
    //   801: ifnull +8 -> 809
    //   804: aload 8
    //   806: invokevirtual 454	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   809: aload 7
    //   811: invokeinterface 457 1 0
    //   816: goto -377 -> 439
    //   819: astore 5
    //   821: goto -382 -> 439
    //   824: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   827: ifeq +34 -> 861
    //   830: ldc_w 410
    //   833: iconst_2
    //   834: new 207	java/lang/StringBuilder
    //   837: dup
    //   838: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   841: ldc_w 541
    //   844: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   847: aload 12
    //   849: invokevirtual 544	java/util/ArrayList:size	()I
    //   852: invokevirtual 415	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   855: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   858: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   861: aload_0
    //   862: iconst_1
    //   863: putfield 546	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_d_of_type_Boolean	Z
    //   866: aload 12
    //   868: areturn
    //   869: astore 5
    //   871: goto -432 -> 439
    //   874: astore 5
    //   876: goto -93 -> 783
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	879	0	this	PhoneContactManagerImp
    //   59	519	1	i1	int
    //   317	275	2	i2	int
    //   51	570	3	l1	long
    //   82	388	5	localObject1	Object
    //   507	3	5	localException1	Exception
    //   526	267	5	localStaleDataException1	android.database.StaleDataException
    //   819	1	5	localException2	Exception
    //   869	1	5	localException3	Exception
    //   874	1	5	localException4	Exception
    //   78	669	6	localObject2	Object
    //   764	20	6	localObject3	Object
    //   788	1	6	localStaleDataException2	android.database.StaleDataException
    //   32	778	7	localCursor	android.database.Cursor
    //   4	377	8	localEntityTransaction	EntityTransaction
    //   395	410	8	localStaleDataException3	android.database.StaleDataException
    //   1	693	9	localObject4	Object
    //   216	498	10	str1	String
    //   242	364	11	str2	String
    //   41	826	12	localArrayList	ArrayList
    //   74	638	13	localConcurrentHashMap	ConcurrentHashMap
    //   535	222	14	localPhoneContact	PhoneContact
    // Exception table:
    //   from	to	target	type
    //   84	90	395	android/database/StaleDataException
    //   98	125	395	android/database/StaleDataException
    //   133	142	395	android/database/StaleDataException
    //   150	155	395	android/database/StaleDataException
    //   163	171	395	android/database/StaleDataException
    //   179	189	395	android/database/StaleDataException
    //   197	218	395	android/database/StaleDataException
    //   226	244	395	android/database/StaleDataException
    //   256	264	395	android/database/StaleDataException
    //   276	293	395	android/database/StaleDataException
    //   301	318	395	android/database/StaleDataException
    //   326	344	395	android/database/StaleDataException
    //   352	360	395	android/database/StaleDataException
    //   368	376	395	android/database/StaleDataException
    //   384	392	395	android/database/StaleDataException
    //   528	537	395	android/database/StaleDataException
    //   545	552	395	android/database/StaleDataException
    //   560	567	395	android/database/StaleDataException
    //   575	581	395	android/database/StaleDataException
    //   589	595	395	android/database/StaleDataException
    //   603	610	395	android/database/StaleDataException
    //   618	624	395	android/database/StaleDataException
    //   632	643	395	android/database/StaleDataException
    //   651	662	395	android/database/StaleDataException
    //   670	683	395	android/database/StaleDataException
    //   691	703	395	android/database/StaleDataException
    //   711	721	395	android/database/StaleDataException
    //   729	744	395	android/database/StaleDataException
    //   752	761	395	android/database/StaleDataException
    //   794	799	395	android/database/StaleDataException
    //   10	34	507	java/lang/Exception
    //   84	90	764	finally
    //   98	125	764	finally
    //   133	142	764	finally
    //   150	155	764	finally
    //   163	171	764	finally
    //   179	189	764	finally
    //   197	218	764	finally
    //   226	244	764	finally
    //   256	264	764	finally
    //   276	293	764	finally
    //   301	318	764	finally
    //   326	344	764	finally
    //   352	360	764	finally
    //   368	376	764	finally
    //   384	392	764	finally
    //   401	407	764	finally
    //   411	422	764	finally
    //   528	537	764	finally
    //   545	552	764	finally
    //   560	567	764	finally
    //   575	581	764	finally
    //   589	595	764	finally
    //   603	610	764	finally
    //   618	624	764	finally
    //   632	643	764	finally
    //   651	662	764	finally
    //   670	683	764	finally
    //   691	703	764	finally
    //   711	721	764	finally
    //   729	744	764	finally
    //   752	761	764	finally
    //   794	799	764	finally
    //   809	816	819	java/lang/Exception
    //   432	439	869	java/lang/Exception
    //   776	783	874	java/lang/Exception
  }
  
  /* Error */
  private ArrayList a(ArrayList paramArrayList1, ArrayList paramArrayList2)
  {
    // Byte code:
    //   0: new 551	java/util/HashMap
    //   3: dup
    //   4: invokespecial 552	java/util/HashMap:<init>	()V
    //   7: astore 12
    //   9: new 391	java/util/ArrayList
    //   12: dup
    //   13: invokespecial 392	java/util/ArrayList:<init>	()V
    //   16: astore 11
    //   18: invokestatic 396	java/lang/System:currentTimeMillis	()J
    //   21: lstore 5
    //   23: aload_0
    //   24: getfield 200	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   27: invokevirtual 205	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   30: invokevirtual 377	com/tencent/qphone/base/util/BaseApplication:getContentResolver	()Landroid/content/ContentResolver;
    //   33: astore 7
    //   35: aload 7
    //   37: getstatic 383	android/provider/ContactsContract$CommonDataKinds$Phone:CONTENT_URI	Landroid/net/Uri;
    //   40: getstatic 93	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ArrayOfJavaLangString	[Ljava/lang/String;
    //   43: aconst_null
    //   44: aconst_null
    //   45: aconst_null
    //   46: invokevirtual 389	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   49: astore 8
    //   51: aload 8
    //   53: ifnull +248 -> 301
    //   56: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   59: ifeq +36 -> 95
    //   62: ldc_w 410
    //   65: iconst_2
    //   66: new 207	java/lang/StringBuilder
    //   69: dup
    //   70: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   73: ldc_w 554
    //   76: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   79: aload 8
    //   81: invokeinterface 402 1 0
    //   86: invokevirtual 415	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   89: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   92: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   95: aconst_null
    //   96: astore 7
    //   98: aload_0
    //   99: getfield 272	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager	Lcom/tencent/mobileqq/persistence/EntityManager;
    //   102: invokevirtual 420	com/tencent/mobileqq/persistence/EntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   105: astore 9
    //   107: aload 9
    //   109: astore 7
    //   111: aload 7
    //   113: invokevirtual 424	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   116: aload 8
    //   118: invokeinterface 427 1 0
    //   123: pop
    //   124: aload 8
    //   126: invokeinterface 430 1 0
    //   131: ifne +671 -> 802
    //   134: aload 8
    //   136: aload 8
    //   138: ldc 83
    //   140: invokeinterface 434 2 0
    //   145: invokeinterface 437 2 0
    //   150: invokestatic 442	com/tencent/mobileqq/app/PhoneContactHelper:a	(Ljava/lang/String;)Ljava/lang/String;
    //   153: astore 10
    //   155: aload 8
    //   157: aload 8
    //   159: ldc 85
    //   161: invokeinterface 434 2 0
    //   166: invokeinterface 437 2 0
    //   171: astore 9
    //   173: aload 9
    //   175: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   178: ifeq +1009 -> 1187
    //   181: aload 10
    //   183: astore 9
    //   185: aload 8
    //   187: aload 8
    //   189: ldc 87
    //   191: invokeinterface 434 2 0
    //   196: invokeinterface 446 2 0
    //   201: istore_3
    //   202: aload 8
    //   204: aload 8
    //   206: ldc 89
    //   208: invokeinterface 434 2 0
    //   213: invokeinterface 446 2 0
    //   218: istore 4
    //   220: aload 8
    //   222: aload 8
    //   224: ldc 91
    //   226: invokeinterface 434 2 0
    //   231: invokeinterface 437 2 0
    //   236: astore 13
    //   238: aload 10
    //   240: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   243: ifne +11 -> 254
    //   246: aload 9
    //   248: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   251: ifeq +176 -> 427
    //   254: aload 8
    //   256: invokeinterface 449 1 0
    //   261: pop
    //   262: goto -138 -> 124
    //   265: astore 9
    //   267: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   270: ifeq +14 -> 284
    //   273: ldc_w 410
    //   276: iconst_2
    //   277: ldc -19
    //   279: aload 9
    //   281: invokestatic 452	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   284: aload 7
    //   286: ifnull +8 -> 294
    //   289: aload 7
    //   291: invokevirtual 454	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   294: aload 8
    //   296: invokeinterface 457 1 0
    //   301: aload_0
    //   302: iconst_0
    //   303: putfield 154	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_g_of_type_Boolean	Z
    //   306: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   309: ifeq +35 -> 344
    //   312: ldc_w 410
    //   315: iconst_2
    //   316: new 207	java/lang/StringBuilder
    //   319: dup
    //   320: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   323: ldc_w 556
    //   326: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   329: invokestatic 396	java/lang/System:currentTimeMillis	()J
    //   332: lload 5
    //   334: lsub
    //   335: invokevirtual 309	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   338: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   341: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   344: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   347: ifeq +33 -> 380
    //   350: ldc_w 410
    //   353: iconst_2
    //   354: new 207	java/lang/StringBuilder
    //   357: dup
    //   358: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   361: ldc_w 558
    //   364: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   367: aload_1
    //   368: invokevirtual 544	java/util/ArrayList:size	()I
    //   371: invokevirtual 415	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   374: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   377: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   380: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   383: ifeq +33 -> 416
    //   386: ldc_w 410
    //   389: iconst_2
    //   390: new 207	java/lang/StringBuilder
    //   393: dup
    //   394: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   397: ldc_w 560
    //   400: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   403: aload_2
    //   404: invokevirtual 544	java/util/ArrayList:size	()I
    //   407: invokevirtual 415	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   410: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   413: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   416: aload 11
    //   418: areturn
    //   419: astore 7
    //   421: aconst_null
    //   422: astore 8
    //   424: goto -373 -> 51
    //   427: aload_0
    //   428: getfield 158	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   431: aload 10
    //   433: invokevirtual 564	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   436: checkcast 481	com/tencent/mobileqq/data/PhoneContact
    //   439: astore 14
    //   441: aload 14
    //   443: ifnonnull +174 -> 617
    //   446: new 481	com/tencent/mobileqq/data/PhoneContact
    //   449: dup
    //   450: invokespecial 497	com/tencent/mobileqq/data/PhoneContact:<init>	()V
    //   453: astore 14
    //   455: aload 14
    //   457: aload 10
    //   459: putfield 484	com/tencent/mobileqq/data/PhoneContact:mobileNo	Ljava/lang/String;
    //   462: aload 14
    //   464: aload 9
    //   466: putfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   469: aload 14
    //   471: iload_3
    //   472: putfield 500	com/tencent/mobileqq/data/PhoneContact:contactID	I
    //   475: aload 14
    //   477: iload 4
    //   479: putfield 503	com/tencent/mobileqq/data/PhoneContact:type	I
    //   482: aload 14
    //   484: aload 13
    //   486: putfield 506	com/tencent/mobileqq/data/PhoneContact:label	Ljava/lang/String;
    //   489: aload 14
    //   491: lload 5
    //   493: putfield 509	com/tencent/mobileqq/data/PhoneContact:lastScanTime	J
    //   496: aload 14
    //   498: aload 9
    //   500: iconst_1
    //   501: invokestatic 514	com/tencent/mobileqq/utils/ChnToSpell:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   504: putfield 517	com/tencent/mobileqq/data/PhoneContact:pinyinAll	Ljava/lang/String;
    //   507: aload 14
    //   509: aload 9
    //   511: iconst_2
    //   512: invokestatic 514	com/tencent/mobileqq/utils/ChnToSpell:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   515: putfield 520	com/tencent/mobileqq/data/PhoneContact:pinyinInitial	Ljava/lang/String;
    //   518: aload 14
    //   520: aload 14
    //   522: getfield 520	com/tencent/mobileqq/data/PhoneContact:pinyinInitial	Ljava/lang/String;
    //   525: invokestatic 522	com/tencent/mobileqq/app/PhoneContactHelper:b	(Ljava/lang/String;)Ljava/lang/String;
    //   528: putfield 525	com/tencent/mobileqq/data/PhoneContact:pinyinFirst	Ljava/lang/String;
    //   531: aload_0
    //   532: getfield 158	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   535: aload 10
    //   537: aload 14
    //   539: invokevirtual 534	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   542: pop
    //   543: aload 14
    //   545: aload 9
    //   547: aload 10
    //   549: invokestatic 527	com/tencent/mobileqq/app/PhoneContactHelper:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   552: putfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   555: aload_0
    //   556: getfield 164	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   559: aload 14
    //   561: getfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   564: aload 14
    //   566: invokevirtual 534	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   569: pop
    //   570: aload 11
    //   572: aload 14
    //   574: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   577: pop
    //   578: aload_1
    //   579: new 483	SecurityAccountServer/AddressBookItem
    //   582: dup
    //   583: aload 10
    //   585: aload 9
    //   587: invokespecial 490	SecurityAccountServer/AddressBookItem:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   590: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   593: pop
    //   594: goto -340 -> 254
    //   597: astore_1
    //   598: aload 7
    //   600: ifnull +8 -> 608
    //   603: aload 7
    //   605: invokevirtual 454	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   608: aload 8
    //   610: invokeinterface 457 1 0
    //   615: aload_1
    //   616: athrow
    //   617: aload 14
    //   619: iload_3
    //   620: putfield 500	com/tencent/mobileqq/data/PhoneContact:contactID	I
    //   623: aload 14
    //   625: lload 5
    //   627: putfield 509	com/tencent/mobileqq/data/PhoneContact:lastScanTime	J
    //   630: aload 14
    //   632: getfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   635: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   638: ifeq +33 -> 671
    //   641: aload 14
    //   643: aload 14
    //   645: getfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   648: aload 10
    //   650: invokestatic 527	com/tencent/mobileqq/app/PhoneContactHelper:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   653: putfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   656: aload_0
    //   657: getfield 164	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   660: aload 14
    //   662: getfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   665: aload 14
    //   667: invokevirtual 534	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   670: pop
    //   671: aload 14
    //   673: getfield 567	com/tencent/mobileqq/data/PhoneContact:isUploaded	Z
    //   676: ifeq +99 -> 775
    //   679: aload 9
    //   681: aload 14
    //   683: getfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   686: invokevirtual 340	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   689: ifne +75 -> 764
    //   692: aload 12
    //   694: aload 10
    //   696: aload 9
    //   698: invokevirtual 568	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   701: pop
    //   702: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   705: ifeq -451 -> 254
    //   708: ldc_w 410
    //   711: iconst_2
    //   712: new 207	java/lang/StringBuilder
    //   715: dup
    //   716: invokespecial 208	java/lang/StringBuilder:<init>	()V
    //   719: ldc_w 570
    //   722: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   725: aload 14
    //   727: getfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   730: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   733: ldc_w 572
    //   736: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   739: aload 9
    //   741: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   744: ldc_w 574
    //   747: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   750: aload 10
    //   752: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   755: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   758: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   761: goto -507 -> 254
    //   764: aload 12
    //   766: aload 10
    //   768: invokevirtual 577	java/util/HashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   771: pop
    //   772: goto -518 -> 254
    //   775: aload_1
    //   776: new 483	SecurityAccountServer/AddressBookItem
    //   779: dup
    //   780: aload 10
    //   782: aload 9
    //   784: invokespecial 490	SecurityAccountServer/AddressBookItem:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   787: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   790: pop
    //   791: aload 11
    //   793: aload 14
    //   795: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   798: pop
    //   799: goto -545 -> 254
    //   802: aload 12
    //   804: invokevirtual 581	java/util/HashMap:keySet	()Ljava/util/Set;
    //   807: invokeinterface 584 1 0
    //   812: astore 9
    //   814: aload 9
    //   816: invokeinterface 475 1 0
    //   821: ifeq +176 -> 997
    //   824: aload 9
    //   826: invokeinterface 479 1 0
    //   831: checkcast 81	java/lang/String
    //   834: astore 10
    //   836: aload_0
    //   837: getfield 158	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   840: aload 10
    //   842: invokevirtual 564	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   845: checkcast 481	com/tencent/mobileqq/data/PhoneContact
    //   848: astore 13
    //   850: aload 13
    //   852: ifnull -38 -> 814
    //   855: aload 12
    //   857: aload 10
    //   859: invokevirtual 585	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   862: checkcast 81	java/lang/String
    //   865: astore 14
    //   867: aload_2
    //   868: new 483	SecurityAccountServer/AddressBookItem
    //   871: dup
    //   872: aload 10
    //   874: aload 13
    //   876: getfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   879: invokespecial 490	SecurityAccountServer/AddressBookItem:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   882: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   885: pop
    //   886: aload_1
    //   887: new 483	SecurityAccountServer/AddressBookItem
    //   890: dup
    //   891: aload 10
    //   893: aload 14
    //   895: invokespecial 490	SecurityAccountServer/AddressBookItem:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   898: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   901: pop
    //   902: aload 13
    //   904: aload 14
    //   906: putfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   909: aload 13
    //   911: aload 14
    //   913: iconst_1
    //   914: invokestatic 514	com/tencent/mobileqq/utils/ChnToSpell:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   917: putfield 517	com/tencent/mobileqq/data/PhoneContact:pinyinAll	Ljava/lang/String;
    //   920: aload 13
    //   922: aload 14
    //   924: iconst_2
    //   925: invokestatic 514	com/tencent/mobileqq/utils/ChnToSpell:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   928: putfield 520	com/tencent/mobileqq/data/PhoneContact:pinyinInitial	Ljava/lang/String;
    //   931: aload 13
    //   933: aload 13
    //   935: getfield 520	com/tencent/mobileqq/data/PhoneContact:pinyinInitial	Ljava/lang/String;
    //   938: invokestatic 522	com/tencent/mobileqq/app/PhoneContactHelper:b	(Ljava/lang/String;)Ljava/lang/String;
    //   941: putfield 525	com/tencent/mobileqq/data/PhoneContact:pinyinFirst	Ljava/lang/String;
    //   944: aload_0
    //   945: getfield 164	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   948: aload 13
    //   950: getfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   953: aload 13
    //   955: invokevirtual 588	java/util/concurrent/ConcurrentHashMap:remove	(Ljava/lang/Object;Ljava/lang/Object;)Z
    //   958: pop
    //   959: aload 13
    //   961: aload 14
    //   963: aload 10
    //   965: invokestatic 527	com/tencent/mobileqq/app/PhoneContactHelper:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   968: putfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   971: aload_0
    //   972: getfield 164	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   975: aload 13
    //   977: getfield 530	com/tencent/mobileqq/data/PhoneContact:md5	Ljava/lang/String;
    //   980: aload 13
    //   982: invokevirtual 534	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   985: pop
    //   986: aload 11
    //   988: aload 13
    //   990: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   993: pop
    //   994: goto -180 -> 814
    //   997: new 391	java/util/ArrayList
    //   1000: dup
    //   1001: invokespecial 392	java/util/ArrayList:<init>	()V
    //   1004: astore 9
    //   1006: aload_0
    //   1007: getfield 158	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   1010: invokevirtual 591	java/util/concurrent/ConcurrentHashMap:entrySet	()Ljava/util/Set;
    //   1013: invokeinterface 584 1 0
    //   1018: astore 10
    //   1020: aload 10
    //   1022: invokeinterface 475 1 0
    //   1027: ifeq +105 -> 1132
    //   1030: aload 10
    //   1032: invokeinterface 479 1 0
    //   1037: checkcast 593	java/util/Map$Entry
    //   1040: invokeinterface 596 1 0
    //   1045: checkcast 481	com/tencent/mobileqq/data/PhoneContact
    //   1048: astore 12
    //   1050: aload 12
    //   1052: getfield 509	com/tencent/mobileqq/data/PhoneContact:lastScanTime	J
    //   1055: lload 5
    //   1057: lcmp
    //   1058: ifeq -38 -> 1020
    //   1061: aload 12
    //   1063: getfield 599	com/tencent/mobileqq/data/PhoneContact:unifiedCode	Ljava/lang/String;
    //   1066: invokestatic 330	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   1069: ifne +16 -> 1085
    //   1072: aload_0
    //   1073: getfield 160	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   1076: aload 12
    //   1078: getfield 599	com/tencent/mobileqq/data/PhoneContact:unifiedCode	Ljava/lang/String;
    //   1081: invokevirtual 600	java/util/concurrent/ConcurrentHashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   1084: pop
    //   1085: aload 10
    //   1087: invokeinterface 602 1 0
    //   1092: aload_0
    //   1093: getfield 272	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager	Lcom/tencent/mobileqq/persistence/EntityManager;
    //   1096: aload 12
    //   1098: invokevirtual 605	com/tencent/mobileqq/persistence/EntityManager:b	(Lcom/tencent/mobileqq/persistence/Entity;)Z
    //   1101: pop
    //   1102: aload_2
    //   1103: new 483	SecurityAccountServer/AddressBookItem
    //   1106: dup
    //   1107: aload 12
    //   1109: getfield 484	com/tencent/mobileqq/data/PhoneContact:mobileNo	Ljava/lang/String;
    //   1112: aload 12
    //   1114: getfield 487	com/tencent/mobileqq/data/PhoneContact:name	Ljava/lang/String;
    //   1117: invokespecial 490	SecurityAccountServer/AddressBookItem:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   1120: invokevirtual 493	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   1123: pop
    //   1124: aload 9
    //   1126: invokevirtual 608	java/util/ArrayList:clear	()V
    //   1129: goto -109 -> 1020
    //   1132: aload 7
    //   1134: invokevirtual 539	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   1137: aload 7
    //   1139: ifnull +8 -> 1147
    //   1142: aload 7
    //   1144: invokevirtual 454	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1147: aload 8
    //   1149: invokeinterface 457 1 0
    //   1154: goto -853 -> 301
    //   1157: astore 7
    //   1159: goto -858 -> 301
    //   1162: astore 7
    //   1164: goto -863 -> 301
    //   1167: astore_2
    //   1168: goto -553 -> 615
    //   1171: astore_1
    //   1172: aconst_null
    //   1173: astore 7
    //   1175: goto -577 -> 598
    //   1178: astore_1
    //   1179: goto -581 -> 598
    //   1182: astore 9
    //   1184: goto -917 -> 267
    //   1187: goto -1002 -> 185
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1190	0	this	PhoneContactManagerImp
    //   0	1190	1	paramArrayList1	ArrayList
    //   0	1190	2	paramArrayList2	ArrayList
    //   201	419	3	i1	int
    //   218	260	4	i2	int
    //   21	1035	5	l1	long
    //   33	257	7	localObject1	Object
    //   419	724	7	localThrowable	Throwable
    //   1157	1	7	localException1	Exception
    //   1162	1	7	localException2	Exception
    //   1173	1	7	localObject2	Object
    //   49	1099	8	localCursor	android.database.Cursor
    //   105	142	9	localObject3	Object
    //   265	518	9	localStaleDataException1	android.database.StaleDataException
    //   812	313	9	localObject4	Object
    //   1182	1	9	localStaleDataException2	android.database.StaleDataException
    //   153	933	10	localObject5	Object
    //   16	971	11	localArrayList	ArrayList
    //   7	1106	12	localObject6	Object
    //   236	753	13	localObject7	Object
    //   439	523	14	localObject8	Object
    // Exception table:
    //   from	to	target	type
    //   111	124	265	android/database/StaleDataException
    //   124	181	265	android/database/StaleDataException
    //   185	254	265	android/database/StaleDataException
    //   254	262	265	android/database/StaleDataException
    //   427	441	265	android/database/StaleDataException
    //   446	594	265	android/database/StaleDataException
    //   617	671	265	android/database/StaleDataException
    //   671	761	265	android/database/StaleDataException
    //   764	772	265	android/database/StaleDataException
    //   775	799	265	android/database/StaleDataException
    //   802	814	265	android/database/StaleDataException
    //   814	850	265	android/database/StaleDataException
    //   855	994	265	android/database/StaleDataException
    //   997	1020	265	android/database/StaleDataException
    //   1020	1085	265	android/database/StaleDataException
    //   1085	1129	265	android/database/StaleDataException
    //   1132	1137	265	android/database/StaleDataException
    //   35	51	419	java/lang/Throwable
    //   111	124	597	finally
    //   124	181	597	finally
    //   185	254	597	finally
    //   254	262	597	finally
    //   427	441	597	finally
    //   446	594	597	finally
    //   617	671	597	finally
    //   671	761	597	finally
    //   764	772	597	finally
    //   775	799	597	finally
    //   802	814	597	finally
    //   814	850	597	finally
    //   855	994	597	finally
    //   997	1020	597	finally
    //   1020	1085	597	finally
    //   1085	1129	597	finally
    //   1132	1137	597	finally
    //   1147	1154	1157	java/lang/Exception
    //   294	301	1162	java/lang/Exception
    //   608	615	1167	java/lang/Exception
    //   98	107	1171	finally
    //   267	284	1178	finally
    //   98	107	1182	android/database/StaleDataException
  }
  
  private void a(int paramInt)
  {
    if ((paramInt | 0x1) != 0)
    {
      jdField_d_of_type_JavaUtilList = null;
      jdField_c_of_type_JavaUtilList = null;
      jdField_f_of_type_JavaUtilList = null;
      jdField_h_of_type_JavaUtilList = null;
      MqqHandler localMqqHandler = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ContactListView.class);
      if (localMqqHandler != null)
      {
        localMqqHandler.removeMessages(2);
        localMqqHandler.sendEmptyMessageDelayed(2, 100L);
      }
      localMqqHandler = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ContactsInnerFrame.class);
      if (localMqqHandler != null)
      {
        localMqqHandler.removeMessages(3);
        localMqqHandler.sendEmptyMessageDelayed(3, 100L);
      }
    }
    jdField_e_of_type_JavaUtilList = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new nbv(this, paramInt));
  }
  
  private void a(long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "saveContactListTimeStamp" + paramLong1 + ", " + paramLong2);
    }
    jdField_a_of_type_AndroidContentSharedPreferences.edit().putLong("queryContactTimeStamp", paramLong1).putLong("queryRichInfoTimeStamp", paramLong2).commit();
  }
  
  private void a(RespondQueryQQBindingStat paramRespondQueryQQBindingStat)
  {
    int i1 = jdField_a_of_type_Int;
    int i2 = a(paramRespondQueryQQBindingStat);
    switch (i2)
    {
    }
    for (;;)
    {
      if (jdField_a_of_type_Int == 0) {
        jdField_a_of_type_Int = i2;
      }
      if (QLog.isColorLevel()) {
        QLog.d("PhoneContact", 2, "syncBindState newState = " + i2 + " lastState=" + i1 + " curState=" + jdField_a_of_type_Int + " sBeginWithUnind=" + jdField_h_of_type_Boolean);
      }
      if (i1 != jdField_a_of_type_Int) {
        n();
      }
      return;
      jdField_h_of_type_Boolean = true;
      if (jdField_a_of_type_Int != i2)
      {
        p();
        jdField_a_of_type_AndroidContentSharedPreferences.edit().putBoolean("key_show_contact_banner", true).commit();
      }
      jdField_a_of_type_Int = i2;
      continue;
      if (lastUsedFlag == 3L) {
        p();
      }
      jdField_a_of_type_Int = i2;
      continue;
      jdField_a_of_type_Int = i2;
    }
  }
  
  private void a(ConcurrentHashMap paramConcurrentHashMap)
  {
    Object localObject1 = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
    while (((Iterator)localObject1).hasNext())
    {
      Object localObject2 = (Map.Entry)((Iterator)localObject1).next();
      PhoneContact localPhoneContact = (PhoneContact)((Map.Entry)localObject2).getValue();
      localObject2 = (PhoneContact)paramConcurrentHashMap.get(((Map.Entry)localObject2).getKey());
      if ((localObject2 != null) && (localPhoneContact != null))
      {
        uin = uin;
        nationCode = nationCode;
        mobileCode = mobileCode;
        bindingDate = bindingDate;
        nickName = nickName;
        isUploaded = isUploaded;
        originBinder = originBinder;
        ability = ability;
      }
    }
    localObject1 = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap;
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap = paramConcurrentHashMap;
    ((ConcurrentHashMap)localObject1).clear();
  }
  
  private void a(boolean paramBoolean, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new nbg(this, paramBoolean, paramInt));
  }
  
  private boolean a(String paramString, ArrayList paramArrayList1, ArrayList paramArrayList2, ArrayList paramArrayList3)
  {
    if ((paramString == null) || ((paramArrayList1 == null) && (paramArrayList2 == null)))
    {
      jdField_c_of_type_Boolean = false;
      return false;
    }
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
    localNewIntent.putExtra("req_type", 15);
    localNewIntent.putExtra("unique_phone_no", paramString);
    localNewIntent.putExtra("add_contact_list", paramArrayList1);
    localNewIntent.putExtra("del_contact_list", paramArrayList2);
    localNewIntent.putExtra("rename_contact_list", paramArrayList3);
    localNewIntent.putExtra("next_flag", 0L);
    localNewIntent.putExtra("upload_package_no", 0);
    localNewIntent.putExtra("session_id", new byte[0]);
    localNewIntent.putExtra("is_resend", false);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
    return true;
  }
  
  private boolean a(boolean paramBoolean)
  {
    int i1;
    int i2;
    int i3;
    String str;
    Object localObject;
    if (jdField_a_of_type_Int == 1)
    {
      i1 = jdField_a_of_type_AndroidContentSharedPreferences.getInt("k_b_limit", -1);
      i2 = jdField_a_of_type_AndroidContentSharedPreferences.getInt("k_b_count", -1);
      i3 = jdField_a_of_type_AndroidContentSharedPreferences.getInt("k_b_time", 0);
      str = jdField_a_of_type_AndroidContentSharedPreferences.getString("K_b_msg", "");
      if (QLog.isColorLevel())
      {
        localObject = new StringBuilder(150);
        ((StringBuilder)localObject).append("checkBlockApp, limit = ").append(i1);
        ((StringBuilder)localObject).append(", count = ").append(i2);
        ((StringBuilder)localObject).append(", time = ").append(i3);
        ((StringBuilder)localObject).append(", msg = ").append(str);
        ((StringBuilder)localObject).append(", login = ").append(paramBoolean);
        ((StringBuilder)localObject).append(", blocked = ").append(j);
        QLog.d("PhoneContact.Manager", 2, ((StringBuilder)localObject).toString());
      }
      if ((i1 > 0) && (paramBoolean)) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80053D1", "0X80053D1", 0, 0, "", "", "", "");
      }
      if (i2 != -1) {
        break label244;
      }
      jdField_a_of_type_AndroidContentSharedPreferences.edit().putInt("k_b_count", 0).commit();
    }
    label244:
    do
    {
      do
      {
        return false;
      } while ((i2 >= i1) || (j));
      localObject = BaseActivity.sTopActivity;
    } while ((localObject == null) || ((localObject instanceof DialogBaseActivity)) || (app != jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
    j = true;
    k = true;
    jdField_a_of_type_AndroidContentSharedPreferences.edit().putInt("k_b_count", i2 + 1).commit();
    Intent localIntent = new Intent((Context)localObject, BindNumberActivity.class);
    localIntent.putExtra("key_is_modal_pop", true);
    localIntent.putExtra("k_is_block", true);
    localIntent.putExtra("k_block_time", i3);
    localIntent.putExtra("k_block_msg", str);
    ((BaseActivity)localObject).startActivity(localIntent);
    ((BaseActivity)localObject).overridePendingTransition(2130968765, 2130968589);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80053D2", "0X80053D2", 0, 0, "", "", "", "");
    return true;
  }
  
  private static byte[] a(byte[] paramArrayOfByte)
  {
    int i2 = 0;
    int i3 = paramArrayOfByte.length - 1;
    while (i3 > i2 * 2)
    {
      int i1 = paramArrayOfByte[i2];
      paramArrayOfByte[i2] = paramArrayOfByte[(i3 - i2)];
      paramArrayOfByte[(i3 - i2)] = i1;
      i2 += 1;
    }
    return paramArrayOfByte;
  }
  
  private String b()
  {
    Object localObject1 = jdField_a_of_type_AndroidContentSharedPreferences.getString("contact_bind_info_unique", "");
    if ((!TextUtils.isEmpty((CharSequence)localObject1)) && (!((String)localObject1).equals("null|null"))) {
      return localObject1;
    }
    Object localObject2 = c();
    localObject1 = localObject2;
    if (((String)localObject2).equals("|")) {
      localObject1 = c();
    }
    localObject2 = localObject1;
    if (((String)localObject1).equals("|"))
    {
      localObject1 = new Random();
      localObject2 = ((Random)localObject1).nextLong() + "|" + ((Random)localObject1).nextLong();
    }
    localObject1 = jdField_a_of_type_AndroidContentSharedPreferences.edit();
    ((SharedPreferences.Editor)localObject1).putString("contact_bind_info_unique", (String)localObject2);
    ((SharedPreferences.Editor)localObject1).commit();
    return localObject2;
  }
  
  private void b(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new nbf(this, paramInt));
  }
  
  private void b(long paramLong)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new nbh(this, paramLong));
  }
  
  private void b(String paramString)
  {
    jdField_a_of_type_AndroidContentSharedPreferences.edit().putString("key_contact_last_login", paramString).commit();
  }
  
  private void b(boolean paramBoolean)
  {
    int i1 = b();
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "pushRecommendUnreadCount: beAdded = " + paramBoolean + ", unreadCount = " + i1);
    }
    a(paramBoolean, i1);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.G();
  }
  
  private String c()
  {
    Object localObject = "";
    for (;;)
    {
      try
      {
        str1 = ((TelephonyManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSystemService("phone")).getDeviceId();
        localObject = str1;
      }
      catch (Exception localException2)
      {
        String str1;
        String str2;
        continue;
      }
      try
      {
        str1 = ((WifiManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSystemService("wifi")).getConnectionInfo().getMacAddress();
        return (String)localObject + "|" + str1;
      }
      catch (Exception localException1)
      {
        str2 = "";
      }
    }
  }
  
  private void c(List paramList)
  {
    Object localObject = jdField_a_of_type_AndroidContentSharedPreferences.getString("key_contact_last_login", "");
    StringBuilder localStringBuilder = new StringBuilder(((String)localObject).length() + paramList.size() * 13);
    localStringBuilder.append((String)localObject);
    localObject = new HashSet(jdField_a_of_type_JavaUtilSet.size() + paramList.size());
    ((Set)localObject).addAll(jdField_a_of_type_JavaUtilSet);
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      String str = (String)paramList.next();
      if (((Set)localObject).add(str)) {
        localStringBuilder.append('|').append(str);
      }
    }
    jdField_a_of_type_JavaUtilSet = ((Set)localObject);
    b(localStringBuilder.toString());
  }
  
  private void c(boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new nbk(this, paramBoolean));
  }
  
  private void d(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    }
    EntityTransaction localEntityTransaction = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
    localEntityTransaction.a();
    for (;;)
    {
      PhoneContact localPhoneContact;
      try
      {
        Enumeration localEnumeration = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.elements();
        if (!localEnumeration.hasMoreElements()) {
          break;
        }
        localPhoneContact = (PhoneContact)localEnumeration.nextElement();
        if ((uin == null) || (uin.length() <= 0)) {
          continue;
        }
        if (paramBoolean)
        {
          bindingDate = 0L;
          isRecommend = 0;
          uin = "";
          originBinder = 0L;
          ability = 0;
          jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(localPhoneContact);
          continue;
        }
        if (!uin.equals("0")) {
          continue;
        }
      }
      finally
      {
        localEntityTransaction.b();
      }
      netTypeIconId = 0;
      detalStatusFlag = 20;
      iTermType = 0;
      strTermDesc = "";
      eNetworkType = 0;
      abilityBits = 0L;
      jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(localPhoneContact);
    }
    localEntityTransaction.c();
    localEntityTransaction.b();
  }
  
  private List g()
  {
    ArrayList localArrayList = new ArrayList(8);
    Iterator localIterator = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.values().iterator();
    while (localIterator.hasNext())
    {
      PhoneContact localPhoneContact = (PhoneContact)localIterator.next();
      if ("0".equals(uin)) {
        localArrayList.add(localPhoneContact);
      }
    }
    return localArrayList;
  }
  
  private void j()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new nbs(this));
  }
  
  private void k()
  {
    String[] arrayOfString = StringUtil.a(jdField_b_of_type_AndroidContentSharedPreferences.getString("key_contact_last_login", ""), '|');
    HashSet localHashSet = new HashSet(arrayOfString.length);
    int i2 = arrayOfString.length;
    int i1 = 0;
    while (i1 < i2)
    {
      String str = arrayOfString[i1];
      if (!TextUtils.isEmpty(str)) {
        localHashSet.add(str);
      }
      i1 += 1;
    }
    jdField_a_of_type_JavaUtilSet = localHashSet;
  }
  
  private void l()
  {
    try
    {
      jdField_a_of_type_AndroidDatabaseContentObserver = new nbt(this, new Handler(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getMainLooper()));
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getContentResolver().registerContentObserver(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, true, jdField_a_of_type_AndroidDatabaseContentObserver);
      return;
    }
    catch (Throwable localThrowable)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("PhoneContact", 2, localThrowable.getMessage(), localThrowable);
    }
  }
  
  private void m()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact", 2, "preLoadLocalContact");
    }
    a(0L, 0L);
    jdField_d_of_type_Boolean = false;
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new PhoneContact().getTableName(), null, null);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private void n()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new nbe(this));
  }
  
  /* Error */
  private void o()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   5: ifeq +77 -> 82
    //   8: new 207	java/lang/StringBuilder
    //   11: dup
    //   12: bipush 50
    //   14: invokespecial 787	java/lang/StringBuilder:<init>	(I)V
    //   17: astore_2
    //   18: aload_2
    //   19: ldc_w 1039
    //   22: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   25: aload_0
    //   26: getfield 116	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_Boolean	Z
    //   29: invokevirtual 676	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   32: pop
    //   33: aload_2
    //   34: ldc_w 1041
    //   37: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   40: aload_0
    //   41: getfield 110	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_b_of_type_Boolean	Z
    //   44: invokevirtual 676	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   47: pop
    //   48: aload_2
    //   49: ldc_w 1043
    //   52: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: invokestatic 396	java/lang/System:currentTimeMillis	()J
    //   58: aload_0
    //   59: getfield 118	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_d_of_type_Long	J
    //   62: lsub
    //   63: ldc2_w 1044
    //   66: ldiv
    //   67: invokevirtual 309	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   70: pop
    //   71: ldc_w 410
    //   74: iconst_2
    //   75: aload_2
    //   76: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   79: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   82: aload_0
    //   83: getfield 116	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_Boolean	Z
    //   86: ifne +12 -> 98
    //   89: aload_0
    //   90: getfield 110	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_b_of_type_Boolean	Z
    //   93: istore_1
    //   94: iload_1
    //   95: ifeq +6 -> 101
    //   98: aload_0
    //   99: monitorexit
    //   100: return
    //   101: invokestatic 396	java/lang/System:currentTimeMillis	()J
    //   104: aload_0
    //   105: getfield 118	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_d_of_type_Long	J
    //   108: lsub
    //   109: ldc2_w 30
    //   112: lcmp
    //   113: iflt -15 -> 98
    //   116: new 391	java/util/ArrayList
    //   119: dup
    //   120: invokespecial 392	java/util/ArrayList:<init>	()V
    //   123: astore_2
    //   124: new 391	java/util/ArrayList
    //   127: dup
    //   128: invokespecial 392	java/util/ArrayList:<init>	()V
    //   131: astore_3
    //   132: aload_0
    //   133: aload_2
    //   134: aload_3
    //   135: invokespecial 1047	com/tencent/mobileqq/app/PhoneContactManagerImp:a	(Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    //   138: astore 4
    //   140: aload_2
    //   141: invokevirtual 1049	java/util/ArrayList:isEmpty	()Z
    //   144: ifeq +10 -> 154
    //   147: aload_3
    //   148: invokevirtual 1049	java/util/ArrayList:isEmpty	()Z
    //   151: ifne -53 -> 98
    //   154: aload_0
    //   155: aload_0
    //   156: aload_0
    //   157: invokevirtual 296	com/tencent/mobileqq/app/PhoneContactManagerImp:a	()Ljava/lang/String;
    //   160: aload_2
    //   161: aload_3
    //   162: aload 4
    //   164: invokespecial 1051	com/tencent/mobileqq/app/PhoneContactManagerImp:a	(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    //   167: putfield 116	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_Boolean	Z
    //   170: aload_0
    //   171: iconst_1
    //   172: invokespecial 691	com/tencent/mobileqq/app/PhoneContactManagerImp:a	(I)V
    //   175: goto -77 -> 98
    //   178: astore_2
    //   179: aload_0
    //   180: monitorexit
    //   181: aload_2
    //   182: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	183	0	this	PhoneContactManagerImp
    //   93	2	1	bool	boolean
    //   17	144	2	localObject1	Object
    //   178	4	2	localObject2	Object
    //   131	31	3	localArrayList1	ArrayList
    //   138	25	4	localArrayList2	ArrayList
    // Exception table:
    //   from	to	target	type
    //   2	82	178	finally
    //   82	94	178	finally
    //   101	154	178	finally
    //   154	175	178	finally
  }
  
  private void p()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact", 2, "deleteLocalData");
    }
    jdField_d_of_type_Boolean = false;
    jdField_a_of_type_AndroidContentSharedPreferences.edit().remove("contact_bind_allow_upload").commit();
    a(0L, 0L);
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    a(1);
    b(false);
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new PhoneContact().getTableName(), null, null);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public int a()
  {
    return jdField_a_of_type_AndroidContentSharedPreferences.getInt("k_b_version", 0);
  }
  
  public int a(List paramList)
  {
    RespondQueryQQBindingStat localRespondQueryQQBindingStat = a();
    if (localRespondQueryQQBindingStat == null) {
      return jdField_c_of_type_Int;
    }
    if (jdField_a_of_type_Nby != null) {
      jdField_a_of_type_Nby.cancel(true);
    }
    jdField_a_of_type_Nby = new nby(this, null);
    jdField_a_of_type_Nby.a(paramList);
    jdField_a_of_type_Nby.execute(new RespondQueryQQBindingStat[] { localRespondQueryQQBindingStat });
    return jdField_b_of_type_Int;
  }
  
  public int a(boolean paramBoolean1, int paramInt, long paramLong1, boolean paramBoolean2, long paramLong2, long paramLong3, long paramLong4, List paramList1, List paramList2)
  {
    Object localObject1;
    if (QLog.isColorLevel())
    {
      localObject1 = new StringBuilder(80);
      ((StringBuilder)localObject1).append("saveContactFromServer_v2, isSegmented = ").append(paramBoolean1);
      ((StringBuilder)localObject1).append(", packageNo = ").append(paramInt);
      ((StringBuilder)localObject1).append(", nextFlag = ").append(paramLong1);
      QLog.d("PhoneContact.Manager", 2, ((StringBuilder)localObject1).toString());
    }
    if (jdField_a_of_type_JavaUtilList == null)
    {
      jdField_a_of_type_JavaUtilList = paramList1;
      if (jdField_b_of_type_JavaUtilList != null) {
        break label127;
      }
      jdField_b_of_type_JavaUtilList = paramList2;
    }
    int i1;
    for (;;)
    {
      if ((paramLong1 == 4294967295L) || (paramBoolean1)) {
        break label142;
      }
      i1 = 0;
      return i1;
      jdField_a_of_type_JavaUtilList.addAll(paramList1);
      break;
      label127:
      jdField_b_of_type_JavaUtilList.addAll(paramList2);
    }
    label142:
    jdField_e_of_type_JavaUtilList = null;
    long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("queryContactTimeStamp", 0L);
    long l2 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("queryRichInfoTimeStamp", 0L);
    if (QLog.isColorLevel())
    {
      paramList1 = new StringBuilder(200);
      paramList1.append("saveContactFromServer, localTimeStamp:");
      paramList1.append(l1).append(", ").append(l2);
      paramList1.append(", remoteTimeStamp: ").append(paramLong2).append(", ").append(paramLong3);
      paramList2 = paramList1.append(", friendCount:");
      if (jdField_a_of_type_JavaUtilList != null)
      {
        i1 = jdField_a_of_type_JavaUtilList.size();
        paramList2.append(i1);
        paramList2 = paramList1.append(", strangerCount:");
        if (jdField_b_of_type_JavaUtilList == null) {
          break label755;
        }
        i1 = jdField_b_of_type_JavaUtilList.size();
        label312:
        paramList2.append(i1);
        paramList1.append(", queryInterval:").append(paramLong4);
        paramList1.append(", isListChanged:").append(paramBoolean2);
        QLog.d("PhoneContact.Manager", 2, paramList1.toString());
      }
    }
    else
    {
      if (((paramInt == 0) && (paramBoolean1)) || (!paramBoolean1)) {
        d(paramBoolean2);
      }
      if (paramLong1 == 4294967295L)
      {
        a(paramLong2, paramLong3);
        jdField_a_of_type_Long = Math.max(120000L, paramLong4);
        jdField_b_of_type_AndroidContentSharedPreferences.edit().putLong("query_contact_list_min_interval", jdField_a_of_type_Long).commit();
      }
      if ((jdField_a_of_type_JavaUtilList == null) || (jdField_a_of_type_JavaUtilList.size() <= 0)) {
        break label811;
      }
      if (!paramBoolean2) {}
      paramList1 = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
      paramList2 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    }
    Object localObject3;
    Object localObject2;
    for (;;)
    {
      try
      {
        paramList1.a();
        localObject1 = jdField_a_of_type_JavaUtilList.iterator();
        if (!((Iterator)localObject1).hasNext()) {
          break label801;
        }
        localObject3 = (MobileContactsFriendInfo)((Iterator)localObject1).next();
        localObject2 = (PhoneContact)jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.get(contactsInfoEncrypt.toUpperCase());
        if (localObject2 == null) {
          break label761;
        }
        uin = QQ;
        bindingDate = bindingDate;
        isUploaded = true;
        originBinder = originBinder;
        ability = accountAbi;
        unifiedCode = a(MobileNoMask, mobileNo);
        mobileCode = unifiedCode;
        nationCode = "";
        if ((!TextUtils.isEmpty(uin)) && (!uin.equals("0")))
        {
          localObject3 = paramList2.c(uin);
          if (localObject3 != null) {
            nickName = name;
          }
          jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.put(uin, localObject2);
          paramList2.a(unifiedCode, false);
        }
        if (!TextUtils.isEmpty(unifiedCode)) {
          jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.put(unifiedCode, localObject2);
        }
        jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a((Entity)localObject2);
        continue;
        i1 = -1;
      }
      finally
      {
        paramList1.b();
      }
      break;
      label755:
      i1 = -1;
      break label312;
      label761:
      if (QLog.isColorLevel()) {
        QLog.d("PhoneContact.Manager", 2, "bind friend not found, " + contactsInfoEncrypt);
      }
    }
    label801:
    paramList1.c();
    paramList1.b();
    label811:
    if ((jdField_b_of_type_JavaUtilList != null) && (jdField_b_of_type_JavaUtilList.size() > 0))
    {
      paramList2 = new ArrayList(jdField_b_of_type_JavaUtilList.size());
      paramList1 = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
    }
    for (;;)
    {
      try
      {
        paramList1.a();
        localObject1 = jdField_b_of_type_JavaUtilList.iterator();
        paramBoolean1 = false;
        if (((Iterator)localObject1).hasNext())
        {
          localObject2 = (MobileContactsNotFriendInfo)((Iterator)localObject1).next();
          localObject3 = (PhoneContact)jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.get(contactsInfoEncrypt.toUpperCase());
          if (localObject3 != null)
          {
            boolean bool = paramBoolean1;
            if (paramBoolean2)
            {
              uin = "0";
              bindingDate = bindingDate;
              nickName = nickname;
              isUploaded = true;
              originBinder = originBinder;
              ability = accountAbi;
              unifiedCode = a(MobileNoMask, mobileNo);
              mobileCode = unifiedCode;
              nationCode = "";
              bool = paramBoolean1;
              if (isNew)
              {
                bool = true;
                isNewRecommend = true;
              }
            }
            if (isUpdateSign) {
              ((PhoneContact)localObject3).setRichBuffer(personalSign, richTime);
            }
            if (detalStatusFlag != 20) {
              paramList2.add(unifiedCode);
            }
            netTypeIconId = conType;
            detalStatusFlag = detalStatusFlag;
            iTermType = iTermType;
            strTermDesc = strTermDesc;
            eNetworkType = eNetworkType;
            abilityBits = uAbiFlag;
            if (!TextUtils.isEmpty(unifiedCode)) {
              jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.put(unifiedCode, localObject3);
            }
            isHiden = isHide;
            jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a((Entity)localObject3);
            paramBoolean1 = bool;
            break label1331;
          }
          if (!QLog.isColorLevel()) {
            break label1334;
          }
          QLog.d("PhoneContact.Manager", 2, "bind nofriend not found, " + contactsInfoEncrypt);
          break label1334;
        }
        c(paramList2);
        paramList1.c();
        paramList1.b();
        jdField_a_of_type_JavaUtilList = null;
        jdField_b_of_type_JavaUtilList = null;
        i1 = 6;
        if (paramBoolean2) {
          i1 = 7;
        }
        paramInt = i1;
        if (paramBoolean1) {
          paramInt = i1 | 0x8;
        }
        b(paramBoolean1);
        i1 = paramInt;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("PhoneContact.Manager", 2, "saveContactFromServer_v2 leave");
        return paramInt;
      }
      finally
      {
        paramList1.b();
      }
      paramBoolean1 = false;
    }
    label1331:
    label1334:
    for (;;)
    {
      break;
    }
  }
  
  public long a(String paramString)
  {
    if (jdField_a_of_type_JavaUtilSet.contains(paramString)) {
      return 1L;
    }
    return 10L;
  }
  
  public RespondQueryQQBindingStat a()
  {
    RespondQueryQQBindingStat localRespondQueryQQBindingStat = new RespondQueryQQBindingStat();
    SharedPreferences localSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences("contact_bind_info" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0);
    if (localSharedPreferences == null) {}
    do
    {
      return null;
      nationCode = localSharedPreferences.getString("contact_bind_info_nation", null);
    } while (nationCode == null);
    mobileNo = localSharedPreferences.getString("contact_bind_info_mobile", "");
    MobileUniqueNo = localSharedPreferences.getString("contact_bind_info_imei", "");
    isRecommend = localSharedPreferences.getLong("contact_bind_info_recommend", 0L);
    originBinder = localSharedPreferences.getLong("contact_bind_info_origin", 0L);
    bindingTime = localSharedPreferences.getLong("contact_bind_info_time", 0L);
    lastUsedFlag = localSharedPreferences.getLong("contact_bind_info_flag", 0L);
    type = localSharedPreferences.getInt("contact_bind_type", 0);
    isStopFindMatch = localSharedPreferences.getBoolean("contact_bind_stop_find_match", false);
    return localRespondQueryQQBindingStat;
  }
  
  public PhoneContact a(String paramString)
  {
    if (!TextUtils.isEmpty(paramString)) {
      return (PhoneContact)jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    }
    return null;
  }
  
  public String a()
  {
    if (jdField_c_of_type_JavaLangString == null) {}
    try
    {
      if (jdField_c_of_type_JavaLangString == null) {
        jdField_c_of_type_JavaLangString = b();
      }
      return jdField_c_of_type_JavaLangString;
    }
    finally {}
  }
  
  public String a(String paramString)
  {
    if (paramString == null) {}
    EntityManager localEntityManager;
    do
    {
      return null;
      if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString)) {
        break;
      }
      localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    } while (localEntityManager == null);
    PhoneNumInfo localPhoneNumInfo = (PhoneNumInfo)localEntityManager.a(PhoneNumInfo.class, paramString);
    if (localPhoneNumInfo != null)
    {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, uin);
      jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(uin, paramString);
    }
    localEntityManager.a();
    return (String)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
  }
  
  public List a()
  {
    long l2 = System.currentTimeMillis();
    Object localObject1 = jdField_e_of_type_JavaUtilList;
    if (localObject1 == null) {
      localObject1 = g();
    }
    for (;;)
    {
      long l1 = System.currentTimeMillis();
      Object localObject2 = ((List)localObject1).iterator();
      int i1 = 0;
      if (((Iterator)localObject2).hasNext())
      {
        PhoneContact localPhoneContact = (PhoneContact)((Iterator)localObject2).next();
        if ((highLightTimeStamp != 0L) && (Math.abs(System.currentTimeMillis() - highLightTimeStamp) > 180000L)) {
          highLightTimeStamp = 0L;
        }
        if (highLightTimeStamp == 0L) {
          break label263;
        }
        l1 = Math.min(l1, highLightTimeStamp);
        i1 = 1;
      }
      label263:
      for (;;)
      {
        break;
        ThreadManager.b().removeCallbacks(jdField_d_of_type_JavaLangRunnable);
        if (i1 != 0) {
          ThreadManager.b().postDelayed(jdField_d_of_type_JavaLangRunnable, System.currentTimeMillis() - l1);
        }
        localObject2 = new nbx(this);
        localObject1 = new ArrayList((Collection)localObject1);
        try
        {
          Collections.sort((List)localObject1, (Comparator)localObject2);
          if (QLog.isColorLevel()) {
            QLog.d("PhoneContact.Manager", 2, "getBindNonfriendContactList cost: " + (System.currentTimeMillis() - l2) + ", size = " + ((List)localObject1).size());
          }
          jdField_e_of_type_JavaUtilList = ((List)localObject1);
          return localObject1;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("PhoneContact.Manager", 2, "getBindNonfriendContactList", localException);
            }
          }
        }
      }
    }
  }
  
  public List a(boolean paramBoolean)
  {
    long l1 = System.currentTimeMillis();
    Object localObject2 = jdField_e_of_type_JavaUtilList;
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = g();
    }
    localObject2 = new ArrayList();
    localObject1 = ((List)localObject1).iterator();
    Object localObject3;
    while (((Iterator)localObject1).hasNext())
    {
      localObject3 = (PhoneContact)((Iterator)localObject1).next();
      if (isHiden) {
        ((List)localObject2).add(localObject3);
      }
    }
    if (paramBoolean)
    {
      localObject3 = new nbw(this);
      localObject1 = new ArrayList((Collection)localObject2);
      Collections.sort((List)localObject1, (Comparator)localObject3);
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("PhoneContact.Manager", 2, "getBindHideNoneFriendList cost: " + (System.currentTimeMillis() - l1) + ", size = " + ((List)localObject1).size());
      }
      return localObject1;
      localObject1 = localObject2;
    }
  }
  
  void a()
  {
    if (jdField_a_of_type_AndroidDatabaseContentObserver != null) {}
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getContentResolver().unregisterContentObserver(jdField_a_of_type_AndroidDatabaseContentObserver);
      jdField_a_of_type_AndroidDatabaseContentObserver = null;
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("PhoneContact", 2, localThrowable.getMessage(), localThrowable);
        }
      }
    }
  }
  
  public void a(int paramInt1, int paramInt2, long paramLong, String paramString)
  {
    SharedPreferences.Editor localEditor = jdField_a_of_type_AndroidContentSharedPreferences.edit();
    localEditor.putInt("k_b_version", paramInt1).putInt("k_b_limit", paramInt2).putInt("k_b_time", (int)paramLong);
    if (jdField_a_of_type_AndroidContentSharedPreferences.getInt("k_b_count", -1) == -1) {
      localEditor.putInt("k_b_count", 0);
    }
    localEditor.putString("K_b_msg", paramString);
    localEditor.commit();
  }
  
  public void a(long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "saveUIBits: newBits = " + paramLong + " localUIBits = " + jdField_e_of_type_Long);
    }
    if (jdField_e_of_type_Long != paramLong)
    {
      jdField_e_of_type_Long = paramLong;
      jdField_a_of_type_AndroidContentSharedPreferences.edit().putLong("key_contacts_switches", paramLong);
      b(paramLong);
    }
  }
  
  public void a(long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5)
  {
    long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("contact_bind_strategy_version", 0L);
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "localVersion=" + l1 + "|configVersion=" + paramLong1 + "|popWindowsCount=" + paramLong2 + "|popWindowsTime=" + paramLong3 + "|popCloseCount=" + paramLong4);
    }
    if (l1 != paramLong1)
    {
      SharedPreferences.Editor localEditor = jdField_a_of_type_AndroidContentSharedPreferences.edit();
      l1 = paramLong3;
      if (paramLong3 < 86400L) {
        l1 = 86400L;
      }
      paramLong3 = paramLong2;
      if (paramLong2 <= 0L) {
        paramLong3 = 1L;
      }
      localEditor.putLong("contact_bind_strategy_version", paramLong1);
      localEditor.putLong("contact_bind_strategy_popcount", paramLong3);
      localEditor.putLong("contact_bind_strategy_poptime", l1);
      localEditor.putLong("contact_bind_strategy_closecount", paramLong4);
      localEditor.putLong("contact_bind_strategy_forcepopup", paramLong5);
      localEditor.putLong("contact_bind_strategy_user_closecount", 0L);
      localEditor.commit();
      ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
  }
  
  public void a(PhoneContactManager.IPhoneContactListener paramIPhoneContactListener)
  {
    synchronized (jdField_a_of_type_JavaUtilLinkedList)
    {
      if (!jdField_a_of_type_JavaUtilLinkedList.contains(paramIPhoneContactListener)) {
        jdField_a_of_type_JavaUtilLinkedList.add(paramIPhoneContactListener);
      }
      return;
    }
  }
  
  public void a(String paramString)
  {
    a(paramString, 0, false, false);
  }
  
  public void a(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramString == null) {
      return;
    }
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
    localNewIntent.putExtra("req_type", 16);
    localNewIntent.putExtra("verify_smscode", paramString);
    localNewIntent.putExtra("session_id", jdField_a_of_type_ArrayOfByte);
    localNewIntent.putExtra("cmd_param_bind_type", paramInt);
    localNewIntent.putExtra("cmd_param_is_from_uni", paramBoolean1);
    localNewIntent.putExtra("cmd_param_is_from_change_bind", paramBoolean2);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
  }
  
  public void a(String paramString, GetOnlineInfoResp paramGetOnlineInfoResp)
  {
    paramString = c(paramString);
    if (paramString != null)
    {
      detalStatusFlag = ((byte)(int)dwStatus);
      iTermType = ((int)iTermType);
      eNetworkType = eNetworkType;
      netTypeIconId = eIconType;
      strTermDesc = strTermDesc;
      abilityBits = uAbiFlag;
      if (((iTermType == 67586L) || (iTermType == 66566L) || (iTermType == 72194L) || (iTermType == 65804L) || (iTermType == 72706L)) && (eNetworkType != 1)) {
        netTypeIconIdIphoneOrWphoneNoWifi = eIconType;
      }
      a(2);
    }
  }
  
  public void a(String paramString1, String paramString2)
  {
    a(paramString1, paramString2, 0, false, false);
  }
  
  public void a(String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return;
    }
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
    localNewIntent.putExtra("req_type", 13);
    localNewIntent.putExtra("country_code", paramString1);
    localNewIntent.putExtra("phone_number", paramString2);
    localNewIntent.putExtra("cmd_param_bind_type", paramInt);
    localNewIntent.putExtra("cmd_param_is_from_uni", paramBoolean1);
    localNewIntent.putExtra("cmd_param_is_from_change_bind", paramBoolean2);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "hideContact mobile=" + paramString + "; hide=" + paramBoolean);
    }
    Object localObject = c(paramString);
    if (localObject != null)
    {
      localObject = new AddressBookItem(mobileNo, name);
      NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
      localNewIntent.putExtra("req_type", 34);
      localNewIntent.putExtra("param_hiden_mobile", (Serializable)localObject);
      localNewIntent.putExtra("param_hiden_flag", paramBoolean);
      localNewIntent.putExtra("unique_phone_no", paramString);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
    }
  }
  
  public void a(ArrayList paramArrayList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "updateRenameList");
    }
    if ((paramArrayList == null) || (paramArrayList.size() == 0)) {}
    EntityTransaction localEntityTransaction;
    label135:
    do
    {
      for (;;)
      {
        return;
        localEntityTransaction = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
        try
        {
          localEntityTransaction.a();
          paramArrayList = paramArrayList.iterator();
          for (;;)
          {
            if (!paramArrayList.hasNext()) {
              break label135;
            }
            localPhoneContact = (PhoneContact)paramArrayList.next();
            if (localPhoneContact.getStatus() != 1000) {
              break;
            }
            jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(localPhoneContact);
          }
        }
        catch (Exception paramArrayList)
        {
          for (;;)
          {
            PhoneContact localPhoneContact;
            if (QLog.isColorLevel()) {
              QLog.d("PhoneContact.Manager", 2, paramArrayList.getMessage());
            }
            return;
            jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(localPhoneContact);
          }
        }
        finally
        {
          if (localEntityTransaction != null) {
            localEntityTransaction.b();
          }
        }
      }
      localEntityTransaction.c();
    } while (localEntityTransaction == null);
    localEntityTransaction.b();
  }
  
  public void a(List paramList)
  {
    MqqHandler localMqqHandler = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ContactListView.class);
    if (localMqqHandler != null)
    {
      localMqqHandler.removeMessages(5);
      Message localMessage = localMqqHandler.obtainMessage(5);
      obj = paramList;
      localMqqHandler.sendMessageDelayed(localMessage, 100L);
    }
  }
  
  public void a(List paramList, long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "saveLastLoginList, size = " + paramList.size() + ", stamp " + paramLong1 + ", interval = " + paramLong2);
    }
    jdField_a_of_type_AndroidContentSharedPreferences.edit().putLong("key_req_last_login_time", System.currentTimeMillis()).putLong("key_login_info_timestamp", paramLong1).putLong("key_req_login_interval", Math.max(43200000L, 1000L * paramLong2)).commit();
    HashSet localHashSet = new HashSet(paramList.size());
    StringBuilder localStringBuilder = new StringBuilder(paramList.size() * 13);
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      String str = (String)paramList.next();
      PhoneContact localPhoneContact = (PhoneContact)jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.get(str.toUpperCase());
      if (localPhoneContact != null)
      {
        localHashSet.add(unifiedCode);
        localStringBuilder.append('|').append(unifiedCode);
      }
      else if (QLog.isColorLevel())
      {
        QLog.d("PhoneContact.Manager", 2, "saveLastLoginList, wtf pc null " + str.toUpperCase());
      }
    }
    b(localStringBuilder.toString());
    jdField_a_of_type_JavaUtilSet = localHashSet;
  }
  
  public void a(boolean paramBoolean)
  {
    k = false;
    if (paramBoolean)
    {
      ThreadManager.c().removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      ThreadManager.c().postDelayed(jdField_a_of_type_JavaLangRunnable, 2000L);
    }
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    for (;;)
    {
      Object localObject1;
      try
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(101)).jdField_a_of_type_Boolean = true;
        long l1 = System.currentTimeMillis();
        if (QLog.isColorLevel())
        {
          localObject1 = new StringBuilder(200);
          ((StringBuilder)localObject1).append("doQueryContactList, isQueryingContact ").append(jdField_b_of_type_Boolean);
          ((StringBuilder)localObject1).append(", isUpdatingContact ").append(jdField_c_of_type_Boolean);
          ((StringBuilder)localObject1).append(", mCurrentBindState ").append(jdField_a_of_type_Int);
          ((StringBuilder)localObject1).append(", beForce ").append(paramBoolean1);
          ((StringBuilder)localObject1).append(", isQueryAll ").append(paramBoolean2);
          ((StringBuilder)localObject1).append(", friendlistChanged ").append(n);
          ((StringBuilder)localObject1).append(", lastQueryTime ").append(jdField_b_of_type_Long / 1000L);
          ((StringBuilder)localObject1).append(", currentTime ").append(l1 / 1000L);
          QLog.d("PhoneContact.Manager", 2, ((StringBuilder)localObject1).toString());
        }
        if ((!jdField_b_of_type_Boolean) && (jdField_a_of_type_Int != 5))
        {
          boolean bool = jdField_c_of_type_Boolean;
          if (!bool) {}
        }
        else
        {
          return;
        }
        if ((!paramBoolean1) && (Math.abs(l1 - jdField_b_of_type_Long) < jdField_a_of_type_Long)) {
          continue;
        }
        ThreadManager.b().removeCallbacks(jdField_b_of_type_JavaLangRunnable);
        jdField_b_of_type_Boolean = true;
        jdField_a_of_type_JavaUtilList = null;
        jdField_b_of_type_JavaUtilList = null;
        localObject1 = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
        ((NewIntent)localObject1).putExtra("req_type", 30);
        ((NewIntent)localObject1).putExtra("next_flag", 0L);
        l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("queryContactTimeStamp", 0L);
        long l2 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("queryRichInfoTimeStamp", 0L);
        ((NewIntent)localObject1).putExtra("time_stamp", l1);
        ((NewIntent)localObject1).putExtra("richinfo_time_stamp", l2);
        ((NewIntent)localObject1).putExtra("session_id", new byte[0]);
        ((NewIntent)localObject1).putExtra("unique_phone_no", a());
        if (paramBoolean2) {
          break label425;
        }
        if (!n) {
          break label420;
        }
      }
      finally {}
      ((NewIntent)localObject1).putExtra("force_query_list", i1);
      n = false;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet((NewIntent)localObject1);
      continue;
      label420:
      int i1 = 2;
      continue;
      label425:
      i1 = 1;
    }
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    jdField_a_of_type_ArrayOfByte = paramArrayOfByte;
    jdField_a_of_type_AndroidContentSharedPreferences.edit().putString("session_id", new String(paramArrayOfByte)).commit();
  }
  
  public boolean a()
  {
    return k;
  }
  
  public boolean a(RespondQueryQQBindingStat paramRespondQueryQQBindingStat)
  {
    if (jdField_a_of_type_Int == -1) {
      jdField_a_of_type_Int = a(a());
    }
    if (jdField_a_of_type_Int != a(paramRespondQueryQQBindingStat)) {}
    for (boolean bool = true;; bool = false)
    {
      RespondQueryQQBindingStat localRespondQueryQQBindingStat = paramRespondQueryQQBindingStat;
      if (paramRespondQueryQQBindingStat == null) {
        localRespondQueryQQBindingStat = new RespondQueryQQBindingStat();
      }
      paramRespondQueryQQBindingStat = jdField_a_of_type_AndroidContentSharedPreferences.edit();
      paramRespondQueryQQBindingStat.putString("contact_bind_info_mobile", mobileNo);
      paramRespondQueryQQBindingStat.putString("contact_bind_info_nation", nationCode);
      paramRespondQueryQQBindingStat.putString("contact_bind_info_imei", MobileUniqueNo);
      paramRespondQueryQQBindingStat.putLong("contact_bind_info_recommend", isRecommend);
      paramRespondQueryQQBindingStat.putLong("contact_bind_info_origin", originBinder);
      paramRespondQueryQQBindingStat.putLong("contact_bind_info_time", bindingTime);
      paramRespondQueryQQBindingStat.putLong("contact_bind_info_flag", lastUsedFlag);
      paramRespondQueryQQBindingStat.putInt("contact_bind_type", type);
      paramRespondQueryQQBindingStat.putBoolean("contact_bind_stop_find_match", isStopFindMatch);
      if (lastUsedFlag == 3L) {
        paramRespondQueryQQBindingStat.putBoolean("contact_bind_allow_upload", false);
      }
      paramRespondQueryQQBindingStat.commit();
      a(localRespondQueryQQBindingStat);
      return bool;
    }
  }
  
  public int b()
  {
    List localList = jdField_e_of_type_JavaUtilList;
    if (localList == null) {
      localList = g();
    }
    for (;;)
    {
      Iterator localIterator = localList.iterator();
      int i1 = 0;
      if (localIterator.hasNext())
      {
        if (!nextisNewRecommend) {
          break label61;
        }
        i1 += 1;
      }
      label61:
      for (;;)
      {
        break;
        jdField_e_of_type_JavaUtilList = localList;
        return i1;
      }
    }
  }
  
  public PhoneContact b(String paramString)
  {
    if (jdField_d_of_type_Boolean) {
      return (PhoneContact)jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    }
    if (jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager != null) {
      return (PhoneContact)jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(PhoneContact.class, paramString);
    }
    return null;
  }
  
  public String b(String paramString)
  {
    Object localObject = (String)jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    if (localObject != null) {
      return localObject;
    }
    localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    if (localObject == null) {
      return null;
    }
    paramString = (PhoneNumInfo)((EntityManager)localObject).a(PhoneNumInfo.class, "uin=?", new String[] { paramString });
    if (paramString != null) {
      return phoneNum;
    }
    return null;
  }
  
  public List b()
  {
    if (jdField_d_of_type_Boolean)
    {
      ArrayList localArrayList = new ArrayList();
      try
      {
        localArrayList.addAll(jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.values());
        return localArrayList;
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("PhoneContact.Manager", 2, localException.toString());
        }
        return jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(PhoneContact.class);
      }
    }
    return jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(PhoneContact.class);
  }
  
  public void b()
  {
    n = true;
  }
  
  public void b(PhoneContactManager.IPhoneContactListener paramIPhoneContactListener)
  {
    synchronized (jdField_a_of_type_JavaUtilLinkedList)
    {
      jdField_a_of_type_JavaUtilLinkedList.remove(paramIPhoneContactListener);
      return;
    }
  }
  
  public void b(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return;
    }
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
    localNewIntent.putExtra("req_type", 19);
    localNewIntent.putExtra("country_code", paramString1);
    localNewIntent.putExtra("phone_number", paramString2);
    localNewIntent.putExtra("cmd_param_bind_type", 0);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
    b(paramString1, paramString2, 0, false, false);
  }
  
  public void b(String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return;
    }
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
    localNewIntent.putExtra("req_type", 19);
    localNewIntent.putExtra("country_code", paramString1);
    localNewIntent.putExtra("phone_number", paramString2);
    localNewIntent.putExtra("cmd_param_bind_type", paramInt);
    localNewIntent.putExtra("cmd_param_is_from_uni", paramBoolean1);
    localNewIntent.putExtra("cmd_param_is_from_change_bind", paramBoolean2);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
  }
  
  public void b(String paramString, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "changeHidenStatus: mobile = " + paramString + ";hide=" + paramBoolean);
    }
    paramString = c(paramString);
    if ((paramString != null) && (isHiden != paramBoolean))
    {
      isHiden = paramBoolean;
      jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(paramString);
    }
  }
  
  public void b(List paramList)
  {
    if (paramList != null) {}
    for (;;)
    {
      EntityTransaction localEntityTransaction;
      try
      {
        boolean bool = paramList.isEmpty();
        if (bool) {
          return;
        }
        localEntityTransaction = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
        try
        {
          localEntityTransaction.a();
          paramList = paramList.iterator();
          if (paramList.hasNext())
          {
            Object localObject = (AddressBookItem)paramList.next();
            localObject = (PhoneContact)jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.get(mobileNo);
            if (localObject == null) {
              continue;
            }
            isUploaded = true;
            jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a((Entity)localObject);
            continue;
            paramList = finally;
          }
        }
        finally
        {
          localEntityTransaction.b();
        }
        localEntityTransaction.c();
      }
      finally {}
      localEntityTransaction.b();
    }
  }
  
  public void b(boolean paramBoolean1, boolean paramBoolean2)
  {
    RespondQueryQQBindingStat localRespondQueryQQBindingStat = a();
    if ((localRespondQueryQQBindingStat == null) || (nationCode == null) || (mobileNo == null)) {
      return;
    }
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
    localNewIntent.putExtra("req_type", 20);
    localNewIntent.putExtra("country_code", nationCode);
    localNewIntent.putExtra("phone_number", mobileNo);
    localNewIntent.putExtra("cmd_param_is_from_uni", paramBoolean1);
    localNewIntent.putExtra("cmd_param_is_from_change_bind", paramBoolean2);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
  }
  
  public boolean b()
  {
    if (!"6.3.3".equals(jdField_b_of_type_AndroidContentSharedPreferences.getString("phone_version_run", ""))) {}
    for (boolean bool = true;; bool = false)
    {
      if (bool) {
        jdField_b_of_type_AndroidContentSharedPreferences.edit().remove("phone_app_first_run").commit();
      }
      if (QLog.isColorLevel()) {
        QLog.d("PhoneContact", 2, "isPhoneContactFirstRun result = " + bool);
      }
      return bool;
    }
  }
  
  public int c()
  {
    int i2 = 2;
    new StringBuffer();
    int i1 = i2;
    if (d() == 6)
    {
      if (!jdField_d_of_type_Boolean) {
        break label44;
      }
      i1 = i2;
      if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.size() == 0) {
        i1 = 1;
      }
    }
    return i1;
    label44:
    return 0;
  }
  
  public PhoneContact c(String paramString)
  {
    PhoneContact localPhoneContact = null;
    if (jdField_d_of_type_Boolean) {
      localPhoneContact = (PhoneContact)jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    }
    while (jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager == null) {
      return localPhoneContact;
    }
    return (PhoneContact)jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(PhoneContact.class, "mobileCode=?", new String[] { paramString });
  }
  
  public List c()
  {
    Object localObject1 = null;
    long l1 = System.currentTimeMillis();
    Object localObject2;
    ArrayList localArrayList1;
    ArrayList localArrayList2;
    FriendsManager localFriendsManager;
    if (jdField_c_of_type_JavaUtilList == null)
    {
      localObject2 = new ArrayList();
      ((List)localObject2).addAll(jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.values());
      Collections.sort((List)localObject2, new nbi(this));
      localArrayList1 = new ArrayList();
      localArrayList2 = new ArrayList();
      localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if (((List)localObject2).size() > 0) {
        if (a() != null) {}
      }
    }
    label337:
    label391:
    label409:
    do
    {
      return localObject1;
      String str = amobileNo;
      Iterator localIterator = ((List)localObject2).iterator();
      localObject1 = null;
      while (localIterator.hasNext())
      {
        localObject2 = (PhoneContact)localIterator.next();
        if ((str == null) || (!str.endsWith(mobileNo.trim())))
        {
          PhoneContact localPhoneContact = (PhoneContact)((PhoneContact)localObject2).clone();
          if (TextUtils.isEmpty(uin))
          {
            if (localObject1 == null) {
              localObject1 = localPhoneContact;
            }
            for (;;)
            {
              break;
              if (contactID == contactID)
              {
                mobileNo = (mobileNo + "|" + mobileNo);
                if (!QLog.isColorLevel()) {
                  break label391;
                }
                QLog.d("PhoneContact.Manager", 2, "getContactListForDisplay: conbine contact contact name is:" + name + "uin is :" + uin + "number is:" + mobileNo);
              }
              else
              {
                localArrayList2.add(localObject1);
                localObject1 = localPhoneContact;
              }
            }
          }
          if (uin.equals("0"))
          {
            localObject2 = null;
            if ((localObject2 == null) || (groupid < 0)) {
              break label409;
            }
            nickName = ((Friends)localObject2).getFriendNick();
            remark = remark;
            faceUrl = Short.toString(faceid);
          }
          for (;;)
          {
            localArrayList1.add(localPhoneContact);
            break;
            localObject2 = localFriendsManager.c(uin);
            break label337;
            uin = "0";
          }
        }
      }
      if (localObject1 != null) {
        localArrayList2.add(localObject1);
      }
      localObject1 = new nbj(this);
      Collections.sort(localArrayList1, (Comparator)localObject1);
      Collections.sort(localArrayList2, (Comparator)localObject1);
      jdField_c_of_type_JavaUtilList = localArrayList1;
      jdField_d_of_type_JavaUtilList = localArrayList2;
      localObject2 = new ArrayList();
      ((List)localObject2).add(jdField_c_of_type_JavaUtilList);
      ((List)localObject2).add(jdField_d_of_type_JavaUtilList);
      localObject1 = localObject2;
    } while (!QLog.isColorLevel());
    QLog.d("PhoneContact.Manager", 2, "sort contact cost time: " + (System.currentTimeMillis() - l1));
    return localObject2;
  }
  
  public void c()
  {
    c(false);
  }
  
  public void c(String paramString1, String paramString2)
  {
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ContactBindServlet.class);
    localNewIntent.putExtra("req_type", 33);
    localNewIntent.putExtra("country_code", paramString1);
    localNewIntent.putExtra("phone_number", paramString2);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
  }
  
  public boolean c()
  {
    int i1 = d();
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact", 2, "isBindContactOk = " + i1);
    }
    return i1 >= 6;
  }
  
  public int d()
  {
    switch (jdField_a_of_type_Int)
    {
    case 0: 
    default: 
      return 0;
    case -1: 
      jdField_a_of_type_Int = a(a());
      return d();
    case 5: 
      return 5;
    case 6: 
      return 6;
    }
    return jdField_a_of_type_Int;
  }
  
  public List d()
  {
    long l1 = System.currentTimeMillis();
    if ((jdField_f_of_type_JavaUtilList == null) || (jdField_f_of_type_JavaUtilList.size() <= 0))
    {
      ArrayList localArrayList = new ArrayList();
      localArrayList.addAll(jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.values());
      if (localArrayList.size() > 0)
      {
        if (a() == null) {
          return null;
        }
        localArrayList.remove(b(amobileNo));
        Collections.sort(localArrayList, new nbl(this));
      }
      jdField_f_of_type_JavaUtilList = localArrayList;
    }
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "getContactListForSelector sort contact cost time: " + (System.currentTimeMillis() - l1));
    }
    return jdField_f_of_type_JavaUtilList;
  }
  
  public void d()
  {
    if (!jdField_d_of_type_Boolean)
    {
      jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      Object localObject = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(PhoneContact.class);
      if (localObject != null)
      {
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          PhoneContact localPhoneContact = (PhoneContact)((Iterator)localObject).next();
          pinyinFirst = PhoneContactHelper.b(pinyinInitial);
          jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.put(mobileNo, localPhoneContact);
          if ((!TextUtils.isEmpty(uin)) && (!uin.equals("0"))) {
            jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.put(uin, localPhoneContact);
          }
          if (!TextUtils.isEmpty(unifiedCode)) {
            jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.put(unifiedCode, localPhoneContact);
          }
          if (!TextUtils.isEmpty(md5)) {
            jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.put(md5, localPhoneContact);
          }
        }
      }
      if (QLog.isColorLevel()) {
        QLog.d("PhoneContact.Manager", 2, "No contacts.");
      }
      k();
      jdField_d_of_type_Boolean = true;
      a(1);
    }
  }
  
  public void d(String paramString1, String paramString2)
  {
    EntityTransaction localEntityTransaction = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
    for (;;)
    {
      try
      {
        localEntityTransaction.a();
        paramString1 = (PhoneContact)jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString1);
        if (paramString1 == null) {
          break label111;
        }
        uin = paramString2;
        jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(paramString1);
        if ((TextUtils.isEmpty(uin)) || (uin.equals("0"))) {
          break label116;
        }
        jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.put(uin, paramString1);
      }
      finally
      {
        localEntityTransaction.b();
      }
      localEntityTransaction.c();
      localEntityTransaction.b();
      if (i1 != 0) {
        a(1);
      }
      return;
      label111:
      int i1 = 0;
      continue;
      label116:
      i1 = 1;
    }
  }
  
  public boolean d()
  {
    if (jdField_a_of_type_Int == 5) {}
    do
    {
      return true;
      if (jdField_a_of_type_Int != 3) {
        break;
      }
      if (a() == null) {
        break label63;
      }
    } while (alastUsedFlag == 2L);
    return false;
    if (jdField_a_of_type_Int == 4) {
      return jdField_a_of_type_AndroidContentSharedPreferences.getBoolean("contact_bind_allow_upload", false);
    }
    label63:
    return false;
  }
  
  public int e()
  {
    return jdField_a_of_type_Int;
  }
  
  public List e()
  {
    long l1 = System.currentTimeMillis();
    Object localObject1 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    if ((jdField_g_of_type_JavaUtilList == null) || (jdField_g_of_type_JavaUtilList.size() <= 0))
    {
      ArrayList localArrayList = new ArrayList();
      Object localObject2 = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.values().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        PhoneContact localPhoneContact = (PhoneContact)((Iterator)localObject2).next();
        if (TextUtils.isEmpty(uin)) {
          localArrayList.add(localPhoneContact);
        } else if ((!uin.equals("0")) && (((FriendsManager)localObject1).c(uin) != null)) {
          localArrayList.add(localPhoneContact);
        }
      }
      if (localArrayList.size() > 0)
      {
        if (a() == null) {
          return null;
        }
        localArrayList.remove(b(amobileNo));
        localObject1 = localArrayList.iterator();
        while (((Iterator)localObject1).hasNext())
        {
          localObject2 = (PhoneContact)((Iterator)localObject1).next();
          if (pinyinFirst == null) {
            pinyinFirst = PhoneContactHelper.b(pinyinInitial);
          }
        }
        Collections.sort(localArrayList, new nbo(this));
      }
      jdField_g_of_type_JavaUtilList = localArrayList;
    }
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "getContactListForPhoneSelector sort contact cost time: " + (System.currentTimeMillis() - l1));
    }
    return jdField_g_of_type_JavaUtilList;
  }
  
  public void e()
  {
    RespondQueryQQBindingStat localRespondQueryQQBindingStat = a();
    if ((localRespondQueryQQBindingStat == null) || (nationCode == null) || (mobileNo == null)) {
      return;
    }
    b(false, false);
  }
  
  public void e(String paramString1, String paramString2)
  {
    Object localObject = (String)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString1);
    if ((localObject == null) || (!((String)localObject).equals(paramString2)))
    {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString1, paramString2);
      jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString2, paramString1);
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      PhoneNumInfo localPhoneNumInfo = new PhoneNumInfo();
      phoneNum = paramString1;
      uin = paramString2;
      if (localObject != null)
      {
        ((EntityManager)localObject).b(localPhoneNumInfo);
        ((EntityManager)localObject).a();
      }
    }
  }
  
  /* Error */
  public boolean e()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_0
    //   4: getfield 200	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   7: invokevirtual 205	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   10: invokevirtual 377	com/tencent/qphone/base/util/BaseApplication:getContentResolver	()Landroid/content/ContentResolver;
    //   13: getstatic 383	android/provider/ContactsContract$CommonDataKinds$Phone:CONTENT_URI	Landroid/net/Uri;
    //   16: iconst_1
    //   17: anewarray 81	java/lang/String
    //   20: dup
    //   21: iconst_0
    //   22: ldc 83
    //   24: aastore
    //   25: aconst_null
    //   26: aconst_null
    //   27: aconst_null
    //   28: invokevirtual 389	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   31: astore_3
    //   32: aload_3
    //   33: astore 4
    //   35: aload 4
    //   37: astore_3
    //   38: aload 4
    //   40: invokeinterface 402 1 0
    //   45: istore_1
    //   46: iload_1
    //   47: ifle +79 -> 126
    //   50: iconst_1
    //   51: istore_2
    //   52: aload 4
    //   54: ifnull +10 -> 64
    //   57: aload 4
    //   59: invokeinterface 457 1 0
    //   64: iload_2
    //   65: ireturn
    //   66: astore 5
    //   68: aconst_null
    //   69: astore 4
    //   71: aload 4
    //   73: astore_3
    //   74: aload 5
    //   76: invokevirtual 496	java/lang/Exception:printStackTrace	()V
    //   79: aload 4
    //   81: ifnull +43 -> 124
    //   84: aload 4
    //   86: invokeinterface 457 1 0
    //   91: iconst_0
    //   92: ireturn
    //   93: astore_3
    //   94: aload 4
    //   96: ifnull +10 -> 106
    //   99: aload 4
    //   101: invokeinterface 457 1 0
    //   106: aload_3
    //   107: athrow
    //   108: astore 5
    //   110: aload_3
    //   111: astore 4
    //   113: aload 5
    //   115: astore_3
    //   116: goto -22 -> 94
    //   119: astore 5
    //   121: goto -50 -> 71
    //   124: iconst_0
    //   125: ireturn
    //   126: iconst_0
    //   127: istore_2
    //   128: goto -76 -> 52
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	131	0	this	PhoneContactManagerImp
    //   45	2	1	i1	int
    //   51	77	2	bool	boolean
    //   31	43	3	localObject1	Object
    //   93	18	3	localObject2	Object
    //   115	1	3	localObject3	Object
    //   1	111	4	localObject4	Object
    //   66	9	5	localException1	Exception
    //   108	6	5	localObject5	Object
    //   119	1	5	localException2	Exception
    // Exception table:
    //   from	to	target	type
    //   3	32	66	java/lang/Exception
    //   3	32	93	finally
    //   38	46	108	finally
    //   74	79	108	finally
    //   38	46	119	java/lang/Exception
  }
  
  public List f()
  {
    long l1 = System.currentTimeMillis();
    Object localObject2;
    ArrayList localArrayList;
    FriendsManager localFriendsManager;
    Object localObject1;
    label202:
    label255:
    label270:
    String str2;
    int i2;
    label345:
    int i1;
    label365:
    int i3;
    label378:
    int i4;
    label399:
    Friends localFriends;
    label407:
    label423:
    int i5;
    if (jdField_h_of_type_JavaUtilList == null)
    {
      localObject2 = new ArrayList();
      ((List)localObject2).addAll(jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.values());
      Collections.sort((List)localObject2, new nbp(this));
      localArrayList = new ArrayList();
      localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if (((List)localObject2).size() > 0)
      {
        if (a() == null) {
          return null;
        }
        String str1 = amobileNo;
        localObject1 = null;
        Iterator localIterator = ((List)localObject2).iterator();
        for (;;)
        {
          if (localIterator.hasNext())
          {
            localObject2 = (PhoneContact)localIterator.next();
            if ((str1 == null) || (!str1.endsWith(mobileNo.trim())))
            {
              localObject2 = (PhoneContact)((PhoneContact)localObject2).clone();
              if (localObject1 == null)
              {
                localObject1 = localObject2;
                if (!TextUtils.isEmpty(uin))
                {
                  if (!uin.equals("0")) {
                    break label255;
                  }
                  localObject1 = null;
                  if ((localObject1 == null) || (groupid < 0)) {
                    break label270;
                  }
                  nickName = ((Friends)localObject1).getFriendNick();
                  remark = remark;
                  faceUrl = Short.toString(faceid);
                }
                for (localObject1 = localObject2;; localObject1 = localObject2)
                {
                  break;
                  localObject1 = localFriendsManager.c(uin);
                  break label202;
                  uin = "0";
                }
              }
              if (contactID == contactID)
              {
                str2 = mobileNo + "|" + mobileNo;
                if (!TextUtils.isEmpty(uin))
                {
                  i2 = 1;
                  if ((i2 == 0) || (uin.equals("0"))) {
                    break label509;
                  }
                  i1 = 1;
                  if (TextUtils.isEmpty(uin)) {
                    break label514;
                  }
                  i3 = 1;
                  if ((i3 == 0) || (uin.equals("0"))) {
                    break label519;
                  }
                  i4 = 1;
                  if (i4 != 0) {
                    break label525;
                  }
                  localFriends = null;
                  if ((localFriends == null) || (groupid < 0)) {
                    break label540;
                  }
                  i4 = 1;
                  i5 = 2;
                  if (i1 == 0) {
                    break label546;
                  }
                  i1 = 0;
                  label432:
                  if (i4 == 0) {
                    break label558;
                  }
                  i2 = 0;
                }
              }
            }
          }
        }
      }
    }
    for (;;)
    {
      label439:
      if (i1 > i2)
      {
        localObject1 = localObject2;
        if (i3 != 0)
        {
          if (i4 == 0) {
            break label567;
          }
          nickName = localFriends.getFriendNick();
          remark = remark;
          faceUrl = Short.toString(faceid);
          localObject1 = localObject2;
        }
      }
      for (;;)
      {
        mobileNo = str2;
        break;
        i2 = 0;
        break label345;
        label509:
        i1 = 0;
        break label365;
        label514:
        i3 = 0;
        break label378;
        label519:
        i4 = 0;
        break label399;
        label525:
        localFriends = localFriendsManager.c(uin);
        break label407;
        label540:
        i4 = 0;
        break label423;
        label546:
        i1 = i5;
        if (i2 == 0) {
          break label432;
        }
        i1 = 1;
        break label432;
        label558:
        if (i3 == 0) {
          break label783;
        }
        i2 = 1;
        break label439;
        label567:
        uin = "0";
        localObject1 = localObject2;
        continue;
        localArrayList.add(localObject1);
        localObject1 = localObject2;
        if (TextUtils.isEmpty(uin)) {
          break;
        }
        if (uin.equals("0")) {}
        for (localObject1 = null;; localObject1 = localFriendsManager.c(uin))
        {
          if ((localObject1 == null) || (groupid < 0)) {
            break label690;
          }
          nickName = ((Friends)localObject1).getFriendNick();
          remark = remark;
          faceUrl = Short.toString(faceid);
          localObject1 = localObject2;
          break;
        }
        label690:
        uin = "0";
        localObject1 = localObject2;
        break;
        if (localObject1 != null) {
          localArrayList.add(localObject1);
        }
        Collections.sort(localArrayList, new nbq(this));
        jdField_h_of_type_JavaUtilList = localArrayList;
        if (QLog.isColorLevel()) {
          QLog.d("PhoneContact.Manager", 2, "getContactListForContactListView sort contact cost time: " + (System.currentTimeMillis() - l1));
        }
        return jdField_h_of_type_JavaUtilList;
      }
      label783:
      i2 = 2;
    }
  }
  
  public void f()
  {
    a(1);
  }
  
  public boolean f()
  {
    int i1 = d();
    return (i1 != 1) || (i1 == 2);
  }
  
  public void g()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_c_of_type_JavaLangRunnable);
  }
  
  /* Error */
  public void h()
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: invokestatic 290	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7: ifeq +69 -> 76
    //   10: new 207	java/lang/StringBuilder
    //   13: dup
    //   14: bipush 50
    //   16: invokespecial 787	java/lang/StringBuilder:<init>	(I)V
    //   19: astore_2
    //   20: aload_2
    //   21: ldc_w 1571
    //   24: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   27: astore_3
    //   28: aload_0
    //   29: getfield 120	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_Int	I
    //   32: iconst_5
    //   33: if_icmpne +63 -> 96
    //   36: aload_3
    //   37: iload_1
    //   38: invokevirtual 676	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   41: pop
    //   42: aload_2
    //   43: ldc_w 1043
    //   46: invokevirtual 214	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   49: invokestatic 396	java/lang/System:currentTimeMillis	()J
    //   52: aload_0
    //   53: getfield 114	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_Long	J
    //   56: lsub
    //   57: ldc2_w 1044
    //   60: ldiv
    //   61: invokevirtual 309	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   64: pop
    //   65: ldc_w 410
    //   68: iconst_2
    //   69: aload_2
    //   70: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   73: invokestatic 324	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   76: aload_0
    //   77: getfield 120	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_Int	I
    //   80: iconst_5
    //   81: if_icmpeq +12 -> 93
    //   84: aload_0
    //   85: invokevirtual 296	com/tencent/mobileqq/app/PhoneContactManagerImp:a	()Ljava/lang/String;
    //   88: astore_2
    //   89: aload_2
    //   90: ifnonnull +11 -> 101
    //   93: aload_0
    //   94: monitorexit
    //   95: return
    //   96: iconst_0
    //   97: istore_1
    //   98: goto -62 -> 36
    //   101: invokestatic 396	java/lang/System:currentTimeMillis	()J
    //   104: aload_0
    //   105: getfield 114	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_c_of_type_Long	J
    //   108: lsub
    //   109: ldc2_w 30
    //   112: lcmp
    //   113: iflt -20 -> 93
    //   116: aload_0
    //   117: getfield 229	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_AndroidContentSharedPreferences	Landroid/content/SharedPreferences;
    //   120: invokeinterface 651 1 0
    //   125: ldc_w 1055
    //   128: iconst_1
    //   129: invokeinterface 687 3 0
    //   134: pop
    //   135: aload_0
    //   136: iconst_5
    //   137: putfield 120	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_Int	I
    //   140: aload_0
    //   141: invokespecial 678	com/tencent/mobileqq/app/PhoneContactManagerImp:n	()V
    //   144: aload_0
    //   145: getfield 192	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_Ncb	Lncb;
    //   148: ifnonnull +23 -> 171
    //   151: aload_0
    //   152: new 1573	ncb
    //   155: dup
    //   156: aload_0
    //   157: aconst_null
    //   158: invokespecial 1574	ncb:<init>	(Lcom/tencent/mobileqq/app/PhoneContactManagerImp;Lnbb;)V
    //   161: putfield 192	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_Ncb	Lncb;
    //   164: aload_0
    //   165: getfield 192	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_Ncb	Lncb;
    //   168: invokevirtual 1575	ncb:a	()V
    //   171: aload_0
    //   172: invokespecial 1577	com/tencent/mobileqq/app/PhoneContactManagerImp:a	()Ljava/util/ArrayList;
    //   175: astore_3
    //   176: aload_3
    //   177: astore_2
    //   178: aload_3
    //   179: ifnonnull +12 -> 191
    //   182: new 391	java/util/ArrayList
    //   185: dup
    //   186: iconst_0
    //   187: invokespecial 989	java/util/ArrayList:<init>	(I)V
    //   190: astore_2
    //   191: new 735	mqq/app/NewIntent
    //   194: dup
    //   195: aload_0
    //   196: getfield 200	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   199: invokevirtual 739	com/tencent/mobileqq/app/QQAppInterface:getApplication	()Lmqq/app/MobileQQ;
    //   202: ldc_w 741
    //   205: invokespecial 744	mqq/app/NewIntent:<init>	(Landroid/content/Context;Ljava/lang/Class;)V
    //   208: astore_3
    //   209: aload_3
    //   210: ldc_w 746
    //   213: bipush 31
    //   215: invokevirtual 750	mqq/app/NewIntent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   218: pop
    //   219: aload_3
    //   220: ldc_w 752
    //   223: aload_0
    //   224: invokevirtual 296	com/tencent/mobileqq/app/PhoneContactManagerImp:a	()Ljava/lang/String;
    //   227: invokevirtual 755	mqq/app/NewIntent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   230: pop
    //   231: aload_3
    //   232: ldc_w 766
    //   235: lconst_0
    //   236: invokevirtual 769	mqq/app/NewIntent:putExtra	(Ljava/lang/String;J)Landroid/content/Intent;
    //   239: pop
    //   240: aload_3
    //   241: ldc_w 771
    //   244: iconst_0
    //   245: invokevirtual 750	mqq/app/NewIntent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   248: pop
    //   249: aload_3
    //   250: ldc_w 1579
    //   253: aload_2
    //   254: invokevirtual 760	mqq/app/NewIntent:putExtra	(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
    //   257: pop
    //   258: aload_3
    //   259: ldc -21
    //   261: iconst_0
    //   262: newarray byte
    //   264: invokevirtual 774	mqq/app/NewIntent:putExtra	(Ljava/lang/String;[B)Landroid/content/Intent;
    //   267: pop
    //   268: aload_3
    //   269: ldc_w 776
    //   272: iconst_0
    //   273: invokevirtual 779	mqq/app/NewIntent:putExtra	(Ljava/lang/String;Z)Landroid/content/Intent;
    //   276: pop
    //   277: aload_0
    //   278: getfield 200	com/tencent/mobileqq/app/PhoneContactManagerImp:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   281: aload_3
    //   282: invokevirtual 783	com/tencent/mobileqq/app/QQAppInterface:startServlet	(Lmqq/app/NewIntent;)V
    //   285: goto -192 -> 93
    //   288: astore_2
    //   289: aload_0
    //   290: monitorexit
    //   291: aload_2
    //   292: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	293	0	this	PhoneContactManagerImp
    //   1	97	1	bool	boolean
    //   19	235	2	localObject1	Object
    //   288	4	2	localObject2	Object
    //   27	255	3	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   4	36	288	finally
    //   36	76	288	finally
    //   76	89	288	finally
    //   101	171	288	finally
    //   171	176	288	finally
    //   182	191	288	finally
    //   191	285	288	finally
  }
  
  public void i()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact", 2, "runPhoneContact");
    }
    SharedPreferences.Editor localEditor = jdField_b_of_type_AndroidContentSharedPreferences.edit();
    localEditor.putString("phone_version_run", "6.3.3");
    localEditor.commit();
  }
  
  public void onDestroy()
  {
    jdField_d_of_type_JavaUtilList = null;
    jdField_c_of_type_JavaUtilList = null;
    jdField_f_of_type_JavaUtilList = null;
    jdField_h_of_type_JavaUtilList = null;
    ThreadManager.c().removeCallbacks(jdField_a_of_type_JavaLangRunnable);
    ThreadManager.b().removeCallbacks(jdField_d_of_type_JavaLangRunnable);
    ThreadManager.b().removeCallbacks(jdField_b_of_type_JavaLangRunnable);
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact", 2, "onDestroy");
    }
    a();
    jdField_a_of_type_Int = -1;
    jdField_d_of_type_Boolean = false;
  }
}
