import android.content.ContentResolver;
import android.database.CharArrayBuffer;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.MsgProxy;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.List;

public class njy
  implements Cursor
{
  private int jdField_a_of_type_Int;
  private List jdField_a_of_type_JavaUtilList;
  private String[] jdField_a_of_type_ArrayOfJavaLangString;
  
  public njy(MsgProxy paramMsgProxy, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "_id", "selfuin", "frienduin", "senderuin", "time", "msg", "msgtype", "isread", "issend", "msgseq", "shmsgseq", "istroop", "extraflag", "troopnick", "friendnick", "versionCode", "msgData", "vipBubbleID", "msgUid", "uniseq", "sendFailCode", "versionCode" };
    jdField_a_of_type_JavaUtilList = paramList;
  }
  
  private Object a(int paramInt)
  {
    MessageRecord localMessageRecord = (MessageRecord)jdField_a_of_type_JavaUtilList.get(jdField_a_of_type_Int);
    switch (paramInt)
    {
    default: 
      return null;
    case 0: 
    case 1: 
      return Long.valueOf(msgId);
    case 2: 
      return selfuin;
    case 3: 
      return frienduin;
    case 4: 
      return senderuin;
    case 5: 
      return Long.valueOf(time);
    case 6: 
      return msg;
    case 7: 
      return Integer.valueOf(msgtype);
    case 8: 
      if (isread) {}
      for (paramInt = 1;; paramInt = 0) {
        return Integer.valueOf(paramInt);
      }
    case 9: 
      return Integer.valueOf(issend);
    case 10: 
      return Long.valueOf(msgseq);
    case 11: 
      return Long.valueOf(shmsgseq);
    case 12: 
      return Integer.valueOf(istroop);
    case 13: 
      return Integer.valueOf(extraflag);
    case 14: 
      return ContactUtils.a(MsgProxy.a(jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy), senderuin, frienduin, 1, 0);
    case 15: 
      if (istroop == 3000) {
        return ContactUtils.d(MsgProxy.b(jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy), senderuin);
      }
      if (istroop == 1) {
        return ((TroopManager)MsgProxy.c(jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy).getManager(51)).a(senderuin);
      }
      return ContactUtils.a(MsgProxy.d(jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy), senderuin);
    case 16: 
      return Integer.valueOf(((FriendsManager)MsgProxy.e(jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy).getManager(50)).a(frienduin));
    case 17: 
      return Integer.valueOf(versionCode);
    case 18: 
      return msgData;
    case 19: 
      return Long.valueOf(vipBubbleID);
    case 20: 
      return Long.valueOf(msgUid);
    case 21: 
      return Long.valueOf(uniseq);
    case 22: 
      return Integer.valueOf(sendFailCode);
    }
    return Integer.valueOf(versionCode);
  }
  
  public void close() {}
  
  public void copyStringToBuffer(int paramInt, CharArrayBuffer paramCharArrayBuffer)
  {
    throw new UnsupportedOperationException();
  }
  
  public void deactivate() {}
  
  public byte[] getBlob(int paramInt)
  {
    localObject = a(paramInt);
    if ((localObject instanceof byte[])) {
      return (byte[])localObject;
    }
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    try
    {
      ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(localByteArrayOutputStream);
      localObjectOutputStream.writeObject(localObject);
      localObjectOutputStream.flush();
      localObject = localByteArrayOutputStream.toByteArray();
      try
      {
        localObjectOutputStream.close();
        localByteArrayOutputStream.close();
        return localObject;
      }
      catch (IOException localIOException1) {}
    }
    catch (IOException localIOException2)
    {
      for (;;)
      {
        localObject = null;
      }
    }
    localIOException1.printStackTrace();
    return localObject;
  }
  
  public int getColumnCount()
  {
    return jdField_a_of_type_ArrayOfJavaLangString.length;
  }
  
  public int getColumnIndex(String paramString)
  {
    if ("_id".equalsIgnoreCase(paramString)) {
      return 1;
    }
    if ("selfuin".equals(paramString)) {
      return 2;
    }
    if ("frienduin".equals(paramString)) {
      return 3;
    }
    if ("senderuin".equals(paramString)) {
      return 4;
    }
    if ("time".equals(paramString)) {
      return 5;
    }
    if ("msg".equals(paramString)) {
      return 6;
    }
    if ("msgtype".equals(paramString)) {
      return 7;
    }
    if ("isread".equals(paramString)) {
      return 8;
    }
    if ("issend".equals(paramString)) {
      return 9;
    }
    if ("msgseq".equals(paramString)) {
      return 10;
    }
    if ("shmsgseq".equals(paramString)) {
      return 11;
    }
    if ("istroop".equals(paramString)) {
      return 12;
    }
    if ("extraflag".equals(paramString)) {
      return 13;
    }
    if ("troopnick".equals(paramString)) {
      return 14;
    }
    if ("friendnick".equals(paramString)) {
      return 15;
    }
    if ("friendstatus".equals(paramString)) {
      return 16;
    }
    if ("versionCode".equals(paramString)) {
      return 17;
    }
    if ("msgData".equals(paramString)) {
      return 18;
    }
    if ("vipBubbleID".equals(paramString)) {
      return 19;
    }
    if ("msgUid".equals(paramString)) {
      return 20;
    }
    if ("uniseq".equals(paramString)) {
      return 21;
    }
    if ("sendFailCode".equals(paramString)) {
      return 22;
    }
    if ("versionCode".equals(paramString)) {
      return 23;
    }
    return -1;
  }
  
  public int getColumnIndexOrThrow(String paramString)
  {
    if (getColumnIndex(paramString) < 0) {
      throw new IllegalArgumentException();
    }
    return getColumnIndex(paramString);
  }
  
  public String getColumnName(int paramInt)
  {
    if ((paramInt > 0) && (paramInt < jdField_a_of_type_ArrayOfJavaLangString.length)) {
      return jdField_a_of_type_ArrayOfJavaLangString[paramInt];
    }
    return null;
  }
  
  public String[] getColumnNames()
  {
    return jdField_a_of_type_ArrayOfJavaLangString;
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public double getDouble(int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  public Bundle getExtras()
  {
    throw new UnsupportedOperationException();
  }
  
  public float getFloat(int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  public int getInt(int paramInt)
  {
    return ((Integer)a(paramInt)).intValue();
  }
  
  public long getLong(int paramInt)
  {
    return ((Long)a(paramInt)).longValue();
  }
  
  public Uri getNotificationUri()
  {
    throw new UnsupportedOperationException();
  }
  
  public int getPosition()
  {
    return jdField_a_of_type_Int;
  }
  
  public short getShort(int paramInt)
  {
    return ((Short)a(paramInt)).shortValue();
  }
  
  public String getString(int paramInt)
  {
    return String.valueOf(a(paramInt));
  }
  
  public int getType(int paramInt)
  {
    return 0;
  }
  
  public boolean getWantsAllOnMoveCalls()
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean isAfterLast()
  {
    return jdField_a_of_type_Int < jdField_a_of_type_JavaUtilList.size() - 1;
  }
  
  public boolean isBeforeFirst()
  {
    return jdField_a_of_type_Int > 0;
  }
  
  public boolean isClosed()
  {
    return false;
  }
  
  public boolean isFirst()
  {
    return jdField_a_of_type_Int == 0;
  }
  
  public boolean isLast()
  {
    return jdField_a_of_type_Int == jdField_a_of_type_JavaUtilList.size() - 1;
  }
  
  public boolean isNull(int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean move(int paramInt)
  {
    if ((jdField_a_of_type_Int + paramInt < jdField_a_of_type_JavaUtilList.size()) && (jdField_a_of_type_Int + paramInt >= 0))
    {
      jdField_a_of_type_Int += paramInt;
      return true;
    }
    return false;
  }
  
  public boolean moveToFirst()
  {
    boolean bool = false;
    jdField_a_of_type_Int = 0;
    if (jdField_a_of_type_JavaUtilList.size() > 0) {
      bool = true;
    }
    return bool;
  }
  
  public boolean moveToLast()
  {
    jdField_a_of_type_Int = (jdField_a_of_type_JavaUtilList.size() - 1);
    return true;
  }
  
  public boolean moveToNext()
  {
    if (jdField_a_of_type_Int < jdField_a_of_type_JavaUtilList.size() - 1)
    {
      jdField_a_of_type_Int += 1;
      return true;
    }
    return false;
  }
  
  public boolean moveToPosition(int paramInt)
  {
    if ((paramInt < jdField_a_of_type_JavaUtilList.size()) && (paramInt >= 0))
    {
      jdField_a_of_type_Int = paramInt;
      return true;
    }
    return false;
  }
  
  public boolean moveToPrevious()
  {
    if (jdField_a_of_type_Int > 0)
    {
      jdField_a_of_type_Int -= 1;
      return true;
    }
    return false;
  }
  
  public void registerContentObserver(ContentObserver paramContentObserver) {}
  
  public void registerDataSetObserver(DataSetObserver paramDataSetObserver) {}
  
  public boolean requery()
  {
    return false;
  }
  
  public Bundle respond(Bundle paramBundle)
  {
    throw new UnsupportedOperationException();
  }
  
  public void setNotificationUri(ContentResolver paramContentResolver, Uri paramUri)
  {
    throw new UnsupportedOperationException();
  }
  
  public void unregisterContentObserver(ContentObserver paramContentObserver) {}
  
  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver) {}
}
