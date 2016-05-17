import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.DynamicMsgInfoManager;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

public class lkm
  implements Runnable
{
  private WeakReference a;
  
  public lkm(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramPublicAccountChatPie);
  }
  
  public void run()
  {
    Object localObject1 = (PublicAccountChatPie)a.get();
    if (localObject1 == null) {}
    for (;;)
    {
      return;
      Object localObject2 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity;
      if ((localObject2 != null) && (!((FragmentActivity)localObject2).isFinishing()))
      {
        jdField_a_of_type_ComTencentMobileqqAppPublicAccountHandler = ((PublicAccountHandler)app.a(11));
        localObject1 = (DynamicMsgInfoManager)app.getManager(99);
        if (localObject1 != null)
        {
          localObject2 = ((DynamicMsgInfoManager)localObject1).a();
          if (localObject2 != null)
          {
            localObject2 = ((ArrayList)localObject2).iterator();
            while (((Iterator)localObject2).hasNext())
            {
              String str = (String)((Iterator)localObject2).next();
              ((DynamicMsgInfoManager)localObject1).a(((DynamicMsgInfoManager)localObject1).a(), str);
            }
          }
        }
      }
    }
  }
}
