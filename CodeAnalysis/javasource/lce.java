import com.tencent.mobileqq.data.MessageForTroopGift;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityTransaction;
import java.util.ArrayList;

public final class lce
  implements Runnable
{
  public lce(EntityManager paramEntityManager, ArrayList paramArrayList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    localEntityTransaction = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
    try
    {
      localEntityTransaction.a();
      int i = 0;
      while (i < jdField_a_of_type_JavaUtilArrayList.size())
      {
        MessageForTroopGift localMessageForTroopGift = (MessageForTroopGift)jdField_a_of_type_JavaUtilArrayList.get(i);
        jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(localMessageForTroopGift);
        i += 1;
      }
      localEntityTransaction.c();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localEntityTransaction.b();
      }
    }
    finally
    {
      localEntityTransaction.b();
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
  }
}
