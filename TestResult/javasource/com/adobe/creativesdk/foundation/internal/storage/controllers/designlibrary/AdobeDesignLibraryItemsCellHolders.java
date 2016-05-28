package com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary;

import android.graphics.Bitmap;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import com.etsy.android.grid.util.DynamicHeightImageView;
import java.util.ArrayList;

public class AdobeDesignLibraryItemsCellHolders
{
  public static abstract class BaseCellHolder
    extends RecyclerView.ViewHolder
  {
    private AdobeAssetLibraryItem _libraryItem;
    
    public BaseCellHolder(View paramView)
    {
      super();
    }
    
    public AdobeAssetLibraryItem getLibraryItem()
    {
      return _libraryItem;
    }
    
    public void setDisabled(boolean paramBoolean)
    {
      View localView = itemView;
      if (paramBoolean) {}
      for (float f = 0.3F;; f = 1.0F)
      {
        localView.setAlpha(f);
        return;
      }
    }
    
    public void setLibraryItem(AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
    {
      _libraryItem = paramAdobeAssetLibraryItem;
    }
  }
  
  public static class ColorCellHolder
    extends AdobeDesignLibraryItemsCellHolders.BaseCellHolder
  {
    private RelativeLayout _colorView;
    private TextView _titleView;
    
    public ColorCellHolder(View paramView)
    {
      super();
      _titleView = ((TextView)paramView.findViewById(R.id.adobe_library_items_color_rgb_text));
      _colorView = ((RelativeLayout)paramView.findViewById(R.id.adobe_library_items_color_cell_background));
    }
    
    public void setColor(int paramInt)
    {
      _colorView.setBackgroundColor(paramInt);
    }
    
    public void setColorRgbText(String paramString)
    {
      _titleView.setText(paramString);
    }
  }
  
  public static class ColorThemeCellHolder
    extends AdobeDesignLibraryItemsCellHolders.BaseCellHolder
  {
    private LinearLayout _mainView;
    private TextView _titleView;
    
    public ColorThemeCellHolder(View paramView)
    {
      super();
      _mainView = ((LinearLayout)paramView.findViewById(R.id.adobe_library_items_colortheme_container));
      _titleView = ((TextView)paramView.findViewById(R.id.adobe_library_items_colortheme_text));
    }
    
    public void setRgbColors(ArrayList<Integer> paramArrayList)
    {
      int j = Math.min(_mainView.getChildCount(), paramArrayList.size());
      int i = 0;
      while (i < j)
      {
        _mainView.getChildAt(i).setBackgroundColor(((Integer)paramArrayList.get(i)).intValue());
        i += 1;
      }
    }
    
    public void setTitle(String paramString)
    {
      _titleView.setText(paramString);
    }
  }
  
  public static class HeaderCellHolder
    extends AdobeDesignLibraryItemsCellHolders.BaseCellHolder
  {
    private TextView _titleView;
    
    public HeaderCellHolder(View paramView)
    {
      super();
      _titleView = ((TextView)paramView.findViewById(R.id.adobe_library_items_header_text_id));
    }
    
    public void setTitle(String paramString)
    {
      _titleView.setText(paramString);
    }
  }
  
  public static class ImageCollectionCellHolder
    extends AdobeDesignLibraryItemsCellHolders.BaseCellHolder
  {
    private DynamicHeightImageView _dynamicImageView;
    private TextView _titleView;
    
    public ImageCollectionCellHolder(View paramView)
    {
      super();
      _titleView = ((TextView)paramView.findViewById(R.id.adobe_library_items_imagecolletion_title));
      _dynamicImageView = ((DynamicHeightImageView)paramView.findViewById(R.id.adobe_library_items_imagecollection_image));
      _dynamicImageView.setHeightRatio(1.0D);
    }
    
    public void displayThumbnail(Bitmap paramBitmap, double paramDouble)
    {
      _dynamicImageView.setImageBitmap(paramBitmap);
    }
    
    public void setDisabled(boolean paramBoolean)
    {
      float f2 = 0.3F;
      Object localObject = _dynamicImageView;
      if (paramBoolean)
      {
        f1 = 0.3F;
        ((DynamicHeightImageView)localObject).setAlpha(f1);
        localObject = _titleView;
        if (!paramBoolean) {
          break label46;
        }
      }
      label46:
      for (float f1 = f2;; f1 = 1.0F)
      {
        ((TextView)localObject).setAlpha(f1);
        return;
        f1 = 1.0F;
        break;
      }
    }
    
    public void setImageHeightRatio(double paramDouble)
    {
      _dynamicImageView.setHeightRatio(paramDouble);
    }
    
    public void setTitle(String paramString)
    {
      _titleView.setText(paramString);
    }
  }
}
