package com.tencent.mobileqq.activity.aio;

import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.aio.item.PicItemBuilder;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;

public class MixedImageOnclickListener
  implements View.OnClickListener
{
  private long a;
  public SessionInfo a;
  
  public MixedImageOnclickListener()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 0L;
  }
  
  public void onClick(View paramView)
  {
    long l = System.currentTimeMillis();
    if (l - jdField_a_of_type_Long < 1000L) {}
    URLImageView localURLImageView;
    MessageForPic localMessageForPic;
    URLDrawable localURLDrawable;
    do
    {
      do
      {
        return;
        jdField_a_of_type_Long = l;
        localURLImageView = (URLImageView)paramView;
        localMessageForPic = (MessageForPic)localURLImageView.getTag(2131296339);
        localURLDrawable = (URLDrawable)localURLImageView.getDrawable();
        switch (localURLDrawable.getStatus())
        {
        default: 
          return;
        }
      } while (localURLDrawable.isDownloadStarted());
      localURLDrawable.startDownload();
      return;
    } while (!FileUtils.a(paramView.getContext()));
    localURLDrawable.restartDownload();
    return;
    PicItemBuilder.a(paramView.getContext(), localURLImageView, localMessageForPic, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
  }
}
