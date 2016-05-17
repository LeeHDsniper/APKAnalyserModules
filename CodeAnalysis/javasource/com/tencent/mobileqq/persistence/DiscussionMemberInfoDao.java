package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class DiscussionMemberInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public DiscussionMemberInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 7;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (DiscussionMemberInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      discussionUin = paramCursor.getString(paramCursor.getColumnIndex("discussionUin"));
      memberUin = paramCursor.getString(paramCursor.getColumnIndex("memberUin"));
      memberName = paramCursor.getString(paramCursor.getColumnIndex("memberName"));
      flag = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("flag")));
      dataTime = paramCursor.getLong(paramCursor.getColumnIndex("dataTime"));
      inteRemark = paramCursor.getString(paramCursor.getColumnIndex("inteRemark"));
      inteRemarkSource = paramCursor.getLong(paramCursor.getColumnIndex("inteRemarkSource"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("discussionUin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("discussionUin", String.class));
      i = paramCursor.getColumnIndex("memberUin");
      if (i != -1) {
        break label397;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("memberUin", String.class));
      label207:
      i = paramCursor.getColumnIndex("memberName");
      if (i != -1) {
        break label412;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("memberName", String.class));
      label241:
      i = paramCursor.getColumnIndex("flag");
      if (i != -1) {
        break label427;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("flag", Byte.TYPE));
      label276:
      i = paramCursor.getColumnIndex("dataTime");
      if (i != -1) {
        break label443;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("dataTime", Long.TYPE));
      label311:
      i = paramCursor.getColumnIndex("inteRemark");
      if (i != -1) {
        break label458;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("inteRemark", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("inteRemarkSource");
      if (i != -1) {
        break label473;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("inteRemarkSource", Long.TYPE));
      return paramEntity;
      discussionUin = paramCursor.getString(i);
      break;
      label397:
      memberUin = paramCursor.getString(i);
      break label207;
      label412:
      memberName = paramCursor.getString(i);
      break label241;
      label427:
      flag = ((byte)paramCursor.getShort(i));
      break label276;
      label443:
      dataTime = paramCursor.getLong(i);
      break label311;
      label458:
      inteRemark = paramCursor.getString(i);
    }
    label473:
    inteRemarkSource = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,discussionUin TEXT ,memberUin TEXT ,memberName TEXT ,flag INTEGER ,dataTime INTEGER ,inteRemark TEXT ,inteRemarkSource INTEGER,UNIQUE(discussionUin,memberUin) ON CONFLICT IGNORE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (DiscussionMemberInfo)paramEntity;
    paramContentValues.put("discussionUin", discussionUin);
    paramContentValues.put("memberUin", memberUin);
    paramContentValues.put("memberName", memberName);
    paramContentValues.put("flag", Byte.valueOf(flag));
    paramContentValues.put("dataTime", Long.valueOf(dataTime));
    paramContentValues.put("inteRemark", inteRemark);
    paramContentValues.put("inteRemarkSource", Long.valueOf(inteRemarkSource));
  }
}
