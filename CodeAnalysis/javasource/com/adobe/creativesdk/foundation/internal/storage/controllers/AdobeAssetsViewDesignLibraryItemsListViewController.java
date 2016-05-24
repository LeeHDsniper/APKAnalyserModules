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
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemCharacterStyle;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemLayoutStyle;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.integer;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.AdobeDesignLibraryItemsCellHolders.BaseCellHolder;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.AdobeDesignLibraryItemsCellHolders.ColorCellHolder;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.AdobeDesignLibraryItemsCellHolders.ColorThemeCellHolder;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.AdobeDesignLibraryItemsCellHolders.HeaderCellHolder;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.AdobeDesignLibraryItemsCellHolders.ImageCollectionCellHolder;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.DesignLibrarySpacingItemDecoration;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.DesignLibrarySpacingItemDecoration.MultiColumnDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeLibraryItemUtils;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeWaterFallLayoutManager;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.AdobeWaterFallLayoutManager.SectionDetailsDelegate;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.LibraryDesignItemsOneUpData;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDesignLibraryItemFilter;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDesignLibraryItemType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemBrush;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColor;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColorTheme;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemImage;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemLook;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.EnumSet;
import java.util.HashMap;
import org.lucasr.twowayview.widget.StaggeredGridLayoutManager.LayoutParams;
import org.lucasr.twowayview.widget.TwoWayView;

