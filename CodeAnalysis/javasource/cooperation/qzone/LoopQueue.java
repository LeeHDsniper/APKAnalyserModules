package cooperation.qzone;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Arrays;

public class LoopQueue
{
  private int jdField_a_of_type_Int;
  private Object[] jdField_a_of_type_ArrayOfJavaLangObject;
  private int b;
  private int c;
  private int d;
  
  public LoopQueue()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 10;
    c = 0;
    d = 0;
    b = jdField_a_of_type_Int;
    jdField_a_of_type_ArrayOfJavaLangObject = new Object[b];
  }
  
  public LoopQueue(int paramInt)
  {
    jdField_a_of_type_Int = 10;
    c = 0;
    d = 0;
    if (paramInt < 1) {
      throw new IllegalArgumentException("size不能小于1,size=" + paramInt);
    }
    b = paramInt;
    jdField_a_of_type_ArrayOfJavaLangObject = new Object[b];
  }
  
  public LoopQueue(Object paramObject)
  {
    this();
    jdField_a_of_type_ArrayOfJavaLangObject[0] = paramObject;
    d += 1;
  }
  
  public LoopQueue(Object paramObject, int paramInt)
  {
    jdField_a_of_type_Int = 10;
    c = 0;
    d = 0;
    if (paramInt < 1) {
      throw new IllegalArgumentException("initSize不能小于1,initSize=" + paramInt);
    }
    if (paramObject == null) {
      throw new IllegalArgumentException("element不能为null,element=null");
    }
    b = paramInt;
    jdField_a_of_type_ArrayOfJavaLangObject = new Object[b];
    jdField_a_of_type_ArrayOfJavaLangObject[0] = paramObject;
    d += 1;
  }
  
  public int a()
  {
    if (b()) {
      return 0;
    }
    if (d > c) {
      return d - c;
    }
    return b - (c - d);
  }
  
  public Object a()
  {
    if (b()) {
      throw new IndexOutOfBoundsException("空队列异常");
    }
    Object localObject = jdField_a_of_type_ArrayOfJavaLangObject[c];
    Object[] arrayOfObject = jdField_a_of_type_ArrayOfJavaLangObject;
    int i = c;
    c = (i + 1);
    arrayOfObject[i] = null;
    if (c == b) {}
    for (i = 0;; i = c)
    {
      c = i;
      return localObject;
    }
  }
  
  public void a()
  {
    Arrays.fill(jdField_a_of_type_ArrayOfJavaLangObject, null);
    c = 0;
    d = 0;
  }
  
  public void a(Object paramObject)
  {
    if ((d == c) && (jdField_a_of_type_ArrayOfJavaLangObject[c] != null)) {
      throw new IndexOutOfBoundsException("队列已满的异常");
    }
    if (paramObject == null) {
      throw new IllegalArgumentException("element不能为null,element=null");
    }
    Object[] arrayOfObject = jdField_a_of_type_ArrayOfJavaLangObject;
    int i = d;
    d = (i + 1);
    arrayOfObject[i] = paramObject;
    if (d == b) {}
    for (i = 0;; i = d)
    {
      d = i;
      return;
    }
  }
  
  public boolean a()
  {
    return a() == b;
  }
  
  public Object b()
  {
    if (b()) {
      throw new IndexOutOfBoundsException("空队列异常");
    }
    return jdField_a_of_type_ArrayOfJavaLangObject[c];
  }
  
  public boolean b()
  {
    return (d == c) && (jdField_a_of_type_ArrayOfJavaLangObject[d] == null);
  }
  
  public String toString()
  {
    if (b()) {
      return "[]";
    }
    if (c < d)
    {
      localStringBuilder = new StringBuilder("[");
      i = c;
      while (i < d)
      {
        localStringBuilder.append(jdField_a_of_type_ArrayOfJavaLangObject[i].toString() + "->");
        i += 1;
      }
      i = localStringBuilder.length();
      return "]";
    }
    StringBuilder localStringBuilder = new StringBuilder("[");
    int i = c;
    while (i < b)
    {
      localStringBuilder.append(jdField_a_of_type_ArrayOfJavaLangObject[i].toString() + "->");
      i += 1;
    }
    i = 0;
    while (i < d)
    {
      localStringBuilder.append(jdField_a_of_type_ArrayOfJavaLangObject[i].toString() + "->");
      i += 1;
    }
    i = localStringBuilder.length();
    return "]";
  }
}
