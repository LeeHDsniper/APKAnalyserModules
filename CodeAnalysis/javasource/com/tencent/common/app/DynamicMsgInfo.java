package com.tencent.common.app;

import android.text.TextUtils;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.unique;

public class DynamicMsgInfo
  extends Entity
{
  public String frienduin;
  public boolean isRead;
  public byte[] mergedMsgData;
  public byte[] msgData;
  public int msgIndex;
  public String msgKey;
  public int msgKeyHash;
  public long msgid;
  @unique
  public long uinseq;
  
  public DynamicMsgInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static String getTableNameNew(String paramString)
  {
    if (!TextUtils.isEmpty(paramString)) {
      return "DynamicMsg_" + MsgProxyUtils.a(paramString) + "_New";
    }
    return "DynamicMsg_New";
  }
  
  public void deleteMergedData()
  {
    mergedMsgData = null;
  }
  
  public String getKey()
  {
    return msgKey;
  }
  
  public byte[] getMergedData()
  {
    return mergedMsgData;
  }
  
  public byte[] getMsgData()
  {
    return msgData;
  }
  
  public int getMsgIndex()
  {
    return msgIndex;
  }
  
  public String getMsgUid()
  {
    return String.valueOf(uinseq);
  }
  
  public String getTableName()
  {
    return getTableNameNew(frienduin);
  }
  
  public void init(String paramString1, String paramString2, int paramInt1, long paramLong1, int paramInt2, byte[] paramArrayOfByte, boolean paramBoolean, long paramLong2)
  {
    frienduin = paramString1;
    msgKey = paramString2;
    msgKeyHash = paramInt1;
    uinseq = paramLong1;
    msgIndex = paramInt2;
    msgData = paramArrayOfByte;
    isRead = paramBoolean;
    msgid = paramLong2;
  }
  
  public void setMergerMsgData(byte[] paramArrayOfByte)
  {
    mergedMsgData = paramArrayOfByte;
  }
}
