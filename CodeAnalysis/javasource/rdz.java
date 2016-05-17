import com.tencent.mobileqq.startup.step.MigrateSubscribeDB;
import java.io.File;
import java.util.Comparator;

public class rdz
  implements Comparator
{
  public rdz(MigrateSubscribeDB paramMigrateSubscribeDB) {}
  
  public int a(File paramFile1, File paramFile2)
  {
    long l = paramFile2.lastModified() - paramFile1.lastModified();
    if (l > 0L) {
      return 1;
    }
    if (l == 0L) {
      return 0;
    }
    return -1;
  }
}
