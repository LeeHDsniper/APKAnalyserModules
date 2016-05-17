import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AdapterView.AdapterDataSetObserver;
import com.tencent.widget.FastScroller;

public class tzr
  extends AdapterView.AdapterDataSetObserver
{
  public tzr(AbsListView paramAbsListView)
  {
    super(paramAbsListView);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onChanged()
  {
    super.onChanged();
    if (a.a != null) {
      a.a.c();
    }
  }
  
  public void onInvalidated()
  {
    super.onInvalidated();
    if (a.a != null) {
      a.a.c();
    }
  }
}
