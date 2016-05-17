import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.util.Comparator;

class nhl
  implements Comparator
{
  nhl(nhj paramNhj)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(File paramFile1, File paramFile2)
  {
    if (paramFile2.lastModified() - paramFile1.lastModified() > 0L) {
      return 1;
    }
    return 0;
  }
}
