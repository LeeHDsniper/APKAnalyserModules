package com.tencent.mobileqq.filemanager.app;

import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.core.DiscPicThumbDownloader;
import com.tencent.mobileqq.filemanager.core.DiscVideoThumbDownloader;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerRSCenter;
import com.tencent.mobileqq.filemanager.core.OfflineVideoThumbDownLoader;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.filemanager.core.ThumbHttpDownloader;
import com.tencent.mobileqq.filemanager.core.WeiYunLogicCenter;
import com.tencent.mobileqq.filemanager.data.FMConstants.revertMsgCallback;
import com.tencent.mobileqq.filemanager.data.FMDataCache;
import com.tencent.mobileqq.filemanager.data.FileInfo;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.OfflineFileInfo;
import com.tencent.mobileqq.filemanager.data.WeiYunFileInfo;
import com.tencent.mobileqq.filemanager.fileviewer.FileViewMusicService;
import com.tencent.mobileqq.filemanager.settings.FMSettings;
import com.tencent.mobileqq.filemanager.util.FileCategoryUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter.fileAssistantReportData;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.filemanager.util.IForwardCallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.ShieldMsgManger;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.mobileqq.troop.data.TroopFileStatusInfo;
import com.tencent.mobileqq.troop.utils.TroopFileTransferManager;
import com.tencent.mobileqq.troop.utils.TroopFileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;
import mqq.app.MobileQQ;
import orj;

public class FileManagerEngine
{
  private static final int jdField_a_of_type_Int = 38;
  private static final String jdField_a_of_type_JavaLangString = "FileManagerEngine<FileAssistant>";
  private static final int b = 3;
  private static final int c = 106;
  public QQAppInterface a;
  private DiscPicThumbDownloader jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscPicThumbDownloader;
  private DiscVideoThumbDownloader jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscVideoThumbDownloader;
  private OfflineVideoThumbDownLoader jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOfflineVideoThumbDownLoader;
  private ThumbHttpDownloader jdField_a_of_type_ComTencentMobileqqFilemanagerCoreThumbHttpDownloader;
  WeiYunLogicCenter jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter;
  orj jdField_a_of_type_Orj;
  
