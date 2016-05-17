package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ExtensionInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public ExtensionInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 16;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (ExtensionInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      pendantId = paramCursor.getLong(paramCursor.getColumnIndex("pendantId"));
      uVipFont = paramCursor.getLong(paramCursor.getColumnIndex("uVipFont"));
      colorRingId = paramCursor.getLong(paramCursor.getColumnIndex("colorRingId"));
      commingRingId = paramCursor.getLong(paramCursor.getColumnIndex("commingRingId"));
      timestamp = paramCursor.getLong(paramCursor.getColumnIndex("timestamp"));
      richTime = paramCursor.getLong(paramCursor.getColumnIndex("richTime"));
      richBuffer = paramCursor.getBlob(paramCursor.getColumnIndex("richBuffer"));
      feedTime = paramCursor.getLong(paramCursor.getColumnIndex("feedTime"));
      feedContent = paramCursor.getString(paramCursor.getColumnIndex("feedContent"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("feedHasPhoto")))
      {
        paramBoolean = true;
        feedHasPhoto = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("isAdded2C2C"))) {
          break label326;
        }
      }
      label326:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        isAdded2C2C = paramBoolean;
        chatInputType = paramCursor.getInt(paramCursor.getColumnIndex("chatInputType"));
        showC2CPanel = paramCursor.getInt(paramCursor.getColumnIndex("showC2CPanel"));
        pttChangeVoiceType = paramCursor.getInt(paramCursor.getColumnIndex("pttChangeVoiceType"));
        audioPanelType = paramCursor.getInt(paramCursor.getColumnIndex("audioPanelType"));
        return paramEntity;
        paramBoolean = false;
        break;
      }
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("pendantId");
      if (i != -1) {
        break label905;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pendantId", Long.TYPE));
      label400:
      i = paramCursor.getColumnIndex("uVipFont");
      if (i != -1) {
        break label920;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uVipFont", Long.TYPE));
      label435:
      i = paramCursor.getColumnIndex("colorRingId");
      if (i != -1) {
        break label935;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("colorRingId", Long.TYPE));
      label470:
      i = paramCursor.getColumnIndex("commingRingId");
      if (i != -1) {
        break label950;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("commingRingId", Long.TYPE));
      label505:
      i = paramCursor.getColumnIndex("timestamp");
      if (i != -1) {
        break label965;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("timestamp", Long.TYPE));
      label540:
      i = paramCursor.getColumnIndex("richTime");
      if (i != -1) {
        break label980;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("richTime", Long.TYPE));
      label575:
      i = paramCursor.getColumnIndex("richBuffer");
      if (i != -1) {
        break label995;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("richBuffer", [B.class));
      label609:
      i = paramCursor.getColumnIndex("feedTime");
      if (i != -1) {
        break label1010;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("feedTime", Long.TYPE));
      label644:
      i = paramCursor.getColumnIndex("feedContent");
      if (i != -1) {
        break label1025;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("feedContent", String.class));
      label678:
      i = paramCursor.getColumnIndex("feedHasPhoto");
      if (i != -1) {
        break label1040;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("feedHasPhoto", Boolean.TYPE));
      i = paramCursor.getColumnIndex("isAdded2C2C");
      if (i != -1) {
        break label1067;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isAdded2C2C", Boolean.TYPE));
      i = paramCursor.getColumnIndex("chatInputType");
      if (i != -1) {
        break label1095;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("chatInputType", Integer.TYPE));
      label783:
      i = paramCursor.getColumnIndex("showC2CPanel");
      if (i != -1) {
        break label1110;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("showC2CPanel", Integer.TYPE));
      label818:
      i = paramCursor.getColumnIndex("pttChangeVoiceType");
      if (i != -1) {
        break label1125;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("pttChangeVoiceType", Integer.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("audioPanelType");
      if (i != -1) {
        break label1140;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("audioPanelType", Integer.TYPE));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label905:
      pendantId = paramCursor.getLong(i);
      break label400;
      label920:
      uVipFont = paramCursor.getLong(i);
      break label435;
      label935:
      colorRingId = paramCursor.getLong(i);
      break label470;
      label950:
      commingRingId = paramCursor.getLong(i);
      break label505;
      label965:
      timestamp = paramCursor.getLong(i);
      break label540;
      label980:
      richTime = paramCursor.getLong(i);
      break label575;
      label995:
      richBuffer = paramCursor.getBlob(i);
      break label609;
      label1010:
      feedTime = paramCursor.getLong(i);
      break label644;
      label1025:
      feedContent = paramCursor.getString(i);
      break label678;
      label1040:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        feedHasPhoto = paramBoolean;
        break;
      }
      label1067:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        isAdded2C2C = paramBoolean;
        break;
      }
      label1095:
      chatInputType = paramCursor.getInt(i);
      break label783;
      label1110:
      showC2CPanel = paramCursor.getInt(i);
      break label818;
      label1125:
      pttChangeVoiceType = paramCursor.getInt(i);
    }
    label1140:
    audioPanelType = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT UNIQUE ,pendantId INTEGER ,uVipFont INTEGER ,colorRingId INTEGER ,commingRingId INTEGER ,timestamp INTEGER ,richTime INTEGER ,richBuffer BLOB ,feedTime INTEGER ,feedContent TEXT ,feedHasPhoto INTEGER ,isAdded2C2C INTEGER ,chatInputType INTEGER ,showC2CPanel INTEGER ,pttChangeVoiceType INTEGER ,audioPanelType INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (ExtensionInfo)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("pendantId", Long.valueOf(pendantId));
    paramContentValues.put("uVipFont", Long.valueOf(uVipFont));
    paramContentValues.put("colorRingId", Long.valueOf(colorRingId));
    paramContentValues.put("commingRingId", Long.valueOf(commingRingId));
    paramContentValues.put("timestamp", Long.valueOf(timestamp));
    paramContentValues.put("richTime", Long.valueOf(richTime));
    paramContentValues.put("richBuffer", richBuffer);
    paramContentValues.put("feedTime", Long.valueOf(feedTime));
    paramContentValues.put("feedContent", feedContent);
    paramContentValues.put("feedHasPhoto", Boolean.valueOf(feedHasPhoto));
    paramContentValues.put("isAdded2C2C", Boolean.valueOf(isAdded2C2C));
    paramContentValues.put("chatInputType", Integer.valueOf(chatInputType));
    paramContentValues.put("showC2CPanel", Integer.valueOf(showC2CPanel));
    paramContentValues.put("pttChangeVoiceType", Integer.valueOf(pttChangeVoiceType));
    paramContentValues.put("audioPanelType", Integer.valueOf(audioPanelType));
  }
}
