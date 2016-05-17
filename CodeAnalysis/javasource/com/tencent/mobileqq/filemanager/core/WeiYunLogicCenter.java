package com.tencent.mobileqq.filemanager.core;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.data.FMDataCache;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.WeiYunFileInfo;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.ShieldMsgManger;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.mobileqq.troop.data.TroopFileStatusInfo;
import com.tencent.mobileqq.troop.utils.TroopFileTransferManager;
import com.tencent.mobileqq.troop.utils.TroopFileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.weiyun.sdk.IWyCloudFileSystem;
import com.weiyun.sdk.IWyFileSystem;
import com.weiyun.sdk.IWyFileSystem.ThumbnailType;
import com.weiyun.sdk.IWyTaskManager;
import com.weiyun.sdk.IWyTaskManager.Task;
import cooperation.weiyun.WeiyunHelper;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import ovr;
import ovs;
import ovt;
import ovu;
import ovv;
import ovw;
import ovx;
import ovy;
import ovz;
import owa;
import owb;
import owc;
import tencent.im.cs.cmd0x31b.Cmd0X31B.ExtensionReq;

public class WeiYunLogicCenter
{
  static final String jdField_a_of_type_JavaLangString = "WeiYunLogicCenter<FileAssistant>";
  static boolean jdField_a_of_type_Boolean = false;
  public int a;
  public QQAppInterface a;
  IWyFileSystem jdField_a_of_type_ComWeiyunSdkIWyFileSystem;
  public LinkedHashMap a;
  public List a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public WeiYunLogicCenter(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    if (jdField_a_of_type_Boolean) {
      WeiyunHelper.a();
    }
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem = WeiyunHelper.a();
    jdField_a_of_type_Boolean = true;
  }
  
