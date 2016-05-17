package com.tencent.mobileqq.persistence;

import android.database.Cursor;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SQLiteOpenHelper;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import java.util.Iterator;
import java.util.List;

public class MessageRecordEntityManager
  extends OGEntityManager
{
  public MessageRecordEntityManager(SQLiteOpenHelper paramSQLiteOpenHelper)
  {
    super(paramSQLiteOpenHelper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Entity a(Class paramClass, String paramString, Cursor paramCursor, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    if (paramCursor.isBeforeFirst()) {
      paramCursor.moveToFirst();
    }
    try
    {
      if (paramCursor.getColumnIndex("_id") >= 0) {
        l = paramCursor.getLong(paramCursor.getColumnIndex("_id"));
      }
    }
    catch (Exception paramNoColumnErrorHandler)
    {
      try
      {
        if (paramClass.getName().equals(MessageRecord.class.getName()))
        {
          int i = paramCursor.getInt(paramCursor.getColumnIndex("msgtype"));
          paramClass = paramCursor.getBlob(paramCursor.getColumnIndex("msgData"));
          paramNoColumnErrorHandler = MessageRecordFactory.a(i, paramClass);
          msgData = paramClass;
          _id = l;
          selfuin = paramCursor.getString(paramCursor.getColumnIndex("selfuin"));
          frienduin = paramCursor.getString(paramCursor.getColumnIndex("frienduin"));
          senderuin = paramCursor.getString(paramCursor.getColumnIndex("senderuin"));
          time = paramCursor.getLong(paramCursor.getColumnIndex("time"));
          msgtype = paramCursor.getInt(paramCursor.getColumnIndex("msgtype"));
          if (paramCursor.getInt(paramCursor.getColumnIndex("isread")) != 0)
          {
            bool1 = true;
            isread = bool1;
            issend = paramCursor.getInt(paramCursor.getColumnIndex("issend"));
            msgseq = paramCursor.getLong(paramCursor.getColumnIndex("msgseq"));
            shmsgseq = paramCursor.getLong(paramCursor.getColumnIndex("shmsgseq"));
            istroop = paramCursor.getInt(paramCursor.getColumnIndex("istroop"));
            extraflag = paramCursor.getInt(paramCursor.getColumnIndex("extraflag"));
            sendFailCode = paramCursor.getInt(paramCursor.getColumnIndex("sendFailCode"));
            msgId = paramCursor.getLong(paramCursor.getColumnIndex("msgId"));
            longMsgIndex = paramCursor.getInt(paramCursor.getColumnIndex("longMsgIndex"));
            longMsgId = paramCursor.getInt(paramCursor.getColumnIndex("longMsgId"));
            longMsgCount = paramCursor.getInt(paramCursor.getColumnIndex("longMsgCount"));
            msgUid = paramCursor.getLong(paramCursor.getColumnIndex("msgUid"));
            uniseq = paramCursor.getLong(paramCursor.getColumnIndex("uniseq"));
            extStr = paramCursor.getString(paramCursor.getColumnIndex("extStr"));
            extInt = paramCursor.getInt(paramCursor.getColumnIndex("extInt"));
            extLong = paramCursor.getInt(paramCursor.getColumnIndex("extLong"));
            if (paramCursor.getInt(paramCursor.getColumnIndex("isValid")) == 0) {
              break label691;
            }
            bool1 = bool2;
            isValid = bool1;
            versionCode = paramCursor.getInt(paramCursor.getColumnIndex("versionCode"));
            vipBubbleID = paramCursor.getLong(paramCursor.getColumnIndex("vipBubbleID"));
            if (versionCode <= 0) {
              msg = paramCursor.getString(paramCursor.getColumnIndex("msg"));
            }
            if ((l != -1L) && (paramString != null)) {}
            for (_status = 1001;; _status = 1002)
            {
              paramNoColumnErrorHandler.postRead();
              return paramNoColumnErrorHandler;
            }
          }
        }
        else
        {
          paramClass = super.a(paramClass, paramString, paramCursor, null);
          return paramClass;
        }
      }
      catch (OutOfMemoryError paramClass)
      {
        for (;;)
        {
          return null;
          long l = -1L;
          continue;
          paramNoColumnErrorHandler = paramNoColumnErrorHandler;
          l = -1L;
          continue;
          boolean bool1 = false;
          continue;
          label691:
          bool1 = false;
        }
      }
      catch (Exception paramClass) {}
    }
    return null;
  }
  
  public List a(String paramString1, String paramString2, String paramString3, String[] paramArrayOfString, QQAppInterface paramQQAppInterface)
  {
    paramString1 = a(MessageRecord.class, paramString1, paramString2, paramString3, paramArrayOfString);
    if ((paramString1 != null) && (paramString1.size() > 0))
    {
      paramString2 = paramString1.iterator();
      while (paramString2.hasNext())
      {
        paramString3 = (MessageRecord)paramString2.next();
        paramQQAppInterface.a().a(frienduin, istroop, paramString3);
      }
    }
    return paramString1;
  }
  
  public List a(String paramString, String[] paramArrayOfString, QQAppInterface paramQQAppInterface)
  {
    paramString = a(MessageRecord.class, paramString, paramArrayOfString);
    if ((paramString != null) && (paramString.size() > 0))
    {
      paramArrayOfString = paramString.iterator();
      while (paramArrayOfString.hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)paramArrayOfString.next();
        paramQQAppInterface.a().a(frienduin, istroop, localMessageRecord);
      }
    }
    return paramString;
  }
}
