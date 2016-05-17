import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.Base64Util;
import com.tencent.qphone.base.util.QLog;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.OutputStream;
import java.util.HashMap;

public class mzl
{
  public int a;
  public long a;
  public int b;
  public long b;
  public int c;
  public long c;
  public long d;
  public long e;
  public long f;
  public long g;
  public long h;
  
  public mzl(MemoryManager paramMemoryManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    try
    {
      Object localObject = BaseApplicationImpl.a().getSharedPreferences("MemoryInfomation", 0).getString("MemoryInfomation", null);
      if (localObject == null) {
        return;
      }
      if (((String)localObject).length() == 0) {
        return;
      }
      localObject = new DataInputStream(new ByteArrayInputStream(Base64Util.decode((String)localObject, 0)));
      jdField_a_of_type_Long = ((DataInputStream)localObject).readLong();
      jdField_a_of_type_Int = ((DataInputStream)localObject).readInt();
      jdField_b_of_type_Long = ((DataInputStream)localObject).readLong();
      jdField_c_of_type_Long = ((DataInputStream)localObject).readLong();
      d = ((DataInputStream)localObject).readLong();
      e = ((DataInputStream)localObject).readLong();
      f = ((DataInputStream)localObject).readLong();
      g = ((DataInputStream)localObject).readLong();
      h = ((DataInputStream)localObject).readLong();
      jdField_b_of_type_Int = ((DataInputStream)localObject).readInt();
      jdField_c_of_type_Int = ((DataInputStream)localObject).readInt();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        HashMap localHashMap = new HashMap(3);
        localHashMap.put("type", "wrong-value");
        localHashMap.put("file", "MemoryInfomation");
        localHashMap.put("key", "MemoryInfomation");
        StatisticCollector.a(BaseApplicationImpl.a()).a(null, "evSpError", true, 0L, 0L, localHashMap, null);
        b();
      }
    }
    if ((jdField_b_of_type_Long < jdField_c_of_type_Long) || (jdField_b_of_type_Long < d) || (jdField_b_of_type_Long < e) || (jdField_b_of_type_Long < f))
    {
      b();
      return;
    }
  }
  
  public void b()
  {
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Long = 0L;
    jdField_c_of_type_Long = 0L;
    d = 0L;
    e = 0L;
    f = 0L;
    g = 0L;
    h = 0L;
    jdField_b_of_type_Int = 0;
    jdField_c_of_type_Int = 0;
  }
  
  public void c()
  {
    try
    {
      Object localObject = new ByteArrayOutputStream();
      DataOutputStream localDataOutputStream = new DataOutputStream((OutputStream)localObject);
      localDataOutputStream.writeLong(jdField_a_of_type_Long);
      localDataOutputStream.writeInt(jdField_a_of_type_Int);
      localDataOutputStream.writeLong(jdField_b_of_type_Long);
      localDataOutputStream.writeLong(jdField_c_of_type_Long);
      localDataOutputStream.writeLong(d);
      localDataOutputStream.writeLong(e);
      localDataOutputStream.writeLong(f);
      localDataOutputStream.writeLong(g);
      localDataOutputStream.writeLong(h);
      localDataOutputStream.writeInt(jdField_b_of_type_Int);
      localDataOutputStream.writeInt(jdField_c_of_type_Int);
      localDataOutputStream.flush();
      localObject = ((ByteArrayOutputStream)localObject).toByteArray();
      BaseApplicationImpl.a().getSharedPreferences("MemoryInfomation", 0).edit().putString("MemoryInfomation", Base64Util.encodeToString((byte[])localObject, 0)).commit();
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("Q.Memory.MemoryManager", 2, "StatMemory.save exception", localException);
    }
  }
}
