package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class DiscussionInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public DiscussionInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 13;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool = true;
    paramBoolean = true;
    paramEntity = (DiscussionInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
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
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("hasCollect"))) {}
      for (;;)
      {
        hasCollect = paramBoolean;
        return paramEntity;
        paramBoolean = false;
      }
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("infoSeq");
      if (i != -1) {
        break label728;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("infoSeq", Long.TYPE));
      label330:
      i = paramCursor.getColumnIndex("ownerUin");
      if (i != -1) {
        break label743;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("ownerUin", String.class));
      label364:
      i = paramCursor.getColumnIndex("discussionName");
      if (i != -1) {
        break label758;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("discussionName", String.class));
      label398:
      i = paramCursor.getColumnIndex("createTime");
      if (i != -1) {
        break label773;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("createTime", Long.TYPE));
      label433:
      i = paramCursor.getColumnIndex("timeSec");
      if (i != -1) {
        break label788;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("timeSec", Long.TYPE));
      label468:
      i = paramCursor.getColumnIndex("faceUinSet");
      if (i != -1) {
        break label803;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("faceUinSet", String.class));
      label502:
      i = paramCursor.getColumnIndex("DiscussionFlag");
      if (i != -1) {
        break label818;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("DiscussionFlag", Long.TYPE));
      label537:
      i = paramCursor.getColumnIndex("mComparePartInt");
      if (i != -1) {
        break label833;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mComparePartInt", Integer.TYPE));
      label572:
      i = paramCursor.getColumnIndex("mCompareSpell");
      if (i != -1) {
        break label848;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mCompareSpell", String.class));
      label606:
      i = paramCursor.getColumnIndex("groupCode");
      if (i != -1) {
        break label863;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("groupCode", Long.TYPE));
      label641:
      i = paramCursor.getColumnIndex("groupUin");
      if (i != -1) {
        break label878;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("groupUin", Long.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("hasCollect");
      if (i != -1) {
        break label893;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hasCollect", Boolean.TYPE));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label728:
      infoSeq = paramCursor.getLong(i);
      break label330;
      label743:
      ownerUin = paramCursor.getString(i);
      break label364;
      label758:
      discussionName = paramCursor.getString(i);
      break label398;
      label773:
      createTime = paramCursor.getLong(i);
      break label433;
      label788:
      timeSec = paramCursor.getLong(i);
      break label468;
      label803:
      faceUinSet = paramCursor.getString(i);
      break label502;
      label818:
      DiscussionFlag = paramCursor.getLong(i);
      break label537;
      label833:
      mComparePartInt = paramCursor.getInt(i);
      break label572;
      label848:
      mCompareSpell = paramCursor.getString(i);
      break label606;
      label863:
      groupCode = paramCursor.getLong(i);
      break label641;
      label878:
      groupUin = paramCursor.getLong(i);
    }
    label893:
    if (1 == paramCursor.getShort(i)) {}
    for (paramBoolean = bool;; paramBoolean = false)
    {
      hasCollect = paramBoolean;
      return paramEntity;
    }
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT UNIQUE ,infoSeq INTEGER ,ownerUin TEXT ,discussionName TEXT ,createTime INTEGER ,timeSec INTEGER ,faceUinSet TEXT ,DiscussionFlag INTEGER ,mComparePartInt INTEGER ,mCompareSpell TEXT ,groupCode INTEGER ,groupUin INTEGER ,hasCollect INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (DiscussionInfo)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("infoSeq", Long.valueOf(infoSeq));
    paramContentValues.put("ownerUin", ownerUin);
    paramContentValues.put("discussionName", discussionName);
    paramContentValues.put("createTime", Long.valueOf(createTime));
    paramContentValues.put("timeSec", Long.valueOf(timeSec));
    paramContentValues.put("faceUinSet", faceUinSet);
    paramContentValues.put("DiscussionFlag", Long.valueOf(DiscussionFlag));
    paramContentValues.put("mComparePartInt", Integer.valueOf(mComparePartInt));
    paramContentValues.put("mCompareSpell", mCompareSpell);
    paramContentValues.put("groupCode", Long.valueOf(groupCode));
    paramContentValues.put("groupUin", Long.valueOf(groupUin));
    paramContentValues.put("hasCollect", Boolean.valueOf(hasCollect));
  }
}