  public FileManagerEntity a(FileManagerEntity paramFileManagerEntity, String paramString)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "insertOfflineFile2WeiYunEntity : entity is null!");
      }
      FileManagerUtil.a();
      return null;
    }
    if (paramString == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "insertOfflineFile2WeiYunEntity : fromUin is null!");
      }
      FileManagerUtil.a();
      return null;
    }
    FileManagerEntity localFileManagerEntity = new FileManagerEntity();
    localFileManagerEntity.copyFrom(paramFileManagerEntity);
    nSessionId = FileManagerUtil.a().longValue();
    uniseq = -1L;
    nOpType = 4;
    peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, null, peerType);
    peerType = peerType;
    peerUin = paramString;
    if (peerType == 3000) {}
    for (selfUin = peerUin;; selfUin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount())
    {
      srvTime = (MessageCache.a() * 1000L);
      status = 2;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
      if (QLog.isColorLevel()) {
        QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "insertWeiYun2OfflineEntity FileManagerEntity:" + FileManagerUtil.a(localFileManagerEntity));
      }
      return localFileManagerEntity;
    }
  }
  
  public FileManagerEntity a(FileManagerEntity paramFileManagerEntity, String paramString1, String paramString2, int paramInt)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "insertWeiYun2OfflineEntity : entity is null, peerUin[" + FileManagerUtil.e(paramString2) + "], peerType[" + paramInt + "]");
      }
      return null;
    }
    FileManagerEntity localFileManagerEntity = new FileManagerEntity();
    localFileManagerEntity.copyFrom(paramFileManagerEntity);
    nSessionId = FileManagerUtil.a().longValue();
    String str = TransfileUtile.a("", 0L, 0, true);
    long l = a64536uniseq;
    uniseq = l;
    peerUin = paramString2;
    localFileManagerEntity.setCloudType(2);
    nOpType = 3;
    peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString2, null, paramInt);
    peerType = paramInt;
    selfUin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    srvTime = (MessageCache.a() * 1000L);
    status = 2;
    msgSeq = FileManagerUtil.a();
    msgUid = FileManagerUtil.b();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
    paramFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    if ((paramInt == 1004) || (paramInt == 1000)) {
      paramFileManagerEntity = paramString1;
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString2, paramFileManagerEntity, true, fileName, fileSize, true, paramInt, str, msgSeq, msgSeq, null, 2, l, msgUid, -1L, MessageCache.a());
      if (QLog.isColorLevel()) {
        QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "insertWeiYun2OfflineEntity peerType[" + paramInt + "],FileManagerEntity:" + FileManagerUtil.a(localFileManagerEntity));
      }
      return localFileManagerEntity;
      if (paramInt == 1006)
      {
        tmpSessionFromPhone = paramString1;
        tmpSessionToPhone = paramString2;
        paramFileManagerEntity = paramString1;
      }
    }
  }
  
  public IWyTaskManager.Task a(String paramString, Object paramObject)
  {
    if (paramString == null) {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "uploadWeiYunFile strPath is null");
      }
    }
    do
    {
      return null;
      if (QLog.isColorLevel()) {
        QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "uploadWeiYunFile, strPath[" + paramString + "]");
      }
      paramString = jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getTaskManager().createUploadTask(paramString, paramObject);
      if (paramString != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "uploadWeiYunFile create upload task faild!");
    return null;
    return paramString;
  }
  
  public IWyTaskManager.Task a(String paramString1, String paramString2, long paramLong1, long paramLong2, Object paramObject)
  {
    if (paramString1 == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "downLoadWeiYunFile fileId is null");
      }
      paramString1 = null;
      return paramString1;
    }
    if (paramString2 == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "downLoadWeiYunFile fileName is null!");
      }
      return null;
    }
    if (QLog.isColorLevel()) {
      if ("downLoadWeiYunFile, fileId[" + paramString1 + "], fileName[" + paramString2 + "], fileName[" + paramString2 != null) {
        break label144;
      }
    }
    label144:
    for (String str = "null";; str = paramString2 + "], fileSize[" + String.valueOf(paramLong1) + "],modifyTime[" + String.valueOf(paramLong2) + "]")
    {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, str);
      paramString2 = jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getTaskManager().createDownloadTask(paramString1, paramString2, paramLong1, paramLong2, paramObject);
      paramString1 = paramString2;
      if (paramString2 != null) {
        break;
      }
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "create download task faild!");
      }
      return null;
    }
  }
  
  public String a(String paramString, int paramInt, boolean paramBoolean, Object paramObject)
  {
    int i = 1;
    if ((paramString == null) || (paramString.length() == 0))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 39, new Object[] { paramString, paramObject });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "getOfflinePicThumb : strUuid error");
      }
      localObject1 = null;
    }
    do
    {
      return localObject1;
      QLog.d("WeiYunLogicCenter<FileAssistant>", 1, "getOfflinePicThumb strUuid[" + paramString + "], WeiYunThumbnailType[" + paramInt + "]");
      localObject2 = jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getOfflineFileThumbnail(paramString, IWyFileSystem.ThumbnailType.values()[paramInt]);
      localObject1 = localObject2;
    } while (localObject2 != null);
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 39, new Object[] { paramString, paramObject });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "getOfflinePicThumb : network error");
      }
      return null;
    }
    Object localObject1 = jdField_a_of_type_ComWeiyunSdkIWyFileSystem;
    Object localObject2 = IWyFileSystem.ThumbnailType.values()[paramInt];
    if (paramBoolean) {}
    for (paramInt = i;; paramInt = 2)
    {
      ((IWyFileSystem)localObject1).getOfflineFileThumbnail(paramString, (IWyFileSystem.ThumbnailType)localObject2, paramInt, paramObject, new owa(this));
      return null;
    }
  }
  
  public String a(String paramString1, String paramString2, int paramInt, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "getWeiYunThumb : strFileId[" + paramString1 + "], strFileName[" + paramString2 + "], WeiYunThumbnailType[" + paramInt + "]");
    }
    Object localObject;
    if ((paramString1 == null) || (paramString1.length() == 0))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 39, new Object[] { paramString1, paramObject });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "getWeiYunThumb : fileID error");
      }
      localObject = null;
    }
    String str;
    do
    {
      return localObject;
      str = jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getThumbnail(paramString1, IWyFileSystem.ThumbnailType.values()[paramInt], paramString2, 0L);
      localObject = str;
    } while (str != null);
    if ((!NetworkUtil.e(BaseApplication.getContext())) || (paramString1 == null))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 39, new Object[] { paramString1, paramObject });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "getWeiYunThumb : network error");
      }
      return null;
    }
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getThumbnail(paramString1, IWyFileSystem.ThumbnailType.values()[paramInt], paramString2, 0L, paramObject, new ovz(this));
    return null;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunTypeList");
    }
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 30, new Object[] { Integer.valueOf(0), "network error" });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunTypeList : network error");
      }
      return;
    }
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().listCategory(new ovr(this));
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "queryOfflineFileList, type[" + paramInt1 + "], offset[" + paramInt2 + "], count[" + paramInt3 + "]");
    }
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 32, new Object[] { Integer.valueOf(0), "network error" });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "net work error");
      }
      return;
    }
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().listOfflineFiles(paramInt1, paramInt2, paramInt3, new ovw(this));
  }
  
  public void a(FileManagerEntity paramFileManagerEntity, int paramInt, boolean paramBoolean)
  {
    if (paramFileManagerEntity == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "sendWeiYun2OfflineFile : entity is null");
      }
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0L, "actFileWy2Of", 0L, "", "", "", "", 9006L, "entity is null", 0L, 0L, 0L, "", "", 0, "", null);
      FileManagerUtil.a();
      return;
    }
    status = 2;
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      status = 0;
      isReaded = false;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 3, null);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 33, new Object[] { Integer.valueOf(2), "", Long.valueOf(nSessionId) });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "sendWeiYun2OfflineFile : network error");
      }
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, nSessionId, "actFileWy2Of", 0L, "", peerUin, "", "", 9004L, "Error_No_Network", 0L, 0L, 0L, "", "", 0, "", null);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramFileManagerEntity);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "sendWyFile2QqOffline, peerUin[" + FileManagerUtil.e(peerUin) + "peerType[" + paramInt + "]" + "], WeiYunFileId[" + WeiYunFileId + "], fileName[" + fileName + "], fileSize[" + fileSize + "], nWeiYunSrcType[" + nWeiYunSrcType + "]");
    }
    fProgress = 0.0F;
    long l2 = 0L;
    try
    {
      l1 = Long.parseLong(peerUin.replace("+", ""));
      ShieldMsgManger localShieldMsgManger = (ShieldMsgManger)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(15);
      if ((localShieldMsgManger != null) && (localShieldMsgManger.a(peerUin)))
      {
        FileManagerUtil.a("该好友已被屏蔽！请先解除屏蔽！");
        status = 0;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 3, null);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 33, new Object[] { Integer.valueOf(10), "", Long.valueOf(nSessionId) });
        if (QLog.isColorLevel()) {
          QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "sendWeiYun2OfflineFile : shield");
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramFileManagerEntity);
        return;
      }
    }
    catch (NumberFormatException localNumberFormatException)
    {
      long l1;
      for (;;)
      {
        l1 = l2;
        if (QLog.isColorLevel())
        {
          QLog.w("WeiYunLogicCenter<FileAssistant>", 2, "number format failed!");
          l1 = l2;
        }
      }
      int i = 3;
      if (paramInt == 3000) {
        i = 106;
      }
      Object localObject = null;
      if (tmpSessionType > 0L)
      {
        Cmd0X31B.ExtensionReq localExtensionReq = new Cmd0X31B.ExtensionReq();
        uint64_type.set(tmpSessionType);
        uint64_id.set(3L);
        if (tmpSessionType == 102L) {
          str_dst_phonenum.set(peerUin);
        }
        tmpSessionSig = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, peerUin, (int)tmpSessionType);
        localObject = localExtensionReq;
        if (tmpSessionSig != null)
        {
          localObject = localExtensionReq;
          if (tmpSessionSig.length > 0)
          {
            bytes_sig.set(ByteStringMicro.copyFrom(tmpSessionSig));
            localObject = localExtensionReq;
          }
        }
      }
      jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().sendWyFile2Ftn(WeiYunFileId, fileName, fileSize, nWeiYunSrcType, null, l1, i, null, localObject, new ovx(this, paramFileManagerEntity, paramInt));
      FileManagerUtil.b(nSessionId);
    }
  }
  
  public void a(FileManagerEntity paramFileManagerEntity, String paramString)
  {
    if (paramFileManagerEntity == null) {
      if (QLog.isColorLevel()) {
        QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "sendWeiYun2Troop : entity is null");
      }
    }
    TroopFileTransferManager localTroopFileTransferManager;
    TroopFileStatusInfo localTroopFileStatusInfo;
    do
    {
      int i;
      do
      {
        do
        {
          return;
          localTroopFileTransferManager = TroopFileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.valueOf(paramString).longValue());
        } while (localTroopFileTransferManager == null);
        i = Math.abs(new Random().nextInt());
        localTroopFileStatusInfo = localTroopFileTransferManager.a(WeiYunFileId, fileName, paramFileManagerEntity.getFilePath(), fileSize, 25, i, 8888L);
      } while (localTroopFileStatusInfo == null);
      TroopFileUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, fileName, fileSize, a.toString(), i, String.valueOf(8888L), nSessionId);
      status = 2;
      if (NetworkUtil.e(BaseApplication.getContext())) {
        break;
      }
      status = 0;
      isReaded = false;
      localTroopFileTransferManager.a(a, -1, null, "当前网络不可用，请检查你的网络设置");
    } while (!QLog.isColorLevel());
    QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "sendWeiYun2Troop : network error");
    return;
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "sendWeiYun2Troop, peerUin[" + FileManagerUtil.e(peerUin) + "], WeiYunFileId[" + WeiYunFileId + "], fileName[" + fileName + "], fileSize[" + fileSize + "], nWeiYunSrcType[" + nWeiYunSrcType + "]");
    }
    fProgress = 0.0F;
    long l2 = 0L;
    try
    {
      l1 = Long.parseLong(paramString);
      paramString = null;
      if (tmpSessionType > 0L)
      {
        Cmd0X31B.ExtensionReq localExtensionReq = new Cmd0X31B.ExtensionReq();
        uint64_type.set(tmpSessionType);
        uint64_id.set(3L);
        if (tmpSessionType == 102L) {
          str_dst_phonenum.set(peerUin);
        }
        tmpSessionSig = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, peerUin, (int)tmpSessionType);
        paramString = localExtensionReq;
        if (tmpSessionSig != null)
        {
          paramString = localExtensionReq;
          if (tmpSessionSig.length > 0)
          {
            bytes_sig.set(ByteStringMicro.copyFrom(tmpSessionSig));
            paramString = localExtensionReq;
          }
        }
      }
      jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().sendWyFile2Ftn(WeiYunFileId, fileName, fileSize, nWeiYunSrcType, strFileMd5, l1, 102, null, paramString, new ovy(this, paramFileManagerEntity, localTroopFileTransferManager, localTroopFileStatusInfo));
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId);
      return;
    }
    catch (NumberFormatException paramString)
    {
      for (;;)
      {
        long l1 = l2;
        if (QLog.isColorLevel())
        {
          QLog.w("WeiYunLogicCenter<FileAssistant>", 2, "number format failed!");
          l1 = l2;
        }
      }
    }
  }
  
  public void a(WeiYunFileInfo paramWeiYunFileInfo)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "deleteWeiYunFile, strFileId[" + String.valueOf(a) + "],strFileName[" + b + "]");
    }
    FMDataCache.a(a, paramWeiYunFileInfo);
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().deleteWyFile(a, c, new owc(this, paramWeiYunFileInfo));
  }
  
  public void a(IWyTaskManager.Task paramTask)
  {
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getTaskManager().submitTask(paramTask);
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "verifyPwd");
    }
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "verifyPwd : network error");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 45, new Object[] { Integer.valueOf(0), BaseApplication.getContext().getString(2131367213) });
      return;
    }
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().verifyIndependentPassword(paramString, null, new ovt(this));
  }
  
  public void a(String paramString, int paramInt1, int paramInt2, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunFileList, categoryId[" + paramString + "], offset[" + paramInt1 + "], count[" + paramInt2 + "], timestamp[" + paramLong + "]");
    }
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 31, new Object[] { Integer.valueOf(0), "network error", paramString });
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunFileList : network error");
      }
    }
    do
    {
      return;
      if (paramInt1 == 0)
      {
        if (jdField_a_of_type_JavaUtilLinkedHashMap != null) {
          jdField_a_of_type_JavaUtilLinkedHashMap.clear();
        }
        jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
        jdField_a_of_type_Int = 0;
      }
      while (jdField_a_of_type_JavaUtilLinkedHashMap != null)
      {
        jdField_a_of_type_Int += 1;
        jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().listCloudFiles(paramString, paramInt1, paramInt2, paramLong, new ovv(this, paramString));
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.e("WeiYunLogicCenter<FileAssistant>", 2, "queryWeiyunFileList : start not from zero?!");
  }
  
  public void a(String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("WeiYunLogicCenter<FileAssistant>", 2, "getPreviewUrl strFileId[" + paramString1 + "], strName[" + paramString2 + "]");
    }
    if (!NetworkUtil.e(BaseApplication.getContext()))
    {
      if (QLog.isColorLevel()) {
        QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "getPreviewUrl : network error");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false, 40, new Object[] { Integer.valueOf(0), "network error" });
      return;
    }
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().getPreviewUrl(paramString1, paramString2, new owb(this));
  }
  
  public boolean a()
  {
    return jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().hasQueriedVerifyPassword();
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.i("WeiYunLogicCenter<FileAssistant>", 2, "queryNeedVerifyPwd");
    }
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().needVerifyIndependentPassword(new ovs(this));
  }
  
  public void b(String paramString)
  {
    jdField_a_of_type_ComWeiyunSdkIWyFileSystem.getCloudFileSystem().getPreviewAddress(paramString, new ovu(this));
  }
}
