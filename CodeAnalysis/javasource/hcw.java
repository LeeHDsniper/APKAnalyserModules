import android.os.SystemClock;
import com.tencent.common.app.ThreadTracker;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.TraceUtils;
import java.lang.ref.Reference;
import java.util.Iterator;
import java.util.Vector;

class hcw
  implements Iterator
{
  private Thread jdField_a_of_type_JavaLangThread;
  private final Iterator jdField_a_of_type_JavaUtilIterator;
  private boolean jdField_a_of_type_Boolean;
  private Thread b;
  
  hcw(hcv paramHcv)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilIterator = jdField_a_of_type_Hcv.jdField_a_of_type_JavaLangIterable.iterator();
  }
  
  private void a()
  {
    jdField_a_of_type_Boolean = false;
    while ((jdField_a_of_type_JavaLangThread == null) && (jdField_a_of_type_JavaUtilIterator.hasNext()))
    {
      jdField_a_of_type_JavaLangThread = ((Thread)((Reference)jdField_a_of_type_JavaUtilIterator.next()).get());
      if ((jdField_a_of_type_Hcv.jdField_a_of_type_Boolean) && (jdField_a_of_type_JavaLangThread == null)) {
        jdField_a_of_type_JavaUtilIterator.remove();
      }
    }
  }
  
  public Thread a()
  {
    if (!hasNext()) {
      throw new IllegalStateException();
    }
    Thread localThread = jdField_a_of_type_JavaLangThread;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_JavaLangThread = null;
    b = localThread;
    return localThread;
  }
  
  public boolean hasNext()
  {
    a();
    return jdField_a_of_type_JavaLangThread != null;
  }
  
  public void remove()
  {
    if (!jdField_a_of_type_Boolean) {
      throw new IllegalStateException();
    }
    jdField_a_of_type_JavaUtilIterator.remove();
    hcx localHcx;
    if (b != null)
    {
      if (!b.getName().startsWith("SharedPreferencesImpl")) {
        TraceUtils.a("Thread." + b.getName() + "." + b.getId());
      }
      if (ThreadTracker.a())
      {
        localHcx = ThreadTracker.a(b.getId(), ThreadTracker.a);
        if (localHcx == null) {
          break label161;
        }
        hcx.a(localHcx, b.getName());
        hcx.a(localHcx, SystemClock.uptimeMillis() - ThreadTracker.a());
      }
    }
    for (;;)
    {
      if (!b.getName().startsWith("SharedPreferencesImpl")) {
        TraceUtils.a();
      }
      b = null;
      return;
      label161:
      localHcx = new hcx(b.getId(), b.getName(), 0L, null);
      hcx.a(localHcx, b.getName());
      hcx.a(localHcx, SystemClock.uptimeMillis() - ThreadTracker.a());
      ThreadTracker.a.add(localHcx);
    }
  }
}
