import android.database.DataSetObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AdapterViewPagerAdapter;

public class uaq
  extends DataSetObserver
{
  public uaq(AdapterViewPagerAdapter paramAdapterViewPagerAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onChanged()
  {
    a.notifyDataSetChanged();
  }
  
  public void onInvalidated()
  {
    super.onInvalidated();
  }
}
