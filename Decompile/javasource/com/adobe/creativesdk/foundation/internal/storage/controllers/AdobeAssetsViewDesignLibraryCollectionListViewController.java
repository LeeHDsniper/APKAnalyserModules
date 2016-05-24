package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemCharacterStyle;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemLayoutStyle;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.integer;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToDesignLibraryCollectionData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.DesignLibrarySpacingItemDecoration;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeLibraryItemUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemBrush;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColor;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColorTheme;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemImage;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemLook;
import java.lang.ref.WeakReference;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;
import org.lucasr.twowayview.widget.GridLayoutManager;
import org.lucasr.twowayview.widget.TwoWayView;

public class AdobeAssetsViewDesignLibraryCollectionListViewController
  extends AdobeAssetsViewRecyclerListViewController
{
  private DesignLibraryCollectionListViewAdapter _collectioAdapter;
  private AdobeAssetDataSource _libraryDataSource;
  private int _numColumnsInTwoWay;
  private TwoWayView _twowayRecyclerView;
  private DesignLibrarySpacingItemDecoration _uniformItemSpacingItemDecoration;
  private int rightMargin = -1;
  
  public AdobeAssetsViewDesignLibraryCollectionListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  private void invalidateCollectionList()
  {
    _collectioAdapter.invalidateLibraryCollectionList();
    _collectioAdapter.notifyDataSetChanged();
  }
  
  protected RecyclerView.Adapter<RecyclerView.ViewHolder> createRecyclerViewAdapter(Context paramContext, RecyclerView paramRecyclerView)
  {
    _collectioAdapter = new DesignLibraryCollectionListViewAdapter(paramContext);
    return _collectioAdapter;
  }
  
  protected RecyclerView getConcreteRecyclerView(Context paramContext)
  {
    return _twowayRecyclerView;
  }
  
  protected AdobeAssetViewNavigateCommands.NavBaseCommandData getDesignLibraryCollectionNavigationCommand(AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    AdobeAssetViewNavigateCommands.NavToDesignLibraryCollectionData localNavToDesignLibraryCollectionData = new AdobeAssetViewNavigateCommands.NavToDesignLibraryCollectionData();
    collectionGUID = paramAdobeAssetLibrary.getGUID();
    collectionName = paramAdobeAssetLibrary.getName();
    collectionHref = paramAdobeAssetLibrary.getHref().toString();
    library = paramAdobeAssetLibrary;
    return localNavToDesignLibraryCollectionData;
  }
  
  protected RecyclerView.ItemDecoration getItemDecoration(RecyclerView paramRecyclerView, Context paramContext)
  {
    int i = getHostActivity().getResources().getDimensionPixelSize(R.dimen.adobe_library_items_spacing_size);
    _uniformItemSpacingItemDecoration = new DesignLibrarySpacingItemDecoration(i, i);
    _numColumnsInTwoWay = getHostActivity().getResources().getInteger(R.integer.adobe_library_collections_num_columns);
    _uniformItemSpacingItemDecoration.setFixedColumn(_numColumnsInTwoWay);
    return _uniformItemSpacingItemDecoration;
  }
  
  protected RecyclerView.LayoutManager getLayoutManager(Context paramContext)
  {
    _numColumnsInTwoWay = getHostActivity().getResources().getInteger(R.integer.adobe_library_collections_num_columns);
    return new GridLayoutManager(TwoWayLayoutManager.Orientation.VERTICAL, _numColumnsInTwoWay, 1);
  }
  
  protected View getMainRootView(Context paramContext)
  {
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.adobe_assets_library_items_view, new FrameLayout(paramContext));
    _swipeRefreshLayout = ((SwipeRefreshLayout)paramContext.findViewById(R.id.adobe_asset_libraryitemsview_swipe_refresh_layout));
    _twowayRecyclerView = ((TwoWayView)paramContext.findViewById(R.id.adobe_asset_library_design_items_twowayview));
    return paramContext;
  }
  
  protected SwipeRefreshLayout getSwipeRefreshLayout()
  {
    return _swipeRefreshLayout;
  }
  
  protected void handleItemClick(View paramView, int paramInt)
  {
    paramView = _collectioAdapter.getLibraryAtPos(paramInt);
    if (paramView != null) {
      ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).navigateToCollection(getDesignLibraryCollectionNavigationCommand(paramView));
    }
  }
  
  public void refreshDueToDataChange()
  {
    invalidateCollectionList();
  }
  
  public void refreshDueToNewItemsInsertion()
  {
    invalidateCollectionList();
  }
  
  public void setDesignLibraryCollectionsDataSource(AdobeAssetDataSource paramAdobeAssetDataSource)
  {
    _libraryDataSource = paramAdobeAssetDataSource;
  }
  
  protected class DesignLibraryCollectionListViewAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
  {
    ArrayList<AdobeAssetLibrary> _libraryCollectionsList;
    private final Context mContext;
    
    public DesignLibraryCollectionListViewAdapter(Context paramContext)
    {
      mContext = paramContext;
    }
    
    protected int getAssetsCount()
    {
      int i = 0;
      if (getLibraryList() != null) {
        i = getLibraryList().size();
      }
      return i;
    }
    
    public int getItemCount()
    {
      return getAssetsCount();
    }
    
    public AdobeAssetLibrary getLibraryAtPos(int paramInt)
    {
      ArrayList localArrayList = getLibraryList();
      if ((localArrayList != null) && (paramInt >= 0) && (paramInt < localArrayList.size())) {
        return (AdobeAssetLibrary)localArrayList.get(paramInt);
      }
      return null;
    }
    
    protected ArrayList<AdobeAssetLibrary> getLibraryList()
    {
      if ((_libraryCollectionsList == null) && (_libraryDataSource != null) && (_libraryDataSource.assetsToDisplay() != null))
      {
        Object localObject = _libraryDataSource.assetsToDisplay();
        _libraryCollectionsList = new ArrayList(((ArrayList)localObject).size());
        localObject = ((ArrayList)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          AdobeAsset localAdobeAsset = (AdobeAsset)((Iterator)localObject).next();
          if ((localAdobeAsset instanceof AdobeAssetLibrary)) {
            _libraryCollectionsList.add((AdobeAssetLibrary)localAdobeAsset);
          }
        }
      }
      return _libraryCollectionsList;
    }
    
    public void invalidateLibraryCollectionList()
    {
      _libraryCollectionsList = null;
    }
    
    public void onBindViewHolder(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      final CollectionCellViewHolder localCollectionCellViewHolder = (CollectionCellViewHolder)paramViewHolder;
      final AdobeAssetLibrary localAdobeAssetLibrary = getLibraryAtPos(paramInt);
      localCollectionCellViewHolder.setName(localAdobeAssetLibrary.getName());
      localCollectionCellViewHolder.setItemsCount(localAdobeAssetLibrary.count());
      localCollectionCellViewHolder.setLibrary(localAdobeAssetLibrary);
      Object localObject1 = null;
      paramViewHolder = null;
      Object localObject2 = new Comparator()
      {
        public int compare(Object paramAnonymousObject1, Object paramAnonymousObject2)
        {
          return ((AdobeAssetLibraryItem)paramAnonymousObject1).nameOrIdForDisplay().compareToIgnoreCase(((AdobeAssetLibraryItem)paramAnonymousObject2).nameOrIdForDisplay());
        }
      };
      Object localObject3 = new Comparator()
      {
        public int compare(Object paramAnonymousObject1, Object paramAnonymousObject2)
        {
          return ((AdobeAssetLibraryItemColor)paramAnonymousObject1).colorNameOrHexValue().compareToIgnoreCase(((AdobeAssetLibraryItemColor)paramAnonymousObject2).colorNameOrHexValue());
        }
      };
      ArrayList localArrayList = new ArrayList(localAdobeAssetLibrary.getImages().values());
      if (localArrayList.size() > 0)
      {
        Collections.sort(localArrayList, (Comparator)localObject2);
        localObject2 = (AdobeAssetLibraryItem)localArrayList.get(0);
        localObject1 = localObject2;
        if ((localObject2 instanceof AdobeAssetLibraryItemImage))
        {
          paramViewHolder = (AdobeAssetLibraryItemImage)localObject2;
          if (!paramViewHolder.getPrimaryComponentType().equals("image/vnd.adobe.shape+svg")) {
            break label177;
          }
          paramViewHolder = paramViewHolder.getRendition();
          localObject1 = localObject2;
        }
      }
      while ((paramViewHolder != null) && (localObject1 != null))
      {
        localObject1 = new IAdobeGenericCompletionCallback()
        {
          public void onCompletion(Bitmap paramAnonymousBitmap)
          {
            if (localCollectionCellViewHolder.getLibrary() == localAdobeAssetLibrary)
            {
              if (paramAnonymousBitmap != null) {
                localCollectionCellViewHolder.setImage(paramAnonymousBitmap);
              }
            }
            else {
              return;
            }
            localCollectionCellViewHolder.setEmptyCell();
          }
        };
        AdobeLibraryItemUtils.getImageRendition(paramViewHolder, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION, (IAdobeGenericCompletionCallback)localObject1);
        return;
        label177:
        paramViewHolder = paramViewHolder.getImage();
        localObject1 = localObject2;
        continue;
        localArrayList = new ArrayList(localAdobeAssetLibrary.getColorThemes().values());
        if (localArrayList.size() > 0)
        {
          Collections.sort(localArrayList, (Comparator)localObject2);
          localCollectionCellViewHolder.setColorTheme(((AdobeAssetLibraryItemColorTheme)localArrayList.get(0)).getRGBColors());
          return;
        }
        localArrayList = new ArrayList(localAdobeAssetLibrary.getColors().values());
        if (localArrayList.size() > 0)
        {
          Collections.sort(localArrayList, (Comparator)localObject3);
          localCollectionCellViewHolder.setColor(((AdobeAssetLibraryItemColor)localArrayList.get(0)).color());
          return;
        }
        localObject3 = new ArrayList(localAdobeAssetLibrary.getBrushes().values());
        if (((ArrayList)localObject3).size() > 0)
        {
          Collections.sort((List)localObject3, (Comparator)localObject2);
          localObject1 = (AdobeAssetLibraryItem)((ArrayList)localObject3).get(0);
          paramViewHolder = ((AdobeAssetLibraryItemBrush)localObject1).getRendition();
        }
        else
        {
          localObject3 = new ArrayList(localAdobeAssetLibrary.getCharacterStyles().values());
          if (((ArrayList)localObject3).size() > 0)
          {
            Collections.sort((List)localObject3, (Comparator)localObject2);
            localObject1 = (AdobeAssetLibraryItem)((ArrayList)localObject3).get(0);
            paramViewHolder = ((AdobeAssetLibraryItemCharacterStyle)localObject1).getRendition();
          }
          else
          {
            localObject3 = new ArrayList(localAdobeAssetLibrary.getLayoutStyles().values());
            if (((ArrayList)localObject3).size() > 0)
            {
              Collections.sort((List)localObject3, (Comparator)localObject2);
              localObject1 = (AdobeAssetLibraryItem)((ArrayList)localObject3).get(0);
              paramViewHolder = ((AdobeAssetLibraryItemLayoutStyle)localObject1).getRendition();
            }
            else
            {
              localObject3 = new ArrayList(localAdobeAssetLibrary.getLooks().values());
              if (((ArrayList)localObject3).size() > 0)
              {
                Collections.sort((List)localObject3, (Comparator)localObject2);
                localObject1 = (AdobeAssetLibraryItem)((ArrayList)localObject3).get(0);
                paramViewHolder = ((AdobeAssetLibraryItemLook)localObject1).getRendition();
              }
            }
          }
        }
      }
      localCollectionCellViewHolder.setEmptyCell();
    }
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return new CollectionCellViewHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_library_collection_cell, paramViewGroup, false));
    }
    
    class CollectionCellViewHolder
      extends RecyclerView.ViewHolder
    {
      RelativeLayout _colorView;
      LinearLayout _colortThemeContainer;
      TextView _countView;
      ImageView _imageView;
      AdobeAssetLibrary _libraryItem;
      TextView _titleView;
      
      public CollectionCellViewHolder(View paramView)
      {
        super();
        _colortThemeContainer = ((LinearLayout)paramView.findViewById(R.id.library_collection_cell_colortheme));
        _colorView = ((RelativeLayout)paramView.findViewById(R.id.library_collection_cell_color));
        _imageView = ((ImageView)paramView.findViewById(R.id.library_collection_cell_image));
        _titleView = ((TextView)paramView.findViewById(R.id.library_collection_cell_main_title));
        _countView = ((TextView)paramView.findViewById(R.id.library_collection_cell_count_text));
      }
      
      private void setViewVisible(View paramView)
      {
        int j = 0;
        Object localObject = _colortThemeContainer;
        if (paramView == _colortThemeContainer)
        {
          i = 0;
          ((LinearLayout)localObject).setVisibility(i);
          localObject = _colorView;
          if (paramView != _colorView) {
            break label79;
          }
          i = 0;
          label40:
          ((RelativeLayout)localObject).setVisibility(i);
          if (paramView != _imageView) {
            break label85;
          }
          i = 1;
          label56:
          paramView = _imageView;
          if (i == 0) {
            break label90;
          }
        }
        label79:
        label85:
        label90:
        for (int i = j;; i = 8)
        {
          paramView.setVisibility(i);
          return;
          i = 8;
          break;
          i = 8;
          break label40;
          i = 0;
          break label56;
        }
      }
      
      public AdobeAssetLibrary getLibrary()
      {
        return _libraryItem;
      }
      
      public void setColor(int paramInt)
      {
        setViewVisible(_colorView);
        _colorView.setBackgroundColor(paramInt);
      }
      
      public void setColorTheme(ArrayList<Integer> paramArrayList)
      {
        setViewVisible(_colortThemeContainer);
        int j = Math.min(_colortThemeContainer.getChildCount(), paramArrayList.size());
        int i = 0;
        while (i < j)
        {
          _colortThemeContainer.getChildAt(i).setBackgroundColor(((Integer)paramArrayList.get(i)).intValue());
          i += 1;
        }
      }
      
      public void setEmptyCell()
      {
        setViewVisible(_imageView);
        _imageView.setScaleType(ImageView.ScaleType.CENTER);
        _imageView.setImageResource(R.drawable.asset_browser_empty_state_files);
      }
      
      public void setImage(Bitmap paramBitmap)
      {
        setViewVisible(_imageView);
        _imageView.setImageBitmap(paramBitmap);
      }
      
      public void setItemsCount(int paramInt)
      {
        if (paramInt != 1) {}
        for (String str = String.format(mContext.getString(R.string.adobe_design_library_collection_count), new Object[] { Integer.toString(paramInt) });; str = mContext.getString(R.string.adobe_design_library_collection_count_single))
        {
          _countView.setText(str);
          return;
        }
      }
      
      public void setLibrary(AdobeAssetLibrary paramAdobeAssetLibrary)
      {
        _libraryItem = paramAdobeAssetLibrary;
      }
      
      public void setName(String paramString)
      {
        _titleView.setText(paramString);
      }
    }
  }
}
