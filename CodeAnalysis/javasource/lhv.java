import com.tencent.mobileqq.activity.aio.rebuild.HotChatPie;
import com.tencent.mobileqq.app.HotchatSCHelper;
import com.tencent.mobileqq.app.HotchatSCHelper.OnShowNoteListener;
import com.tencent.mobileqq.app.HotchatSCMng.HotchatNote;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.troop.logic.TroopFeedsCenterLogic;
import com.tencent.qphone.base.util.QLog;

public class lhv
  implements HotchatSCHelper.OnShowNoteListener
{
  public lhv(HotChatPie paramHotChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean a(HotchatSCMng.HotchatNote paramHotchatNote)
  {
    if (QLog.isDevelopLevel()) {
      NearbyUtils.a("Q.aio.TroopChatPie", "onShowHotchatNote", new Object[] { paramHotchatNote });
    }
    if (paramHotchatNote == null)
    {
      if ((a.jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.b) && (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null)) {
        a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a(null, null);
      }
      return false;
    }
    if (a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) {
      a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = new TroopFeedsCenterLogic(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, HotChatPie.a(a), HotChatPie.a(a), a.jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips, a.K);
    }
    a.jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a(a, b);
    a.jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.b = true;
    return true;
  }
}
