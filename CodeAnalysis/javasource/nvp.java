import android.database.DatabaseErrorHandler;
import android.database.DefaultDatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import com.tencent.mobileqq.data.QQEntityManagerFactory;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;

public class nvp
  implements DatabaseErrorHandler
{
  private DefaultDatabaseErrorHandler jdField_a_of_type_AndroidDatabaseDefaultDatabaseErrorHandler;
  
  public nvp(QQEntityManagerFactory paramQQEntityManagerFactory)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidDatabaseDefaultDatabaseErrorHandler = new DefaultDatabaseErrorHandler();
  }
  
  public void onCorruption(SQLiteDatabase paramSQLiteDatabase)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory.TAG, 2, "[SQLiteDatabaseCorruptException]Corruption reported by sqlite on database: " + paramSQLiteDatabase.getPath());
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_ROM", DeviceInfoUtil.j());
    StatisticCollector.a(BaseApplication.getContext()).a(null, "actSqliteDatabaseCorrupt", true, -1L, 0L, localHashMap, null, false);
    jdField_a_of_type_AndroidDatabaseDefaultDatabaseErrorHandler.onCorruption(paramSQLiteDatabase);
  }
}
