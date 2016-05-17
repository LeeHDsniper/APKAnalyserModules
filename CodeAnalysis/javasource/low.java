import android.graphics.Bitmap;
import android.view.View;
import com.tencent.mobileqq.activity.contact.CircleMemberListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.IIconListener;
import com.tencent.widget.XListView;

public class low
  implements IIconListener
{
  public low(CircleMemberListActivity paramCircleMemberListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, int paramInt2, Bitmap paramBitmap)
  {
    if ((paramBitmap == null) || (paramInt2 == 201)) {}
    for (;;)
    {
      return;
      if (a.jdField_a_of_type_Int == 0)
      {
        int i = CircleMemberListActivity.a(a).getChildCount();
        paramInt2 = 0;
        while (paramInt2 < i)
        {
          paramBitmap = CircleMemberListActivity.a(a).getChildAt(paramInt2).getTag();
          if ((paramBitmap != null) && ((paramBitmap instanceof lpa)))
          {
            paramBitmap = (lpa)paramBitmap;
            if (jdField_a_of_type_Int == paramInt1) {
              a.a(paramBitmap, jdField_a_of_type_ComTencentMobileqqDataCircleBuddy);
            }
          }
          paramInt2 += 1;
        }
      }
    }
  }
}
