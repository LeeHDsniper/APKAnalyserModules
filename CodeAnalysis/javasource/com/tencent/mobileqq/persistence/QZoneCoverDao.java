package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.QZoneCover;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class QZoneCoverDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public QZoneCoverDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 5;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (QZoneCover)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      type = paramCursor.getString(paramCursor.getColumnIndex("type"));
      jigsaw = paramCursor.getInt(paramCursor.getColumnIndex("jigsaw"));
      vCoverInfo = paramCursor.getBlob(paramCursor.getColumnIndex("vCoverInfo"));
      vPhotoInfo = paramCursor.getBlob(paramCursor.getColumnIndex("vPhotoInfo"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("type");
      if (i != -1) {
        break label290;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("type", String.class));
      label170:
      i = paramCursor.getColumnIndex("jigsaw");
      if (i != -1) {
        break label305;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("jigsaw", Integer.TYPE));
      label205:
      i = paramCursor.getColumnIndex("vCoverInfo");
      if (i != -1) {
        break label320;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vCoverInfo", [B.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("vPhotoInfo");
      if (i != -1) {
        break label335;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("vPhotoInfo", [B.class));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label290:
      type = paramCursor.getString(i);
      break label170;
      label305:
      jigsaw = paramCursor.getInt(i);
      break label205;
      label320:
      vCoverInfo = paramCursor.getBlob(i);
    }
    label335:
    vPhotoInfo = paramCursor.getBlob(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT UNIQUE ,type TEXT ,jigsaw INTEGER ,vCoverInfo BLOB ,vPhotoInfo BLOB)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (QZoneCover)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("type", type);
    paramContentValues.put("jigsaw", Integer.valueOf(jigsaw));
    paramContentValues.put("vCoverInfo", vCoverInfo);
    paramContentValues.put("vPhotoInfo", vPhotoInfo);
  }
}
