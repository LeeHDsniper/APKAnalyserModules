package com.tencent.mobileqq.filemanager.data;

import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.ConflictClause;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.persistence.unique;
import com.tencent.mobileqq.persistence.uniqueConstraints;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.qphone.base.util.QLog;

@uniqueConstraints(clause=ConflictClause.IGNORE, columnNames="nSessionId")
public class FileManagerEntity
  extends Entity
  implements Cloneable
{
  public long TroopUin;
  public String Uuid;
  public String WeiYunFileId;
  public boolean bDelInAio;
  public boolean bDelInFM;
  public boolean bSend;
  @notColumn
  public boolean bSetVerify;
  public byte[] bombData;
  public int busId;
  public int cloudType;
  @notColumn
  public long datalineEntitySessionId;
  public long dbVer;
  public int errCode;
  public float fOlRecvProgressOnNotify;
  public float fOlRecvSpeed;
  public float fProgress;
  public String fileName;
  public long fileSize;
  public int forwardTroopFileEntrance;
  @notColumn
  public boolean isFromrMolo;
  public boolean isReaded;
  public long lastTime;
  @notColumn
  public Object mContext;
  public long msgSeq;
  public long msgTime;
  public long msgUid;
  public int nFileType;
  public long nOLfileSessionId;
  public int nOlSenderProgress;
  public int nOpType;
  public long nRelatedSessionId;
  @unique
  public long nSessionId;
  public int nWeiYunSrcType;
  @notColumn
  public long peerDin;
  public String peerNick;
  public int peerType;
  public String peerUin;
  @notColumn
  public int qlmsgSrc;
  @notColumn
  public FileManagerEntity relatedEntity;
  public String selfUin;
  public long srvTime;
  public int status;
  public String strApkPackageName;
  @notColumn
  public String strDataLineMPFileID;
  public String strFileMd5;
  public String strFilePath;
  public String strFileSHA;
  @notColumn
  public String strLargeThumPath;
  public String strServerPath;
  public String strSrcName;
  public String strThumbPath;
  public String strTroopFileID;
  public String strTroopFilePath;
  public String strTroopFileSha1;
  public String strTroopFileUuid;
  public long structMsgSeq;
  public String tmpSessionFromPhone;
  public String tmpSessionRelatedUin;
  @notColumn
  public byte[] tmpSessionSig;
  public String tmpSessionToPhone;
  public long tmpSessionType;
  @notColumn
  public int transSpeed;
  public long uniseq;
  
  public FileManagerEntity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    bSetVerify = false;
    nSessionId = 0L;
    uniseq = -1L;
    peerType = 0;
    srvTime = (MessageCache.a() * 1000L);
    nOpType = -1;
    setCloudType(-1);
    fileSize = 0L;
    status = -1;
    nFileType = -1;
    fProgress = 0.0F;
    isReaded = false;
    nWeiYunSrcType = 0;
    lastTime = 0L;
    bDelInAio = false;
    bDelInFM = false;
    bSend = true;
    nOlSenderProgress = -1;
    fOlRecvSpeed = 0.0F;
    fOlRecvProgressOnNotify = 0.0F;
    dbVer = 50L;
    msgSeq = 0L;
    msgUid = 0L;
    nRelatedSessionId = 0L;
    msgTime = 0L;
    nOLfileSessionId = 0L;
    busId = 0;
    TroopUin = 0L;
    errCode = 0;
    transSpeed = 0;
    qlmsgSrc = 0;
    tmpSessionType = 0L;
  }
  
  public static String tableName()
  {
    return "mr_fileManager";
  }
  
  public FileManagerEntity clone()
  {
    try
    {
      FileManagerEntity localFileManagerEntity = (FileManagerEntity)super.clone();
      return localFileManagerEntity;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      localCloneNotSupportedException.printStackTrace();
    }
    return null;
  }
  
  public void copyFrom(FileManagerEntity paramFileManagerEntity)
  {
    try
    {
      if (bombData != null) {
        bombData = ((byte[])bombData.clone());
      }
      fileName = fileName;
      fileSize = fileSize;
      fProgress = fProgress;
      isReaded = isReaded;
      uniseq = uniseq;
      nFileType = nFileType;
      nOpType = nOpType;
      peerNick = peerNick;
      peerType = peerType;
      peerUin = peerUin;
      selfUin = selfUin;
      srvTime = srvTime;
      status = status;
      setFilePath(paramFileManagerEntity.getFilePath());
      setCloudType(paramFileManagerEntity.getCloudType());
      strServerPath = strServerPath;
      strThumbPath = strThumbPath;
      Uuid = Uuid;
      WeiYunFileId = WeiYunFileId;
      nWeiYunSrcType = nWeiYunSrcType;
      lastTime = lastTime;
      bSend = bSend;
      nOlSenderProgress = nOlSenderProgress;
      fOlRecvSpeed = fOlRecvSpeed;
      fOlRecvProgressOnNotify = fOlRecvProgressOnNotify;
      dbVer = dbVer;
      strSrcName = strSrcName;
      msgSeq = msgSeq;
      msgUid = msgUid;
      nRelatedSessionId = nRelatedSessionId;
      msgTime = msgTime;
      nOLfileSessionId = nOLfileSessionId;
      strFileMd5 = strFileMd5;
      strTroopFileID = strTroopFileID;
      strTroopFilePath = strTroopFilePath;
      busId = busId;
      TroopUin = TroopUin;
      structMsgSeq = structMsgSeq;
      errCode = errCode;
      strFileSHA = strFileSHA;
      tmpSessionType = tmpSessionType;
      tmpSessionRelatedUin = tmpSessionRelatedUin;
      tmpSessionFromPhone = tmpSessionFromPhone;
      tmpSessionToPhone = tmpSessionToPhone;
      return;
    }
    finally {}
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof FileManagerEntity)) {}
    while (nSessionId != nSessionId) {
      return false;
    }
    return true;
  }
  
  public int getCloudType()
  {
    return cloudType;
  }
  
  public String getFilePath()
  {
    return strFilePath;
  }
  
  public String getTableName()
  {
    return "mr_fileManager";
  }
  
  public boolean isFromProcessingBuddyForward2DatalineItem()
  {
    return (nOpType == 29) && ((status == 2) || (status == 0));
  }
  
  public boolean isFromProcessingForward2DatalineItem()
  {
    return (nOpType == 31) && ((status == 2) || (status == 0));
  }
  
  public boolean isFromProcessingForward2c2cOrDiscItem()
  {
    return ((nOpType == 24) || (nOpType == 25)) && ((status == 2) || (status == 0));
  }
  
  public void setCloudType(int paramInt)
  {
    cloudType = paramInt;
    if ((cloudType == 3) && (TextUtils.isEmpty(strFilePath)) && (bSetVerify))
    {
      QLog.w("FileManagerEntity<FileAssistant>", 1, "local file set entity filepath is null!");
      bSetVerify = false;
    }
    if ((cloudType == 3) && (TextUtils.isEmpty(strFilePath)) && (!bSetVerify)) {
      bSetVerify = true;
    }
    if ((peerType == 9501) && (3 == cloudType)) {
      cloudType = 8;
    }
  }
  
  public void setFilePath(String paramString)
  {
    strFilePath = paramString;
    if ((TextUtils.isEmpty(strFilePath)) && (bSetVerify))
    {
      QLog.w("FileManagerEntity<FileAssistant>", 1, "set entity strFilePath is null!");
      bSetVerify = false;
    }
    if ((TextUtils.isEmpty(strFilePath)) && (!bSetVerify)) {
      bSetVerify = true;
    }
  }
}
