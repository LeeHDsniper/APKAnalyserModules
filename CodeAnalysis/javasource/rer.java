import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.util.SystemUtil;
import java.io.File;
import java.util.Arrays;

public class rer
  implements Runnable
{
  public rer(StatisticCollector paramStatisticCollector)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = 10;
    try
    {
      Object localObject = new File(SystemUtil.b + "crashinfo/");
      if ((localObject != null) && (((File)localObject).exists()))
      {
        localObject = ((File)localObject).listFiles(new res(this));
        if ((localObject != null) && (localObject.length > 10))
        {
          Arrays.sort((Object[])localObject, new ret(this));
          while (i < localObject.length)
          {
            localObject[i].delete();
            i += 1;
          }
        }
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
}
