import android.os.Message;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.proxy.fts.FTSSyncHandler;
import com.tencent.mobileqq.app.proxy.fts.FTSTroopOperator;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.fts.FTSTroopSync;
import com.tencent.mobileqq.data.fts.FTSTroopTime;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.fts.FTSDatatbase;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

public class nlx
  implements Runnable
{
  public nlx(FTSTroopOperator paramFTSTroopOperator)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (!FTSTroopOperator.a(a))
    {
      FTSTroopOperator.a(a);
      if (FTSTroopOperator.b(a) >= 5)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.fts.troop.operator", 2, "checkTroopTimeStamp failed");
        }
        return;
      }
      a.jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler.postDelayed(this, 5000L);
      return;
    }
    a.b();
    Object localObject1 = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    Object localObject2 = FTSTroopOperator.a(a).a();
    Object localObject3 = ((EntityManager)localObject1).a(FTSTroopTime.class, FTSTroopTime.class.getSimpleName(), false, null, null, null, null, null, null);
    ((EntityManager)localObject1).a();
    if (localObject2 != null)
    {
      localObject1 = new HashMap();
      localObject2 = ((List)localObject2).iterator();
      Object localObject4;
      while (((Iterator)localObject2).hasNext())
      {
        localObject4 = (TroopInfo)((Iterator)localObject2).next();
        ((HashMap)localObject1).put(troopuin, localObject4);
      }
      localObject2 = new ArrayList();
      if (localObject3 != null)
      {
        localObject3 = ((List)localObject3).iterator();
        while (((Iterator)localObject3).hasNext())
        {
          FTSTroopTime localFTSTroopTime = (FTSTroopTime)((Iterator)localObject3).next();
          localObject4 = mTroopUin;
          if (((HashMap)localObject1).containsKey(localObject4))
          {
            TroopInfo localTroopInfo = (TroopInfo)((HashMap)localObject1).get(localObject4);
            if ((wMemberNum == 0) || (mMemberNumSeq == 0L))
            {
              if (QLog.isColorLevel()) {
                QLog.d("Q.fts.troop.operator", 2, "checkTroopTimeStamp troop ignore troopuin:" + (String)localObject4 + " wMemberNum:" + wMemberNum + " mMemberNumSeq:" + mMemberNumSeq);
              }
              ((HashMap)localObject1).remove(localObject4);
            }
            else
            {
              if (mTimeStamp < mMemberNumSeq) {}
              try
              {
                ((ArrayList)localObject2).add(new FTSTroopSync(5, Long.parseLong(troopuin)));
                if (QLog.isColorLevel()) {
                  QLog.d("Q.fts.troop.operator", 2, "checkTroopTimeStamp add troop:" + troopname + " mMemberNumSeq:" + mMemberNumSeq + " troopTime:" + localFTSTroopTime.toString());
                }
                ((HashMap)localObject1).remove(localObject4);
              }
              catch (Exception localException3)
              {
                for (;;)
                {
                  if (QLog.isColorLevel()) {
                    QLog.e("Q.fts.troop.operator", 2, "checkTroopTimeStamp e:" + localException3.toString());
                  }
                }
              }
            }
          }
          else
          {
            try
            {
              ((ArrayList)localObject2).add(new FTSTroopSync(4, Long.parseLong((String)localObject4)));
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.d("Q.fts.troop.operator", 2, "checkTroopTimeStamp delete troop=" + (String)localObject4);
            }
            catch (Exception localException2) {}
            if (QLog.isColorLevel()) {
              QLog.e("Q.fts.troop.operator", 2, "checkTroopTimeStamp e:" + localException2.toString());
            }
          }
        }
      }
      if (a.jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.b("TroopIndex") > 0)
      {
        localObject1 = ((HashMap)localObject1).entrySet().iterator();
        while (((Iterator)localObject1).hasNext())
        {
          try
          {
            localObject3 = (Map.Entry)((Iterator)localObject1).next();
            ((ArrayList)localObject2).add(new FTSTroopSync(5, Long.parseLong((String)((Map.Entry)localObject3).getKey())));
            if (!QLog.isColorLevel()) {
              continue;
            }
            QLog.d("Q.fts.troop.operator", 2, "checkTroopTimeStamp add troop:" + (String)((Map.Entry)localObject3).getKey());
          }
          catch (Exception localException1) {}
          if (QLog.isColorLevel()) {
            QLog.e("Q.fts.troop.operator", 2, "checkTroopTimeStamp e:" + localException1.toString());
          }
        }
      }
      a.a((ArrayList)localObject2);
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.troop.operator", 2, "checkTroopTimeStamp optList.size:" + ((ArrayList)localObject2).size());
      }
    }
    FTSTroopOperator.a(a).e();
    a.jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler.obtainMessage(1, a).sendToTarget();
  }
}
