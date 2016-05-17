package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class EmoticonDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public EmoticonDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 13;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (Emoticon)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      eId = paramCursor.getString(paramCursor.getColumnIndex("eId"));
      epId = paramCursor.getString(paramCursor.getColumnIndex("epId"));
      name = paramCursor.getString(paramCursor.getColumnIndex("name"));
      encryptKey = paramCursor.getString(paramCursor.getColumnIndex("encryptKey"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("isSound")))
      {
        paramBoolean = true;
        isSound = paramBoolean;
        width = paramCursor.getInt(paramCursor.getColumnIndex("width"));
        height = paramCursor.getInt(paramCursor.getColumnIndex("height"));
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("value"))) {
          break label272;
        }
      }
      label272:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        value = paramBoolean;
        magicValue = paramCursor.getString(paramCursor.getColumnIndex("magicValue"));
        jobType = paramCursor.getInt(paramCursor.getColumnIndex("jobType"));
        keyword = paramCursor.getString(paramCursor.getColumnIndex("keyword"));
        keywords = paramCursor.getString(paramCursor.getColumnIndex("keywords"));
        character = paramCursor.getString(paramCursor.getColumnIndex("character"));
        return paramEntity;
        paramBoolean = false;
        break;
      }
    }
    int i = paramCursor.getColumnIndex("eId");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("eId", String.class));
      i = paramCursor.getColumnIndex("epId");
      if (i != -1) {
        break label741;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("epId", String.class));
      label345:
      i = paramCursor.getColumnIndex("name");
      if (i != -1) {
        break label756;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("name", String.class));
      label379:
      i = paramCursor.getColumnIndex("encryptKey");
      if (i != -1) {
        break label771;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("encryptKey", String.class));
      label413:
      i = paramCursor.getColumnIndex("isSound");
      if (i != -1) {
        break label786;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isSound", Boolean.TYPE));
      i = paramCursor.getColumnIndex("width");
      if (i != -1) {
        break label813;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("width", Integer.TYPE));
      label483:
      i = paramCursor.getColumnIndex("height");
      if (i != -1) {
        break label828;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("height", Integer.TYPE));
      label518:
      i = paramCursor.getColumnIndex("value");
      if (i != -1) {
        break label843;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("value", Boolean.TYPE));
      i = paramCursor.getColumnIndex("magicValue");
      if (i != -1) {
        break label871;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("magicValue", String.class));
      label587:
      i = paramCursor.getColumnIndex("jobType");
      if (i != -1) {
        break label886;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("jobType", Integer.TYPE));
      label622:
      i = paramCursor.getColumnIndex("keyword");
      if (i != -1) {
        break label901;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("keyword", String.class));
      label656:
      i = paramCursor.getColumnIndex("keywords");
      if (i != -1) {
        break label916;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("keywords", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("character");
      if (i != -1) {
        break label931;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("character", String.class));
      return paramEntity;
      eId = paramCursor.getString(i);
      break;
      label741:
      epId = paramCursor.getString(i);
      break label345;
      label756:
      name = paramCursor.getString(i);
      break label379;
      label771:
      encryptKey = paramCursor.getString(i);
      break label413;
      label786:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isSound = paramBoolean;
        break;
      }
      label813:
      width = paramCursor.getInt(i);
      break label483;
      label828:
      height = paramCursor.getInt(i);
      break label518;
      label843:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        value = paramBoolean;
        break;
      }
      label871:
      magicValue = paramCursor.getString(i);
      break label587;
      label886:
      jobType = paramCursor.getInt(i);
      break label622;
      label901:
      keyword = paramCursor.getString(i);
      break label656;
      label916:
      keywords = paramCursor.getString(i);
    }
    label931:
    character = paramCursor.getString(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,eId TEXT ,epId TEXT ,name TEXT ,encryptKey TEXT ,isSound INTEGER ,width INTEGER ,height INTEGER ,value INTEGER ,magicValue TEXT ,jobType INTEGER ,keyword TEXT ,keywords TEXT ,character TEXT,UNIQUE(eId,epId) ON CONFLICT IGNORE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (Emoticon)paramEntity;
    paramContentValues.put("eId", eId);
    paramContentValues.put("epId", epId);
    paramContentValues.put("name", name);
    paramContentValues.put("encryptKey", encryptKey);
    paramContentValues.put("isSound", Boolean.valueOf(isSound));
    paramContentValues.put("width", Integer.valueOf(width));
    paramContentValues.put("height", Integer.valueOf(height));
    paramContentValues.put("value", Boolean.valueOf(value));
    paramContentValues.put("magicValue", magicValue);
    paramContentValues.put("jobType", Integer.valueOf(jobType));
    paramContentValues.put("keyword", keyword);
    paramContentValues.put("keywords", keywords);
    paramContentValues.put("character", character);
  }
}
