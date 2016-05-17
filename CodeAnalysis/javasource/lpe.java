import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.SearchResultDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AdapterView.OnItemClickListener;

public class lpe
  implements View.OnClickListener
{
  public lpe(SearchResultDialog paramSearchResultDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    int i = ((Integer)paramView.getTag(-1)).intValue();
    SearchResultDialog.a(a).a(SearchResultDialog.a(a), paramView, i, 0L);
  }
}
