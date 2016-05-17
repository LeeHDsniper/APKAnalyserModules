import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.io.FileFilter;
import java.util.regex.Pattern;

public class slj
  implements FileFilter
{
  public slj()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean accept(File paramFile)
  {
    return Pattern.matches("cpu[0-9]", paramFile.getName());
  }
}
