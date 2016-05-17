import android.content.Intent;
import com.tencent.mobileqq.activity.DevlockPushActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class kbb
  implements Runnable
{
  public kbb(SplashActivity paramSplashActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    boolean bool2 = true;
    if (!a.isResume()) {}
    Object localObject7;
    do
    {
      return;
      localObject7 = a.app.getDevLockIntent();
    } while (localObject7 == null);
    Object localObject2 = "";
    Object localObject5 = "";
    String str3 = "";
    String str4 = "";
    localObject6 = new ArrayList();
    String str2 = str4;
    String str1 = str3;
    Object localObject1 = localObject5;
    boolean bool1 = bool2;
    try
    {
      localObject3 = ((Intent)localObject7).getStringExtra("tipMsg");
      str2 = str4;
      str1 = str3;
      localObject1 = localObject5;
      bool1 = bool2;
      localObject2 = localObject3;
      bool2 = ((Intent)localObject7).getBooleanExtra("canCancel", true);
      str2 = str4;
      str1 = str3;
      localObject1 = localObject5;
      bool1 = bool2;
      localObject2 = localObject3;
      localObject5 = ((Intent)localObject7).getStringExtra("title");
      str2 = str4;
      str1 = str3;
      localObject1 = localObject5;
      bool1 = bool2;
      localObject2 = localObject3;
      str3 = ((Intent)localObject7).getStringExtra("secondTitle");
      str2 = str4;
      str1 = str3;
      localObject1 = localObject5;
      bool1 = bool2;
      localObject2 = localObject3;
      str4 = ((Intent)localObject7).getStringExtra("thirdTitle");
      str2 = str4;
      str1 = str3;
      localObject1 = localObject5;
      bool1 = bool2;
      localObject2 = localObject3;
      localObject7 = ((Intent)localObject7).getStringArrayListExtra("wordsList");
      localObject6 = localObject7;
      localObject2 = localObject3;
      bool1 = bool2;
      localObject1 = localObject5;
      str1 = str3;
      str2 = str4;
      localObject3 = localObject6;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject3;
        Object localObject4 = localObject6;
      }
    }
    localObject5 = new Intent(a, DevlockPushActivity.class);
    ((Intent)localObject5).putExtra("canCancel", bool1);
    ((Intent)localObject5).putExtra("tipMsg", (String)localObject2);
    ((Intent)localObject5).putExtra("title", localObject1);
    ((Intent)localObject5).putExtra("secondTitle", str1);
    ((Intent)localObject5).putExtra("thirdTitle", str2);
    ((Intent)localObject5).putStringArrayListExtra("wordsList", (ArrayList)localObject3);
    a.startActivity((Intent)localObject5);
  }
}
