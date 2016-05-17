import android.view.View;
import com.tencent.mobileqq.activity.aio.AIOTipsController;
import com.tencent.mobileqq.activity.aio.tips.TipsBarTask;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lne
  implements Runnable
{
  public lne(TipsManager paramTipsManager, TipsBarTask paramTipsBarTask, Object[] paramArrayOfObject)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    View localView = jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask.a(jdField_a_of_type_ArrayOfJavaLangObject);
    TipsManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask, localView);
    TipsManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager).a(localView);
    TipsManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask);
  }
}
