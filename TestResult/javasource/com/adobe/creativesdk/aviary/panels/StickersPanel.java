package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.app.AlertDialog.Builder;
import android.content.ClipData;
import android.content.ClipData.Item;
import android.content.ClipDescription;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Configuration;
import android.database.ContentObserver;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.content.Loader.OnLoadCompleteListener;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.TextUtils;
import android.util.Pair;
import android.view.DragEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.DragShadowBuilder;
import android.view.View.OnClickListener;
import android.view.View.OnDragListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.Toast;
import android.widget.ViewFlipper;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.android.ui.widget.RecyclerCursorAdapter;
import com.adobe.creativesdk.aviary.fragments.StoreContainerFragment;
import com.adobe.creativesdk.aviary.fragments.StoreContainerFragment.Builder;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.cds.Cds;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.Cds.Size;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.StickerFilter;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.graphics.drawable.FeatherDrawable;
import com.adobe.creativesdk.aviary.internal.graphics.drawable.StickerDrawable;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionFactory;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.services.ConfigService;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.MatrixUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils.MemoryInfo;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.overlays.AbstractBaseOverlay;
import com.adobe.creativesdk.aviary.overlays.StickersOverlay;
import com.adobe.creativesdk.aviary.widget.DrawableHighlightView;
import com.adobe.creativesdk.aviary.widget.DrawableHighlightView.OnContentFlipListener;
import com.adobe.creativesdk.aviary.widget.DrawableHighlightView.OnDeleteClickListener;
import com.adobe.creativesdk.aviary.widget.DrawableHighlightView.OnOpacityChangeListener;
import com.adobe.creativesdk.aviary.widget.ImageViewDrawableOverlay;
import com.aviary.android.feather.sdk.R.anim;
import com.aviary.android.feather.sdk.R.attr;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.fraction;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import it.sephiroth.android.library.picasso.LruCache;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.picasso.RequestCreator;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import junit.framework.Assert;

