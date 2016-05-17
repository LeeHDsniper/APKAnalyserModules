package com.tencent.mobileqq.filemanager.core;

import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.TransFileInfo;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.FileManagerProxy;
import com.tencent.mobileqq.filemanager.util.FileCategoryUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.service.MobileQQService;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import osb;

public class FileManagerDataCenter
{
  static final String jdField_a_of_type_JavaLangString = "FileManagerDataCenter<FileAssistant>";
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private FilePreViewControllerBase jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFilePreViewControllerBase;
  
  public FileManagerDataCenter(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentBroadcastReceiver = null;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFilePreViewControllerBase = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  private TransFileInfo a(MessageRecord paramMessageRecord)
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramMessageRecord != null)
    {
      localObject1 = localObject2;
      if (localEntityManager != null) {
        localObject1 = (TransFileInfo)localEntityManager.a(TransFileInfo.class, new String[] { String.valueOf(time), String.valueOf(msgseq), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), frienduin });
      }
    }
    if ((localObject1 == null) && (paramMessageRecord != null) && (QLog.isColorLevel())) {
      QLog.e("FileManagerDataCenter<FileAssistant>", 2, "get TransferInfo null, time[" + String.valueOf(time) + "],msgseq[" + String.valueOf(msgseq) + "],uin[" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "], frienduin[" + frienduin + "]");
    }
    return localObject1;
  }
  
  public int a(String paramString1, int paramInt1, String paramString2, long paramLong, int paramInt2, String paramString3, Bundle paramBundle)
  {
    int i = -1;
    if (paramString2 == null) {
      paramInt1 = i;
    }
    for (;;)
    {
      try
      {
        if (QLog.isColorLevel())
        {
          QLog.e("FileManagerDataCenter<FileAssistant>", 2, " insertExternalFileToFM. sourceId:" + paramInt2);
          paramInt1 = i;
        }
        return paramInt1;
      }
      finally {}
      if ((paramInt2 < 14) || (paramInt2 > 40))
      {
        paramInt1 = i;
        if (QLog.isColorLevel())
        {
          QLog.e("FileManagerDataCenter<FileAssistant>", 2, " insertExternalFileToFM. error sourceId:" + paramInt2);
          paramInt1 = i;
        }
      }
      else
      {
        if (QLog.isColorLevel()) {
          QLog.i("FileManagerDataCenter<FileAssistant>", 2, " insertExternalFileToFM. filePath:" + paramString2 + " size:" + paramLong + " sourceId:" + paramInt2);
        }
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null)
        {
          if (QLog.isColorLevel()) {
            QLog.e("FileManagerDataCenter<FileAssistant>", 2, " insertExternalFileToFM. but app = null");
          }
        }
        else
        {
          long l = a64536uniseq;
          paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l, AppConstants.ae, 0);
          if (paramString1 == null)
          {
            if (!QLog.isColorLevel()) {
              break label415;
            }
            QLog.e("FileManagerDataCenter<FileAssistant>", 2, " insertExternalFileToFM. but entry = null");
            break label415;
          }
          paramString1.setCloudType(3);
          fileName = FileManagerUtil.a(paramString2);
          if (0L == paramLong) {}
          for (fileSize = FileManagerUtil.a(paramString2);; fileSize = paramLong)
          {
            paramString1.setFilePath(paramString2);
            nOpType = paramInt2;
            peerNick = null;
            peerType = 0;
            peerUin = AppConstants.ae;
            srvTime = (MessageCache.a() * 1000L);
            status = 1;
            Uuid = null;
            isReaded = true;
            bSend = false;
            if (paramBundle != null)
            {
              paramString3 = paramBundle.getString("FILE_TMP_SERVER_PATH");
              if (!TextUtils.isEmpty(paramString3))
              {
                status = 1;
                strServerPath = paramString3;
                bDelInAio = true;
              }
              paramInt1 = paramBundle.getInt("FILE_FROM", -1);
              if (paramInt1 != -1) {
                nOpType = paramInt1;
              }
            }
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1);
            FileManagerUtil.c(paramString2);
            paramInt1 = 0;
            break;
          }
        }
        paramInt1 = -2;
        continue;
        label415:
        paramInt1 = -3;
      }
    }
  }
  
  public long a(int paramInt, long paramLong1, long paramLong2, long paramLong3, long paramLong4)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramInt, paramLong1, paramLong2, paramLong3, paramLong4);
  }
  
  public long a(String paramString, long paramLong1, long paramLong2, int paramInt)
  {
    if (paramLong1 <= 0L) {
      return 0L;
    }
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    if (QLog.isColorLevel()) {
      QLog.d("FileManagerDataCenter<FileAssistant>", 2, "strUin[" + FileManagerUtil.e(paramString) + "], peeryType[" + String.valueOf(paramInt) + "], uniseq[" + String.valueOf(paramLong2) + "]");
    }
    MessageRecord localMessageRecord = null;
    if (paramLong2 > 0L) {
      localMessageRecord = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString, paramInt, paramLong2);
    }
    if ((localMessageRecord != null) && (localEntityManager != null))
    {
      paramString = (TransFileInfo)localEntityManager.a(TransFileInfo.class, new String[] { String.valueOf(time), String.valueOf(msgseq), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramString });
      if (paramString == null) {}
    }
    for (paramLong1 = transferedSize * 100L / paramLong1;; paramLong1 = 0L)
    {
      localEntityManager.a();
      return paramLong1;
    }
  }
  
  public long a(String paramString1, String paramString2, int paramInt1, int paramInt2, long paramLong1, long paramLong2, String paramString3)
  {
    MessageRecord localMessageRecord = MessageRecordFactory.a(paramInt2);
    selfuin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    frienduin = paramString1;
    senderuin = paramString2;
    msg = paramString3;
    msgtype = paramInt2;
    isread = true;
    if (paramString2.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount())) {}
    for (paramInt2 = 1;; paramInt2 = 0)
    {
      issend = paramInt2;
      istroop = paramInt1;
      msgseq = paramLong1;
      shmsgseq = paramLong1;
      msgUid = paramLong2;
      time = MessageCache.a();
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageRecord, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      QLog.i("FileManagerDataCenter<FileAssistant>", 1, "Inser msg to AIO, msgInfo: mrUinseq[" + String.valueOf(uniseq) + "], selfuin[" + FileManagerUtil.e(selfuin) + "], frienduin[" + FileManagerUtil.e(frienduin) + "], senderuin[" + FileManagerUtil.e(senderuin) + "], issend[" + String.valueOf(issend) + "], istroop[" + String.valueOf(istroop) + "], shmsgseq[" + String.valueOf(shmsgseq) + "], msgUid[" + String.valueOf(msgUid) + "], time[" + String.valueOf(time) + "]");
      return uniseq;
    }
  }
  
  public long a(String paramString1, String paramString2, int paramInt1, int paramInt2, String paramString3)
  {
    MessageRecord localMessageRecord = MessageRecordFactory.a(paramInt2);
    selfuin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    frienduin = paramString1;
    senderuin = paramString2;
    msg = paramString3;
    msgtype = paramInt2;
    isread = true;
    if (paramString2.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount())) {}
    for (paramInt2 = 1;; paramInt2 = 0)
    {
      issend = paramInt2;
      istroop = paramInt1;
      paramInt1 = MobileQQService.c;
      MobileQQService.c = paramInt1 + 1;
      msgseq = paramInt1;
      shmsgseq = Math.abs(new Random().nextInt());
      msgUid = FileManagerUtil.b();
      time = MessageCache.a();
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageRecord, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      QLog.i("FileManagerDataCenter<FileAssistant>", 1, "Inser msg to AIO, msgInfo: mrUinseq[" + String.valueOf(uniseq) + "], selfuin[" + FileManagerUtil.e(selfuin) + "], frienduin[" + FileManagerUtil.e(frienduin) + "], senderuin[" + FileManagerUtil.e(senderuin) + "], issend[" + String.valueOf(issend) + "], istroop[" + String.valueOf(istroop) + "], shmsgseq[" + String.valueOf(shmsgseq) + "], msgUid[" + String.valueOf(msgUid) + "], time[" + String.valueOf(time) + "]");
      return uniseq;
    }
  }
  
  public long a(String paramString1, String paramString2, boolean paramBoolean1, String paramString3, long paramLong1, boolean paramBoolean2, int paramInt1, String paramString4, long paramLong2, long paramLong3, String paramString5, int paramInt2, long paramLong4, long paramLong5, long paramLong6, long paramLong7)
  {
    return a(paramString1, paramString2, paramBoolean1, paramString3, paramLong1, paramBoolean2, paramInt1, paramString4, paramLong2, paramLong3, paramString5, paramInt2, paramLong4, paramLong5, paramLong6, paramLong7, -1);
  }
  
  public long a(String paramString1, String paramString2, boolean paramBoolean1, String paramString3, long paramLong1, boolean paramBoolean2, int paramInt1, String paramString4, long paramLong2, long paramLong3, String paramString5, int paramInt2, long paramLong4, long paramLong5, long paramLong6, long paramLong7, int paramInt3)
  {
    MessageRecord localMessageRecord = MessageRecordFactory.a(63531);
    uniseq = paramLong4;
    selfuin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    frienduin = paramString1;
    senderuin = paramString2;
    if (paramString4 != null)
    {
      paramString5 = paramString4;
      if (paramString4.length() >= 1) {}
    }
    else
    {
      paramString5 = TransfileUtile.a(paramString3, paramLong1, 0, paramBoolean2);
    }
    msg = paramString5;
    msgtype = 63531;
    isread = paramBoolean2;
    if (paramBoolean1)
    {
      paramInt2 = 1;
      issend = paramInt2;
      istroop = paramInt1;
      msgseq = paramLong2;
      shmsgseq = MessageUtils.a(paramLong2, paramInt1);
      paramLong1 = paramLong5;
      if (paramLong5 == 0L) {
        paramLong1 = MessageUtils.a(MessageUtils.a());
      }
      msgUid = paramLong1;
      time = paramLong7;
      if (paramInt1 == 3000) {
        shmsgseq = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramInt1).shmsgseq;
      }
      if (!localMessageRecord.isSend()) {
        break label468;
      }
      ((SVIPHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).a(localMessageRecord);
    }
    for (;;)
    {
      vipBubbleDiyTextId = paramInt3;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageRecord, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString2, paramString1, paramInt1);
      QLog.i("FileManagerDataCenter<FileAssistant>", 1, "Inser msg to AIO, msgInfo: mrUinseq[" + String.valueOf(uniseq) + "], selfuin[" + FileManagerUtil.e(selfuin) + "], frienduin[" + FileManagerUtil.e(frienduin) + "], senderuin[" + FileManagerUtil.e(senderuin) + "], issend[" + String.valueOf(issend) + "], istroop[" + String.valueOf(istroop) + "], shmsgseq[" + String.valueOf(shmsgseq) + "], msgUid[" + String.valueOf(msgUid) + "], time[" + String.valueOf(time) + "], vipBubbleID[" + String.valueOf(paramLong6) + "], vipBubbleDiyTextID[" + String.valueOf(paramInt3) + "]");
      return uniseq;
      paramInt2 = 0;
      break;
      label468:
      if (paramLong6 != -1L) {
        vipBubbleID = paramLong6;
      } else {
        vipBubbleID = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1);
      }
    }
  }
  
  public FilePreViewControllerBase a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFilePreViewControllerBase == null) {
      QLog.e("FileManagerDataCenter<FileAssistant>", 1, "getTmpController mTmpController is null");
    }
    for (;;)
    {
      FilePreViewControllerBase localFilePreViewControllerBase = jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFilePreViewControllerBase;
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFilePreViewControllerBase = null;
      return localFilePreViewControllerBase;
      QLog.d("FileManagerDataCenter<FileAssistant>", 1, "getTmpController " + jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFilePreViewControllerBase.getClass().getName());
    }
  }
  
  public FileManagerEntity a(long paramLong)
  {
    if (paramLong == -1L)
    {
      QLog.e("FileManagerDataCenter<FileAssistant>", 1, "QueryFileEntityBySessionId nSessionId[" + paramLong + "] is error");
      return null;
    }
    FileManagerProxy localFileManagerProxy = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localFileManagerProxy == null)
    {
      QLog.e("FileManagerDataCenter<FileAssistant>", 1, "QueryFileEntityBySessionId get FileManagerProxy null! nSessionId[" + paramLong + "]");
      return null;
    }
    FileManagerEntity localFileManagerEntity = localFileManagerProxy.a(paramLong);
    if (localFileManagerEntity != null)
    {
      localFileManagerProxy.a(localFileManagerEntity);
      FileCategoryUtil.a(localFileManagerEntity);
      return localFileManagerEntity;
    }
    localFileManagerEntity = (FileManagerEntity)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager().a(FileManagerEntity.class, String.valueOf(paramLong));
    if (localFileManagerEntity != null)
    {
      localFileManagerProxy.a(localFileManagerEntity);
      FileCategoryUtil.a(localFileManagerEntity);
      return localFileManagerEntity;
    }
    QLog.e("FileManagerDataCenter<FileAssistant>", 1, "QueryFileEntityBySessionId get entry null! nSessionId[" + paramLong + "]");
    return null;
  }
  
  public FileManagerEntity a(long paramLong1, long paramLong2, String paramString, int paramInt)
  {
    FileManagerEntity localFileManagerEntity = a(paramLong1);
    if (localFileManagerEntity != null)
    {
      QLog.i("FileManagerDataCenter<FileAssistant>", 1, "getFileEntityBySessionid for queryall, FileManagerEntity exist, sessionId[" + String.valueOf(nSessionId) + "], uniseq[" + String.valueOf(uniseq) + "], strUin[" + FileManagerUtil.e(peerUin) + "], peerType[" + String.valueOf(peerType) + "]");
      return localFileManagerEntity;
    }
    localFileManagerEntity = new FileManagerEntity();
    nSessionId = paramLong1;
    uniseq = paramLong2;
    peerUin = paramString;
    peerType = paramInt;
    selfUin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    isReaded = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
    QLog.i("FileManagerDataCenter<FileAssistant>", 1, "getFileEntityBySessionid, new a FileManagerEntity, sessionId[" + String.valueOf(nSessionId) + "], uniseq[" + String.valueOf(paramLong2) + "], strUin[" + FileManagerUtil.e(paramString) + "], peerType[" + String.valueOf(paramInt) + "]");
    return localFileManagerEntity;
  }
  
  public FileManagerEntity a(long paramLong, String paramString, int paramInt)
  {
    if (paramString == null)
    {
      QLog.e("FileManagerDataCenter<FileAssistant>", 1, "QueryFileEntityByuniseq  strUin is null, uniseq[" + paramLong + "], peerType[" + paramInt + "]");
      return null;
    }
    if (paramLong <= 0L)
    {
      QLog.e("FileManagerDataCenter<FileAssistant>", 1, "QueryFileEntityByuniseq uniseq[" + paramLong + "] is error, strUin[" + FileManagerUtil.e(paramString) + "], peerType[" + paramInt + "]");
      return null;
    }
    FileManagerProxy localFileManagerProxy = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localFileManagerProxy == null)
    {
      QLog.e("FileManagerDataCenter<FileAssistant>", 1, "QueryFileEntityByuniseq get FileManagerProxy null! strUin[" + FileManagerUtil.e(paramString) + "], uniseq[" + paramLong + "], peerType[" + paramInt + "]");
      return null;
    }
    FileManagerEntity localFileManagerEntity = localFileManagerProxy.a(paramLong, paramString, paramInt);
    if (localFileManagerEntity != null)
    {
      FileCategoryUtil.a(localFileManagerEntity);
      return localFileManagerEntity;
    }
    return localFileManagerProxy.b(paramLong, paramString, paramInt);
  }
  
  public FileManagerEntity a(long paramLong1, String paramString, int paramInt, long paramLong2)
  {
    if (-1L != paramLong2) {}
    for (FileManagerEntity localFileManagerEntity1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong2);; localFileManagerEntity1 = null)
    {
      FileManagerEntity localFileManagerEntity2 = localFileManagerEntity1;
      if (localFileManagerEntity1 == null)
      {
        localFileManagerEntity2 = localFileManagerEntity1;
        if (paramLong1 > 0L) {
          localFileManagerEntity2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong1, paramString, paramInt);
        }
      }
      if (localFileManagerEntity2 == null)
      {
        if (QLog.isColorLevel()) {
          QLog.e("FileManagerDataCenter<FileAssistant>", 2, "why sessionId[" + String.valueOf(paramLong2) + "] and uniseq[" + String.valueOf(paramLong1) + "] is wrong");
        }
        return null;
      }
      return localFileManagerEntity2;
    }
  }
  
  public FileManagerEntity a(String paramString)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString);
  }
  
  public FileManagerEntity a(String paramString, long paramLong)
  {
    if ((paramString == null) || (paramLong <= 0L)) {
      return null;
    }
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localObject == null)
    {
      QLog.e("FileManagerDataCenter<FileAssistant>", 1, "QueryFileEntityByOLfileSessionId get FileManagerProxy null! nOLfileSessionId[" + paramLong + "]");
      return null;
    }
    FileManagerEntity localFileManagerEntity1 = ((FileManagerProxy)localObject).a(paramString, paramLong);
    if (localFileManagerEntity1 != null) {
      return localFileManagerEntity1;
    }
    localObject = "select * from " + FileManagerEntity.tableName() + " where (nOLfileSessionId = " + paramLong + " or (nSessionId = " + paramLong + " and nOLfileSessionId = 0)) order by srvTime desc";
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    localObject = localEntityManager.a(FileManagerEntity.class, (String)localObject, null);
    FileManagerEntity localFileManagerEntity2;
    if ((localObject != null) && (((List)localObject).size() > 0))
    {
      Iterator localIterator = ((List)localObject).iterator();
      do
      {
        do
        {
          if (!localIterator.hasNext()) {
            break;
          }
          localFileManagerEntity2 = (FileManagerEntity)localIterator.next();
        } while (!paramString.equalsIgnoreCase(peerUin));
        localObject = localFileManagerEntity2;
        if (paramLong == nOLfileSessionId) {
          break;
        }
      } while ((paramLong != nSessionId) || (0L != nOLfileSessionId));
    }
    for (localObject = localFileManagerEntity2;; localObject = localFileManagerEntity1)
    {
      if ((localObject != null) && (0L == nOLfileSessionId))
      {
        QLog.i("FileManagerDataCenter<FileAssistant>", 1, "QueryOLfileSessionEntity find a old ver data. nOLfileSessionId[" + paramLong + "]");
        nOLfileSessionId = paramLong;
        c((FileManagerEntity)localObject);
      }
      localEntityManager.a();
      return localObject;
    }
  }
  
  public Map a(String paramString)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString);
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(true, 0, null);
  }
  
  public void a(long paramLong)
  {
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void a(long paramLong, String paramString)
  {
    FileManagerEntity localFileManagerEntity = a(paramLong);
    if (localFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.w("FileManagerDataCenter<FileAssistant>", 2, "sessionnid[" + String.valueOf(paramLong) + "] item is not exist!may be is deleted!");
      }
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity, paramString);
  }
  
  public void a(long paramLong1, String paramString, int paramInt, long paramLong2)
  {
    FileManagerEntity localFileManagerEntity = a(paramLong1, paramString, paramInt, -1L);
    if (localFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerDataCenter<FileAssistant>", 2, "updateFileManagerTime error, entity is null,uinseq[" + String.valueOf(paramLong1) + "], frienduin[" + String.valueOf(paramString) + "], istroop[" + String.valueOf(paramInt) + "], time[" + String.valueOf(paramLong2) + "]");
      }
      return;
    }
    srvTime = (1000L * paramLong2);
    c(localFileManagerEntity);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(true, 3, null);
  }
  
  protected void a(MessageRecord paramMessageRecord, String paramString1, long paramLong, int paramInt, String paramString2, String paramString3)
  {
    paramMessageRecord = a(uniseq, frienduin, istroop);
    if (paramMessageRecord != null)
    {
      fProgress = ((float)paramLong / (float)fileSize);
      status = FileManagerUtil.d(paramInt);
      if (status == 0) {
        isReaded = false;
      }
    }
    while (!QLog.isColorLevel()) {
      for (;;)
      {
        a();
        c(paramMessageRecord);
        return;
        if (status == 1) {
          fProgress = 0.0F;
        }
      }
    }
    if ("strUin[" + FileManagerUtil.e(paramString1) + "], mtransferedSize[" + String.valueOf(paramLong) + "], status[" + String.valueOf(paramInt) + "], strUuid[" + paramString2 + "], strFileId[" + paramString3 == null) {}
    for (paramMessageRecord = "null";; paramMessageRecord = paramString3 + "] entry == null ??")
    {
      QLog.e("FileManagerDataCenter<FileAssistant>", 2, paramMessageRecord);
      return;
    }
  }
  
  public void a(FilePreViewControllerBase paramFilePreViewControllerBase)
  {
    QLog.d("FileManagerDataCenter<FileAssistant>", 1, "regTmpController" + paramFilePreViewControllerBase.getClass().getName());
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFilePreViewControllerBase = paramFilePreViewControllerBase;
  }
  
  /* Error */
  public void a(FileManagerEntity paramFileManagerEntity)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 28	com/tencent/mobileqq/filemanager/core/FileManagerDataCenter:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6: invokevirtual 238	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/filemanager/data/FileManagerProxy;
    //   9: astore_2
    //   10: aload_2
    //   11: ifnonnull +68 -> 79
    //   14: ldc 8
    //   16: iconst_1
    //   17: new 77	java/lang/StringBuilder
    //   20: dup
    //   21: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   24: ldc_w 579
    //   27: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: aload_1
    //   31: getfield 440	com/tencent/mobileqq/filemanager/data/FileManagerEntity:nSessionId	J
    //   34: invokevirtual 114	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   37: ldc -2
    //   39: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: aload_1
    //   43: getfield 441	com/tencent/mobileqq/filemanager/data/FileManagerEntity:uniseq	J
    //   46: invokevirtual 114	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   49: ldc_w 581
    //   52: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: aload_1
    //   56: getfield 180	com/tencent/mobileqq/filemanager/data/FileManagerEntity:peerUin	Ljava/lang/String;
    //   59: invokestatic 247	com/tencent/mobileqq/filemanager/util/FileManagerUtil:e	(Ljava/lang/String;)Ljava/lang/String;
    //   62: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: ldc 92
    //   67: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   70: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   73: invokestatic 99	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   76: aload_0
    //   77: monitorexit
    //   78: return
    //   79: invokestatic 75	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   82: ifeq +32 -> 114
    //   85: ldc 8
    //   87: iconst_2
    //   88: new 77	java/lang/StringBuilder
    //   91: dup
    //   92: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   95: ldc_w 583
    //   98: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   101: aload_1
    //   102: invokestatic 586	com/tencent/mobileqq/filemanager/util/FileManagerUtil:a	(Lcom/tencent/mobileqq/filemanager/data/FileManagerEntity;)Ljava/lang/String;
    //   105: invokevirtual 84	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   111: invokestatic 119	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   114: aload_2
    //   115: aload_1
    //   116: invokevirtual 588	com/tencent/mobileqq/filemanager/data/FileManagerProxy:b	(Lcom/tencent/mobileqq/filemanager/data/FileManagerEntity;)V
    //   119: aload_0
    //   120: getfield 28	com/tencent/mobileqq/filemanager/core/FileManagerDataCenter:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   123: invokevirtual 527	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/filemanager/core/FileManagerNotifyCenter;
    //   126: iconst_1
    //   127: iconst_3
    //   128: aconst_null
    //   129: invokevirtual 532	com/tencent/mobileqq/filemanager/core/FileManagerNotifyCenter:a	(ZILjava/lang/Object;)V
    //   132: goto -56 -> 76
    //   135: astore_1
    //   136: aload_0
    //   137: monitorexit
    //   138: aload_1
    //   139: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	140	0	this	FileManagerDataCenter
    //   0	140	1	paramFileManagerEntity	FileManagerEntity
    //   9	106	2	localFileManagerProxy	FileManagerProxy
    // Exception table:
    //   from	to	target	type
    //   2	10	135	finally
    //   14	76	135	finally
    //   79	114	135	finally
    //   114	132	135	finally
  }
  
  public void a(String paramString, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt);
  }
  
  public void a(boolean paramBoolean, int paramInt, String paramString1, String paramString2, long paramLong)
  {
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
    if (localFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerDataCenter<FileAssistant>", 2, "Save of2of [" + String.valueOf(paramBoolean) + "],query FileManagerEntity renturn null, SessionId[" + String.valueOf(paramLong) + "], ");
      }
      return;
    }
    if (paramBoolean)
    {
      lastTime = (MessageCache.a() * 1000L + 604800000L);
      isReaded = false;
      bSend = true;
      status = 1;
      fProgress = 0.0F;
      Uuid = paramString2;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(localFileManagerEntity);
      status = 2;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      FileManagerUtil.b(nSessionId);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity, 6, "");
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(peerUin, localFileManagerEntity, null);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uniseq, nSessionId, peerUin, peerType, 15, null, paramInt, paramString1);
    isReaded = false;
    status = 0;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(localFileManagerEntity);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
    FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId, "actFileOf2Of", 0L, "", "", peerUin, Uuid, paramInt, paramString1, 0L, 0L, 0L, "", "", 0, paramString1, null);
  }
  
  public boolean a()
  {
    return false;
  }
  
  public boolean a(long paramLong)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
  }
  
  public boolean a(long paramLong, int paramInt)
  {
    Object localObject2 = a(paramLong);
    if (localObject2 == null) {
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d("FileManagerDataCenter<FileAssistant>", 2, "strUin[" + FileManagerUtil.e(peerUin) + "], peeryType[" + String.valueOf(peerType) + "], uniseq[" + String.valueOf(uniseq) + "]");
    }
    Object localObject1 = null;
    if (-1L != uniseq) {
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(peerUin, peerType, uniseq);
    }
    localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    localObject1 = a((MessageRecord)localObject1);
    if ((localObject2 != null) && (localObject2 != null) && (localObject1 != null))
    {
      status = paramInt;
      ((EntityManager)localObject2).a((Entity)localObject1);
      return true;
    }
    return false;
  }
  
  public boolean a(long paramLong1, long paramLong2)
  {
    Object localObject2 = a(paramLong1);
    if (localObject2 == null) {
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d("FileManagerDataCenter<FileAssistant>", 2, "strUin[" + FileManagerUtil.e(peerUin) + "], peeryType[" + String.valueOf(peerType) + "], uniseq[" + String.valueOf(uniseq) + "]");
    }
    Object localObject1 = null;
    if (-1L != uniseq) {
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(peerUin, peerType, uniseq);
    }
    localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    localObject1 = a((MessageRecord)localObject1);
    if ((localObject2 != null) && (localObject1 != null))
    {
      transferedSize = paramLong2;
      ((EntityManager)localObject2).a((Entity)localObject1);
      return true;
    }
    return false;
  }
  
  public boolean a(FileManagerEntity paramFileManagerEntity)
  {
    if (paramFileManagerEntity == null) {}
    for (;;)
    {
      try
      {
        if (QLog.isColorLevel()) {
          QLog.e("FileManagerDataCenter<FileAssistant>", 2, "setFMDelete FileManagerEntity is null!!!");
        }
        bool = false;
        return bool;
      }
      finally {}
      bDelInFM = true;
      boolean bool = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramFileManagerEntity, true);
    }
  }
  
  public boolean a(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FileManagerDataCenter<FileAssistant>", 2, "SetRead: strUin[" + FileManagerUtil.e(paramString) + "], peeryType[" + paramInt + "], uniseq[" + paramLong + "]");
    }
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString, paramInt, paramLong);
    if (paramString != null)
    {
      isread = true;
      return true;
    }
    return false;
  }
  
  public boolean a(String paramString, long paramLong)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramLong);
  }
  
  public FileManagerEntity b(long paramLong)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
  }
  
  public FileManagerEntity b(long paramLong, String paramString, int paramInt)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localObject == null) {
      return null;
    }
    if (paramLong > 0L)
    {
      FileManagerEntity localFileManagerEntity = ((FileManagerProxy)localObject).a(paramLong, paramString, paramInt);
      if (localFileManagerEntity != null)
      {
        QLog.i("FileManagerDataCenter<FileAssistant>", 1, "getFileEntityByuniseq for memory, FileManagerEntity exist, sessionId[" + String.valueOf(nSessionId) + "], uniseq[" + String.valueOf(uniseq) + "], strUin[" + FileManagerUtil.e(peerUin) + "], peerType[" + String.valueOf(peerType) + "]");
        return localFileManagerEntity;
      }
      localObject = ((FileManagerProxy)localObject).b(paramLong, paramString, paramInt);
      if (localObject != null)
      {
        QLog.i("FileManagerDataCenter<FileAssistant>", 1, "getFileEntityByuniseq for db, FileManagerEntity exist, sessionId[" + String.valueOf(nSessionId) + "], uniseq[" + String.valueOf(uniseq) + "], strUin[" + FileManagerUtil.e(peerUin) + "], peerType[" + String.valueOf(peerType) + "]");
        return localObject;
      }
    }
    localObject = new FileManagerEntity();
    nSessionId = FileManagerUtil.a().longValue();
    uniseq = paramLong;
    peerUin = paramString;
    peerType = paramInt;
    selfUin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    isReaded = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((FileManagerEntity)localObject);
    QLog.i("FileManagerDataCenter<FileAssistant>", 1, "getFileEntityByuniseq, new a FileManagerEntity, sessionId[" + String.valueOf(nSessionId) + "], uniseq[" + String.valueOf(paramLong) + "], strUin[" + FileManagerUtil.e(paramString) + "], peerType[" + String.valueOf(paramInt) + "]");
    return localObject;
  }
  
  public FileManagerEntity b(String paramString)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString);
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d();
  }
  
  public void b(FileManagerEntity paramFileManagerEntity)
  {
    for (;;)
    {
      FileManagerProxy localFileManagerProxy;
      try
      {
        localFileManagerProxy = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        if (localFileManagerProxy == null)
        {
          QLog.e("FileManagerDataCenter<FileAssistant>", 1, "insertToFMListAddOrReplaceDB get FileManagerProxy null! nSessionId[" + nSessionId + "], uniseq[" + uniseq + "], peerUin[" + FileManagerUtil.e(peerUin) + "]");
          return;
        }
        if ((FileManagerEntity)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager().a(FileManagerEntity.class, String.valueOf(nSessionId)) == null)
        {
          localFileManagerProxy.b(paramFileManagerEntity);
          continue;
        }
        localFileManagerProxy.c(paramFileManagerEntity);
      }
      finally {}
      localFileManagerProxy.e(paramFileManagerEntity);
    }
  }
  
  public boolean b()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
  }
  
  public boolean b(FileManagerEntity paramFileManagerEntity)
  {
    if (paramFileManagerEntity == null) {}
    for (;;)
    {
      try
      {
        if (QLog.isColorLevel()) {
          QLog.e("FileManagerDataCenter<FileAssistant>", 2, "setAioDelete FileManagerEntity is null!!!");
        }
        bool = false;
        return bool;
      }
      finally {}
      bDelInAio = true;
      uniseq = -1L;
      boolean bool = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramFileManagerEntity, true);
    }
  }
  
  public FileManagerEntity c(String paramString)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramString);
  }
  
  public void c()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c();
  }
  
  public void c(FileManagerEntity paramFileManagerEntity)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramFileManagerEntity);
  }
  
  public void d()
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null))
    {
      if (jdField_a_of_type_AndroidContentBroadcastReceiver == null) {
        jdField_a_of_type_AndroidContentBroadcastReceiver = new osb(this);
      }
      IntentFilter localIntentFilter = new IntentFilter("com.opensdk.downloadmanager.renameFilename");
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
    }
  }
  
  public void d(FileManagerEntity paramFileManagerEntity)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramFileManagerEntity);
  }
  
  public void e()
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) && (jdField_a_of_type_AndroidContentBroadcastReceiver != null)) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
    }
    jdField_a_of_type_AndroidContentBroadcastReceiver = null;
  }
}
