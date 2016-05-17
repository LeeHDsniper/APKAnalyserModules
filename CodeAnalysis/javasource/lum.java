import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.AsyncTask;
import android.view.View;
import com.tencent.mobileqq.activity.fling.ScreenCapture;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.ref.WeakReference;

public class lum
  extends AsyncTask
{
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private WeakReference jdField_a_of_type_JavaLangRefWeakReference;
  
  public lum(View paramView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (paramView != null)
    {
      Context localContext = paramView.getContext();
      jdField_a_of_type_JavaLangRefWeakReference = new WeakReference(paramView);
      paramView.setDrawingCacheEnabled(true);
      jdField_a_of_type_AndroidGraphicsBitmap = paramView.getDrawingCache();
      ScreenCapture.setSnapFile(localContext, false);
    }
  }
  
  protected Boolean a(String... paramVarArgs)
  {
    Boolean localBoolean = Boolean.FALSE;
    if (isCancelled()) {}
    while ((jdField_a_of_type_JavaLangRefWeakReference.get() == null) || (jdField_a_of_type_AndroidGraphicsBitmap == null) || (jdField_a_of_type_AndroidGraphicsBitmap.isRecycled())) {
      return localBoolean;
    }
    Bitmap localBitmap = jdField_a_of_type_AndroidGraphicsBitmap;
    paramVarArgs = new File(paramVarArgs[0]);
    File localFile = paramVarArgs.getParentFile();
    if (!localFile.exists()) {
      localFile.mkdirs();
    }
    try
    {
      paramVarArgs = new FileOutputStream(paramVarArgs);
      localBitmap.compress(Bitmap.CompressFormat.JPEG, 90, paramVarArgs);
      paramVarArgs.flush();
      paramVarArgs.close();
      paramVarArgs = Boolean.TRUE;
      return paramVarArgs;
    }
    catch (IOException paramVarArgs)
    {
      paramVarArgs.printStackTrace();
    }
    return localBoolean;
  }
  
  protected void a(Boolean paramBoolean)
  {
    if (jdField_a_of_type_JavaLangRefWeakReference != null)
    {
      View localView = (View)jdField_a_of_type_JavaLangRefWeakReference.get();
      if (localView != null)
      {
        if (paramBoolean.booleanValue()) {
          ScreenCapture.setSnapFile(localView.getContext(), true);
        }
        jdField_a_of_type_AndroidGraphicsBitmap = null;
        localView.setDrawingCacheEnabled(false);
        localView.destroyDrawingCache();
      }
    }
  }
  
  protected void onCancelled() {}
}
