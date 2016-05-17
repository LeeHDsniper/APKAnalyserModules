package com.tencent.mobileqq.data;

import android.database.Cursor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.unique;

public class Groups
  extends Entity
{
  public long datetime;
  public int group_friend_count;
  @unique
  public int group_id;
  public String group_name;
  public int group_online_friend_count;
  public byte seqid;
  public int sqqOnLine_count;
  
  public Groups()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected boolean entityByCursor(Cursor paramCursor)
  {
    group_name = paramCursor.getString(paramCursor.getColumnIndex("group_name"));
    group_id = paramCursor.getInt(paramCursor.getColumnIndex("group_id"));
    group_friend_count = paramCursor.getInt(paramCursor.getColumnIndex("group_friend_count"));
    group_online_friend_count = paramCursor.getInt(paramCursor.getColumnIndex("group_online_friend_count"));
    seqid = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("seqid")));
    sqqOnLine_count = paramCursor.getInt(paramCursor.getColumnIndex("sqqOnLine_count"));
    datetime = paramCursor.getLong(paramCursor.getColumnIndex("datetime"));
    return true;
  }
}
