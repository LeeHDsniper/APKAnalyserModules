import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.RedPacketInfo;
import com.tencent.mobileqq.activity.qwallet.PreloadImgManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class kqd
  implements Runnable
{
  kqd(kqc paramKqc, CustomizeStrategyFactory.RedPacketInfo paramRedPacketInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory$RedPacketInfo.jdField_a_of_type_AndroidGraphicsBitmap = PreloadImgManager.a().a(kqc.a(jdField_a_of_type_Kqc), jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory$RedPacketInfo.jdField_a_of_type_JavaLangString);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory$RedPacketInfo.jdField_a_of_type_AndroidGraphicsBitmap == null)
    {
      PreloadImgManager.a().a(kqc.a(jdField_a_of_type_Kqc), jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory$RedPacketInfo.jdField_a_of_type_JavaLangString, new kqe(this));
      return;
    }
    CustomizeStrategyFactory.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory$RedPacketInfo);
  }
}
