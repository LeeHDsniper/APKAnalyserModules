package com.tencent.mobileqq.activity.aio.photo;

import android.app.Activity;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.galleryactivity.AbstractImageAdapter;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.widget.AbsListView.LayoutParams;
import java.net.URL;

public class AIOPhotoListAdapter
  extends AbstractImageAdapter
{
  private int jdField_a_of_type_Int;
  private LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  private AIOImageListModel jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel;
  IAIOImageProvider jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider;
  
  public AIOPhotoListAdapter(Activity paramActivity, int paramInt, AIOImageListModel paramAIOImageListModel, IAIOImageProvider paramIAIOImageProvider)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewLayoutInflater = paramActivity.getLayoutInflater();
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel = paramAIOImageListModel;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider = paramIAIOImageProvider;
  }
  
  public AIORichMediaInfo a(int paramInt)
  {
    return jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a(paramInt);
  }
  
  public void a(View paramView, int paramInt) {}
  
  public void a(AIORichMediaInfo paramAIORichMediaInfo, View paramView)
  {
    Object localObject1 = (AIOPhotoListAdapter.Holder)paramView.getTag();
    if (paramAIORichMediaInfo == null) {
      return;
    }
    paramView = jdField_a_of_type_ComTencentImageURLImageView;
    ImageView localImageView1 = jdField_a_of_type_AndroidWidgetImageView;
    ImageView localImageView2 = b;
    localObject1 = c;
    Object localObject2;
    Object localObject3;
    if (AIOImageData.class.isInstance(a))
    {
      ((ImageView)localObject1).setVisibility(4);
      localObject1 = (AIOImageData)a;
      if (((AIOImageData)localObject1).a(1) != null)
      {
        localObject1 = ((AIOImageData)localObject1).a(1);
        localObject2 = paramView.getDrawable();
        localObject3 = URLDrawable.URLDrawableOptions.obtain();
        mRequestWidth = jdField_a_of_type_Int;
        mRequestHeight = jdField_a_of_type_Int;
        mLoadingDrawable = URLDrawableHelper.e;
        if ((localObject2 instanceof URLDrawable)) {
          if (!((String)localObject1).equals(((URLDrawable)localObject2).getURL().toString())) {
            paramView.setImageDrawable(URLDrawable.getDrawable((String)localObject1, (URLDrawable.URLDrawableOptions)localObject3));
          }
        }
      }
    }
    for (;;)
    {
      switch (paramAIORichMediaInfo.b())
      {
      default: 
        localImageView1.setVisibility(4);
        localImageView2.setVisibility(4);
        return;
        paramView.setImageDrawable(URLDrawable.getDrawable((String)localObject1, (URLDrawable.URLDrawableOptions)localObject3));
        continue;
        if (a)
        {
          paramView.setImageDrawable(BaseApplicationImpl.a().getResources().getDrawable(2130837565));
        }
        else
        {
          paramView.setImageDrawable(URLDrawableHelper.e);
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(e, i, 1);
          continue;
          if (AIOShortVideoData.class.isInstance(a))
          {
            ((ImageView)localObject1).setVisibility(0);
            localObject1 = (AIOShortVideoData)a;
            if (((AIOShortVideoData)localObject1).a(0) != null)
            {
              localObject1 = ((AIOShortVideoData)localObject1).a(0);
              localObject2 = URLDrawable.URLDrawableOptions.obtain();
              localObject3 = paramView.getDrawable();
              mRequestWidth = jdField_a_of_type_Int;
              mRequestHeight = jdField_a_of_type_Int;
              mLoadingDrawable = URLDrawableHelper.d;
              if ((localObject3 instanceof URLDrawable))
              {
                localObject3 = ((URLDrawable)localObject3).getURL().toString();
                if ((localObject1 != null) && (!((String)localObject1).equals(localObject3))) {
                  paramView.setImageDrawable(URLDrawable.getDrawable((String)localObject1, (URLDrawable.URLDrawableOptions)localObject2));
                }
              }
              else
              {
                paramView.setImageDrawable(URLDrawable.getDrawable((String)localObject1, (URLDrawable.URLDrawableOptions)localObject2));
              }
            }
            else if (!a)
            {
              paramView.setImageDrawable(URLDrawableHelper.e);
              jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(e, i, 0);
            }
          }
        }
        break;
      }
    }
    localImageView1.setVisibility(0);
    localImageView2.setVisibility(0);
    return;
    localImageView1.setVisibility(4);
    localImageView2.setVisibility(4);
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = paramView;
    if (paramView == null)
    {
      paramViewGroup = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904219, null);
      paramViewGroup.setLayoutParams(new AbsListView.LayoutParams(jdField_a_of_type_Int, jdField_a_of_type_Int));
      paramView = new AIOPhotoListAdapter.Holder(this);
      jdField_a_of_type_ComTencentImageURLImageView = ((URLImageView)paramViewGroup.findViewById(2131301833));
      jdField_a_of_type_ComTencentImageURLImageView.setAdjustViewBounds(false);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131301834));
      b = ((ImageView)paramViewGroup.findViewById(2131300831));
      c = ((ImageView)paramViewGroup.findViewById(2131301835));
      paramViewGroup.setTag(paramView);
    }
    a(a(paramInt), paramViewGroup);
    return paramViewGroup;
  }
}
