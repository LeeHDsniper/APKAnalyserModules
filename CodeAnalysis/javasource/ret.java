import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.util.Comparator;

class ret
  implements Comparator
{
  ret(rer paramRer)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(File paramFile1, File paramFile2)
  {
    long l = paramFile1.lastModified() - paramFile2.lastModified();
    if (l > 0L) {
      return -1;
    }
    if (l < 0L) {
      return 1;
    }
    return 0;
  }
}
