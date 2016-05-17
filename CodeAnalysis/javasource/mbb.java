import android.content.Intent;
import android.content.res.Resources;
import android.util.Pair;
import android.view.View;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.DialogUtil.DialogOnClickAdapter;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.GestureSelectGridView;
import java.util.ArrayList;
import java.util.HashMap;

public class mbb
  implements AdapterView.OnItemClickListener
{
  public mbb(PhotoListActivity paramPhotoListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (!a.t) {
      a.t = true;
    }
    switch (a.jdField_a_of_type_Mbi.getItemViewType(paramInt))
    {
    default: 
    case 0: 
    case 1: 
      do
      {
        do
        {
          do
          {
            return;
            if (a.f)
            {
              paramAdapterView = a.jdField_a_of_type_Mbi.a(paramInt);
              a.b(jdField_a_of_type_JavaLangString);
              return;
            }
            AlbumUtil.a();
            paramAdapterView = a.getIntent();
            paramAdapterView.putExtra("ALBUM_NAME", a.i);
            paramAdapterView.putExtra("ALBUM_ID", a.j);
            paramAdapterView.putExtra("PhotoConst.IS_OVERLOAD", a.s);
            if (!a.s) {
              paramAdapterView.putStringArrayListExtra("PhotoConst.PHOTO_PATHS", a.jdField_b_of_type_JavaUtilArrayList);
            }
            paramAdapterView.putStringArrayListExtra("PhotoConst.SELECTED_PATHS", a.jdField_c_of_type_JavaUtilArrayList);
            paramAdapterView.putIntegerArrayListExtra("PhotoConst.SELECTED_INDEXS", a.jdField_d_of_type_JavaUtilArrayList);
            paramAdapterView.putExtra("FROM_WHERE", "FROM_PHOTO_LIST");
            paramAdapterView.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", a.p);
            paramAdapterView.putExtra("PhotoConst.SHOW_ALBUM", true);
            paramAdapterView.putExtra("PhotoConst.SHOW_MAGIC_USE_PASTER", a.jdField_k_of_type_Boolean);
            paramAdapterView.putExtra("PasterConstants.paster_id", a.jdField_k_of_type_JavaLangString);
            paramAdapterView.putExtra("PasterConstants.paster_cate_id", a.l);
            PhotoListActivity.q = a.jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s();
            paramView = a.jdField_a_of_type_Mbi.a(paramInt);
            if (AlbumUtil.a(paramView) == 0) {
              paramAdapterView.putExtra("PhotoConst.CURRENT_SELECTED_INDEX", jdField_a_of_type_JavaLangInteger);
            }
            paramAdapterView.putExtra("PasterConstants.pasters_data", a.jdField_b_of_type_JavaUtilHashMap);
            paramAdapterView.setClass(a, PhotoPreviewActivity.class);
            paramAdapterView.addFlags(603979776);
            if ((a.jdField_c_of_type_JavaUtilArrayList != null) && (a.jdField_c_of_type_JavaUtilArrayList.size() > 0)) {
              ReportController.b(null, "CliOper", "", a.m, "0X8005674", "0X8005674", 0, a.jdField_c_of_type_JavaUtilArrayList.size(), 0, "", "", "", "");
            }
            a.startActivity(paramAdapterView);
            PhotoListActivity.a(a);
            AlbumUtil.a(a, true, true);
            return;
            if ((!a.B) && (!a.jdField_c_of_type_JavaUtilArrayList.isEmpty()))
            {
              paramAdapterView = DialogUtil.a(a, 230);
              paramAdapterView.setMessage("不能同时选择照片和视频");
              paramAdapterView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
              paramAdapterView.show();
              return;
            }
            if (!Utils.d())
            {
              QQToast.a(a, a.getResources().getString(2131368675), 0).a();
              return;
            }
            paramAdapterView = a.jdField_a_of_type_Mbi.a(paramInt);
          } while (paramAdapterView == null);
          if (jdField_b_of_type_Long <= a.jdField_b_of_type_Long) {
            break;
          }
          paramAdapterView = DialogUtil.a(a, "你选择的视频文件过大，无法发送");
          paramAdapterView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
          paramAdapterView.show();
        } while (!a.z);
        paramAdapterView = a.getIntent().getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
        paramView = new Intent("key_video_size_overflow");
        paramView.putExtra("className", paramAdapterView);
        a.sendBroadcast(paramView);
        return;
        if ((!a.z) || (e - a.jdField_c_of_type_Long <= 999L)) {
          break;
        }
        paramAdapterView = DialogUtil.a(a, "你选择的视频时间过长，无法发送");
        paramAdapterView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
        paramAdapterView.show();
        paramAdapterView = a.getIntent().getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
      } while (!a.z);
      paramView = new Intent("key_video_time_overflow");
      paramView.putExtra("className", paramAdapterView);
      a.sendBroadcast(paramView);
      return;
      paramView = AlbumUtil.c;
      if (!paramView.containsKey(jdField_a_of_type_JavaLangString))
      {
        localObject = new Pair(a.j, a.i);
        paramView.put(jdField_a_of_type_JavaLangString, localObject);
      }
      a.a(jdField_a_of_type_JavaLangString);
      paramView = a.getIntent();
      if ("qzone_plugin.apk".equals(paramView.getStringExtra("PhotoConst.PLUGIN_APK")))
      {
        if (paramView.getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME").contains("TrimVideoActivity")) {
          break label1028;
        }
        if ((!a.jdField_d_of_type_Boolean) && (e <= a.jdField_c_of_type_Long)) {
          break label954;
        }
        a.jdField_c_of_type_Boolean = true;
      }
      while (!a.jdField_c_of_type_Boolean)
      {
        paramView.putExtra("file_send_path", jdField_a_of_type_JavaLangString);
        paramView.putExtra("PhotoConst.IS_VIDEO_SELECTED", true);
        paramView.putExtra("PhotoConst.VIDEO_SIZE", jdField_b_of_type_Long);
        localObject = new ArrayList();
        ((ArrayList)localObject).add(jdField_a_of_type_JavaLangString);
        PhotoUtils.a(a, paramView, (ArrayList)localObject, 2, false);
        return;
        label954:
        a.jdField_c_of_type_Boolean = false;
        paramView.putExtra("support_record", false);
        paramView.putExtra("support_trim", true);
        paramView.putExtra("PhotoConst.IS_CALL_IN_PLUGIN", false);
        paramView.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
        paramView.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", "cooperation.qzone.QZoneVideoDownloadActivity");
        paramView.putExtra("PhotoConst.SHOW_MAGIC_USE_PASTER", a.jdField_k_of_type_Boolean);
      }
      label1028:
      Object localObject = a;
      if (e > a.jdField_c_of_type_Long) {}
      for (boolean bool = true;; bool = false)
      {
        jdField_c_of_type_Boolean = bool;
        paramView.putExtra("PhotoConst.IS_PREVIEW_VIDEO", a.jdField_c_of_type_Boolean);
        break;
      }
      localObject = new Intent(a, ShortVideoPreviewActivity.class);
      ((Intent)localObject).putExtra("file_send_path", jdField_a_of_type_JavaLangString);
      ((Intent)localObject).putExtra("file_send_size", jdField_b_of_type_Long);
      ((Intent)localObject).putExtra("file_send_duration", e);
      ((Intent)localObject).putExtra("file_width", i);
      ((Intent)localObject).putExtra("file_height", j);
      ((Intent)localObject).putExtra("uin", a.r);
      ((Intent)localObject).putExtra("uintype", a.o);
      ((Intent)localObject).putExtra("file_source", "album");
      ((Intent)localObject).putExtra("is_from_system_media", jdField_b_of_type_Boolean);
      ((Intent)localObject).putExtras(paramView);
      ((Intent)localObject).putExtra("PhotoConst.IS_FROM_TROOP_BAR", a.z);
      if (a.B)
      {
        ((Intent)localObject).putExtra("PhotoConst.IS_SUPPORT_VIDEO_CHECKBOX", true);
        ((Intent)localObject).putExtra("PhotoConst.PHOTO_PATHS", a.jdField_c_of_type_JavaUtilArrayList);
      }
      a.startActivityForResult((Intent)localObject, 17);
      return;
    }
    if (!Utils.d())
    {
      QQToast.a(a, a.getResources().getString(2131368675), 0).a();
      return;
    }
    a.g();
  }
}
