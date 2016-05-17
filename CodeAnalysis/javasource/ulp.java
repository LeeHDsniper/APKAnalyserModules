import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.biz.widgets.ScannerView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qlink.QQProxyForQlink;

public class ulp
  implements DialogInterface.OnClickListener
{
  public ulp(QQProxyForQlink paramQQProxyForQlink, ScannerView paramScannerView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    jdField_a_of_type_ComTencentBizWidgetsScannerView.d();
    paramDialogInterface.dismiss();
  }
}
