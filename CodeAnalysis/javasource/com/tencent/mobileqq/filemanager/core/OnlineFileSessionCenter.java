package com.tencent.mobileqq.filemanager.core;

import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Looper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.app.FMObserver;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.FileManagerProxy;
import com.tencent.mobileqq.filemanager.data.OnlineFileSessionInfo;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter.fileAssistantReportData;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.transfile.BuddyTransfileProcessor;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import ota;
import otb;
import otc;
import otd;
import ote;
import otf;

public class OnlineFileSessionCenter
{
  public static final int a = 1;
  public static final String a = "OnlineFileSessionCenter<FileAssistant>";
  public static final int b = 2;
  public static final int c = 3;
  public static final int d = 4;
  public static final int e = 5;
  public static final int f = 10;
  public static final int g = 11;
  public static final int h = 12;
  private long jdField_a_of_type_Long;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  public Handler a;
  QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private FMObserver jdField_a_of_type_ComTencentMobileqqFilemanagerAppFMObserver;
  LinkedHashMap jdField_a_of_type_JavaUtilLinkedHashMap;
  private otf jdField_a_of_type_Otf;
  private LinkedHashMap b;
  
  public OnlineFileSessionCenter(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    jdField_a_of_type_ComTencentMobileqqFilemanagerAppFMObserver = new otb(this);
    jdField_a_of_type_Otf = null;
    jdField_a_of_type_AndroidOsHandler = null;
    b = new LinkedHashMap();
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    paramQQAppInterface.a().addObserver(jdField_a_of_type_ComTencentMobileqqFilemanagerAppFMObserver);
    jdField_a_of_type_AndroidContentBroadcastReceiver = new ota(this);
    try
    {
      IntentFilter localIntentFilter = new IntentFilter("com.tencent.mobileqq.intent.logout");
      paramQQAppInterface.a().registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
      return;
    }
    catch (Exception paramQQAppInterface)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 2, paramQQAppInterface.toString());
    }
  }
  
  public OnlineFileSessionWorker a(long paramLong)
  {
    OnlineFileSessionWorker localOnlineFileSessionWorker3 = (OnlineFileSessionWorker)jdField_a_of_type_JavaUtilLinkedHashMap.get(Long.valueOf(paramLong));
    OnlineFileSessionWorker localOnlineFileSessionWorker1 = localOnlineFileSessionWorker3;
    if (localOnlineFileSessionWorker3 == null)
    {
      FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
      localOnlineFileSessionWorker1 = localOnlineFileSessionWorker3;
      if (localFileManagerEntity != null)
      {
        localOnlineFileSessionWorker1 = new OnlineFileSessionWorker(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId);
        localOnlineFileSessionWorker1.a(localFileManagerEntity);
      }
    }
    try
    {
      jdField_a_of_type_JavaUtilLinkedHashMap.put(Long.valueOf(paramLong), localOnlineFileSessionWorker1);
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong))
      {
        QLog.w("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] getOnlineWorker, but user had deleted it, return null");
        if (localOnlineFileSessionWorker1 != null)
        {
          localOnlineFileSessionWorker1.n();
          c(paramLong);
        }
        return null;
      }
    }
    finally {}
    if (localOnlineFileSessionWorker2 != null) {
      localOnlineFileSessionWorker2.k();
    }
    b();
    return localOnlineFileSessionWorker2;
  }
  
  OnlineFileSessionWorker a(String paramString, long paramLong)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      return null;
    }
    Object localObject = jdField_a_of_type_JavaUtilLinkedHashMap.values().iterator();
    OnlineFileSessionWorker localOnlineFileSessionWorker;
    do
    {
      if (!((Iterator)localObject).hasNext()) {
        break;
      }
      localOnlineFileSessionWorker = (OnlineFileSessionWorker)((Iterator)localObject).next();
    } while ((localOnlineFileSessionWorker == null) || (a == null) || (!paramString.equalsIgnoreCase(a.peerUin)) || (paramLong != a.nOLfileSessionId));
    for (;;)
    {
      if (localOnlineFileSessionWorker == null)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramLong);
        if (localObject == null) {
          break label261;
        }
        paramLong = nSessionId;
        paramString = new OnlineFileSessionWorker(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId);
        paramString.a((FileManagerEntity)localObject);
      }
      for (;;)
      {
        try
        {
          jdField_a_of_type_JavaUtilLinkedHashMap.put(Long.valueOf(paramLong), paramString);
          if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong)) {
            break label247;
          }
          QLog.w("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] getOnlineWorker, but user had deleted it, return null");
          if (paramString != null)
          {
            paramString.n();
            c(paramLong);
          }
          return null;
        }
        finally {}
        if (a != null)
        {
          paramLong = a.nSessionId;
          paramString = localOnlineFileSessionWorker;
          continue;
          label247:
          if (paramString != null) {
            paramString.k();
          }
          b();
          return paramString;
        }
        else
        {
          label261:
          paramString = localOnlineFileSessionWorker;
          paramLong = 0L;
        }
      }
      localOnlineFileSessionWorker = null;
    }
  }
  
  public void a()
  {
    c();
    Iterator localIterator = jdField_a_of_type_JavaUtilLinkedHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      ((OnlineFileSessionWorker)localEntry.getValue()).n();
      long l = ((Long)localEntry.getKey()).longValue();
      int i = jdField_a_of_type_JavaUtilLinkedHashMap.size();
      localIterator.remove();
      QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + l + "]. stop. and remove the worker..[" + i + " - " + jdField_a_of_type_JavaUtilLinkedHashMap.size() + "]");
    }
  }
  
  public void a(int paramInt)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilLinkedHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      OnlineFileSessionWorker localOnlineFileSessionWorker = (OnlineFileSessionWorker)localEntry.getValue();
      localOnlineFileSessionWorker.b(paramInt);
      if (localOnlineFileSessionWorker.c())
      {
        long l = ((Long)localEntry.getKey()).longValue();
        localIterator.remove();
        QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + l + "]. remove the worker....");
      }
    }
    a();
  }
  
  public void a(long paramLong)
  {
    if (0L == paramLong) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] PauseTrans sessionid error.return");
    }
    OnlineFileSessionWorker localOnlineFileSessionWorker;
    do
    {
      return;
      localOnlineFileSessionWorker = a(paramLong);
      if (localOnlineFileSessionWorker == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.PauseTrans");
        return;
      }
      localOnlineFileSessionWorker.f();
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong))
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] had be deleted by user. stop it");
        localOnlineFileSessionWorker.n();
      }
    } while (!localOnlineFileSessionWorker.c());
    c(paramLong);
  }
  
  public void a(String paramString, long paramLong)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onSenderCancelUpload sessionid error.return");
    }
    OnlineFileSessionWorker localOnlineFileSessionWorker;
    do
    {
      do
      {
        return;
        localOnlineFileSessionWorker = a(paramString, paramLong);
        if (localOnlineFileSessionWorker != null) {
          break;
        }
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onSenderCancelUpload");
      } while (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramLong));
      a(paramString, paramLong, new ote(this, 10));
      return;
      localOnlineFileSessionWorker.e();
    } while (!localOnlineFileSessionWorker.c());
    c(h);
  }
  
  public void a(String paramString, long paramLong, int paramInt)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onFileRequestBeHandledByPC sessionid error.return");
    }
    OnlineFileSessionWorker localOnlineFileSessionWorker;
    do
    {
      do
      {
        return;
        localOnlineFileSessionWorker = a(paramString, paramLong);
        if (localOnlineFileSessionWorker != null) {
          break;
        }
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onFileRequestBeHandledByPC");
      } while (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramLong));
      a(paramString, paramLong, new ote(this, paramInt));
      return;
      localOnlineFileSessionWorker.a(paramInt);
    } while (!localOnlineFileSessionWorker.c());
    c(h);
  }
  
  public void a(String paramString, long paramLong, int paramInt1, int paramInt2)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onSenderUploadProgressNotify sessionid error.return");
    }
    do
    {
      return;
      paramString = a(paramString, paramLong);
      if (paramString == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onSenderUploadProgressNotify");
        return;
      }
      paramString.a(paramInt1, paramInt2);
    } while (!paramString.c());
    c(h);
  }
  
  public void a(String paramString1, long paramLong, int paramInt, String paramString2)
  {
    if ((paramString1 == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onSenderUploadException sessionid error.return");
    }
    Object localObject;
    do
    {
      do
      {
        return;
        localObject = a(paramString1, paramLong);
        if (localObject != null) {
          break;
        }
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onSenderUploadException");
      } while (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramLong));
      localObject = new ote(this, 12);
      jdField_b_of_type_Int = paramInt;
      jdField_a_of_type_JavaLangString = paramString2;
      a(paramString1, paramLong, (ote)localObject);
      return;
      ((OnlineFileSessionWorker)localObject).a(paramInt, paramString2);
    } while (!((OnlineFileSessionWorker)localObject).c());
    c(h);
  }
  
  public void a(String paramString1, long paramLong1, int paramInt, String paramString2, long paramLong2)
  {
    if ((paramString1 == null) || (paramLong1 <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong1 + "]onSenderUploadCompleted  sessionid error.return");
    }
    Object localObject;
    do
    {
      do
      {
        return;
        localObject = a(paramString1, paramLong1);
        if (localObject != null) {
          break;
        }
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong1 + "]. not find worker.onSenderUploadCompleted");
      } while (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramLong1));
      localObject = new ote(this, 11);
      jdField_b_of_type_Int = paramInt;
      jdField_a_of_type_JavaLangString = paramString2;
      jdField_b_of_type_Long = paramLong2;
      a(paramString1, paramLong1, (ote)localObject);
      return;
      if (!((OnlineFileSessionWorker)localObject).a(paramInt, paramString2, paramLong2)) {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong1 + "] upload competed. but onlineworker handle failed!!!!");
      }
    } while (!((OnlineFileSessionWorker)localObject).c());
    c(h);
  }
  
  void a(String paramString, long paramLong, ote paramOte)
  {
    if ((paramString == null) || (paramLong <= 0L) || (paramOte == null)) {
      return;
    }
    QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]  cacheHandleBeforeRequest handleType:" + jdField_a_of_type_Int + " info_1:" + jdField_b_of_type_Int + " info_2:" + jdField_a_of_type_JavaLangString + " info_3:" + jdField_b_of_type_Long);
    LinkedHashMap localLinkedHashMap = (LinkedHashMap)b.get(paramString);
    if (localLinkedHashMap == null)
    {
      localLinkedHashMap = new LinkedHashMap();
      localLinkedHashMap.put(Long.valueOf(paramLong), paramOte);
      b.put(paramString, localLinkedHashMap);
      return;
    }
    localLinkedHashMap.put(Long.valueOf(paramLong), paramOte);
  }
  
  public void a(String paramString, long paramLong, boolean paramBoolean)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onRecvOnLineFileResult sessionid error.return");
    }
    do
    {
      return;
      paramString = a(paramString, paramLong);
      if (paramString == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onRecvOnLineFileResult");
        return;
      }
      paramString.a(paramBoolean);
    } while (!paramString.c());
    c(h);
  }
  
  public void a(String paramString1, String paramString2, long paramLong1, short paramShort, boolean paramBoolean, int paramInt1, String paramString3, OnlineFileSessionInfo paramOnlineFileSessionInfo, long paramLong2, int paramInt2)
  {
    if (paramOnlineFileSessionInfo == null)
    {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession. request come,but session = null");
      return;
    }
    if (0L == jdField_b_of_type_Long)
    {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + jdField_b_of_type_Long + "]  onFileRequestCome sessionid error.return");
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, jdField_b_of_type_Long) != null)
    {
      QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + jdField_b_of_type_Long + "] request come filename:" + jdField_a_of_type_JavaLangString + ", but is repeat session and return");
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, jdField_b_of_type_Long))
    {
      QLog.w("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + jdField_b_of_type_Long + "] request come filename:" + jdField_a_of_type_JavaLangString + "but it had be deleted by user");
      return;
    }
    String str = TransfileUtile.a(BuddyTransfileProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), jdField_a_of_type_JavaLangString, 0, null), jdField_a_of_type_Long, 0, false, null);
    long l = a64536uniseq;
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l, paramString1, 0);
    uniseq = l;
    selfUin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    localFileManagerEntity.setCloudType(0);
    fileName = jdField_a_of_type_JavaLangString;
    fileSize = jdField_a_of_type_Long;
    nOpType = -1;
    peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, null, 0);
    peerType = 0;
    peerUin = paramString1;
    srvTime = (1000L * paramLong1);
    status = 4;
    Uuid = null;
    isReaded = paramBoolean;
    bSend = false;
    nFileType = -1;
    nOLfileSessionId = jdField_b_of_type_Long;
    QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + jdField_b_of_type_Long + "] - nSessionId[" + nSessionId + "] request come filename:" + jdField_a_of_type_JavaLangString);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramString2, false, jdField_a_of_type_JavaLangString, jdField_a_of_type_Long, false, 0, str, paramShort, paramShort, paramString3, paramInt1, l, nSessionId, paramLong2, paramLong1, paramInt2);
    if (QLog.isColorLevel()) {
      QLog.i("OnlineFileSessionCenter<FileAssistant>", 2, "File Coming:" + FileManagerUtil.a(localFileManagerEntity));
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l, nSessionId, paramString1, 0, 17, null, 0, null);
    if (!paramString1.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a())) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1, true, true);
    }
    paramString2 = new OnlineFileSessionWorker(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId);
    paramString2.a(localFileManagerEntity);
    do
    {
      try
      {
        jdField_a_of_type_JavaUtilLinkedHashMap.put(Long.valueOf(nSessionId), paramString2);
        paramString2.k();
        if (paramString2.c())
        {
          c(nSessionId);
          b();
          return;
        }
      }
      finally {}
    } while (!a(paramString1, jdField_b_of_type_Long));
    QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + jdField_b_of_type_Long + "] had be handled before request come");
  }
  
  public boolean a(long paramLong)
  {
    boolean bool1 = false;
    if (0L == paramLong) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] recvOnLineFile sessionid error.return");
    }
    OnlineFileSessionWorker localOnlineFileSessionWorker;
    boolean bool2;
    do
    {
      return bool1;
      localOnlineFileSessionWorker = a(paramLong);
      if (localOnlineFileSessionWorker == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.recvOnLineFile");
        return false;
      }
      FileManagerReporter.fileAssistantReportData localFileAssistantReportData = new FileManagerReporter.fileAssistantReportData();
      b = "recv_file_online";
      FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), localFileAssistantReportData);
      bool2 = localOnlineFileSessionWorker.d();
      bool1 = bool2;
    } while (!localOnlineFileSessionWorker.c());
    c(paramLong);
    return bool2;
  }
  
  public boolean a(FileManagerEntity paramFileManagerEntity)
  {
    boolean bool = true;
    if (paramFileManagerEntity.getCloudType() != 0) {}
    do
    {
      do
      {
        return false;
        switch (status)
        {
        case -1: 
        case 1: 
        case 2: 
        case 3: 
        case 4: 
        case 9: 
        case 12: 
        case 13: 
        default: 
          return false;
        case 0: 
          return true;
        }
      } while (13 != nOpType);
      return true;
    } while (10 == nOpType);
    return true;
    if (13 == nOpType) {}
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  boolean a(String paramString, long paramLong)
  {
    boolean bool2;
    if ((paramString == null) || (paramLong <= 0L))
    {
      bool2 = false;
      return bool2;
    }
    LinkedHashMap localLinkedHashMap = (LinkedHashMap)b.get(paramString);
    Object localObject;
    boolean bool1;
    if (localLinkedHashMap != null)
    {
      localObject = (ote)localLinkedHashMap.get(Long.valueOf(paramLong));
      if (localObject != null)
      {
        QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]  isBeHandledBeforeRequest handleType:" + jdField_a_of_type_Int + " info_1:" + jdField_b_of_type_Int + " info_2:" + jdField_a_of_type_JavaLangString + " info_3:" + jdField_b_of_type_Long);
        switch (jdField_a_of_type_Int)
        {
        case 6: 
        case 7: 
        case 8: 
        case 9: 
        default: 
          bool1 = false;
          localLinkedHashMap.remove(Long.valueOf(paramLong));
          if (localLinkedHashMap.size() == 0) {
            b.remove(paramString);
          }
          break;
        }
      }
    }
    for (;;)
    {
      paramLong = MessageCache.a();
      bool2 = bool1;
      if (paramLong - jdField_a_of_type_Long < 3600L) {
        break;
      }
      QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[]  isBeHandledBeforeRequest handleType. start clear something");
      jdField_a_of_type_Long = paramLong;
      bool2 = bool1;
      if (b.size() <= 0) {
        break;
      }
      paramString = b.entrySet().iterator();
      for (;;)
      {
        bool2 = bool1;
        if (!paramString.hasNext()) {
          break;
        }
        localLinkedHashMap = (LinkedHashMap)((Map.Entry)paramString.next()).getValue();
        if ((localLinkedHashMap != null) && (localLinkedHashMap.size() > 0))
        {
          localObject = localLinkedHashMap.entrySet().iterator();
          for (;;)
          {
            if (!((Iterator)localObject).hasNext()) {
              break label597;
            }
            Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
            ote localOte = (ote)localEntry.getValue();
            long l = ((Long)localEntry.getKey()).longValue();
            if (localOte != null)
            {
              if (paramLong - jdField_a_of_type_Long < 7200L) {
                continue;
              }
              QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + l + "]  isBeHandledBeforeRequest and clear it.handleType:" + jdField_a_of_type_Int + " info_1:" + jdField_b_of_type_Int + " info_2:" + jdField_a_of_type_JavaLangString + " info_3:" + jdField_b_of_type_Long);
              ((Iterator)localObject).remove();
              continue;
              a(paramString, paramLong, jdField_a_of_type_Int);
              bool1 = true;
              break;
              a(paramString, paramLong);
              bool1 = true;
              break;
              a(paramString, paramLong, jdField_b_of_type_Int, jdField_a_of_type_JavaLangString, jdField_b_of_type_Long);
              bool1 = true;
              break;
              a(paramString, paramLong, jdField_b_of_type_Int, jdField_a_of_type_JavaLangString);
              bool1 = true;
              break;
            }
            ((Iterator)localObject).remove();
          }
          label597:
          if (localLinkedHashMap.size() == 0) {
            paramString.remove();
          }
        }
        else
        {
          paramString.remove();
        }
      }
      bool1 = false;
    }
  }
  
  void b()
  {
    if (jdField_a_of_type_AndroidOsHandler == null) {
      jdField_a_of_type_AndroidOsHandler = new otd(this, Looper.getMainLooper());
    }
    if (jdField_a_of_type_Otf == null)
    {
      jdField_a_of_type_Otf = new otf(this, null);
      jdField_a_of_type_Otf.a();
      QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[] start progress make pump thread!!!");
    }
  }
  
  public void b(int paramInt)
  {
    QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession onNeworkChanged set failed");
    Looper localLooper = Looper.getMainLooper();
    if (Thread.currentThread() != localLooper.getThread())
    {
      new Handler(localLooper).post(new otc(this, paramInt));
      return;
    }
    a(paramInt);
  }
  
  public void b(long paramLong)
  {
    if (0L == paramLong) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] ResumeTrans sessionid error.return");
    }
    OnlineFileSessionWorker localOnlineFileSessionWorker;
    do
    {
      return;
      localOnlineFileSessionWorker = a(paramLong);
      if (localOnlineFileSessionWorker == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.ResumeTrans");
        return;
      }
      localOnlineFileSessionWorker.g();
    } while (!localOnlineFileSessionWorker.c());
    c(paramLong);
  }
  
  public void b(String paramString, long paramLong)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onSenderReplayComeOnRecv sessionid error.return");
    }
    do
    {
      return;
      paramString = a(paramString, paramLong);
      if (paramString == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onSenderReplayComeOnRecv");
        return;
      }
      paramString.i();
    } while (!paramString.c());
    c(h);
  }
  
  public void b(String paramString, long paramLong, boolean paramBoolean)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onAskSenderUpProgressResult sessionid error.return");
    }
    do
    {
      return;
      paramString = a(paramString, paramLong);
      if (paramString == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onAskSenderUpProgressResult");
        return;
      }
      paramString.b(paramBoolean);
    } while (!paramString.c());
    c(h);
  }
  
  void c()
  {
    if (jdField_a_of_type_Otf != null)
    {
      jdField_a_of_type_Otf.b();
      jdField_a_of_type_Otf = null;
      QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[] stop progress make pump thread!!!");
    }
  }
  
  public void c(long paramLong)
  {
    try
    {
      jdField_a_of_type_JavaUtilLinkedHashMap.remove(Long.valueOf(paramLong));
      QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. remove the worker");
      return;
    }
    finally {}
  }
  
  public void c(String paramString, long paramLong)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "] onAskUpProgressAndSessionInvaid sessionid error.return");
    }
    do
    {
      return;
      paramString = a(paramString, paramLong);
      if (paramString == null)
      {
        QLog.e("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + paramLong + "]. not find worker.onAskUpProgressAndSessionInvaid");
        return;
      }
      paramString.m();
    } while (!paramString.c());
    c(h);
  }
  
  public void d()
  {
    long l1 = System.currentTimeMillis();
    Iterator localIterator = jdField_a_of_type_JavaUtilLinkedHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      OnlineFileSessionWorker localOnlineFileSessionWorker = (OnlineFileSessionWorker)localEntry.getValue();
      localOnlineFileSessionWorker.b(l1);
      if (localOnlineFileSessionWorker.c())
      {
        long l2 = ((Long)localEntry.getKey()).longValue();
        int i = jdField_a_of_type_JavaUtilLinkedHashMap.size();
        localIterator.remove();
        QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[" + l2 + "]. remove the worker..[" + i + " - " + jdField_a_of_type_JavaUtilLinkedHashMap.size() + "]");
      }
    }
    if (jdField_a_of_type_JavaUtilLinkedHashMap.size() == 0) {
      c();
    }
  }
  
  public void d(long paramLong)
  {
    try
    {
      OnlineFileSessionWorker localOnlineFileSessionWorker = (OnlineFileSessionWorker)jdField_a_of_type_JavaUtilLinkedHashMap.get(Long.valueOf(paramLong));
      if (localOnlineFileSessionWorker != null) {
        localOnlineFileSessionWorker.n();
      }
      c(paramLong);
      return;
    }
    finally {}
  }
  
  public void e()
  {
    QLog.i("OnlineFileSessionCenter<FileAssistant>", 1, "OLfilesession[]  clearHistory. session center stop. . .");
    a();
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
    {
      if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) && (jdField_a_of_type_AndroidContentBroadcastReceiver != null))
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
        jdField_a_of_type_AndroidContentBroadcastReceiver = null;
      }
      if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) && (jdField_a_of_type_ComTencentMobileqqFilemanagerAppFMObserver != null)) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().deleteObserver(jdField_a_of_type_ComTencentMobileqqFilemanagerAppFMObserver);
      }
    }
  }
  
  protected void finalize()
  {
    a();
    super.finalize();
  }
}
