import android.os.SystemClock;
import android.util.Printer;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.UnifiedMonitor;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.Map;

public class nfy
  implements Printer
{
  public static int a = 0;
  public static final String a = ">>";
  public static final String b = "<<";
  private static final String jdField_c_of_type_JavaLangString = "TM.global.LooperPrinter";
  private long a;
  private int jdField_b_of_type_Int = 0;
  private long jdField_b_of_type_Long;
  private int jdField_c_of_type_Int = 0;
  private long jdField_c_of_type_Long;
  private String d;
  private String e;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 200;
  }
  
  public nfy(int paramInt, String paramString)
  {
    jdField_c_of_type_Int = paramInt;
    e = paramString;
  }
  
  private static String a(String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0) || (!paramString.startsWith(">>>"))) {
      return null;
    }
    int i = paramString.indexOf('(');
    if (i == -1) {
      return null;
    }
    int j = paramString.indexOf(')', i);
    if (j == -1) {
      return null;
    }
    String str1 = paramString.substring(i + 1, j);
    int k = paramString.indexOf("} ", j);
    if (k == -1) {
      return null;
    }
    j = paramString.indexOf('@', k + 2);
    i = j;
    if (j == -1)
    {
      j = paramString.indexOf(':', k + 2);
      i = j;
      if (j == -1)
      {
        i = paramString.indexOf(' ', k + 2);
        if (i == -1) {
          break label150;
        }
      }
    }
    String str2 = paramString.substring(k + 2, i);
    i = paramString.indexOf(": ", i);
    if (i == -1)
    {
      return null;
      label150:
      return null;
    }
    return String.format("%s|%s|%s", new Object[] { str1, str2, paramString.substring(i + 2) });
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("TM.global.LooperPrinter", 2, "setting threshold, threshold=" + paramInt);
    }
    jdField_a_of_type_Int = paramInt;
  }
  
  public void println(String paramString)
  {
    if (paramString.startsWith(">>"))
    {
      jdField_c_of_type_Long = SystemClock.uptimeMillis();
      d = paramString;
      if (UnifiedMonitor.a().whetherStackEnabled(jdField_c_of_type_Int)) {
        UnifiedMonitor.a().reportStackIfTimeout(jdField_c_of_type_Int);
      }
    }
    while ((jdField_c_of_type_Long == 0L) || (!paramString.startsWith("<<"))) {
      return;
    }
    jdField_a_of_type_Long += 1L;
    long l = SystemClock.uptimeMillis() - jdField_c_of_type_Long;
    jdField_c_of_type_Long = 0L;
    jdField_b_of_type_Long += l;
    paramString = null;
    Object localObject;
    if ((ThreadManager.b) || (ThreadManager.a))
    {
      localObject = a(d);
      paramString = (String)localObject;
      if (QLog.isDevelopLevel())
      {
        QLog.d("AutoMonitor", 4, e + ", cost=" + l + ", " + (String)localObject);
        paramString = (String)localObject;
      }
    }
    if (l > jdField_a_of_type_Int)
    {
      if (!UnifiedMonitor.a().whetherReportThisTime(jdField_c_of_type_Int))
      {
        jdField_b_of_type_Int = 0;
        return;
      }
      HashMap localHashMap;
      if (paramString == null)
      {
        paramString = a(d);
        localHashMap = new HashMap(8);
        localObject = BaseActivity.sTopActivity;
        if (localObject == null) {
          break label285;
        }
      }
      label285:
      for (localObject = localObject.getClass().getName();; localObject = "")
      {
        localHashMap.put("act", localObject);
        UnifiedMonitor.a().addEvent(jdField_c_of_type_Int, paramString, (int)l, jdField_b_of_type_Int, localHashMap);
        jdField_b_of_type_Int = 0;
        return;
        break;
      }
    }
    if (UnifiedMonitor.a().whetherStackEnabled(jdField_c_of_type_Int)) {
      UnifiedMonitor.a().notifyNotTimeout(jdField_c_of_type_Int);
    }
    jdField_b_of_type_Int += 1;
  }
  
  public String toString()
  {
    return super.toString() + "(msgCount = " + jdField_a_of_type_Long + ", totalCost = " + jdField_b_of_type_Long + ")";
  }
}
