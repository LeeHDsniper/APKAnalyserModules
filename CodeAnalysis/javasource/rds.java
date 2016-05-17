import android.os.Build.VERSION;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.memoryleak.DumpMemInfoHandler;
import com.tencent.mobileqq.memoryleak.LeakInspector.InspectorListener;
import com.tencent.mobileqq.startup.step.InitLeakInspector;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public class rds
  implements LeakInspector.InspectorListener
{
  public rds() {}
  
  public List a(String paramString)
  {
    if (BaseActivity.sTopActivity != null) {
      BaseActivity.sTopActivity.runOnUiThread(new rdt(this, paramString));
    }
    paramString = new ArrayList(4);
    paramString.add(DumpMemInfoHandler.b());
    paramString.add(DumpMemInfoHandler.a());
    paramString.addAll(DumpMemInfoHandler.b());
    return paramString;
  }
  
  public void a(String paramString1, String paramString2, WeakReference paramWeakReference)
  {
    InitLeakInspector.a(paramString1, paramString2, paramWeakReference);
  }
  
  public void a(boolean paramBoolean, String paramString1, String paramString2)
  {
    if (BaseActivity.sTopActivity != null) {
      BaseActivity.sTopActivity.runOnUiThread(new rdu(this, paramString1, paramBoolean, paramString2));
    }
  }
  
  public boolean a(Object paramObject)
  {
    return Build.VERSION.SDK_INT >= 20;
  }
}