public class StickersPanel
  extends AbstractContentPanel
  implements Loader.OnLoadCompleteListener<Cursor>, View.OnClickListener, View.OnDragListener, SeekBar.OnSeekBarChangeListener, PacksListAdapter.OnItemClickListener, SimpleStatusMachine.OnStatusChangeListener, DrawableHighlightView.OnContentFlipListener, DrawableHighlightView.OnDeleteClickListener, DrawableHighlightView.OnOpacityChangeListener
{
  private int mAccentColor;
  protected PacksListAdapter mAdapterPacks;
  protected StickersAdapter mAdapterStickers;
  protected LruCache mCache;
  private Canvas mCanvas;
  private ConfigService mConfigService;
  protected final ContentObserver mContentObserver = new ContentObserver(new Handler())
  {
    public void onChange(boolean paramAnonymousBoolean)
    {
      logger.info("mContentObserver::onChange");
      super.onChange(paramAnonymousBoolean);
      if ((isActive()) && (mCursorLoaderPacks != null) && (mCursorLoaderPacks.isStarted())) {
        mCursorLoaderPacks.onContentChanged();
      }
    }
  };
  private StickerFilter mCurrentFilter;
  protected CursorLoader mCursorLoaderPacks;
  private int mDefaultPackTextBackgroundColor;
  private boolean mFirstTime = true;
  private final List<Long> mInstalledPacks = new ArrayList();
  List<Pair<String, String>> mItemsApplied = new ArrayList(0);
  private RecyclerView mListPacks;
  private RecyclerView mListStickers;
  private int mPackCellWidth;
  private StickerPackInfo mPackInfo;
  private Picasso mPicassoLib;
  private float mScaleFactor;
  private SeekBar mSeekBar;
  private SimpleStatusMachine mStatus;
  private int mStickerThumbSize;
  int mStickersOnScreen = 0;
  private StickersOverlay mTutorialOverlay;
  private ViewFlipper mViewFlipper;
  
  public StickersPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  private void addSticker(FeatherDrawable paramFeatherDrawable, RectF paramRectF)
  {
    DrawableHighlightView localDrawableHighlightView = new DrawableHighlightView(mImageView, ((ImageViewDrawableOverlay)mImageView).getOverlayStyleId(), paramFeatherDrawable);
    localDrawableHighlightView.setOnDeleteClickListener(this);
    localDrawableHighlightView.setOnContentFlipListener(this);
    localDrawableHighlightView.setOnChangeOpacityListener(this);
    Matrix localMatrix = mImageView.getImageViewMatrix();
    int n = mImageView.getWidth();
    int i1 = mImageView.getHeight();
    int i;
    int m;
    int k;
    float f1;
    float f2;
    if (paramRectF != null)
    {
      j = (int)paramRectF.width();
      i = (int)paramRectF.height();
      m = i;
      k = j;
      paramFeatherDrawable = paramRectF;
      if (Math.max(j, i) > Math.min(mImageView.getWidth(), mImageView.getHeight()))
      {
        f1 = mImageView.getWidth() / j;
        f2 = mImageView.getHeight() / i;
        if (f1 >= f2) {
          break label467;
        }
        label158:
        k = (int)(j * (f1 / 2.0F));
        m = (int)(i * (f1 / 2.0F));
        paramFeatherDrawable = paramRectF;
        if (paramRectF == null)
        {
          i = mImageView.getWidth();
          j = mImageView.getHeight();
          paramFeatherDrawable = new RectF(i / 2 - k / 2, j / 2 - m / 2, i / 2 + k / 2, j / 2 + m / 2);
        }
        paramFeatherDrawable.inset((paramFeatherDrawable.width() - k) / 2.0F, (paramFeatherDrawable.height() - m) / 2.0F);
      }
      if (paramFeatherDrawable == null) {
        break label473;
      }
      i = (int)left;
    }
    for (int j = (int)top;; j = (i1 - m) / 2)
    {
      paramFeatherDrawable = new Matrix(localMatrix);
      paramFeatherDrawable.invert(paramFeatherDrawable);
      paramRectF = new float[4];
      paramRectF[0] = i;
      paramRectF[1] = j;
      paramRectF[2] = (i + k);
      paramRectF[3] = (j + m);
      MatrixUtils.mapPoints(paramFeatherDrawable, paramRectF);
      paramFeatherDrawable = new RectF(paramRectF[0], paramRectF[1], paramRectF[2], paramRectF[3]);
      paramRectF = new Rect(0, 0, n, i1);
      localDrawableHighlightView.setup(getContext().getBaseContext(), localMatrix, paramRectF, paramFeatherDrawable, false);
      ((ImageViewDrawableOverlay)mImageView).addHighlightView(localDrawableHighlightView);
      ((ImageViewDrawableOverlay)mImageView).setSelectedHighlightView(localDrawableHighlightView);
      ((ImageViewDrawableOverlay)mImageView).animate(localDrawableHighlightView);
      mStickersOnScreen += 1;
      return;
      j = (int)paramFeatherDrawable.getCurrentWidth();
      i = (int)paramFeatherDrawable.getCurrentHeight();
      break;
      label467:
      f1 = f2;
      break label158;
      label473:
      i = (n - k) / 2;
    }
  }
  
  private void addSticker(String paramString1, String paramString2, RectF paramRectF)
  {
    onApplyCurrent();
    Assert.assertNotNull(mPackInfo);
    Assert.assertNotNull(paramString1);
    Object localObject = new File(paramString1, Cds.getPackItemFilename(paramString2, Cds.PackType.STICKER, Cds.Size.Medium));
    logger.log("file: " + ((File)localObject).getAbsolutePath());
    if (((File)localObject).exists())
    {
      localObject = new StickerDrawable(getContext().getBaseContext().getResources(), ((File)localObject).getAbsolutePath(), paramString2, mPackInfo.packIdentifier);
      ((StickerDrawable)localObject).setAntiAlias(true);
      mCurrentFilter = new StickerFilter(paramString1, paramString2);
      mCurrentFilter.setSize(((StickerDrawable)localObject).getBitmapWidth(), ((StickerDrawable)localObject).getBitmapHeight());
      paramString1 = new HashMap();
      paramString1.put("item", paramString2);
      paramString1.put("pack", mPackInfo.packIdentifier);
      getContext().getTracker().tagEventAttributes("stickers: item_added", paramString1);
      addSticker((FeatherDrawable)localObject, paramRectF);
      return;
    }
    logger.warn("file does not exists");
    Toast.makeText(getContext().getBaseContext(), "Error loading the selected sticker", 0).show();
  }
  
  private void createAndConfigurePreview()
  {
    if ((mPreview != null) && (!mPreview.isRecycled()))
    {
      mPreview.recycle();
      mPreview = null;
    }
    mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
    mCanvas = new Canvas(mPreview);
  }
  
  private PacksListAdapter createPacksAdapter(Context paramContext, Cursor paramCursor)
  {
    return new PacksListAdapter.Builder(paramContext, this, paramCursor).setCellWidth(mPackCellWidth).setContentResId(R.layout.com_adobe_image_content_frames_item_content_item).setSupplyResId(R.layout.com_adobe_image_content_frames_item_supplies).setExternalResId(R.layout.com_adobe_image_content_frames_item_external_pack).setDividerResId(R.layout.com_adobe_image_content_frames_item_header_pack).setDefaultPackTextBackgroundColor(mDefaultPackTextBackgroundColor).setInternalResId(R.layout.com_adobe_image_content_stickers_item_internal_pack).setPackType(Cds.PackType.STICKER).setPicasso(mPicassoLib, mCache).build();
  }
  
  private void createTutorialOverlayIfNecessary(final int paramInt1, int paramInt2)
  {
    logger.info("createTutorialOverlayIfNecessary: %d, %d", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    if ((paramInt2 != 1) || (!isActive()) || (getHandler() == null)) {
      return;
    }
    getHandler().postDelayed(new Runnable()
    {
      public void run()
      {
        if (paramInt1 < 0) {
          StickersPanel.this.createTutorialOverlayIfNecessaryDelayed(paramInt1);
        }
      }
    }, 200L);
  }
  
  private boolean createTutorialOverlayIfNecessaryDelayed(int paramInt)
  {
    logger.info("createTutorialOverlayIfNecessaryDelayed: %d", new Object[] { Integer.valueOf(paramInt) });
    if ((!isActive()) || (mStatus.getCurrentStatus() != 1)) {}
    Object localObject1;
    label255:
    label272:
    label278:
    do
    {
      return false;
      int k = 1;
      int m = mListPacks.getChildCount();
      int j = -1;
      localObject1 = null;
      boolean bool1 = false;
      paramInt = 0;
      int i = k;
      Object localObject3;
      if (paramInt < m)
      {
        localObject3 = mListPacks.getChildAt(paramInt);
        bool2 = bool1;
        i = j;
        localObject2 = localObject1;
        if (localObject3 == null) {
          break label255;
        }
        localObject3 = (PacksListAdapter.BaseViewHolder)mListPacks.getChildViewHolder((View)localObject3);
        bool2 = bool1;
        i = j;
        localObject2 = localObject1;
        if (localObject3 == null) {
          break label255;
        }
        if (((PacksListAdapter.BaseViewHolder)localObject3).getItemViewType() == 2) {
          i = 0;
        }
      }
      else
      {
        if ((!bool1) || (j <= -1) || (localObject1 == null)) {
          i = 0;
        }
        if (i != 0) {
          break label278;
        }
        hideOverlay();
        return false;
      }
      boolean bool2 = bool1;
      i = j;
      Object localObject2 = localObject1;
      if (((PacksListAdapter.BaseViewHolder)localObject3).getItemViewType() == 1) {
        if (free != 1) {
          break label272;
        }
      }
      for (bool1 = true;; bool1 = false)
      {
        logger.verbose("is free: %b", new Object[] { Boolean.valueOf(bool1) });
        bool2 = bool1;
        i = j;
        localObject2 = localObject1;
        if (bool1)
        {
          i = paramInt;
          localObject2 = itemView;
          bool2 = bool1;
        }
        paramInt += 1;
        bool1 = bool2;
        j = i;
        localObject1 = localObject2;
        break;
      }
      if (mTutorialOverlay != null) {
        break;
      }
    } while (!AbstractBaseOverlay.shouldShow(getContext().getBaseContext(), 1));
    mTutorialOverlay = createTutorialOverlay(localObject1);
    return mTutorialOverlay.show();
    mTutorialOverlay.update(localObject1);
    return false;
  }
  
  private void displayIAPDialog(Bundle paramBundle)
  {
    getContext().openOrUpdateStoreDialog(paramBundle);
  }
  
  private int getCacheSize()
  {
    double[] arrayOfDouble = new double[3];
    SystemUtils.MemoryInfo.getRuntimeMemory(arrayOfDouble);
    return Math.min((int)(1048576.0D * Math.max(arrayOfDouble[0], 2.0D)), 6291456);
  }
  
  private void onApplyCurrent()
  {
    if (!stickersOnScreen()) {
      return;
    }
    Object localObject = ((ImageViewDrawableOverlay)mImageView).getHighlightViewAt(0);
    if (localObject != null)
    {
      StickerDrawable localStickerDrawable = (StickerDrawable)((DrawableHighlightView)localObject).getContent();
      RectF localRectF = ((DrawableHighlightView)localObject).getCropRectF();
      Rect localRect = new Rect((int)left, (int)top, (int)right, (int)bottom);
      Matrix localMatrix1 = ((DrawableHighlightView)localObject).getCropRotationMatrix();
      Matrix localMatrix2 = new Matrix();
      mImageView.getImageMatrix().invert(localMatrix2);
      int i = mCanvas.save(1);
      mCanvas.concat(localMatrix1);
      localStickerDrawable.setDropShadow(false);
      ((DrawableHighlightView)localObject).getContent().setBounds(localRect);
      ((DrawableHighlightView)localObject).getContent().draw(mCanvas);
      mCanvas.restoreToCount(i);
      mImageView.invalidate();
      if (mCurrentFilter != null)
      {
        i = mBitmap.getWidth();
        int j = mBitmap.getHeight();
        mCurrentFilter.setTopLeft(left / i, top / j);
        mCurrentFilter.setBottomRight(right / i, bottom / j);
        mCurrentFilter.setRotation(Math.toRadians(((DrawableHighlightView)localObject).getRotation()));
        int k = localStickerDrawable.getBitmapWidth();
        int m = localStickerDrawable.getBitmapHeight();
        float f1 = localRectF.width() / k;
        float f2 = localRectF.height() / m;
        mCurrentFilter.setCenter(localRectF.centerX() / i, localRectF.centerY() / j);
        mCurrentFilter.setScale(f1, f2);
        mCurrentFilter.setFlipH(((DrawableHighlightView)localObject).getFlipHorizontal());
        mCurrentFilter.setAlpha((int)(mSeekBar.getProgress() / 100.0D * 255.0D));
        localObject = new ToolActionVO();
        ((ToolActionVO)localObject).setPackIdentifier(localStickerDrawable.getPackIdentifier());
        ((ToolActionVO)localObject).setContentIdentifier(localStickerDrawable.getIdentifier());
        mEditResult.addToolAction((ToolActionVO)localObject);
        mEditResult.getActionList().add(mCurrentFilter.getActions().get(0));
        mItemsApplied.add(Pair.create(localStickerDrawable.getPackIdentifier(), localStickerDrawable.getIdentifier()));
        mCurrentFilter = null;
      }
    }
    mSeekBar.setProgress(100);
    onClearCurrent(false);
    onPreviewChanged(mPreview, false, false);
  }
  
  private void onClearCurrent(DrawableHighlightView paramDrawableHighlightView, boolean paramBoolean)
  {
    if (mCurrentFilter != null) {
      mCurrentFilter = null;
    }
    if (paramDrawableHighlightView != null)
    {
      Object localObject = paramDrawableHighlightView.getContent();
      if ((paramBoolean) && ((localObject instanceof StickerDrawable)))
      {
        String str = ((StickerDrawable)localObject).getIdentifier();
        localObject = ((StickerDrawable)localObject).getPackIdentifier();
        HashMap localHashMap = new HashMap();
        localHashMap.put("item", str);
        localHashMap.put("pack", localObject);
        getContext().getTracker().tagEventAttributes("stickers: item_deleted", localHashMap);
        int i = mItemsApplied.lastIndexOf(Pair.create(localObject, str));
        if (i > -1) {
          mItemsApplied.remove(i);
        }
      }
      paramDrawableHighlightView.setOnDeleteClickListener(null);
      paramDrawableHighlightView.setOnContentFlipListener(null);
    }
    ((ImageViewDrawableOverlay)mImageView).removeHightlightView(paramDrawableHighlightView);
    mImageView.invalidate();
    if (paramBoolean) {
      mStickersOnScreen -= 1;
    }
  }
  
  private void onClearCurrent(boolean paramBoolean)
  {
    if (stickersOnScreen())
    {
      onClearCurrent(((ImageViewDrawableOverlay)mImageView).getHighlightViewAt(0), paramBoolean);
      mSeekBar.setProgress(100);
    }
  }
  
  private void onSendEvents()
  {
    if (getContext() != null)
    {
      AdobeImageAnalyticsTracker localAdobeImageAnalyticsTracker = getContext().getTracker();
      Iterator localIterator = mItemsApplied.iterator();
      while (localIterator.hasNext())
      {
        Pair localPair = (Pair)localIterator.next();
        localAdobeImageAnalyticsTracker.tagEvent("stickers: item_saved", new String[] { "pack", (String)first, "item", (String)second });
      }
    }
  }
  
  private void onStickerPackSelected(long paramLong, String paramString)
  {
    logger.info("onStickerPackSelected: %d, %s", new Object[] { Long.valueOf(paramLong), paramString });
    removeIapDialog();
    mPackInfo = new StickerPackInfo(paramLong, paramString);
    mStatus.setStatus(2);
  }
  
  private void onStickersPackListUpdated(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    logger.info("onStickersPackListUpdated(%d, %b, %b)", new Object[] { Integer.valueOf(paramInt), Boolean.valueOf(paramBoolean1), Boolean.valueOf(paramBoolean2) });
    LinearLayoutManager localLinearLayoutManager;
    if (paramInt > 0) {
      if (((mFirstTime) || (paramBoolean1)) && (paramInt > 0))
      {
        localLinearLayoutManager = (LinearLayoutManager)mListPacks.getLayoutManager();
        if (!paramBoolean2) {
          break label91;
        }
        mListPacks.smoothScrollToPosition(paramInt);
      }
    }
    for (;;)
    {
      mFirstTime = false;
      return;
      paramInt = 0;
      break;
      label91:
      localLinearLayoutManager.scrollToPositionWithOffset(paramInt - 1, mPackCellWidth / 2);
    }
  }
  
  private boolean openStorePanelIfRequired(long paramLong)
  {
    if ((hasOption("quick-packId")) || (paramLong > -1L))
    {
      if (paramLong > -1L) {}
      while (paramLong > -1L)
      {
        displayIAPDialog(new StoreContainerFragment.Builder().setPackId(paramLong).setFeaturedPackId(paramLong).setPackType(Cds.PackType.STICKER).setEvent("shop_details: opened").addEventAttributes("pack", String.valueOf(paramLong)).addEventAttributes("from", "message").build());
        return true;
        Bundle localBundle = getOptions();
        paramLong = localBundle.getLong("quick-packId");
        localBundle.remove("quick-packId");
      }
    }
    return false;
  }
  
  private boolean removeIapDialog()
  {
    return getContext().closeStoreDialog();
  }
  
  private boolean stickersOnScreen()
  {
    return ((ImageViewDrawableOverlay)mImageView).getHighlightCount() > 0;
  }
  
  void askToLeaveWithoutApply()
  {
    new AlertDialog.Builder(getContext().getBaseContext()).setMessage(R.string.feather_discard_edits).setPositiveButton(R.string.feather_discard, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        getContext().cancel();
      }
    }).setNegativeButton(17039360, null).show();
  }
  
  protected StickersOverlay createTutorialOverlay(View paramView)
  {
    paramView = new StickersOverlay(getContext().getBaseActivity(), R.attr.com_adobe_image_editor_frames_overlay_style, paramView, getName(), 1);
    paramView.setTitle(AbstractPanelLoaderService.getToolDisplayName(getName()));
    return paramView;
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_stickers, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_stickers, paramViewGroup, false);
  }
  
  public boolean getIsChanged()
  {
    return (mStickersOnScreen > 0) || (stickersOnScreen());
  }
  
  protected void hideOverlay()
  {
    if (mTutorialOverlay != null) {
      mTutorialOverlay.hide();
    }
  }
  
  protected void loadStickers()
  {
    Context localContext = getContext().getBaseContext();
    if (mPackInfo == null) {
      return;
    }
    String str = CdsUtils.getPackContentPath(localContext, mPackInfo.packId);
    Cursor localCursor = localContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(localContext, "pack/" + mPackInfo.packId + "/item/list"), new String[] { "item_id as _id", "item_id", "item_packId", "item_identifier", "item_displayName" }, null, null, null);
    if (mAdapterStickers == null)
    {
      mAdapterStickers = new StickersAdapter(localContext, localCursor);
      mAdapterStickers.setContentPath(str);
      mListStickers.setAdapter(mAdapterStickers);
      return;
    }
    mAdapterStickers.setContentPath(str);
    mAdapterStickers.changeCursor(localCursor);
  }
  
  public void onActivate()
  {
    super.onActivate();
    mImageView.setImageBitmap(mPreview, null, -1.0F, 8.0F);
    mPackCellWidth = mConfigService.getDimensionPixelSize(R.dimen.com_adobe_image_editor_content_item_width);
    mStickerThumbSize = mConfigService.getDimensionPixelSize(R.dimen.com_adobe_image_editor_content_item_image_width);
    mDefaultPackTextBackgroundColor = UIUtils.getThemeColor(getContext().getBaseContext(), R.attr.colorPrimaryDark);
    UIUtils.setSeekBarProgressTint(mSeekBar, mAccentColor);
    mSeekBar.setProgress(100);
    mSeekBar.setOnSeekBarChangeListener(this);
    mStatus.setOnStatusChangeListener(this);
    updateInstalledPacks();
    getContentView().setVisibility(0);
    contentReady();
  }
  
  public boolean onBackPressed()
  {
    logger.info("onBackPressed");
    if ((mTutorialOverlay != null) && (mTutorialOverlay.onBackPressed())) {
      return true;
    }
    if (mStatus.getCurrentStatus() == 1)
    {
      if (stickersOnScreen())
      {
        askToLeaveWithoutApply();
        return true;
      }
      return false;
    }
    if (mStatus.getCurrentStatus() == 2)
    {
      int i = 0;
      if (mAdapterPacks != null) {
        i = mAdapterPacks.getItemCount();
      }
      if (i > 1)
      {
        mStatus.setStatus(1);
        return true;
      }
      if (stickersOnScreen())
      {
        askToLeaveWithoutApply();
        return true;
      }
      return false;
    }
    if (mStatus.getCurrentStatus() == 3)
    {
      DrawableHighlightView localDrawableHighlightView = ((ImageViewDrawableOverlay)mImageView).getHighlightViewAt(0);
      if (localDrawableHighlightView != null)
      {
        localDrawableHighlightView.setOpacity(localDrawableHighlightView.getConfirmedOpacity());
        mSeekBar.setProgress((int)(localDrawableHighlightView.getConfirmedOpacity() / 255.0D * 100.0D));
      }
      mStatus.setStatus(mStatus.getPreviousStatus());
      return true;
    }
    return super.onBackPressed();
  }
  
  public boolean onCancel()
  {
    if (stickersOnScreen())
    {
      askToLeaveWithoutApply();
      return true;
    }
    return super.onCancel();
  }
  
  public void onChangeOpacity()
  {
    logger.info("onChangeOpacity");
    mStatus.setStatus(3);
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (i == R.id.button_cancel)
    {
      logger.log("opacity dismiss clicked");
      paramView = ((ImageViewDrawableOverlay)mImageView).getHighlightViewAt(0);
      if (paramView != null)
      {
        paramView.setOpacity(paramView.getConfirmedOpacity());
        mSeekBar.setProgress((int)(paramView.getConfirmedOpacity() / 255.0D * 100.0D));
      }
      mStatus.setStatus(mStatus.getPreviousStatus());
    }
    while (i != R.id.button_confirm) {
      return;
    }
    logger.log("opacity confirm clicked");
    mStatus.setStatus(mStatus.getPreviousStatus());
    paramView = ((ImageViewDrawableOverlay)mImageView).getHighlightViewAt(0);
    paramView.setConfirmedOpacity(paramView.getOpacity());
  }
  
  protected void onComplete(Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
  {
    mTrackingAttributes.put("item_count", String.valueOf(mItemsApplied.size()));
    super.onComplete(paramBitmap, paramEditToolResultVO);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration1, Configuration paramConfiguration2)
  {
    super.onConfigurationChanged(paramConfiguration1, paramConfiguration2);
  }
  
  public void onContentFlip(DrawableHighlightView paramDrawableHighlightView)
  {
    logger.info("onContentFlip");
    getContext().getTracker().tagEvent("stickers: item_flipped");
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mStatus = new SimpleStatusMachine();
    mCache = new LruCache(getCacheSize());
    mInstalledPacks.clear();
    mListPacks = ((RecyclerView)getOptionView().findViewById(R.id.recyclerView));
    mListPacks.setHasFixedSize(true);
    mListPacks.setLayoutManager(new LinearLayoutManager(getContext().getBaseContext(), 0, false));
    mListStickers = ((RecyclerView)getOptionView().findViewById(R.id.recyclerView2));
    mListStickers.setHasFixedSize(true);
    mListStickers.setLayoutManager(new LinearLayoutManager(getContext().getBaseContext(), 0, false));
    mViewFlipper = ((ViewFlipper)getOptionView().findViewById(R.id.flipper));
    mImageView = ((ImageViewDrawableOverlay)getContentView().findViewById(R.id.overlay));
    mSeekBar = ((SeekBar)getOptionView().findViewById(R.id.seekbar));
    getOptionView().findViewById(R.id.button_cancel).setOnClickListener(this);
    getOptionView().findViewById(R.id.button_confirm).setOnClickListener(this);
    mConfigService = ((ConfigService)getContext().getService(ConfigService.class));
    mScaleFactor = mConfigService.getFraction(R.fraction.com_adobe_image_editor_sticker_drag_scaleFactor, 100, 1);
    logger.error("mScaleFactor: %f", new Object[] { Float.valueOf(mScaleFactor) });
    ((ImageViewDrawableOverlay)mImageView).setForceSingleSelection(false);
    ((ImageViewDrawableOverlay)mImageView).setScaleWithContent(true);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mImageView.setDoubleTapEnabled(false);
    mImageView.setOnDragListener(this);
    mEditResult.setActionList(MoaActionFactory.actionList());
    mPicassoLib = Picasso.with(getContext().getBaseContext());
    createAndConfigurePreview();
    if (getContext().hasAccentColor())
    {
      mAccentColor = getContext().getAccentColor(0);
      onSetupUiTint(mAccentColor);
      return;
    }
    mAccentColor = 0;
  }
  
  public void onDeactivate()
  {
    super.onDeactivate();
    if (mTutorialOverlay != null)
    {
      mTutorialOverlay.dismiss();
      mTutorialOverlay = null;
    }
    mStatus.setOnStatusChangeListener(null);
    mImageView.setOnDragListener(null);
    removeIapDialog();
    Context localContext = getContext().getBaseContext();
    if (mContentObserver != null) {
      localContext.getContentResolver().unregisterContentObserver(mContentObserver);
    }
    if (mCursorLoaderPacks != null)
    {
      mCursorLoaderPacks.unregisterListener(this);
      mCursorLoaderPacks.stopLoading();
    }
  }
  
  public void onDeleteClick()
  {
    logger.info("onDeleteClick");
    onClearCurrent(true);
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    mListPacks.setAdapter(null);
    mListStickers.setAdapter(null);
    if (mAdapterPacks != null) {
      IOUtils.closeSilently(mAdapterPacks.swapCursor(null));
    }
    if (mAdapterStickers != null) {
      IOUtils.closeSilently(mAdapterStickers.swapCursor(null));
    }
    mItemsApplied.clear();
    ((ImageViewDrawableOverlay)mImageView).clearOverlays();
    mCurrentFilter = null;
    if (mCursorLoaderPacks != null)
    {
      mCursorLoaderPacks.abandon();
      mCursorLoaderPacks.reset();
    }
    try
    {
      mCache.clear();
      mAdapterPacks = null;
      mAdapterStickers = null;
      mCursorLoaderPacks = null;
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  protected void onDispose()
  {
    super.onDispose();
    mCanvas = null;
  }
  
  public boolean onDrag(View paramView, DragEvent paramDragEvent)
  {
    switch (paramDragEvent.getAction())
    {
    default: 
      return false;
    case 1: 
      paramView = paramDragEvent.getClipDescription();
      return (paramView != null) && (paramView.hasMimeType("text/plain")) && (Cds.PackType.STICKER.toCdsString().equals(paramDragEvent.getClipDescription().getLabel()));
    case 2: 
      return true;
    case 5: 
      ((ImageViewDrawableOverlay)mImageView).onDragEntered();
      return true;
    case 6: 
      ((ImageViewDrawableOverlay)mImageView).onDragExited();
      return true;
    case 3: 
      logger.info("ACTION_DROP");
      paramView = paramDragEvent.getClipData();
      if ((paramView != null) && (paramView.getItemCount() == 1))
      {
        Intent localIntent = paramDragEvent.getClipData().getItemAt(0).getIntent();
        if (localIntent == null) {
          return false;
        }
        paramView = localIntent.getStringExtra("identifier");
        String str = localIntent.getStringExtra("contentPath");
        int i = (int)(localIntent.getIntExtra("width", 400) * mScaleFactor);
        int j = (int)(localIntent.getIntExtra("height", 400) * mScaleFactor);
        if ((TextUtils.isEmpty(paramView)) || (TextUtils.isEmpty(str))) {
          return false;
        }
        logger.verbose("identifier: %s, contentPath: %s, size: %dx%d", new Object[] { paramView, str, Integer.valueOf(i), Integer.valueOf(j) });
        getContext().getTracker().tagEvent("stickers: drag_suceeded");
        onApplyCurrent();
        int m = (int)paramDragEvent.getX();
        int k = (int)paramDragEvent.getY();
        logger.log("position: %dx%d", new Object[] { Integer.valueOf(m), Integer.valueOf(k) });
        m -= i / 2;
        k -= j / 2;
        paramDragEvent = new RectF(m, k, m + i, k + j);
        logger.verbose("final rect: %s", new Object[] { paramDragEvent });
        addSticker(str, paramView, paramDragEvent);
        return true;
      }
      return false;
    }
    logger.info("ACTION_DRAG_ENDED: %s", new Object[] { Boolean.valueOf(paramDragEvent.getResult()) });
    ((ImageViewDrawableOverlay)mImageView).onDragEntered();
    return true;
  }
  
  protected void onGenerateResult()
  {
    onApplyCurrent();
    onSendEvents();
    super.onGenerateResult(mEditResult);
  }
  
  public void onItemClick(RecyclerView.Adapter paramAdapter, View paramView)
  {
    hideOverlay();
    if (paramAdapter == mAdapterPacks)
    {
      paramAdapter = (PacksListAdapter.BaseViewHolder)mListPacks.getChildViewHolder(paramView);
      i = paramAdapter.getItemViewType();
      j = paramAdapter.getPosition();
      l = paramAdapter.getItemId();
      if (i == 2) {
        onStickerPackSelected(l, identifier);
      }
    }
    while (paramAdapter != mAdapterStickers)
    {
      int i;
      int j;
      do
      {
        return;
        if ((i == 5) || (i == 6))
        {
          if (i == 6) {}
          for (paramAdapter = "right";; paramAdapter = "left")
          {
            displayIAPDialog(new StoreContainerFragment.Builder().setPackType(Cds.PackType.STICKER).setEvent("shop_list: opened").addEventAttributes("from", getName().name().toLowerCase(Locale.US)).addEventAttributes("side", paramAdapter).build());
            return;
          }
        }
      } while (i != 1);
      long l = paramAdapter.getItemId();
      paramView = new Bundle();
      paramView.putInt("extra-click-from-position", j);
      displayIAPDialog(new StoreContainerFragment.Builder().setPackType(Cds.PackType.STICKER).setPackId(l).setFeaturedPackId(l).setEvent("shop_details: opened").addEventAttributes("pack", identifier).addEventAttributes("from", "featured").setExtras(paramView).build());
      return;
    }
    paramView = (StickerViewHolder)mListStickers.getChildViewHolder(paramView);
    removeIapDialog();
    addSticker(((StickersAdapter)paramAdapter).getContentPath(), identifier, null);
  }
  
  public void onLoadComplete(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    logger.info("onLoadComplete: " + paramCursor + ", currentStatus: " + mStatus.getCurrentStatus());
    int i3 = 1;
    int i2 = 1;
    int i4 = mStatus.getCurrentStatus();
    int i1 = 0;
    long l2 = -1L;
    int m = -1;
    int n = -1;
    long l3 = -1L;
    boolean bool1 = false;
    boolean bool3 = false;
    boolean bool2 = false;
    if (getContext() == null) {
      return;
    }
    paramLoader = getContext().getStoreFragment();
    int i;
    label117:
    int j;
    label209:
    int k;
    if ((!mFirstTime) && (paramLoader != null))
    {
      i = 1;
      j = i;
      long l1 = l2;
      if (i != 0)
      {
        j = i;
        l1 = l2;
        if (paramLoader.getArguments() != null)
        {
          long l4 = paramLoader.getArguments().getLong("featured_pack_id");
          j = i;
          l1 = l2;
          if (l4 == paramLoader.getArguments().getLong("extra-pack-id"))
          {
            j = i;
            l1 = l2;
            if (l4 > -1L)
            {
              l1 = l4;
              if (l1 <= -1L) {
                break label776;
              }
              j = 1;
            }
          }
        }
      }
      l2 = l3;
      if (hasOptions())
      {
        l2 = l3;
        if (mFirstTime)
        {
          l2 = l3;
          if (j == 0)
          {
            paramLoader = getOptions();
            l2 = paramLoader.getLong("quick-packId", -1L);
            paramLoader.remove("quick-packId");
            paramLoader.remove("quick-contentId");
          }
        }
      }
      paramLoader = new ArrayList();
      i = n;
      k = m;
      if (paramCursor != null)
      {
        i1 = paramCursor.getPosition();
        do
        {
          String str;
          do
          {
            do
            {
              i = n;
              k = m;
              bool1 = bool3;
              if (!paramCursor.moveToNext()) {
                break;
              }
            } while (paramCursor.getInt(4) != 2);
            l3 = paramCursor.getLong(9);
            str = paramCursor.getString(3);
            paramLoader.add(Long.valueOf(l3));
            if (mFirstTime) {
              break label782;
            }
          } while (mInstalledPacks.contains(Long.valueOf(l3)));
          logger.log("adding %d (%s) to new packs", new Object[] { Long.valueOf(l3), str });
          logger.log("iapDialogFeaturedId: %d, pack_id: %d", new Object[] { Long.valueOf(l1), Long.valueOf(l3) });
        } while ((j == 0) || (l1 != l3));
        logger.log("setting new position based on featured: %d", new Object[] { Long.valueOf(l3) });
        k = paramCursor.getPosition() + 1;
        bool1 = true;
        i = n;
      }
    }
    for (;;)
    {
      paramCursor.moveToPosition(i1);
      i1 = paramCursor.getCount();
      mInstalledPacks.clear();
      mInstalledPacks.addAll(paramLoader);
      j = k;
      m = i3;
      if (i == 0)
      {
        j = k;
        m = i3;
        if (i1 == 1)
        {
          j = k;
          m = i3;
          if (i4 != 2)
          {
            k = paramCursor.getPosition();
            j = i2;
            if (paramCursor.moveToFirst())
            {
              j = i2;
              if (paramCursor.getInt(4) == 2)
              {
                mPackInfo = new StickerPackInfo(paramCursor.getLong(0), paramCursor.getString(3));
                j = 2;
              }
            }
            paramCursor.moveToPosition(k);
            k = -1;
            m = j;
            j = k;
          }
        }
      }
      if (i4 != 2) {
        mStatus.setStatus(m);
      }
      mAdapterPacks.changeCursor(paramCursor);
      if (j >= 0)
      {
        bool2 = true;
        i = j;
        removeIapDialog();
      }
      onStickersPackListUpdated(i, bool2, bool1);
      if (openStorePanelIfRequired(l2)) {
        break;
      }
      logger.verbose("cursorSize: %d, firstValidIndex: %d", new Object[] { Integer.valueOf(i1), Integer.valueOf(i) });
      if ((i1 <= 1) || (i != -1)) {
        break;
      }
      createTutorialOverlayIfNecessary(i, mStatus.getCurrentStatus());
      return;
      i = 0;
      break label117;
      label776:
      j = 0;
      break label209;
      label782:
      i = paramCursor.getPosition();
      k = m;
      bool1 = bool3;
    }
  }
  
  public void onLockOpacity()
  {
    logger.info("onLockOpacity");
    if (mStatus.getCurrentStatus() == 3) {
      mStatus.setStatus(mStatus.getPreviousStatus());
    }
  }
  
  public void onProgressChanged(SeekBar paramSeekBar, int paramInt, boolean paramBoolean)
  {
    paramSeekBar = ((ImageViewDrawableOverlay)mImageView).getHighlightViewAt(0);
    if (paramSeekBar != null) {
      paramSeekBar.setOpacity(Math.max(Math.min((int)((paramInt * (1.0D - 0.1D) / 100.0D + 0.1D) * 255.0D), 255), 0));
    }
  }
  
  protected void onSetupUiTint(int paramInt)
  {
    if (paramInt != 0) {
      UIUtils.setIndeterminateProgressBarTint((ProgressBar)mViewFlipper.getChildAt(0).findViewById(R.id.progress), paramInt);
    }
  }
  
  public void onStartTrackingTouch(SeekBar paramSeekBar) {}
  
  public void onStatusChanged(int paramInt1, int paramInt2)
  {
    logger.info("OnStatusChange: " + paramInt1 + " >> " + paramInt2);
    int i;
    int j;
    if ((paramInt2 == 2) || (paramInt1 == 2))
    {
      i = R.anim.com_adobe_image_bottombar_in;
      j = R.anim.com_adobe_image_bottombar_out;
      mViewFlipper.setInAnimation(getContext().getBaseContext(), i);
      mViewFlipper.setOutAnimation(getContext().getBaseContext(), j);
      switch (paramInt2)
      {
      default: 
        logger.error("unmanaged status change: " + paramInt1 + " >> " + paramInt2);
      }
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            i = R.anim.abc_fade_in;
            j = R.anim.abc_fade_out;
            break;
            if (mViewFlipper.getDisplayedChild() != 1) {
              mViewFlipper.setDisplayedChild(1);
            }
          } while (paramInt1 != 2);
          restoreToolbarTitle();
        } while (mAdapterStickers == null);
        mAdapterStickers.changeCursor(null);
        return;
        loadStickers();
      } while (mViewFlipper.getDisplayedChild() == 2);
      mViewFlipper.setDisplayedChild(2);
      return;
    } while (mViewFlipper.getDisplayedChild() == 3);
    mViewFlipper.setDisplayedChild(3);
  }
  
  public void onStatusUpdated(int paramInt) {}
  
  public void onStopTrackingTouch(SeekBar paramSeekBar)
  {
    paramSeekBar = ((ImageViewDrawableOverlay)mImageView).getHighlightViewAt(0);
    paramSeekBar.invalidateDrawable(paramSeekBar.getContent().getCurrent());
  }
  
  protected void updateInstalledPacks()
  {
    logger.info("updateInstalledPacks");
    if (mViewFlipper.getDisplayedChild() != 0) {
      mViewFlipper.setDisplayedChild(0);
    }
    mAdapterPacks = createPacksAdapter(getContext().getBaseContext(), null);
    mListPacks.setAdapter(mAdapterPacks);
    Context localContext = getContext().getBaseContext();
    if (mCursorLoaderPacks == null)
    {
      mCursorLoaderPacks = new CursorLoader(localContext, PackageManagerUtils.getCDSProviderContentUri(localContext, String.format(Locale.US, "packTray/%d/%d/%d/%d/%d/%s", new Object[] { Integer.valueOf(3), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(1), Integer.valueOf(1), "sticker" })), null, null, null, null);
      mCursorLoaderPacks.registerListener(1, this);
      localContext.getContentResolver().registerContentObserver(PackageManagerUtils.getCDSProviderContentUri(localContext, "packTray/sticker"), false, mContentObserver);
    }
    mCursorLoaderPacks.startLoading();
  }
  
  public static class CustomDragShadowBuilder
    extends View.DragShadowBuilder
  {
    private final float mScaleFactor;
    
    public CustomDragShadowBuilder(View paramView, float paramFloat)
    {
      super();
      mScaleFactor = paramFloat;
    }
    
    public void onDrawShadow(Canvas paramCanvas)
    {
      paramCanvas.scale(mScaleFactor, mScaleFactor);
      getView().draw(paramCanvas);
    }
    
    public void onProvideShadowMetrics(Point paramPoint1, Point paramPoint2)
    {
      View localView = getView();
      int i = (int)(localView.getWidth() * mScaleFactor);
      int j = (int)(localView.getHeight() * mScaleFactor);
      paramPoint1.set(i, j);
      paramPoint2.set(i / 2, j / 2);
    }
  }
  
  static class StickerPackInfo
  {
    long packId;
    String packIdentifier;
    
    StickerPackInfo(long paramLong, String paramString)
    {
      packId = paramLong;
      packIdentifier = paramString;
    }
  }
  
  static class StickerViewHolder
    extends RecyclerView.ViewHolder
  {
    public String identifier;
    final ImageView imageView;
    
    public StickerViewHolder(View paramView)
    {
      super();
      imageView = ((ImageView)paramView.findViewById(R.id.image));
    }
  }
  
  class StickersAdapter
    extends RecyclerCursorAdapter<StickersPanel.StickerViewHolder>
  {
    int idColumnIndex;
    int identifierColumnIndex;
    String mContentPath;
    LayoutInflater mLayoutInflater;
    int packIdColumnIndex;
    
    public StickersAdapter(Context paramContext, Cursor paramCursor)
    {
      super(paramCursor, 0);
      mLayoutInflater = LayoutInflater.from(paramContext);
      initCursor(paramCursor);
    }
    
    private void initCursor(Cursor paramCursor)
    {
      if (paramCursor != null)
      {
        idColumnIndex = paramCursor.getColumnIndex("item_id");
        identifierColumnIndex = paramCursor.getColumnIndex("item_identifier");
        packIdColumnIndex = paramCursor.getColumnIndex("item_packId");
      }
    }
    
    public String getContentPath()
    {
      return mContentPath;
    }
    
    public void onBindViewHolder(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      String str = ((Cursor)getItem(paramInt)).getString(identifierColumnIndex);
      paramViewHolder = (StickersPanel.StickerViewHolder)paramViewHolder;
      identifier = str;
      str = mContentPath + "/" + Cds.getPackItemFilename(str, Cds.PackType.STICKER, Cds.Size.Small);
      mPicassoLib.load(str).skipMemoryCache().resize(mStickerThumbSize, mStickerThumbSize).onlyScaleDown().noFade().into(imageView);
    }
    
    public StickersPanel.StickerViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      paramViewGroup = mLayoutInflater.inflate(R.layout.com_adobe_image_content_stickers_item_single, paramViewGroup, false);
      final StickersPanel.StickerViewHolder localStickerViewHolder = new StickersPanel.StickerViewHolder(paramViewGroup);
      paramViewGroup.setOnLongClickListener(new View.OnLongClickListener()
      {
        public boolean onLongClick(View paramAnonymousView)
        {
          paramAnonymousView = localStickerViewHolderimageView.getDrawable();
          Object localObject = new Intent();
          ((Intent)localObject).putExtra("contentPath", getContentPath());
          ((Intent)localObject).putExtra("identifier", localStickerViewHolderidentifier);
          ((Intent)localObject).putExtra("width", paramAnonymousView.getIntrinsicWidth());
          ((Intent)localObject).putExtra("height", paramAnonymousView.getIntrinsicHeight());
          paramAnonymousView = new ClipData.Item((Intent)localObject);
          paramAnonymousView = new ClipData(Cds.PackType.STICKER.toCdsString(), new String[] { "text/plain" }, paramAnonymousView);
          localObject = new StickersPanel.CustomDragShadowBuilder(localStickerViewHolderimageView, mScaleFactor);
          localStickerViewHolderimageView.startDrag(paramAnonymousView, (View.DragShadowBuilder)localObject, null, 0);
          return true;
        }
      });
      paramViewGroup.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          onItemClick(StickersPanel.StickersAdapter.this, paramAnonymousView);
        }
      });
      return localStickerViewHolder;
    }
    
    public void setContentPath(String paramString)
    {
      mContentPath = paramString;
    }
    
    public Cursor swapCursor(Cursor paramCursor)
    {
      initCursor(paramCursor);
      return super.swapCursor(paramCursor);
    }
  }
}
