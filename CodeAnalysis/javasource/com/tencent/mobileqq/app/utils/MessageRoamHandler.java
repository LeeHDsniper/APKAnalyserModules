package com.tencent.mobileqq.app.utils;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.util.Pair;
import android.util.SparseArray;
import com.tencent.mobileqq.activity.AuthDevForRoamMsgActivity;
import com.tencent.mobileqq.activity.ChatHistoryForC2C;
import com.tencent.mobileqq.app.BusinessHandler;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.MessageRoamManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.asyncdb.cache.RoamDateCache;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;
import mqq.os.MqqHandler;
import nmn;
import tencent.im.oidb.oidb_sso.OIDBSSOPkg;

public class MessageRoamHandler
  extends BusinessHandler
{
  private static final String a = "Q.roammsg";
  private static final String b = "EndRoamYearKey";
  private static final String c = "EndRoamMonthKey";
  private static final String d = "EndRoamDayKey";
  private static final String e = "reqFromMessageRoamHandler";
  private static final String f = "authMode";
  public int a;
  public SparseArray a;
  
  public MessageRoamHandler(QQAppInterface paramQQAppInterface)
  {
    super(paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    paramObject = b.a(ChatHistoryForC2C.class);
    Object localObject;
    if ((paramFromServiceMsg != null) && (paramFromServiceMsg.getResultCode() == 1000)) {
      localObject = new oidb_sso.OIDBSSOPkg();
    }
    for (;;)
    {
      int j;
      int i3;
      long l;
      try
      {
        paramFromServiceMsg = (oidb_sso.OIDBSSOPkg)((oidb_sso.OIDBSSOPkg)localObject).mergeFrom(paramFromServiceMsg.getWupBuffer());
        if ((paramFromServiceMsg != null) && (uint32_result.has()))
        {
          j = uint32_result.get();
          if (QLog.isColorLevel()) {
            QLog.i("Q.roammsg", 2, "handle_oidb_0x42e_3 ret = " + j);
          }
          if (j != 0) {
            break label706;
          }
          localObject = bytes_bodybuffer.get().toByteArray();
          i3 = localObject.length;
          l = 0L;
          i = 0;
          j = 0;
          if (4 <= i3) {
            l = PkgTools.a((byte[])localObject, 0);
          }
          if (6 > i3) {
            break label893;
          }
          m = PkgTools.a((byte[])localObject, 4);
          if (8 > i3) {
            break label887;
          }
          n = PkgTools.a((byte[])localObject, 6);
          if (10 <= i3) {
            i = PkgTools.a((byte[])localObject, 8);
          }
          if (12 <= i3) {
            j = PkgTools.a((byte[])localObject, 10);
          }
          if ((i == 0) && (j == 0) && (m == 0) && (n == 0))
          {
            if (QLog.isColorLevel()) {
              QLog.d("Q.roammsg", 2, "handle_oidb_0x42e_3 : wYearEnd = wMonthEnd = wYearStart = wMonthStart = 0");
            }
            paramObject.sendMessageDelayed(paramObject.obtainMessage(16), 0L);
          }
        }
        else
        {
          return;
        }
      }
      catch (InvalidProtocolBufferMicroException paramToServiceMsg)
      {
        paramToServiceMsg.printStackTrace();
        if (QLog.isColorLevel()) {
          QLog.d("Q.roammsg", 2, "handle_oidb_0x42e_3 error: ", paramToServiceMsg);
        }
        paramObject.sendMessageDelayed(paramObject.obtainMessage(15), 0L);
        return;
      }
      int i4 = (i - m) * 12 + (j - n) + 1;
      paramFromServiceMsg = new long[i4];
      int i1 = 12;
      int k = 0;
      while (k < i4)
      {
        i2 = i1;
        if (i1 + 4 <= i3)
        {
          paramFromServiceMsg[k] = PkgTools.a((byte[])localObject, i1);
          i2 = i1 + 4;
        }
        k += 1;
        i1 = i2;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "handle_oidb_0x42e_3 Begin: " + m + "-" + n + ", End: " + i + "-" + j + " : dwIndexes = " + Arrays.toString(paramFromServiceMsg));
      }
      int i6 = extraData.getInt("EndRoamYearKey");
      int i7 = extraData.getInt("EndRoamMonthKey");
      i4 = extraData.getInt("EndRoamDayKey");
      paramToServiceMsg = (MessageRoamManager)b.getManager(91);
      paramToServiceMsg.a().g();
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "handle_oidb_0x42e_3 : clearRoamDateSerIndex...");
      }
      int i2 = j;
      i1 = 0;
      k = i;
      for (;;)
      {
        int i5 = 31;
        i3 = i5;
        if (k == i6)
        {
          i3 = i5;
          if (i2 == i7) {
            i3 = i4;
          }
        }
        paramToServiceMsg.a().a(l, k, i2, (int)paramFromServiceMsg[i1], i3);
        if (i2 - 1 > 0)
        {
          i3 = i2 - 1;
          i2 = k;
          k = i3;
        }
        while ((i2 < m) || ((i2 == m) && (k < n)))
        {
          paramToServiceMsg.b(i6, i7, i4);
          paramToServiceMsg.a().a(String.valueOf(l), m, n, i, j);
          paramToServiceMsg.l();
          paramToServiceMsg.c();
          paramObject.sendMessageDelayed(paramObject.obtainMessage(17), 0L);
          return;
          i2 = 12;
          i3 = k - 1;
          k = i2;
          i2 = i3;
        }
        i3 = k;
        i1 += 1;
        k = i2;
        i2 = i3;
      }
      label706:
      paramFromServiceMsg = bytes_bodybuffer.get().toByteArray();
      k = paramFromServiceMsg.length;
      int i = 0;
      paramToServiceMsg = null;
      if (1 <= k) {
        i = (short)paramFromServiceMsg[0];
      }
      if (i + 1 <= k) {
        paramToServiceMsg = PkgTools.a(paramFromServiceMsg, 1, i);
      }
      if (QLog.isColorLevel())
      {
        paramFromServiceMsg = new StringBuilder().append("handle_oidb_0x42e_3 ret = ").append(j).append(", ");
        if (paramToServiceMsg == null) {
          break label815;
        }
      }
      for (;;)
      {
        QLog.d("Q.roammsg", 2, paramToServiceMsg);
        paramObject.sendMessageDelayed(paramObject.obtainMessage(15), 0L);
        return;
        label815:
        paramToServiceMsg = "null";
      }
      if (QLog.isColorLevel())
      {
        localObject = new StringBuilder().append("handle_oidb_0x42e_3 error: ");
        if (paramFromServiceMsg == null) {
          break label881;
        }
      }
      label881:
      for (paramToServiceMsg = Integer.valueOf(paramFromServiceMsg.getResultCode());; paramToServiceMsg = "null")
      {
        QLog.d("Q.roammsg", 2, paramToServiceMsg);
        paramObject.sendMessageDelayed(paramObject.obtainMessage(15), 0L);
        return;
      }
      label887:
      int n = 0;
      continue;
      label893:
      int m = 0;
    }
  }
  
  private void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int i = paramFromServiceMsg.getResultCode();
    int j = 0;
    int k = extraData.getShort("authMode");
    if (QLog.isColorLevel()) {
      QLog.d("Q.roammsg", 2, "handle_roam_message_auth_mode retCode: " + i + ", mode: " + k);
    }
    if (1000 == i)
    {
      paramToServiceMsg = new oidb_sso.OIDBSSOPkg();
      try
      {
        paramFromServiceMsg = (oidb_sso.OIDBSSOPkg)paramToServiceMsg.mergeFrom(paramFromServiceMsg.getWupBuffer());
        paramToServiceMsg = paramFromServiceMsg;
      }
      catch (InvalidProtocolBufferMicroException paramFromServiceMsg)
      {
        for (;;)
        {
          paramFromServiceMsg.printStackTrace();
        }
      }
      i = j;
      if (paramToServiceMsg != null)
      {
        i = j;
        if (uint32_result.has())
        {
          j = uint32_result.get();
          if (QLog.isColorLevel()) {
            QLog.i("Q.roammsg", 2, "handle_roam_message_auth_mode ret=" + j + ", authMode: " + k);
          }
          i = j;
          if (j == 0)
          {
            paramToServiceMsg = (MessageRoamManager)b.getManager(91);
            i = j;
            if (paramToServiceMsg != null) {
              paramToServiceMsg.c(k);
            }
          }
        }
      }
    }
    for (i = j;; i = -1)
    {
      paramToServiceMsg = b.a(AuthDevForRoamMsgActivity.class);
      if (paramToServiceMsg != null)
      {
        paramFromServiceMsg = paramToServiceMsg.obtainMessage();
        what = 1;
        arg1 = i;
        arg2 = k;
        paramToServiceMsg.sendMessage(paramFromServiceMsg);
      }
      return;
    }
  }
  
  private void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    boolean bool2 = true;
    boolean bool1;
    if ((paramFromServiceMsg != null) && (paramFromServiceMsg.getResultCode() == 1000))
    {
      bool1 = true;
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "handle_get_roam_msg_auth_mode isSuccess: " + bool1);
      }
      if (!bool1) {}
    }
    try
    {
      paramToServiceMsg = (oidb_sso.OIDBSSOPkg)new oidb_sso.OIDBSSOPkg().mergeFrom((byte[])paramObject);
      paramFromServiceMsg = ByteBuffer.wrap(bytes_bodybuffer.get().toByteArray());
      if ((paramToServiceMsg == null) || (!uint32_result.has())) {
        break label481;
      }
      i = uint32_result.get();
    }
    catch (Exception paramToServiceMsg)
    {
      for (;;)
      {
        int i;
        long l;
        int j;
        int k;
        int m;
        label321:
        if (QLog.isColorLevel())
        {
          QLog.d("Q.roammsg", 2, "handle_get_roam_msg_auth_mode exception: " + paramToServiceMsg.getMessage());
          continue;
          i = -1;
          continue;
          i = 0;
          continue;
          i += 1;
        }
      }
    }
    if (i == 0)
    {
      l = paramFromServiceMsg.getInt();
      paramFromServiceMsg.get();
      j = paramFromServiceMsg.getShort();
      if (!QLog.isColorLevel()) {
        break label487;
      }
      QLog.d("Q.roammsg", 2, "handle_get_roam_msg_auth_mode, request success, tlvCount = " + j);
      break label487;
      if ((paramFromServiceMsg.hasRemaining()) && (i < j))
      {
        k = paramFromServiceMsg.getShort();
        m = paramFromServiceMsg.getShort();
        if (QLog.isColorLevel()) {
          QLog.d("Q.roammsg", 2, "handle_get_roam_msg_auth_mode, TLV type: " + k + ",legnth: " + m);
        }
        if (k != 41813) {
          break label370;
        }
        i = paramFromServiceMsg.getShort();
        paramToServiceMsg = (MessageRoamManager)b.getManager(91);
        if (paramToServiceMsg != null) {
          paramToServiceMsg.c(i);
        }
        if (QLog.isColorLevel())
        {
          paramFromServiceMsg = new StringBuilder().append("handle_get_roam_msg_auth_mode authMode is :").append(i).append(", manager is null: ");
          if (paramToServiceMsg != null) {
            break label364;
          }
          bool1 = bool2;
          QLog.i("Q.roammsg", 2, bool1);
        }
      }
    }
    for (;;)
    {
      paramToServiceMsg = b.a(ChatHistoryForC2C.class);
      if (paramToServiceMsg != null) {
        paramToServiceMsg.sendEmptyMessage(32);
      }
      return;
      bool1 = false;
      break;
      label364:
      bool1 = false;
      break label321;
      label370:
      if (!QLog.isColorLevel()) {
        break label493;
      }
      QLog.i("Q.roammsg", 2, "handle_get_roam_msg_auth_mode TLV error T: " + k);
      break label493;
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "handle_get_roam_msg_auth_mode pkg_result: " + i);
      }
    }
  }
  
  public MessageObserver a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    if (jdField_a_of_type_AndroidUtilSparseArray.get(paramInt) == null)
    {
      nmn localNmn = new nmn(this, paramInt);
      jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, localNmn);
    }
    return (MessageObserver)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
  }
  
  protected Class a()
  {
    return null;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.roammsg", 2, "get_roam_msg_auth_mode begin...");
    }
    oidb_sso.OIDBSSOPkg localOIDBSSOPkg = new oidb_sso.OIDBSSOPkg();
    uint32_command.set(1152);
    uint32_result.set(0);
    uint32_service_type.set(9);
    Object localObject = ByteBuffer.allocate(9);
    ((ByteBuffer)localObject).putInt((int)Long.parseLong(b.a()));
    ((ByteBuffer)localObject).put((byte)0);
    ((ByteBuffer)localObject).putShort((short)1);
    ((ByteBuffer)localObject).putShort((short)41813);
    bytes_bodybuffer.set(ByteStringMicro.copyFrom(((ByteBuffer)localObject).array()));
    localObject = a("OidbSvc.0x480_9");
    ((ToServiceMsg)localObject).putWupBuffer(localOIDBSSOPkg.toByteArray());
    extraData.putBoolean("reqFromMessageRoamHandler", true);
    b((ToServiceMsg)localObject);
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    String str = paramFromServiceMsg.getServiceCmd();
    if (QLog.isColorLevel())
    {
      StringBuilder localStringBuilder = new StringBuilder(128);
      localStringBuilder.append("onReceive success ssoSeq: ").append(paramToServiceMsg.getRequestSsoSeq()).append(", serviceCmd: ").append(str).append(", resultCode: ").append(paramFromServiceMsg.getResultCode());
      QLog.d("Q.roammsg", 2, localStringBuilder.toString());
    }
    if ("OidbSvc.0x42e_3".equals(str)) {
      b(paramToServiceMsg, paramFromServiceMsg, paramObject);
    }
    do
    {
      do
      {
        return;
        if (!"OidbSvc.0x4ff_9".equals(str)) {
          break;
        }
      } while (!extraData.getBoolean("reqFromMessageRoamHandler"));
      c(paramToServiceMsg, paramFromServiceMsg, paramObject);
      return;
    } while ((!"OidbSvc.0x480_9".equals(str)) || (!extraData.getBoolean("reqFromMessageRoamHandler")));
    d(paramToServiceMsg, paramFromServiceMsg, paramObject);
  }
  
  public void a(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    try
    {
      long l = Long.parseLong(paramString);
      paramString = new byte[12];
      PkgTools.a(paramString, 0, l);
      PkgTools.a(paramString, 4, paramInt1);
      PkgTools.a(paramString, 6, paramInt2);
      PkgTools.a(paramString, 8, paramInt3);
      PkgTools.a(paramString, 10, paramInt4);
      paramString = a("OidbSvc.0x42e_3", 1070, 3, paramString);
      extraData.putInt("EndRoamYearKey", paramInt3);
      extraData.putInt("EndRoamMonthKey", paramInt4);
      extraData.putInt("EndRoamDayKey", paramInt5);
      b(paramString);
      return;
    }
    catch (Exception paramString)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("Q.roammsg", 2, "send_oidb_0x42e_3 error: ", paramString);
    }
  }
  
  public void a(String paramString, Calendar paramCalendar, boolean paramBoolean, int paramInt)
  {
    int i = 0;
    if (a(paramString, paramCalendar, paramBoolean, paramInt)) {}
    do
    {
      return;
      paramString = b.a(ChatHistoryForC2C.class);
    } while (paramString == null);
    paramCalendar = paramString.obtainMessage(0);
    paramInt = i;
    if (paramBoolean) {
      paramInt = 1;
    }
    arg1 = paramInt;
    paramString.sendMessageDelayed(paramCalendar, 0L);
  }
  
  public void a(String paramString, Calendar paramCalendar, boolean paramBoolean1, int paramInt, boolean paramBoolean2)
  {
    MessageRoamManager localMessageRoamManager = (MessageRoamManager)b.getManager(91);
    SharedPreferences localSharedPreferences = b.a().getSharedPreferences("vip_message_roam_passwordmd5_and_signature_file", 0);
    long l1;
    if (localMessageRoamManager.b() == 0)
    {
      l1 = localSharedPreferences.getLong("vip_message_roam_last_request_timestamp" + b.a(), 0L);
      if ((System.currentTimeMillis() - l1 > 7200000L) || (l1 == 0L))
      {
        paramString = b.a(ChatHistoryForC2C.class);
        paramString.sendMessageDelayed(paramString.obtainMessage(3), 0L);
      }
    }
    do
    {
      return;
      paramCalendar = localMessageRoamManager.a((Calendar)paramCalendar.clone());
      l1 = ((Long)first).longValue();
      long l2 = ((Long)second).longValue();
      b.a().a(paramString, l1, 0L, l2, (short)0, 0L, 1, localMessageRoamManager.b(), localMessageRoamManager.b(), paramBoolean1, paramInt, paramBoolean2);
    } while (localMessageRoamManager.b() != 0);
    paramString = localSharedPreferences.edit();
    paramString.putLong("vip_message_roam_last_request_timestamp" + b.a(), System.currentTimeMillis());
    paramString.commit();
  }
  
  public void a(short paramShort)
  {
    try
    {
      long l = Long.parseLong(b.getAccount());
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "set_roam_message_auth_mode_0x4ff_9  authMode: " + paramShort);
      }
      Object localObject = new byte[13];
      PkgTools.a((byte[])localObject, 0, l);
      localObject[4] = 0;
      PkgTools.a((byte[])localObject, 5, (short)1);
      PkgTools.a((byte[])localObject, 7, 41813);
      PkgTools.a((byte[])localObject, 9, (short)2);
      PkgTools.a((byte[])localObject, 11, paramShort);
      localObject = a("OidbSvc.0x4ff_9", 1279, 9, (byte[])localObject);
      extraData.putBoolean("reqFromMessageRoamHandler", true);
      extraData.putShort("authMode", paramShort);
      b((ToServiceMsg)localObject);
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.w("Q.roammsg", 2, "set_roam_message_auth_mode_0x4ff_9  error", localException);
    }
  }
  
  public void a(short paramShort, byte paramByte)
  {
    b.a().a(paramShort, paramByte);
  }
  
  protected boolean a(String paramString)
  {
    if (jdField_a_of_type_JavaUtilSet == null)
    {
      jdField_a_of_type_JavaUtilSet = new HashSet();
      jdField_a_of_type_JavaUtilSet.add("OidbSvc.0x42e_3");
      jdField_a_of_type_JavaUtilSet.add("OidbSvc.0x4ff_9");
      jdField_a_of_type_JavaUtilSet.add("OidbSvc.0x480_9");
    }
    return !jdField_a_of_type_JavaUtilSet.contains(paramString);
  }
  
  public boolean a(String paramString, Calendar paramCalendar, boolean paramBoolean, int paramInt)
  {
    MessageRoamManager localMessageRoamManager = (MessageRoamManager)b.getManager(91);
    Object localObject = localMessageRoamManager.a(paramCalendar);
    if (localObject == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "fetchMoreRoamMessage next date is null");
      }
      return false;
    }
    paramCalendar = ((Bundle)localObject).getString("MSG_TYPE");
    int i = ((Bundle)localObject).getInt("DATE_YEAR");
    int j = ((Bundle)localObject).getInt("DATE_MONTH");
    int k = ((Bundle)localObject).getInt("DATE_DAY");
    localObject = Calendar.getInstance();
    ((Calendar)localObject).set(1, i);
    ((Calendar)localObject).set(2, j - 1);
    ((Calendar)localObject).set(5, k);
    ((Calendar)localObject).set(11, 0);
    ((Calendar)localObject).set(12, 0);
    ((Calendar)localObject).set(13, 0);
    ((Calendar)localObject).set(14, 0);
    if ("server".equals(paramCalendar))
    {
      localMessageRoamManager.a((Calendar)localObject);
      a(paramString, (Calendar)localObject, paramBoolean, paramInt, false);
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "fetchMoreRoamMessage from server date: " + i + "-" + j + "-" + k + ", fetchNum: " + paramInt);
      }
      return true;
    }
    if ("local".equals(paramCalendar))
    {
      localMessageRoamManager.a((Calendar)localObject);
      paramCalendar = localMessageRoamManager.a((Calendar)((Calendar)localObject).clone());
      int m = localMessageRoamManager.a(paramString, ((Long)first).longValue(), ((Long)second).longValue());
      if (QLog.isColorLevel()) {
        QLog.d("Q.roammsg", 2, "fetchMoreRoamMessage from local date: " + i + "-" + j + "-" + k + ",msgcount: " + m + ", fetchNum: " + (paramInt - m));
      }
      if ((m >= 0) && (m < paramInt)) {
        return a(paramString, (Calendar)localObject, paramBoolean, paramInt - m);
      }
      return false;
    }
    return false;
  }
  
  public MessageObserver b(int paramInt)
  {
    MessageObserver localMessageObserver = (MessageObserver)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    jdField_a_of_type_AndroidUtilSparseArray.remove(paramInt);
    return localMessageObserver;
  }
}
