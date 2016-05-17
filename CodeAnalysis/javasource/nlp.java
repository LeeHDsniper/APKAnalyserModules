import com.tencent.mobileqq.app.proxy.FTSDBManager;
import com.tencent.mobileqq.app.proxy.fts.FTSSyncHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;

public class nlp
  implements Runnable
{
  public nlp(FTSDBManager paramFTSDBManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.a()) {}
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            if (SQLiteFTSUtils.h(FTSDBManager.a(a)))
            {
              FTSDBManager.a(a);
              return;
            }
          } while (a.b);
          FTSDBManager.a(a);
        } while (FTSDBManager.a(a));
        if (FTSDBManager.b(a) < 5) {
          break;
        }
      } while (FTSDBManager.c);
      if (SQLiteFTSUtils.i(FTSDBManager.a(a)))
      {
        FTSDBManager.a(a);
        return;
      }
    } while (!SQLiteFTSUtils.h(FTSDBManager.a(a)));
    FTSDBManager.a(a);
    return;
    a.a.postDelayed(this, 5000L);
  }
}
