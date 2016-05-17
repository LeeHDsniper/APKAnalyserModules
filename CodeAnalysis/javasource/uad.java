import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class uad
{
  private int a;
  
  private uad(AbsListView paramAbsListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    a = AbsListView.a(b);
  }
  
  public boolean a()
  {
    return (b.hasWindowFocus()) && (AbsListView.b(b) == a);
  }
}
