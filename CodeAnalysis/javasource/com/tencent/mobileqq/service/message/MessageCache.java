package com.tencent.mobileqq.service.message;

import PushNotifyPack.DisMsgReadedNotify;
import PushNotifyPack.GroupMsgReadedNotify;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import android.util.Pair;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.AppShareID;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.OpenID;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.revokemsg.RevokeMsgInfo;
import com.tencent.mobileqq.utils.AppShareIDUtil;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MessageCache
{
  public static final int a = 0;
  private static String jdField_a_of_type_JavaLangString = "Q.msg.MessageCache";
  public static final int b = 1;
  public static final int c = 2;
  private ConcurrentHashMap A = new ConcurrentHashMap();
  private ConcurrentHashMap B = new ConcurrentHashMap();
  private ConcurrentHashMap C = new ConcurrentHashMap();
  private ConcurrentHashMap D = new ConcurrentHashMap();
  private ConcurrentHashMap E = new ConcurrentHashMap();
  private ConcurrentHashMap F = new ConcurrentHashMap();
  private ConcurrentHashMap G = new ConcurrentHashMap();
  private ConcurrentHashMap H = new ConcurrentHashMap();
  private ConcurrentHashMap I = new ConcurrentHashMap();
  private ConcurrentHashMap J = new ConcurrentHashMap();
  private ConcurrentHashMap K = new ConcurrentHashMap();
  private ConcurrentHashMap L = new ConcurrentHashMap();
  private ConcurrentHashMap M = new ConcurrentHashMap();
  private ConcurrentHashMap N = new ConcurrentHashMap();
  private ConcurrentHashMap O = new ConcurrentHashMap();
  private ConcurrentHashMap P = new ConcurrentHashMap();
  private ConcurrentHashMap Q = new ConcurrentHashMap();
  private ConcurrentHashMap R = new ConcurrentHashMap();
  private ConcurrentHashMap S = new ConcurrentHashMap();
  private ConcurrentHashMap T = new ConcurrentHashMap();
  private ConcurrentHashMap U = new ConcurrentHashMap();
  private ConcurrentHashMap V = new ConcurrentHashMap();
  private ConcurrentHashMap W = new ConcurrentHashMap();
  private ConcurrentHashMap X = new ConcurrentHashMap();
  private ConcurrentHashMap Y = new ConcurrentHashMap();
  private ConcurrentHashMap Z = new ConcurrentHashMap();
  private long jdField_a_of_type_Long = -1L;
  private SharedPreferences jdField_a_of_type_AndroidContentSharedPreferences;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private MessageRecord jdField_a_of_type_ComTencentMobileqqDataMessageRecord = null;
  private MessageCache.AsyncEditor jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor;
  public MessageCacheItem a;
  ArrayList jdField_a_of_type_JavaUtilArrayList = new ArrayList();
  private HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap();
  private Set jdField_a_of_type_JavaUtilSet = Collections.synchronizedSet(new HashSet());
  public ConcurrentHashMap a;
  public AtomicInteger a;
  private boolean jdField_a_of_type_Boolean = false;
  private byte[] jdField_a_of_type_ArrayOfByte;
  private ConcurrentHashMap aa = new ConcurrentHashMap();
  private long jdField_b_of_type_Long = 0L;
  private MessageRecord jdField_b_of_type_ComTencentMobileqqDataMessageRecord = null;
  private ArrayList jdField_b_of_type_JavaUtilArrayList = new ArrayList();
  public ConcurrentHashMap b;
  private boolean jdField_b_of_type_Boolean = false;
  private byte[] jdField_b_of_type_ArrayOfByte;
  private ArrayList c;
  public ConcurrentHashMap c;
  private int d;
  public ConcurrentHashMap d;
  private int jdField_e_of_type_Int = -1;
  private ConcurrentHashMap jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  private int jdField_f_of_type_Int = -1;
  private ConcurrentHashMap jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  private ConcurrentHashMap g = new ConcurrentHashMap();
  private ConcurrentHashMap h = new ConcurrentHashMap();
  private ConcurrentHashMap i = new ConcurrentHashMap();
  private ConcurrentHashMap j = new ConcurrentHashMap();
  private ConcurrentHashMap k = new ConcurrentHashMap();
  private ConcurrentHashMap l = new ConcurrentHashMap();
  private ConcurrentHashMap m = new ConcurrentHashMap();
  private ConcurrentHashMap n = new ConcurrentHashMap();
  private ConcurrentHashMap o = new ConcurrentHashMap();
  private ConcurrentHashMap p = new ConcurrentHashMap();
  private ConcurrentHashMap q = new ConcurrentHashMap();
  private ConcurrentHashMap r = new ConcurrentHashMap();
  private ConcurrentHashMap s = new ConcurrentHashMap();
  private ConcurrentHashMap t = new ConcurrentHashMap();
  private ConcurrentHashMap u = new ConcurrentHashMap();
  private ConcurrentHashMap v = new ConcurrentHashMap();
  private ConcurrentHashMap w = new ConcurrentHashMap();
  private ConcurrentHashMap x = new ConcurrentHashMap();
  private ConcurrentHashMap y = new ConcurrentHashMap();
  private ConcurrentHashMap z = new ConcurrentHashMap();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public MessageCache(QQAppInterface paramQQAppInterface)
  {
    jdField_d_of_type_Int = 0;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(0);
    jdField_c_of_type_JavaUtilArrayList = new ArrayList();
    jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidContentSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
    jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor = new MessageCache.AsyncEditor(this);
  }
  
  public static long a()
  {
    return NetConnInfoCenter.getServerTime();
  }
  
  private String a(List paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder();
    int i1 = 0;
    if (i1 < paramList.size())
    {
      if (i1 != paramList.size() - 1) {
        localStringBuilder.append(paramList.get(i1) + "|");
      }
      for (;;)
      {
        i1 += 1;
        break;
        localStringBuilder.append(paramList.get(i1));
      }
    }
    return localStringBuilder.toString();
  }
  
  private List a(String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    if ((paramString == null) || (paramString.length() == 0)) {
      return localArrayList;
    }
    paramString = paramString.split("\\|");
    int i2 = paramString.length;
    int i1 = 0;
    while (i1 < i2)
    {
      String str = paramString[i1];
      try
      {
        localArrayList.add(Integer.valueOf(str));
        i1 += 1;
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
  }
  
  public int a()
  {
    if (jdField_e_of_type_Int == -1) {
      jdField_e_of_type_Int = jdField_a_of_type_AndroidContentSharedPreferences.getInt("DS_SEND_KEY", 0);
    }
    jdField_e_of_type_Int += 1;
    jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putInt("DS_SEND_KEY", jdField_e_of_type_Int);
    return jdField_e_of_type_Int;
  }
  
  public int a(String paramString)
  {
    if (!Q.containsKey(paramString)) {
      Q.put(paramString, Integer.valueOf(2));
    }
    return ((Integer)Q.get(paramString)).intValue();
  }
  
  public int a(String paramString, int paramInt)
  {
    paramString = a(paramString, paramInt).iterator();
    for (paramInt = 0; paramString.hasNext(); paramInt = Math.max(((Integer)paramString.next()).intValue(), paramInt)) {}
    return paramInt + 1;
  }
  
  public long a(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return 0L;
    }
    if (!jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getTroopLastMessageTime" + paramString, 0L);
      jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, Long.valueOf(l1));
    }
    return ((Long)jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString)).longValue();
  }
  
  public long a(String paramString, int paramInt)
  {
    String str = MsgProxyUtils.a(paramString, paramInt);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getMsgDelLastSeq uin = " + paramString + ",type = " + paramInt + " , lastSeqId = " + 0);
      }
      return 0L;
    }
    if (!G.containsKey(str))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getDelMsgLastSeq" + str, 0L);
      G.put(str, Long.valueOf(l1));
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getMsgDelLastSeq uin = " + paramString + ",type = " + paramInt + " , lastSeqId = " + l1);
      }
    }
    return ((Long)G.get(str)).longValue();
  }
  
  public DisMsgReadedNotify a(String paramString)
  {
    return (DisMsgReadedNotify)W.remove(paramString);
  }
  
  public GroupMsgReadedNotify a(String paramString)
  {
    return (GroupMsgReadedNotify)X.remove(paramString);
  }
  
  public Pair a(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      localObject = null;
    }
    Pair localPair;
    do
    {
      return localObject;
      localPair = (Pair)n.get(paramString);
      localObject = localPair;
    } while (localPair != null);
    Object localObject = new Pair(Long.valueOf(jdField_a_of_type_AndroidContentSharedPreferences.getLong("getDisscussionInfoSeq" + paramString, 0L)), Long.valueOf(jdField_a_of_type_AndroidContentSharedPreferences.getLong("getDisscussionInfoLastTime" + paramString, 0L)));
    n.put(paramString, localObject);
    return localObject;
  }
  
  public AppShareID a(String paramString)
  {
    if (!Y.containsKey(paramString))
    {
      EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      AppShareID localAppShareID = (AppShareID)localEntityManager.a(AppShareID.class, "strPkgName=?", new String[] { paramString });
      if (localAppShareID != null)
      {
        a(paramString, localAppShareID);
        if (QLog.isColorLevel()) {
          QLog.d("share_appid", 2, "Add cache from db appid = " + paramString);
        }
        localEntityManager.a();
      }
    }
    for (;;)
    {
      if (Y.get(paramString) != AppShareIDUtil.a) {
        break label187;
      }
      return null;
      if (QLog.isColorLevel()) {
        QLog.d("share_appid", 2, "Not exist in db appid = " + paramString);
      }
      a(paramString, AppShareIDUtil.a);
      break;
      if (QLog.isColorLevel()) {
        QLog.d("share_appid", 2, "Already in cache appid = " + paramString);
      }
    }
    label187:
    return (AppShareID)Y.get(paramString);
  }
  
  public MessageRecord a(int paramInt, String paramString, long paramLong)
  {
    paramString = String.valueOf(paramInt) + "_" + paramString + "_" + paramLong;
    MessageRecord localMessageRecord = (MessageRecord)N.get(paramString);
    N.remove(paramString);
    return localMessageRecord;
  }
  
  public OpenID a(String paramString)
  {
    if (!Z.containsKey(paramString))
    {
      EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      OpenID localOpenID = (OpenID)localEntityManager.a(OpenID.class, paramString);
      if (localOpenID != null)
      {
        a(paramString, localOpenID);
        if (QLog.isColorLevel()) {
          QLog.d("openid", 2, "Add cache from db appid = " + paramString);
        }
      }
      localEntityManager.a();
    }
    for (;;)
    {
      return (OpenID)Z.get(paramString);
      if (QLog.isColorLevel()) {
        QLog.d("openid", 2, "Already in cache appid = " + paramString + ",openid=" + Z.get(paramString)).openID);
      }
    }
  }
  
  public MessageCacheItem a()
  {
    if (jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCacheItem == null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCacheItem = new MessageCacheItem(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1026, "hctopic", jdField_a_of_type_AndroidContentSharedPreferences, jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor);
    }
    return jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCacheItem;
  }
  
  public String a()
  {
    StringBuilder localStringBuilder = new StringBuilder("dumpUnFinishGrpMsgJob : ");
    if (h.isEmpty()) {
      localStringBuilder.append("AllFinish.");
    }
    for (;;)
    {
      return localStringBuilder.toString();
      Iterator localIterator = h.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localStringBuilder.append("grpUin:").append(str).append(";");
      }
    }
  }
  
  public String a(String paramString)
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) || (TextUtils.isEmpty(paramString))) {
      return "";
    }
    if (!jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString))
    {
      String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "crm", 0).getString(paramString + "ext", null);
      if (str == null) {
        return "";
      }
      jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, str);
    }
    return (String)jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
  }
  
  public ArrayList a()
  {
    return jdField_c_of_type_JavaUtilArrayList;
  }
  
  public ArrayList a(long paramLong)
  {
    return (ArrayList)S.get(Long.valueOf(paramLong));
  }
  
  public ArrayList a(String paramString)
  {
    return (ArrayList)R.get(paramString);
  }
  
  public List a(String paramString, int paramInt)
  {
    String str = MsgProxyUtils.a(paramString, paramInt);
    if (!s.containsKey(str))
    {
      paramString = jdField_a_of_type_AndroidContentSharedPreferences.getString("getLongMsgIdArray" + MsgProxyUtils.a(paramString, paramInt), "");
      s.put(str, a(paramString));
    }
    return (List)s.get(str);
  }
  
  public Map a(String paramString, int paramInt)
  {
    synchronized (L)
    {
      paramString = MsgProxyUtils.a(paramString, paramInt);
      if ((L.containsKey(paramString)) && (L.get(paramString) != null))
      {
        Map localMap = (Map)L.get(paramString);
        if ((localMap != null) && (localMap.isEmpty()))
        {
          L.remove(paramString);
          return null;
        }
        return localMap;
      }
    }
    return null;
  }
  
  public ConcurrentHashMap a()
  {
    return Q;
  }
  
  public void a()
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "clearDiscNumInfoCache");
      }
      jdField_b_of_type_JavaUtilArrayList.clear();
      return;
    }
    finally {}
  }
  
  public void a(int paramInt)
  {
    jdField_d_of_type_Int = paramInt;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putInt("getlastMessageTime", paramInt);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>setBuddyMsgLastSeq lastseq = " + paramInt);
      }
    }
  }
  
  public void a(long paramLong)
  {
    S.remove(Long.valueOf(paramLong));
  }
  
  public void a(long paramLong1, long paramLong2)
  {
    I.put("last_friend_seq_47", Long.valueOf(paramLong1));
    I.put("last_group_seq", Long.valueOf(paramLong2));
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (str != null)
    {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("last_friend_seq_47" + str, paramLong1).commit();
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("last_group_seq" + str, paramLong2).commit();
    }
  }
  
  public void a(long paramLong1, String paramString, long paramLong2)
  {
    Object localObject2 = (ArrayList)jdField_a_of_type_JavaUtilHashMap.get(Long.valueOf(paramLong1));
    Object localObject1 = localObject2;
    long l1;
    long l2;
    long l3;
    if (localObject2 == null) {
      if (jdField_a_of_type_JavaUtilHashMap.size() >= 20)
      {
        localObject1 = jdField_a_of_type_JavaUtilHashMap.keySet().iterator();
        l1 = 0L;
        if (!((Iterator)localObject1).hasNext()) {
          break label232;
        }
        l2 = ((Long)((Iterator)localObject1).next()).longValue();
        l3 = Long.parseLong((String)((ArrayList)jdField_a_of_type_JavaUtilHashMap.get(Long.valueOf(l2))).get(0));
        if (paramLong2 - l3 <= 300L) {
          break label202;
        }
      }
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilHashMap.remove(Long.valueOf(l2));
      localObject1 = new ArrayList();
      if (((ArrayList)localObject1).size() >= 20) {
        ((ArrayList)localObject1).remove(0);
      }
      localObject2 = Long.toString(paramLong2);
      if (((ArrayList)localObject1).size() == 0)
      {
        ((ArrayList)localObject1).add(localObject2);
        label180:
        ((ArrayList)localObject1).add(paramString);
        jdField_a_of_type_JavaUtilHashMap.put(Long.valueOf(paramLong1), localObject1);
        return;
        label202:
        if (l3 >= paramLong2) {
          break label229;
        }
        l1 = l2;
      }
      label229:
      for (;;)
      {
        break;
        ((ArrayList)localObject1).set(0, localObject2);
        break label180;
      }
      label232:
      l2 = l1;
    }
  }
  
  public void a(long paramLong, List paramList)
  {
    ArrayList localArrayList2 = (ArrayList)S.get(Long.valueOf(paramLong));
    ArrayList localArrayList1;
    if (localArrayList2 != null)
    {
      localArrayList1 = localArrayList2;
      if (localArrayList2.size() != 0) {}
    }
    else
    {
      localArrayList1 = new ArrayList();
    }
    localArrayList1.addAll(paramList);
    S.put(Long.valueOf(paramLong), localArrayList1);
  }
  
  public void a(MessageRecord paramMessageRecord)
  {
    for (;;)
    {
      String str;
      synchronized (L)
      {
        if (!paramMessageRecord.isLongMsg()) {
          return;
        }
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "addOnlineLongMsgFragment longid=" + paramMessageRecord.getLongMsgInfoString());
        }
        localObject = MsgProxyUtils.a(frienduin, istroop);
        str = MsgProxyUtils.a(paramMessageRecord);
        if ((L.containsKey(localObject)) && (L.get(localObject) != null))
        {
          localConcurrentHashMap1 = (ConcurrentHashMap)L.get(localObject);
          if (!localConcurrentHashMap1.containsKey(str)) {
            break label195;
          }
          localObject = (Set)localConcurrentHashMap1.get(str);
          ((Set)localObject).add(Integer.valueOf(longMsgIndex));
          if (longMsgCount <= ((Set)localObject).size()) {
            localConcurrentHashMap1.remove(str);
          }
          return;
        }
      }
      ConcurrentHashMap localConcurrentHashMap1 = new ConcurrentHashMap();
      L.put(localObject, localConcurrentHashMap1);
      continue;
      label195:
      Object localObject = new HashSet();
      ((Set)localObject).add(Integer.valueOf(longMsgIndex));
      localConcurrentHashMap1.put(str, localObject);
    }
  }
  
  public void a(String paramString)
  {
    jdField_c_of_type_JavaUtilArrayList.add(paramString);
  }
  
  public void a(String paramString, int paramInt)
  {
    Q.put(paramString, Integer.valueOf(paramInt));
    if (paramInt != 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "setTroopMsgResponseState state: " + paramString + " state: " + paramInt);
      }
      if (paramInt == 2) {
        f(paramString);
      }
    }
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    a(paramString, paramInt1).add(Integer.valueOf(paramInt2));
    if (a(paramString, paramInt1).size() > 50)
    {
      paramInt2 = 0;
      while (paramInt2 < 10)
      {
        a(paramString, paramInt1).remove(0);
        paramInt2 += 1;
      }
    }
    jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putString("getLongMsgIdArray" + MsgProxyUtils.a(paramString, paramInt1), a(a(paramString, paramInt1))).commit();
  }
  
  public void a(String paramString, int paramInt, long paramLong)
  {
    long l1;
    if (paramInt == 1) {
      l1 = Math.max(paramLong, a(paramString));
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "addMsgDelLastSeq uin = " + paramString + ",type = " + paramInt + " , lastSeqId = " + l1);
      }
      G.put(MsgProxyUtils.a(paramString, paramInt), Long.valueOf(Math.max(l1, a(paramString, paramInt))));
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getDelMsgLastSeq" + MsgProxyUtils.a(paramString, paramInt), l1).commit();
      }
      return;
      if (paramInt == 3000)
      {
        l1 = Math.max(paramLong, g(paramString));
      }
      else
      {
        List localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString, paramInt);
        l1 = paramLong;
        if (localList != null)
        {
          l1 = paramLong;
          if (!localList.isEmpty()) {
            l1 = Math.max(paramLong, getsize1time);
          }
        }
        b(paramString, 0L, 0L);
      }
    }
  }
  
  public void a(String paramString1, int paramInt, String paramString2)
  {
    synchronized (L)
    {
      paramString1 = a(paramString1, paramInt);
      if (paramString1 == null) {
        return;
      }
      if (paramString1.containsKey(paramString2)) {
        paramString1.remove(paramString2);
      }
      return;
    }
  }
  
  public void a(String paramString, long paramLong)
  {
    paramLong = Math.max(paramLong, a(paramString));
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addGroupMsgLastSeq " + paramLong);
    }
    jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, Long.valueOf(paramLong));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getTroopLastMessageTime" + paramString, paramLong);
    }
  }
  
  public void a(String paramString, long paramLong1, long paramLong2)
  {
    n.put(paramString, new Pair(Long.valueOf(paramLong1), Long.valueOf(paramLong2)));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getDisscussionInfoSeq" + paramString, paramLong1);
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getDisscussionInfoLastTime" + paramString, paramLong2);
    }
  }
  
  public void a(String paramString, DisMsgReadedNotify paramDisMsgReadedNotify)
  {
    W.put(paramString, paramDisMsgReadedNotify);
  }
  
  public void a(String paramString, GroupMsgReadedNotify paramGroupMsgReadedNotify)
  {
    X.put(paramString, paramGroupMsgReadedNotify);
  }
  
  public void a(String paramString, AppShareID paramAppShareID)
  {
    Y.put(paramString, paramAppShareID);
    if (QLog.isColorLevel()) {
      QLog.d("share_appid", 2, "add share appid to cache = " + paramString);
    }
  }
  
  public void a(String paramString, OpenID paramOpenID)
  {
    Z.put(paramString, paramOpenID);
    if (QLog.isColorLevel()) {
      QLog.d("openid", 2, "add openid to cache = " + paramOpenID);
    }
  }
  
  public void a(String paramString1, String paramString2)
  {
    if ((!TextUtils.isEmpty(paramString1)) && (!TextUtils.isEmpty(paramString2)))
    {
      jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString1, paramString2);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        SharedPreferences.Editor localEditor = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "crm", 0).edit();
        localEditor.putString(paramString1 + "ext", paramString2);
        localEditor.commit();
      }
    }
  }
  
  public void a(String paramString, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addWpaMsgKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:" + HexUtil.a(paramArrayOfByte));
    }
    byte[] arrayOfByte = (byte[])t.get(paramString);
    if ((arrayOfByte == null) || (!Arrays.equals(arrayOfByte, paramArrayOfByte)))
    {
      t.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        paramArrayOfByte = HexUtil.a(paramArrayOfByte);
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putString(paramString, paramArrayOfByte);
      }
    }
  }
  
  public void a(String paramString, Object[] paramArrayOfObject)
  {
    ArrayList localArrayList2 = (ArrayList)R.get(paramString);
    ArrayList localArrayList1;
    if (localArrayList2 != null)
    {
      localArrayList1 = localArrayList2;
      if (localArrayList2.size() != 0) {}
    }
    else
    {
      localArrayList1 = new ArrayList();
    }
    localArrayList1.add(paramArrayOfObject);
    R.put(paramString, localArrayList1);
  }
  
  public void a(ArrayList paramArrayList)
  {
    Object localObject1 = (RevokeMsgInfo)paramArrayList.get(0);
    if (QLog.isColorLevel()) {
      QLog.d("revokeMsg", 2, "RevokeNotifyCache, add cache, " + ((RevokeMsgInfo)localObject1).toString());
    }
    int i2 = jdField_a_of_type_Int;
    Object localObject2 = jdField_a_of_type_JavaLangString;
    int i1;
    if (c > 1)
    {
      i1 = 1;
      if (i1 == 0) {
        break label254;
      }
      localObject1 = String.format("%s&%d&%d&%d", new Object[] { localObject2, Integer.valueOf(i2), Integer.valueOf(jdField_b_of_type_Int), Integer.valueOf(c) });
    }
    for (;;)
    {
      label121:
      if (r.containsKey(localObject1))
      {
        localObject1 = (ArrayList)r.get(localObject1);
        localObject2 = new ArrayList();
        paramArrayList = paramArrayList.iterator();
        for (;;)
        {
          if (paramArrayList.hasNext())
          {
            RevokeMsgInfo localRevokeMsgInfo1 = (RevokeMsgInfo)paramArrayList.next();
            Iterator localIterator = ((ArrayList)localObject1).iterator();
            RevokeMsgInfo localRevokeMsgInfo2;
            do
            {
              if (!localIterator.hasNext()) {
                break;
              }
              localRevokeMsgInfo2 = (RevokeMsgInfo)localIterator.next();
            } while ((jdField_a_of_type_Long != jdField_a_of_type_Long) || (jdField_b_of_type_Long != jdField_b_of_type_Long));
            ((ArrayList)localObject2).add(localRevokeMsgInfo1);
            continue;
            i1 = 0;
            break;
            label254:
            localObject1 = String.format("%s&%d&%d", new Object[] { localObject2, Integer.valueOf(i2), Long.valueOf(jdField_a_of_type_Long) });
            break label121;
          }
        }
        ((ArrayList)localObject1).addAll((Collection)localObject2);
        return;
      }
    }
    r.put(localObject1, paramArrayList);
  }
  
  /* Error */
  public void a(List paramList)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: invokestatic 415	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   5: ifeq +42 -> 47
    //   8: getstatic 83	com/tencent/mobileqq/service/message/MessageCache:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   11: astore_3
    //   12: new 292	java/lang/StringBuilder
    //   15: dup
    //   16: invokespecial 293	java/lang/StringBuilder:<init>	()V
    //   19: ldc_w 753
    //   22: invokevirtual 310	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   25: astore 4
    //   27: aload_1
    //   28: ifnonnull +31 -> 59
    //   31: iconst_0
    //   32: istore_2
    //   33: aload_3
    //   34: iconst_2
    //   35: aload 4
    //   37: iload_2
    //   38: invokevirtual 422	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   41: invokevirtual 313	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   44: invokestatic 427	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   47: aload_0
    //   48: getfield 114	com/tencent/mobileqq/service/message/MessageCache:jdField_b_of_type_JavaUtilArrayList	Ljava/util/ArrayList;
    //   51: aload_1
    //   52: invokevirtual 619	java/util/ArrayList:addAll	(Ljava/util/Collection;)Z
    //   55: pop
    //   56: aload_0
    //   57: monitorexit
    //   58: return
    //   59: aload_1
    //   60: invokeinterface 297 1 0
    //   65: istore_2
    //   66: goto -33 -> 33
    //   69: astore_1
    //   70: aload_0
    //   71: monitorexit
    //   72: aload_1
    //   73: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	74	0	this	MessageCache
    //   0	74	1	paramList	List
    //   32	34	2	i1	int
    //   11	23	3	str	String
    //   25	11	4	localStringBuilder	StringBuilder
    // Exception table:
    //   from	to	target	type
    //   2	27	69	finally
    //   33	47	69	finally
    //   47	56	69	finally
    //   59	66	69	finally
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_b_of_type_Boolean = paramBoolean;
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    jdField_a_of_type_ArrayOfByte = paramArrayOfByte;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      String str = HexUtil.a(paramArrayOfByte);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>setLastSyncCookie lastSyncCookie:" + str);
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>setBuddyMsgLastSeq cookie = " + HexUtil.a(paramArrayOfByte));
      }
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putString("getMsgV4_vSyncCookie", str);
    }
  }
  
  public void a(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null) {}
    StringBuilder localStringBuilder;
    do
    {
      return;
      localStringBuilder = new StringBuilder(256);
      localStringBuilder.append("removeDiscPullSeqCache, uinArray: ");
      int i2 = paramArrayOfString.length;
      int i1 = 0;
      while (i1 < i2)
      {
        String str = paramArrayOfString[i1];
        localStringBuilder.append(str).append(",");
        if (l.containsKey(str)) {
          l.remove(str);
        }
        i1 += 1;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString());
  }
  
  public boolean a()
  {
    return jdField_b_of_type_Boolean;
  }
  
  public boolean a(int paramInt, String paramString, long paramLong)
  {
    paramString = String.valueOf(paramInt) + "_" + paramString + "_" + paramLong;
    return N.containsKey(paramString);
  }
  
  public boolean a(long paramLong, String paramString)
  {
    Object localObject = (ArrayList)jdField_a_of_type_JavaUtilHashMap.get(Long.valueOf(paramLong));
    if ((localObject == null) || (((ArrayList)localObject).size() == 0)) {
      return false;
    }
    localObject = ((ArrayList)localObject).iterator();
    ((Iterator)localObject).next();
    while (((Iterator)localObject).hasNext()) {
      if (paramString.equals((String)((Iterator)localObject).next())) {
        return true;
      }
    }
    return false;
  }
  
  public boolean a(MessageRecord paramMessageRecord)
  {
    return a(frienduin, istroop, MsgProxyUtils.a(paramMessageRecord));
  }
  
  public boolean a(String paramString, int paramInt1, int paramInt2)
  {
    Iterator localIterator = a(paramString, paramInt1).iterator();
    while (localIterator.hasNext()) {
      if (((Integer)localIterator.next()).intValue() == paramInt2)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "long msg id is exist! uin=" + paramString + ",istroop=" + paramInt1 + ",longMsgID=" + paramInt2);
        }
        return true;
      }
    }
    return false;
  }
  
  public boolean a(String paramString, int paramInt, long paramLong)
  {
    if (jdField_b_of_type_ComTencentMobileqqDataMessageRecord == null) {}
    while ((!jdField_b_of_type_ComTencentMobileqqDataMessageRecord.frienduin.equals(paramString)) || (jdField_b_of_type_ComTencentMobileqqDataMessageRecord.istroop != paramInt) || (jdField_b_of_type_ComTencentMobileqqDataMessageRecord.uniseq != paramLong)) {
      return false;
    }
    return true;
  }
  
  public boolean a(String paramString1, int paramInt, String paramString2)
  {
    synchronized (L)
    {
      paramString1 = a(paramString1, paramInt);
      if (paramString1 == null) {
        return false;
      }
      if (paramString1.containsKey(paramString2))
      {
        if (((Set)paramString1.get(paramString2)).isEmpty())
        {
          paramString1.remove(paramString2);
          return false;
        }
        return true;
      }
    }
    return false;
  }
  
  public boolean a(String paramString, long paramLong1, long paramLong2)
  {
    if (jdField_a_of_type_JavaUtilSet.size() == 0) {
      return false;
    }
    paramString = paramString + "_" + paramLong1 + "_" + paramLong2;
    return jdField_a_of_type_JavaUtilSet.contains(paramString);
  }
  
  public byte[] a()
  {
    String str;
    if (((jdField_a_of_type_ArrayOfByte == null) || (jdField_a_of_type_ArrayOfByte.length == 0)) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null))
    {
      str = jdField_a_of_type_AndroidContentSharedPreferences.getString("getMsgV4_vSyncCookie", "");
      if (str.length() != 0) {
        break label97;
      }
    }
    label97:
    for (jdField_a_of_type_ArrayOfByte = null;; jdField_a_of_type_ArrayOfByte = HexUtil.a(str))
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>getLastSyncCookie lastSyncCookie:" + HexUtil.a(jdField_a_of_type_ArrayOfByte));
      }
      return jdField_a_of_type_ArrayOfByte;
    }
  }
  
  public byte[] a(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {}
    do
    {
      return null;
      if (y.containsKey(paramString)) {
        break;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "pub", 0).getString(paramString, null);
    } while (localObject == null);
    Object localObject = PkgTools.a((String)localObject);
    y.put(paramString, localObject);
    return (byte[])y.get(paramString);
  }
  
  public Object[] a(String paramString)
  {
    if (g.containsKey(paramString)) {
      return (Object[])g.get(paramString);
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getDiscussionMemberSeq" + paramString, -1L);
      long l2 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getDiscussionConfigSeq" + paramString, -1L);
      if (l1 != 0L) {
        return new Object[] { Long.valueOf(l1), Long.valueOf(l2) };
      }
    }
    return null;
  }
  
  public int b()
  {
    if ((jdField_d_of_type_Int <= 0) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)) {
      jdField_d_of_type_Int = jdField_a_of_type_AndroidContentSharedPreferences.getInt("getlastMessageTime", 1);
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>getBuddyMsgLastSeq: " + jdField_d_of_type_Int);
    }
    return jdField_d_of_type_Int;
  }
  
  public int b(String paramString)
  {
    if (!U.containsKey(paramString)) {
      U.put(paramString, Integer.valueOf(2));
    }
    return ((Integer)U.get(paramString)).intValue();
  }
  
  public long b()
  {
    if ((jdField_a_of_type_Long == -1L) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)) {
      jdField_a_of_type_Long = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getTroopDiscMsgLastTime", 0L);
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>getTroopAndDiscMsgLastTime lastTime: " + jdField_a_of_type_Long);
    }
    return jdField_a_of_type_Long;
  }
  
  public long b(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return 0L;
    }
    if (!j.containsKey(paramString))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getTroopExpiredSeq" + paramString, 0L);
      j.put(paramString, Long.valueOf(l1));
    }
    return ((Long)j.get(paramString)).longValue();
  }
  
  public long b(String paramString, int paramInt)
  {
    Pair localPair = new Pair(paramString, Integer.valueOf(paramInt));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getBreakPointSeq uin = " + paramString + ",type = " + paramInt + " , lastSeqId = " + 0);
      }
      return 0L;
    }
    if (!J.containsKey(localPair))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getBreakPointSeq" + paramString + "_" + paramInt, 0L);
      J.put(localPair, Long.valueOf(l1));
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getBreakPointSeq uin = " + paramString + ",type = " + paramInt + " , lastSeqId = " + l1);
      }
    }
    return ((Long)J.get(localPair)).longValue();
  }
  
  public Pair b(String paramString)
  {
    paramString = MD5.toMD5(paramString);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return null;
    }
    if (!o.containsKey(paramString))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getC2CLastMessageTime" + paramString, 0L);
      long l2 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getC2CLastMessageTimeRand" + paramString, 0L);
      o.put(paramString, new Pair(Long.valueOf(l1), Long.valueOf(l2)));
    }
    return (Pair)o.get(paramString);
  }
  
  public OpenID b(String paramString)
  {
    return (OpenID)Z.get(paramString);
  }
  
  public String b()
  {
    StringBuilder localStringBuilder = new StringBuilder("dumpUnFinishDisMsgJob : ");
    if (i.isEmpty()) {
      localStringBuilder.append("AllFinish.");
    }
    for (;;)
    {
      return localStringBuilder.toString();
      Iterator localIterator = i.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localStringBuilder.append("disUin:").append(str).append(";");
      }
    }
  }
  
  public ArrayList b()
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "cloneDiscNumInfoCache size = " + jdField_b_of_type_JavaUtilArrayList.size());
      }
      ArrayList localArrayList = (ArrayList)jdField_b_of_type_JavaUtilArrayList.clone();
      return localArrayList;
    }
    finally {}
  }
  
  public ArrayList b(long paramLong)
  {
    return (ArrayList)T.get(Long.valueOf(paramLong));
  }
  
  public ArrayList b(String paramString)
  {
    return (ArrayList)V.get(paramString);
  }
  
  public ConcurrentHashMap b()
  {
    return R;
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "clearDiscPullSeqCache");
    }
    l.clear();
  }
  
  public void b(int paramInt)
  {
    if (c() != paramInt)
    {
      jdField_f_of_type_Int = paramInt;
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putInt("msgsignal_switch", paramInt);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>setMsgSignalSwitch = " + paramInt);
      }
    }
  }
  
  public void b(long paramLong)
  {
    T.remove(Long.valueOf(paramLong));
  }
  
  public void b(long paramLong1, long paramLong2)
  {
    I.put("following_friend_seq_47", Long.valueOf(paramLong1));
    I.put("following_group_seq", Long.valueOf(paramLong2));
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (str != null)
    {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("following_friend_seq_47" + str, paramLong1).commit();
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("following_group_seq" + str, paramLong2).commit();
    }
  }
  
  public void b(long paramLong, List paramList)
  {
    ArrayList localArrayList2 = (ArrayList)T.get(Long.valueOf(paramLong));
    ArrayList localArrayList1;
    if (localArrayList2 != null)
    {
      localArrayList1 = localArrayList2;
      if (localArrayList2.size() != 0) {}
    }
    else
    {
      localArrayList1 = new ArrayList();
    }
    localArrayList1.addAll(paramList);
    T.put(Long.valueOf(paramLong), localArrayList1);
  }
  
  public void b(MessageRecord paramMessageRecord)
  {
    String str = String.valueOf(istroop) + "_" + frienduin + "_" + uniseq;
    N.put(str, paramMessageRecord);
  }
  
  public void b(String paramString)
  {
    R.remove(paramString);
  }
  
  public void b(String paramString, int paramInt)
  {
    U.put(paramString, Integer.valueOf(paramInt));
    if (paramInt != 0)
    {
      if (QLog.isColorLevel())
      {
        StringBuilder localStringBuilder = new StringBuilder(128);
        localStringBuilder.append("setDiscussionMsgState discussionUin: ").append(paramString).append(" state: ").append(paramInt);
        QLog.d(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString());
      }
      if (paramInt == 2) {
        h(paramString);
      }
    }
  }
  
  public void b(String paramString, int paramInt, long paramLong)
  {
    K.put(new Pair(paramString, Integer.valueOf(paramInt)), Long.valueOf(paramLong));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getAIOLastSeq" + paramString + "_" + paramInt, paramLong);
    }
  }
  
  public void b(String paramString, long paramLong)
  {
    paramLong = Math.max(paramLong, b(paramString));
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addGroupExpiredSeq " + paramLong);
    }
    j.put(paramString, Long.valueOf(paramLong));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getTroopExpiredSeq" + paramString, paramLong);
    }
  }
  
  public void b(String paramString, long paramLong1, long paramLong2)
  {
    paramString = MD5.toMD5(paramString);
    o.put(paramString, new Pair(Long.valueOf(paramLong1), Long.valueOf(paramLong2)));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getC2CLastMessageTime" + paramString, paramLong1);
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getC2CLastMessageTimeRand" + paramString, paramLong2);
    }
  }
  
  public void b(String paramString, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addPCQQSearchMsgKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:" + HexUtil.a(paramArrayOfByte));
    }
    byte[] arrayOfByte = (byte[])u.get(paramString);
    if ((arrayOfByte == null) || (!Arrays.equals(arrayOfByte, paramArrayOfByte)))
    {
      u.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        paramArrayOfByte = HexUtil.a(paramArrayOfByte);
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putString(paramString, paramArrayOfByte);
      }
    }
  }
  
  public void b(String paramString, Object[] paramArrayOfObject)
  {
    if (paramString != null)
    {
      g.put(paramString, paramArrayOfObject);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getDiscussionMemberSeq" + paramString, ((Long)paramArrayOfObject[0]).longValue());
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getDiscussionConfigSeq" + paramString, ((Long)paramArrayOfObject[1]).longValue());
      }
    }
  }
  
  public void b(List paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      paramList = paramList.iterator();
      while (paramList.hasNext()) {
        a((MessageRecord)paramList.next());
      }
    }
  }
  
  public void b(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public void b(byte[] paramArrayOfByte)
  {
    jdField_b_of_type_ArrayOfByte = paramArrayOfByte;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      paramArrayOfByte = HexUtil.a(paramArrayOfByte);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>setLastPubAccountCookie lastPACookie:" + paramArrayOfByte);
      }
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putString("getMsgV4_vPubAccountCookie", paramArrayOfByte);
    }
  }
  
  public boolean b()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "isDiscPullSeqFinish size = " + l.size());
    }
    return l.isEmpty();
  }
  
  public boolean b(MessageRecord paramMessageRecord)
  {
    if (paramMessageRecord == null) {}
    Object localObject;
    do
    {
      do
      {
        return false;
        localObject = MsgProxyUtils.a(frienduin, istroop);
        if (paramMessageRecord.isLongMsg())
        {
          if ((M.containsKey(localObject)) && (((ConcurrentHashMap)M.get(localObject)).containsKey(Integer.valueOf(longMsgId)))) {}
          for (boolean bool = true;; bool = false) {
            return bool;
          }
        }
      } while (!p.containsKey(localObject));
      localObject = (ConcurrentHashMap)p.get(localObject);
    } while ((localObject == null) || (!((ConcurrentHashMap)localObject).containsKey(Long.valueOf(uniseq))));
    return true;
  }
  
  public byte[] b()
  {
    if ((jdField_b_of_type_ArrayOfByte == null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)) {
      jdField_b_of_type_ArrayOfByte = HexUtil.a(jdField_a_of_type_AndroidContentSharedPreferences.getString("getMsgV4_vPubAccountCookie", ""));
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>getLastPubAccountCookie lastPACookie:" + HexUtil.a(jdField_b_of_type_ArrayOfByte));
    }
    return jdField_b_of_type_ArrayOfByte;
  }
  
  public byte[] b(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getWpaMsgKey uin:null peerUin:" + paramString + " key:null");
      }
    }
    do
    {
      return null;
      if (t.containsKey(paramString)) {
        break label150;
      }
      localObject = jdField_a_of_type_AndroidContentSharedPreferences.getString(paramString, null);
      if (localObject != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "getWpaMsgKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:null");
    return null;
    Object localObject = HexUtil.a((String)localObject);
    t.put(paramString, localObject);
    label150:
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "getWpaMsgKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:" + HexUtil.a((byte[])t.get(paramString)));
    }
    return (byte[])t.get(paramString);
  }
  
  public Object[] b(String paramString)
  {
    if (jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString)) {
      return (Object[])jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getTroopMemberSeq" + paramString, -1L);
      long l2 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getTroopConfigSeq" + paramString, -1L);
      if (l1 != 0L) {
        return new Object[] { Long.valueOf(l1), Long.valueOf(l2) };
      }
    }
    return null;
  }
  
  public int c()
  {
    if (jdField_f_of_type_Int < 0) {
      if (!jdField_a_of_type_AndroidContentSharedPreferences.contains("msgsignal_switch")) {
        break label44;
      }
    }
    label44:
    for (jdField_f_of_type_Int = jdField_a_of_type_AndroidContentSharedPreferences.getInt("msgsignal_switch", 0);; jdField_f_of_type_Int = 0) {
      return jdField_f_of_type_Int;
    }
  }
  
  public long c()
  {
    return jdField_b_of_type_Long;
  }
  
  public long c(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return 0L;
    }
    if (!k.containsKey(paramString))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getDiscussionExpiredSeq" + paramString, 0L);
      k.put(paramString, Long.valueOf(l1));
    }
    return ((Long)k.get(paramString)).longValue();
  }
  
  public long c(String paramString, int paramInt)
  {
    Pair localPair = new Pair(paramString, Integer.valueOf(paramInt));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return 0L;
    }
    if (!K.containsKey(localPair))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getAIOLastSeq" + paramString + "_" + paramInt, 0L);
      K.put(localPair, Long.valueOf(l1));
    }
    return ((Long)K.get(localPair)).longValue();
  }
  
  public ConcurrentHashMap c()
  {
    return U;
  }
  
  public void c()
  {
    O.clear();
  }
  
  public void c(long paramLong)
  {
    if (jdField_a_of_type_Long < paramLong)
    {
      jdField_a_of_type_Long = paramLong;
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "--->>setTroopAndDiscMsgLastTime lastTime: " + paramLong);
        }
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getTroopDiscMsgLastTime", jdField_a_of_type_Long);
      }
    }
  }
  
  public void c(MessageRecord paramMessageRecord)
  {
    paramMessageRecord = frienduin + "_" + msgUid + "_" + shmsgseq;
    jdField_a_of_type_JavaUtilSet.add(paramMessageRecord);
  }
  
  public void c(String paramString)
  {
    if (paramString != null) {
      l.put(paramString, Boolean.valueOf(true));
    }
  }
  
  public void c(String paramString, int paramInt, long paramLong)
  {
    J.put(new Pair(paramString, Integer.valueOf(paramInt)), Long.valueOf(paramLong));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getBreakPointSeq" + paramString + "_" + paramInt, paramLong);
    }
  }
  
  public void c(String paramString, long paramLong)
  {
    paramLong = Math.max(paramLong, c(paramString));
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addDiscExpiredSeq " + paramLong);
    }
    k.put(paramString, Long.valueOf(paramLong));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getDiscussionExpiredSeq" + paramString, paramLong);
    }
  }
  
  public void c(String paramString, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addBusinessCrmMsgKey----> sig:" + HexUtil.a(paramArrayOfByte) + ",length:" + paramArrayOfByte.length);
    }
    byte[] arrayOfByte = (byte[])v.get(paramString);
    if ((arrayOfByte == null) || (!Arrays.equals(arrayOfByte, paramArrayOfByte)))
    {
      v.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        paramArrayOfByte = HexUtil.a(paramArrayOfByte);
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putString(paramString, paramArrayOfByte);
      }
    }
  }
  
  public void c(String paramString, Object[] paramArrayOfObject)
  {
    if (paramString != null)
    {
      jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, paramArrayOfObject);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getTroopMemberSeq" + paramString, ((Long)paramArrayOfObject[0]).longValue());
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getTroopConfigSeq" + paramString, ((Long)paramArrayOfObject[1]).longValue());
      }
    }
  }
  
  public boolean c()
  {
    return h.isEmpty();
  }
  
  public boolean c(MessageRecord paramMessageRecord)
  {
    if ((paramMessageRecord.isLongMsg()) && ((paramMessageRecord instanceof MessageForLongMsg))) {
      paramMessageRecord = longMsgFragmentList.iterator();
    }
    while (paramMessageRecord.hasNext()) {
      if (nextextraflag != 0)
      {
        return true;
        if (extraflag != 0) {
          return true;
        }
      }
    }
    return false;
  }
  
  public byte[] c(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "pcQQSearchKey uin:null peerUin:" + paramString + " key:null");
      }
    }
    do
    {
      return null;
      if (u.containsKey(paramString)) {
        break label150;
      }
      localObject = jdField_a_of_type_AndroidContentSharedPreferences.getString(paramString, null);
      if (localObject != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "pcQQSearchKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:null");
    return null;
    Object localObject = HexUtil.a((String)localObject);
    u.put(paramString, localObject);
    label150:
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "pcQQSearchKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:" + HexUtil.a((byte[])u.get(paramString)));
    }
    return (byte[])u.get(paramString);
  }
  
  public long d(String paramString)
  {
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (str == null) {
      return 0L;
    }
    if (!I.containsKey(paramString))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong(paramString + str, 0L);
      I.put(paramString, Long.valueOf(l1));
    }
    return ((Long)I.get(paramString)).longValue();
  }
  
  public ConcurrentHashMap d()
  {
    return V;
  }
  
  public void d()
  {
    if (!p.isEmpty())
    {
      JSONArray localJSONArray = new JSONArray();
      Iterator localIterator = p.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (Map.Entry)localIterator.next();
        if ((((Map.Entry)localObject).getValue() != null) && (!((ConcurrentHashMap)((Map.Entry)localObject).getValue()).isEmpty()))
        {
          localObject = ((ConcurrentHashMap)((Map.Entry)localObject).getValue()).entrySet().iterator();
          while (((Iterator)localObject).hasNext())
          {
            Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
            JSONObject localJSONObject = new JSONObject();
            try
            {
              localJSONObject.put("uin", getValuejdField_a_of_type_JavaLangString);
              localJSONObject.put("type", getValuejdField_a_of_type_Int);
              localJSONObject.put("uniseq", getValuejdField_a_of_type_Long);
              localJSONArray.put(localJSONObject);
            }
            catch (JSONException localJSONException)
            {
              localJSONException.printStackTrace();
            }
          }
        }
      }
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putString("msgSending", localJSONArray.toString());
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "msgSending:write msgSending file before exit," + localJSONArray.toString());
        }
      }
    }
    e();
    jdField_d_of_type_Int = -1;
    jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    R.clear();
    m.clear();
    V.clear();
    W.clear();
    X.clear();
    o.clear();
    jdField_b_of_type_Long = 0L;
    Y.clear();
    Z.clear();
    jdField_c_of_type_JavaUtilArrayList.clear();
    p.clear();
    q.clear();
    jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    g.clear();
    i.clear();
    h.clear();
    H.clear();
    if (jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCacheItem != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCacheItem.a();
    }
  }
  
  public void d(long paramLong)
  {
    jdField_b_of_type_Long = paramLong;
  }
  
  public void d(MessageRecord paramMessageRecord)
  {
    String str = MsgProxyUtils.a(frienduin, istroop);
    Object localObject1 = new MessageCache.MsgSendingInfo(this, frienduin, istroop, uniseq);
    if (p.containsKey(str))
    {
      localObject2 = (ConcurrentHashMap)p.get(str);
      if (localObject2 != null) {
        ((ConcurrentHashMap)localObject2).put(Long.valueOf(uniseq), localObject1);
      }
    }
    for (;;)
    {
      if (paramMessageRecord.isLongMsg())
      {
        if (!M.containsKey(str)) {
          break label272;
        }
        if (!((ConcurrentHashMap)M.get(str)).containsKey(Integer.valueOf(longMsgId))) {
          break;
        }
        ((HashSet)((ConcurrentHashMap)M.get(str)).get(Integer.valueOf(longMsgId))).add(Long.valueOf(uniseq));
      }
      return;
      localObject2 = new ConcurrentHashMap();
      ((ConcurrentHashMap)localObject2).put(Long.valueOf(uniseq), localObject1);
      p.put(str, localObject2);
      continue;
      localObject2 = new ConcurrentHashMap();
      ((ConcurrentHashMap)localObject2).put(Long.valueOf(uniseq), localObject1);
      p.put(str, localObject2);
    }
    localObject1 = new HashSet();
    ((HashSet)localObject1).add(Long.valueOf(uniseq));
    ((ConcurrentHashMap)M.get(str)).put(Integer.valueOf(longMsgId), localObject1);
    return;
    label272:
    localObject1 = new ConcurrentHashMap();
    Object localObject2 = new HashSet();
    ((HashSet)localObject2).add(Long.valueOf(uniseq));
    ((ConcurrentHashMap)localObject1).put(Integer.valueOf(longMsgId), localObject2);
    M.put(str, localObject1);
  }
  
  public void d(String paramString)
  {
    V.remove(paramString);
  }
  
  public void d(String paramString, int paramInt, long paramLong)
  {
    int i2 = 0;
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, String.format("removeSendingCache key = %d %s %d", new Object[] { Long.valueOf(paramLong), paramString, Integer.valueOf(paramInt) }));
    }
    paramString = MsgProxyUtils.a(paramString, paramInt);
    Object localObject;
    if (p.containsKey(paramString))
    {
      localObject = (ConcurrentHashMap)p.get(paramString);
      if (localObject != null) {
        ((ConcurrentHashMap)localObject).remove(Long.valueOf(paramLong));
      }
      if ((localObject != null) && (((ConcurrentHashMap)localObject).isEmpty())) {
        p.remove(paramString);
      }
    }
    if ((!e()) && (q.containsKey(paramString)))
    {
      localObject = (ConcurrentHashMap)q.get(paramString);
      if (localObject != null) {
        ((ConcurrentHashMap)localObject).remove(Long.valueOf(paramLong));
      }
      if ((localObject != null) && (((ConcurrentHashMap)localObject).isEmpty())) {
        q.remove(paramString);
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "msgSending:delete result in messageSendingTemp " + q);
      }
    }
    int i1;
    if (M.containsKey(paramString))
    {
      localObject = ((ConcurrentHashMap)M.get(paramString)).keySet().iterator();
      Set localSet;
      do
      {
        paramInt = i2;
        if (!((Iterator)localObject).hasNext()) {
          break;
        }
        i1 = ((Integer)((Iterator)localObject).next()).intValue();
        localSet = (Set)((ConcurrentHashMap)M.get(paramString)).get(Integer.valueOf(i1));
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, String.format("removeSendingCache  longMsgFragmentSet = %s", new Object[] { localSet }));
        }
      } while (!localSet.contains(Long.valueOf(paramLong)));
      localSet.remove(Long.valueOf(paramLong));
      if (!localSet.isEmpty()) {
        break label437;
      }
    }
    label437:
    for (paramInt = i1;; paramInt = 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "removeSendingCache uniseq=" + paramLong + "longid=" + i1);
      }
      for (;;)
      {
        if (paramInt != 0) {
          ((ConcurrentHashMap)M.get(paramString)).remove(Integer.valueOf(paramInt));
        }
        return;
      }
    }
  }
  
  public void d(String paramString, long paramLong)
  {
    I.put(paramString, Long.valueOf(paramLong));
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (str != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong(paramString + str, paramLong).commit();
    }
  }
  
  public void d(String paramString, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addBusinessCrmSigt uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:" + HexUtil.a(paramArrayOfByte));
    }
    byte[] arrayOfByte = (byte[])w.get(paramString);
    if ((arrayOfByte == null) || (!Arrays.equals(arrayOfByte, paramArrayOfByte))) {
      w.put(paramString, paramArrayOfByte);
    }
  }
  
  public void d(String paramString, Object[] paramArrayOfObject)
  {
    ArrayList localArrayList2 = (ArrayList)V.get(paramString);
    ArrayList localArrayList1;
    if (localArrayList2 != null)
    {
      localArrayList1 = localArrayList2;
      if (localArrayList2.size() != 0) {}
    }
    else
    {
      localArrayList1 = new ArrayList();
    }
    localArrayList1.add(paramArrayOfObject);
    V.put(paramString, localArrayList1);
  }
  
  public boolean d()
  {
    return i.isEmpty();
  }
  
  public boolean d(MessageRecord paramMessageRecord)
  {
    if (jdField_a_of_type_ComTencentMobileqqDataMessageRecord == null) {}
    boolean bool;
    label44:
    MessageRecord localMessageRecord;
    do
    {
      return false;
      if ((!paramMessageRecord.isLongMsg()) || (!(jdField_a_of_type_ComTencentMobileqqDataMessageRecord instanceof MessageForLongMsg))) {
        break label119;
      }
      Iterator localIterator = jdField_a_of_type_ComTencentMobileqqDataMessageRecord).longMsgFragmentList.iterator();
      bool = false;
      if (!localIterator.hasNext()) {
        break;
      }
      localMessageRecord = (MessageRecord)localIterator.next();
    } while (extraflag != 0);
    if ((frienduin.equals(frienduin)) && (istroop == istroop) && (uniseq == uniseq)) {
      bool = true;
    }
    for (;;)
    {
      break label44;
      return bool;
      label119:
      if ((jdField_a_of_type_ComTencentMobileqqDataMessageRecord != paramMessageRecord) || (jdField_a_of_type_ComTencentMobileqqDataMessageRecord.extraflag != 0)) {
        break;
      }
      return true;
    }
  }
  
  public byte[] d(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getBusinessCrmKey uin:null peerUin:" + paramString + " key:null");
      }
    }
    do
    {
      return null;
      if (v.containsKey(paramString)) {
        break label150;
      }
      localObject = jdField_a_of_type_AndroidContentSharedPreferences.getString(paramString, null);
      if (localObject != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "businessCrmKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:null");
    return null;
    Object localObject = HexUtil.a((String)localObject);
    v.put(paramString, localObject);
    label150:
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "businessCrmKey uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:" + HexUtil.a((byte[])v.get(paramString)));
    }
    return (byte[])v.get(paramString);
  }
  
  public long e(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return 0L;
    }
    if (!H.containsKey(paramString))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getFriendFeedLastTime" + paramString, -1L);
      H.put(paramString, Long.valueOf(l1));
    }
    return ((Long)H.get(paramString)).longValue();
  }
  
  public ConcurrentHashMap e()
  {
    return q;
  }
  
  public void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "msgCache commit.");
      }
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.commit();
    }
  }
  
  public void e(MessageRecord paramMessageRecord)
  {
    jdField_a_of_type_ComTencentMobileqqDataMessageRecord = paramMessageRecord;
  }
  
  public void e(String paramString)
  {
    h.put(paramString, Boolean.valueOf(true));
  }
  
  public void e(String paramString, int paramInt, long paramLong)
  {
    String str = MsgProxyUtils.a(paramString, paramInt);
    paramString = new MessageCache.MsgSendingInfo(this, paramString, paramInt, paramLong);
    ConcurrentHashMap localConcurrentHashMap;
    if (q.containsKey(str))
    {
      localConcurrentHashMap = (ConcurrentHashMap)q.get(str);
      if (localConcurrentHashMap != null) {
        localConcurrentHashMap.put(Long.valueOf(paramLong), paramString);
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "msgSending:addSendingCacheTemp,msgSendingTemp:" + q + " msgCache:" + hashCode());
      }
      return;
      localConcurrentHashMap = new ConcurrentHashMap();
      localConcurrentHashMap.put(Long.valueOf(paramLong), paramString);
      q.put(str, localConcurrentHashMap);
      continue;
      localConcurrentHashMap = new ConcurrentHashMap();
      localConcurrentHashMap.put(Long.valueOf(paramLong), paramString);
      q.put(str, localConcurrentHashMap);
    }
  }
  
  public void e(String paramString, long paramLong)
  {
    H.put(paramString, Long.valueOf(paramLong));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getFriendFeedLastTime" + paramString, paramLong);
    }
  }
  
  public void e(String paramString, byte[] paramArrayOfByte) {}
  
  public boolean e()
  {
    return (q == null) || (q.isEmpty());
  }
  
  public boolean e(MessageRecord paramMessageRecord)
  {
    if (r.isEmpty()) {
      return false;
    }
    if (paramMessageRecord.isLongMsg()) {}
    for (String str = String.format("%s&%d&%d&%d", new Object[] { frienduin, Integer.valueOf(istroop), Integer.valueOf(longMsgId), Integer.valueOf(longMsgCount) }); r.containsKey(str); str = String.format("%s&%d&%d", new Object[] { frienduin, Integer.valueOf(istroop), Long.valueOf(shmsgseq) }))
    {
      if (QLog.isColorLevel()) {
        QLog.d("revokeMsg", 2, "RevokeNotifyCache, msgFilter true, " + paramMessageRecord.toString());
      }
      return true;
    }
    return false;
  }
  
  public byte[] e(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "businessCrmSigt uin:null peerUin:" + paramString + " key:null");
      }
    }
    while (!w.containsKey(paramString)) {
      return null;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "businessCrmSigt uin:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "peerUin:" + paramString + " key:" + HexUtil.a((byte[])w.get(paramString)));
    }
    return (byte[])w.get(paramString);
  }
  
  public long f(String paramString)
  {
    paramString = (Long)O.get(paramString);
    if (paramString == null) {
      return 0L;
    }
    return paramString.longValue();
  }
  
  public ConcurrentHashMap f()
  {
    return r;
  }
  
  public void f()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "dumpGroupMsgJob size = " + h.size());
    }
  }
  
  public void f(MessageRecord paramMessageRecord)
  {
    jdField_b_of_type_ComTencentMobileqqDataMessageRecord = paramMessageRecord;
  }
  
  public void f(String paramString)
  {
    if (h.containsKey(paramString)) {
      h.remove(paramString);
    }
  }
  
  public void f(String paramString, long paramLong)
  {
    O.put(paramString, Long.valueOf(paramLong));
  }
  
  public void f(String paramString, byte[] paramArrayOfByte)
  {
    Object localObject = (byte[])y.get(paramString);
    if ((localObject == null) || (!localObject.equals(paramArrayOfByte)))
    {
      y.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "pub", 0);
        paramArrayOfByte = PkgTools.b(paramArrayOfByte);
        localObject = ((SharedPreferences)localObject).edit();
        ((SharedPreferences.Editor)localObject).putString(paramString, paramArrayOfByte);
        ((SharedPreferences.Editor)localObject).commit();
      }
    }
  }
  
  public boolean f()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public byte[] f(String paramString)
  {
    return null;
  }
  
  public long g(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {
      return 0L;
    }
    if (!m.containsKey(paramString))
    {
      long l1 = jdField_a_of_type_AndroidContentSharedPreferences.getLong("getDiscussionLastMessageTime" + paramString, 0L);
      m.put(paramString, Long.valueOf(l1));
    }
    return ((Long)m.get(paramString)).longValue();
  }
  
  public void g()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "dumpDiscMsgJob size = " + i.size());
    }
  }
  
  public void g(String paramString)
  {
    i.put(paramString, Boolean.valueOf(true));
  }
  
  public void g(String paramString, long paramLong)
  {
    paramLong = Math.max(paramLong, g(paramString));
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addDiscussionMsgLastSeq " + paramLong);
    }
    m.put(paramString, Long.valueOf(paramLong));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.putLong("getDiscussionLastMessageTime" + paramString, paramLong);
    }
  }
  
  public void g(String paramString, byte[] paramArrayOfByte)
  {
    Object localObject = (byte[])z.get(paramString);
    if ((localObject == null) || (!Arrays.equals((byte[])localObject, paramArrayOfByte)))
    {
      z.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "same_state", 0);
        paramArrayOfByte = PkgTools.b(paramArrayOfByte);
        localObject = ((SharedPreferences)localObject).edit();
        ((SharedPreferences.Editor)localObject).putString(paramString, paramArrayOfByte);
        ((SharedPreferences.Editor)localObject).commit();
      }
    }
  }
  
  public byte[] g(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {}
    do
    {
      return null;
      if (D.containsKey(paramString)) {
        break;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "circle_group", 0).getString(paramString, null);
    } while (localObject == null);
    Object localObject = PkgTools.a((String)localObject);
    D.put(paramString, localObject);
    return (byte[])D.get(paramString);
  }
  
  public long h(String paramString)
  {
    long l1 = g(paramString);
    long l2 = c(paramString);
    long l3 = a(paramString, 3000);
    return Math.max(Math.max(l1, l2), l3);
  }
  
  public void h()
  {
    jdField_a_of_type_JavaUtilSet.clear();
  }
  
  public void h(String paramString)
  {
    if (i.containsKey(paramString)) {
      i.remove(paramString);
    }
  }
  
  public void h(String paramString, byte[] paramArrayOfByte)
  {
    if (TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      return;
      try
      {
        Object localObject = (byte[])A.get(paramString);
        if (((localObject != null) && (Arrays.equals((byte[])localObject, paramArrayOfByte))) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
          continue;
        }
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "accost", 0).edit();
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0))
        {
          A.remove(paramString);
          ((SharedPreferences.Editor)localObject).remove(paramString);
        }
        for (;;)
        {
          ((SharedPreferences.Editor)localObject).commit();
          return;
          A.put(paramString, paramArrayOfByte);
          ((SharedPreferences.Editor)localObject).putString(paramString, PkgTools.b(paramArrayOfByte));
        }
        return;
      }
      catch (Exception paramString) {}
    }
  }
  
  public byte[] h(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {}
    do
    {
      return null;
      if (E.containsKey(paramString)) {
        break;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "circle_group_av", 0).getString(paramString, null);
    } while (localObject == null);
    Object localObject = PkgTools.a((String)localObject);
    E.put(paramString, localObject);
    return (byte[])E.get(paramString);
  }
  
  public long i(String paramString)
  {
    long l1 = a(paramString, 1);
    long l2 = a(paramString);
    long l3 = b(paramString);
    return Math.max(Math.max(l2, l1), l3);
  }
  
  public void i(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "removeHotChatSeq groupUin:" + paramString);
    }
    jdField_e_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, Long.valueOf(0L));
    jdField_f_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, new Object[] { Long.valueOf(0L), Long.valueOf(0L) });
    j.put(paramString, Long.valueOf(0L));
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
    {
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.remove("getTroopLastMessageTime" + paramString);
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.remove("getTroopMemberSeq" + paramString);
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.remove("getTroopConfigSeq" + paramString);
      jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache$AsyncEditor.remove("getTroopExpiredSeq" + paramString);
    }
    HotChatInfo localHotChatInfo = ((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).a(paramString);
    if ((localHotChatInfo != null) && (localHotChatInfo.isPttShowRoom())) {}
    for (int i1 = 1;; i1 = 0)
    {
      if (i1 != 0) {
        a().b(paramString);
      }
      return;
    }
  }
  
  public void i(String paramString, byte[] paramArrayOfByte)
  {
    if (TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      return;
      try
      {
        Object localObject = (byte[])P.get(paramString);
        if (((localObject != null) && (Arrays.equals((byte[])localObject, paramArrayOfByte))) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
          continue;
        }
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "approval_assistant", 0).edit();
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0))
        {
          P.remove(paramString);
          ((SharedPreferences.Editor)localObject).remove(paramString);
        }
        for (;;)
        {
          ((SharedPreferences.Editor)localObject).commit();
          return;
          P.put(paramString, paramArrayOfByte);
          ((SharedPreferences.Editor)localObject).putString(paramString, PkgTools.b(paramArrayOfByte));
        }
        return;
      }
      catch (Exception paramString) {}
    }
  }
  
  public byte[] i(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {}
    do
    {
      return null;
      if (F.containsKey(paramString)) {
        break;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "friend_validation", 0).getString(paramString, null);
    } while (localObject == null);
    Object localObject = PkgTools.a((String)localObject);
    F.put(paramString, localObject);
    return (byte[])F.get(paramString);
  }
  
  public void j(String paramString, byte[] paramArrayOfByte)
  {
    if (TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      return;
      try
      {
        Object localObject = (byte[])B.get(paramString);
        if (((localObject != null) && (Arrays.equals((byte[])localObject, paramArrayOfByte))) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
          continue;
        }
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "nearby_assistant", 0).edit();
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0))
        {
          B.remove(paramString);
          ((SharedPreferences.Editor)localObject).remove(paramString);
        }
        for (;;)
        {
          ((SharedPreferences.Editor)localObject).commit();
          return;
          B.put(paramString, paramArrayOfByte);
          ((SharedPreferences.Editor)localObject).putString(paramString, PkgTools.b(paramArrayOfByte));
        }
        return;
      }
      catch (Exception paramString) {}
    }
  }
  
  public byte[] j(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null) {}
    do
    {
      return null;
      if (z.containsKey(paramString)) {
        break;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "same_state", 0).getString(paramString, null);
    } while (localObject == null);
    Object localObject = PkgTools.a((String)localObject);
    z.put(paramString, localObject);
    return (byte[])z.get(paramString);
  }
  
  public void k(String paramString, byte[] paramArrayOfByte)
  {
    if (TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      return;
      try
      {
        Object localObject = (byte[])C.get(paramString);
        if (((localObject != null) && (Arrays.equals((byte[])localObject, paramArrayOfByte))) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
          continue;
        }
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "dating", 0).edit();
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0))
        {
          C.remove(paramString);
          ((SharedPreferences.Editor)localObject).remove(paramString);
        }
        for (;;)
        {
          ((SharedPreferences.Editor)localObject).commit();
          return;
          C.put(paramString, paramArrayOfByte);
          ((SharedPreferences.Editor)localObject).putString(paramString, PkgTools.b(paramArrayOfByte));
        }
        return;
      }
      catch (Exception paramString) {}
    }
  }
  
  public byte[] k(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
      return null;
    }
    if (!A.containsKey(paramString))
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "accost", 0).getString(paramString, null);
      if (!TextUtils.isEmpty((CharSequence)localObject))
      {
        localObject = PkgTools.a((String)localObject);
        if ((localObject != null) && (localObject.length > 0))
        {
          A.put(paramString, localObject);
          return localObject;
        }
      }
    }
    else
    {
      return (byte[])A.get(paramString);
    }
    return null;
  }
  
  public void l(String paramString, byte[] paramArrayOfByte)
  {
    Object localObject = (byte[])D.get(paramString);
    if ((localObject == null) || (!Arrays.equals((byte[])localObject, paramArrayOfByte)))
    {
      D.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "circle_group", 0);
        paramArrayOfByte = PkgTools.b(paramArrayOfByte);
        localObject = ((SharedPreferences)localObject).edit();
        ((SharedPreferences.Editor)localObject).putString(paramString, paramArrayOfByte);
        ((SharedPreferences.Editor)localObject).commit();
      }
    }
  }
  
  public byte[] l(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
      return null;
    }
    if (!P.containsKey(paramString))
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "approval_assistant", 0).getString(paramString, null);
      if (!TextUtils.isEmpty((CharSequence)localObject))
      {
        localObject = PkgTools.a((String)localObject);
        if ((localObject != null) && (localObject.length > 0))
        {
          P.put(paramString, localObject);
          return localObject;
        }
      }
    }
    else
    {
      return (byte[])P.get(paramString);
    }
    return null;
  }
  
  public void m(String paramString, byte[] paramArrayOfByte)
  {
    Object localObject = (byte[])E.get(paramString);
    if ((localObject == null) || (!Arrays.equals((byte[])localObject, paramArrayOfByte)))
    {
      E.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "circle_group_av", 0);
        paramArrayOfByte = PkgTools.b(paramArrayOfByte);
        localObject = ((SharedPreferences)localObject).edit();
        ((SharedPreferences.Editor)localObject).putString(paramString, paramArrayOfByte);
        ((SharedPreferences.Editor)localObject).commit();
      }
    }
  }
  
  public byte[] m(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
      return null;
    }
    if (!B.containsKey(paramString))
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "nearby_assistant", 0).getString(paramString, null);
      if (!TextUtils.isEmpty((CharSequence)localObject))
      {
        localObject = PkgTools.a((String)localObject);
        if ((localObject != null) && (localObject.length > 0))
        {
          B.put(paramString, localObject);
          return localObject;
        }
      }
    }
    else
    {
      return (byte[])B.get(paramString);
    }
    return null;
  }
  
  public void n(String paramString, byte[] paramArrayOfByte)
  {
    Object localObject = (byte[])F.get(paramString);
    if ((localObject == null) || (!Arrays.equals((byte[])localObject, paramArrayOfByte)))
    {
      F.put(paramString, paramArrayOfByte);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "friend_validation", 0);
        paramArrayOfByte = PkgTools.b(paramArrayOfByte);
        localObject = ((SharedPreferences)localObject).edit();
        ((SharedPreferences.Editor)localObject).putString(paramString, paramArrayOfByte);
        ((SharedPreferences.Editor)localObject).commit();
      }
    }
  }
  
  public byte[] n(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)) {
      return null;
    }
    if (!C.containsKey(paramString))
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "dating", 0).getString(paramString, null);
      if (!TextUtils.isEmpty((CharSequence)localObject))
      {
        localObject = PkgTools.a((String)localObject);
        if ((localObject != null) && (localObject.length > 0))
        {
          C.put(paramString, localObject);
          return localObject;
        }
      }
    }
    else
    {
      return (byte[])C.get(paramString);
    }
    return null;
  }
}
