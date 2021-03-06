package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import java.util.ArrayList;

public class AdobeUploadErrorSummaryFragment
  extends DialogFragment
{
  public static String ERROR_LIST_KEY = "errorlist_key";
  private ArrayList<AdobeCCFilesUploadAssetData> _failedAssetsList;
  private ListView _upload_failed_assets_listview;
  
  public AdobeUploadErrorSummaryFragment() {}
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(1, 0);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_assetview_upload_error_details_dialog, paramViewGroup, false);
    paramViewGroup = new float[8];
    float f = getResources().getDimension(R.dimen.fragment_detail_footer_border_left_radius);
    paramViewGroup[3] = f;
    paramViewGroup[2] = f;
    paramViewGroup[1] = f;
    paramViewGroup[0] = f;
    paramViewGroup = new ShapeDrawable(new RoundRectShape(paramViewGroup, null, null));
    paramViewGroup.getPaint().setColor(-1);
    paramLayoutInflater.setBackground(paramViewGroup);
    _upload_failed_assets_listview = ((ListView)paramLayoutInflater.findViewById(R.id.assetview_upload_error_detials_main_list));
    if ((_failedAssetsList != null) && (getActivity() != null))
    {
      paramViewGroup = new UploadErrorDetailsListAdapter(getActivity(), R.layout.adobe_assetview_upload_failed_assets_list_item);
      _upload_failed_assets_listview.setAdapter(paramViewGroup);
    }
    return paramLayoutInflater;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    AdobeUploadThumbnailMgr.getInstance().clearBitmapCache();
  }
  
  public void setUploadFailedList(ArrayList<AdobeCCFilesUploadAssetData> paramArrayList)
  {
    _failedAssetsList = paramArrayList;
  }
  
  public class UploadErrorDetailsListAdapter
    extends ArrayAdapter<AdobeCCFilesUploadAssetData>
  {
    public UploadErrorDetailsListAdapter(Context paramContext, int paramInt)
    {
      super(paramInt);
    }
    
    public int getCount()
    {
      if (_failedAssetsList == null) {
        return 0;
      }
      return _failedAssetsList.size();
    }
    
    public AdobeCCFilesUploadAssetData getItem(int paramInt)
    {
      if ((_failedAssetsList == null) || (paramInt < 0) || (paramInt >= _failedAssetsList.size())) {
        return null;
      }
      return (AdobeCCFilesUploadAssetData)_failedAssetsList.get(paramInt);
    }
    
    public View getView(int paramInt, final View paramView, ViewGroup paramViewGroup)
    {
      Object localObject = getLayoutInflater(null);
      View localView = paramView;
      if (paramView != null)
      {
        paramView = (ViewHolder)paramView.getTag();
        paramViewGroup = _textView;
        paramView = _imageView;
      }
      for (;;)
      {
        localObject = getItem(paramInt);
        paramViewGroup.setText(title);
        paramView.setImageBitmap(null);
        AdobeUploadThumbnailMgr.getInstance().getThumbnailasBitmap((AdobeCCFilesUploadAssetData)localObject, new IAdobeGenericCompletionCallback()
        {
          public void onCompletion(Bitmap paramAnonymousBitmap)
          {
            if (paramAnonymousBitmap != null) {
              paramView.setImageBitmap(paramAnonymousBitmap);
            }
          }
        });
        return localView;
        localView = ((LayoutInflater)localObject).inflate(R.layout.adobe_assetview_upload_failed_assets_list_item, paramViewGroup, false);
        paramViewGroup = (TextView)localView.findViewById(R.id.assetview_upload_failed_asset_item_name);
        paramView = (ImageView)localView.findViewById(R.id.assetview_upload_failed_asset_item_image);
        localObject = new ViewHolder(null);
        _imageView = paramView;
        _position = paramInt;
        _textView = paramViewGroup;
        localView.setTag(localObject);
      }
    }
    
    private class ViewHolder
    {
      public ImageView _imageView;
      public int _position = -1;
      public TextView _textView;
      
      private ViewHolder() {}
    }
  }
}
