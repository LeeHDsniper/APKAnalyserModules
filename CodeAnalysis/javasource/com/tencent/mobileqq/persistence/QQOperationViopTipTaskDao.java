package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.config.operation.QQOperationViopTipTask;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class QQOperationViopTipTaskDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public QQOperationViopTipTaskDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 16;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (QQOperationViopTipTask)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      taskid = paramCursor.getInt(paramCursor.getColumnIndex("taskid"));
      uinType = paramCursor.getInt(paramCursor.getColumnIndex("uinType"));
      tipType = paramCursor.getInt(paramCursor.getColumnIndex("tipType"));
      adwords = paramCursor.getString(paramCursor.getColumnIndex("adwords"));
      clickableWord = paramCursor.getString(paramCursor.getColumnIndex("clickableWord"));
      linkOffset = paramCursor.getInt(paramCursor.getColumnIndex("linkOffset"));
      url = paramCursor.getString(paramCursor.getColumnIndex("url"));
      limitDayAIOCount = paramCursor.getInt(paramCursor.getColumnIndex("limitDayAIOCount"));
      limitDayAIOShowCount = paramCursor.getInt(paramCursor.getColumnIndex("limitDayAIOShowCount"));
      limitTotalAIOCount = paramCursor.getInt(paramCursor.getColumnIndex("limitTotalAIOCount"));
      limitTotalShowCount = paramCursor.getInt(paramCursor.getColumnIndex("limitTotalShowCount"));
      keywordString = paramCursor.getString(paramCursor.getColumnIndex("keywordString"));
      begin = paramCursor.getString(paramCursor.getColumnIndex("begin"));
      end = paramCursor.getString(paramCursor.getColumnIndex("end"));
      frequencyTime = paramCursor.getInt(paramCursor.getColumnIndex("frequencyTime"));
      frequencyMessage = paramCursor.getInt(paramCursor.getColumnIndex("frequencyMessage"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("taskid");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("taskid", Integer.TYPE));
      i = paramCursor.getColumnIndex("uinType");
      if (i != -1) {
        break label871;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uinType", Integer.TYPE));
      label370:
      i = paramCursor.getColumnIndex("tipType");
      if (i != -1) {
        break label886;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("tipType", Integer.TYPE));
      label405:
      i = paramCursor.getColumnIndex("adwords");
      if (i != -1) {
        break label901;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("adwords", String.class));
      label439:
      i = paramCursor.getColumnIndex("clickableWord");
      if (i != -1) {
        break label916;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("clickableWord", String.class));
      label473:
      i = paramCursor.getColumnIndex("linkOffset");
      if (i != -1) {
        break label931;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("linkOffset", Integer.TYPE));
      label508:
      i = paramCursor.getColumnIndex("url");
      if (i != -1) {
        break label946;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("url", String.class));
      label542:
      i = paramCursor.getColumnIndex("limitDayAIOCount");
      if (i != -1) {
        break label961;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("limitDayAIOCount", Integer.TYPE));
      label577:
      i = paramCursor.getColumnIndex("limitDayAIOShowCount");
      if (i != -1) {
        break label976;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("limitDayAIOShowCount", Integer.TYPE));
      label612:
      i = paramCursor.getColumnIndex("limitTotalAIOCount");
      if (i != -1) {
        break label991;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("limitTotalAIOCount", Integer.TYPE));
      label647:
      i = paramCursor.getColumnIndex("limitTotalShowCount");
      if (i != -1) {
        break label1006;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("limitTotalShowCount", Integer.TYPE));
      label682:
      i = paramCursor.getColumnIndex("keywordString");
      if (i != -1) {
        break label1021;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("keywordString", String.class));
      label716:
      i = paramCursor.getColumnIndex("begin");
      if (i != -1) {
        break label1036;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("begin", String.class));
      label750:
      i = paramCursor.getColumnIndex("end");
      if (i != -1) {
        break label1051;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("end", String.class));
      label784:
      i = paramCursor.getColumnIndex("frequencyTime");
      if (i != -1) {
        break label1066;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("frequencyTime", Integer.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("frequencyMessage");
      if (i != -1) {
        break label1081;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("frequencyMessage", Integer.TYPE));
      return paramEntity;
      taskid = paramCursor.getInt(i);
      break;
      label871:
      uinType = paramCursor.getInt(i);
      break label370;
      label886:
      tipType = paramCursor.getInt(i);
      break label405;
      label901:
      adwords = paramCursor.getString(i);
      break label439;
      label916:
      clickableWord = paramCursor.getString(i);
      break label473;
      label931:
      linkOffset = paramCursor.getInt(i);
      break label508;
      label946:
      url = paramCursor.getString(i);
      break label542;
      label961:
      limitDayAIOCount = paramCursor.getInt(i);
      break label577;
      label976:
      limitDayAIOShowCount = paramCursor.getInt(i);
      break label612;
      label991:
      limitTotalAIOCount = paramCursor.getInt(i);
      break label647;
      label1006:
      limitTotalShowCount = paramCursor.getInt(i);
      break label682;
      label1021:
      keywordString = paramCursor.getString(i);
      break label716;
      label1036:
      begin = paramCursor.getString(i);
      break label750;
      label1051:
      end = paramCursor.getString(i);
      break label784;
      label1066:
      frequencyTime = paramCursor.getInt(i);
    }
    label1081:
    frequencyMessage = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,taskid INTEGER ,uinType INTEGER ,tipType INTEGER ,adwords TEXT ,clickableWord TEXT ,linkOffset INTEGER ,url TEXT ,limitDayAIOCount INTEGER ,limitDayAIOShowCount INTEGER ,limitTotalAIOCount INTEGER ,limitTotalShowCount INTEGER ,keywordString TEXT ,begin TEXT ,end TEXT ,frequencyTime INTEGER ,frequencyMessage INTEGER,UNIQUE(taskid) ON CONFLICT REPLACE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (QQOperationViopTipTask)paramEntity;
    paramContentValues.put("taskid", Integer.valueOf(taskid));
    paramContentValues.put("uinType", Integer.valueOf(uinType));
    paramContentValues.put("tipType", Integer.valueOf(tipType));
    paramContentValues.put("adwords", adwords);
    paramContentValues.put("clickableWord", clickableWord);
    paramContentValues.put("linkOffset", Integer.valueOf(linkOffset));
    paramContentValues.put("url", url);
    paramContentValues.put("limitDayAIOCount", Integer.valueOf(limitDayAIOCount));
    paramContentValues.put("limitDayAIOShowCount", Integer.valueOf(limitDayAIOShowCount));
    paramContentValues.put("limitTotalAIOCount", Integer.valueOf(limitTotalAIOCount));
    paramContentValues.put("limitTotalShowCount", Integer.valueOf(limitTotalShowCount));
    paramContentValues.put("keywordString", keywordString);
    paramContentValues.put("begin", begin);
    paramContentValues.put("end", end);
    paramContentValues.put("frequencyTime", Integer.valueOf(frequencyTime));
    paramContentValues.put("frequencyMessage", Integer.valueOf(frequencyMessage));
  }
}
