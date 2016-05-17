package com.tencent.common.app;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.unique;
import com.tencent.mobileqq.service.message.MessageCache;

public class LifeOnlineAccountInfo
  extends Entity
{
  public static final int PRE_MSG_DELETED = 2;
  public static final int PRE_MSG_EXPIRED = 3;
  public static final int PRE_MSG_NORMAL = 1;
  public static final String QUERY_TABLE_FIELDS = "msgid,frienduin,selfuin, isPullRoam, needNofityConversation,isProxyMsg,  objdata, timestamp, showtime,pstate,uniseq";
  public static final String[] QUERY_TABLE_FIELDS_ARRAY = { "msgid", "frienduin", "isPullRoam", "needNofityConversation", "isProxyMsg", "objdata", "timestamp", "showtime", "pstate", "uniseq" };
  public String frienduin;
  public boolean isProxyMsg;
  public boolean isPullRoam;
  public long msgid;
  public boolean needNofityConversation;
  public byte[] objdata;
  public int pstate;
  public String selfuin;
  public long showtime;
  public long timestamp;
  @unique
  public long uniseq;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public LifeOnlineAccountInfo() {}
  
  public static String getTableNewName()
  {
    return "PreSendMsg_New";
  }
  
  public String getFriendUin()
  {
    return frienduin;
  }
  
  public boolean getIsProxyMsg()
  {
    return isProxyMsg;
  }
  
  public boolean getIsPullRoam()
  {
    return isPullRoam;
  }
  
  public String getMsgid()
  {
    return String.valueOf(msgid);
  }
  
  public boolean getNeedNofityConversation()
  {
    return needNofityConversation;
  }
  
  public byte[] getObjData()
  {
    return objdata;
  }
  
  public String getSelfUin()
  {
    return selfuin;
  }
  
  public String getShowtime()
  {
    return String.valueOf(showtime);
  }
  
  public int getState()
  {
    return pstate;
  }
  
  public String getTableName()
  {
    return getTableNewName();
  }
  
  public String getTimeStamp()
  {
    return String.valueOf(timestamp);
  }
  
  public long getuniseq()
  {
    return uniseq;
  }
  
  public void init(long paramLong1, long paramLong2, String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, byte[] paramArrayOfByte, long paramLong3, int paramInt, long paramLong4)
  {
    msgid = paramLong1;
    paramLong1 = paramLong2;
    if (paramLong2 <= 0L) {
      paramLong1 = (int)MessageCache.a();
    }
    showtime = paramLong1;
    selfuin = paramString1;
    frienduin = paramString2;
    isPullRoam = paramBoolean1;
    needNofityConversation = paramBoolean2;
    isProxyMsg = paramBoolean3;
    objdata = paramArrayOfByte;
    timestamp = paramLong3;
    pstate = paramInt;
    uniseq = paramLong4;
  }
  
  protected void prewrite()
  {
    super.prewrite();
  }
  
  public String toString()
  {
    new StringBuilder("-----Dump LifeOnlineAccountInfo-----").append(",classname:").append(getClass().getSimpleName()).append(",frienduin:").append(frienduin).append(",msgid:").append(msgid).append(",isProxyMsg:").append(isProxyMsg).append(",isPullRoam:").append(isPullRoam).append(",needNofityConversation:").append(needNofityConversation).append(",objdata:").append(objdata.length).append(",timestamp:").append(timestamp).append(",showtime:").append(showtime).append(",pstate:").append(pstate).append(",uniseq:").append(uniseq);
    return super.toString();
  }
}
