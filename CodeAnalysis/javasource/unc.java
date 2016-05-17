import android.os.Bundle;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qqfav.QfavHelper.AsyncFavoritesProvider;
import cooperation.qqfav.content.FavoritesProvider;
import java.util.concurrent.atomic.AtomicBoolean;

public class unc
  extends QfavHelper.AsyncFavoritesProvider
{
  public unc(FavoritesProvider paramFavoritesProvider, Bundle paramBundle, AtomicBoolean paramAtomicBoolean)
  {
    super(paramBundle);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, Bundle arg2)
  {
    synchronized (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean)
    {
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.notify();
      return;
    }
  }
  
  public void onInstallFinish(String paramString)
  {
    synchronized (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean)
    {
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set("qqfav.apk".equals(paramString));
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.notify();
      return;
    }
  }
}
