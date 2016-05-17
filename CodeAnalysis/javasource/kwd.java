import android.app.Activity;
import android.view.View;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil.TipsClickedInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.mobileqq.vas.VasH5PayUtil;

public class kwd
  implements FileManagerUtil.TipsClickedInterface
{
  public kwd(GrayTipsItemBuilder paramGrayTipsItemBuilder, String paramString1, String paramString2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView)
  {
    int i = SharedPreUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "renewal_tail_tip_exit");
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "aio_pay", "aio_payclk", 0, 0, "" + i, "", "", "");
    VasH5PayUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_AndroidContentContext, "mvip.gexinghua.android.aio_pay", 1, "1450000515", jdField_a_of_type_JavaLangString, b, "AioVIP");
    MsgProxyUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 61516);
  }
}
