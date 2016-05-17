package com.tencent.mobileqq.data;

import android.database.Cursor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.persistence.unique;

public class DiscussionInfo
  extends Entity
{
  public long DiscussionFlag;
  public long createTime;
  public String discussionName;
  public String faceUinSet;
  public long groupCode;
  public long groupUin;
  public boolean hasCollect;
  public long infoSeq;
  @notColumn
  public long lastMsgTime;
  public int mComparePartInt;
  public String mCompareSpell;
  public String ownerUin;
  public long timeSec;
  @unique
  public String uin;
  
  public DiscussionInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    DiscussionFlag = 536870912L;
    hasCollect = false;
  }
  
  public static boolean isValidDisUin(String paramString)
  {
    boolean bool = false;
    try
    {
      long l = Long.valueOf(Long.parseLong(paramString)).longValue();
      if (l >= 1000000L) {
        bool = true;
      }
      return bool;
    }
    catch (NumberFormatException paramString) {}
    return false;
  }
  
  protected boolean entityByCursor(Cursor paramCursor)
  {
    uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
    infoSeq = paramCursor.getLong(paramCursor.getColumnIndex("infoSeq"));
    ownerUin = paramCursor.getString(paramCursor.getColumnIndex("ownerUin"));
    discussionName = paramCursor.getString(paramCursor.getColumnIndex("discussionName"));
    createTime = paramCursor.getLong(paramCursor.getColumnIndex("createTime"));
    timeSec = paramCursor.getLong(paramCursor.getColumnIndex("timeSec"));
    faceUinSet = paramCursor.getString(paramCursor.getColumnIndex("faceUinSet"));
    DiscussionFlag = paramCursor.getLong(paramCursor.getColumnIndex("DiscussionFlag"));
    mComparePartInt = paramCursor.getInt(paramCursor.getColumnIndex("mComparePartInt"));
    mCompareSpell = paramCursor.getString(paramCursor.getColumnIndex("mCompareSpell"));
    groupCode = paramCursor.getLong(paramCursor.getColumnIndex("groupCode"));
    groupUin = paramCursor.getLong(paramCursor.getColumnIndex("groupUin"));
    if (paramCursor.getInt(paramCursor.getColumnIndex("hasCollect")) != 0) {}
    for (boolean bool = true;; bool = false)
    {
      hasCollect = bool;
      return true;
    }
  }
  
  public boolean hasRenamed()
  {
    return (DiscussionFlag & 0x40) >>> 6 == 0L;
  }
}
