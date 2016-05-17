import android.widget.Toast;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nev
  implements Runnable
{
  nev(SQLiteDatabase paramSQLiteDatabase)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Toast.makeText(BaseApplicationImpl.getContext(), "transaction exception!", 1).show();
  }
}
