import android.view.View;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class kqg
{
  WeakReference jdField_a_of_type_JavaLangRefWeakReference;
  public WeakReference b;
  
  public kqg(FileTransferManager paramFileTransferManager, View paramView, FileTransferManager.Callback paramCallback)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangRefWeakReference = new WeakReference(paramView);
    b = new WeakReference(paramCallback);
  }
  
  public View a()
  {
    return (View)jdField_a_of_type_JavaLangRefWeakReference.get();
  }
  
  public FileTransferManager.Callback a()
  {
    return (FileTransferManager.Callback)b.get();
  }
}
