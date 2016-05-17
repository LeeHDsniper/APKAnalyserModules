import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import android.net.Uri.Builder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.qphone.base.util.BaseApplication;
import cooperation.readinjoy.content.ReadInJoyDataProvider;
import cooperation.readinjoy.storage.ReadInJoyFeedsMsgRecord;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

public class nlz
  implements Runnable
{
  public nlz(ReadInJoyManager paramReadInJoyManager, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject1 = ReadInJoyDataProvider.c.buildUpon();
    ((Uri.Builder)localObject1).appendQueryParameter("uin", ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).getAccount());
    localObject1 = ((Uri.Builder)localObject1).build();
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    label495:
    while (localIterator.hasNext())
    {
      ReadInJoyFeedsMsgRecord localReadInJoyFeedsMsgRecord = (ReadInJoyFeedsMsgRecord)localIterator.next();
      Object localObject2 = new HashSet(ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).keySet()).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        int i = ((Integer)((Iterator)localObject2).next()).intValue();
        int j = (int)NetConnInfoCenter.getServerTime();
        if ((i < j) && (j - i > 300)) {
          ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).remove(Integer.valueOf(i));
        }
      }
      if (!ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).containsValue(Integer.valueOf(h)))
      {
        ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).put(Integer.valueOf(g), Integer.valueOf(h));
        long l = ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager);
        if ((i == 10) || (i == 11) || (i == 12) || (i == 999999)) {
          if (ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager, (Uri)localObject1, localReadInJoyFeedsMsgRecord, l)) {
            ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager);
          }
        }
        for (;;)
        {
          if (i == 999999) {
            break label495;
          }
          break;
          ContentValues localContentValues;
          if (i == 14)
          {
            localObject2 = String.format("%s = '%s' and %s = %d", new Object[] { "commentID", jdField_b_of_type_JavaLangString, "notifyType", Integer.valueOf(11) });
            localContentValues = new ContentValues();
            localContentValues.put("isDelete", Integer.valueOf(1));
            ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).a().getContentResolver().update((Uri)localObject1, localContentValues, (String)localObject2, null);
            ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager, (Uri)localObject1, localReadInJoyFeedsMsgRecord, l);
          }
          else if (i == 13)
          {
            localObject2 = String.format("%s = %s and %s = %d", new Object[] { "feedsID", Long.toString(jdField_b_of_type_Long), "notifyType", Integer.valueOf(10) });
            localContentValues = new ContentValues();
            localContentValues.put("isDelete", Integer.valueOf(1));
            ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).a().getContentResolver().update((Uri)localObject1, localContentValues, (String)localObject2, null);
            ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager, (Uri)localObject1, localReadInJoyFeedsMsgRecord, l);
          }
        }
      }
    }
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).a().getContentResolver().notifyChange(ReadInJoyDataProvider.c, null);
  }
}