  public FileManagerEngine(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscPicThumbDownloader = null;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOfflineVideoThumbDownLoader = null;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscVideoThumbDownloader = null;
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreThumbHttpDownloader = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    jdField_a_of_type_Orj = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter == null) {
      a();
    }
    FileManagerUtil.a();
    if (jdField_a_of_type_Orj == null) {
      jdField_a_of_type_Orj = new orj(this, null);
    }
    try
    {
      paramQQAppInterface = new IntentFilter();
      paramQQAppInterface.addAction("android.intent.action.MEDIA_MOUNTED");
      paramQQAppInterface.addAction("android.intent.action.MEDIA_SCANNER_STARTED");
      paramQQAppInterface.addAction("android.intent.action.MEDIA_UNMOUNTED");
      paramQQAppInterface.addAction("android.intent.action.MEDIA_UNMOUNTABLE");
      paramQQAppInterface.addAction("android.intent.action.MEDIA_EJECT");
      paramQQAppInterface.addAction("android.intent.action.MEDIA_REMOVED");
      paramQQAppInterface.addDataScheme("file");
      BaseApplicationImpl.a.registerReceiver(jdField_a_of_type_Orj, paramQQAppInterface);
      return;
    }
    catch (Throwable paramQQAppInterface) {}
  }
  
  private void a(long paramLong, String paramString, int paramInt)
  {
    if (paramLong < 0L)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "uniseq is wrong!can't retry!uniseq[" + String.valueOf(paramLong) + "]");
      }
      return;
    }
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong, paramString, paramInt);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramString);
  }
  
  private void b(long paramLong)
  {
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
    if (localFileManagerEntity == null) {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "queryFileManagerEntity is fail!,check sessionID[" + String.valueOf(paramLong) + "]");
      }
    }
    do
    {
      do
      {
        return;
        switch (nOpType)
        {
        }
      } while (!QLog.isColorLevel());
      QLog.e("FileManagerEngine<FileAssistant>", 2, "unknow operation type!");
      return;
      if (localFileManagerEntity.getCloudType() == 0)
      {
        localFileManagerEntity.setCloudType(1);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(localFileManagerEntity);
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(localFileManagerEntity);
      return;
      a().a(localFileManagerEntity, peerType, true);
      return;
      a(localFileManagerEntity);
      return;
      c(localFileManagerEntity);
      return;
      a(localFileManagerEntity, nOpType);
      return;
      if (localFileManagerEntity.getCloudType() == 0)
      {
        if (bDelInFM == true)
        {
          bDelInFM = false;
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(localFileManagerEntity);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(true, 3, null);
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramLong);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.e("FileManagerEngine<FileAssistant>", 2, "err cloud type.when reTry :" + localFileManagerEntity.getCloudType());
    return;
    TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, TroopUin).a(forwardTroopFileEntrance, TroopUin, busId, Long.valueOf(peerUin).longValue(), peerType, fileName, strThumbPath, fileSize, strTroopFilePath, true, paramLong, FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
    return;
    if (peerUin.equals(AppConstants.aj)) {}
    for (int i = 1;; i = 0)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(3, localFileManagerEntity, i);
      return;
    }
  }
  
  private void c(FileManagerEntity paramFileManagerEntity)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "FileManagerEntity is null!!!");
      }
      return;
    }
    FileManagerUtil.b(nSessionId);
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      status = 0;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 34, new Object[] { Integer.valueOf(0), null, null, Long.valueOf(nSessionId) });
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId, "actFileOf2Wy", 0L, "", peerUin, Uuid, strFileMd5, 9004L, "Error_No_Network", 0L, 0L, 0L, "", "", 0, "Error_No_Network", "");
      return;
    }
    fProgress = 0.0F;
    status = 2;
    nOpType = 4;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(25, paramFileManagerEntity);
  }
  
  public ThumbHttpDownloader a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreThumbHttpDownloader == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreThumbHttpDownloader = new ThumbHttpDownloader(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreThumbHttpDownloader;
  }
  
  public WeiYunLogicCenter a()
  {
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter == null) {
        jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter = new WeiYunLogicCenter(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
      WeiYunLogicCenter localWeiYunLogicCenter = jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter;
      return localWeiYunLogicCenter;
    }
    finally {}
  }
  
  public FileManagerEntity a(DataLineMsgRecord paramDataLineMsgRecord)
  {
    FileManagerEntity localFileManagerEntity = new FileManagerEntity();
    nSessionId = FileManagerUtil.a().longValue();
    Uuid = fileUuid;
    selfUin = String.valueOf(uOwnerUin);
    peerUin = selfuin;
    fileName = filename;
    fileSize = filesize;
    status = 2;
    nOpType = nOpType;
    busId = busId;
    forwardTroopFileEntrance = forwardTroopFileEntrance;
    datalineEntitySessionId = sessionid;
    peerType = istroop;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(localFileManagerEntity);
    return localFileManagerEntity;
  }
  
  public FileManagerEntity a(FileManagerEntity paramFileManagerEntity)
  {
    FileManagerEntity localFileManagerEntity = new FileManagerEntity();
    nSessionId = FileManagerUtil.a().longValue();
    Uuid = Uuid;
    selfUin = selfUin;
    peerUin = selfUin;
    peerType = peerType;
    fileName = fileName;
    fileSize = fileSize;
    strThumbPath = strThumbPath;
    status = 2;
    nOpType = 29;
    busId = 3;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(localFileManagerEntity);
    return localFileManagerEntity;
  }
  
  public FileManagerEntity a(FileManagerEntity paramFileManagerEntity, String paramString)
  {
    paramString = a().a(paramFileManagerEntity, paramString);
    if (peerType == 3000)
    {
      a(paramString, 20);
      return paramString;
    }
    c(paramString);
    return paramString;
  }
  
  public FileManagerEntity a(FileManagerEntity paramFileManagerEntity, String paramString, int paramInt)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "insertForwardOfflineEntity , FilemanagerEntity is null!");
      }
      FileManagerUtil.a();
      return null;
    }
    FileManagerEntity localFileManagerEntity = new FileManagerEntity();
    localFileManagerEntity.copyFrom(paramFileManagerEntity);
    nSessionId = FileManagerUtil.a().longValue();
    if ((fileName == null) || (fileName.length() == 0)) {
      fileName = FileManagerUtil.a(localFileManagerEntity.getFilePath());
    }
    if ((localFileManagerEntity.getFilePath() == null) || (localFileManagerEntity.getFilePath().length() == 0)) {
      localFileManagerEntity.setFilePath(fileName);
    }
    uniseq = a64536uniseq;
    nOpType = 7;
    bSend = true;
    isReaded = true;
    peerType = paramInt;
    peerUin = paramString;
    peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, null, paramInt);
    selfUin = peerUin;
    srvTime = (MessageCache.a() * 1000L);
    localFileManagerEntity.setCloudType(cloudType);
    status = 2;
    msgSeq = FileManagerUtil.a();
    msgUid = FileManagerUtil.b();
    if (QLog.isColorLevel()) {
      QLog.i("FileManagerEngine<FileAssistant>", 2, "insertForwardOfflineEntity FilemanagerEntity:" + FileManagerUtil.a(localFileManagerEntity));
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(localFileManagerEntity);
    return localFileManagerEntity;
  }
  
  public FileManagerEntity a(FileManagerEntity paramFileManagerEntity, String paramString1, String paramString2, int paramInt, boolean paramBoolean)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "insertForwardOfflineEntity , FilemanagerEntity is null!");
      }
      FileManagerUtil.a();
      return null;
    }
    String str = TransfileUtile.a("", 0L, 0, true);
    FileManagerEntity localFileManagerEntity = new FileManagerEntity();
    localFileManagerEntity.copyFrom(paramFileManagerEntity);
    nSessionId = FileManagerUtil.a().longValue();
    if ((fileName == null) || (fileName.length() == 0)) {
      fileName = FileManagerUtil.a(localFileManagerEntity.getFilePath());
    }
    if ((localFileManagerEntity.getFilePath() == null) || (localFileManagerEntity.getFilePath().length() == 0)) {
      localFileManagerEntity.setFilePath(fileName);
    }
    long l = a64536uniseq;
    uniseq = l;
    nOpType = 7;
    bSend = true;
    isReaded = true;
    peerType = paramInt;
    peerUin = paramString2;
    peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString2, null, paramInt);
    if ((peerType == 3000) || (peerType == 1))
    {
      selfUin = peerUin;
      srvTime = (MessageCache.a() * 1000L);
      localFileManagerEntity.setCloudType(1);
      status = 2;
      msgSeq = FileManagerUtil.a();
      msgUid = FileManagerUtil.b();
      if (QLog.isColorLevel()) {
        QLog.i("FileManagerEngine<FileAssistant>", 2, "insertForwardOfflineEntity FilemanagerEntity:" + FileManagerUtil.a(localFileManagerEntity));
      }
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, paramString2, localFileManagerEntity);
      if (!paramBoolean) {
        break label457;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString2, paramString1, true, localFileManagerEntity.getFilePath(), fileSize, true, paramInt, str, msgSeq, msgSeq, Uuid, 1, l, msgUid, -1L, MessageCache.a());
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.i("FileManagerEngine<FileAssistant>", 2, "insertForwardOfflineEntity FilemanagerEntity:" + FileManagerUtil.a(localFileManagerEntity));
      }
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, paramString2, localFileManagerEntity);
      return localFileManagerEntity;
      selfUin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
      break;
      label457:
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(localFileManagerEntity);
    }
  }
  
  public FileManagerEntity a(String paramString1, String paramString2, String paramString3, int paramInt, boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "why FileManagerRSCenter is null???");
      }
      return null;
    }
    String str2 = TransfileUtile.a(paramString1, 0L, 0, true);
    String str1 = FileManagerUtil.a(paramString1);
    long l = -1L;
    int i;
    int j;
    label63:
    FileManagerEntity localFileManagerEntity;
    if (paramBoolean)
    {
      i = 0;
      if (!paramBoolean) {
        break label456;
      }
      j = 3;
      if (paramBoolean) {
        l = a64536uniseq;
      }
      localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l, paramString3, paramInt);
      status = 2;
      nOpType = i;
      fileSize = FileManagerUtil.a(paramString1);
      if (QLog.isColorLevel()) {
        QLog.d("FileManagerEngine<FileAssistant>", 2, "toOffline[" + String.valueOf(paramBoolean) + "], filepath[" + paramString1 + "]:size[" + String.valueOf(fileSize) + "]");
      }
      isReaded = true;
      peerUin = paramString3;
      peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString3, null, paramInt);
      localFileManagerEntity.setFilePath(paramString1);
      srvTime = (MessageCache.a() * 1000L);
      fileName = str1;
      nFileType = FileManagerUtil.a(paramString1);
      localFileManagerEntity.setCloudType(3);
      bSend = paramBoolean;
      msgSeq = FileManagerUtil.a();
      msgUid = FileManagerUtil.b();
      strThumbPath = FileManagerUtil.a(paramString1, 150, 150);
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString2, paramString3, localFileManagerEntity);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
      str1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
      if ((paramInt != 1004) && (paramInt != 1000)) {
        break label462;
      }
      str1 = paramString2;
    }
    for (;;)
    {
      if (nFileType == 5)
      {
        strApkPackageName = FileCategoryUtil.a(localFileManagerEntity.getFilePath(), BaseApplicationImpl.getContext());
        fileName = FileCategoryUtil.a(localFileManagerEntity.getFilePath());
      }
      if (paramBoolean) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString3, str1, true, paramString1, 0L, true, paramInt, str2, msgSeq, msgSeq, null, j, l, msgUid, -1L, MessageCache.a());
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
      return localFileManagerEntity;
      i = 6;
      break;
      label456:
      j = 2;
      break label63;
      label462:
      if (paramInt == 1006)
      {
        tmpSessionFromPhone = paramString2;
        tmpSessionToPhone = paramString3;
        str1 = paramString2;
      }
    }
  }
  
  public String a(FileManagerEntity paramFileManagerEntity, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscPicThumbDownloader == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscPicThumbDownloader = new DiscPicThumbDownloader(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscPicThumbDownloader.a(paramFileManagerEntity, paramInt);
  }
  
  public String a(String paramString, int paramInt, boolean paramBoolean, Object paramObject)
  {
    return a().a(paramString, paramInt, paramBoolean, paramObject);
  }
  
  public String a(String paramString1, String paramString2, int paramInt, Object paramObject)
  {
    return a().a(paramString1, paramString2, paramInt, paramObject);
  }
  
  public ArrayList a()
  {
    if (QLog.isColorLevel()) {
      QLog.i("FileManagerEngine<FileAssistant>", 2, "saveAllSelectFileToWeiYun");
    }
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    Object localObject;
    while (i < FMDataCache.d().size())
    {
      localObject = (OfflineFileInfo)FMDataCache.d().get(i);
      localArrayList.add(a(FileManagerUtil.a((OfflineFileInfo)localObject, 0), String.valueOf(jdField_a_of_type_Long)));
      i += 1;
    }
    i = 0;
    if (i < FMDataCache.c().size())
    {
      localObject = (FileManagerEntity)FMDataCache.c().get(i);
      FileCategoryUtil.a((FileManagerEntity)localObject);
      switch (((FileManagerEntity)localObject).getCloudType())
      {
      case 2: 
      default: 
        localObject = null;
      }
      for (;;)
      {
        if (localObject != null) {
          localArrayList.add(localObject);
        }
        i += 1;
        break;
        localObject = a(((FileManagerEntity)localObject).getFilePath(), "", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0, false);
        continue;
        localObject = a((FileManagerEntity)localObject, String.valueOf(peerUin));
      }
    }
    i = 0;
    while (i < FMDataCache.b().size())
    {
      localObject = a(((FileInfo)FMDataCache.b().get(i)).d(), "", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0, false);
      strApkPackageName = ((FileInfo)FMDataCache.b().get(i)).c();
      localArrayList.add(localObject);
      i += 1;
    }
    return localArrayList;
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c();
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    a().a(paramInt1, paramInt2, paramInt3);
  }
  
  public void a(int paramInt1, long paramLong, int paramInt2)
  {
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
    if (localFileManagerEntity != null) {
      a(paramInt1, a(localFileManagerEntity), paramInt2);
    }
  }
  
  public void a(int paramInt, long paramLong, String paramString)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((FileManagerEntity)localObject, paramString, 1);
    fProgress = 0.0F;
    try
    {
      TroopUin = Long.parseLong(paramString);
      status = 2;
      if (peerType == 0)
      {
        nOpType = 26;
        if ((TextUtils.isEmpty(strTroopFileUuid)) || (mContext == null))
        {
          IForwardCallBack localIForwardCallBack = FileManagerUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          strTroopFileUuid = localIForwardCallBack.a(peerUin, peerType, paramString, peerType, Uuid, fileName, fileSize, nSessionId);
          mContext = localIForwardCallBack;
        }
        if ((busId != 102) && (busId != 104)) {
          busId = 102;
        }
        if (NetworkUtil.e(BaseApplication.getContext())) {
          break label369;
        }
        localObject = BaseApplicationImpl.getContext().getString(2131368515);
        status = 0;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 19, new Object[] { Integer.valueOf(9004), localObject, Long.valueOf(0L), Long.valueOf(0L), null, Long.valueOf(nSessionId) });
        if ((mContext instanceof IForwardCallBack)) {
          ((IForwardCallBack)mContext).a(false, strTroopFileUuid, paramLong, 9004, (String)localObject, paramString, "");
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel())
        {
          QLog.e("FileManagerEngine<FileAssistant>", 2, FileManagerUtil.a());
          continue;
          if (peerType == 3000) {
            nOpType = 27;
          } else if (peerType == 6000) {
            nOpType = 32;
          }
        }
      }
      label369:
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(102, paramInt, localFileManagerEntity);
    }
  }
  
  public void a(int paramInt1, FileManagerEntity paramFileManagerEntity, int paramInt2)
  {
    Object localObject;
    if (0L == datalineEntitySessionId)
    {
      localObject = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramInt2);
      datalineEntitySessionId = ((IForwardCallBack)localObject).a(peerUin, peerType, selfUin, paramInt1, Uuid, fileName, strThumbPath, fileSize, 0);
      mContext = localObject;
    }
    while (!NetworkUtil.e(BaseApplication.getContext()))
    {
      localObject = BaseApplicationImpl.getContext().getString(2131368515);
      status = 0;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 19, new Object[] { Integer.valueOf(9004), localObject, Long.valueOf(0L), Long.valueOf(0L), null, Long.valueOf(nSessionId) });
      if ((mContext instanceof IForwardCallBack)) {
        ((IForwardCallBack)mContext).a(false, datalineEntitySessionId, 9004, (String)localObject, null, null, null);
      }
      return;
      if (mContext == null) {
        mContext = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramInt2);
      }
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(38, paramInt1, paramFileManagerEntity);
  }
  
  public void a(long paramLong)
  {
    b(paramLong);
  }
  
  public void a(long paramLong1, long paramLong2, String paramString, int paramInt1, int paramInt2)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong1, paramLong2, paramString, paramInt1, paramInt2);
  }
  
  public void a(long paramLong, String paramString)
  {
    a(38, paramLong, paramString);
  }
  
  public void a(DataLineMsgRecord paramDataLineMsgRecord)
  {
    FileManagerEntity localFileManagerEntity = a(paramDataLineMsgRecord);
    int i = DataLineMsgRecord.getDevTypeBySeId(sessionid);
    boolean bool;
    if (datalineEntitySessionId != 0L)
    {
      bool = true;
      if (29 != nOpType) {
        break label51;
      }
      a(3, localFileManagerEntity, i);
    }
    label51:
    do
    {
      do
      {
        return;
        bool = false;
        break;
      } while (31 != nOpType);
      if (i == 0)
      {
        a(7, Long.valueOf(selfUin).longValue(), Long.valueOf(peerUin).longValue(), busId, Uuid, fileName, strThumbPath, fileSize, forwardTroopFileEntrance, bool, datalineEntitySessionId);
        return;
      }
    } while (i != 1);
    a(6003, Long.valueOf(selfUin).longValue(), Long.valueOf(peerUin).longValue(), busId, Uuid, fileName, strThumbPath, fileSize, forwardTroopFileEntrance, bool, datalineEntitySessionId);
  }
  
  public void a(MessageRecord paramMessageRecord, FileManagerEntity paramFileManagerEntity, FMConstants.revertMsgCallback paramRevertMsgCallback)
  {
    if (peerType == 3000)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, senderuin, Uuid, paramRevertMsgCallback);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramFileManagerEntity, paramRevertMsgCallback);
  }
  
  public void a(FileManagerEntity paramFileManagerEntity)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "FileManagerEntity is null!!!");
      }
      return;
    }
    FileManagerUtil.b(nSessionId);
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      status = 0;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 19, new Object[] { Integer.valueOf(0), null, Long.valueOf(0L), Long.valueOf(0L), null, Long.valueOf(nSessionId) });
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId, "actFileOf2Of", 0L, "", peerUin, Uuid, strFileMd5, 9004L, "Error_No_Network", 0L, 0L, 0L, "", "", 0, "Error_No_Network", "");
      return;
    }
    QLog.i("FileManagerEngine<FileAssistant>", 1, "ForwardOfflineFile, nId[" + nSessionId + "], opYype[" + nOpType + "]");
    ShieldMsgManger localShieldMsgManger = (ShieldMsgManger)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(15);
    if ((localShieldMsgManger != null) && (localShieldMsgManger.a(peerUin)))
    {
      FileManagerUtil.a("该好友已被屏蔽！请先解除屏蔽！");
      status = 0;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 19, new Object[] { Integer.valueOf(0), null, Long.valueOf(0L), Long.valueOf(0L), null, Long.valueOf(nSessionId) });
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramFileManagerEntity);
      return;
    }
    fProgress = 0.0F;
    status = 2;
    if (nOpType == 28)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(106, paramFileManagerEntity);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramFileManagerEntity);
  }
  
  public void a(FileManagerEntity paramFileManagerEntity, int paramInt)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "FileManagerEntity is null!!!");
      }
      return;
    }
    nOpType = paramInt;
    QLog.e("FileManagerEngine<FileAssistant>", 1, "ForwardDisc2X, nOperationType[" + paramInt + "]");
    FileManagerUtil.b(nSessionId);
    if ((paramInt != 27) && (!NetworkUtil.e(BaseApplication.getContext())))
    {
      status = 0;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 34, new Object[] { Integer.valueOf(0), null, null, Long.valueOf(nSessionId) });
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId, "actFileDisc2Wy", 0L, "", peerUin, Uuid, strFileMd5, 9004L, "Error_No_Network", 0L, 0L, 0L, "", "", 0, "Error_No_Network", "");
      return;
    }
    QLog.i("FileManagerEngine<FileAssistant>", 1, "ForwardDisc2X, nId[" + nSessionId + "], type[" + paramInt + "]");
    bSend = true;
    fProgress = 0.0F;
    status = 2;
    nOpType = paramInt;
    int j = 0;
    int i = j;
    switch (paramInt)
    {
    default: 
      i = j;
    }
    while (selfUin.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))
    {
      QLog.e("FileManagerEngine<FileAssistant>", 1, "ForwardDisc2X, nId[" + nSessionId + "], type[" + paramInt + "] error");
      if (QLog.isDevelopLevel())
      {
        QLog.e("FileManagerEngine<FileAssistant>", 1, "讨论组转发，selfUin不能为自己！！！");
        throw new NullPointerException("讨论组转发，selfUin不能为自己！！！");
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId, peerUin, fileSize, selfUin, fileName, Uuid, strFileMd5);
        return;
        i = 3;
        continue;
        i = 25;
        continue;
        Object localObject;
        if ((TextUtils.isEmpty(strTroopFileUuid)) || (mContext == null))
        {
          localObject = FileManagerUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          strTroopFileUuid = ((IForwardCallBack)localObject).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), peerType, peerUin, peerType, Uuid, fileName, fileSize, nSessionId);
          mContext = localObject;
        }
        if ((busId != 102) && (busId != 104)) {
          busId = 102;
        }
        j = busId;
        i = j;
        if (!NetworkUtil.e(BaseApplication.getContext()))
        {
          i = j;
          if ((mContext instanceof IForwardCallBack))
          {
            localObject = BaseApplicationImpl.getContext().getString(2131368515);
            ((IForwardCallBack)mContext).a(false, strTroopFileUuid, nSessionId, 9004, (String)localObject, String.valueOf(peerUin), "");
            return;
          }
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.i("FileManagerEngine<FileAssistant>", 2, "ForwardDisc2X" + FileManagerUtil.a(paramFileManagerEntity));
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramFileManagerEntity, i);
  }
  
  public void a(FileManagerEntity paramFileManagerEntity, String paramString1, String paramString2, int paramInt)
  {
    paramFileManagerEntity = a().a(paramFileManagerEntity, paramString1, paramString2, paramInt);
    FileManagerUtil.b(nSessionId);
    FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, paramString2, paramFileManagerEntity);
    a().a(paramFileManagerEntity, paramInt, false);
  }
  
  public void a(WeiYunFileInfo paramWeiYunFileInfo)
  {
    a().a(paramWeiYunFileInfo);
  }
  
  public void a(String paramString)
  {
    int i = 0;
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Up_sent_files", 0, 0, "", paramString, "", "");
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Grp", "Succ_upload", 0, 0, "", paramString, String.valueOf(FMDataCache.b().size()), "");
    while (i < FMDataCache.b().size())
    {
      a(((FileInfo)FMDataCache.b().get(i)).d(), paramString);
      i += 1;
    }
    FMDataCache.b();
  }
  
  public void a(String paramString, int paramInt1, int paramInt2, long paramLong)
  {
    a().a(paramString, paramInt1, paramInt2, paramLong);
  }
  
  public void a(String paramString1, int paramInt1, String paramString2, long paramLong, int paramInt2, String paramString3)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramInt1, paramString2, paramLong, paramInt2, paramString3, null);
  }
  
  public void a(String paramString, long paramLong, int paramInt)
  {
    a(paramLong, paramString, paramInt);
  }
  
  public void a(String paramString1, String paramString2)
  {
    a().a(paramString1, paramString2);
  }
  
  public void a(String paramString1, String paramString2, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i("FileManagerEngine<FileAssistant>", 2, "sendAllSelectedFiles, strSendUin[" + FileManagerUtil.e(paramString1) + "], recvUin[" + FileManagerUtil.e(paramString2) + "], peerType[" + paramInt + "]");
    }
    for (;;)
    {
      try
      {
        Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSharedPreferences("aio_last_select_file", 0).edit();
        ((SharedPreferences.Editor)localObject).putBoolean("last_select_send", true);
        ((SharedPreferences.Editor)localObject).commit();
        i = 0;
        if (i < FMDataCache.e().size())
        {
          localObject = (WeiYunFileInfo)FMDataCache.e().get(i);
          FileManagerReporter.a("0X8005415");
          b(FileManagerUtil.a((WeiYunFileInfo)localObject), paramString1, paramString2, paramInt);
          i += 1;
          continue;
          if (i >= FMDataCache.d().size()) {
            break label477;
          }
          localObject = (OfflineFileInfo)FMDataCache.d().get(i);
          localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(FileManagerUtil.a((OfflineFileInfo)localObject, paramInt), paramString1, paramString2, paramInt, true);
          peerType = paramInt;
          status = 2;
          if (paramInt == 3000) {
            nOpType = 28;
          }
          a((FileManagerEntity)localObject);
          i += 1;
          continue;
          if (i >= FMDataCache.c().size()) {
            break label483;
          }
          localObject = (FileManagerEntity)FMDataCache.c().get(i);
          FileCategoryUtil.a((FileManagerEntity)localObject);
          FileManagerReporter.a("0X8005413");
          a(nSessionId, paramString1, paramString2, paramInt, true);
          i += 1;
          continue;
          if (i < FMDataCache.b().size())
          {
            localObject = ((FileInfo)FMDataCache.b().get(i)).d();
            FileManagerReporter.a("0X8005414");
            astrApkPackageName = ((FileInfo)FMDataCache.b().get(i)).c();
            i += 1;
            continue;
          }
          i = FileManagerUtil.e(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          if ((paramInt == 0) && (i < 3) && (FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramString2)))
          {
            FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramString2, false);
            paramString1 = BaseApplicationImpl.getContext().getString(2131366054);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramInt, 62527, paramString1);
            FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), i + 1);
          }
          return;
        }
      }
      catch (Exception paramString1)
      {
        return;
      }
      int i = 0;
      continue;
      label477:
      i = 0;
      continue;
      label483:
      i = 0;
    }
  }
  
  public void a(String paramString1, String paramString2, String paramString3, boolean paramBoolean)
  {
    QLog.i("FileManagerEngine<FileAssistant>", 1, "deleteOfflineFile, peerUin[" + FileManagerUtil.e(paramString1) + "],fileName[" + paramString2 + "],uuid[" + paramString3 + "]");
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramString3, paramString2, paramBoolean);
  }
  
  public void a(boolean paramBoolean)
  {
    int k = 0;
    if (QLog.isColorLevel()) {
      QLog.i("FileManagerEngine<FileAssistant>", 2, "delAllSelectedFiles, bDelLocalFile[" + paramBoolean + "]");
    }
    int i = 0;
    for (;;)
    {
      if (i < FMDataCache.b().size())
      {
        String str = ((FileInfo)FMDataCache.b().get(i)).d();
        try
        {
          FileUtil.a(new File(str));
          i += 1;
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("FileManagerEngine<FileAssistant>", 2, "delAllSelectedFiles local exception:" + localException1.toString());
            }
          }
        }
      }
    }
    i = 0;
    int j;
    for (;;)
    {
      j = k;
      if (i >= FMDataCache.e().size()) {
        break;
      }
      a((WeiYunFileInfo)FMDataCache.e().get(i));
      i += 1;
    }
    for (;;)
    {
      if (j < FMDataCache.c().size())
      {
        FileManagerEntity localFileManagerEntity = (FileManagerEntity)FMDataCache.c().get(j);
        FileCategoryUtil.a(localFileManagerEntity);
        b(nSessionId);
        if (3 == cloudType) {}
        try
        {
          FileUtil.a(new File(localFileManagerEntity.getFilePath()));
          if ((paramBoolean) && (!TextUtils.isEmpty(Uuid)) && (3000 != peerType))
          {
            status = 16;
            a(String.valueOf(peerUin), fileName, Uuid, bSend);
          }
          j += 1;
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("FileManagerEngine<FileAssistant>", 2, "delAllSelectedFiles recent exception:" + localException2.toString());
            }
          }
        }
      }
    }
  }
  
  public boolean a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b();
  }
  
  public boolean a(int paramInt1, long paramLong1, long paramLong2, int paramInt2, String paramString1, String paramString2, String paramString3, long paramLong3, int paramInt3, boolean paramBoolean, long paramLong4)
  {
    TroopFileTransferManager localTroopFileTransferManager = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramLong1);
    IForwardCallBack localIForwardCallBack = null;
    switch (paramInt1)
    {
    }
    for (;;)
    {
      localTroopFileTransferManager.a(paramInt3, paramLong1, paramInt2, paramLong2, paramInt1, paramString2, paramString3, paramLong3, paramString1, paramBoolean, paramLong4, localIForwardCallBack);
      return true;
      localIForwardCallBack = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      continue;
      localIForwardCallBack = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
      continue;
      localIForwardCallBack = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1);
    }
  }
  
  public boolean a(long paramLong)
  {
    QLog.i("FileManagerEngine<FileAssistant>", 1, "sessionid[" + String.valueOf(paramLong) + "] call Pause");
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
    if (localFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.w("FileManagerEngine<FileAssistant>", 2, "sessionid[" + String.valueOf(paramLong) + "] item is not exist");
      }
      return false;
    }
    if ((localFileManagerEntity.getCloudType() == 0) && (1 != nOpType))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
      return true;
    }
    FileManagerReporter.fileAssistantReportData localFileAssistantReportData;
    if (1 == nOpType)
    {
      localFileAssistantReportData = new FileManagerReporter.fileAssistantReportData();
      b = "recv_file_cancel";
      FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), localFileAssistantReportData);
    }
    while ((peerUin == null) || (uniseq == -1L))
    {
      return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
      if (nOpType == 0)
      {
        localFileAssistantReportData = new FileManagerReporter.fileAssistantReportData();
        b = "send_file_cancel";
        FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), localFileAssistantReportData);
      }
    }
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(peerUin, uniseq, peerType);
  }
  
  public boolean a(long paramLong, String paramString)
  {
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramLong);
    if (localFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "why entity is null you can choose!!!");
      }
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d("FileManagerEngine<FileAssistant>", 2, "Printe FileManagerEntity InfoItem [" + FileManagerUtil.a(localFileManagerEntity) + " ]");
    }
    return a(localFileManagerEntity.getFilePath(), paramString);
  }
  
  public boolean a(long paramLong1, String paramString, long paramLong2, long paramLong3, int paramInt1, int paramInt2)
  {
    paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong1);
    if (paramString == null) {
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d("FileManagerEngine<FileAssistant>", 2, String.format("ForwardTroopFile==>fileName:%s|mEntrySessionID:%s|old filePath:%s", new Object[] { fileName, paramLong1 + "", strTroopFilePath }));
    }
    Object localObject = TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramLong2, Uuid, strTroopFilePath, fileName, fileSize, busId);
    if ((localObject == null) || (d == null)) {
      return false;
    }
    if (paramInt1 == 1)
    {
      paramInt1 = Math.abs(new Random().nextInt());
      TroopFileStatusInfo localTroopFileStatusInfo = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramLong3).a(d, paramLong2, f, jdField_a_of_type_JavaLangString, b, e, paramInt1, paramLong1);
      paramLong2 = TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, String.valueOf(paramLong3), f, b, jdField_a_of_type_JavaUtilUUID.toString(), paramInt1, String.valueOf(jdField_a_of_type_Long), paramLong1);
      structMsgSeq = paramLong2;
      if (QLog.isColorLevel()) {
        QLog.d("FileManagerEngine<FileAssistant>", 2, "ForwardTroopFile, startCopyToGroup, entrySessionID:" + paramLong1 + "|InsertAIOMsg, msgSeq:" + paramLong2);
      }
      return true;
    }
    if ((paramInt1 == 3000) || (paramInt1 == 0))
    {
      localObject = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramLong2);
      if (paramLong2 != 0L) {
        break label568;
      }
    }
    label562:
    label568:
    for (paramLong1 = TroopUin;; paramLong1 = paramLong2)
    {
      ((TroopFileTransferManager)localObject).a(paramInt2, paramLong1, busId, paramLong3, paramInt1, fileName, strThumbPath, fileSize, strTroopFilePath, false, 0L, FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
      return true;
      if (paramInt1 == 7)
      {
        localObject = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramLong2);
        if (paramLong2 != 0L) {
          break label562;
        }
      }
      for (paramLong1 = TroopUin;; paramLong1 = paramLong2)
      {
        if (datalineEntitySessionId != 0L) {}
        for (boolean bool = true;; bool = false)
        {
          ((TroopFileTransferManager)localObject).a(paramInt2, paramLong1, busId, paramLong3, paramInt1, fileName, strThumbPath, fileSize, strTroopFilePath, bool, datalineEntitySessionId, FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0));
          break;
        }
        if (paramInt1 != 6003) {
          break;
        }
        localObject = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramLong2);
        if (paramLong2 == 0L) {}
        for (paramLong1 = TroopUin;; paramLong1 = paramLong2)
        {
          if (datalineEntitySessionId != 0L) {}
          for (bool = true;; bool = false)
          {
            ((TroopFileTransferManager)localObject).a(paramInt2, paramLong1, busId, paramLong3, 7, fileName, strThumbPath, fileSize, strTroopFilePath, bool, datalineEntitySessionId, FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1));
            break;
          }
        }
      }
    }
  }
  
  public boolean a(long paramLong, String paramString1, String paramString2, int paramInt, boolean paramBoolean)
  {
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramLong);
    if (localFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "why entity is null you can choose!!!");
      }
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d("FileManagerEngine<FileAssistant>", 2, "Printe FileManagerEntity InfoItem [" + FileManagerUtil.a(localFileManagerEntity) + " ]");
    }
    if (5 != cloudType) {
      FileManagerUtil.c(localFileManagerEntity);
    }
    if ((localFileManagerEntity.getCloudType() == 2) && (WeiYunFileId != null) && (paramBoolean))
    {
      if (QLog.isColorLevel()) {
        QLog.d("FileManagerEngine<FileAssistant>", 2, "Send lastOperation list type id weiyun to offlinefile, fileid[" + WeiYunFileId + "], filename[" + fileName + "], filename[" + fileSize + "]");
      }
      FileManagerUtil.b(nSessionId);
      if ((paramString1 == null) || (paramString1.length() == 0)) {
        a(localFileManagerEntity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramString2, paramInt);
      }
    }
    for (;;)
    {
      return false;
      b(localFileManagerEntity, paramString1, paramString2, paramInt);
      continue;
      if ((localFileManagerEntity.getCloudType() == 1) && (Uuid != null) && (Uuid.length() > 0))
      {
        if (QLog.isColorLevel()) {
          QLog.d("FileManagerEngine<FileAssistant>", 2, "cloud is offline,so try offline to offline!, nSessionId[" + paramLong + "], strSendUin[" + FileManagerUtil.e(paramString1) + "], recvUin[" + FileManagerUtil.e(paramString2) + "], peerType[" + paramInt + "], toOffline[" + paramBoolean + "]");
        }
        Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
        if ((paramInt == 1004) || (paramInt == 1000)) {
          localObject = paramString1;
        }
        for (;;)
        {
          localObject = a(localFileManagerEntity, (String)localObject, paramString2, paramInt, true);
          FileManagerUtil.b(nSessionId);
          FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1, paramString2, (FileManagerEntity)localObject);
          peerType = peerType;
          if (peerType != 3000) {
            break label488;
          }
          if (paramInt != 3000) {
            break label471;
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((FileManagerEntity)localObject, 22);
          break;
          if (paramInt == 1006) {
            localObject = paramString1;
          }
        }
        label471:
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((FileManagerEntity)localObject, 21);
        continue;
        label488:
        if (paramInt == 3000) {
          nOpType = 28;
        }
        a((FileManagerEntity)localObject);
      }
      else
      {
        if (localFileManagerEntity.getFilePath() != null) {
          return a(localFileManagerEntity.getFilePath(), paramString1, paramString2, paramInt, paramBoolean) != null;
        }
        if (QLog.isColorLevel()) {
          QLog.e("FileManagerEngine<FileAssistant>", 2, "what's type for this file!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }
      }
    }
  }
  
  public boolean a(String paramString, long paramLong, int paramInt)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramLong, paramInt);
  }
  
  public boolean a(String paramString1, String paramString2)
  {
    if (TextUtils.isEmpty(paramString1)) {
      return false;
    }
    Object localObject = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(paramString2));
    if (localObject != null)
    {
      int i = Math.abs(new Random().nextInt());
      localObject = ((TroopFileTransferManager)localObject).a(paramString1, true, i);
      paramString1 = new File(paramString1);
      TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString2, paramString1.getName(), paramString1.length(), jdField_a_of_type_JavaUtilUUID.toString(), i, null, 0L);
    }
    return true;
  }
  
  public String b(FileManagerEntity paramFileManagerEntity, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOfflineVideoThumbDownLoader == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOfflineVideoThumbDownLoader = new OfflineVideoThumbDownLoader(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOfflineVideoThumbDownLoader.a(paramFileManagerEntity, paramInt);
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b();
  }
  
  public void b(long paramLong, String paramString)
  {
    a(3, paramLong, paramString);
  }
  
  public void b(FileManagerEntity paramFileManagerEntity)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "ReviceFile,entity is null!");
      }
      return;
    }
    switch (paramFileManagerEntity.getCloudType())
    {
    }
    for (;;)
    {
      i();
      return;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.w("FileManagerEngine<FileAssistant>", 2, "ReviceFile, but entity is localFile");
      return;
      if (QLog.isColorLevel()) {
        QLog.w("FileManagerEngine<FileAssistant>", 2, "ReviceFile, entity is CLOUD_TYPE_OFFLINE ,peerType[" + peerType + "]");
      }
      a(nSessionId, uniseq, peerUin, peerType, 1);
      continue;
      if (QLog.isColorLevel()) {
        QLog.w("FileManagerEngine<FileAssistant>", 2, "ReviceFile, entity is CLOUD_TYPE_WEIYUN ,peerType[" + peerType + "]");
      }
      a(nSessionId, uniseq, peerUin, peerType, 5);
    }
  }
  
  public void b(FileManagerEntity paramFileManagerEntity, String paramString1, String paramString2, int paramInt)
  {
    if (paramInt == 1)
    {
      a().a(paramFileManagerEntity, paramString2);
      return;
    }
    String str;
    if (paramString1 != null)
    {
      str = paramString1;
      if (paramString1.length() != 0) {}
    }
    else
    {
      str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    }
    a(paramFileManagerEntity, str, paramString2, paramInt);
  }
  
  public void b(String paramString)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString);
  }
  
  public void b(String paramString1, String paramString2)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString1, paramString2);
  }
  
  public boolean b()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
  }
  
  public boolean b(long paramLong)
  {
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
    boolean bool1;
    if (localFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("FileManagerEngine<FileAssistant>", 2, "delete record fail. entity is null, sessionid: " + paramLong);
      }
      bool1 = false;
      return bool1;
    }
    if (localFileManagerEntity.getCloudType() == 0) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong);
    }
    for (;;)
    {
      boolean bool2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
      bool1 = bool2;
      if (localFileManagerEntity == null) {
        break;
      }
      bool1 = bool2;
      if (!bDelInAio) {
        break;
      }
      bool1 = bool2;
      if (!bDelInFM) {
        break;
      }
      bool1 = bool2;
      if (localFileManagerEntity.getCloudType() != 0) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(nSessionId);
      return bool2;
      if ((!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong)) && (QLog.isColorLevel())) {
        QLog.w("FileManagerEngine<FileAssistant>", 2, "Pause[" + String.valueOf(paramLong) + "] faild!,status[" + String.valueOf(status) + "]");
      }
    }
  }
  
  public String c(FileManagerEntity paramFileManagerEntity, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscVideoThumbDownloader == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscVideoThumbDownloader = new DiscVideoThumbDownloader(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreDiscVideoThumbDownloader.a(paramFileManagerEntity, paramInt);
  }
  
  public void c()
  {
    a().a();
  }
  
  public void c(String paramString)
  {
    a().a(paramString);
  }
  
  public boolean c()
  {
    return a().a();
  }
  
  public void d()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
  }
  
  public void d(String paramString)
  {
    jdField_a_of_type_ComTencentMobileqqFilemanagerCoreWeiYunLogicCenter.b(paramString);
  }
  
  public boolean d()
  {
    return false;
  }
  
  public void e()
  {
    a().b();
  }
  
  public void f()
  {
    BaseApplicationImpl.a.unregisterReceiver(jdField_a_of_type_Orj);
    jdField_a_of_type_Orj = null;
    FMSettings.a().b();
    FileViewMusicService.a().c();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false);
  }
  
  public void g()
  {
    if (QLog.isColorLevel()) {
      QLog.i("FileManagerEngine<FileAssistant>", 2, "downLoadAllSelectFiles,weiyun[" + FMDataCache.e().size() + "], offline[" + FMDataCache.d().size() + "], recent[" + FMDataCache.c().size() + "], localfile[" + FMDataCache.b().size() + "]");
    }
    int i = 0;
    FileManagerEntity localFileManagerEntity;
    while (i < FMDataCache.e().size())
    {
      localFileManagerEntity = FileManagerUtil.a((WeiYunFileInfo)FMDataCache.e().get(i));
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
      if (QLog.isColorLevel()) {
        QLog.i("FileManagerEngine<FileAssistant>", 2, "downWeiYunFiles,weiyun[" + i + "]");
      }
      a(nSessionId, uniseq, peerUin, peerType, 5);
      i += 1;
    }
    i = 0;
    while (i < FMDataCache.d().size())
    {
      localFileManagerEntity = FileManagerUtil.a((OfflineFileInfo)FMDataCache.d().get(i), 0);
      status = 2;
      if (QLog.isColorLevel()) {
        QLog.i("FileManagerEngine<FileAssistant>", 2, "downOfflineFiles,weiyun[" + i + "]");
      }
      a(nSessionId, uniseq, peerUin, peerType, 8);
      i += 1;
    }
    i = 0;
    if (i < FMDataCache.c().size())
    {
      localFileManagerEntity = (FileManagerEntity)FMDataCache.c().get(i);
      FileCategoryUtil.a(localFileManagerEntity);
      switch (localFileManagerEntity.getCloudType())
      {
      default: 
        if (QLog.isColorLevel()) {
          QLog.i("FileManagerEngine<FileAssistant>", 2, "unknow type,Engity:" + FileManagerUtil.a(localFileManagerEntity));
        }
        break;
      }
      for (;;)
      {
        i += 1;
        break;
        if (QLog.isColorLevel())
        {
          QLog.i("FileManagerEngine<FileAssistant>", 2, "downRecentFiles,local[" + i + "] break");
          continue;
          if (QLog.isColorLevel()) {
            QLog.i("FileManagerEngine<FileAssistant>", 2, "downRecentFiles,offline[" + i + "]");
          }
          a(nSessionId, uniseq, peerUin, peerType, 8);
          continue;
          if (QLog.isColorLevel()) {
            QLog.i("FileManagerEngine<FileAssistant>", 2, "downRecentFiles,weiyun[" + i + "]");
          }
          a(nSessionId, uniseq, peerUin, peerType, 5);
        }
      }
    }
  }
  
  public void h()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSharedPreferences("OfflineFileConfigV2", 0).edit().putBoolean("HasNewDownload", false).commit();
  }
  
  public void i()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSharedPreferences("OfflineFileConfigV2", 0).edit().putBoolean("HasNewDownload", true).commit();
  }
}
