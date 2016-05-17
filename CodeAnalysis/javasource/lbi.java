import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.SoftReference;

public class lbi
{
  public String a;
  SoftReference a;
  SoftReference b;
  
  public lbi(String paramString, View paramView, ViewGroup paramViewGroup)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_JavaLangRefSoftReference = new SoftReference(paramView);
    b = new SoftReference(paramViewGroup);
  }
  
  public View a()
  {
    return (View)jdField_a_of_type_JavaLangRefSoftReference.get();
  }
  
  public ViewGroup a()
  {
    return (ViewGroup)b.get();
  }
  
  public void a(ViewGroup paramViewGroup)
  {
    b = new SoftReference(paramViewGroup);
  }
}
