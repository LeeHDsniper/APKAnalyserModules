import android.database.Cursor;
import android.database.sqlite.SQLiteCursorDriver;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteQuery;
import com.tencent.mobileqq.data.QQEntityManagerFactory;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nvn
  implements SQLiteDatabase.CursorFactory
{
  private nvn(QQEntityManagerFactory paramQQEntityManagerFactory)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Cursor newCursor(SQLiteDatabase paramSQLiteDatabase, SQLiteCursorDriver paramSQLiteCursorDriver, String paramString, SQLiteQuery paramSQLiteQuery)
  {
    return new nvo(this, paramSQLiteDatabase, paramSQLiteCursorDriver, paramString, paramSQLiteQuery);
  }
}
