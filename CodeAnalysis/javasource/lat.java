import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.ProgressPieDrawable;
import com.tencent.qphone.base.util.QLog;

class lat
  implements Runnable
{
  lat(las paramLas, ProgressPieDrawable paramProgressPieDrawable)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetProgressPieDrawable.setVisible(false, true);
    if (QLog.isColorLevel()) {
      QLog.i("ShortVideoRealItemBuilder", 2, "[onProgressCompleted] set ProgressPieDrawable invisible,ppd = " + jdField_a_of_type_ComTencentMobileqqWidgetProgressPieDrawable);
    }
  }
}
