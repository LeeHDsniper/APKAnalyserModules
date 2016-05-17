package com.tencent.mobileqq.activity.aio.photo;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.v4.util.MQLruCache;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.galleryactivity.AbstractImageAdapter;
import com.tencent.common.galleryactivity.AbstractImageAdapter.URLImageView2;
import com.tencent.common.galleryactivity.AbstractImageListModel;
import com.tencent.image.RegionDrawableData;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.image.URLImageView;
import com.tencent.image.VideoDrawable;
import com.tencent.image.VideoDrawable.VideoDrawableParams;
import com.tencent.mobileqq.activity.photo.ProGallery.OnProGalleryListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.dc.DCAIOPreview;
import com.tencent.mobileqq.richmedia.dc.DCAIOPreviewProgressive;
import com.tencent.mobileqq.richmedia.dc.DCShortVideo;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.JpegOrientationReader;
import com.tencent.widget.AdapterView;
import cooperation.peak.PeakUtils;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;

public class AIOGalleryAdapter
  extends AbstractImageAdapter
  implements ProGallery.OnProGalleryListener
{
  public static final int a = 0;
  static final String jdField_a_of_type_JavaLangString = "AIOGalleryAdapter";
  private static final String jdField_b_of_type_JavaLangString = "NOSAMPLE";
  private static final String jdField_c_of_type_JavaLangString = "DISPLAY";
  private static final String jdField_d_of_type_JavaLangString = "PART";
  long jdField_a_of_type_Long;
  private SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  private URLDrawable jdField_a_of_type_ComTencentImageURLDrawable;
  AIOGalleryActivity jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity;
  private AIOGalleryAdapter.GalleryURLImageView jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView;
  public AIOGalleryAdapter.OnAdapterNotify a;
  IAIOImageProvider jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  private int jdField_b_of_type_Int;
  long jdField_b_of_type_Long;
  private URLDrawable jdField_b_of_type_ComTencentImageURLDrawable;
  private int jdField_c_of_type_Int;
  private int jdField_d_of_type_Int;
  private int e;
  
  public AIOGalleryAdapter(Context paramContext, IAIOImageProvider paramIAIOImageProvider)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
    jdField_b_of_type_Int = -1;
    c = -1;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_Long = -1L;
    jdField_b_of_type_Long = -1L;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity = ((AIOGalleryActivity)paramContext);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider = paramIAIOImageProvider;
    d = getResourcesgetDisplayMetricswidthPixels;
    e = getResourcesgetDisplayMetricsheightPixels;
  }
  
  private String a()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("Actives: ");
    int i = 0;
    while (i < jdField_a_of_type_AndroidUtilSparseArray.size())
    {
      if (i > 0) {
        localStringBuilder.append(" , ");
      }
      localStringBuilder.append(jdField_a_of_type_AndroidUtilSparseArray.keyAt(i) + 1);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  private void a()
  {
    jdField_a_of_type_AndroidUtilSparseArray.clear();
    if ((jdField_a_of_type_ComTencentImageURLDrawable != null) && (jdField_a_of_type_ComTencentImageURLDrawable.getStatus() == 0)) {
      jdField_a_of_type_ComTencentImageURLDrawable.cancelDownload(true);
    }
    jdField_a_of_type_ComTencentImageURLDrawable = null;
    jdField_b_of_type_Int = -1;
  }
  
  private void a(int paramInt, URLDrawable paramURLDrawable)
  {
    if (paramURLDrawable == null) {}
    do
    {
      do
      {
        return;
        paramURLDrawable = paramURLDrawable.getCurrDrawable();
      } while (!VideoDrawable.class.isInstance(paramURLDrawable));
      ((VideoDrawable)paramURLDrawable).stopAudio();
      if (jdField_b_of_type_Long > 0L)
      {
        jdField_a_of_type_Long += System.currentTimeMillis() - jdField_b_of_type_Long;
        paramURLDrawable = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.getIntent();
        if (paramURLDrawable != null)
        {
          int i = paramURLDrawable.getIntExtra("forward_source_uin_type", -1);
          paramURLDrawable = paramURLDrawable.getStringExtra("uin");
          new DCShortVideo(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.getApplication().getBaseContext()).a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_ComTencentMobileqqAppPeakAppInterface, 2001, 0, i, paramURLDrawable, jdField_a_of_type_Long / 1000L);
        }
        jdField_b_of_type_Long = -1L;
        jdField_a_of_type_Long = -1L;
      }
    } while (!QLog.isColorLevel());
    QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.stopVideoAudio(): position " + paramInt);
  }
  
  public View a(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    if (paramView != null) {
      if (paramView.getStatus() == 3) {
        paramView.restartDownload();
      }
    }
    do
    {
      return null;
      paramView = (AIORichMediaInfo)a(paramInt);
    } while (paramView == null);
    AIOImageData localAIOImageData;
    if (AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData))
    {
      localAIOImageData = (AIOImageData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
      paramViewGroup = localAIOImageData.a(4);
      if (paramViewGroup != null) {
        break label661;
      }
      paramView = localAIOImageData.a(2);
      if (paramView == null) {}
    }
    for (;;)
    {
      int i;
      if (paramViewGroup != null)
      {
        i = 1;
        paramViewGroup = URLDrawable.URLDrawableOptions.obtain();
        mLoadingDrawable = URLDrawableHelper.d;
        mFailedDrawable = URLDrawableHelper.d;
        mPlayGifImage = true;
        mUseExifOrientation = false;
        if ((i != 0) || (!d)) {
          break label198;
        }
      }
      label198:
      for (paramView = URLDrawable.getDrawable(localAIOImageData.a(2) + "#" + "PART", paramViewGroup);; paramView = URLDrawable.getDrawable(paramView, paramViewGroup))
      {
        paramView.setTag(Integer.valueOf(1));
        paramView.startDownload();
        jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, paramView);
        return null;
        i = 0;
        break;
      }
      if ((jdField_c_of_type_Boolean) || (jdField_b_of_type_Boolean) || (jdField_a_of_type_Boolean)) {
        break;
      }
      if (localAIOImageData.a(1) != null)
      {
        paramView = URLDrawable.URLDrawableOptions.obtain();
        mLoadingDrawable = URLDrawableHelper.d;
        mFailedDrawable = URLDrawableHelper.d;
        URLDrawable.getDrawable(localAIOImageData.a(1), paramView).startDownload();
        if ((!NetworkUtil.h(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity)) || (PeakUtils.a(g))) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 2);
        return null;
      }
      if ((!NetworkUtil.h(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity)) || (PeakUtils.a(g))) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 2);
      if (!QLog.isDevelopLevel()) {
        break;
      }
      QLog.d("AIOGalleryAdapter", 4, "onCreateView():Thumb and large pic is not exist, download it. Gallery position is " + paramInt);
      return null;
      if (AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData))
      {
        paramViewGroup = (AIOShortVideoData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
        paramView = paramViewGroup.a(0);
        if (paramView != null)
        {
          paramViewGroup = URLDrawable.URLDrawableOptions.obtain();
          mLoadingDrawable = URLDrawableHelper.d;
          mFailedDrawable = URLDrawableHelper.d;
          paramView = URLDrawable.getDrawable(paramView, paramViewGroup);
          paramView.startDownload();
          jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, paramView);
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onCreateView(): preload thumb, position=" + paramInt);
          return null;
        }
        if (jdField_b_of_type_Boolean)
        {
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onCreateView(): Video error, position=" + paramInt);
          return null;
        }
        if (paramViewGroup.a(1) != null)
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 0);
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onCreateView(): Video exist and download thumb, position=" + paramInt);
          return null;
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 1);
        if (!QLog.isDevelopLevel()) {
          break;
        }
        QLog.d("AIOGalleryAdapter", 4, "onCreateView():Thumb and video is not exist, download video only. Gallery position is " + paramInt);
        return null;
      }
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onCreateView(): nani...");
      return null;
      label661:
      paramView = paramViewGroup;
    }
  }
  
  public void a(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (QLog.isColorLevel()) {
      QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onSlot(): position is " + paramInt);
    }
    System.gc();
  }
  
  public void a(int paramInt, View paramView, ViewGroup paramViewGroup, boolean paramBoolean)
  {
    if (paramInt == jdField_b_of_type_Int)
    {
      if ((jdField_a_of_type_ComTencentImageURLDrawable != null) && (jdField_a_of_type_ComTencentImageURLDrawable.getStatus() == 0)) {
        jdField_a_of_type_ComTencentImageURLDrawable.cancelDownload(true);
      }
      jdField_a_of_type_ComTencentImageURLDrawable = null;
      jdField_b_of_type_Int = -1;
      if (QLog.isColorLevel()) {
        QLog.d("AIOGalleryAdapter", 2, "destory rawDrawable, position: " + paramInt);
      }
    }
    AIORichMediaInfo localAIORichMediaInfo;
    if (URLImageView.class.isInstance(paramView))
    {
      paramViewGroup = (URLImageView)paramView;
      localAIORichMediaInfo = (AIORichMediaInfo)a(paramInt);
      if (localAIORichMediaInfo != null) {
        break label106;
      }
    }
    label106:
    do
    {
      do
      {
        AIORichMediaData localAIORichMediaData;
        do
        {
          return;
          localAIORichMediaData = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
          if (AIOImageData.class.isInstance(localAIORichMediaData))
          {
            if (URLDrawable.class.isInstance(((URLImageView)paramView).getDrawable())) {
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().b(localAIORichMediaInfo.hashCode());
            }
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().a();
            return;
          }
        } while (!AIOShortVideoData.class.isInstance(localAIORichMediaData));
        paramView = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
        if (paramView == null) {
          break;
        }
        paramViewGroup.setImageDrawable(paramView);
      } while (!QLog.isColorLevel());
      QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onViewDetached(): Use thumb cache replace video.");
      return;
      paramViewGroup.setImageDrawable(URLDrawableHelper.d);
    } while (!QLog.isColorLevel());
    QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onViewDetached(): No thumb, use TRANSPARENT");
  }
  
  public void a(int paramInt, View paramView, RegionDrawableData paramRegionDrawableData)
  {
    if (!ImageView.class.isInstance(paramView)) {}
    do
    {
      return;
      paramView = ((ImageView)paramView).getDrawable();
    } while (!URLDrawable.class.isInstance(paramView));
    ((URLDrawable)paramView).updateRegionBitmap(paramRegionDrawableData);
  }
  
  public void a(int paramInt, View paramView, boolean paramBoolean)
  {
    Object localObject1;
    if ((paramView instanceof AbstractImageAdapter.URLImageView2))
    {
      paramView = (AbstractImageAdapter.URLImageView2)paramView;
      localObject1 = (AIORichMediaInfo)a(paramInt);
      if (!AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
        break label196;
      }
      localObject2 = (AIOImageData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
      if ((paramBoolean) && (((AIOImageData)localObject2).a(8) != null))
      {
        localObject1 = paramView.getDrawable();
        localObject2 = ((AIOImageData)localObject2).a(8);
        localObject2 = (String)localObject2 + "#" + "DISPLAY";
        localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
        mLoadingDrawable = ((Drawable)localObject1);
        mFailedDrawable = ((Drawable)localObject1);
        mPlayGifImage = true;
        mUseExifOrientation = false;
        localObject1 = URLDrawable.getDrawable((String)localObject2, localURLDrawableOptions);
        paramView.setDecodingDrawble((URLDrawable)localObject1);
        ((URLDrawable)localObject1).startDownload();
        if (QLog.isColorLevel()) {
          QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.updateDisplayView(): Update dp image, position=" + paramInt);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().b();
      }
    }
    label196:
    while (!AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData))
    {
      Object localObject2;
      URLDrawable.URLDrawableOptions localURLDrawableOptions;
      return;
    }
  }
  
  void a(int paramInt, ImageView paramImageView)
  {
    paramImageView = paramImageView.getDrawable();
    if (URLDrawable.class.isInstance(paramImageView)) {
      a(paramInt, (URLDrawable)paramImageView);
    }
  }
  
  public void a(Configuration paramConfiguration)
  {
    int i = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.getResources().getDisplayMetrics().widthPixels;
    int j = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.getResources().getDisplayMetrics().heightPixels;
    if ((i != d) || (j != e))
    {
      d = i;
      e = j;
      URLDrawable.clearMemoryCache();
      a();
    }
  }
  
  public void a(View paramView, int paramInt) {}
  
  public void a(AbstractImageListModel paramAbstractImageListModel)
  {
    super.a(paramAbstractImageListModel);
    a();
  }
  
  public void a(URLDrawable paramURLDrawable, int paramInt)
  {
    if (jdField_a_of_type_AndroidUtilSparseArray.get(paramInt) != null) {
      jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, paramURLDrawable);
    }
  }
  
  void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    Object localObject = (AIORichMediaInfo)a(paramInt);
    if ((paramView != null) && (AbstractImageAdapter.URLImageView2.class.isInstance(paramView)))
    {
      if ((c != paramInt) && (jdField_b_of_type_ComTencentImageURLDrawable != null)) {
        a(c, jdField_b_of_type_ComTencentImageURLDrawable);
      }
      if ((localObject == null) || (!AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData))) {
        break label390;
      }
      paramAdapterView = (AbstractImageAdapter.URLImageView2)paramView;
      localObject = (AIOShortVideoData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
      if ((c != paramInt) || (jdField_b_of_type_ComTencentImageURLDrawable == null) || (jdField_b_of_type_ComTencentImageURLDrawable.getStatus() != 1)) {
        break label144;
      }
      if (QLog.isColorLevel()) {
        QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onItemSelected(): Has videoDrawable cache position " + paramInt);
      }
    }
    label144:
    label390:
    do
    {
      do
      {
        do
        {
          return;
          paramView = ((AIOShortVideoData)localObject).a(1);
          if (paramView != null)
          {
            localObject = URLDrawable.URLDrawableOptions.obtain();
            mLoadingDrawable = URLDrawableHelper.d;
            mFailedDrawable = URLDrawableHelper.d;
            mUseMemoryCache = false;
            VideoDrawable.VideoDrawableParams localVideoDrawableParams = new VideoDrawable.VideoDrawableParams();
            mPlayVideoFrame = true;
            mPlayAudioFrame = true;
            mEnableAntiAlias = true;
            mEnableFilter = true;
            mExtraInfo = localVideoDrawableParams;
            localObject = URLDrawable.getDrawable(paramView, (URLDrawable.URLDrawableOptions)localObject);
            if (((URLDrawable)localObject).getStatus() == 1)
            {
              paramAdapterView.setImageDrawable((Drawable)localObject);
              a(paramInt, true);
            }
            for (;;)
            {
              jdField_b_of_type_ComTencentImageURLDrawable = ((URLDrawable)localObject);
              c = paramInt;
              jdField_b_of_type_Long = System.currentTimeMillis();
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onItemSelected(): video file " + paramView);
              return;
              paramAdapterView.setDecodingDrawble((URLDrawable)localObject);
              ((URLDrawable)localObject).startDownload();
            }
          }
          paramAdapterView = ((AIOShortVideoData)localObject).a(0);
        } while (paramAdapterView == null);
        c = -1;
        jdField_b_of_type_ComTencentImageURLDrawable = null;
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 1);
      } while (!QLog.isColorLevel());
      QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onItemSelected(): thumb file " + paramAdapterView);
      return;
      c = -1;
      jdField_b_of_type_ComTencentImageURLDrawable = null;
    } while (!QLog.isColorLevel());
    QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.onItemSelected(): Data is image");
  }
  
  public void a(boolean paramBoolean)
  {
    super.notifyDataSetChanged();
    if (QLog.isColorLevel()) {
      QLog.d("AIOGalleryAdapter", 2, "notifyDataSetChanged(): Data changed");
    }
    a();
  }
  
  public void b(int paramInt1, int paramInt2)
  {
    AIORichMediaInfo localAIORichMediaInfo = (AIORichMediaInfo)a(paramInt1);
    if (AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
      if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData).d) {
        super.b(paramInt1, paramInt2);
      }
    }
    while (!AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
      return;
    }
    super.b(paramInt1, paramInt2);
  }
  
  public void b(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    if (paramView != null)
    {
      if (paramView.getStatus() == 0) {
        paramView.cancelDownload(true);
      }
      jdField_a_of_type_AndroidUtilSparseArray.remove(paramInt);
    }
    if (paramInt == jdField_b_of_type_Int)
    {
      if ((jdField_a_of_type_ComTencentImageURLDrawable != null) && (jdField_a_of_type_ComTencentImageURLDrawable.getStatus() == 0)) {
        jdField_a_of_type_ComTencentImageURLDrawable.cancelDownload(true);
      }
      jdField_a_of_type_ComTencentImageURLDrawable = null;
      jdField_b_of_type_Int = -1;
    }
    if (QLog.isColorLevel()) {
      QLog.d("AIOGalleryAdapter", 2, a());
    }
  }
  
  public void b(int paramInt, View paramView, boolean paramBoolean)
  {
    VideoDrawable.VideoDrawableParams localVideoDrawableParams = null;
    AbstractImageAdapter.URLImageView2 localURLImageView2;
    AIOImageData localAIOImageData;
    Object localObject;
    if ((paramView instanceof AbstractImageAdapter.URLImageView2))
    {
      localURLImageView2 = (AbstractImageAdapter.URLImageView2)paramView;
      paramView = (AIORichMediaInfo)a(paramInt);
      if (!AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
        break label448;
      }
      localAIOImageData = (AIOImageData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
      if (!jdField_b_of_type_Boolean) {
        break label220;
      }
      paramView = localURLImageView2.getDrawable();
      if (!URLDrawable.class.isInstance(paramView)) {
        break label719;
      }
      paramView = (URLDrawable)paramView;
      localObject = paramView.getURL().getRef();
    }
    for (;;)
    {
      if ((paramView == null) || (localObject == null) || ((!"PART".equals(localObject)) && (!"DISPLAY".equals(localObject))))
      {
        localURLImageView2.setImageDrawable(BaseApplicationImpl.a().getResources().getDrawable(2130837565));
        a(paramInt, false);
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().d();
      }
      if (QLog.isColorLevel()) {
        QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.updateView(): IMAGE_FILE_ERROR");
      }
      if ((QLog.isDevelopLevel()) && (d)) {
        QQToast.a(localURLImageView2.getContext(), "AIOGalleryAdapter.updateView(): error!", 2000).a();
      }
      for (;;)
      {
        if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean)
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.b();
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean = true;
        }
        return;
        label220:
        if (localAIOImageData.a(2) != null)
        {
          localObject = localAIOImageData.a(2);
          paramView = (View)localObject;
          if (paramBoolean) {
            paramView = (String)localObject + "#PART";
          }
          localObject = URLDrawable.URLDrawableOptions.obtain();
          mUseExifOrientation = false;
          mPlayGifImage = true;
          localObject = URLDrawable.getDrawable(paramView, (URLDrawable.URLDrawableOptions)localObject);
          if ((((URLDrawable)localObject).getStatus() == 1) && (!d))
          {
            localURLImageView2.setImageDrawable((Drawable)localObject);
            a(paramInt, true);
          }
          for (;;)
          {
            localObject = FileUtils.a(jdField_b_of_type_JavaLangString);
            if ("png".equals(localObject)) {
              localURLImageView2.setTag(Integer.valueOf(102));
            }
            if (QLog.isColorLevel()) {
              QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.updateView(): Update large image, position=" + paramInt + "url = " + paramView + ",extName = " + (String)localObject);
            }
            d = paramBoolean;
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().c();
            break;
            ((URLDrawable)localObject).setTag(Integer.valueOf(1));
            ((URLDrawable)localObject).startDownload();
            localURLImageView2.setDecodingDrawble((URLDrawable)localObject);
          }
          label448:
          if (AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData))
          {
            localObject = (AIOShortVideoData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
            if (jdField_b_of_type_Boolean)
            {
              localURLImageView2.setImageDrawable(BaseApplicationImpl.a().getResources().getDrawable(2130837565));
              a(paramInt, false);
              if (QLog.isColorLevel()) {
                QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.updateView(): IMAGE_FILE_ERROR, position=" + paramInt);
              }
            }
            else
            {
              paramView = ((AIOShortVideoData)localObject).a(1);
              if (paramView != null)
              {
                localObject = URLDrawable.URLDrawableOptions.obtain();
                mLoadingDrawable = URLDrawableHelper.e;
                mUseMemoryCache = false;
                localVideoDrawableParams = new VideoDrawable.VideoDrawableParams();
                mPlayVideoFrame = true;
                mEnableAntiAlias = true;
                mEnableFilter = true;
                mExtraInfo = localVideoDrawableParams;
                paramView = URLDrawable.getDrawable(paramView, (URLDrawable.URLDrawableOptions)localObject);
                if (paramView.getStatus() == 1) {
                  localURLImageView2.setImageDrawable(paramView);
                }
                for (;;)
                {
                  a(paramInt, true);
                  if (!QLog.isColorLevel()) {
                    break;
                  }
                  QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.updateView(): Update video, position=" + paramInt);
                  break;
                  localURLImageView2.setDecodingDrawble(paramView);
                  paramView.startDownload();
                }
              }
              if ((((AIOShortVideoData)localObject).a(0) != null) && (QLog.isColorLevel())) {
                QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.updateView(): thumb downloaded, position=" + paramInt);
              }
            }
          }
        }
      }
      label719:
      localObject = null;
      paramView = localVideoDrawableParams;
    }
  }
  
  public void c(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    AbstractImageAdapter.URLImageView2 localURLImageView2 = (AbstractImageAdapter.URLImageView2)paramView;
    paramView = localURLImageView2.getDrawable();
    paramViewGroup = jdField_a_of_type_ComTencentImageURLDrawable;
    if (((paramView instanceof URLDrawable)) && (((URLDrawable)paramView).isFakeSize()) && (paramViewGroup == null))
    {
      paramView = ((URLDrawable)paramView).getURL();
      if (("file".equals(paramView.getProtocol())) && (paramView.getRef() == null))
      {
        if ((paramInt != jdField_b_of_type_Int) || (jdField_a_of_type_ComTencentImageURLDrawable == null)) {
          break label155;
        }
        paramViewGroup = jdField_a_of_type_ComTencentImageURLDrawable;
        paramView = paramViewGroup;
        if (QLog.isColorLevel())
        {
          paramView = paramViewGroup;
          if (jdField_a_of_type_ComTencentImageURLDrawable != null)
          {
            QLog.d("AIOGalleryAdapter", 2, "use exist raw drawable");
            paramView = paramViewGroup;
          }
        }
        if (paramView.getStatus() != 1) {
          break label283;
        }
        jdField_a_of_type_Boolean = true;
        localURLImageView2.setImageDrawable(paramView);
        jdField_a_of_type_Boolean = false;
      }
    }
    for (;;)
    {
      paramView = (AIORichMediaInfo)a(paramInt);
      if (paramView != null) {
        break label296;
      }
      return;
      label155:
      if ((QLog.isColorLevel()) && (jdField_a_of_type_ComTencentImageURLDrawable != null)) {
        QLog.d("AIOGalleryAdapter", 2, "rawDrawable is exist");
      }
      paramView = paramView.toString() + "#" + "NOSAMPLE";
      paramViewGroup = URLDrawable.URLDrawableOptions.obtain();
      mUseExifOrientation = false;
      mUseMemoryCache = false;
      paramViewGroup = URLDrawable.getDrawable(paramView, paramViewGroup);
      paramViewGroup.setTag(Integer.valueOf(2));
      jdField_a_of_type_ComTencentImageURLDrawable = paramViewGroup;
      jdField_b_of_type_Int = paramInt;
      paramView = paramViewGroup;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("AIOGalleryAdapter", 2, "create rawDrawable, position:" + paramInt);
      paramView = paramViewGroup;
      break;
      label283:
      localURLImageView2.setDecodingDrawble(paramView);
      paramView.startDownload();
    }
    label296:
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().c(paramView.hashCode());
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject3 = null;
    boolean bool3 = false;
    int i = 1;
    if (paramView != null) {}
    AIOGalleryAdapter.GalleryURLImageView localGalleryURLImageView;
    AIORichMediaInfo localAIORichMediaInfo;
    AIOImageData localAIOImageData;
    Object localObject1;
    boolean bool1;
    for (;;)
    {
      return paramView;
      if (QLog.isColorLevel()) {
        QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): position=" + paramInt);
      }
      localGalleryURLImageView = new AIOGalleryAdapter.GalleryURLImageView(this, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity);
      localGalleryURLImageView.setAdjustViewBounds(true);
      localAIORichMediaInfo = (AIORichMediaInfo)a(paramInt);
      paramView = localGalleryURLImageView;
      if (localAIORichMediaInfo != null)
      {
        if (!AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
          break label1828;
        }
        localAIOImageData = (AIOImageData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
        jdField_a_of_type_Int = paramInt;
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo = localAIORichMediaInfo;
        jdField_a_of_type_Boolean = false;
        paramViewGroup = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
        if ((paramViewGroup != null) && (paramViewGroup.getStatus() == 1))
        {
          localGalleryURLImageView.setImageDrawable(paramViewGroup);
          paramView = localAIOImageData.a(4);
          localObject1 = paramViewGroup.getURL().toString();
          if (((String)localObject1).equals(paramView)) {
            jdField_b_of_type_Boolean = true;
          }
          if (jdField_b_of_type_Int == -2) {}
          try
          {
            jdField_b_of_type_Int = JpegOrientationReader.a(paramViewGroup.getURL().getFile());
            a(localGalleryURLImageView, paramViewGroup, jdField_b_of_type_Int);
            if (jdField_b_of_type_Boolean)
            {
              paramView = jdField_c_of_type_JavaLangString;
              paramView = FileUtils.a(paramView);
              if ("png".equals(paramView)) {
                localGalleryURLImageView.setTag(Integer.valueOf(102));
              }
              if (QLog.isColorLevel()) {
                QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): cache url is " + (String)localObject1 + ", cache type is " + localAIOImageData.a(paramViewGroup.getURL().getFile()) + ",extName = + " + paramView);
              }
              if (d) {
                jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 2);
              }
              if (!jdField_b_of_type_Boolean) {
                break label575;
              }
              paramView = "original";
              bool1 = true;
              paramInt = i;
              label373:
              if (paramInt != 0)
              {
                paramInt = localAIORichMediaInfo.hashCode();
                jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Int = paramInt;
                paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a();
                paramViewGroup.a(paramInt);
                paramViewGroup.a(paramInt, jdField_a_of_type_Long, jdField_b_of_type_Long);
                paramViewGroup.b(paramInt, PeakUtils.a(g));
                if (jdField_e_of_type_Boolean) {
                  paramViewGroup.d(paramInt);
                }
                if (paramView != null)
                {
                  paramViewGroup.a(paramInt, paramView);
                  paramViewGroup.a(paramInt, bool1);
                }
              }
              paramViewGroup = jdField_e_of_type_Long + "_" + i;
              paramView = localGalleryURLImageView;
              if (jdField_a_of_type_JavaUtilArrayList.contains(paramViewGroup)) {
                continue;
              }
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i);
              jdField_a_of_type_JavaUtilArrayList.add(paramViewGroup);
              return localGalleryURLImageView;
            }
          }
          catch (Exception paramView)
          {
            for (;;)
            {
              if (QLog.isColorLevel()) {
                QLog.e("AIOGalleryAdapter", 2, "read exif error", paramView);
              }
              jdField_b_of_type_Int = 1;
              continue;
              paramView = jdField_b_of_type_JavaLangString;
              continue;
              label575:
              paramView = "large";
            }
          }
        }
      }
    }
    paramView = localAIOImageData.a(4);
    if (paramView == null)
    {
      localObject1 = localAIOImageData.a(2);
      if (localObject1 == null) {}
    }
    for (;;)
    {
      boolean bool2;
      if (paramView != null)
      {
        bool2 = true;
        label613:
        paramView = URLDrawable.URLDrawableOptions.obtain();
        mRequestWidth = d;
        mRequestHeight = e;
        mLoadingDrawable = URLDrawableHelper.d;
        mPlayGifImage = true;
        mUseExifOrientation = false;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean)
        {
          if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView == null) {
            break label1018;
          }
          mLoadingDrawable = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView.getDrawable();
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView = null;
        }
        label683:
        if ((bool2) || (!d)) {
          break label1050;
        }
        paramViewGroup = URLDrawable.getDrawable(localAIOImageData.a(2) + "#" + "PART", paramView);
        label731:
        paramViewGroup.setTag(Integer.valueOf(1));
        jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, paramViewGroup);
        if (!paramViewGroup.isDownloadStarted()) {
          break label2302;
        }
        if (BaseApplicationImpl.a.get(paramViewGroup.getURL().toString()) == null) {
          break label1060;
        }
        bool1 = true;
        label774:
        if (!bool2) {
          break label1066;
        }
        paramView = "original";
      }
      for (;;)
      {
        label783:
        switch (paramViewGroup.getStatus())
        {
        default: 
          localGalleryURLImageView.setImageDrawable(paramViewGroup);
          jdField_b_of_type_Boolean = bool2;
          if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean) {
            paramViewGroup.downloadImediatly();
          }
          if (bool2)
          {
            localObject1 = jdField_c_of_type_JavaLangString;
            label851:
            localObject1 = FileUtils.a((String)localObject1);
            if ("png".equals(localObject1)) {
              localGalleryURLImageView.setTag(Integer.valueOf(102));
            }
            if (QLog.isColorLevel()) {
              QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): url is " + paramViewGroup.getURL().toString() + ", file type is " + localAIOImageData.a(paramViewGroup.getURL().toString()) + ",extName = " + (String)localObject1);
            }
            if ((bool2) || (!d) || (jdField_b_of_type_Boolean)) {
              break label1166;
            }
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 2);
            if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean) {
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView = localGalleryURLImageView;
            }
          }
          break;
        }
        for (;;)
        {
          paramInt = i;
          break;
          bool2 = false;
          break label613;
          label1018:
          if (BaseApplicationImpl.a.get(localAIOImageData.a(1)) == null) {
            break label683;
          }
          mLoadingDrawable = URLDrawable.getDrawable(localAIOImageData.a(1), null);
          break label683;
          label1050:
          paramViewGroup = URLDrawable.getDrawable((File)localObject1, paramView);
          break label731;
          label1060:
          bool1 = false;
          break label774;
          label1066:
          paramView = "large";
          break label783;
          if (jdField_b_of_type_Int == -2) {}
          try
          {
            jdField_b_of_type_Int = JpegOrientationReader.a(((File)localObject1).getAbsolutePath());
            a(localGalleryURLImageView, paramViewGroup, jdField_b_of_type_Int);
            if (paramViewGroup.getStatus() == 1) {
              bool3 = true;
            }
            a(paramInt, bool3);
          }
          catch (Exception localException)
          {
            for (;;)
            {
              if (QLog.isColorLevel()) {
                QLog.e("AIOGalleryAdapter", 2, "read exif error", localException);
              }
              jdField_b_of_type_Int = 1;
            }
          }
          localObject2 = jdField_b_of_type_JavaLangString;
          break label851;
          label1166:
          if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean)
          {
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.b();
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean = true;
          }
        }
        if (localAIOImageData.a(8) != null)
        {
          paramView = URLDrawable.URLDrawableOptions.obtain();
          mLoadingDrawable = URLDrawableHelper.d;
          mFailedDrawable = URLDrawableHelper.d;
          mUseExifOrientation = false;
          localGalleryURLImageView.setImageDrawable(URLDrawable.getDrawable(localAIOImageData.a(8), paramView));
          a(paramInt, jdField_a_of_type_Int / 100);
          if (QLog.isColorLevel()) {
            QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): url is " + localAIOImageData.a(8) + ", file type is " + 8);
          }
          if (!jdField_b_of_type_Boolean) {
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 2);
          }
          for (;;)
          {
            if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean)
            {
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView = localGalleryURLImageView;
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().a(true);
            }
            if ((QLog.isDevelopLevel()) && (d)) {
              QQToast.a(localGalleryURLImageView.getContext(), "Refresh temp display image", 2000).a();
            }
            paramView = null;
            bool1 = false;
            paramInt = i;
            break;
            if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean)
            {
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.b();
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean = true;
            }
          }
        }
        if ((jdField_c_of_type_Boolean) || (jdField_b_of_type_Boolean) || (jdField_a_of_type_Boolean)) {
          if ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView != null))
          {
            paramView = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView.getDrawable();
            localGalleryURLImageView.setImageDrawable(paramView);
            if (URLDrawable.class.isInstance(paramView)) {
              jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, (URLDrawable)paramView);
            }
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView = null;
          }
        }
        for (;;)
        {
          if (QLog.isColorLevel())
          {
            QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): IMAGE_FILE_ERROR");
            paramView = null;
            bool1 = false;
            paramInt = 0;
            break;
            localGalleryURLImageView.setImageDrawable(BaseApplicationImpl.a().getResources().getDrawable(2130837565));
            a(paramInt, false);
            continue;
            if (localAIOImageData.a(1) != null)
            {
              paramView = URLDrawable.URLDrawableOptions.obtain();
              mLoadingDrawable = URLDrawableHelper.d;
              mFailedDrawable = URLDrawableHelper.d;
              paramView = URLDrawable.getDrawable(localAIOImageData.a(1), paramView);
              localGalleryURLImageView.setImageDrawable(paramView);
              paramView.downloadImediatly();
              a(paramInt, jdField_a_of_type_Int / 100);
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 2);
              if (QLog.isColorLevel()) {
                QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): url is " + localAIOImageData.a(1) + ", file type is " + 1);
              }
              if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean)
              {
                jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter$GalleryURLImageView = localGalleryURLImageView;
                jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().a(f);
              }
              paramView = null;
              bool1 = false;
              paramInt = i;
              break;
            }
            a(paramInt, jdField_a_of_type_Int / 100);
            localGalleryURLImageView.setImageDrawable(URLDrawableHelper.d);
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 2);
            if (QLog.isColorLevel()) {
              QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): No pic");
            }
            if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean) {
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.a().a(f);
            }
          }
        }
        paramView = null;
        bool1 = false;
        paramInt = 0;
        break label373;
        label1828:
        paramView = localGalleryURLImageView;
        if (!AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
          break;
        }
        paramViewGroup = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
        paramView = (AIOShortVideoData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
        jdField_a_of_type_Int = paramInt;
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo = localAIORichMediaInfo;
        if ((paramViewGroup != null) && (paramViewGroup.getStatus() == 1))
        {
          localGalleryURLImageView.setImageDrawable(paramViewGroup);
          if (QLog.isColorLevel()) {
            QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): video cache url is " + paramViewGroup.getURL());
          }
        }
        for (;;)
        {
          paramView = localGalleryURLImageView;
          if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean) {
            break;
          }
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.b();
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean = true;
          return localGalleryURLImageView;
          paramViewGroup = paramView.a(0);
          if (paramViewGroup != null)
          {
            if ((c == paramInt) && (jdField_b_of_type_ComTencentImageURLDrawable != null))
            {
              localGalleryURLImageView.setImageDrawable(jdField_b_of_type_ComTencentImageURLDrawable);
              if (QLog.isColorLevel()) {
                QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): load thumb and videoDrawable exist, position is " + paramInt);
              }
            }
            else
            {
              paramView = URLDrawable.URLDrawableOptions.obtain();
              mLoadingDrawable = URLDrawableHelper.d;
              mFailedDrawable = URLDrawableHelper.d;
              paramView = URLDrawable.getDrawable(paramViewGroup, paramView);
              localGalleryURLImageView.setImageDrawable(paramView);
              if (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_Boolean) {
                paramView.downloadImediatly();
              }
              jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, paramView);
              if (QLog.isColorLevel()) {
                QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): load thumb, position is " + paramInt);
              }
            }
          }
          else if (paramView.a(1) != null)
          {
            localGalleryURLImageView.setImageDrawable(URLDrawableHelper.d);
            if (QLog.isColorLevel()) {
              QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): only video exist, position is " + paramInt);
            }
          }
          else if ((jdField_a_of_type_Boolean) || (jdField_b_of_type_Boolean))
          {
            localGalleryURLImageView.setImageDrawable(BaseApplicationImpl.a().getResources().getDrawable(2130837565));
            a(paramInt, false);
            if (QLog.isColorLevel()) {
              QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): MEDIA_FILE_ERROR");
            }
          }
          else
          {
            a(paramInt, jdField_a_of_type_Int / 100);
            localGalleryURLImageView.setImageDrawable(URLDrawableHelper.d);
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_e_of_type_Long, i, 1);
            if (QLog.isColorLevel()) {
              QLog.i("AIOGalleryAdapter", 2, "AIOGalleryAdapter.getView(): video and thumb not exist, download video, position is " + paramInt);
            }
          }
        }
        label2302:
        bool1 = false;
        paramView = localObject3;
      }
      Object localObject2 = paramView;
    }
  }
}
