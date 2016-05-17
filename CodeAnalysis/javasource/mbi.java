import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.MediaScanner;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.AlbumThumbDownloader;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.widget.NumberCheckBox;
import com.tencent.widget.AbsListView.LayoutParams;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class mbi
  extends BaseAdapter
{
  Resources jdField_a_of_type_AndroidContentResResources;
  ColorDrawable jdField_a_of_type_AndroidGraphicsDrawableColorDrawable;
  Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  public ArrayList a;
  
  public mbi(PhotoListActivity paramPhotoListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_AndroidGraphicsDrawableColorDrawable = new ColorDrawable(570425344);
    jdField_a_of_type_AndroidViewLayoutInflater = paramPhotoListActivity.getLayoutInflater();
    jdField_a_of_type_AndroidContentResResources = paramPhotoListActivity.getResources();
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = jdField_a_of_type_AndroidContentResResources.getDrawable(2130841556);
  }
  
  public LocalMediaInfo a(int paramInt)
  {
    return (LocalMediaInfo)jdField_a_of_type_JavaUtilArrayList.get(paramInt);
  }
  
  String a(long paramLong)
  {
    paramLong /= 1000L;
    int i = (int)paramLong % 60;
    int j = (int)paramLong / 60;
    String str1;
    if (i > 9)
    {
      str1 = String.valueOf(i);
      if (j <= 9) {
        break label105;
      }
    }
    label105:
    for (String str2 = String.valueOf(j);; str2 = "0" + String.valueOf(j))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(str2).append(":").append(str1);
      return localStringBuilder.toString();
      str1 = "0" + String.valueOf(i);
      break;
    }
  }
  
  public void a(List paramList)
  {
    jdField_a_of_type_JavaUtilArrayList.clear();
    if ((paramList == null) || (paramList.size() == 0)) {
      return;
    }
    jdField_a_of_type_JavaUtilArrayList.addAll(paramList);
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public int getItemViewType(int paramInt)
  {
    return AlbumUtil.a((LocalMediaInfo)jdField_a_of_type_JavaUtilArrayList.get(paramInt));
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i = getItemViewType(paramInt);
    Object localObject1;
    switch (i)
    {
    default: 
      localObject1 = paramView;
      return localObject1;
    case 0: 
      if (paramView == null)
      {
        paramView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904219, null);
        paramView.setLayoutParams(new AbsListView.LayoutParams(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.g, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.h));
        paramViewGroup = new mbj(this);
        jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301833));
        b = ((ImageView)paramView.findViewById(2131301834));
        c = ((ImageView)paramView.findViewById(2131300831));
        jdField_a_of_type_AndroidViewView = paramView.findViewById(2131301836);
        jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox = ((NumberCheckBox)paramView.findViewById(2131301837));
        jdField_a_of_type_Mbg = new mbg(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity);
        if (jdField_a_of_type_AndroidViewView != null) {
          jdField_a_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_Mbg);
        }
        paramView.setTag(paramViewGroup);
        if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.f) {
          break label1256;
        }
        jdField_a_of_type_AndroidViewView.setVisibility(0);
      }
      break;
    }
    label209:
    label771:
    label840:
    label1072:
    label1095:
    label1253:
    label1256:
    for (;;)
    {
      jdField_a_of_type_Mbg.a(paramInt);
      jdField_a_of_type_Mbg.a(jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox);
      localObject1 = jdField_a_of_type_AndroidWidgetImageView;
      ((ImageView)localObject1).setAdjustViewBounds(false);
      LocalMediaInfo localLocalMediaInfo = a(paramInt);
      paramView.setContentDescription(PhotoUtils.a(i, localLocalMediaInfo, paramInt));
      int j = AlbumThumbDownloader.a;
      g = j;
      f = j;
      Object localObject2 = jdField_a_of_type_ComTencentImageURLDrawable;
      Object localObject3 = new StringBuilder("albumthumb");
      ((StringBuilder)localObject3).append("://");
      ((StringBuilder)localObject3).append(a);
      if ((localObject2 == null) || (!((URLDrawable)localObject2).getURL().toString().equals(((StringBuilder)localObject3).toString())))
      {
        localObject3 = URLDrawableHelper.a(AlbumUtil.a(localLocalMediaInfo), jdField_a_of_type_AndroidGraphicsDrawableColorDrawable, jdField_a_of_type_AndroidGraphicsDrawableDrawable);
        ((URLDrawable)localObject3).setTag(localLocalMediaInfo);
        ((ImageView)localObject1).setImageDrawable((Drawable)localObject3);
        jdField_a_of_type_ComTencentImageURLDrawable = ((URLDrawable)localObject3);
        if (localObject2 != null) {
          ((URLDrawable)localObject2).cancelDownload();
        }
      }
      localObject1 = b;
      j = jdField_b_of_type_Int;
      if (j == 1)
      {
        ((ImageView)localObject1).setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setCheckedNumber(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.indexOf(a) + 1);
        if (paramView.getBackground() != null) {
          paramView.setBackgroundDrawable(null);
        }
      }
      for (;;)
      {
        localObject1 = paramView;
        if (!AppSetting.i) {
          break;
        }
        localObject1 = PhotoUtils.a(i, localLocalMediaInfo, paramInt, jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.isChecked());
        jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setContentDescription((CharSequence)localObject1);
        return paramView;
        paramViewGroup = (mbj)paramView.getTag();
        break label209;
        if (j == 3)
        {
          ((ImageView)localObject1).setVisibility(4);
          jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
          if (!jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.t)
          {
            if (paramView.getBackground() == null) {
              paramView.setBackgroundResource(2130837632);
            }
          }
          else {
            paramView.setBackgroundDrawable(null);
          }
        }
        else
        {
          ((ImageView)localObject1).setVisibility(4);
          jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
          if (paramView.getBackground() != null) {
            paramView.setBackgroundDrawable(null);
          }
        }
      }
      if (paramView == null)
      {
        paramView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904317, null);
        paramView.setLayoutParams(new AbsListView.LayoutParams(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.g, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.h));
        paramViewGroup = new mbj(this);
        jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301833));
        jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131302218));
        b = ((ImageView)paramView.findViewById(2131301834));
        c = ((ImageView)paramView.findViewById(2131300831));
        jdField_a_of_type_AndroidViewView = paramView.findViewById(2131301836);
        jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox = ((NumberCheckBox)paramView.findViewById(2131301837));
        jdField_a_of_type_Mbg = new mbg(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity);
        if (jdField_a_of_type_AndroidViewView != null) {
          jdField_a_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_Mbg);
        }
        paramView.setTag(paramViewGroup);
        if ((jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.f) || (!jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.B)) {
          break label1253;
        }
        jdField_a_of_type_AndroidViewView.setVisibility(0);
      }
      for (;;)
      {
        jdField_a_of_type_Mbg.a(paramInt);
        jdField_a_of_type_Mbg.a(jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox);
        localObject2 = jdField_a_of_type_AndroidWidgetImageView;
        ((ImageView)localObject2).setAdjustViewBounds(false);
        localLocalMediaInfo = a(paramInt);
        paramView.setContentDescription(PhotoUtils.a(i, localLocalMediaInfo, paramInt));
        if (jdField_b_of_type_Boolean == true)
        {
          localObject1 = AlbumUtil.a(localLocalMediaInfo, "VIDEO");
          i = AlbumThumbDownloader.a;
          g = i;
          f = i;
          localObject3 = jdField_a_of_type_ComTencentImageURLDrawable;
          if ((localObject3 == null) || (!((URLDrawable)localObject3).getURL().equals(localObject1)))
          {
            localObject1 = URLDrawableHelper.a((URL)localObject1, jdField_a_of_type_AndroidGraphicsDrawableColorDrawable, jdField_a_of_type_AndroidGraphicsDrawableDrawable);
            ((URLDrawable)localObject1).setTag(localLocalMediaInfo);
            ((ImageView)localObject2).setImageDrawable((Drawable)localObject1);
            jdField_a_of_type_ComTencentImageURLDrawable = ((URLDrawable)localObject1);
            if (localObject3 != null) {
              ((URLDrawable)localObject3).cancelDownload();
            }
          }
          localObject1 = jdField_a_of_type_AndroidWidgetTextView;
          if ((jdField_b_of_type_Boolean) || (e > 0L)) {
            break label1072;
          }
          ((TextView)localObject1).setVisibility(8);
          localObject1 = MediaScanner.a(BaseApplicationImpl.getContext());
          if (localObject1 != null) {
            ((MediaScanner)localObject1).a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity, localLocalMediaInfo, paramInt);
          }
        }
        for (;;)
        {
          localObject1 = b;
          paramInt = jdField_b_of_type_Int;
          if (paramInt != 1) {
            break label1095;
          }
          ((ImageView)localObject1).setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setCheckedNumber(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.indexOf(a) + 1);
          localObject1 = paramView;
          if (paramView.getBackground() == null) {
            break;
          }
          paramView.setBackgroundDrawable(null);
          return paramView;
          paramViewGroup = (mbj)paramView.getTag();
          break label771;
          localObject1 = AlbumUtil.a(localLocalMediaInfo, "APP_VIDEO");
          break label840;
          ((TextView)localObject1).setVisibility(0);
          ((TextView)localObject1).setText(a(e));
        }
        if (paramInt == 3)
        {
          ((ImageView)localObject1).setVisibility(4);
          jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
          if (!jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.t)
          {
            localObject1 = paramView;
            if (paramView.getBackground() != null) {
              break;
            }
            paramView.setBackgroundResource(2130837632);
            return paramView;
          }
          paramView.setBackgroundDrawable(null);
          return paramView;
        }
        ((ImageView)localObject1).setVisibility(4);
        jdField_a_of_type_ComTencentMobileqqWidgetNumberCheckBox.setChecked(false);
        localObject1 = paramView;
        if (paramView.getBackground() == null) {
          break;
        }
        paramView.setBackgroundDrawable(null);
        return paramView;
        if (paramView == null)
        {
          paramView = new ImageView(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity);
          paramView.setLayoutParams(new AbsListView.LayoutParams(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.g, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.h));
        }
        for (;;)
        {
          paramViewGroup = (ImageView)paramView;
          paramView.setBackgroundColor(-16777216);
          paramViewGroup.setImageResource(2130838572);
          paramViewGroup.setScaleType(ImageView.ScaleType.CENTER);
          return paramView;
        }
      }
    }
  }
  
  public int getViewTypeCount()
  {
    return AlbumUtil.d.size();
  }
}
