import com.tencent.mobileqq.activity.richmedia.view.CameraGLSurfaceView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.nio.ByteBuffer;

public class mjy
{
  private mjy()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static ByteBuffer a(int paramInt1, int paramInt2)
  {
    try
    {
      if (CameraGLSurfaceView.b())
      {
        ByteBuffer localByteBuffer1 = CameraGLSurfaceView.a(paramInt1, paramInt2);
        CameraGLSurfaceView.a(true);
        ByteBuffer localByteBuffer2 = localByteBuffer1;
        if (localByteBuffer1 == null)
        {
          localByteBuffer2 = ByteBuffer.allocateDirect(paramInt2);
          CameraGLSurfaceView.a(false);
        }
        return localByteBuffer2;
      }
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
    {
      for (;;)
      {
        Object localObject = null;
        continue;
        localObject = null;
      }
    }
  }
}
