import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.io.FilenameFilter;

class res
  implements FilenameFilter
{
  res(rer paramRer)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return !paramString.contains("CrashInfoSummary.log");
  }
}
