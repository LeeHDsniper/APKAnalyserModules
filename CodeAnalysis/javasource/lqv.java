import android.graphics.Bitmap;
import android.view.View;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment.ItemViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.IIconListener;
import com.tencent.widget.XListView;

public class lqv
  implements IIconListener
{
  public lqv(SearchBaseFragment paramSearchBaseFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, int paramInt2, Bitmap paramBitmap)
  {
    if ((paramBitmap == null) || (paramInt2 == 201)) {}
    for (;;)
    {
      return;
      if ((a.e == 0) && (a.a != null))
      {
        int i = a.a.getChildCount();
        paramInt2 = 0;
        while (paramInt2 < i)
        {
          paramBitmap = a.a.getChildAt(paramInt2).getTag();
          if ((paramBitmap != null) && ((paramBitmap instanceof SearchBaseFragment.ItemViewHolder)))
          {
            paramBitmap = (SearchBaseFragment.ItemViewHolder)paramBitmap;
            if (jdField_a_of_type_Int == paramInt1) {
              a.a(paramBitmap, jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus);
            }
          }
          paramInt2 += 1;
        }
      }
    }
  }
}
