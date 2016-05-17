import com.tencent.mobileqq.startup.step.UpgradeDB;
import java.io.File;
import java.util.Comparator;

public class reh
  implements Comparator
{
  public reh(UpgradeDB paramUpgradeDB) {}
  
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
