import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.app.EqqDetailDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.EqqDetail;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mp.mobileqq_mp.ConfigGroupInfo;
import com.tencent.mobileqq.mp.mobileqq_mp.ConfigInfo;
import com.tencent.mobileqq.mp.mobileqq_mp.GetEqqAccountDetailInfoResponse;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import java.util.Iterator;
import java.util.List;

class lfk
  implements Runnable
{
  lfk(lfj paramLfj)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    EqqDetail localEqqDetail = (EqqDetail)((EntityManager)localObject).a(EqqDetail.class, a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    ((EntityManager)localObject).a();
    if (localEqqDetail == null) {
      return;
    }
    try
    {
      localObject = new mobileqq_mp.GetEqqAccountDetailInfoResponse();
      ((mobileqq_mp.GetEqqAccountDetailInfoResponse)localObject).mergeFrom(accountData);
      groupInfoList = config_group_info.get();
      mIsAgreeSyncLbs = true;
      mIsSyncLbsSelected = true;
      Iterator localIterator1 = groupInfoList.iterator();
      while (localIterator1.hasNext())
      {
        Iterator localIterator2 = nextconfig_info.get().iterator();
        while (localIterator2.hasNext())
        {
          mobileqq_mp.ConfigInfo localConfigInfo = (mobileqq_mp.ConfigInfo)localIterator2.next();
          if (title.get().equals("提供地理位置")) {
            state.set(1);
          }
        }
      }
      accountData = ((mobileqq_mp.GetEqqAccountDetailInfoResponse)localObject).toByteArray();
      ((EqqDetailDataManager)a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(68)).a(localEqqDetail);
      return;
    }
    catch (Exception localException) {}
  }
}
