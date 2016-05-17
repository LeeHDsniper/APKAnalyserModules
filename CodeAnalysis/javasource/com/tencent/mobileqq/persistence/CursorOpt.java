package com.tencent.mobileqq.persistence;

import android.content.ContentResolver;
import android.database.CharArrayBuffer;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashMap;

public class CursorOpt
  implements Cursor
{
  private Cursor jdField_a_of_type_AndroidDatabaseCursor;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  
  public CursorOpt(Cursor paramCursor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashMap = null;
    jdField_a_of_type_AndroidDatabaseCursor = paramCursor;
  }
  
  public void close()
  {
    jdField_a_of_type_AndroidDatabaseCursor.close();
  }
  
  public void copyStringToBuffer(int paramInt, CharArrayBuffer paramCharArrayBuffer)
  {
    jdField_a_of_type_AndroidDatabaseCursor.copyStringToBuffer(paramInt, paramCharArrayBuffer);
  }
  
  public void deactivate()
  {
    jdField_a_of_type_AndroidDatabaseCursor.deactivate();
  }
  
  public byte[] getBlob(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getBlob(paramInt);
  }
  
  public int getColumnCount()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getColumnCount();
  }
  
  public int getColumnIndex(String paramString)
  {
    if (jdField_a_of_type_JavaUtilHashMap == null)
    {
      String[] arrayOfString = getColumnNames();
      HashMap localHashMap = new HashMap(arrayOfString.length);
      int i = 0;
      int j = arrayOfString.length;
      while (i < j)
      {
        localHashMap.put(arrayOfString[i], Integer.valueOf(i));
        i += 1;
      }
      jdField_a_of_type_JavaUtilHashMap = localHashMap;
    }
    paramString = (Integer)jdField_a_of_type_JavaUtilHashMap.get(paramString);
    if (paramString != null) {
      return paramString.intValue();
    }
    return -1;
  }
  
  public int getColumnIndexOrThrow(String paramString)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getColumnIndexOrThrow(paramString);
  }
  
  public String getColumnName(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getColumnName(paramInt);
  }
  
  public String[] getColumnNames()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getColumnNames();
  }
  
  public int getCount()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getCount();
  }
  
  public double getDouble(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getDouble(paramInt);
  }
  
  public Bundle getExtras()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getExtras();
  }
  
  public float getFloat(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getFloat(paramInt);
  }
  
  public int getInt(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getInt(paramInt);
  }
  
  public long getLong(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getLong(paramInt);
  }
  
  public Uri getNotificationUri()
  {
    return null;
  }
  
  public int getPosition()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getPosition();
  }
  
  public short getShort(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getShort(paramInt);
  }
  
  public String getString(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getString(paramInt);
  }
  
  public int getType(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getType(paramInt);
  }
  
  public boolean getWantsAllOnMoveCalls()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.getWantsAllOnMoveCalls();
  }
  
  public boolean isAfterLast()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.isAfterLast();
  }
  
  public boolean isBeforeFirst()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.isBeforeFirst();
  }
  
  public boolean isClosed()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.isClosed();
  }
  
  public boolean isFirst()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.isFirst();
  }
  
  public boolean isLast()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.isLast();
  }
  
  public boolean isNull(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.isNull(paramInt);
  }
  
  public boolean move(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.move(paramInt);
  }
  
  public boolean moveToFirst()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.moveToFirst();
  }
  
  public boolean moveToLast()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.moveToLast();
  }
  
  public boolean moveToNext()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.moveToNext();
  }
  
  public boolean moveToPosition(int paramInt)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.moveToPosition(paramInt);
  }
  
  public boolean moveToPrevious()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.moveToPrevious();
  }
  
  public void registerContentObserver(ContentObserver paramContentObserver)
  {
    jdField_a_of_type_AndroidDatabaseCursor.registerContentObserver(paramContentObserver);
  }
  
  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    jdField_a_of_type_AndroidDatabaseCursor.registerDataSetObserver(paramDataSetObserver);
  }
  
  @Deprecated
  public boolean requery()
  {
    return jdField_a_of_type_AndroidDatabaseCursor.requery();
  }
  
  public Bundle respond(Bundle paramBundle)
  {
    return jdField_a_of_type_AndroidDatabaseCursor.respond(paramBundle);
  }
  
  public void setNotificationUri(ContentResolver paramContentResolver, Uri paramUri)
  {
    jdField_a_of_type_AndroidDatabaseCursor.setNotificationUri(paramContentResolver, paramUri);
  }
  
  public void unregisterContentObserver(ContentObserver paramContentObserver)
  {
    jdField_a_of_type_AndroidDatabaseCursor.unregisterContentObserver(paramContentObserver);
  }
  
  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    jdField_a_of_type_AndroidDatabaseCursor.unregisterDataSetObserver(paramDataSetObserver);
  }
}