public class AdobeAssetsViewDesignLibraryItemsListViewController
  extends AdobeAssetsViewRecyclerListViewController
{
  private final int AdobeDesignLibraryAssetType_brush = 2;
  private final int AdobeDesignLibraryAssetType_characterStyle = 4;
  private final int AdobeDesignLibraryAssetType_color = 0;
  private final int AdobeDesignLibraryAssetType_colorTheme = 1;
  private final int AdobeDesignLibraryAssetType_image = 3;
  private final int AdobeDesignLibraryAssetType_layoutStyle = 5;
  private final int AdobeDesignLibraryAssetType_look = 6;
  private final int AdobeDesignLibraryItemsLastViewType = 6;
  private final int AdobeDesignLibrarySectionViewType = 7;
  private final int AdobeDesignLibraryViewTypesCount = 8;
  final int NUM_SECTION_TYPES = 7;
  private ArrayList<AdobeAssetLibraryItemBrush> _brushArray;
  private ArrayList<AdobeAssetLibraryItemCharacterStyle> _charStylesArray;
  private ArrayList<AdobeAssetLibraryItemColor> _colorArray;
  private ArrayList<AdobeAssetLibraryItemColorTheme> _colorThemeArray;
  private AdobeDesignLibraryCollectionConfiguration _designLibraryItemsClientConfiguration;
  private ArrayList<AdobeAssetLibraryItemImage> _imageItemsArray;
  private ArrayList<AdobeAssetLibraryItemLayoutStyle> _layoutStylesArray;
  private LibraryItemsSectionAdapter _libraryItemsAdapter;
  private ArrayList<AdobeAssetLibraryItemLook> _looksArray;
  private AdobeAssetLibrary _targetLibrary;
  private TwoWayView _twowayRecyclerView;
  private DesignLibrarySpacingItemDecoration _uniformItemSpacingItemDecoration;
  private AdobeWaterFallLayoutManager _waterFallLayoutManager;
  
  public AdobeAssetsViewDesignLibraryItemsListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  private void rebuildLibraryItems()
  {
    sortLibraryElementsIntoArraysOfValues();
  }
  
  private boolean shouldDisableLibraryItem(AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
  {
    if (AdobeAssetViewUtils.shouldEnableLokiSpecificFeatures(getHostActivity())) {
      return false;
    }
    if (((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemBrush)) || ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemLayoutStyle)) || ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemCharacterStyle)) || ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemLook))) {}
    for (int i = 1; i != 0; i = 0) {
      return true;
    }
    boolean bool2 = false;
    boolean bool1 = bool2;
    Object localObject;
    if (_designLibraryItemsClientConfiguration != null)
    {
      localObject = _designLibraryItemsClientConfiguration.getDesignLibraryItemFilter();
      bool1 = bool2;
      if (localObject != null)
      {
        localObject = ((AdobeAssetDesignLibraryItemFilter)localObject).getInclusiveDesignLibraryItems();
        bool1 = bool2;
        if (localObject != null)
        {
          if (!(paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemColor)) {
            break label125;
          }
          if (((EnumSet)localObject).contains(AdobeAssetDesignLibraryItemType.AdobeAssetDesignLibraryItemColors)) {
            break label120;
          }
          bool1 = true;
        }
      }
    }
    label120:
    label125:
    do
    {
      for (;;)
      {
        return bool1;
        bool1 = false;
      }
      if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemColorTheme))
      {
        if (!((EnumSet)localObject).contains(AdobeAssetDesignLibraryItemType.AdobeAssetDesignLibraryItemColorThemes)) {}
        for (bool1 = true;; bool1 = false) {
          break;
        }
      }
      bool1 = bool2;
    } while (!(paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemImage));
    if (!((EnumSet)localObject).contains(AdobeAssetDesignLibraryItemType.AdobeAssetDesignLibraryItemImages)) {}
    for (bool1 = true;; bool1 = false) {
      break;
    }
  }
  
  private boolean shouldDisplayExtendedLibraryItemsInOneUpView()
  {
    return AdobeAssetViewUtils.shouldEnableLokiSpecificFeatures(getHostActivity());
  }
  
  private void sortLibraryElementsIntoArraysOfValues()
  {
    Comparator local1 = new Comparator()
    {
      public int compare(Object paramAnonymousObject1, Object paramAnonymousObject2)
      {
        return ((AdobeAssetLibraryItem)paramAnonymousObject1).nameOrIdForDisplay().compareToIgnoreCase(((AdobeAssetLibraryItem)paramAnonymousObject2).nameOrIdForDisplay());
      }
    };
    _imageItemsArray = new ArrayList(_targetLibrary.getImages().values());
    Collections.sort(_imageItemsArray, local1);
    _colorThemeArray = new ArrayList(_targetLibrary.getColorThemes().values());
    Collections.sort(_colorThemeArray, local1);
    _colorArray = new ArrayList(_targetLibrary.getColors().values());
    Collections.sort(_colorArray, local1);
    _brushArray = new ArrayList(_targetLibrary.getBrushes().values());
    Collections.sort(_brushArray, local1);
    _charStylesArray = new ArrayList(_targetLibrary.getCharacterStyles().values());
    Collections.sort(_charStylesArray, local1);
    _layoutStylesArray = new ArrayList(_targetLibrary.getLayoutStyles().values());
    Collections.sort(_layoutStylesArray, local1);
    _looksArray = new ArrayList(_targetLibrary.getLooks().values());
    Collections.sort(_looksArray, local1);
  }
  
  protected RecyclerView.Adapter<RecyclerView.ViewHolder> createRecyclerViewAdapter(Context paramContext, RecyclerView paramRecyclerView)
  {
    _libraryItemsAdapter = new LibraryItemsSectionAdapter(paramContext);
    return _libraryItemsAdapter;
  }
  
  protected RecyclerView getConcreteRecyclerView(Context paramContext)
  {
    return _twowayRecyclerView;
  }
  
  protected RecyclerView.ItemDecoration getItemDecoration(RecyclerView paramRecyclerView, Context paramContext)
  {
    int i = getHostActivity().getResources().getDimensionPixelSize(R.dimen.adobe_library_items_spacing_size);
    _uniformItemSpacingItemDecoration = new DesignLibrarySpacingItemDecoration(i, i);
    _uniformItemSpacingItemDecoration.setMultiColumnDelegate(new DesignLibrarySpacingItemDecoration.MultiColumnDelegate() {});
    return _uniformItemSpacingItemDecoration;
  }
  
  protected RecyclerView.LayoutManager getLayoutManager(Context paramContext)
  {
    final int i = paramContext.getResources().getInteger(R.integer.adobe_library_items_columns_GCM);
    _waterFallLayoutManager = new AdobeWaterFallLayoutManager(i);
    paramContext = new AdobeWaterFallLayoutManager.SectionDetailsDelegate()
    {
      public int getGCMOfSpans()
      {
        return i;
      }
      
      public int getNumColumnsInSection(int paramAnonymousInt)
      {
        return ((AdobeAssetsViewDesignLibraryItemsListViewController.LibraryItemsSectionAdapter)_itemsAdapter).getNumColumnsInSection(paramAnonymousInt);
      }
    };
    _waterFallLayoutManager.setClientSectionsDelegate(paramContext);
    return _waterFallLayoutManager;
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
    int i = 1;
    paramView = ((AdobeDesignLibraryItemsCellHolders.BaseCellHolder)paramView.getTag()).getLibraryItem();
    if (paramView == null) {}
    while (shouldDisableLibraryItem(paramView)) {
      return;
    }
    LibraryDesignItemsOneUpData localLibraryDesignItemsOneUpData = new LibraryDesignItemsOneUpData();
    library = _targetLibrary;
    _itemsList = new ArrayList();
    if (_colorArray.size() > 0)
    {
      if (shouldDisableLibraryItem((AdobeAssetLibraryItem)_colorArray.get(0))) {
        break label288;
      }
      paramInt = 1;
      if (paramInt != 0) {
        _itemsList.addAll(_colorArray);
      }
    }
    if (_colorThemeArray.size() > 0)
    {
      if (shouldDisableLibraryItem((AdobeAssetLibraryItem)_colorThemeArray.get(0))) {
        break label293;
      }
      paramInt = 1;
      label133:
      if (paramInt != 0) {
        _itemsList.addAll(_colorThemeArray);
      }
    }
    if (_imageItemsArray.size() > 0) {
      if (shouldDisableLibraryItem((AdobeAssetLibraryItem)_imageItemsArray.get(0))) {
        break label298;
      }
    }
    label288:
    label293:
    label298:
    for (paramInt = i;; paramInt = 0)
    {
      if (paramInt != 0) {
        _itemsList.addAll(_imageItemsArray);
      }
      if (shouldDisplayExtendedLibraryItemsInOneUpView())
      {
        _itemsList.addAll(_brushArray);
        _itemsList.addAll(_charStylesArray);
        _itemsList.addAll(_layoutStylesArray);
        _itemsList.addAll(_looksArray);
      }
      startIndex = _itemsList.indexOf(paramView);
      ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).handleAssetClickAction(localLibraryDesignItemsOneUpData);
      return;
      paramInt = 0;
      break;
      paramInt = 0;
      break label133;
    }
  }
  
  public void refreshDueToDataChange()
  {
    _libraryItemsAdapter.invalidateAdapter();
  }
  
  public void refreshDueToNewItemsInsertion()
  {
    _libraryItemsAdapter.invalidateAdapter();
  }
  
  public void setClientViewConfiguration(AdobeDesignLibraryCollectionConfiguration paramAdobeDesignLibraryCollectionConfiguration)
  {
    _designLibraryItemsClientConfiguration = paramAdobeDesignLibraryCollectionConfiguration;
  }
  
  public void setTargetLibraryFolder(AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    _targetLibrary = paramAdobeAssetLibrary;
  }
  
  class LibraryItemsSectionAdapter
    extends AdobeAssetsViewDesignLibraryItemsListViewController.SimpleSectionedRecyclerViewAdapter
  {
    final int SECTION_VIEW_TYPES = 1;
    private SectionColumnDetais _sectionColumnCountDetails;
    private SparseArray<Integer> _sectionNumToLibrarySection;
    private final Context mContext;
    
    public LibraryItemsSectionAdapter(Context paramContext)
    {
      super(paramContext);
      mContext = paramContext;
      _sectionNumToLibrarySection = new SparseArray();
    }
    
    private void bindColorItem(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      AdobeAssetLibraryItemColor localAdobeAssetLibraryItemColor = (AdobeAssetLibraryItemColor)_colorArray.get(paramInt);
      paramViewHolder = (AdobeDesignLibraryItemsCellHolders.ColorCellHolder)paramViewHolder;
      boolean bool = AdobeAssetsViewDesignLibraryItemsListViewController.this.shouldDisableLibraryItem(localAdobeAssetLibraryItemColor);
      paramViewHolder.setLibraryItem(localAdobeAssetLibraryItemColor);
      paramViewHolder.setDisabled(bool);
      paramViewHolder.setColor(localAdobeAssetLibraryItemColor.color());
      paramViewHolder.setColorRgbText(localAdobeAssetLibraryItemColor.colorNameOrHexValue());
    }
    
    private void bindColorThemeItem(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      AdobeAssetLibraryItemColorTheme localAdobeAssetLibraryItemColorTheme = (AdobeAssetLibraryItemColorTheme)_colorThemeArray.get(paramInt);
      paramViewHolder = (AdobeDesignLibraryItemsCellHolders.ColorThemeCellHolder)paramViewHolder;
      boolean bool = AdobeAssetsViewDesignLibraryItemsListViewController.this.shouldDisableLibraryItem(localAdobeAssetLibraryItemColorTheme);
      paramViewHolder.setLibraryItem(localAdobeAssetLibraryItemColorTheme);
      paramViewHolder.setDisabled(bool);
      paramViewHolder.setRgbColors(localAdobeAssetLibraryItemColorTheme.getRGBColors());
      paramViewHolder.setTitle(localAdobeAssetLibraryItemColorTheme.nameOrIdForDisplay());
    }
    
    private void bindImageCollectionLibraryItem(int paramInt, final RecyclerView.ViewHolder paramViewHolder, AdobeAssetFile paramAdobeAssetFile, final AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
    {
      paramViewHolder = (AdobeDesignLibraryItemsCellHolders.ImageCollectionCellHolder)paramViewHolder;
      paramViewHolder.setLibraryItem(paramAdobeAssetLibraryItem);
      paramViewHolder.setTitle(paramAdobeAssetLibraryItem.nameOrIdForDisplay());
      paramViewHolder.setImageHeightRatio(getImageAspectRatioOfLibraryItem(paramInt, paramAdobeAssetLibraryItem));
      paramViewHolder.setDisabled(AdobeAssetsViewDesignLibraryItemsListViewController.this.shouldDisableLibraryItem(paramAdobeAssetLibraryItem));
      if (paramAdobeAssetFile != null)
      {
        paramViewHolder = new IAdobeGenericCompletionCallback()
        {
          public void onCompletion(Bitmap paramAnonymousBitmap)
          {
            if (paramViewHolder.getLibraryItem() == paramAdobeAssetLibraryItem) {
              paramViewHolder.displayThumbnail(paramAnonymousBitmap, 0.3D);
            }
          }
        };
        AdobeLibraryItemUtils.getImageRendition(paramAdobeAssetFile, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION, paramViewHolder);
      }
    }
    
    private double getImageAspectRatioOfLibraryItem(int paramInt, AdobeAssetLibraryItem paramAdobeAssetLibraryItem)
    {
      switch (paramInt)
      {
      }
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                return 1.0D;
                paramAdobeAssetLibraryItem = (AdobeAssetLibraryItemImage)paramAdobeAssetLibraryItem;
              } while ((paramAdobeAssetLibraryItem.getImageWidth() <= 0.0F) || (paramAdobeAssetLibraryItem.getImageHeight() <= 0.0F));
              return paramAdobeAssetLibraryItem.getImageHeight() / paramAdobeAssetLibraryItem.getImageWidth();
              paramAdobeAssetLibraryItem = (AdobeAssetLibraryItemBrush)paramAdobeAssetLibraryItem;
            } while ((paramAdobeAssetLibraryItem.getRenditionWidth() <= 0.0F) || (paramAdobeAssetLibraryItem.getRenditionHeight() <= 0.0F));
            return paramAdobeAssetLibraryItem.getRenditionHeight() / paramAdobeAssetLibraryItem.getRenditionWidth();
            paramAdobeAssetLibraryItem = (AdobeAssetLibraryItemCharacterStyle)paramAdobeAssetLibraryItem;
          } while ((paramAdobeAssetLibraryItem.getRenditionWidth() <= 0.0F) || (paramAdobeAssetLibraryItem.getRenditionHeight() <= 0.0F));
          return paramAdobeAssetLibraryItem.getRenditionHeight() / paramAdobeAssetLibraryItem.getRenditionWidth();
          paramAdobeAssetLibraryItem = (AdobeAssetLibraryItemLayoutStyle)paramAdobeAssetLibraryItem;
        } while ((paramAdobeAssetLibraryItem.getRenditionWidth() <= 0.0F) || (paramAdobeAssetLibraryItem.getRenditionHeight() <= 0.0F));
        return paramAdobeAssetLibraryItem.getRenditionHeight() / paramAdobeAssetLibraryItem.getRenditionWidth();
        paramAdobeAssetLibraryItem = (AdobeAssetLibraryItemLook)paramAdobeAssetLibraryItem;
      } while ((paramAdobeAssetLibraryItem.getRenditionWidth() <= 0.0F) || (paramAdobeAssetLibraryItem.getRenditionHeight() <= 0.0F));
      return paramAdobeAssetLibraryItem.getRenditionHeight() / paramAdobeAssetLibraryItem.getRenditionWidth();
    }
    
    private int getLibrarySectionFromRawSectionNum(int paramInt)
    {
      return ((Integer)_sectionNumToLibrarySection.get(paramInt)).intValue();
    }
    
    private void initializeSectionColumnDetails()
    {
      if (_sectionColumnCountDetails != null) {
        return;
      }
      _sectionColumnCountDetails = new SectionColumnDetais();
      _sectionColumnCountDetails.defaultColumns = mContext.getResources().getInteger(R.integer.adobe_library_items_default_columns);
      _sectionColumnCountDetails.colorSectionColumns = mContext.getResources().getInteger(R.integer.adobe_library_items_color_section_columns);
      _sectionColumnCountDetails.colorThemeSectionColumns = mContext.getResources().getInteger(R.integer.adobe_library_items_colortheme_section_columns);
      _sectionColumnCountDetails.imageSectionColumns = mContext.getResources().getInteger(R.integer.adobe_library_items_image_section_columns);
    }
    
    protected void calculateItemLayoutProperties(RecyclerView.ViewHolder paramViewHolder, AdobeAssetsViewDesignLibraryItemsListViewController.SimpleSectionedRecyclerViewAdapter.ItemPositionData paramItemPositionData)
    {
      paramViewHolder = itemView;
      paramViewHolder.setLayoutParams(_waterFallLayoutManager.getLayoutParamsForItem((StaggeredGridLayoutManager.LayoutParams)paramViewHolder.getLayoutParams(), sectionNum, isSectionHeader));
    }
    
    protected RecyclerView.ViewHolder createViewHolderOfType(ViewGroup paramViewGroup, int paramInt)
    {
      if (paramInt == 7) {
        return new AdobeDesignLibraryItemsCellHolders.HeaderCellHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_library_items_headercell, paramViewGroup, false));
      }
      if (paramInt == 0) {
        return new AdobeDesignLibraryItemsCellHolders.ColorCellHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_library_items_colorcell, paramViewGroup, false));
      }
      if (paramInt == 1) {
        return new AdobeDesignLibraryItemsCellHolders.ColorThemeCellHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_library_items_colorthemecell, paramViewGroup, false));
      }
      if ((paramInt == 2) || (paramInt == 4) || (paramInt == 3) || (paramInt == 5) || (paramInt == 6)) {
        return new AdobeDesignLibraryItemsCellHolders.ImageCollectionCellHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_library_items_imagecollectioncell, paramViewGroup, false));
      }
      return null;
    }
    
    public int getNumColumnsInSection(int paramInt)
    {
      paramInt = getLibrarySectionFromRawSectionNum(paramInt);
      initializeSectionColumnDetails();
      int i = _sectionColumnCountDetails.defaultColumns;
      switch (paramInt)
      {
      default: 
        return i;
      case 0: 
        return _sectionColumnCountDetails.colorSectionColumns;
      case 1: 
        return _sectionColumnCountDetails.colorThemeSectionColumns;
      }
      return _sectionColumnCountDetails.imageSectionColumns;
    }
    
    protected int getNumOfItemsInSection(int paramInt)
    {
      switch (getLibrarySectionFromRawSectionNum(paramInt))
      {
      default: 
        return 0;
      case 0: 
        return _colorArray.size();
      case 1: 
        return _colorThemeArray.size();
      case 2: 
        return _brushArray.size();
      case 3: 
        return _imageItemsArray.size();
      case 4: 
        return _charStylesArray.size();
      case 5: 
        return _layoutStylesArray.size();
      }
      return _looksArray.size();
    }
    
    protected int getSectionCount()
    {
      int j = 0;
      int i = j;
      if (_colorArray != null)
      {
        i = j;
        if (_colorArray.size() > 0)
        {
          _sectionNumToLibrarySection.put(0, Integer.valueOf(0));
          i = 0 + 1;
        }
      }
      j = i;
      if (_colorThemeArray != null)
      {
        j = i;
        if (_colorThemeArray.size() > 0)
        {
          _sectionNumToLibrarySection.put(i, Integer.valueOf(1));
          j = i + 1;
        }
      }
      i = j;
      if (_brushArray != null)
      {
        i = j;
        if (_brushArray.size() > 0)
        {
          _sectionNumToLibrarySection.put(j, Integer.valueOf(2));
          i = j + 1;
        }
      }
      j = i;
      if (_imageItemsArray != null)
      {
        j = i;
        if (_imageItemsArray.size() > 0)
        {
          _sectionNumToLibrarySection.put(i, Integer.valueOf(3));
          j = i + 1;
        }
      }
      i = j;
      if (_charStylesArray != null)
      {
        i = j;
        if (_charStylesArray.size() > 0)
        {
          _sectionNumToLibrarySection.put(j, Integer.valueOf(4));
          i = j + 1;
        }
      }
      j = i;
      if (_layoutStylesArray != null)
      {
        j = i;
        if (_layoutStylesArray.size() > 0)
        {
          _sectionNumToLibrarySection.put(i, Integer.valueOf(5));
          j = i + 1;
        }
      }
      i = j;
      if (_looksArray != null)
      {
        i = j;
        if (_looksArray.size() > 0)
        {
          _sectionNumToLibrarySection.put(j, Integer.valueOf(6));
          i = j + 1;
        }
      }
      return i;
    }
    
    protected int getSectionItemViewType(int paramInt1, int paramInt2)
    {
      return getLibrarySectionFromRawSectionNum(paramInt1);
    }
    
    protected int getSectionViewType(int paramInt)
    {
      return 7;
    }
    
    public void invalidateAdapter()
    {
      _sectionColumnCountDetails = null;
      AdobeAssetsViewDesignLibraryItemsListViewController.this.rebuildLibraryItems();
      super.invalidateAdapter();
    }
    
    protected void onBindViewHolderOfSection(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      int j = getLibrarySectionFromRawSectionNum(paramInt);
      AdobeDesignLibraryItemsCellHolders.HeaderCellHolder localHeaderCellHolder = (AdobeDesignLibraryItemsCellHolders.HeaderCellHolder)paramViewHolder;
      paramInt = 0;
      int i = 0;
      paramViewHolder = null;
      switch (j)
      {
      }
      for (;;)
      {
        if (i != 0) {
          paramViewHolder = String.format(getHostActivity().getResources().getString(i), new Object[] { Integer.valueOf(paramInt) });
        }
        if (paramViewHolder != null) {
          localHeaderCellHolder.setTitle(paramViewHolder);
        }
        return;
        paramInt = _colorArray.size();
        i = R.string.adobe_design_library_header_color;
        continue;
        paramInt = _colorThemeArray.size();
        i = R.string.adobe_design_library_header_colortheme;
        continue;
        paramInt = _brushArray.size();
        i = R.string.adobe_design_library_header_brushes;
        continue;
        paramInt = _imageItemsArray.size();
        i = R.string.adobe_design_library_header_graphics;
        continue;
        i = R.string.adobe_design_library_header_textstyle;
        paramInt = _charStylesArray.size();
        continue;
        i = R.string.adobe_design_library_header_layoutstyle;
        paramInt = _layoutStylesArray.size();
        continue;
        i = R.string.adobe_design_library_header_looks;
        paramInt = _looksArray.size();
      }
    }
    
    protected void onBindViewHolderOfSectionItem(RecyclerView.ViewHolder paramViewHolder, int paramInt1, int paramInt2)
    {
      paramInt1 = getLibrarySectionFromRawSectionNum(paramInt1);
      switch (paramInt1)
      {
      default: 
        return;
      case 0: 
        bindColorItem(paramViewHolder, paramInt2);
        return;
      case 1: 
        bindColorThemeItem(paramViewHolder, paramInt2);
        return;
      case 2: 
        localObject = (AdobeAssetLibraryItemBrush)_brushArray.get(paramInt2);
        bindImageCollectionLibraryItem(paramInt1, paramViewHolder, ((AdobeAssetLibraryItemBrush)localObject).getRendition(), (AdobeAssetLibraryItem)localObject);
        return;
      case 3: 
        AdobeAssetLibraryItemImage localAdobeAssetLibraryItemImage = (AdobeAssetLibraryItemImage)_imageItemsArray.get(paramInt2);
        if (localAdobeAssetLibraryItemImage.getPrimaryComponentType().equals("image/vnd.adobe.shape+svg")) {}
        for (localObject = localAdobeAssetLibraryItemImage.getRendition();; localObject = localAdobeAssetLibraryItemImage.getImage())
        {
          bindImageCollectionLibraryItem(paramInt1, paramViewHolder, (AdobeAssetFile)localObject, localAdobeAssetLibraryItemImage);
          return;
        }
      case 4: 
        localObject = (AdobeAssetLibraryItemCharacterStyle)_charStylesArray.get(paramInt2);
        bindImageCollectionLibraryItem(paramInt1, paramViewHolder, ((AdobeAssetLibraryItemCharacterStyle)localObject).getRendition(), (AdobeAssetLibraryItem)localObject);
        return;
      case 5: 
        localObject = (AdobeAssetLibraryItemLayoutStyle)_layoutStylesArray.get(paramInt2);
        bindImageCollectionLibraryItem(paramInt1, paramViewHolder, ((AdobeAssetLibraryItemLayoutStyle)localObject).getRendition(), (AdobeAssetLibraryItem)localObject);
        return;
      }
      Object localObject = (AdobeAssetLibraryItemLook)_looksArray.get(paramInt2);
      bindImageCollectionLibraryItem(paramInt1, paramViewHolder, ((AdobeAssetLibraryItemLook)localObject).getRendition(), (AdobeAssetLibraryItem)localObject);
    }
    
    class SectionColumnDetais
    {
      public int colorSectionColumns;
      public int colorThemeSectionColumns;
      public int defaultColumns;
      public int imageSectionColumns;
      
      SectionColumnDetais() {}
    }
  }
  
  public abstract class SimpleSectionedRecyclerViewAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
  {
    private int _totalItemsCount = 0;
    private final Context mContext;
    private LayoutInflater mLayoutInflater;
    private boolean mSectionInfoValid = false;
    private SparseArray<Section> mSections = new SparseArray();
    
    public SimpleSectionedRecyclerViewAdapter(Context paramContext)
    {
      mLayoutInflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
      mContext = paramContext;
    }
    
    private void buildSectionInformation()
    {
      if (mSectionInfoValid) {
        return;
      }
      int m = getSectionCount();
      Section[] arrayOfSection = new Section[m];
      int k = 0;
      int i = 0;
      int j = 0;
      while (j < m)
      {
        arrayOfSection[j] = new Section(k);
        int n = getNumOfItemsInSection(j);
        k += n;
        i += n;
        j += 1;
      }
      _totalItemsCount = (i + m);
      setSections(arrayOfSection);
      mSectionInfoValid = true;
    }
    
    protected abstract void calculateItemLayoutProperties(RecyclerView.ViewHolder paramViewHolder, ItemPositionData paramItemPositionData);
    
    protected abstract RecyclerView.ViewHolder createViewHolderOfType(ViewGroup paramViewGroup, int paramInt);
    
    public int getItemCount()
    {
      buildSectionInformation();
      return getTotalItemCount();
    }
    
    public long getItemId(int paramInt)
    {
      return Integer.MAX_VALUE - paramInt;
    }
    
    public ItemPositionData getItemPositionDataFromGlobalPosition(int paramInt)
    {
      int j = 0;
      boolean bool2 = false;
      int m = -1;
      int i = mSections.size() - 1;
      for (;;)
      {
        boolean bool1 = bool2;
        int k = m;
        if (i >= 0)
        {
          k = mSections.valueAt(i)).sectionedPosition;
          j = i;
          if (k != paramInt) {
            break label94;
          }
          bool1 = true;
          k = m;
        }
        for (;;)
        {
          ItemPositionData localItemPositionData = new ItemPositionData();
          sectionNum = j;
          positionWithinSection = k;
          isSectionHeader = bool1;
          return localItemPositionData;
          label94:
          if (k >= paramInt) {
            break;
          }
          k = paramInt - k - 1;
          bool1 = bool2;
        }
        i -= 1;
      }
    }
    
    public int getItemViewType(int paramInt)
    {
      ItemPositionData localItemPositionData = getItemPositionDataFromGlobalPosition(paramInt);
      if (isSectionHeader) {
        return getSectionViewType(sectionNum);
      }
      return getSectionItemViewType(sectionNum, positionWithinSection);
    }
    
    protected abstract int getNumOfItemsInSection(int paramInt);
    
    protected abstract int getSectionCount();
    
    protected abstract int getSectionItemViewType(int paramInt1, int paramInt2);
    
    protected abstract int getSectionViewType(int paramInt);
    
    protected int getTotalItemCount()
    {
      return _totalItemsCount;
    }
    
    public void invalidateAdapter()
    {
      mSectionInfoValid = false;
      notifyDataSetChanged();
    }
    
    public void onBindViewHolder(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      ItemPositionData localItemPositionData = getItemPositionDataFromGlobalPosition(paramInt);
      if (isSectionHeader) {
        onBindViewHolderOfSection(paramViewHolder, sectionNum);
      }
      for (;;)
      {
        calculateItemLayoutProperties(paramViewHolder, localItemPositionData);
        itemView.setTag(paramViewHolder);
        return;
        onBindViewHolderOfSectionItem(paramViewHolder, sectionNum, positionWithinSection);
      }
    }
    
    protected abstract void onBindViewHolderOfSection(RecyclerView.ViewHolder paramViewHolder, int paramInt);
    
    protected abstract void onBindViewHolderOfSectionItem(RecyclerView.ViewHolder paramViewHolder, int paramInt1, int paramInt2);
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return createViewHolderOfType(paramViewGroup, paramInt);
    }
    
    public void setSections(Section[] paramArrayOfSection)
    {
      mSections.clear();
      Arrays.sort(paramArrayOfSection, new Comparator()
      {
        public int compare(AdobeAssetsViewDesignLibraryItemsListViewController.SimpleSectionedRecyclerViewAdapter.Section paramAnonymousSection1, AdobeAssetsViewDesignLibraryItemsListViewController.SimpleSectionedRecyclerViewAdapter.Section paramAnonymousSection2)
        {
          if (firstPosition == firstPosition) {
            return 0;
          }
          if (firstPosition < firstPosition) {
            return -1;
          }
          return 1;
        }
      });
      int j = 0;
      int k = paramArrayOfSection.length;
      int i = 0;
      while (i < k)
      {
        Section localSection = paramArrayOfSection[i];
        sectionedPosition = (firstPosition + j);
        mSections.append(sectionedPosition, localSection);
        j += 1;
        i += 1;
      }
      notifyDataSetChanged();
    }
    
    public class ItemPositionData
    {
      public boolean isSectionHeader;
      public int positionWithinSection;
      public int sectionNum;
      
      public ItemPositionData() {}
    }
    
    public class Section
    {
      int firstPosition;
      int sectionedPosition;
      
      public Section(int paramInt)
      {
        firstPosition = paramInt;
      }
    }
  }
}
