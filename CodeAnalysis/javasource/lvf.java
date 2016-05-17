import android.app.Activity;
import android.content.IntentFilter;
import android.os.Build.VERSION;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.observer.SdCardChangeListener;
import java.io.PrintStream;

public class lvf
  implements Runnable
{
  public lvf(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    SplashActivity localSplashActivity = a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity;
    if (localSplashActivity == null) {
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqObserverSdCardChangeListener = new SdCardChangeListener(a.jdField_a_of_type_AndroidOsHandler);
    a.jdField_a_of_type_ComTencentMobileqqObserverSdCardChangeListener.a(0);
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.intent.action.MEDIA_MOUNTED");
    localIntentFilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
    localIntentFilter.addAction("android.intent.action.MEDIA_REMOVED");
    localIntentFilter.addAction("android.intent.action.MEDIA_EJECT");
    localIntentFilter.addDataScheme("file");
    try
    {
      localSplashActivity.registerReceiver(a.jdField_a_of_type_ComTencentMobileqqObserverSdCardChangeListener, localIntentFilter);
      if (Build.VERSION.RELEASE.startsWith("L"))
      {
        System.out.println("SecShell : art L");
        return;
      }
      a.j();
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}
