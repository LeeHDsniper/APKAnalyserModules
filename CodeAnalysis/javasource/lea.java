import android.view.View;
import com.tencent.common.galleryactivity.AbstractImageAdapter;
import com.tencent.mobileqq.activity.aio.photo.AIOImageData;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListModel;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.activity.aio.photo.AIOShortVideoData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.GestureSelectGridView;

public class lea
  implements AdapterView.OnItemClickListener
{
  public lea(AIOImageListScene paramAIOImageListScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    boolean bool = true;
    AIORichMediaInfo localAIORichMediaInfo = a.a.a(paramInt);
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "onItemClick" + paramInt + " FirstVisiblePosition " + AIOImageListScene.a(a).s() + " LastVisiblePosition " + AIOImageListScene.b(a).t());
    }
    int i;
    Object localObject;
    if (AIOImageListScene.a(a))
    {
      i = a.a();
      localObject = a;
      if (i == 1)
      {
        if (!AIOShortVideoData.class.isInstance(localObject)) {
          break label192;
        }
        QQToast.a(AIOImageListScene.m(a), "不能同时选择照片和视频", 0).a();
      }
    }
    label192:
    label204:
    label215:
    label342:
    label361:
    label436:
    for (;;)
    {
      return;
      if (i == 2)
      {
        if (AIOImageData.class.isInstance(localObject)) {
          QQToast.a(AIOImageListScene.n(a), "不能同时选择照片和视频", 0).a();
        }
      }
      else {
        if ((i == 0) && (!AIOImageData.class.isInstance(localObject))) {
          break label342;
        }
      }
      if (localAIORichMediaInfo.b() == 1)
      {
        i = 1;
        localObject = a;
        if (i != 0) {
          break label361;
        }
        ((AIOImageListScene)localObject).a(localAIORichMediaInfo, bool, false);
        if (!a.a(paramView, localAIORichMediaInfo)) {
          ((AbstractImageAdapter)paramAdapterView.a()).notifyDataSetChanged();
        }
        a.t();
      }
      for (;;)
      {
        if (!QLog.isColorLevel()) {
          break label436;
        }
        QLog.d("AIOImageListScene", 2, "onItemClick" + paramInt + " FirstVisiblePosition " + AIOImageListScene.e(a).s() + " LastVisiblePosition " + AIOImageListScene.f(a).t() + " SelectedIndex = " + a.a.b());
        return;
        if (!AIOShortVideoData.class.isInstance(localObject)) {
          break;
        }
        break;
        i = 0;
        break label204;
        bool = false;
        break label215;
        a.a.a(paramInt);
        a.a.b(AIOImageListScene.c(a).s());
        a.a.c(AIOImageListScene.d(a).t());
        a.n();
        a.a("Multi_Pic_big", 1);
      }
    }
  }
}
