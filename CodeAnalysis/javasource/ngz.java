import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.app.asyncdb.cache.RecentUserCache;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class ngz
  implements Runnable
{
  public ngz(RecentUserCache paramRecentUserCache, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.db.Cache.RecentUserCache", 2, "filterErrorData | start");
    }
    try
    {
      int i = RecentUserCache.a(jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheRecentUserCache).a().a("recent", "_id=?", new String[] { String.valueOf(jdField_a_of_type_Long) });
      if (QLog.isColorLevel()) {
        QLog.d("Q.db.Cache.RecentUserCache", 2, "filterErrorData | RecentUser delCount = " + i);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      if (QLog.isColorLevel()) {
        QLog.d("Q.db.Cache.RecentUserCache", 2, "filterErrorData | delete recommend error~");
      }
      return;
    }
    finally
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.db.Cache.RecentUserCache", 2, "filterErrorData | end");
      }
    }
  }
}
