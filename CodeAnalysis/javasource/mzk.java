import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.Base64Util;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.OutputStream;

public class mzk
{
  public int a;
  public long a;
  public int b;
  public long b;
  public long c;
  public long d;
  public long e;
  
  public mzk(MemoryManager paramMemoryManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    long l = DeviceInfoUtil.c();
    try
    {
      Object localObject = BaseApplicationImpl.a().getSharedPreferences("MemoryInfomation", 0).getString("LowMemoryStat", null);
      if (localObject == null) {
        return;
      }
      if (((String)localObject).length() == 0) {
        return;
      }
      localObject = new DataInputStream(new ByteArrayInputStream(Base64Util.decode((String)localObject, 0)));
      jdField_a_of_type_Long = ((DataInputStream)localObject).readLong();
      jdField_b_of_type_Long = ((DataInputStream)localObject).readLong();
      jdField_a_of_type_Int = ((DataInputStream)localObject).readInt();
      c = ((DataInputStream)localObject).readLong();
      d = ((DataInputStream)localObject).readLong();
      jdField_b_of_type_Int = ((DataInputStream)localObject).readInt();
      e = ((DataInputStream)localObject).readLong();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        b();
      }
    }
    if ((l < jdField_a_of_type_Long) || (l < jdField_b_of_type_Long) || (l < c) || (l < d))
    {
      b();
      return;
    }
  }
  
  public void b()
  {
    jdField_a_of_type_Long = 0L;
    jdField_b_of_type_Long = 0L;
    jdField_a_of_type_Int = 0;
    c = 0L;
    d = 0L;
    jdField_b_of_type_Int = 0;
    e = 0L;
  }
  
  public void c()
  {
    try
    {
      Object localObject = new ByteArrayOutputStream();
      DataOutputStream localDataOutputStream = new DataOutputStream((OutputStream)localObject);
      localDataOutputStream.writeLong(jdField_a_of_type_Long);
      localDataOutputStream.writeLong(jdField_b_of_type_Long);
      localDataOutputStream.writeInt(jdField_a_of_type_Int);
      localDataOutputStream.writeLong(c);
      localDataOutputStream.writeLong(d);
      localDataOutputStream.writeInt(jdField_b_of_type_Int);
      localDataOutputStream.writeLong(e);
      localDataOutputStream.flush();
      localObject = ((ByteArrayOutputStream)localObject).toByteArray();
      BaseApplicationImpl.a().getSharedPreferences("MemoryInfomation", 0).edit().putString("LowMemoryStat", Base64Util.encodeToString((byte[])localObject, 0)).commit();
      return;
    }
    catch (Exception localException) {}
  }
}
