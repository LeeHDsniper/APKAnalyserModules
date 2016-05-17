package com.tencent.mobileqq.data;

import android.database.Cursor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.ConflictClause;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.persistence.uniqueConstraints;
import java.io.Serializable;

@uniqueConstraints(clause=ConflictClause.IGNORE, columnNames="troopuin,memberuin")
public class TroopMemberInfo
  extends Entity
  implements Serializable
{
  public static final long VALUE_DISTANCE_TO_SELF_EXPIRED = -1000L;
  public static final long VALUE_DISTANCE_TO_SELF_UNKOWN = -100L;
  public static final long VALUE_MEMBER_CLOSE_SHARE_LBS = -1001L;
  public long active_point;
  public byte age;
  public String alias;
  public String autoremark;
  public long credit_level;
  public long datetime;
  @notColumn
  public String displayedNamePinyinFirst;
  public int distance;
  public double distanceToSelf;
  public long distanceToSelfUpdateTimeStamp;
  public short faceid;
  public String friendnick;
  public long gagTimeStamp;
  public boolean isTroopFollowed;
  public long join_time;
  public long last_active_time;
  public int level;
  public boolean mIsShielded;
  public String mUniqueTitle;
  public int mUniqueTitleExpire;
  public String memberuin;
  public long msgseq;
  public String pyAll_autoremark;
  public String pyAll_friendnick;
  public String pyAll_troopnick;
  public String pyFirst_autoremark;
  public String pyFirst_friendnick;
  public String pyFirst_troopnick;
  public int qqVipInfo;
  public byte sex;
  public byte status;
  public int superQqInfo;
  public int superVipInfo;
  public String troopnick;
  public String troopremark;
  public String troopuin;
  
  public TroopMemberInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    qqVipInfo = 0;
    superQqInfo = 0;
    superVipInfo = 0;
    distance = 0;
    msgseq = -100L;
    distanceToSelf = -100.0D;
    distanceToSelfUpdateTimeStamp = 0L;
    mUniqueTitleExpire = 0;
  }
  
  protected boolean entityByCursor(Cursor paramCursor)
  {
    boolean bool2 = false;
    troopuin = paramCursor.getString(paramCursor.getColumnIndex("troopuin"));
    memberuin = paramCursor.getString(paramCursor.getColumnIndex("memberuin"));
    friendnick = paramCursor.getString(paramCursor.getColumnIndex("friendnick"));
    pyAll_friendnick = paramCursor.getString(paramCursor.getColumnIndex("pyAll_friendnick"));
    pyFirst_friendnick = paramCursor.getString(paramCursor.getColumnIndex("pyFirst_friendnick"));
    troopnick = paramCursor.getString(paramCursor.getColumnIndex("troopnick"));
    pyAll_troopnick = paramCursor.getString(paramCursor.getColumnIndex("pyAll_troopnick"));
    pyFirst_troopnick = paramCursor.getString(paramCursor.getColumnIndex("pyFirst_troopnick"));
    autoremark = paramCursor.getString(paramCursor.getColumnIndex("autoremark"));
    pyAll_autoremark = paramCursor.getString(paramCursor.getColumnIndex("pyAll_autoremark"));
    pyFirst_autoremark = paramCursor.getString(paramCursor.getColumnIndex("pyFirst_autoremark"));
    troopremark = paramCursor.getString(paramCursor.getColumnIndex("troopremark"));
    alias = paramCursor.getString(paramCursor.getColumnIndex("alias"));
    datetime = paramCursor.getLong(paramCursor.getColumnIndex("datetime"));
    faceid = paramCursor.getShort(paramCursor.getColumnIndex("faceid"));
    age = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("age")));
    sex = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("sex")));
    status = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("status")));
    qqVipInfo = paramCursor.getInt(paramCursor.getColumnIndex("qqVipInfo"));
    superQqInfo = paramCursor.getInt(paramCursor.getColumnIndex("superQqInfo"));
    superVipInfo = paramCursor.getInt(paramCursor.getColumnIndex("superVipInfo"));
    level = paramCursor.getInt(paramCursor.getColumnIndex("level"));
    join_time = paramCursor.getLong(paramCursor.getColumnIndex("join_time"));
    last_active_time = paramCursor.getLong(paramCursor.getColumnIndex("last_active_time"));
    active_point = paramCursor.getLong(paramCursor.getColumnIndex("active_point"));
    credit_level = paramCursor.getLong(paramCursor.getColumnIndex("credit_level"));
    if (paramCursor.getInt(paramCursor.getColumnIndex("isTroopFollowed")) != 0) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      isTroopFollowed = bool1;
      distance = paramCursor.getInt(paramCursor.getColumnIndex("distance"));
      msgseq = paramCursor.getLong(paramCursor.getColumnIndex("msgseq"));
      gagTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("gagTimeStamp"));
      distanceToSelf = paramCursor.getDouble(paramCursor.getColumnIndex("distanceToSelf"));
      distanceToSelfUpdateTimeStamp = paramCursor.getLong(paramCursor.getColumnIndex("distanceToSelfUpdateTimeStamp"));
      bool1 = bool2;
      if (paramCursor.getInt(paramCursor.getColumnIndex("mIsShielded")) != 0) {
        bool1 = true;
      }
      mIsShielded = bool1;
      mUniqueTitle = paramCursor.getString(paramCursor.getColumnIndex("mUniqueTitle"));
      mUniqueTitleExpire = paramCursor.getInt(paramCursor.getColumnIndex("mUniqueTitleExpire"));
      return true;
    }
  }
}
