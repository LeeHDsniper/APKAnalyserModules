package com.tencent.mobileqq.app.message;

import android.text.TextUtils;
import android.util.Pair;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.DynamicMsgInfoManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.data.MessageForFunnyFace;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForMixedMsg;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageForTroopFile;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.StructMsgFactory;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import cooperation.qlink.QlinkHelper;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import njz;
import nka;

public class MsgProxyUtils
{
  public static final int a = 40;
  public static final String a = "select name from sqlite_master where type=\"table\" and (name like \"mr_friend%\" or name like \"mr_troop%\" or name like \"mr_discusssion%\" or name like \"mr_contact%\" or name like \"mr_devicemsg%\")";
  static Comparator jdField_a_of_type_JavaUtilComparator = new njz();
  private static ConcurrentHashMap jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap;
  public static final int[] a;
  public static final String[] a;
  public static final int b = 40;
  public static final String b = "one_way";
  public static final int[] b;
  public static final String[] b;
  public static final int c = 15;
  private static final String c = "Q.msg.MsgProxyUtils";
  public static final int[] c;
  public static final int d = 15;
  private static final String d = "mr_friend";
  public static final int[] d;
  public static final int e = 10;
  private static final String e = "mr_troop";
  public static final int[] e;
  private static final int jdField_f_of_type_Int = 480;
  private static final String jdField_f_of_type_JavaLangString = "mr_discusssion";
  public static final int[] f;
  private static final String g = "mr_contact";
  public static final int[] g;
  private static final String h = "mr_devicemsg";
  public static final int[] h;
  public static final int[] i;
  public static final int[] j;
  public static final int[] k;
  public static final int[] l;
  public static final int[] m;
  public static final int[] n;
  public static final int[] o;
  public static final int[] p;
  public static final int[] q;
  public static final int[] r;
  public static final int[] s;
  public static final int[] t;
  public static final int[] u;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_a_of_type_ArrayOfInt = new int[] { 64532, 64524, 64535, 64534, 63524, 63530, 61535, 193, 734, 230, 61534, 61533, 61532, 63521, 64522, 61528, 61527, 63515, 63518, 64496, 64497, 61531, 62527, 61516, 62526, 62525, 63517, 64495, 64493, 64492, 64491, 60536, 60530, 64519, 1018, 64494, 2024, 64510, 64509, 64508, 60531, 64490, 63509, 63499, 62523, 63508, 60529, 63506 };
    jdField_b_of_type_ArrayOfInt = new int[] { 63505, 63501, 63500, 63498, 63494, 63493 };
    c = new int[] { 62530, 63501, 63500, 63498 };
    d = new int[] { 61532, 61533, 61527, 61516, 62526, 62525, 64492, 64510, 64509, 63508, 60531 };
    e = new int[] { 64502, 64494, 63521, 63533, 63532, 63527, 64535, 63524, 64523, 63506, 64517, 64518, 64522, 64493, 64491, 60536, 60535, 64512, 64508, 2024, 63494, 60531, 64490, 63509, 63499, 60530, 61525, 63507, 63502, 63503, 63495 };
    f = new int[] { 64532, 64524, 61534, 61533, 61532, 64489, 64523, 63506, 61527, 64520, 64519, 64486, 63515, 64495, 64493, 64492, 64491, 60536, 60535, 1018, 63520, 2024, 63494, 60531, 60530, 64490, 62523, 63508, 63507, 63502, 63503, 63493, 63495 };
    g = new int[] { 61533, 61516, 61532, 61527 };
    h = new int[] { 63530, 64502, 64494, 63521, 61534, 61533, 61532, 64535, 64489, 64523, 63506, 64517, 64518, 63524, 64522, 64532, 64520, 64519, 64486, 63515, 62525, 61516, 62527, 62526, 64495, 64493, 64492, 64491, 60536, 60535, 64512, 64508, 1018, 2024, 63494, 64524, 64490, 63509, 63508, 63507, 63493 };
    i = new int[0];
    j = new int[0];
    k = new int[] { 1008 };
    l = new int[] { 64536, 63536, 63534, 63531, 64501, 64500, 64499, 45536, 63529, 63525, 60527, 63526 };
    m = new int[] { 63536, 63534, 63529, 63525, 60527, 63516, 63514 };
    n = new int[] { 64535, 63527, 63520, 61528 };
    o = new int[] { 64489 };
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { AppConstants.aq, AppConstants.af, AppConstants.aG, AppConstants.aN, AppConstants.aO, AppConstants.am, AppConstants.ap };
    p = new int[] { 0, 1000, 1004, 1020, 1006, 1001, 1009, 1003, 1005, 1008, 1023, 1021, 1022, 1024, 1025, 1010, 7100, 7400 };
    q = new int[] { 1000, 1004, 1020 };
    r = new int[] { 1, 3000, 1006, 7000, 9501 };
    jdField_b_of_type_ArrayOfJavaLangString = new String[] { AppConstants.aq, AppConstants.aG };
    s = new int[] { 1001, 1010 };
    t = new int[] { 0, 1, 3000 };
    u = new int[0];
  }
  
  public MsgProxyUtils() {}
  
  public static int a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return paramInt;
    case 1001: 
    case 7100: 
      return 1001;
    case 1010: 
      return 1010;
    }
    return 1009;
  }
  
  public static int a(String paramString)
  {
    if (paramString.startsWith("mr_discusssion")) {
      return 3000;
    }
    if (paramString.startsWith("mr_friend")) {
      return 0;
    }
    return 1;
  }
  
  public static int a(List paramList, QQAppInterface paramQQAppInterface)
  {
    int i2;
    if ((paramList == null) || (paramList.isEmpty())) {
      i2 = 0;
    }
    HashSet localHashSet;
    int i1;
    do
    {
      return i2;
      localHashSet = new HashSet();
      paramList = paramList.iterator();
      i1 = 0;
      i2 = i1;
    } while (!paramList.hasNext());
    MessageRecord localMessageRecord = (MessageRecord)paramList.next();
    if ((!isread) && (!localMessageRecord.isLongMsg())) {
      i1 += 1;
    }
    for (;;)
    {
      break;
      i2 = i1;
      if (!isread)
      {
        i2 = i1;
        if (localMessageRecord.isLongMsg())
        {
          if (paramQQAppInterface.a().a(localMessageRecord)) {
            break;
          }
          i2 = i1;
          if (!localHashSet.contains(a(localMessageRecord)))
          {
            i2 = i1 + 1;
            localHashSet.add(a(localMessageRecord));
          }
        }
      }
      i1 = i2;
    }
  }
  
  public static MessageRecord a(List paramList)
  {
    Object localObject;
    if ((paramList == null) || (paramList.isEmpty()))
    {
      localObject = null;
      return localObject;
    }
    int i1 = paramList.size() - 1;
    for (;;)
    {
      if (i1 < 0) {
        break label60;
      }
      MessageRecord localMessageRecord = (MessageRecord)paramList.get(i1);
      localObject = localMessageRecord;
      if (msgtype != 63530) {
        break;
      }
      i1 -= 1;
    }
    label60:
    return null;
  }
  
  public static String a()
  {
    StringBuilder localStringBuilder = new StringBuilder(jdField_a_of_type_ArrayOfInt.length * 8);
    localStringBuilder.append("not in (");
    int i1 = 0;
    if (i1 < jdField_a_of_type_ArrayOfInt.length)
    {
      localStringBuilder.append(jdField_a_of_type_ArrayOfInt[i1]);
      if (i1 == jdField_a_of_type_ArrayOfInt.length - 1) {
        localStringBuilder.append(")");
      }
      for (;;)
      {
        i1 += 1;
        break;
        localStringBuilder.append(",");
      }
    }
    return localStringBuilder.toString();
  }
  
  public static String a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return AppConstants.aq;
    case 1001: 
      return AppConstants.aq;
    case 1010: 
      return AppConstants.aG;
    }
    return AppConstants.af;
  }
  
  public static String a(MessageRecord paramMessageRecord)
  {
    return longMsgId + "&" + senderuin + "&" + longMsgCount;
  }
  
  public static String a(String paramString)
  {
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString)) {
      return (String)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    }
    String str = MD5.toMD5(paramString);
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.size() > 3000) {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    }
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, str);
    return str;
  }
  
  public static String a(String paramString, int paramInt)
  {
    String str = paramString;
    if (e(paramInt)) {
      str = paramString + "&" + paramInt;
    }
    return str;
  }
  
  public static List a(String paramString, int paramInt, List paramList, QQAppInterface paramQQAppInterface)
  {
    if ((paramList == null) || (paramList.size() == 0)) {
      return null;
    }
    if (paramInt != 1008) {
      return null;
    }
    Object localObject3 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    ArrayList localArrayList1 = new ArrayList();
    HashMap localHashMap1 = new HashMap();
    paramInt = paramList.size() - 1;
    Object localObject1;
    label146:
    Object localObject2;
    if (paramInt >= 0)
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.get(paramInt);
      String str;
      if (b(localMessageRecord))
      {
        localObject1 = (MessageForStructing)localMessageRecord;
        if (!mIsParsed) {
          ((MessageForStructing)localObject1).parse();
        }
        str = structingMsg.dynamicMsgMergeKey;
        if (!((ArrayList)localObject3).contains(str)) {
          break label240;
        }
        localArrayList1.add(localMessageRecord);
        if (localHashMap1.containsKey(str)) {
          break label261;
        }
        localObject2 = localMessageRecord.getExtInfoFromExtStr("pa_phone_msg_tip");
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = "";
        }
        localObject2 = new HashMap();
        ((HashMap)localObject2).put("mergeIndex", String.valueOf(structingMsg.dynamicMsgMergeIndex));
        ((HashMap)localObject2).put("tipString", localObject1);
        localHashMap1.put(str, localObject2);
      }
      for (;;)
      {
        paramInt -= 1;
        break;
        label240:
        ((ArrayList)localObject3).add(str);
        localArrayList2.add(localMessageRecord);
        break label146;
        label261:
        HashMap localHashMap2 = (HashMap)localHashMap1.get(str);
        int i1 = Integer.parseInt((String)localHashMap2.get("mergeIndex"));
        int i2 = structingMsg.dynamicMsgMergeIndex;
        if (i2 > i1)
        {
          localObject2 = localMessageRecord.getExtInfoFromExtStr("pa_phone_msg_tip");
          localObject1 = localObject2;
          if (localObject2 == null) {
            localObject1 = "";
          }
          localHashMap2.put("mergeIndex", String.valueOf(i2));
          localHashMap2.put("tipString", localObject1);
          localHashMap1.put(str, localHashMap2);
        }
      }
    }
    paramQQAppInterface = (DynamicMsgInfoManager)paramQQAppInterface.getManager(99);
    paramQQAppInterface.a(paramString, (List)localObject3);
    paramString = localArrayList2.iterator();
    while (paramString.hasNext())
    {
      localObject1 = (MessageRecord)paramString.next();
      localObject2 = structingMsg.dynamicMsgMergeKey;
      localObject3 = paramQQAppInterface.a((String)localObject2);
      if (localObject3 != null)
      {
        bDynicMsg = true;
        structingMsg = StructMsgFactory.a((byte[])localObject3);
      }
      localObject2 = (String)((HashMap)localHashMap1.get(localObject2)).get("tipString");
      if (!TextUtils.isEmpty((CharSequence)localObject2)) {
        ((MessageRecord)localObject1).saveExtInfoToExtStr("pa_phone_msg_tip", (String)localObject2);
      }
    }
    paramList.removeAll(localArrayList1);
    return paramList;
  }
  
  public static List a(List paramList)
  {
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.next();
      if ((!k(msgtype)) && (((istroop != 3000) && (istroop != 1)) || (shmsgseq > 0L))) {
        localArrayList.add(localMessageRecord);
      }
    }
    return localArrayList;
  }
  
  public static List a(List paramList1, List paramList2)
  {
    ArrayList localArrayList = new ArrayList();
    if ((paramList1 == null) || (paramList2 == null)) {
      return null;
    }
    paramList2 = paramList2.iterator();
    label191:
    for (;;)
    {
      MessageRecord localMessageRecord1;
      if (paramList2.hasNext())
      {
        localMessageRecord1 = (MessageRecord)paramList2.next();
        Iterator localIterator = paramList1.iterator();
        MessageRecord localMessageRecord2;
        do
        {
          if (!localIterator.hasNext()) {
            break;
          }
          localMessageRecord2 = (MessageRecord)localIterator.next();
        } while ((localMessageRecord1.getId() != localMessageRecord1.getId()) || (shmsgseq != shmsgseq) || (msgtype != msgtype) || (time != time) || (msgUid != msgUid) || (longMsgIndex != longMsgIndex) || (longMsgId != longMsgId));
      }
      for (int i1 = 1;; i1 = 0)
      {
        if (i1 != 0) {
          break label191;
        }
        localArrayList.add(localMessageRecord1);
        break;
        return localArrayList;
      }
    }
  }
  
  public static List a(List paramList, boolean paramBoolean)
  {
    return a(paramList, paramBoolean, 15);
  }
  
  public static List a(List paramList, boolean paramBoolean, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    if ((paramList == null) || (paramList.isEmpty())) {
      return localArrayList;
    }
    if (paramBoolean) {
      Collections.sort(paramList, new nka());
    }
    long l1 = getsize1shmsgseq;
    int i2 = paramList.size() - 1;
    int i1 = 0;
    int i3;
    while (i2 >= 0)
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.get(i2);
      if ((t(msgtype)) && (shmsgseq == 0L))
      {
        localArrayList.add(0, paramList.get(i2));
        i3 = i1;
        i2 -= 1;
        i1 = i3;
      }
      else if (l1 - shmsgseq <= 1L)
      {
        if ((l1 != shmsgseq) || (i2 >= paramList.size() - 1)) {
          break label224;
        }
      }
    }
    for (;;)
    {
      l1 = getshmsgseq;
      localArrayList.add(0, paramList.get(i2));
      i3 = i1;
      if (i1 < paramInt) {
        break;
      }
      return localArrayList;
      label224:
      i1 += 1;
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString, int paramInt)
  {
    if (paramInt != 1) {}
    for (;;)
    {
      return;
      Object localObject1 = new ArrayList();
      Object localObject2 = paramQQAppInterface.a().b(paramString, paramInt).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject2).next();
        if (r(msgtype)) {
          ((List)localObject1).add(localMessageRecord);
        }
      }
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (MessageRecord)((Iterator)localObject1).next();
        paramQQAppInterface.a().a(paramString, paramInt, 61527, uniseq);
      }
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString, int paramInt1, int paramInt2)
  {
    Iterator localIterator = paramQQAppInterface.a().b(paramString, paramInt1).iterator();
    while (localIterator.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
      if (paramInt2 == msgtype) {
        switch (paramInt2)
        {
        default: 
          paramQQAppInterface.a().a(paramString, paramInt1, paramInt2, uniseq);
          break;
        case -3010: 
          paramQQAppInterface.a().a(paramString, paramInt1, paramInt2, uniseq);
          break;
        case -4020: 
          paramQQAppInterface.a().a(paramString, paramInt1, paramInt2, uniseq);
          break;
        case -3011: 
          if (!QlinkHelper.a()) {
            paramQQAppInterface.a().a(paramString, paramInt1, paramInt2, uniseq);
          }
          break;
        }
      }
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString, long paramLong)
  {
    if (QLog.isColorLevel()) {}
    for (long l1 = System.currentTimeMillis();; l1 = 0L)
    {
      List localList = paramQQAppInterface.a(1).b(paramString, 1);
      if ((localList != null) && (localList.size() > 0))
      {
        int i1 = localList.size() - 1;
        if (i1 >= 0)
        {
          MessageRecord localMessageRecord = (MessageRecord)localList.get(i1);
          if (shmsgseq > paramLong)
          {
            if ((q(msgtype)) || (msgtype == 63530))
            {
              paramQQAppInterface.a().b(paramString, 1, uniseq);
              if (!QLog.isColorLevel()) {
                break label170;
              }
              QLog.d(".troop.del_abnormal_troop_local_msg", 2, "delAbnormalLocalTroopMsg: " + paramLong + ", " + localMessageRecord.getBaseInfoString());
            }
            for (;;)
            {
              i1 -= 1;
              break;
              label170:
              QLog.d(".troop.del_abnormal_troop_local_msg", 1, "delAbnormalLocalTroopMsg: " + paramLong + ", " + localMessageRecord.getUserLogString());
            }
          }
        }
      }
      if (QLog.isColorLevel()) {
        QLog.d(".troop.del_abnormal_troop_local_msg", 2, "---delAbnormalLocalTroopMsg---:" + paramString + "," + paramLong + "," + (System.currentTimeMillis() - l1));
      }
      return;
    }
  }
  
  public static void a(MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      extLong |= 0x1;
      paramMessageRecord.saveExtInfoToExtStr("one_way", "true");
      return;
    }
    paramMessageRecord.removeExtInfoToExtStr("one_way");
  }
  
  public static void a(String paramString, int paramInt, List paramList, QQAppInterface paramQQAppInterface)
  {
    if ((paramList == null) || (paramList.size() == 0)) {}
    for (;;)
    {
      return;
      Object localObject2 = new ArrayList();
      HashMap localHashMap = new HashMap();
      ArrayList localArrayList = new ArrayList();
      Object localObject1 = paramQQAppInterface.a();
      Object localObject3 = paramList.iterator();
      int i1 = 0;
      int i2 = 0;
      Object localObject4;
      label166:
      int i3;
      if (((Iterator)localObject3).hasNext())
      {
        localObject4 = (MessageRecord)((Iterator)localObject3).next();
        String str1;
        if (((MessageRecord)localObject4).isLongMsg())
        {
          str1 = a((MessageRecord)localObject4);
          if (localHashMap.containsKey(str1)) {
            if (Math.abs(getget0time - time) <= 480L)
            {
              ((ArrayList)localHashMap.get(str1)).add(localObject4);
              ((List)localObject2).add(localObject4);
              i3 = i1;
              i1 = i2;
              i2 = i3;
            }
          }
        }
        for (;;)
        {
          i3 = i1;
          i1 = i2;
          i2 = i3;
          break;
          i3 = i1 + 1;
          String str2 = b(str1, i3);
          localHashMap.put(str2, localHashMap.get(str1));
          paramQQAppInterface = null;
          i1 = 0;
          for (;;)
          {
            if (i1 < localArrayList.size())
            {
              paramQQAppInterface = (Pair)localArrayList.get(i1);
              if (!((String)first).equals(str1)) {}
            }
            else
            {
              if (paramQQAppInterface != null)
              {
                localArrayList.remove(i1);
                localArrayList.add(i1, new Pair(str2, second));
              }
              paramQQAppInterface = new ArrayList();
              paramQQAppInterface.add(localObject4);
              localHashMap.put(str1, paramQQAppInterface);
              localArrayList.add(new Pair(str1, Integer.valueOf(i2)));
              i1 = i3;
              break;
            }
            i1 += 1;
          }
          paramQQAppInterface = new ArrayList();
          paramQQAppInterface.add(localObject4);
          localHashMap.put(str1, paramQQAppInterface);
          localArrayList.add(new Pair(str1, Integer.valueOf(i2)));
          break label166;
          i3 = i2 + 1;
          i2 = i1;
          i1 = i3;
        }
      }
      paramList.removeAll((Collection)localObject2);
      if ((!localHashMap.isEmpty()) && (!localArrayList.isEmpty()))
      {
        if (((MessageCache)localObject1).a(paramString, paramInt) != null)
        {
          paramQQAppInterface = new ArrayList();
          localObject2 = localHashMap.keySet().iterator();
          for (;;)
          {
            if (!((Iterator)localObject2).hasNext()) {
              break label764;
            }
            localObject3 = (String)((Iterator)localObject2).next();
            localObject4 = (ArrayList)localHashMap.get(localObject3);
            if (!((ArrayList)localObject4).isEmpty()) {
              if ((get0longMsgCount <= ((ArrayList)localObject4).size()) || (((MessageRecord)((ArrayList)localObject4).get(0)).isSendFromLocal()))
              {
                if (QLog.isColorLevel()) {
                  QLog.d("Q.msg.MsgProxyUtils", 2, "mergeLongMsg: complete online msg: uin=" + paramString + ",istroop=" + paramInt + ",key=" + (String)localObject3);
                }
                ((MessageCache)localObject1).a(paramString, paramInt, (String)localObject3);
              }
              else if (((MessageCache)localObject1).a(paramString, paramInt, (String)localObject3))
              {
                if (QLog.isColorLevel()) {
                  QLog.d("Q.msg.MsgProxyUtils", 2, "mergeLongMsg: incomplete online msg: uin=" + paramString + ",istroop=" + paramInt + ",key=" + (String)localObject3);
                }
                paramQQAppInterface.add(localObject3);
                localObject4 = localArrayList.iterator();
                if (((Iterator)localObject4).hasNext())
                {
                  if (!TextUtils.equals((CharSequence)nextfirst, (CharSequence)localObject3)) {
                    break;
                  }
                  ((Iterator)localObject4).remove();
                }
              }
            }
          }
          label764:
          if (!paramQQAppInterface.isEmpty())
          {
            paramQQAppInterface = paramQQAppInterface.iterator();
            while (paramQQAppInterface.hasNext()) {
              localHashMap.remove((String)paramQQAppInterface.next());
            }
          }
        }
        i2 = localArrayList.size() - 1;
        while (i2 >= 0)
        {
          paramQQAppInterface = (Pair)localArrayList.get(i2);
          localObject2 = (ArrayList)localHashMap.get(first);
          try
          {
            Collections.sort((List)localObject2, jdField_a_of_type_JavaUtilComparator);
            localObject1 = new ArrayList();
            localObject2 = ((ArrayList)localObject2).iterator();
            i1 = 0;
            for (;;)
            {
              if (!((Iterator)localObject2).hasNext()) {
                break label1080;
              }
              localObject3 = (MessageRecord)((Iterator)localObject2).next();
              if (!a((MessageRecord)localObject3)) {
                break;
              }
              ((ArrayList)localObject1).add(localObject3);
            }
          }
          catch (Exception localException)
          {
            for (;;)
            {
              if (QLog.isColorLevel())
              {
                QLog.d("Q.msg.MsgProxyUtils", 2, "sort long msg error", localException);
                continue;
                i3 = i1;
                if (!localException.isEmpty())
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.MsgProxyUtils", 2, "mergeLongMsg: uin=" + paramString + ",istroop=" + paramInt + ",key=" + a((MessageRecord)localException.get(0)));
                  }
                  paramList.add(i1 + ((Integer)second).intValue(), new MessageForLongMsg(localException));
                  localException.clear();
                  i3 = i1 + 1;
                }
                paramList.add(i3 + ((Integer)second).intValue(), localObject3);
                i1 = i3 + 1;
              }
            }
            label1080:
            if (!localException.isEmpty())
            {
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.MsgProxyUtils", 2, "mergeLongMsg: uin=" + paramString + ",istroop=" + paramInt + ",key=" + a((MessageRecord)localException.get(0)));
              }
              paramList.add(((Integer)second).intValue() + i1, new MessageForLongMsg(localException));
              localException.clear();
            }
            i2 -= 1;
          }
        }
      }
    }
  }
  
  public static void a(List paramList)
  {
    if ((paramList == null) || (paramList.size() == 0)) {
      return;
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
      if (localMessageRecord == null) {
        localArrayList.add(localMessageRecord);
      } else if ((msgtype == 63530) || (!isValid)) {
        localArrayList.add(localMessageRecord);
      } else if (msgtype == 63504) {
        localArrayList.add(localMessageRecord);
      }
    }
    paramList.removeAll(localArrayList);
  }
  
  public static void a(List paramList, MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    if ((istroop == 3000) || (istroop == 1))
    {
      c(paramList, paramMessageRecord, paramBoolean);
      return;
    }
    if (c(istroop))
    {
      b(paramList, paramMessageRecord, paramBoolean);
      return;
    }
    paramList.add(paramMessageRecord);
  }
  
  public static boolean a(int paramInt)
  {
    if (j.length == 0) {}
    for (;;)
    {
      return false;
      int[] arrayOfInt = j;
      int i2 = arrayOfInt.length;
      int i1 = 0;
      while (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          return true;
        }
        i1 += 1;
      }
    }
  }
  
  public static boolean a(int paramInt1, int paramInt2)
  {
    return (a(paramInt1) == 1001) && (paramInt2 != 62535) && (paramInt2 != 62536) && (paramInt2 != 64504) && (paramInt2 != 64505) && (paramInt2 != 64533);
  }
  
  public static boolean a(QQAppInterface paramQQAppInterface, MessageRecord paramMessageRecord)
  {
    if (istroop == 1)
    {
      if (((HotChatManager)paramQQAppInterface.getManager(59)).b(frienduin)) {
        return true;
      }
    }
    else if (istroop == 1026) {
      return true;
    }
    return false;
  }
  
  public static boolean a(QQAppInterface paramQQAppInterface, String paramString, int paramInt)
  {
    if (paramInt == 3000)
    {
      paramQQAppInterface = ((DiscussionManager)paramQQAppInterface.getManager(52)).a(paramString, paramQQAppInterface.a());
      if (paramQQAppInterface != null) {
        return (flag & 0x1) == 1;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.MsgProxyUtils", 2, String.format("isDiscussionFilter, discuss meminfo not find, uin:%s, uinType: %d ", new Object[] { paramString, Integer.valueOf(paramInt) }));
      }
    }
    return false;
  }
  
  public static boolean a(MessageRecord paramMessageRecord)
  {
    return ((paramMessageRecord instanceof MessageForText)) || ((paramMessageRecord instanceof MessageForPic)) || ((paramMessageRecord instanceof MessageForMixedMsg)) || ((paramMessageRecord instanceof MessageForReplyText));
  }
  
  public static boolean a(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    return (paramMessageRecord1.isLongMsg()) && (paramMessageRecord2.isLongMsg()) && (longMsgId == longMsgId) && (longMsgCount == longMsgCount) && (TextUtils.equals(senderuin, senderuin)) && (Math.abs(time - time) <= 480L);
  }
  
  public static boolean a(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2, boolean paramBoolean)
  {
    boolean bool1 = false;
    boolean bool2 = false;
    if (msgtype == msgtype) {
      if (msgUid != 0L) {
        if (paramBoolean)
        {
          bool1 = bool2;
          if (msgUid == msgUid)
          {
            bool1 = bool2;
            if (shmsgseq == shmsgseq) {
              bool1 = true;
            }
          }
          paramBoolean = bool1;
          if (!bool1) {
            if (msgtype != 63531)
            {
              paramBoolean = bool1;
              if (msgtype != 63534) {}
            }
            else if (istroop == 1008)
            {
              paramBoolean = bool1;
              if (msgtype != 63531) {}
            }
            else
            {
              paramBoolean = bool1;
              if (c(paramMessageRecord1, paramMessageRecord2)) {
                paramBoolean = true;
              }
            }
          }
        }
      }
    }
    for (;;)
    {
      if ((paramBoolean) && (QLog.isColorLevel())) {
        QLog.w("Q.msg.MsgProxyUtils", 2, "friend---------------msgFilter istroop: " + istroop + " friendUin: " + frienduin + " senderUin: " + senderuin + " LOC_shmsgseq: " + shmsgseq + " NEW_shmsgseq:" + shmsgseq + " LOC_msgType: " + msgtype + " NEW_msgType" + msgtype + " LOC_msgtime: " + time + " NEW_msgtime:" + time + " LOC_msgUid:" + msgUid + " NEW_msgUid:" + msgUid + " LOC_msgContent: " + paramMessageRecord1.getLogColorContent() + " NEW_msgContent:" + paramMessageRecord2.getLogColorContent());
      }
      return paramBoolean;
      paramBoolean = bool1;
      if (c(paramMessageRecord1, paramMessageRecord2))
      {
        paramBoolean = true;
        continue;
        paramBoolean = bool1;
        if (c(paramMessageRecord1, paramMessageRecord2))
        {
          paramBoolean = true;
          continue;
          if ((msgtype == 64536) && (msgtype == 63529))
          {
            paramBoolean = bool1;
            if (msgUid == msgUid)
            {
              paramBoolean = bool1;
              if (shmsgseq == shmsgseq) {
                paramBoolean = true;
              }
            }
          }
          else if ((msgtype == 63535) && (msgtype == 63536))
          {
            paramBoolean = bool1;
            if (time == time)
            {
              paramBoolean = bool1;
              if (shmsgseq == shmsgseq) {
                paramBoolean = true;
              }
            }
          }
          else if ((msgtype == 64536) && (msgtype == 63525))
          {
            paramBoolean = bool1;
            if (msgUid == msgUid)
            {
              paramBoolean = bool1;
              if (shmsgseq == shmsgseq) {
                paramBoolean = true;
              }
            }
          }
          else if ((msgtype == 64536) && (msgtype == 63514))
          {
            paramBoolean = bool1;
            if (msgUid == msgUid)
            {
              paramBoolean = bool1;
              if (shmsgseq == shmsgseq) {
                paramBoolean = true;
              }
            }
          }
          else if ((msgtype == 64536) && (msgtype == 63511))
          {
            paramBoolean = bool1;
            if (msgUid == msgUid)
            {
              paramBoolean = bool1;
              if (shmsgseq == shmsgseq) {
                paramBoolean = true;
              }
            }
          }
          else
          {
            paramBoolean = bool1;
            if (msgtype == 63505)
            {
              paramBoolean = bool1;
              if (msgUid == msgUid)
              {
                paramBoolean = bool1;
                if (shmsgseq == shmsgseq) {
                  paramBoolean = true;
                }
              }
            }
          }
        }
      }
    }
  }
  
  public static boolean a(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2, boolean paramBoolean1, boolean paramBoolean2)
  {
    boolean bool = true;
    if ((frienduin == null) || (!frienduin.equals(frienduin))) {
      paramBoolean1 = false;
    }
    label68:
    label183:
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      return paramBoolean1;
                      if (paramBoolean1) {
                        break label183;
                      }
                      if (paramBoolean2) {
                        break label68;
                      }
                      if (Math.abs(time - time) >= 30L) {
                        break;
                      }
                      paramBoolean1 = bool;
                    } while (b(paramMessageRecord1, paramMessageRecord2));
                    return false;
                    if (shmsgseq != shmsgseq) {
                      break;
                    }
                    paramBoolean1 = bool;
                  } while (msgtype == msgtype);
                  if (msgtype != 64536) {
                    break;
                  }
                  paramBoolean1 = bool;
                } while (msgtype == 63529);
                paramBoolean1 = bool;
              } while (msgtype == 63530);
              paramBoolean1 = bool;
            } while (msgtype == 63530);
            if (msgtype != 64536) {
              break;
            }
            paramBoolean1 = bool;
          } while (msgtype == 63525);
          paramBoolean1 = bool;
        } while (msgtype == 63505);
        return false;
        return false;
        if (!paramMessageRecord1.isSendFromLocal()) {
          return false;
        }
        if ((extraflag != 32772) && (extraflag != 32768)) {
          return false;
        }
        if (msgtype == 63530) {
          return false;
        }
        if ((senderuin == null) || (!senderuin.equals(senderuin))) {
          return false;
        }
        if ((msgUid == 0L) || (msgUid == 0L) || (msgUid != msgUid)) {
          break;
        }
        paramBoolean1 = bool;
      } while (!QLog.isColorLevel());
      QLog.d("Q.msg.MsgProxyUtils", 2, "compTroopMsgContent RewriteSeq: find msg by uid=" + msgUid);
      return true;
      if ((Math.abs(time - time) >= 510L) && (Math.abs(shmsgseq - shmsgseq) >= 2L)) {
        break;
      }
      paramBoolean1 = bool;
    } while (b(paramMessageRecord1, paramMessageRecord2));
    return false;
  }
  
  public static boolean a(String paramString)
  {
    boolean bool2 = false;
    String[] arrayOfString = jdField_a_of_type_ArrayOfJavaLangString;
    int i2 = arrayOfString.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfString[i1].equals(paramString)) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean a(String paramString, int paramInt)
  {
    if (TextUtils.isEmpty(paramString)) {}
    while (((a(paramInt) != 1001) || (!AppConstants.aq.equals(paramString))) && ((a(paramInt) != 1009) || (!AppConstants.af.equals(paramString))) && ((a(paramInt) != 1010) || (!AppConstants.aG.equals(paramString))) && ((a(paramInt) != 1001) || (!AppConstants.aN.equals(paramString))) && ((a(paramInt) != 1010) || (!AppConstants.aO.equals(paramString)))) {
      return false;
    }
    return true;
  }
  
  public static boolean a(String paramString, int paramInt, List paramList)
  {
    if ((paramList == null) || (paramList.size() == 0)) {}
    Object localObject;
    do
    {
      while (!paramList.hasNext())
      {
        do
        {
          return false;
          paramString = new HashMap();
          paramList = paramList.iterator();
          paramInt = 0;
          if (paramList.hasNext())
          {
            localObject = (MessageRecord)paramList.next();
            String str;
            if (((MessageRecord)localObject).isLongMsg())
            {
              str = a((MessageRecord)localObject);
              if (paramString.containsKey(str)) {
                if (Math.abs(getget0time - time) <= 480L) {
                  ((ArrayList)paramString.get(str)).add(localObject);
                }
              }
            }
            for (;;)
            {
              break;
              paramInt += 1;
              paramString.put(b(str, paramInt), paramString.get(str));
              ArrayList localArrayList = new ArrayList();
              localArrayList.add(localObject);
              paramString.put(str, localArrayList);
              continue;
              localArrayList = new ArrayList();
              localArrayList.add(localObject);
              paramString.put(str, localArrayList);
            }
          }
        } while (paramString.isEmpty());
        paramList = paramString.keySet().iterator();
      }
      localObject = (ArrayList)paramString.get((String)paramList.next());
    } while ((((ArrayList)localObject).isEmpty()) || (get0longMsgCount <= ((ArrayList)localObject).size()) || (((MessageRecord)((ArrayList)localObject).get(0)).isSendFromLocal()));
    return true;
  }
  
  public static boolean a(String paramString1, String paramString2, int paramInt1, int paramInt2)
  {
    if ((!e(paramInt1)) && (!e(paramInt2))) {
      return TextUtils.equals(paramString1, paramString2);
    }
    return (paramInt1 == paramInt2) && (TextUtils.equals(paramString1, paramString2));
  }
  
  public static boolean a(List paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      return false;
    }
    int i2 = paramList.size();
    int i1 = 0;
    while (i1 < i2)
    {
      if (getmsgtype != 63530) {
        return true;
      }
      i1 += 1;
    }
    return false;
  }
  
  public static byte[] a(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    MessageForTroopFile localMessageForTroopFile = (MessageForTroopFile)MessageRecordFactory.a(63519);
    MessageRecord.copyMessageRecordBaseField(localMessageForTroopFile, paramMessageRecord1);
    localMessageForTroopFile.doParse();
    paramMessageRecord1 = (MessageForTroopFile)MessageRecordFactory.a(63519);
    MessageRecord.copyMessageRecordBaseField(paramMessageRecord1, paramMessageRecord2);
    paramMessageRecord1.doParse();
    bisID = bisID;
    dspFileName = dspFileName;
    dspFileSize = dspFileSize;
    fileSize = fileSize;
    fileName = fileName;
    url = url;
    localMessageForTroopFile.serial();
    return msgData;
  }
  
  static String[] a(String paramString)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramString != null)
    {
      localObject1 = localObject2;
      if (paramString.length() > 0)
      {
        localObject1 = localObject2;
        if (paramString.charAt(0) == '\026') {
          localObject1 = paramString.split("\\|");
        }
      }
    }
    return localObject1;
  }
  
  public static String b()
  {
    StringBuilder localStringBuilder = new StringBuilder(h.length * 8);
    localStringBuilder.append("not in (");
    int i1 = 0;
    if (i1 < h.length)
    {
      localStringBuilder.append(h[i1]);
      if (i1 == h.length - 1) {
        localStringBuilder.append(")");
      }
      for (;;)
      {
        i1 += 1;
        break;
        localStringBuilder.append(",");
      }
    }
    return localStringBuilder.toString();
  }
  
  public static String b(MessageRecord paramMessageRecord)
  {
    if ((istroop == 1008) && ((paramMessageRecord instanceof MessageForStructing)))
    {
      MessageForStructing localMessageForStructing = (MessageForStructing)paramMessageRecord;
      if (structingMsg == null) {
        structingMsg = StructMsgFactory.a(msgData);
      }
      if ((structingMsg != null) && (structingMsg.dynamicMsgMergeKey != null) && (!structingMsg.dynamicMsgMergeKey.equals(""))) {
        return structingMsg.dynamicMsgMergeKey;
      }
    }
    return null;
  }
  
  public static String b(String paramString, int paramInt)
  {
    return paramString + "&" + paramInt;
  }
  
  public static List b(List paramList)
  {
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.next();
      if (!g(msgtype)) {
        localArrayList.add(localMessageRecord);
      }
    }
    return localArrayList;
  }
  
  public static void b(QQAppInterface paramQQAppInterface, String paramString, int paramInt1, int paramInt2)
  {
    a(paramQQAppInterface, paramString, paramInt1, paramInt2);
  }
  
  public static void b(String paramString, int paramInt, List paramList, QQAppInterface paramQQAppInterface)
  {
    paramList.size();
    paramString = a(paramString, paramInt, paramList, paramQQAppInterface);
    if ((paramString != null) && (paramString.size() == 0)) {}
  }
  
  public static void b(List paramList, MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    int i3 = 0;
    Iterator localIterator = paramList.iterator();
    int i1 = 0;
    for (;;)
    {
      i2 = i3;
      if (!localIterator.hasNext()) {
        break label83;
      }
      MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
      if (((paramBoolean) || (time >= time)) && ((!paramBoolean) || (time > time))) {
        break;
      }
      i1 += 1;
    }
    int i2 = 1;
    label83:
    if (i2 == 0)
    {
      paramList.add(paramMessageRecord);
      return;
    }
    paramList.add(i1, paramMessageRecord);
  }
  
  public static boolean b(int paramInt)
  {
    if (k.length == 0) {}
    for (;;)
    {
      return false;
      int[] arrayOfInt = k;
      int i2 = arrayOfInt.length;
      int i1 = 0;
      while (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          return true;
        }
        i1 += 1;
      }
    }
  }
  
  public static boolean b(QQAppInterface paramQQAppInterface, MessageRecord paramMessageRecord)
  {
    return (c(paramMessageRecord)) && (!a(frienduin, istroop)) && (paramQQAppInterface.a().b(frienduin));
  }
  
  public static boolean b(MessageRecord paramMessageRecord)
  {
    if (paramMessageRecord == null) {}
    String str;
    do
    {
      do
      {
        return false;
        str = paramMessageRecord.getExtInfoFromExtStr("dynamic_msg");
      } while ((str == null) || (str.length() == 0));
      paramMessageRecord = b(paramMessageRecord);
    } while ((paramMessageRecord == null) || (paramMessageRecord.length() == 0) || (!"true".equals(str)));
    return true;
  }
  
  private static boolean b(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    boolean bool2 = true;
    boolean bool3 = true;
    boolean bool4 = true;
    boolean bool1 = true;
    if (msgtype != msgtype) {}
    String str;
    Object localObject;
    label672:
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  return false;
                  str = msg;
                  localObject = msg;
                  if (msgtype != 64536) {
                    break;
                  }
                } while (!TextUtils.equals(str, (CharSequence)localObject));
                return true;
                if (msgtype != 63534) {
                  break;
                }
              } while ((!(paramMessageRecord2 instanceof MessageForPtt)) || (!(paramMessageRecord1 instanceof MessageForPtt)) || (urlAtServer == null) || (urlAtServer.length() <= 0) || (urlAtServer == null) || (urlAtServer.length() <= 0));
              return urlAtServer.equals(urlAtServer);
              if (msgtype == 63525)
              {
                if (QLog.isColorLevel()) {
                  QLog.d("Debug", 2, "c2c" + Arrays.toString(msgData) + " : " + Arrays.toString(msgData));
                }
                return Arrays.equals(msgData, msgData);
              }
              if ((msgtype == 60527) && (msgtype == 60527))
              {
                if (QLog.isColorLevel()) {
                  QLog.d("Debug", 2, "bitapp c2c" + Arrays.toString(msgData) + " : " + Arrays.toString(msgData));
                }
                return Arrays.equals(msgData, msgData);
              }
              if (msgtype != 63536) {
                break label672;
              }
              if ((str == null) || (localObject == null) || (str.length() <= 0) || (((String)localObject).length() <= 0) || (str.charAt(0) != '\026') || (((String)localObject).charAt(0) != '\026')) {
                break;
              }
              paramMessageRecord1 = a((String)localObject);
              localObject = a(str);
            } while ((paramMessageRecord1 == null) || (localObject == null) || (!paramMessageRecord1[1].equals(localObject[1])) || (!paramMessageRecord1[2].equals(localObject[2])));
            if ((issend == 2) || (paramMessageRecord2.isSendFromLocal()))
            {
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.MsgProxyUtils", 2, "-------->compMsgContent: samePic: picSize:" + paramMessageRecord1[1] + ",picType:" + paramMessageRecord1[2] + ",isSend == true");
              }
              return true;
            }
            if (!str.contains(AppConstants.bd)) {
              break;
            }
            paramMessageRecord2 = localObject[0].split("/");
            paramMessageRecord2 = paramMessageRecord2[(paramMessageRecord2.length - 1)].split("\\.")[0];
            str = MD5.toMD5(paramMessageRecord1[4]);
          } while (!str.equals(paramMessageRecord2));
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.MsgProxyUtils", 2, "-------->compMsgContent: samePic: picSize:" + paramMessageRecord1[1] + ",picType:" + paramMessageRecord1[2] + ",Path:" + str);
          }
          return true;
          return localObject[0].equals(paramMessageRecord1[0]);
        } while ((uuid == null) || (uuid.length() <= 0) || (uuid == null) || (uuid.length() <= 0));
        return uuid.equals(uuid);
        if ((msgtype == 63529) && (msgtype == 63529)) {
          return Arrays.equals(msgData, msgData);
        }
        if ((msgtype == 64501) && (msgtype == 64501)) {
          return Arrays.equals(msgData, msgData);
        }
        if ((msgtype == 64502) && (msgtype == 64502))
        {
          if ((time == time) && (uniseq == uniseq)) {}
          for (;;)
          {
            return bool1;
            bool1 = false;
          }
        }
        if ((msgtype == 64494) && (msgtype == 64494))
        {
          if (time == time) {}
          for (bool1 = bool2;; bool1 = false) {
            return bool1;
          }
        }
        if ((msgtype == 63521) && (msgtype == 63521))
        {
          if ((time == time) && (uniseq == uniseq)) {}
          for (bool1 = bool3;; bool1 = false) {
            return bool1;
          }
        }
        if ((msgtype == 63526) && (msgtype == 63526)) {
          return ((MessageForFunnyFace)paramMessageRecord2).msgEquals((MessageForFunnyFace)paramMessageRecord1);
        }
        if (msgtype != 63531) {
          break;
        }
      } while ((!(paramMessageRecord2 instanceof MessageForFile)) || (!(paramMessageRecord1 instanceof MessageForFile)));
      if (uniseq == uniseq) {}
      for (bool1 = bool4;; bool1 = false) {
        return bool1;
      }
    } while ((msgtype == 63519) || (!TextUtils.equals(str, (CharSequence)localObject)));
    return true;
  }
  
  public static boolean b(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return false;
      String[] arrayOfString = jdField_a_of_type_ArrayOfJavaLangString;
      int i2 = arrayOfString.length;
      int i1 = 0;
      while (i1 < i2)
      {
        String str = arrayOfString[i1];
        if ((paramString.startsWith(str)) && (paramString.length() > str.length()) && (paramString.charAt(str.length()) == '&')) {
          return true;
        }
        i1 += 1;
      }
    }
  }
  
  public static boolean b(List paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      return false;
    }
    int i2 = paramList.size();
    int i1 = 0;
    while (i1 < i2)
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.get(i1);
      if ((!q(msgtype)) && (msgtype != 63530)) {
        return true;
      }
      i1 += 1;
    }
    return false;
  }
  
  public static String c()
  {
    StringBuilder localStringBuilder = new StringBuilder(e.length * 8);
    localStringBuilder.append("not in (");
    int i1 = 0;
    if (i1 < e.length)
    {
      localStringBuilder.append(e[i1]);
      if (i1 == e.length - 1) {
        localStringBuilder.append(")");
      }
      for (;;)
      {
        i1 += 1;
        break;
        localStringBuilder.append(",");
      }
    }
    return localStringBuilder.toString();
  }
  
  public static void c(List paramList, MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    int i3 = 0;
    Iterator localIterator = paramList.iterator();
    int i1 = 0;
    for (;;)
    {
      i2 = i3;
      if (!localIterator.hasNext()) {
        break label83;
      }
      MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
      if (((paramBoolean) || (shmsgseq >= shmsgseq)) && ((!paramBoolean) || (shmsgseq > shmsgseq))) {
        break;
      }
      i1 += 1;
    }
    int i2 = 1;
    label83:
    if (i2 == 0)
    {
      paramList.add(paramMessageRecord);
      return;
    }
    paramList.add(i1, paramMessageRecord);
  }
  
  public static boolean c(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = p;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean c(MessageRecord paramMessageRecord)
  {
    return ((extLong & 0x1) == 1) && (!TextUtils.isEmpty(paramMessageRecord.getExtInfoFromExtStr("one_way")));
  }
  
  private static boolean c(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    boolean bool = true;
    if (msgtype == 64502) {
      bool = b(paramMessageRecord1, paramMessageRecord2);
    }
    do
    {
      return bool;
      if (msgtype == 64494) {
        return b(paramMessageRecord1, paramMessageRecord2);
      }
      if ((msgtype != 63536) && (msgtype != 64536)) {
        break;
      }
    } while ((Math.abs(time - time) < 30L) && (shmsgseq == shmsgseq) && (b(paramMessageRecord1, paramMessageRecord2)));
    do
    {
      do
      {
        return false;
        if (msgtype == 63534) {
          return b(paramMessageRecord1, paramMessageRecord2);
        }
        if (msgtype == 63531) {
          return b(paramMessageRecord1, paramMessageRecord2);
        }
        if (msgtype == 60529) {
          return b(paramMessageRecord1, paramMessageRecord2);
        }
      } while ((Math.abs(time - time) >= 30L) || (shmsgseq != shmsgseq));
      if (QLog.isColorLevel()) {
        QLog.i("Q.msg.MsgProxyUtils", 2, "other equal : mr.shmsgseq = " + shmsgseq);
      }
    } while (!b(paramMessageRecord1, paramMessageRecord2));
    return true;
  }
  
  public static boolean c(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    while ((!AppConstants.aN.equals(paramString)) && (!AppConstants.aO.equals(paramString))) {
      return false;
    }
    return true;
  }
  
  public static String d()
  {
    if (i.length == 0) {
      return null;
    }
    StringBuilder localStringBuilder = new StringBuilder(i.length * 8);
    localStringBuilder.append("not in (");
    int i1 = 0;
    if (i1 < i.length)
    {
      localStringBuilder.append(i[i1]);
      if (i1 == i.length - 1) {
        localStringBuilder.append(")");
      }
      for (;;)
      {
        i1 += 1;
        break;
        localStringBuilder.append(",");
      }
    }
    return localStringBuilder.toString();
  }
  
  public static boolean d(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = q;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean e(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = r;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean f(int paramInt)
  {
    int[] arrayOfInt = e;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    while (i1 < i2)
    {
      if (arrayOfInt[i1] == paramInt) {
        return false;
      }
      i1 += 1;
    }
    return true;
  }
  
  public static boolean g(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = jdField_a_of_type_ArrayOfInt;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean h(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = jdField_b_of_type_ArrayOfInt;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean i(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = c;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean j(int paramInt)
  {
    if (i.length == 0) {}
    for (;;)
    {
      return false;
      int[] arrayOfInt = i;
      int i2 = arrayOfInt.length;
      int i1 = 0;
      while (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          return true;
        }
        i1 += 1;
      }
    }
  }
  
  public static boolean k(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = d;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean l(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = l;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean m(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = m;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean n(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = n;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean o(int paramInt)
  {
    return paramInt == 63530;
  }
  
  public static boolean p(int paramInt)
  {
    return paramInt == 63505;
  }
  
  public static boolean q(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = f;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean r(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = g;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean s(int paramInt)
  {
    return (a(paramInt) == 1001) || (a(paramInt) == 1009) || (a(paramInt) == 1010);
  }
  
  public static boolean t(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = o;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean u(int paramInt)
  {
    return paramInt == 1025;
  }
  
  public static boolean v(int paramInt)
  {
    return paramInt == 1001;
  }
  
  public static boolean w(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = t;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  public static boolean x(int paramInt)
  {
    boolean bool2 = false;
    int[] arrayOfInt = u;
    int i2 = arrayOfInt.length;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < i2)
      {
        if (arrayOfInt[i1] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
}
