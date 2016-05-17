import android.app.Activity;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.item.QzoneFeedItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForQzoneFeed;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.util.URLUtil;
import cooperation.qzone.QZoneClickReport;
import cooperation.qzone.QZoneClickReport.ReportInfo;
import cooperation.qzone.QZoneHelper;
import cooperation.qzone.QZoneHelper.UserInfo;
import java.util.HashMap;
import java.util.Map;

public class kzq
  implements View.OnClickListener
{
  public kzq(QzoneFeedItemBuilder paramQzoneFeedItemBuilder, MessageForQzoneFeed paramMessageForQzoneFeed)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_ComTencentMobileqqDataMessageForQzoneFeed.actionUrl = jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a(jdField_a_of_type_ComTencentMobileqqDataMessageForQzoneFeed.actionUrl);
    if (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqDataMessageForQzoneFeed.actionUrl)) {
      return;
    }
    Object localObject = URLUtil.a(jdField_a_of_type_ComTencentMobileqqDataMessageForQzoneFeed.actionUrl);
    if (localObject != null) {}
    for (localObject = (String)((Map)localObject).get("g");; localObject = null)
    {
      if (("110".equals(localObject)) || ("279".equals(localObject)) || ("318".equals(localObject)))
      {
        paramView = paramView.getContext();
        localObject = QZoneHelper.UserInfo.a();
        a = jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.a();
        b = jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.b();
        c = jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.getSid();
        QZoneHelper.a((Activity)paramView, (QZoneHelper.UserInfo)localObject, jdField_a_of_type_ComTencentMobileqqDataMessageForQzoneFeed.actionUrl, "mqqChat.QzoneCard", jdField_a_of_type_ComTencentMobileqqDataMessageForQzoneFeed.appId, -1);
        paramView = new QZoneClickReport.ReportInfo();
        c = "1";
        d = "0";
        b = 4;
        k = "3";
        l = "AIO";
        m = "detailPage";
        QZoneClickReport.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.getAccount(), paramView);
        paramView = new HashMap();
        paramView.put("source_type", "3");
        paramView.put("source_from", "AIO");
        paramView.put("source_to", "detailPage");
        StatisticCollector.a(BaseApplicationImpl.getContext()).a(jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.getAccount(), "actQZSourceDataReport", true, 0L, 0L, paramView, null);
      }
      for (;;)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a, "CliOper", "", "", "0X8006000", "0X8006000", 0, 0, "", "", "", "");
        return;
        jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a(jdField_a_of_type_ComTencentMobileqqDataMessageForQzoneFeed.actionUrl);
      }
    }
  }
}
