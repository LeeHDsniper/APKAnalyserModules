package com.tencent.mobileqq.activity.aio.photo;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Looper;
import android.os.MessageQueue;
import android.os.MessageQueue.IdleHandler;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.biz.qrcode.activity.ScannerActivity;
import com.tencent.common.galleryactivity.AbstractGalleryPageView;
import com.tencent.common.galleryactivity.AbstractGalleryScene;
import com.tencent.common.galleryactivity.AbstractImageAdapter;
import com.tencent.common.galleryactivity.AbstractImageListModel;
import com.tencent.common.galleryactivity.GalleryPageView;
import com.tencent.device.msg.activities.AIODevLittleVideoData;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.activity.photo.ProGallery;
import com.tencent.mobileqq.activity.photo.ProGallery.OnProGalleryListener;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.app.PeakAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicReporter;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.AdapterView;
import com.tencent.widget.Gallery;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import lda;
import ldb;
import ldd;
import lde;
import ldf;
import ldg;
import ldh;
import ldk;
import ldm;
import ldo;
import ldp;
import mqq.os.MqqHandler;

public class AIOGalleryScene
  extends AbstractGalleryScene
{
  public static final int a = 0;
  public static final String a = "AIOGalleryScene";
  public static final String b = "NeedReportForwardShortVideo";
  public static final int c = 1;
  public static final int d = 2;
  public static final int e = 3;
  static final int j = 0;
  static final int n = 250;
  static final int o = 1024;
  MessageQueue.IdleHandler jdField_a_of_type_AndroidOsMessageQueue$IdleHandler;
  View jdField_a_of_type_AndroidViewView;
  Button jdField_a_of_type_AndroidWidgetButton;
  ImageButton jdField_a_of_type_AndroidWidgetImageButton;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  ProgressBar jdField_a_of_type_AndroidWidgetProgressBar;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  public AIOGalleryAdapter a;
  public AIOImageListModel a;
  public IAIOImageProvider a;
  public ldp a;
  public final MqqHandler a;
  boolean jdField_a_of_type_Boolean;
  ImageButton jdField_b_of_type_AndroidWidgetImageButton;
  boolean jdField_b_of_type_Boolean;
  public String c;
  boolean c;
  public String d;
  public boolean d;
  public String e;
  boolean e;
  final int f;
  public String f;
  int jdField_g_of_type_Int;
  public String g;
  boolean jdField_g_of_type_Boolean;
  final int jdField_h_of_type_Int;
  boolean jdField_h_of_type_Boolean;
  int jdField_i_of_type_Int;
  boolean jdField_i_of_type_Boolean;
  public int k;
  public int l;
  public int m;
  
  public AIOGalleryScene(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel, IAIOImageProvider paramIAIOImageProvider, String paramString)
  {
    super(paramActivity, paramAbstractImageListModel);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_f_of_type_Int = 62215;
    jdField_h_of_type_Int = Integer.MIN_VALUE;
    jdField_d_of_type_Boolean = false;
    jdField_e_of_type_Boolean = false;
    k = 1;
    jdField_g_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsMessageQueue$IdleHandler = new ldf(this);
    jdField_a_of_type_MqqOsMqqHandler = new ldh(this);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel = ((AIOImageListModel)paramAbstractImageListModel);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider = paramIAIOImageProvider;
    jdField_c_of_type_JavaLangString = paramString;
    if ((paramString == null) && (PeakActivity.class.isInstance(paramActivity))) {
      jdField_c_of_type_JavaLangString = a.a();
    }
  }
  
  protected RelativeLayout a()
  {
    return (RelativeLayout)LayoutInflater.from(jdField_a_of_type_AndroidAppActivity).inflate(2130904220, null);
  }
  
  protected AbstractGalleryPageView a(Context paramContext)
  {
    paramContext = new GalleryPageView();
    jdField_a_of_type_Int = 25;
    return paramContext;
  }
  
  protected AbstractImageAdapter a(Context paramContext)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter = new AIOGalleryAdapter(paramContext, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a = new ldb(this);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel);
    return jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter;
  }
  
  /* Error */
  public Boolean a(File paramFile)
  {
    // Byte code:
    //   0: iconst_2
    //   1: iconst_0
    //   2: ldc -62
    //   4: ldc -60
    //   6: invokestatic 202	com/tencent/qbar/QbarNative:Init	(IILjava/lang/String;Ljava/lang/String;)I
    //   9: pop
    //   10: iconst_2
    //   11: newarray int
    //   13: astore 5
    //   15: aload 5
    //   17: iconst_0
    //   18: iconst_2
    //   19: iastore
    //   20: aload 5
    //   22: iconst_1
    //   23: iconst_0
    //   24: iastore
    //   25: aload 5
    //   27: aload 5
    //   29: arraylength
    //   30: invokestatic 206	com/tencent/qbar/QbarNative:SetReaders	([II)I
    //   33: pop
    //   34: new 208	java/lang/StringBuilder
    //   37: dup
    //   38: invokespecial 209	java/lang/StringBuilder:<init>	()V
    //   41: ldc -45
    //   43: invokevirtual 215	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: aload_1
    //   47: invokevirtual 220	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   50: invokevirtual 215	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   56: invokestatic 229	android/net/Uri:parse	(Ljava/lang/String;)Landroid/net/Uri;
    //   59: astore 6
    //   61: iconst_m1
    //   62: istore_3
    //   63: aload_0
    //   64: getfield 115	com/tencent/mobileqq/activity/aio/photo/AIOGalleryScene:jdField_a_of_type_AndroidAppActivity	Landroid/app/Activity;
    //   67: invokevirtual 235	android/app/Activity:getContentResolver	()Landroid/content/ContentResolver;
    //   70: astore_1
    //   71: new 237	android/graphics/BitmapFactory$Options
    //   74: dup
    //   75: invokespecial 238	android/graphics/BitmapFactory$Options:<init>	()V
    //   78: astore 7
    //   80: aload 7
    //   82: iconst_1
    //   83: putfield 241	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   86: aload_1
    //   87: aload 6
    //   89: invokevirtual 247	android/content/ContentResolver:openInputStream	(Landroid/net/Uri;)Ljava/io/InputStream;
    //   92: astore 5
    //   94: aload 5
    //   96: aconst_null
    //   97: aload 7
    //   99: invokestatic 253	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   102: pop
    //   103: aload 5
    //   105: invokevirtual 258	java/io/InputStream:close	()V
    //   108: aload 7
    //   110: getfield 261	android/graphics/BitmapFactory$Options:outWidth	I
    //   113: istore_2
    //   114: aload 7
    //   116: getfield 264	android/graphics/BitmapFactory$Options:outHeight	I
    //   119: istore 4
    //   121: aload 7
    //   123: iconst_0
    //   124: putfield 241	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   127: iload_2
    //   128: iload 4
    //   130: imul
    //   131: ldc_w 265
    //   134: if_icmple +158 -> 292
    //   137: aload 7
    //   139: iload_2
    //   140: iload 4
    //   142: imul
    //   143: i2d
    //   144: invokestatic 271	java/lang/Math:sqrt	(D)D
    //   147: ldc2_w 272
    //   150: ddiv
    //   151: invokestatic 276	java/lang/Math:ceil	(D)D
    //   154: d2i
    //   155: putfield 279	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   158: aload_1
    //   159: aload 6
    //   161: invokevirtual 247	android/content/ContentResolver:openInputStream	(Landroid/net/Uri;)Ljava/io/InputStream;
    //   164: astore_1
    //   165: aload_1
    //   166: aconst_null
    //   167: aload 7
    //   169: invokestatic 253	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   172: astore 7
    //   174: aload_1
    //   175: invokevirtual 258	java/io/InputStream:close	()V
    //   178: aload 7
    //   180: invokevirtual 285	android/graphics/Bitmap:getWidth	()I
    //   183: istore_2
    //   184: aload 7
    //   186: invokevirtual 288	android/graphics/Bitmap:getHeight	()I
    //   189: istore 4
    //   191: iload_2
    //   192: iload 4
    //   194: imul
    //   195: newarray int
    //   197: astore 5
    //   199: aload 7
    //   201: aload 5
    //   203: iconst_0
    //   204: iload_2
    //   205: iconst_0
    //   206: iconst_0
    //   207: iload_2
    //   208: iload 4
    //   210: invokevirtual 292	android/graphics/Bitmap:getPixels	([IIIIIII)V
    //   213: aload 7
    //   215: invokevirtual 295	android/graphics/Bitmap:recycle	()V
    //   218: iload_2
    //   219: iload 4
    //   221: imul
    //   222: newarray byte
    //   224: astore 7
    //   226: aload 5
    //   228: aload 7
    //   230: iload_2
    //   231: iload 4
    //   233: invokestatic 300	com/tencent/imageboost/ImgProcessScan:b	([I[BII)I
    //   236: pop
    //   237: aload 7
    //   239: iload_2
    //   240: iload 4
    //   242: iconst_0
    //   243: invokestatic 304	com/tencent/qbar/QbarNative:ScanImage	([BIII)I
    //   246: istore_2
    //   247: invokestatic 307	com/tencent/qbar/QbarNative:Release	()I
    //   250: pop
    //   251: iload_2
    //   252: iconst_1
    //   253: if_icmpne +133 -> 386
    //   256: aload_0
    //   257: aload 6
    //   259: invokevirtual 310	android/net/Uri:getPath	()Ljava/lang/String;
    //   262: putfield 312	com/tencent/mobileqq/activity/aio/photo/AIOGalleryScene:jdField_f_of_type_JavaLangString	Ljava/lang/String;
    //   265: iconst_1
    //   266: invokestatic 318	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   269: areturn
    //   270: astore_1
    //   271: invokestatic 324	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   274: ifeq +13 -> 287
    //   277: ldc 10
    //   279: iconst_2
    //   280: aload_1
    //   281: invokevirtual 325	java/lang/UnsatisfiedLinkError:toString	()Ljava/lang/String;
    //   284: invokestatic 328	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   287: iconst_0
    //   288: invokestatic 318	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   291: areturn
    //   292: aload 7
    //   294: iconst_1
    //   295: putfield 279	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   298: goto -140 -> 158
    //   301: astore_1
    //   302: iload_3
    //   303: istore_2
    //   304: invokestatic 324	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   307: ifeq -60 -> 247
    //   310: ldc 10
    //   312: iconst_2
    //   313: aload_1
    //   314: invokevirtual 329	java/io/IOException:toString	()Ljava/lang/String;
    //   317: invokestatic 328	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   320: iload_3
    //   321: istore_2
    //   322: goto -75 -> 247
    //   325: astore_1
    //   326: aload 5
    //   328: astore_1
    //   329: aload_1
    //   330: invokevirtual 258	java/io/InputStream:close	()V
    //   333: iconst_m1
    //   334: istore_2
    //   335: goto -88 -> 247
    //   338: astore_1
    //   339: iload_3
    //   340: istore_2
    //   341: invokestatic 324	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   344: ifeq -97 -> 247
    //   347: ldc 10
    //   349: iconst_2
    //   350: aload_1
    //   351: invokevirtual 330	java/lang/RuntimeException:toString	()Ljava/lang/String;
    //   354: invokestatic 328	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   357: iload_3
    //   358: istore_2
    //   359: goto -112 -> 247
    //   362: astore_1
    //   363: iload_3
    //   364: istore_2
    //   365: invokestatic 324	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   368: ifeq -121 -> 247
    //   371: ldc 10
    //   373: iconst_2
    //   374: aload_1
    //   375: invokevirtual 325	java/lang/UnsatisfiedLinkError:toString	()Ljava/lang/String;
    //   378: invokestatic 328	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   381: iload_3
    //   382: istore_2
    //   383: goto -136 -> 247
    //   386: iconst_0
    //   387: invokestatic 318	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   390: areturn
    //   391: astore 5
    //   393: goto -64 -> 329
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	396	0	this	AIOGalleryScene
    //   0	396	1	paramFile	File
    //   113	270	2	i1	int
    //   62	320	3	i2	int
    //   119	122	4	i3	int
    //   13	314	5	localObject1	Object
    //   391	1	5	localOutOfMemoryError	OutOfMemoryError
    //   59	199	6	localUri	android.net.Uri
    //   78	215	7	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   0	15	270	java/lang/UnsatisfiedLinkError
    //   25	34	270	java/lang/UnsatisfiedLinkError
    //   63	127	301	java/io/IOException
    //   137	158	301	java/io/IOException
    //   158	165	301	java/io/IOException
    //   165	247	301	java/io/IOException
    //   292	298	301	java/io/IOException
    //   329	333	301	java/io/IOException
    //   158	165	325	java/lang/OutOfMemoryError
    //   63	127	338	java/lang/RuntimeException
    //   137	158	338	java/lang/RuntimeException
    //   158	165	338	java/lang/RuntimeException
    //   165	247	338	java/lang/RuntimeException
    //   292	298	338	java/lang/RuntimeException
    //   329	333	338	java/lang/RuntimeException
    //   63	127	362	java/lang/UnsatisfiedLinkError
    //   137	158	362	java/lang/UnsatisfiedLinkError
    //   158	165	362	java/lang/UnsatisfiedLinkError
    //   165	247	362	java/lang/UnsatisfiedLinkError
    //   292	298	362	java/lang/UnsatisfiedLinkError
    //   329	333	362	java/lang/UnsatisfiedLinkError
    //   165	247	391	java/lang/OutOfMemoryError
  }
  
  public void a()
  {
    Bundle localBundle = jdField_a_of_type_AndroidAppActivity.getIntent().getExtras();
    AIORichMediaInfo localAIORichMediaInfo = new AIORichMediaInfo((AIORichMediaData)localBundle.getParcelable("extra.EXTRA_CURRENT_IMAGE"));
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a(localAIORichMediaInfo);
    jdField_b_of_type_AndroidGraphicsRect = ((Rect)localBundle.getParcelable("KEY_THUMBNAL_BOUND"));
    jdField_g_of_type_Boolean = localBundle.getBoolean("IS_APP_SHARE_PIC", false);
    jdField_g_of_type_Int = localBundle.getInt("extra.AIO_CURRENT_PANEL_STATE", 62215);
    jdField_i_of_type_Int = localBundle.getInt("extra.MOBILE_QQ_PROCESS_ID", Integer.MIN_VALUE);
    jdField_d_of_type_Boolean = localBundle.getBoolean("extra.CAN_FORWARD_TO_GROUP_ALBUM", false);
    if (jdField_d_of_type_Boolean)
    {
      jdField_d_of_type_JavaLangString = localBundle.getString("extra.GROUP_UIN");
      jdField_e_of_type_JavaLangString = localBundle.getString("extra.GROUP_CODE");
      if (((jdField_d_of_type_JavaLangString == null) || (jdField_e_of_type_JavaLangString == null) || (jdField_c_of_type_JavaLangString == null)) && (QLog.isColorLevel())) {
        QLog.i("AIOGalleryScene", 2, "mGroupUin=" + jdField_d_of_type_JavaLangString + ", mGroupCode=" + jdField_e_of_type_JavaLangString + ", mMyUin=" + jdField_c_of_type_JavaLangString);
      }
    }
    k = localBundle.getInt("extra.EXTRA_FORWARD_TO_QZONE_SRC");
    jdField_c_of_type_Boolean = localBundle.getBoolean("extra.IS_FROM_MULTI_MSG");
    l = localBundle.getInt("forward_source_uin_type", -1);
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
    if ((paramInt2 == -1) && (paramInt1 == 0)) {
      a(paramIntent.getExtras());
    }
  }
  
  public void a(long paramLong1, int paramInt1, int paramInt2, int paramInt3, long paramLong2, boolean paramBoolean)
  {
    Object localObject1;
    Object localObject2;
    if (paramInt2 == 2)
    {
      localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a();
      paramInt2 = 0;
      if (paramInt2 < ((List)localObject1).size())
      {
        localObject2 = (AIORichMediaInfo)((List)localObject1).get(paramInt2);
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.e != paramLong1) || (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.jdField_i_of_type_Int != paramInt1)) {
          break label156;
        }
        jdField_a_of_type_Int = paramInt3;
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.b(paramInt2, paramInt3 / 100);
        if (paramBoolean)
        {
          paramInt1 = jdField_a_of_type_ComTencentWidgetGallery.s();
          paramInt3 = jdField_a_of_type_ComTencentWidgetGallery.getChildCount();
          if ((paramInt2 >= paramInt1) && (paramInt2 <= paramInt3 + paramInt1 - 1))
          {
            localObject1 = jdField_a_of_type_ComTencentWidgetGallery.getChildAt(paramInt2 - paramInt1);
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(paramInt2, (View)localObject1, paramBoolean);
          }
        }
      }
    }
    for (;;)
    {
      return;
      label156:
      paramInt2 += 1;
      break;
      if (paramInt2 == 4)
      {
        if ((jdField_a_of_type_Ldp != null) && (jdField_a_of_type_Ldp.jdField_a_of_type_Long == paramLong1) && (jdField_a_of_type_Ldp.jdField_a_of_type_Int == paramInt1) && (jdField_a_of_type_AndroidWidgetProgressBar != null) && (jdField_a_of_type_AndroidWidgetTextView != null))
        {
          if ((jdField_a_of_type_AndroidWidgetProgressBar.getVisibility() != 0) || (jdField_a_of_type_AndroidWidgetTextView.getVisibility() != 0))
          {
            jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
            jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
          }
          jdField_a_of_type_AndroidWidgetProgressBar.setProgress(paramInt3);
          if (paramLong2 > 0L)
          {
            localObject1 = PhotoUtils.a(jdField_a_of_type_AndroidAppActivity, (float)paramLong2);
            localObject2 = PhotoUtils.a(jdField_a_of_type_AndroidAppActivity, (float)(paramInt3 * paramLong2) / 10000.0F);
            localObject1 = (String)localObject2 + "/" + (String)localObject1;
            jdField_a_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
            return;
          }
          jdField_a_of_type_AndroidWidgetTextView.setText(paramInt3 / 100 + "%");
        }
      }
      else if (paramInt2 == 1)
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a();
        paramInt1 = 0;
        while (paramInt1 < ((List)localObject1).size())
        {
          localObject2 = (AIORichMediaInfo)((List)localObject1).get(paramInt1);
          if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.e == paramLong1)
          {
            jdField_a_of_type_Int = paramInt3;
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.b(paramInt1, paramInt3 / 100);
            return;
          }
          paramInt1 += 1;
        }
      }
    }
  }
  
  public void a(long paramLong, int paramInt1, int paramInt2, int paramInt3, String paramString, boolean paramBoolean)
  {
    if (paramInt2 == 2)
    {
      localAIOImageListModel = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel;
      if (paramInt3 == 1)
      {
        paramInt1 = localAIOImageListModel.a(paramLong, paramInt1, paramInt2, paramString);
        paramInt2 = jdField_a_of_type_ComTencentWidgetGallery.s();
        paramInt3 = jdField_a_of_type_ComTencentWidgetGallery.getChildCount();
        if ((paramInt1 >= paramInt2) && (paramInt1 <= paramInt3 + paramInt2 - 1))
        {
          paramString = jdField_a_of_type_ComTencentWidgetGallery.getChildAt(paramInt1 - paramInt2);
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.b(paramInt1, paramString, paramBoolean);
        }
        if (QLog.isDevelopLevel()) {
          QLog.d("AIOGalleryScene", 4, "notifyImageResult(): Gallery position is " + paramInt1);
        }
      }
    }
    label334:
    do
    {
      return;
      paramString = "I:E";
      break;
      if ((paramInt2 == 4) && (jdField_a_of_type_Ldp != null) && (jdField_a_of_type_Ldp.jdField_a_of_type_Long == paramLong) && (jdField_a_of_type_Ldp.jdField_a_of_type_Int == paramInt1))
      {
        localAIOImageListModel = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel;
        if (paramInt3 == 1)
        {
          localAIOImageListModel.a(paramLong, paramInt1, paramInt2, paramString);
          if (paramInt3 != 1) {
            break label334;
          }
          paramString = URLDrawable.URLDrawableOptions.obtain();
          mUseExifOrientation = false;
          paramString = URLDrawable.getDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a().jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(4), paramString);
          switch (paramString.getStatus())
          {
          }
        }
        for (;;)
        {
          paramString.setTag(Integer.valueOf(1));
          paramString.setURLDrawableListener(jdField_a_of_type_Ldp);
          paramString.startDownload();
          jdField_a_of_type_Ldp.jdField_a_of_type_ComTencentImageURLDrawable = paramString;
          return;
          paramString = "I:E";
          break;
          jdField_a_of_type_Ldp.onLoadSuccessed(paramString);
          return;
          jdField_a_of_type_Ldp.onLoadFialed(paramString, null);
          return;
          jdField_a_of_type_Ldp.onLoadCanceled(paramString);
        }
        QQToast.a(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_AndroidAppActivity.getString(2131369974), 0).a();
        c(true);
        a(false);
        jdField_a_of_type_Ldp = null;
        return;
      }
    } while ((paramInt2 != 1) && (paramInt2 != 0));
    AIOImageListModel localAIOImageListModel = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel;
    if (paramInt3 == 1) {}
    for (;;)
    {
      paramInt1 = localAIOImageListModel.a(paramLong, paramInt1, paramInt2, paramString);
      paramInt2 = jdField_a_of_type_ComTencentWidgetGallery.s();
      paramInt3 = jdField_a_of_type_ComTencentWidgetGallery.getChildCount();
      if ((paramInt1 >= paramInt2) && (paramInt1 <= paramInt3 + paramInt2 - 1))
      {
        paramString = jdField_a_of_type_ComTencentWidgetGallery.getChildAt(paramInt1 - paramInt2);
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.b(paramInt1, paramString, paramBoolean);
      }
      if (!QLog.isDevelopLevel()) {
        break;
      }
      QLog.d("AIOGalleryScene", 4, "notifyImageResult(): Gallery position is " + paramInt1);
      return;
      paramString = "I:E";
    }
  }
  
  public void a(Configuration paramConfiguration)
  {
    super.a(paramConfiguration);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(paramConfiguration);
  }
  
  void a(Bundle paramBundle)
  {
    Intent localIntent = AIOUtils.a(new Intent(jdField_a_of_type_AndroidAppActivity, SplashActivity.class), null);
    paramBundle = new Bundle(paramBundle);
    paramBundle.putBoolean("PhotoConst.HANDLE_DEST_RESULT", false);
    paramBundle.putBoolean("PhotoConst.IS_FORWARD", true);
    paramBundle.putInt("PhotoConst.SEND_BUSINESS_TYPE", 1031);
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SendPhotoActivity.class.getName());
    localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    localIntent.putExtra("extra_image_sender_tag", "sessionInfo.aioAlbum");
    paramBundle.putBoolean("PicContants.NEED_COMPRESS", false);
    localIntent.putExtras(paramBundle);
    String str = paramBundle.getString("GALLERY.FORWORD_LOCAL_PATH");
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(str);
    int i1 = paramBundle.getInt("PhotoConst.SEND_SIZE_SPEC", 0);
    if (l == 9501)
    {
      jdField_a_of_type_AndroidAppActivity.finish();
      return;
    }
    PhotoUtils.a(jdField_a_of_type_AndroidAppActivity, localIntent, localArrayList, i1, false);
  }
  
  public void a(View paramView, int paramInt1, int paramInt2)
  {
    int i1 = 1;
    if (paramView == null) {}
    do
    {
      return;
      paramView = (URLDrawable)((ImageView)paramView).getDrawable();
    } while (paramView.getStatus() != 1);
    switch (paramInt2)
    {
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a(paramInt1).jdField_b_of_type_Int = i1;
      paramView = new File(paramView.getURL().getFile());
      if (!paramView.exists()) {
        break;
      }
      new ldg(this, paramView, paramInt2).execute(new Void[0]);
      return;
      i1 = 3;
      continue;
      i1 = 8;
      continue;
      i1 = 6;
    }
  }
  
  public void a(ViewGroup paramViewGroup)
  {
    super.a(paramViewGroup);
    paramViewGroup = (RelativeLayout)a();
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams.addRule(12, -1);
    localLayoutParams.addRule(9, -1);
    bottomMargin = ((int)TypedValue.applyDimension(1, 13.0F, jdField_a_of_type_AndroidAppActivity.getResources().getDisplayMetrics()));
    leftMargin = ((int)TypedValue.applyDimension(1, 14.0F, jdField_a_of_type_AndroidAppActivity.getResources().getDisplayMetrics()));
    jdField_a_of_type_AndroidWidgetImageButton = new ImageButton(jdField_a_of_type_AndroidAppActivity);
    jdField_a_of_type_AndroidWidgetImageButton.setImageResource(2130840738);
    jdField_a_of_type_AndroidWidgetImageButton.setBackgroundDrawable(null);
    jdField_a_of_type_AndroidWidgetImageButton.setContentDescription(jdField_a_of_type_AndroidAppActivity.getString(2131369967));
    paramViewGroup.addView(jdField_a_of_type_AndroidWidgetImageButton, localLayoutParams);
    jdField_a_of_type_AndroidWidgetImageButton.setVisibility(4);
    jdField_b_of_type_AndroidWidgetImageButton = new ImageButton(jdField_a_of_type_AndroidAppActivity);
    jdField_b_of_type_AndroidWidgetImageButton.setImageResource(2130837561);
    jdField_b_of_type_AndroidWidgetImageButton.setBackgroundDrawable(null);
    localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams.addRule(12, -1);
    localLayoutParams.addRule(11, -1);
    bottomMargin = ((int)TypedValue.applyDimension(1, 13.0F, jdField_a_of_type_AndroidAppActivity.getResources().getDisplayMetrics()));
    rightMargin = ((int)TypedValue.applyDimension(1, 18.0F, jdField_a_of_type_AndroidAppActivity.getResources().getDisplayMetrics()));
    if (!((AIORichMediaData)jdField_a_of_type_AndroidAppActivity.getIntent().getExtras().getParcelable("extra.EXTRA_CURRENT_IMAGE") instanceof AIODevLittleVideoData)) {
      paramViewGroup.addView(jdField_b_of_type_AndroidWidgetImageButton, localLayoutParams);
    }
    jdField_b_of_type_AndroidWidgetImageButton.setOnClickListener(new lda(this));
    localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    jdField_a_of_type_AndroidViewView = LayoutInflater.from(jdField_a_of_type_AndroidAppActivity).inflate(2130904223, null);
    paramViewGroup.addView(jdField_a_of_type_AndroidViewView, localLayoutParams);
    jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)jdField_a_of_type_AndroidViewView.findViewById(2131297372));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131301849));
    jdField_a_of_type_AndroidViewView.setVisibility(4);
    jdField_a_of_type_AndroidViewView.setOnClickListener(new ldd(this));
    jdField_a_of_type_AndroidWidgetImageButton.setOnClickListener(new lde(this));
    if ((ProGallery.OnProGalleryListener.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter)) && (ProGallery.class.isInstance(jdField_a_of_type_ComTencentWidgetGallery))) {
      ((ProGallery)jdField_a_of_type_ComTencentWidgetGallery).setOnNoBlankListener(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter);
    }
  }
  
  public void a(AIORichMediaInfo paramAIORichMediaInfo)
  {
    if (!AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
      return;
    }
    AIOImageData localAIOImageData = (AIOImageData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
    File localFile = localAIOImageData.a(4);
    if (localFile == null) {
      localFile = localAIOImageData.a(2);
    }
    for (int i1 = 0;; i1 = 1)
    {
      Bundle localBundle = new Bundle();
      localBundle.putInt("forward_type", 1);
      localBundle.putBoolean("forward_urldrawable", true);
      localBundle.putString("forward_urldrawable_thumb_url", localAIOImageData.a(1));
      paramAIORichMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
      if (i1 != 0) {}
      for (int i2 = 4;; i2 = 2)
      {
        localBundle.putString("forward_urldrawable_big_url", paramAIORichMediaInfo.a(i2));
        try
        {
          localBundle.putString("GALLERY.FORWORD_LOCAL_PATH", localFile.getAbsolutePath());
          localBundle.putInt("forward_source_uin_type", jdField_a_of_type_AndroidAppActivity.getIntent().getIntExtra("forward_source_uin_type", -1));
          if (i1 != 0) {
            localBundle.putInt("PhotoConst.SEND_SIZE_SPEC", 2);
          }
          localBundle.putParcelable("FORWARD_MSG_FOR_PIC", localAIOImageData);
          paramAIORichMediaInfo = new Intent();
          paramAIORichMediaInfo.putExtras(localBundle);
          ForwardBaseOption.a(jdField_a_of_type_AndroidAppActivity, paramAIORichMediaInfo, 0);
          return;
        }
        catch (NullPointerException paramAIORichMediaInfo) {}
      }
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("AIOGalleryScene", 2, "showFriendPickerForForward ,NullPointerException: " + paramAIORichMediaInfo);
      return;
    }
  }
  
  public void a(String paramString)
  {
    Intent localIntent = new Intent(jdField_a_of_type_AndroidAppActivity, ScannerActivity.class);
    localIntent.putExtra("PhotoConst.SINGLE_PHOTO_PATH", paramString);
    localIntent.putExtra("QRDecode", true);
    localIntent.putExtra("QRDecodeResult", paramString);
    jdField_a_of_type_AndroidAppActivity.startActivity(localIntent);
  }
  
  public void a(String paramString, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(paramString, paramInt);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    c(false);
    if (jdField_a_of_type_AndroidViewView != null)
    {
      if (paramBoolean) {
        jdField_a_of_type_AndroidViewView.setVisibility(0);
      }
    }
    else {
      return;
    }
    if (jdField_a_of_type_AndroidWidgetProgressBar != null)
    {
      jdField_a_of_type_AndroidWidgetProgressBar.setProgress(0);
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(4);
    }
    if (jdField_a_of_type_AndroidWidgetTextView != null)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(null);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    }
    jdField_a_of_type_AndroidViewView.setVisibility(4);
  }
  
  public void a(AIORichMediaData[] paramArrayOfAIORichMediaData, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i("AIOGalleryScene", 2, "notifyImageListChanged list size " + paramArrayOfAIORichMediaData.length + ", selected " + paramInt);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a(paramArrayOfAIORichMediaData, paramInt);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a() == 0)
    {
      PicReporter.b(false);
      QQToast.a(jdField_a_of_type_AndroidAppActivity, 2131369784, 0).a();
      jdField_a_of_type_AndroidAppActivity.finish();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(true);
      jdField_a_of_type_Boolean = false;
      jdField_b_of_type_Boolean = true;
      paramInt = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b();
      if (paramInt != jdField_a_of_type_ComTencentWidgetGallery.r()) {
        break;
      }
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView.a(jdField_a_of_type_ComTencentWidgetGallery, paramInt);
      return;
      PicReporter.b(true);
    }
    jdField_a_of_type_ComTencentWidgetGallery.setSelection(paramInt);
  }
  
  public boolean a(int paramInt, KeyEvent paramKeyEvent)
  {
    if (82 == paramKeyEvent.getKeyCode()) {
      try
      {
        if (!AIODevLittleVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a().jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
          p();
        }
        return true;
      }
      catch (Throwable paramKeyEvent)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.e("AIOGalleryScene", 2, "showActionSheet oom");
          }
        }
      }
    }
    return super.a(paramInt, paramKeyEvent);
  }
  
  boolean a(AIORichMediaInfo paramAIORichMediaInfo)
  {
    return false;
  }
  
  boolean a(ActionSheet paramActionSheet, AIOImageData paramAIOImageData)
  {
    return false;
  }
  
  public boolean a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    ReportController.b(null, "CliOper", "", "", "View_pic", "View_pic_menu", 0, 0, "0", "", "", "");
    try
    {
      if (!AIODevLittleVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a().jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
        p();
      }
      return true;
    }
    catch (Throwable paramAdapterView)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e("AIOGalleryScene", 2, "showActionSheet oom");
        }
      }
    }
  }
  
  public boolean a(String paramString, AIOImageData paramAIOImageData, File paramFile)
  {
    return false;
  }
  
  public void b()
  {
    o();
    jdField_i_of_type_Boolean = true;
    AIORichMediaInfo localAIORichMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b();
    if (localAIORichMediaInfo != null) {
      jdField_a_of_type_Boolean = true;
    }
    if (!f()) {
      jdField_b_of_type_AndroidWidgetImageButton.setVisibility(0);
    }
    Looper.myQueue().addIdleHandler(jdField_a_of_type_AndroidOsMessageQueue$IdleHandler);
  }
  
  public void b(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    super.b(paramAdapterView, paramView, paramInt, paramLong);
    if (AIOGalleryAdapter.GalleryURLImageView.class.isInstance(paramView))
    {
      Object localObject = (AIOGalleryAdapter.GalleryURLImageView)paramView;
      Drawable localDrawable = ((AIOGalleryAdapter.GalleryURLImageView)localObject).getDrawable();
      if ((!jdField_b_of_type_Boolean) && (localDrawable != null) && ((localDrawable instanceof URLDrawable)))
      {
        localObject = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a(paramInt);
        if (localObject != null)
        {
          a((AIORichMediaInfo)localObject);
          if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(4))
          {
            c(true);
            if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter != null)
            {
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(paramAdapterView, paramView, paramInt, paramLong);
              paramAdapterView = a().findViewById(2131301838);
              if (paramAdapterView != null)
              {
                if (paramAdapterView.getAnimation() != null)
                {
                  paramAdapterView.getAnimation().cancel();
                  paramAdapterView.setAnimation(null);
                }
                paramAdapterView.setVisibility(4);
              }
            }
          }
        }
      }
    }
    do
    {
      do
      {
        return;
        c(false);
      } while (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter == null);
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(paramAdapterView, paramView, paramInt, paramLong);
      paramAdapterView = a().findViewById(2131301838);
    } while (paramAdapterView == null);
    if (paramAdapterView.getAnimation() != null)
    {
      paramAdapterView.getAnimation().cancel();
      paramAdapterView.setAnimation(null);
    }
    paramAdapterView.setVisibility(4);
  }
  
  protected boolean b()
  {
    boolean bool = true;
    if (jdField_g_of_type_Int == 1) {
      bool = false;
    }
    return bool;
  }
  
  public void c()
  {
    jdField_i_of_type_Boolean = false;
    c(jdField_h_of_type_Boolean);
    if (!g()) {
      jdField_b_of_type_AndroidWidgetImageButton.setVisibility(4);
    }
  }
  
  public void c(boolean paramBoolean)
  {
    jdField_h_of_type_Boolean = paramBoolean;
    if (jdField_a_of_type_AndroidWidgetImageButton != null)
    {
      if ((jdField_h_of_type_Boolean) && (jdField_i_of_type_Boolean)) {
        jdField_a_of_type_AndroidWidgetImageButton.setVisibility(0);
      }
    }
    else {
      return;
    }
    jdField_a_of_type_AndroidWidgetImageButton.setVisibility(4);
  }
  
  protected boolean c()
  {
    if ((jdField_g_of_type_Int == 62215) || (jdField_g_of_type_Int == 1)) {
      return false;
    }
    if (jdField_i_of_type_Int == Integer.MIN_VALUE) {
      return false;
    }
    Iterator localIterator = ((ActivityManager)jdField_a_of_type_AndroidAppActivity.getSystemService("activity")).getRunningAppProcesses().iterator();
    ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo;
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
      localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)localIterator.next();
    } while (!processName.endsWith("mobileqq"));
    for (int i1 = pid;; i1 = Integer.MIN_VALUE) {
      return i1 == jdField_i_of_type_Int;
    }
  }
  
  public void d()
  {
    if (!g()) {
      jdField_b_of_type_AndroidWidgetImageButton.setVisibility(4);
    }
  }
  
  public void e() {}
  
  public boolean e()
  {
    if (jdField_a_of_type_Ldp != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.b(jdField_a_of_type_Ldp.jdField_a_of_type_Long, jdField_a_of_type_Ldp.jdField_a_of_type_Int, 4);
      jdField_a_of_type_Ldp = null;
      a(false);
      c(true);
      return true;
    }
    c(false);
    boolean bool = super.e();
    int i1 = jdField_a_of_type_ComTencentWidgetGallery.s();
    int i2 = jdField_a_of_type_ComTencentWidgetGallery.getChildCount();
    int i3 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b();
    if ((i3 >= i1) && (i3 <= i2 + i1 - 1))
    {
      localView = jdField_a_of_type_ComTencentWidgetGallery.getChildAt(i3 - i1);
      if (ImageView.class.isInstance(localView)) {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(i3, (ImageView)localView);
      }
    }
    View localView = a().findViewById(2131301838);
    if (localView != null) {
      localView.setVisibility(4);
    }
    return bool;
  }
  
  public void f()
  {
    super.f();
    if (m > 0) {
      ReportController.b(null, "CliOper", "", "", "View_pic", "View_pic_spin", 0, 0, "" + m, "", "", "");
    }
  }
  
  boolean f()
  {
    return false;
  }
  
  boolean g()
  {
    return false;
  }
  
  public void l()
  {
    super.l();
    AIORichMediaInfo localAIORichMediaInfo = ((AIOImageListModel)jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel).b();
    if (localAIORichMediaInfo != null) {
      jdField_a_of_type_Boolean = false;
    }
  }
  
  public void m()
  {
    super.m();
    AIORichMediaInfo localAIORichMediaInfo = ((AIOImageListModel)jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel).b();
    if (localAIORichMediaInfo != null) {
      jdField_a_of_type_Boolean = false;
    }
  }
  
  public void o()
  {
    if ((jdField_g_of_type_Boolean) || (jdField_a_of_type_Boolean) || (jdField_b_of_type_Boolean)) {
      jdField_a_of_type_ComTencentWidgetGallery.setSelection(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b());
    }
  }
  
  public void p()
  {
    Object localObject3 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a();
    AIOImageData localAIOImageData;
    Object localObject2;
    Object localObject1;
    if (AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData))
    {
      localAIOImageData = (AIOImageData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
      localObject2 = localAIOImageData.a(4);
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = localAIOImageData.a(2);
      }
      if ((localObject1 != null) || (!jdField_g_of_type_Boolean)) {}
    }
    label212:
    do
    {
      do
      {
        return;
        localObject2 = ActionSheet.c(jdField_a_of_type_AndroidAppActivity);
        if (localObject1 != null) {
          jdField_g_of_type_JavaLangString = ((File)localObject1).getPath();
        }
        if (!a((ActionSheet)localObject2, localAIOImageData)) {
          if (localObject1 != null)
          {
            if (jdField_c_of_type_Boolean) {
              break label212;
            }
            ((ActionSheet)localObject2).c(2131369768);
            ((ActionSheet)localObject2).c(2131369778);
            if (jdField_d_of_type_Boolean) {
              ((ActionSheet)localObject2).c(2131369786);
            }
            ((ActionSheet)localObject2).c(2131369774);
            ThreadManager.a().post(new ldk(this, (File)localObject1, (ActionSheet)localObject2));
            ((ActionSheet)localObject2).c(2131369772);
          }
        }
        for (;;)
        {
          if ((!jdField_g_of_type_Boolean) && (!jdField_c_of_type_Boolean)) {
            ((ActionSheet)localObject2).c(2131369779);
          }
          ((ActionSheet)localObject2).d(2131366996);
          ((ActionSheet)localObject2).a(new ldm(this, (ActionSheet)localObject2, localAIOImageData, (File)localObject1, (AIORichMediaInfo)localObject3));
          ((ActionSheet)localObject2).show();
          return;
          ((ActionSheet)localObject2).c(2131369774);
        }
      } while (!AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData));
      localObject1 = (AIOShortVideoData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
      localObject2 = ((AIOShortVideoData)localObject1).a(1);
    } while ((localObject2 == null) || (!((File)localObject2).exists()));
    localObject3 = ActionSheet.c(jdField_a_of_type_AndroidAppActivity);
    ((ActionSheet)localObject3).c(2131369768);
    ((ActionSheet)localObject3).c(2131369772);
    ((ActionSheet)localObject3).c(2131369779);
    ((ActionSheet)localObject3).d(2131366996);
    ((ActionSheet)localObject3).a(new ldo(this, (ActionSheet)localObject3, (AIOShortVideoData)localObject1, (File)localObject2));
    ((ActionSheet)localObject3).show();
  }
  
  void q() {}
  
  public void r()
  {
    if (!jdField_g_of_type_Boolean)
    {
      if (!jdField_a_of_type_Boolean)
      {
        int i1 = jdField_a_of_type_ComTencentWidgetGallery.s();
        int i2 = jdField_a_of_type_ComTencentWidgetGallery.getChildCount();
        int i3 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b();
        if ((i3 >= i1) && (i3 <= i2 + i1 - 1))
        {
          View localView = jdField_a_of_type_ComTencentWidgetGallery.getChildAt(i3 - i1);
          if (ImageView.class.isInstance(localView)) {
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(i3, (ImageView)localView);
          }
        }
        n();
        a("Pic_view", 0);
      }
    }
    else {
      return;
    }
    QQToast.a(jdField_a_of_type_AndroidAppActivity, 2131368406, 0).a();
  }
}
