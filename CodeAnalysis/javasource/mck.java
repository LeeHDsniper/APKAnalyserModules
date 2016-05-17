import QCARD.CollectCouponRsp;
import QCARD.CouponMobileFolder;
import QCARD.CouponMobileItem;
import QCARD.GetCollectItemMobileRsp;
import QCARD.GetListRsp;
import android.content.res.Resources;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import com.tencent.mobileqq.activity.qqcard.QQCardActivity;
import com.tencent.mobileqq.activity.qqcard.QQCardFooter;
import com.tencent.mobileqq.activity.qqcard.QQCardManager;
import com.tencent.mobileqq.app.QQCardObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class mck
  extends QQCardObserver
{
  public mck(QQCardFooter paramQQCardFooter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, String paramString, CollectCouponRsp paramCollectCouponRsp)
  {
    if (QLog.isColorLevel()) {
      QLog.d(QQCardFooter.jdField_a_of_type_JavaLangString, 2, "onCollectCouponRsp," + paramBoolean + ",cardId=" + paramString);
    }
    if (!paramBoolean)
    {
      if (paramCollectCouponRsp != null) {
        a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard.error.collectCoupon", ret_code);
      }
      QQCardFooter.a(a, null);
      QQToast.a(QQCardFooter.a(a), QQCardFooter.a(a).getString(2131366382), 0).a();
      QQCardFooter.a(a, paramString, 0);
    }
    do
    {
      return;
      paramString = QQCardFooter.a(a, paramString, 9);
    } while (paramString == null);
    QQCardFooter.a(a, (CouponMobileItem)paramString.getTag(), 800);
    QQCardFooter.a(a).sendEmptyMessageDelayed(3, 3000L);
  }
  
  public void a(boolean paramBoolean, String paramString, GetCollectItemMobileRsp paramGetCollectItemMobileRsp)
  {
    String str1;
    if (QLog.isColorLevel())
    {
      String str2 = QQCardFooter.jdField_a_of_type_JavaLangString;
      StringBuilder localStringBuilder = new StringBuilder().append("onQueryCouponStatus,").append(paramBoolean).append(",cardId=").append(paramString).append(",rsp=");
      if (paramGetCollectItemMobileRsp != null)
      {
        str1 = "itemStatus=" + item.status + ",itemRealId=" + item.field + "_" + item.card_id + "_" + item.code;
        QLog.d(str2, 2, str1);
      }
    }
    else
    {
      if (!TextUtils.isEmpty(paramString)) {
        break label150;
      }
    }
    label150:
    do
    {
      return;
      str1 = "empty";
      break;
      if ((!paramBoolean) || (paramGetCollectItemMobileRsp == null) || (ret_code != 0) || (item.status != 1)) {
        break label256;
      }
      QQCardFooter.a(a, paramString, 1);
      if (paramString.equals(QQCardFooter.a(a)))
      {
        QQCardFooter.a(a, null);
        QQCardFooter.a(a).removeMessages(3);
        QQCardFooter.a(a).sendEmptyMessage(3);
      }
    } while (item.is_valid != 1);
    QQCardFooter.a(a).a(paramString, paramGetCollectItemMobileRsp);
    return;
    label256:
    if (a.jdField_a_of_type_JavaUtilHashMap.containsKey(paramString)) {}
    for (int i = ((Integer)a.jdField_a_of_type_JavaUtilHashMap.get(paramString)).intValue();; i = 0)
    {
      i += 1;
      if (((paramBoolean) && (paramGetCollectItemMobileRsp != null) && (ret_code != 63536)) || (i >= 30)) {
        break label376;
      }
      a.jdField_a_of_type_JavaUtilHashMap.put(paramString, Integer.valueOf(i));
      paramString = QQCardFooter.a(a, paramString, 9);
      if (paramString == null) {
        break;
      }
      QQCardFooter.a(a, (CouponMobileItem)paramString.getTag(), 2000);
      return;
    }
    label376:
    if (paramGetCollectItemMobileRsp != null) {
      a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard.error.queryCouponStatus", ret_code);
    }
    if (paramString.equals(QQCardFooter.a(a))) {
      QQCardFooter.a(a, null);
    }
    QQCardFooter.a(a, paramString, 0);
  }
  
  public void d(boolean paramBoolean, GetListRsp paramGetListRsp)
  {
    if (QLog.isColorLevel()) {
      QLog.d(QQCardFooter.jdField_a_of_type_JavaLangString, 2, "onGetRecommendCoupon," + paramBoolean);
    }
    if ((paramBoolean) && (paramGetListRsp != null) && (folder_list != null) && (folder_list.size() > 0))
    {
      paramGetListRsp = (CouponMobileFolder)folder_list.get(0);
      paramGetListRsp = QQCardFooter.a(a, coupon_list);
      if (paramGetListRsp != null)
      {
        paramGetListRsp = paramGetListRsp.iterator();
        while (paramGetListRsp.hasNext())
        {
          CouponMobileItem localCouponMobileItem = (CouponMobileItem)paramGetListRsp.next();
          QQCardFooter.a(a, localCouponMobileItem, 0);
        }
      }
    }
  }
}
