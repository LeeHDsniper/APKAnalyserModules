package com.tencent.mobileqq.activity.richmedia.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.ImageFormat;
import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import android.opengl.GLSurfaceView.Renderer;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Message;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import com.tencent.maxvideo.common.AVIOStruct;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoClipSpec;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraControl;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext.VFrameData;
import com.tencent.qphone.base.util.QLog;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.concurrent.atomic.AtomicInteger;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import mjx;
import mjy;

public class CameraGLSurfaceView
  extends GLSurfaceView
  implements GLSurfaceView.Renderer, Handler.Callback
{
  public static final int a = 0;
  private static final String jdField_a_of_type_JavaLangString = "CameraGLSurfaceView";
  private static FloatBuffer jdField_a_of_type_JavaNioFloatBuffer = ByteBuffer.allocateDirect(jdField_a_of_type_ArrayOfFloat.length * 4 + jdField_b_of_type_ArrayOfFloat.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
  public static final boolean a = true;
  private static final float[] jdField_a_of_type_ArrayOfFloat;
  public static final int b = 1;
  private static final String jdField_b_of_type_JavaLangString = "precision highp float;\nattribute vec4 position;\nattribute vec2 textureCoordinateIn;\nvarying   vec2 texturecoordinateOut;\nvoid main()\n{\ntexturecoordinateOut = textureCoordinateIn;\ngl_Position = position;\n}\n";
  private static final float[] jdField_b_of_type_ArrayOfFloat;
  public static final int c = -16716526;
  private static final String jdField_c_of_type_JavaLangString = "precision mediump float;varying   vec2 texturecoordinateOut;\nuniform sampler2D SamplerY;\nuniform sampler2D SamplerU;\nuniform sampler2D SamplerV;\nvoid main()\n{\nvec3 yuv;\nvec3 rgb;\nvec4 rgba;\nyuv.x = texture2D(SamplerY, texturecoordinateOut).r;\nyuv.y = texture2D(SamplerU, texturecoordinateOut).r-0.5;\nyuv.z = texture2D(SamplerV, texturecoordinateOut).r-0.5;\nrgb = mat3(      1,       1,      1,\n0, \t\t-.34414, 1.772,\n1.402, \t-.71414, 0) * yuv;\nrgba = vec4(rgb, 1);\ngl_FragColor = rgba;\n}\n";
  public static final int d = -16716525;
  private static final int jdField_e_of_type_Int = 2;
  private static final int jdField_f_of_type_Int = 4;
  private static final boolean jdField_g_of_type_Boolean = false;
  private static boolean jdField_h_of_type_Boolean = false;
  private static boolean jdField_i_of_type_Boolean = false;
  private static final int u = 0;
  private static final int v = 1;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private HandlerThread jdField_a_of_type_AndroidOsHandlerThread;
  private PreviewContext jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext = null;
  private ByteBuffer jdField_a_of_type_JavaNioByteBuffer = null;
  private AtomicInteger jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(0);
  private int[] jdField_a_of_type_ArrayOfInt = new int[3];
  private ByteBuffer jdField_b_of_type_JavaNioByteBuffer = null;
  private AtomicInteger jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(0);
  private boolean jdField_b_of_type_Boolean;
  private int[] jdField_b_of_type_ArrayOfInt = new int[1];
  private ByteBuffer jdField_c_of_type_JavaNioByteBuffer = null;
  private boolean jdField_c_of_type_Boolean;
  private boolean d;
  private volatile boolean jdField_e_of_type_Boolean;
  private boolean jdField_f_of_type_Boolean;
  private int jdField_g_of_type_Int;
  private int jdField_h_of_type_Int;
  private int jdField_i_of_type_Int;
  private int jdField_j_of_type_Int;
  private boolean jdField_j_of_type_Boolean;
  private int k;
  private int l;
  private int m;
  private int n;
  private int o;
  private int p;
  private int q;
  private int r;
  private int s;
  private int t = 270;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfFloat = new float[] { -1.0F, -1.0F, 1.0F, -1.0F, 1.0F, 1.0F, -1.0F, 1.0F };
    jdField_b_of_type_ArrayOfFloat = new float[] { 0.0F, 1.0F, 1.0F, 1.0F, 1.0F, 0.0F, 0.0F, 0.0F };
  }
  
  public CameraGLSurfaceView(Context paramContext)
  {
    super(paramContext);
    g = 0;
    f = false;
    b();
  }
  
  public CameraGLSurfaceView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    g = 0;
    f = false;
    b();
  }
  
  private int a()
  {
    if (jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.getAndAdd(0) != 0)
    {
      b("beginRenderFileCacheData: lost frame");
      return -1;
    }
    if (jdField_a_of_type_JavaNioByteBuffer != null)
    {
      jdField_a_of_type_JavaNioByteBuffer.position(0);
      jdField_b_of_type_JavaNioByteBuffer.position(0);
      jdField_c_of_type_JavaNioByteBuffer.position(0);
      return 0;
    }
    b("handleMessage:beginRenderFileCacheData:panelY=" + jdField_a_of_type_JavaNioByteBuffer);
    return -2;
  }
  
  private int a(byte[] paramArrayOfByte)
  {
    if (jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.getAndAdd(0) != 0)
    {
      b("byteBufferProcessFrame: lost frame");
      return -5;
    }
    int i1;
    try
    {
      i1 = b();
      if ((jdField_a_of_type_JavaNioByteBuffer == null) || ((paramArrayOfByte != null) && (paramArrayOfByte.length > i1) && (!f)))
      {
        jdField_a_of_type_JavaNioByteBuffer = null;
        jdField_b_of_type_JavaNioByteBuffer = null;
        jdField_c_of_type_JavaNioByteBuffer = null;
        a();
        f = true;
      }
      i1 = processVideoFrame(paramArrayOfByte, o, p, s, t, false, jdField_a_of_type_JavaNioByteBuffer, jdField_b_of_type_JavaNioByteBuffer, jdField_c_of_type_JavaNioByteBuffer, jdField_h_of_type_Boolean);
    }
    catch (UnsatisfiedLinkError paramArrayOfByte)
    {
      for (;;)
      {
        i1 = 0;
      }
      b("handleMessage:byteBufferProcessFrame:panelY=" + jdField_a_of_type_JavaNioByteBuffer);
    }
    if (jdField_a_of_type_JavaNioByteBuffer != null)
    {
      jdField_a_of_type_JavaNioByteBuffer.position(0);
      jdField_b_of_type_JavaNioByteBuffer.position(0);
      jdField_c_of_type_JavaNioByteBuffer.position(0);
      return i1;
    }
    return i1;
  }
  
  private void a()
  {
    int i1 = m * n;
    if ((jdField_a_of_type_JavaNioByteBuffer == null) || (jdField_a_of_type_JavaNioByteBuffer.capacity() < i1)) {
      jdField_a_of_type_JavaNioByteBuffer = mjy.a(0, i1);
    }
    i1 = 0 + i1;
    int i2 = m / 2 * (n / 2);
    if ((jdField_b_of_type_JavaNioByteBuffer == null) || (jdField_b_of_type_JavaNioByteBuffer.capacity() < i2)) {
      jdField_b_of_type_JavaNioByteBuffer = mjy.a(i1, i2);
    }
    if ((jdField_c_of_type_JavaNioByteBuffer == null) || (jdField_c_of_type_JavaNioByteBuffer.capacity() < i2)) {
      jdField_c_of_type_JavaNioByteBuffer = mjy.a(i1 + i2, i2);
    }
  }
  
  private static native ByteBuffer allocate(int paramInt1, int paramInt2);
  
  private int b()
  {
    return (int)(ImageFormat.getBitsPerPixel(s) * 1.0F / 8.0F * (o * p));
  }
  
  private void b()
  {
    setEGLContextClientVersion(2);
    super.setEGLConfigChooser(8, 8, 8, 8, 16, 0);
    setRenderer(this);
    setRenderMode(0);
    getHolder().setFormat(1);
    jdField_b_of_type_Boolean = true;
    jdField_c_of_type_Boolean = false;
    e = false;
    jdField_b_of_type_Boolean = true;
    jdField_j_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandlerThread = null;
    jdField_a_of_type_AndroidOsHandler = null;
  }
  
  private static void b(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("CameraGLSurfaceView", 2, paramString);
    }
  }
  
  private void c()
  {
    if (jdField_a_of_type_AndroidOsHandlerThread == null)
    {
      jdField_a_of_type_AndroidOsHandlerThread = new HandlerThread("glProcess");
      jdField_a_of_type_AndroidOsHandlerThread.start();
      jdField_a_of_type_AndroidOsHandler = new Handler(jdField_a_of_type_AndroidOsHandlerThread.getLooper(), this);
      if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null) {
        jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_a_of_type_AndroidOsHandler = jdField_a_of_type_AndroidOsHandler;
      }
      jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.set(0);
    }
  }
  
  private void d()
  {
    if (jdField_a_of_type_AndroidOsHandlerThread != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null) {
        jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_a_of_type_AndroidOsHandler = null;
      }
      jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
      jdField_a_of_type_AndroidOsHandlerThread.quit();
      jdField_a_of_type_AndroidOsHandlerThread = null;
      jdField_a_of_type_AndroidOsHandler = null;
    }
  }
  
  private void e()
  {
    g = 0;
    jdField_c_of_type_Boolean = false;
  }
  
  private void f()
  {
    GLES20.glGenTextures(jdField_a_of_type_ArrayOfInt.length, jdField_a_of_type_ArrayOfInt, 0);
    GLES20.glActiveTexture(33984);
    GLES20.glBindTexture(3553, jdField_a_of_type_ArrayOfInt[0]);
    GLES20.glTexParameteri(3553, 10240, 9729);
    GLES20.glTexParameteri(3553, 10241, 9729);
    GLES20.glTexParameteri(3553, 10242, 33071);
    GLES20.glTexParameteri(3553, 10243, 33071);
    GLES20.glPixelStorei(3317, 1);
    GLES20.glActiveTexture(33985);
    GLES20.glBindTexture(3553, jdField_a_of_type_ArrayOfInt[1]);
    GLES20.glTexParameteri(3553, 10240, 9729);
    GLES20.glTexParameteri(3553, 10241, 9729);
    GLES20.glTexParameteri(3553, 10242, 33071);
    GLES20.glTexParameteri(3553, 10243, 33071);
    GLES20.glPixelStorei(3317, 1);
    GLES20.glActiveTexture(33986);
    GLES20.glBindTexture(3553, jdField_a_of_type_ArrayOfInt[2]);
    GLES20.glTexParameteri(3553, 10240, 9729);
    GLES20.glTexParameteri(3553, 10241, 9729);
    GLES20.glTexParameteri(3553, 10242, 33071);
    GLES20.glTexParameteri(3553, 10243, 33071);
    GLES20.glPixelStorei(3317, 1);
  }
  
  private void g()
  {
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.set(1);
    GLES20.glActiveTexture(33984);
    if (!d) {
      GLES20.glTexImage2D(3553, 0, 6409, m, n, 0, 6409, 5121, null);
    }
    GLES20.glTexSubImage2D(3553, 0, 0, 0, m, n, 6409, 5121, jdField_a_of_type_JavaNioByteBuffer);
    GLES20.glUniform1i(jdField_h_of_type_Int, 0);
    GLES20.glActiveTexture(33985);
    if (!d) {
      GLES20.glTexImage2D(3553, 0, 6409, m / 2, n / 2, 0, 6409, 5121, null);
    }
    GLES20.glTexSubImage2D(3553, 0, 0, 0, m / 2, n / 2, 6409, 5121, jdField_b_of_type_JavaNioByteBuffer);
    GLES20.glUniform1i(jdField_i_of_type_Int, 1);
    GLES20.glActiveTexture(33986);
    if (!d)
    {
      GLES20.glTexImage2D(3553, 0, 6409, m / 2, n / 2, 0, 6409, 5121, null);
      d = true;
    }
    GLES20.glTexSubImage2D(3553, 0, 0, 0, m / 2, n / 2, 6409, 5121, jdField_c_of_type_JavaNioByteBuffer);
    GLES20.glUniform1i(jdField_j_of_type_Int, 2);
    GLES20.glDrawArrays(6, 0, 4);
    int i1 = GLES20.glGetError();
    if (i1 != 0) {
      b("glDrawFrame:err=" + i1);
    }
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicInteger.set(0);
  }
  
  private native int getBitmap(Bitmap paramBitmap, ByteBuffer paramByteBuffer1, ByteBuffer paramByteBuffer2, ByteBuffer paramByteBuffer3, int paramInt);
  
  private static native void initTotalBufferSize(int paramInt1, int paramInt2, int paramInt3);
  
  private native int processVideoFrame(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, ByteBuffer paramByteBuffer1, ByteBuffer paramByteBuffer2, ByteBuffer paramByteBuffer3, boolean paramBoolean2);
  
  private native int writeVideoFrame(int paramInt1, int paramInt2, AVIOStruct paramAVIOStruct);
  
  /* Error */
  public Bitmap a()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 187	com/tencent/mobileqq/activity/richmedia/view/CameraGLSurfaceView:m	I
    //   4: aload_0
    //   5: getfield 189	com/tencent/mobileqq/activity/richmedia/view/CameraGLSurfaceView:n	I
    //   8: getstatic 345	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   11: invokestatic 351	android/graphics/Bitmap:createBitmap	(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    //   14: astore_1
    //   15: aload_1
    //   16: astore_2
    //   17: aload_0
    //   18: aload_1
    //   19: aload_0
    //   20: getfield 106	com/tencent/mobileqq/activity/richmedia/view/CameraGLSurfaceView:jdField_a_of_type_JavaNioByteBuffer	Ljava/nio/ByteBuffer;
    //   23: aload_0
    //   24: getfield 108	com/tencent/mobileqq/activity/richmedia/view/CameraGLSurfaceView:jdField_b_of_type_JavaNioByteBuffer	Ljava/nio/ByteBuffer;
    //   27: aload_0
    //   28: getfield 110	com/tencent/mobileqq/activity/richmedia/view/CameraGLSurfaceView:jdField_c_of_type_JavaNioByteBuffer	Ljava/nio/ByteBuffer;
    //   31: aload_0
    //   32: getfield 187	com/tencent/mobileqq/activity/richmedia/view/CameraGLSurfaceView:m	I
    //   35: invokespecial 353	com/tencent/mobileqq/activity/richmedia/view/CameraGLSurfaceView:getBitmap	(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)I
    //   38: ifeq +15 -> 53
    //   41: aload_1
    //   42: astore_2
    //   43: aload_1
    //   44: ifnull +9 -> 53
    //   47: aload_1
    //   48: invokevirtual 356	android/graphics/Bitmap:recycle	()V
    //   51: aconst_null
    //   52: astore_2
    //   53: aload_2
    //   54: areturn
    //   55: astore_2
    //   56: aconst_null
    //   57: astore_1
    //   58: aload_2
    //   59: invokevirtual 359	java/lang/UnsatisfiedLinkError:printStackTrace	()V
    //   62: aload_1
    //   63: areturn
    //   64: astore_2
    //   65: aconst_null
    //   66: astore_1
    //   67: aload_2
    //   68: invokevirtual 360	java/lang/OutOfMemoryError:printStackTrace	()V
    //   71: aload_1
    //   72: areturn
    //   73: astore_2
    //   74: goto -7 -> 67
    //   77: astore_2
    //   78: goto -20 -> 58
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	81	0	this	CameraGLSurfaceView
    //   14	58	1	localBitmap1	Bitmap
    //   16	38	2	localBitmap2	Bitmap
    //   55	4	2	localUnsatisfiedLinkError1	UnsatisfiedLinkError
    //   64	4	2	localOutOfMemoryError1	OutOfMemoryError
    //   73	1	2	localOutOfMemoryError2	OutOfMemoryError
    //   77	1	2	localUnsatisfiedLinkError2	UnsatisfiedLinkError
    // Exception table:
    //   from	to	target	type
    //   0	15	55	java/lang/UnsatisfiedLinkError
    //   0	15	64	java/lang/OutOfMemoryError
    //   17	41	73	java/lang/OutOfMemoryError
    //   47	51	73	java/lang/OutOfMemoryError
    //   17	41	77	java/lang/UnsatisfiedLinkError
    //   47	51	77	java/lang/UnsatisfiedLinkError
  }
  
  public Handler a()
  {
    if ((jdField_a_of_type_AndroidOsHandlerThread != null) && (jdField_a_of_type_AndroidOsHandler != null)) {
      return jdField_a_of_type_AndroidOsHandler;
    }
    return null;
  }
  
  public void a(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < 2)) {
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.getAndSet(paramInt);
    }
  }
  
  public boolean a()
  {
    return jdField_h_of_type_Boolean;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    byte[] arrayOfByte = null;
    int i1;
    if (what == -16716526)
    {
      i1 = jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.get();
      if (i1 != 0) {
        b("handleMessage:[RenderModeCheck-Recorder][May Lost Frame] mode=" + i1);
      }
    }
    do
    {
      do
      {
        do
        {
          return true;
        } while (obj == null);
        if (arg1 == 0) {
          arrayOfByte = (byte[])obj;
        }
        for (;;)
        {
          i1 = a(arrayOfByte);
          if ((arg2 == 1) && (jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null)) {
            jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.a(arrayOfByte);
          }
          if (i1 == 0)
          {
            requestRender();
            if ((jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null) && (jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_b_of_type_Boolean)) {
              post(new mjx(this));
            }
            if (arg1 != 1) {
              break;
            }
          }
          try
          {
            paramMessage = obj).jdField_a_of_type_ComTencentMaxvideoCommonAVIOStruct;
            i1 = writeVideoFrame(m, n, paramMessage);
            b("handleMessage:writeVideoFrame  error=" + i1);
            return true;
            if (arg1 == 1)
            {
              arrayOfByte = obj).jdField_a_of_type_ArrayOfByte;
              continue;
              b("handleMessage:byteBufferProcessFrame  error=" + i1);
              return true;
            }
          }
          catch (UnsatisfiedLinkError paramMessage)
          {
            for (;;)
            {
              i1 = -15;
            }
          }
        }
      } while (what != -16716525);
      i1 = jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.get();
      if (i1 != 1)
      {
        b("handleMessage:[RenderModeCheck-Preview] mode=" + i1);
        return true;
      }
    } while (a() != 0);
    requestRender();
    return true;
  }
  
  public void onDrawFrame(GL10 paramGL10)
  {
    GLES20.glClear(16384);
    if ((e) && (jdField_b_of_type_Boolean) && (jdField_c_of_type_Boolean)) {
      g();
    }
  }
  
  public void onPause()
  {
    if (jdField_j_of_type_Boolean)
    {
      super.onPause();
      jdField_j_of_type_Boolean = false;
    }
  }
  
  public void onResume()
  {
    super.onResume();
    c();
    jdField_j_of_type_Boolean = true;
  }
  
  public void onSurfaceChanged(GL10 paramGL10, int paramInt1, int paramInt2)
  {
    GLES20.glViewport(0, 0, paramInt1, paramInt2);
  }
  
  public void onSurfaceCreated(GL10 paramGL10, EGLConfig paramEGLConfig)
  {
    GLES20.glClearColor(0.0F, 0.0F, 0.0F, 1.0F);
    g = CameraGLSurfaceView.GLVideoHelper.a();
    if (g == 0)
    {
      jdField_b_of_type_Boolean = false;
      b("GLVideoHelper.createShaderProgram: mGLProgram=" + g);
      return;
    }
    GLES20.glUseProgram(g);
    jdField_h_of_type_Int = GLES20.glGetUniformLocation(g, "SamplerY");
    jdField_i_of_type_Int = GLES20.glGetUniformLocation(g, "SamplerU");
    jdField_j_of_type_Int = GLES20.glGetUniformLocation(g, "SamplerV");
    k = GLES20.glGetAttribLocation(g, "position");
    l = GLES20.glGetAttribLocation(g, "textureCoordinateIn");
    jdField_a_of_type_JavaNioFloatBuffer.position(0);
    jdField_a_of_type_JavaNioFloatBuffer.put(jdField_a_of_type_ArrayOfFloat);
    jdField_a_of_type_JavaNioFloatBuffer.put(jdField_b_of_type_ArrayOfFloat);
    jdField_a_of_type_JavaNioFloatBuffer.position(0);
    GLES20.glGenBuffers(1, jdField_b_of_type_ArrayOfInt, 0);
    GLES20.glBindBuffer(34962, jdField_b_of_type_ArrayOfInt[0]);
    GLES20.glBufferData(34962, jdField_a_of_type_JavaNioFloatBuffer.capacity() * 4, jdField_a_of_type_JavaNioFloatBuffer, 35044);
    GLES20.glVertexAttribPointer(k, 2, 5126, false, 0, 0);
    GLES20.glEnableVertexAttribArray(k);
    GLES20.glVertexAttribPointer(l, 2, 5126, false, 0, jdField_a_of_type_ArrayOfFloat.length * 4);
    GLES20.glEnableVertexAttribArray(l);
    f();
    jdField_c_of_type_Boolean = true;
    d = false;
  }
  
  public void setPreviewSize(int paramInt1, int paramInt2, RMVideoClipSpec paramRMVideoClipSpec)
  {
    o = paramInt1;
    p = paramInt2;
    m = c;
    n = d;
    q = e;
    r = f;
    if (m % 2 != 0) {
      m -= 1;
    }
    if (n % 2 != 0) {
      n -= 1;
    }
    if (q % 2 != 0) {
      q -= 1;
    }
    if (r % 2 != 0) {
      r -= 1;
    }
    s = CameraControl.a().a();
    paramInt1 = CameraControl.a().b();
    if (paramInt1 <= 0) {
      t = 270;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("CameraGLSurfaceView", 2, "setPreviewSize:mVideoClipDegree=" + t);
      }
      jdField_i_of_type_Boolean = false;
      try
      {
        initTotalBufferSize(o, p, s);
        jdField_i_of_type_Boolean = true;
        a();
        f = false;
        e = true;
        return;
        t = paramInt1;
      }
      catch (UnsatisfiedLinkError paramRMVideoClipSpec)
      {
        for (;;)
        {
          jdField_i_of_type_Boolean = false;
        }
      }
    }
  }
  
  public void setVideoContext(PreviewContext paramPreviewContext)
  {
    jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext = paramPreviewContext;
    if (jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext != null)
    {
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_a_of_type_AndroidOsHandler = jdField_a_of_type_AndroidOsHandler;
      jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.jdField_c_of_type_Boolean = true;
    }
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    super.surfaceDestroyed(paramSurfaceHolder);
    e();
    d();
  }
}
