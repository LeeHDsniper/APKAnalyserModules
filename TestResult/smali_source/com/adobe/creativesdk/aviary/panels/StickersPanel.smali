.class public Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "StickersPanel.java"

# interfaces
.implements Landroid/support/v4/content/Loader$OnLoadCompleteListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnDragListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;
.implements Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;
.implements Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;
.implements Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;
.implements Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;,
        Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;,
        Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;,
        Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;",
        "Landroid/support/v4/content/Loader$OnLoadCompleteListener",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/view/View$OnDragListener;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;",
        "Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;",
        "Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;",
        "Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;",
        "Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;",
        "Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;"
    }
.end annotation


# instance fields
.field private mAccentColor:I

.field protected mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

.field protected mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

.field protected mCache:Lit/sephiroth/android/library/picasso/LruCache;

.field private mCanvas:Landroid/graphics/Canvas;

.field private mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

.field protected final mContentObserver:Landroid/database/ContentObserver;

.field private mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

.field protected mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

.field private mDefaultPackTextBackgroundColor:I

.field private mFirstTime:Z

.field private final mInstalledPacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field mItemsApplied:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mListPacks:Landroid/support/v7/widget/RecyclerView;

.field private mListStickers:Landroid/support/v7/widget/RecyclerView;

.field private mPackCellWidth:I

.field private mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

.field private mPicassoLib:Lit/sephiroth/android/library/picasso/Picasso;

.field private mScaleFactor:F

.field private mSeekBar:Landroid/widget/SeekBar;

.field private mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

.field private mStickerThumbSize:I

.field mStickersOnScreen:I

.field private mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

.field private mViewFlipper:Landroid/widget/ViewFlipper;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    const/4 v1, 0x0

    .line 157
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mInstalledPacks:Ljava/util/List;

    .line 118
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mFirstTime:Z

    .line 128
    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickersOnScreen:I

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mItemsApplied:Ljava/util/List;

    .line 144
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mContentObserver:Landroid/database/ContentObserver;

    .line 158
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;I)Z
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->createTutorialOverlayIfNecessaryDelayed(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)F
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .prologue
    .line 88
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mScaleFactor:F

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .prologue
    .line 88
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickerThumbSize:I

    return v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)Lit/sephiroth/android/library/picasso/Picasso;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPicassoLib:Lit/sephiroth/android/library/picasso/Picasso;

    return-object v0
.end method

.method private addSticker(Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;Landroid/graphics/RectF;)V
    .registers 30
    .param p1, "drawable"    # Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    .param p2, "positionRect"    # Landroid/graphics/RectF;

    .prologue
    .line 958
    new-instance v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 959
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getOverlayStyleId()I

    move-result v4

    move-object/from16 v0, p1

    invoke-direct {v3, v8, v4, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;ILcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;)V

    .line 960
    .local v3, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOnDeleteClickListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;)V

    .line 961
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOnContentFlipListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;)V

    .line 962
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOnChangeOpacityListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;)V

    .line 964
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    .line 969
    .local v5, "mImageMatrix":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getWidth()I

    move-result v20

    .line 970
    .local v20, "width":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getHeight()I

    move-result v13

    .line 973
    .local v13, "height":I
    if-eqz p2, :cond_175

    .line 974
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->width()F

    move-result v4

    float-to-int v11, v4

    .line 975
    .local v11, "cropWidth":I
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v9, v4

    .line 981
    .local v9, "cropHeight":I
    :goto_48
    invoke-static {v11, v9}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 982
    .local v10, "cropSize":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getWidth()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v8}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getHeight()I

    move-result v8

    invoke-static {v4, v8}, Ljava/lang/Math;->min(II)I

    move-result v18

    .line 984
    .local v18, "screenSize":I
    move/from16 v0, v18

    if-le v10, v0, :cond_eb

    .line 986
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getWidth()I

    move-result v4

    int-to-float v4, v4

    int-to-float v8, v11

    div-float v21, v4, v8

    .line 987
    .local v21, "widthRatio":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getHeight()I

    move-result v4

    int-to-float v4, v4

    int-to-float v8, v9

    div-float v14, v4, v8

    .line 989
    .local v14, "heightRatio":F
    cmpg-float v4, v21, v14

    if-gez v4, :cond_181

    .line 990
    move/from16 v17, v21

    .line 995
    .local v17, "ratio":F
    :goto_82
    int-to-float v4, v11

    const/high16 v8, 0x40000000

    div-float v8, v17, v8

    mul-float/2addr v4, v8

    float-to-int v11, v4

    .line 996
    int-to-float v4, v9

    const/high16 v8, 0x40000000

    div-float v8, v17, v8

    mul-float/2addr v4, v8

    float-to-int v9, v4

    .line 998
    if-nez p2, :cond_d0

    .line 999
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getWidth()I

    move-result v19

    .line 1000
    .local v19, "w":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getHeight()I

    move-result v12

    .line 1001
    .local v12, "h":I
    new-instance p2, Landroid/graphics/RectF;

    .end local p2    # "positionRect":Landroid/graphics/RectF;
    div-int/lit8 v4, v19, 0x2

    div-int/lit8 v8, v11, 0x2

    sub-int/2addr v4, v8

    int-to-float v4, v4

    div-int/lit8 v8, v12, 0x2

    div-int/lit8 v24, v9, 0x2

    sub-int v8, v8, v24

    int-to-float v8, v8

    div-int/lit8 v24, v19, 0x2

    div-int/lit8 v25, v11, 0x2

    add-int v24, v24, v25

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v24, v0

    div-int/lit8 v25, v12, 0x2

    div-int/lit8 v26, v9, 0x2

    add-int v25, v25, v26

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    move-object/from16 v0, p2

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v4, v8, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1005
    .end local v12    # "h":I
    .end local v19    # "w":I
    .restart local p2    # "positionRect":Landroid/graphics/RectF;
    :cond_d0
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->width()F

    move-result v4

    int-to-float v8, v11

    sub-float/2addr v4, v8

    const/high16 v8, 0x40000000

    div-float/2addr v4, v8

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->height()F

    move-result v8

    int-to-float v0, v9

    move/from16 v24, v0

    sub-float v8, v8, v24

    const/high16 v24, 0x40000000

    div-float v8, v8, v24

    move-object/from16 v0, p2

    invoke-virtual {v0, v4, v8}, Landroid/graphics/RectF;->inset(FF)V

    .line 1008
    .end local v14    # "heightRatio":F
    .end local v17    # "ratio":F
    .end local v21    # "widthRatio":F
    :cond_eb
    if-eqz p2, :cond_185

    .line 1009
    move-object/from16 v0, p2

    iget v4, v0, Landroid/graphics/RectF;->left:F

    float-to-int v0, v4

    move/from16 v22, v0

    .line 1010
    .local v22, "x":I
    move-object/from16 v0, p2

    iget v4, v0, Landroid/graphics/RectF;->top:F

    float-to-int v0, v4

    move/from16 v23, v0

    .line 1016
    .local v23, "y":I
    :goto_fb
    new-instance v15, Landroid/graphics/Matrix;

    invoke-direct {v15, v5}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 1017
    .local v15, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v15, v15}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 1019
    const/4 v4, 0x4

    new-array v0, v4, [F

    move-object/from16 v16, v0

    const/4 v4, 0x0

    move/from16 v0, v22

    int-to-float v8, v0

    aput v8, v16, v4

    const/4 v4, 0x1

    move/from16 v0, v23

    int-to-float v8, v0

    aput v8, v16, v4

    const/4 v4, 0x2

    add-int v8, v22, v11

    int-to-float v8, v8

    aput v8, v16, v4

    const/4 v4, 0x3

    add-int v8, v23, v9

    int-to-float v8, v8

    aput v8, v16, v4

    .line 1020
    .local v16, "pts":[F
    invoke-static/range {v15 .. v16}, Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;->mapPoints(Landroid/graphics/Matrix;[F)V

    .line 1022
    new-instance v7, Landroid/graphics/RectF;

    const/4 v4, 0x0

    aget v4, v16, v4

    const/4 v8, 0x1

    aget v8, v16, v8

    const/16 v24, 0x2

    aget v24, v16, v24

    const/16 v25, 0x3

    aget v25, v16, v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v7, v4, v8, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1023
    .local v7, "cropRect":Landroid/graphics/RectF;
    new-instance v6, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v8, 0x0

    move/from16 v0, v20

    invoke-direct {v6, v4, v8, v0, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1025
    .local v6, "imageRect":Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setup(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;Z)V

    .line 1027
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->addHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    .line 1028
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 1029
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->animate(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 1031
    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickersOnScreen:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickersOnScreen:I

    .line 1032
    return-void

    .line 977
    .end local v6    # "imageRect":Landroid/graphics/Rect;
    .end local v7    # "cropRect":Landroid/graphics/RectF;
    .end local v9    # "cropHeight":I
    .end local v10    # "cropSize":I
    .end local v11    # "cropWidth":I
    .end local v15    # "matrix":Landroid/graphics/Matrix;
    .end local v16    # "pts":[F
    .end local v18    # "screenSize":I
    .end local v22    # "x":I
    .end local v23    # "y":I
    :cond_175
    invoke-interface/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getCurrentWidth()F

    move-result v4

    float-to-int v11, v4

    .line 978
    .restart local v11    # "cropWidth":I
    invoke-interface/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getCurrentHeight()F

    move-result v4

    float-to-int v9, v4

    .restart local v9    # "cropHeight":I
    goto/16 :goto_48

    .line 992
    .restart local v10    # "cropSize":I
    .restart local v14    # "heightRatio":F
    .restart local v18    # "screenSize":I
    .restart local v21    # "widthRatio":F
    :cond_181
    move/from16 v17, v14

    .restart local v17    # "ratio":F
    goto/16 :goto_82

    .line 1012
    .end local v14    # "heightRatio":F
    .end local v17    # "ratio":F
    .end local v21    # "widthRatio":F
    :cond_185
    sub-int v4, v20, v11

    div-int/lit8 v22, v4, 0x2

    .line 1013
    .restart local v22    # "x":I
    sub-int v4, v13, v9

    div-int/lit8 v23, v4, 0x2

    .restart local v23    # "y":I
    goto/16 :goto_fb
.end method

.method private addSticker(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/RectF;)V
    .registers 10
    .param p1, "contentPath"    # Ljava/lang/String;
    .param p2, "identifier"    # Ljava/lang/String;
    .param p3, "position"    # Landroid/graphics/RectF;

    .prologue
    .line 921
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onApplyCurrent()V

    .line 923
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    invoke-static {v3}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 924
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 926
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Medium:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    invoke-static {p2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getPackItemFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 927
    .local v2, "file":Ljava/io/File;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 929
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_8f

    .line 930
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;

    .line 931
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 932
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;->packIdentifier:Ljava/lang/String;

    invoke-direct {v1, v3, v4, p2, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;-><init>(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 935
    .local v1, "drawable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->setAntiAlias(Z)V

    .line 937
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    invoke-direct {v3, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    .line 938
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmapWidth()I

    move-result v4

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmapHeight()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setSize(II)V

    .line 940
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 941
    .local v0, "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "item"

    invoke-virtual {v0, v3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 942
    const-string v3, "pack"

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;->packIdentifier:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 944
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v3

    const-string v4, "stickers: item_added"

    invoke-virtual {v3, v4, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 945
    invoke-direct {p0, v1, p3}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->addSticker(Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;Landroid/graphics/RectF;)V

    .line 950
    .end local v0    # "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "drawable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;
    :goto_8e
    return-void

    .line 947
    :cond_8f
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "file does not exists"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 948
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "Error loading the selected sticker"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_8e
.end method

.method private createAndConfigurePreview()V
    .registers 3

    .prologue
    .line 831
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_14

    .line 832
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 833
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 836
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 837
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCanvas:Landroid/graphics/Canvas;

    .line 838
    return-void
.end method

.method private createPacksAdapter(Landroid/content/Context;Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 875
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    invoke-direct {v0, p1, p0, p2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;Landroid/database/Cursor;)V

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackCellWidth:I

    .line 876
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setCellWidth(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_content_item:I

    .line 877
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setContentResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_supplies:I

    .line 878
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setSupplyResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_external_pack:I

    .line 879
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setExternalResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_header_pack:I

    .line 880
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setDividerResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mDefaultPackTextBackgroundColor:I

    .line 881
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setDefaultPackTextBackgroundColor(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_stickers_item_internal_pack:I

    .line 882
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setInternalResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 883
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPicassoLib:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCache:Lit/sephiroth/android/library/picasso/LruCache;

    .line 884
    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setPicasso(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Cache;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    .line 885
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->build()Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-result-object v0

    return-object v0
.end method

.method private createTutorialOverlayIfNecessary(II)V
    .registers 9
    .param p1, "firstValidIndex"    # I
    .param p2, "currentStatus"    # I

    .prologue
    const/4 v5, 0x1

    .line 318
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "createTutorialOverlayIfNecessary: %d, %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 320
    if-ne p2, v5, :cond_26

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-nez v0, :cond_27

    .line 333
    :cond_26
    :goto_26
    return-void

    .line 324
    :cond_27
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$2;-><init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;I)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_26
.end method

.method private createTutorialOverlayIfNecessaryDelayed(I)Z
    .registers 16
    .param p1, "firstValidIndex"    # I

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 337
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v11, "createTutorialOverlayIfNecessaryDelayed: %d"

    new-array v12, v9, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v10

    invoke-interface {v8, v11, v12}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 339
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->isActive()Z

    move-result v8

    if-eqz v8, :cond_1f

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v8

    if-eq v8, v9, :cond_20

    .line 389
    :cond_1f
    :goto_1f
    return v10

    .line 343
    :cond_20
    const/4 v4, 0x1

    .line 345
    .local v4, "shouldProceed":Z
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 346
    .local v0, "count":I
    const/4 v5, -0x1

    .line 347
    .local v5, "validIndex":I
    const/4 v6, 0x0

    .line 348
    .local v6, "validView":Landroid/view/View;
    const/4 v1, 0x0

    .line 350
    .local v1, "free":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2b
    if-ge v3, v0, :cond_47

    .line 351
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 352
    .local v7, "view":Landroid/view/View;
    if-eqz v7, :cond_79

    .line 353
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    .line 354
    .local v2, "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    if-eqz v2, :cond_79

    .line 355
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemViewType()I

    move-result v8

    const/4 v11, 0x2

    if-ne v8, v11, :cond_55

    .line 356
    const/4 v4, 0x0

    .line 372
    .end local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v7    # "view":Landroid/view/View;
    :cond_47
    if-eqz v1, :cond_4e

    const/4 v8, -0x1

    if-le v5, v8, :cond_4e

    if-nez v6, :cond_4f

    .line 373
    :cond_4e
    const/4 v4, 0x0

    .line 376
    :cond_4f
    if-nez v4, :cond_7e

    .line 377
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->hideOverlay()V

    goto :goto_1f

    .line 360
    .restart local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .restart local v7    # "view":Landroid/view/View;
    :cond_55
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemViewType()I

    move-result v8

    if-ne v8, v9, :cond_79

    move-object v8, v2

    .line 361
    check-cast v8, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iget v8, v8, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->free:I

    if-ne v8, v9, :cond_7c

    move v1, v9

    .line 362
    :goto_63
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v11, "is free: %b"

    new-array v12, v9, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    aput-object v13, v12, v10

    invoke-interface {v8, v11, v12}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 363
    if-eqz v1, :cond_79

    .line 364
    move v5, v3

    .line 365
    check-cast v2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    .end local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    iget-object v6, v2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->itemView:Landroid/view/View;

    .line 350
    :cond_79
    add-int/lit8 v3, v3, 0x1

    goto :goto_2b

    .restart local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    :cond_7c
    move v1, v10

    .line 361
    goto :goto_63

    .line 381
    .end local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v7    # "view":Landroid/view/View;
    :cond_7e
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-nez v8, :cond_9d

    .line 382
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v9}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->shouldShow(Landroid/content/Context;I)Z

    move-result v8

    if-eqz v8, :cond_1f

    .line 383
    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->createTutorialOverlay(Landroid/view/View;)Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    .line 384
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->show()Z

    move-result v10

    goto :goto_1f

    .line 387
    :cond_9d
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v8, v6}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->update(Landroid/view/View;)V

    goto/16 :goto_1f
.end method

.method private displayIAPDialog(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "data"    # Landroid/os/Bundle;

    .prologue
    .line 725
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->openOrUpdateStoreDialog(Landroid/os/Bundle;)V

    .line 726
    return-void
.end method

.method private getCacheSize()I
    .registers 9

    .prologue
    .line 783
    const/4 v4, 0x3

    new-array v1, v4, [D

    .line 784
    .local v1, "mem":[D
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getRuntimeMemory([D)V

    .line 786
    const/4 v4, 0x0

    aget-wide v4, v1, v4

    const-wide/high16 v6, 0x4000000000000000L

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 787
    .local v2, "total":D
    const-wide/high16 v4, 0x4130000000000000L

    mul-double/2addr v4, v2

    double-to-int v0, v4

    .line 789
    .local v0, "maxSize":I
    const/high16 v4, 0x600000

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 790
    return v0
.end method

.method private onApplyCurrent()V
    .registers 25

    .prologue
    .line 1035
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->stickersOnScreen()Z

    move-result v18

    if-nez v18, :cond_7

    .line 1093
    :goto_6
    return-void

    .line 1039
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-object/from16 v18, v0

    check-cast v18, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v9

    .line 1041
    .local v9, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-eqz v9, :cond_1f7

    .line 1043
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v16

    check-cast v16, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;

    .line 1045
    .local v16, "stickerDrawable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v5

    .line 1046
    .local v5, "cropRect":Landroid/graphics/RectF;
    new-instance v11, Landroid/graphics/Rect;

    iget v0, v5, Landroid/graphics/RectF;->left:F

    move/from16 v18, v0

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    iget v0, v5, Landroid/graphics/RectF;->top:F

    move/from16 v19, v0

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    iget v0, v5, Landroid/graphics/RectF;->right:F

    move/from16 v20, v0

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    iget v0, v5, Landroid/graphics/RectF;->bottom:F

    move/from16 v21, v0

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v11, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1048
    .local v11, "rect":Landroid/graphics/Rect;
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRotationMatrix()Landroid/graphics/Matrix;

    move-result-object v12

    .line 1049
    .local v12, "rotateMatrix":Landroid/graphics/Matrix;
    new-instance v10, Landroid/graphics/Matrix;

    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 1050
    .local v10, "matrix":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 1052
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Landroid/graphics/Canvas;->save(I)I

    move-result v13

    .line 1053
    .local v13, "saveCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1055
    const/16 v18, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->setDropShadow(Z)V

    .line 1056
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v0, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 1057
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v19, v0

    invoke-interface/range {v18 .. v19}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 1058
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1059
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 1061
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1f7

    .line 1062
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    .line 1063
    .local v17, "w":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    .line 1065
    .local v8, "h":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    iget v0, v5, Landroid/graphics/RectF;->left:F

    move/from16 v19, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v19, v19, v20

    iget v0, v5, Landroid/graphics/RectF;->top:F

    move/from16 v20, v0

    int-to-float v0, v8

    move/from16 v21, v0

    div-float v20, v20, v21

    invoke-virtual/range {v18 .. v20}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setTopLeft(FF)V

    .line 1066
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    iget v0, v5, Landroid/graphics/RectF;->right:F

    move/from16 v19, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v19, v19, v20

    iget v0, v5, Landroid/graphics/RectF;->bottom:F

    move/from16 v20, v0

    int-to-float v0, v8

    move/from16 v21, v0

    div-float v20, v20, v21

    invoke-virtual/range {v18 .. v20}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setBottomRight(FF)V

    .line 1067
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getRotation()F

    move-result v19

    move/from16 v0, v19

    float-to-double v0, v0

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v20

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setRotation(D)V

    .line 1069
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmapWidth()I

    move-result v7

    .line 1070
    .local v7, "dw":I
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmapHeight()I

    move-result v6

    .line 1071
    .local v6, "dh":I
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v18

    int-to-float v0, v7

    move/from16 v19, v0

    div-float v15, v18, v19

    .line 1072
    .local v15, "scalew":F
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v18

    int-to-float v0, v6

    move/from16 v19, v0

    div-float v14, v18, v19

    .line 1074
    .local v14, "scaleh":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    move-result v19

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v19, v19, v20

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v20

    int-to-float v0, v8

    move/from16 v21, v0

    div-float v20, v20, v21

    invoke-virtual/range {v18 .. v20}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setCenter(FF)V

    .line 1075
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v15, v14}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setScale(FF)V

    .line 1076
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getFlipHorizontal()Z

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setFlipH(Z)V

    .line 1077
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/SeekBar;->getProgress()I

    move-result v19

    move/from16 v0, v19

    int-to-double v0, v0

    move-wide/from16 v20, v0

    const-wide/high16 v22, 0x4059000000000000L

    div-double v20, v20, v22

    const-wide v22, 0x406fe00000000000L

    mul-double v20, v20, v22

    move-wide/from16 v0, v20

    double-to-int v0, v0

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setAlpha(I)V

    .line 1079
    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v4}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    .line 1080
    .local v4, "action":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<Ljava/lang/String;>;"
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getPackIdentifier()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setPackIdentifier(Ljava/lang/String;)V

    .line 1081
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getIdentifier()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setContentIdentifier(Ljava/lang/String;)V

    .line 1082
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->addToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 1083
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getActionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 1085
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mItemsApplied:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getPackIdentifier()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getIdentifier()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1086
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    .line 1090
    .end local v4    # "action":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<Ljava/lang/String;>;"
    .end local v5    # "cropRect":Landroid/graphics/RectF;
    .end local v6    # "dh":I
    .end local v7    # "dw":I
    .end local v8    # "h":I
    .end local v10    # "matrix":Landroid/graphics/Matrix;
    .end local v11    # "rect":Landroid/graphics/Rect;
    .end local v12    # "rotateMatrix":Landroid/graphics/Matrix;
    .end local v13    # "saveCount":I
    .end local v14    # "scaleh":F
    .end local v15    # "scalew":F
    .end local v16    # "stickerDrawable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;
    .end local v17    # "w":I
    :cond_1f7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    move-object/from16 v18, v0

    const/16 v19, 0x64

    invoke-virtual/range {v18 .. v19}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1091
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onClearCurrent(Z)V

    .line 1092
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V

    goto/16 :goto_6
.end method

.method private onClearCurrent(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Z)V
    .registers 11
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .param p2, "removed"    # Z

    .prologue
    const/4 v7, 0x0

    .line 1117
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    if-eqz v5, :cond_7

    .line 1118
    iput-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    .line 1121
    :cond_7
    if-eqz p1, :cond_54

    .line 1122
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    .line 1124
    .local v1, "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    if-eqz p2, :cond_4e

    .line 1125
    instance-of v5, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;

    if-eqz v5, :cond_4e

    move-object v5, v1

    .line 1126
    check-cast v5, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    .line 1127
    .local v2, "name":Ljava/lang/String;
    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;

    .end local v1    # "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getPackIdentifier()Ljava/lang/String;

    move-result-object v3

    .line 1129
    .local v3, "packname":Ljava/lang/String;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1130
    .local v0, "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "item"

    invoke-virtual {v0, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1131
    const-string v5, "pack"

    invoke-virtual {v0, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1132
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v5

    const-string v6, "stickers: item_deleted"

    invoke-virtual {v5, v6, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 1134
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mItemsApplied:Ljava/util/List;

    invoke-static {v3, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    move-result v4

    .line 1135
    .local v4, "removePosition":I
    const/4 v5, -0x1

    if-le v4, v5, :cond_4e

    .line 1136
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mItemsApplied:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1141
    .end local v0    # "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "packname":Ljava/lang/String;
    .end local v4    # "removePosition":I
    :cond_4e
    invoke-virtual {p1, v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOnDeleteClickListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;)V

    .line 1142
    invoke-virtual {p1, v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOnContentFlipListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;)V

    .line 1144
    :cond_54
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v5, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v5, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->removeHightlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    .line 1145
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 1147
    if-eqz p2, :cond_68

    .line 1148
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickersOnScreen:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickersOnScreen:I

    .line 1150
    :cond_68
    return-void
.end method

.method private onClearCurrent(Z)V
    .registers 6
    .param p1, "removed"    # Z

    .prologue
    .line 1102
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->stickersOnScreen()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 1103
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 1104
    .local v1, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 1105
    .local v0, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-direct {p0, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onClearCurrent(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Z)V

    .line 1106
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1108
    .end local v0    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .end local v1    # "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    :cond_19
    return-void
.end method

.method private onSendEvents()V
    .registers 8

    .prologue
    .line 794
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    if-eqz v2, :cond_41

    .line 795
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    .line 796
    .local v1, "tracker":Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mItemsApplied:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_41

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 797
    .local v0, "item":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "stickers: item_saved"

    const/4 v2, 0x4

    new-array v5, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v6, "pack"

    aput-object v6, v5, v2

    const/4 v6, 0x1

    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    aput-object v2, v5, v6

    const/4 v2, 0x2

    const-string v6, "item"

    aput-object v6, v5, v2

    const/4 v6, 0x3

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    aput-object v2, v5, v6

    invoke-virtual {v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_14

    .line 800
    .end local v0    # "item":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "tracker":Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    :cond_41
    return-void
.end method

.method private onStickerPackSelected(JLjava/lang/String;)V
    .registers 11
    .param p1, "packId"    # J
    .param p3, "packIdentifier"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    .line 803
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onStickerPackSelected: %d, %s"

    new-array v2, v5, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 804
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->removeIapDialog()Z

    .line 805
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    invoke-direct {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;-><init>(JLjava/lang/String;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    .line 806
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    .line 807
    return-void
.end method

.method private onStickersPackListUpdated(IZZ)V
    .registers 12
    .param p1, "firstIndex"    # I
    .param p2, "forceSelection"    # Z
    .param p3, "smoothSelection"    # Z

    .prologue
    const/4 v2, 0x0

    .line 1163
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "onStickersPackListUpdated(%d, %b, %b)"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1164
    if-lez p1, :cond_3c

    move v1, p1

    .line 1166
    .local v1, "mListFirstValidPosition":I
    :goto_22
    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mFirstTime:Z

    if-nez v3, :cond_28

    if-eqz p2, :cond_39

    .line 1167
    :cond_28
    if-lez v1, :cond_39

    .line 1168
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    .line 1170
    .local v0, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    if-eqz p3, :cond_3e

    .line 1171
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 1177
    .end local v0    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    :cond_39
    :goto_39
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mFirstTime:Z

    .line 1178
    return-void

    .end local v1    # "mListFirstValidPosition":I
    :cond_3c
    move v1, v2

    .line 1164
    goto :goto_22

    .line 1173
    .restart local v0    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    .restart local v1    # "mListFirstValidPosition":I
    :cond_3e
    add-int/lit8 v3, v1, -0x1

    iget v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackCellWidth:I

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v0, v3, v4}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_39
.end method

.method private openStorePanelIfRequired(J)Z
    .registers 12
    .param p1, "id"    # J

    .prologue
    const-wide/16 v6, -0x1

    .line 292
    const-string v4, "quick-packId"

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->hasOption(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_e

    cmp-long v4, p1, v6

    if-lez v4, :cond_5b

    .line 293
    :cond_e
    cmp-long v4, p1, v6

    if-lez v4, :cond_4b

    .line 294
    move-wide v2, p1

    .line 302
    .local v2, "iapPackageId":J
    :goto_13
    cmp-long v4, v2, v6

    if-lez v4, :cond_5b

    .line 303
    new-instance v4, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    invoke-direct {v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;-><init>()V

    invoke-virtual {v4, v2, v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    .line 304
    invoke-virtual {v4, v2, v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setFeaturedPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 305
    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    const-string v5, "shop_details: opened"

    .line 306
    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setEvent(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    const-string v5, "pack"

    .line 307
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    const-string v5, "from"

    const-string v6, "message"

    .line 308
    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    .line 309
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->build()Landroid/os/Bundle;

    move-result-object v0

    .line 310
    .local v0, "iapData":Landroid/os/Bundle;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->displayIAPDialog(Landroid/os/Bundle;)V

    .line 311
    const/4 v4, 0x1

    .line 314
    .end local v0    # "iapData":Landroid/os/Bundle;
    .end local v2    # "iapPackageId":J
    :goto_4a
    return v4

    .line 296
    :cond_4b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptions()Landroid/os/Bundle;

    move-result-object v1

    .line 297
    .local v1, "options":Landroid/os/Bundle;
    const-string v4, "quick-packId"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 298
    .restart local v2    # "iapPackageId":J
    const-string v4, "quick-packId"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_13

    .line 314
    .end local v1    # "options":Landroid/os/Bundle;
    .end local v2    # "iapPackageId":J
    :cond_5b
    const/4 v4, 0x0

    goto :goto_4a
.end method

.method private removeIapDialog()Z
    .registers 2

    .prologue
    .line 729
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->closeStoreDialog()Z

    move-result v0

    return v0
.end method

.method private stickersOnScreen()Z
    .registers 3

    .prologue
    .line 1158
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 1159
    .local v0, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightCount()I

    move-result v1

    if-lez v1, :cond_c

    const/4 v1, 0x1

    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method


# virtual methods
.method askToLeaveWithoutApply()V
    .registers 4

    .prologue
    .line 813
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_discard_edits:I

    .line 814
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_discard:I

    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$3;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$3;-><init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)V

    .line 815
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 822
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 823
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 824
    return-void
.end method

.method protected createTutorialOverlay(Landroid/view/View;)Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;
    .registers 8
    .param p1, "validView"    # Landroid/view/View;

    .prologue
    .line 393
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    .line 394
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$attr;->com_adobe_image_editor_frames_overlay_style:I

    .line 397
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v4

    const/4 v5, 0x1

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;-><init>(Landroid/content/Context;ILandroid/view/View;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;I)V

    .line 399
    .local v0, "result":Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->getToolDisplayName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->setTitle(I)V

    .line 400
    return-object v0
.end method

.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 648
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_stickers:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 653
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_stickers:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getIsChanged()Z
    .registers 2

    .prologue
    .line 954
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickersOnScreen:I

    if-gtz v0, :cond_a

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->stickersOnScreen()Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected hideOverlay()V
    .registers 2

    .prologue
    .line 404
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-eqz v0, :cond_9

    .line 405
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->hide()V

    .line 407
    :cond_9
    return-void
.end method

.method protected loadStickers()V
    .registers 10

    .prologue
    const/4 v3, 0x0

    .line 892
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v6

    .line 894
    .local v6, "context":Landroid/content/Context;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    if-nez v0, :cond_e

    .line 918
    :goto_d
    return-void

    .line 899
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;->packId:J

    invoke-static {v6, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackContentPath(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v8

    .line 902
    .local v8, "packContentPath":Ljava/lang/String;
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pack/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    iget-wide v4, v2, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;->packId:J

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/item/list"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 904
    invoke-static {v6, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "item_id as _id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "item_id"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "item_packId"

    aput-object v5, v2, v4

    const/4 v4, 0x3

    const-string v5, "item_identifier"

    aput-object v5, v2, v4

    const/4 v4, 0x4

    const-string v5, "item_displayName"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    .line 903
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 910
    .local v7, "cursor":Landroid/database/Cursor;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    if-nez v0, :cond_75

    .line 911
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-direct {v0, p0, v6, v7}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;-><init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;Landroid/content/Context;Landroid/database/Cursor;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    .line 912
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-virtual {v0, v8}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->setContentPath(Ljava/lang/String;)V

    .line 913
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListStickers:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_d

    .line 915
    :cond_75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-virtual {v0, v8}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->setContentPath(Ljava/lang/String;)V

    .line 916
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-virtual {v0, v7}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_d
.end method

.method public onActivate()V
    .registers 6

    .prologue
    .line 472
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 474
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    const/high16 v3, -0x40800000

    const/high16 v4, 0x41000000

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 476
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_editor_content_item_width:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackCellWidth:I

    .line 477
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_editor_content_item_image_width:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickerThumbSize:I

    .line 478
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$attr;->colorPrimaryDark:I

    invoke-static {v0, v1}, Lcom/adobe/android/ui/utils/UIUtils;->getThemeColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mDefaultPackTextBackgroundColor:I

    .line 480
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAccentColor:I

    invoke-static {v0, v1}, Lcom/adobe/android/ui/utils/UIUtils;->setSeekBarProgressTint(Landroid/widget/SeekBar;I)Z

    .line 481
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 482
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 485
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setOnStatusChangeListener(Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;)V

    .line 486
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->updateInstalledPacks()V

    .line 488
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContentView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 489
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->contentReady()V

    .line 490
    return-void
.end method

.method public onBackPressed()Z
    .registers 9

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 500
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "onBackPressed"

    invoke-interface {v2, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 502
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-eqz v2, :cond_17

    .line 503
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->onBackPressed()Z

    move-result v2

    if-eqz v2, :cond_17

    move v2, v3

    .line 547
    :goto_16
    return v2

    .line 509
    :cond_17
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v2

    if-ne v2, v3, :cond_2c

    .line 510
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->stickersOnScreen()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 511
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->askToLeaveWithoutApply()V

    move v2, v3

    .line 512
    goto :goto_16

    :cond_2a
    move v2, v4

    .line 514
    goto :goto_16

    .line 518
    :cond_2c
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v2

    const/4 v5, 0x2

    if-ne v2, v5, :cond_56

    .line 520
    const/4 v1, 0x0

    .line 521
    .local v1, "packsCount":I
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    if-eqz v2, :cond_40

    .line 522
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItemCount()I

    move-result v1

    .line 525
    :cond_40
    if-le v1, v3, :cond_49

    .line 526
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    move v2, v3

    .line 527
    goto :goto_16

    .line 529
    :cond_49
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->stickersOnScreen()Z

    move-result v2

    if-eqz v2, :cond_54

    .line 530
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->askToLeaveWithoutApply()V

    move v2, v3

    .line 531
    goto :goto_16

    :cond_54
    move v2, v4

    .line 533
    goto :goto_16

    .line 538
    .end local v1    # "packsCount":I
    :cond_56
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v2

    const/4 v5, 0x3

    if-ne v2, v5, :cond_91

    .line 539
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 540
    .local v0, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-eqz v0, :cond_84

    .line 541
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getConfirmedOpacity()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOpacity(I)V

    .line 542
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getConfirmedOpacity()I

    move-result v4

    int-to-double v4, v4

    const-wide v6, 0x406fe00000000000L

    div-double/2addr v4, v6

    const-wide/high16 v6, 0x4059000000000000L

    mul-double/2addr v4, v6

    double-to-int v4, v4

    invoke-virtual {v2, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 544
    :cond_84
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getPreviousStatus()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    move v2, v3

    .line 545
    goto :goto_16

    .line 547
    .end local v0    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_91
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onBackPressed()Z

    move-result v2

    goto :goto_16
.end method

.method public onCancel()Z
    .registers 2

    .prologue
    .line 555
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->stickersOnScreen()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 556
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->askToLeaveWithoutApply()V

    .line 557
    const/4 v0, 0x1

    .line 560
    :goto_a
    return v0

    :cond_b
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCancel()Z

    move-result v0

    goto :goto_a
.end method

.method public onChangeOpacity()V
    .registers 3

    .prologue
    .line 1215
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onChangeOpacity"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1216
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    .line 1217
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 1182
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    .line 1184
    .local v1, "id":I
    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button_cancel:I

    if-ne v1, v2, :cond_41

    .line 1185
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "opacity dismiss clicked"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 1186
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 1187
    .local v0, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-eqz v0, :cond_35

    .line 1188
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getConfirmedOpacity()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOpacity(I)V

    .line 1189
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getConfirmedOpacity()I

    move-result v3

    int-to-double v4, v3

    const-wide v6, 0x406fe00000000000L

    div-double/2addr v4, v6

    const-wide/high16 v6, 0x4059000000000000L

    mul-double/2addr v4, v6

    double-to-int v3, v4

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1191
    :cond_35
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getPreviousStatus()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    .line 1199
    .end local v0    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_40
    :goto_40
    return-void

    .line 1193
    :cond_41
    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button_confirm:I

    if-ne v1, v2, :cond_40

    .line 1194
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "opacity confirm clicked"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 1195
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getPreviousStatus()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    .line 1196
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 1197
    .restart local v0    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getOpacity()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setConfirmedOpacity(I)V

    goto :goto_40
.end method

.method protected onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "editResult"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 494
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v1, "item_count"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mItemsApplied:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 496
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;
    .param p2, "oldConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 642
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onConfigurationChanged(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V

    .line 643
    return-void
.end method

.method public onContentFlip(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 4
    .param p1, "content"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 1209
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onContentFlip"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1210
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    const-string v1, "stickers: item_flipped"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 1211
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 12
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 411
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 413
    new-instance v3, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-direct {v3}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    .line 415
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getCacheSize()I

    move-result v2

    .line 416
    .local v2, "maxSize":I
    new-instance v3, Lit/sephiroth/android/library/picasso/LruCache;

    invoke-direct {v3, v2}, Lit/sephiroth/android/library/picasso/LruCache;-><init>(I)V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCache:Lit/sephiroth/android/library/picasso/LruCache;

    .line 418
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mInstalledPacks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 421
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$id;->recyclerView:I

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    .line 422
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v8}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 423
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5, v7, v7}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 425
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$id;->recyclerView2:I

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListStickers:Landroid/support/v7/widget/RecyclerView;

    .line 426
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListStickers:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v8}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 427
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListStickers:Landroid/support/v7/widget/RecyclerView;

    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    .line 428
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5, v7, v7}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 427
    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 430
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$id;->flipper:I

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ViewFlipper;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    .line 431
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContentView()Landroid/view/View;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$id;->overlay:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 432
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$id;->seekbar:I

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/SeekBar;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mSeekBar:Landroid/widget/SeekBar;

    .line 434
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$id;->button_cancel:I

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 435
    .local v1, "mOpacityDismiss":Landroid/view/View;
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 437
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$id;->button_confirm:I

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 438
    .local v0, "mOpacityConfirm":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 441
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    const-class v4, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 442
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v4, Lcom/aviary/android/feather/sdk/R$fraction;->com_adobe_image_editor_sticker_drag_scaleFactor:I

    const/16 v5, 0x64

    invoke-virtual {v3, v4, v5, v8}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getFraction(III)F

    move-result v3

    iput v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mScaleFactor:F

    .line 444
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "mScaleFactor: %f"

    new-array v5, v8, [Ljava/lang/Object;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mScaleFactor:F

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 447
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v3, v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setForceSingleSelection(Z)V

    .line 448
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v3, v8}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setScaleWithContent(Z)V

    .line 450
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v4, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 451
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3, v7}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDoubleTapEnabled(Z)V

    .line 452
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3, p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 455
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 457
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lit/sephiroth/android/library/picasso/Picasso;->with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPicassoLib:Lit/sephiroth/android/library/picasso/Picasso;

    .line 460
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->createAndConfigurePreview()V

    .line 462
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v3

    if-eqz v3, :cond_128

    .line 463
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v3

    iput v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAccentColor:I

    .line 464
    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAccentColor:I

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onSetupUiTint(I)V

    .line 468
    :goto_127
    return-void

    .line 466
    :cond_128
    iput v7, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAccentColor:I

    goto :goto_127
.end method

.method public onDeactivate()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 565
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 567
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-eqz v1, :cond_f

    .line 568
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->dismiss()V

    .line 569
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    .line 572
    :cond_f
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setOnStatusChangeListener(Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;)V

    .line 573
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 575
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->removeIapDialog()Z

    .line 577
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 579
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mContentObserver:Landroid/database/ContentObserver;

    if-eqz v1, :cond_31

    .line 580
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 583
    :cond_31
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    if-eqz v1, :cond_3f

    .line 584
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v1, p0}, Landroid/support/v4/content/CursorLoader;->unregisterListener(Landroid/support/v4/content/Loader$OnLoadCompleteListener;)V

    .line 585
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v1}, Landroid/support/v4/content/CursorLoader;->stopLoading()V

    .line 587
    :cond_3f
    return-void
.end method

.method public onDeleteClick()V
    .registers 3

    .prologue
    .line 1203
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDeleteClick"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1204
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onClearCurrent(Z)V

    .line 1205
    return-void
.end method

.method public onDestroy()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 591
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 593
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 594
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListStickers:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 596
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    if-eqz v1, :cond_1b

    .line 597
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    .line 598
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 601
    .end local v0    # "cursor":Landroid/database/Cursor;
    :cond_1b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    if-eqz v1, :cond_28

    .line 602
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    .line 603
    .restart local v0    # "cursor":Landroid/database/Cursor;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 606
    .end local v0    # "cursor":Landroid/database/Cursor;
    :cond_28
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mItemsApplied:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 608
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->clearOverlays()V

    .line 609
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;

    .line 611
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    if-eqz v1, :cond_44

    .line 612
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v1}, Landroid/support/v4/content/CursorLoader;->abandon()V

    .line 613
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v1}, Landroid/support/v4/content/CursorLoader;->reset()V

    .line 617
    :cond_44
    :try_start_44
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCache:Lit/sephiroth/android/library/picasso/LruCache;

    invoke-virtual {v1}, Lit/sephiroth/android/library/picasso/LruCache;->clear()V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_49} :catch_50

    .line 622
    :goto_49
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .line 623
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    .line 624
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    .line 625
    return-void

    .line 618
    :catch_50
    move-exception v1

    goto :goto_49
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    .line 629
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDispose()V

    .line 630
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCanvas:Landroid/graphics/Canvas;

    .line 631
    return-void
.end method

.method public onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 21
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/DragEvent;

    .prologue
    .line 1255
    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getAction()I

    move-result v1

    .line 1257
    .local v1, "action":I
    packed-switch v1, :pswitch_data_15a

    .line 1328
    const/4 v13, 0x0

    :goto_8
    return v13

    .line 1259
    :pswitch_9
    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getClipDescription()Landroid/content/ClipDescription;

    move-result-object v4

    .line 1260
    .local v4, "description":Landroid/content/ClipDescription;
    if-eqz v4, :cond_2d

    const-string v13, "text/plain"

    invoke-virtual {v4, v13}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2d

    .line 1261
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getClipDescription()Landroid/content/ClipDescription;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/ClipDescription;->getLabel()Ljava/lang/CharSequence;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2d

    .line 1262
    const/4 v13, 0x1

    goto :goto_8

    .line 1265
    :cond_2d
    const/4 v13, 0x0

    goto :goto_8

    .line 1268
    .end local v4    # "description":Landroid/content/ClipDescription;
    :pswitch_2f
    const/4 v13, 0x1

    goto :goto_8

    .line 1271
    :pswitch_31
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v13, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->onDragEntered()V

    .line 1272
    const/4 v13, 0x1

    goto :goto_8

    .line 1275
    :pswitch_3c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v13, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->onDragExited()V

    .line 1276
    const/4 v13, 0x1

    goto :goto_8

    .line 1279
    :pswitch_47
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "ACTION_DROP"

    invoke-interface {v13, v14}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1281
    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getClipData()Landroid/content/ClipData;

    move-result-object v2

    .line 1282
    .local v2, "clipData":Landroid/content/ClipData;
    if-eqz v2, :cond_132

    invoke-virtual {v2}, Landroid/content/ClipData;->getItemCount()I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_132

    .line 1284
    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getClipData()Landroid/content/ClipData;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v8

    .line 1285
    .local v8, "item":Landroid/content/ClipData$Item;
    invoke-virtual {v8}, Landroid/content/ClipData$Item;->getIntent()Landroid/content/Intent;

    move-result-object v7

    .line 1287
    .local v7, "intent":Landroid/content/Intent;
    if-nez v7, :cond_6e

    .line 1288
    const/4 v13, 0x0

    goto :goto_8

    .line 1291
    :cond_6e
    const-string v13, "identifier"

    invoke-virtual {v7, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1292
    .local v6, "identifier":Ljava/lang/String;
    const-string v13, "contentPath"

    invoke-virtual {v7, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1293
    .local v3, "contentPath":Ljava/lang/String;
    const-string v13, "width"

    const/16 v14, 0x190

    invoke-virtual {v7, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    int-to-float v13, v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mScaleFactor:F

    mul-float/2addr v13, v14

    float-to-int v12, v13

    .line 1294
    .local v12, "width":I
    const-string v13, "height"

    const/16 v14, 0x190

    invoke-virtual {v7, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    int-to-float v13, v13

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mScaleFactor:F

    mul-float/2addr v13, v14

    float-to-int v5, v13

    .line 1296
    .local v5, "height":I
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_a4

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_a7

    .line 1297
    :cond_a4
    const/4 v13, 0x0

    goto/16 :goto_8

    .line 1300
    :cond_a7
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "identifier: %s, contentPath: %s, size: %dx%d"

    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v6, v15, v16

    const/16 v16, 0x1

    aput-object v3, v15, v16

    const/16 v16, 0x2

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1302
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v13

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v13

    const-string v14, "stickers: drag_suceeded"

    invoke-virtual {v13, v14}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 1303
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onApplyCurrent()V

    .line 1305
    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getX()F

    move-result v13

    float-to-int v10, v13

    .line 1306
    .local v10, "targetX":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getY()F

    move-result v13

    float-to-int v11, v13

    .line 1308
    .local v11, "targetY":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "position: %dx%d"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1310
    div-int/lit8 v13, v12, 0x2

    sub-int/2addr v10, v13

    .line 1311
    div-int/lit8 v13, v5, 0x2

    sub-int/2addr v11, v13

    .line 1313
    new-instance v9, Landroid/graphics/RectF;

    int-to-float v13, v10

    int-to-float v14, v11

    add-int v15, v10, v12

    int-to-float v15, v15

    add-int v16, v11, v5

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-direct {v9, v13, v14, v15, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1314
    .local v9, "rect":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "final rect: %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v9, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1316
    move-object/from16 v0, p0

    invoke-direct {v0, v3, v6, v9}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->addSticker(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/RectF;)V

    .line 1317
    const/4 v13, 0x1

    goto/16 :goto_8

    .line 1320
    .end local v3    # "contentPath":Ljava/lang/String;
    .end local v5    # "height":I
    .end local v6    # "identifier":Ljava/lang/String;
    .end local v7    # "intent":Landroid/content/Intent;
    .end local v8    # "item":Landroid/content/ClipData$Item;
    .end local v9    # "rect":Landroid/graphics/RectF;
    .end local v10    # "targetX":I
    .end local v11    # "targetY":I
    .end local v12    # "width":I
    :cond_132
    const/4 v13, 0x0

    goto/16 :goto_8

    .line 1323
    .end local v2    # "clipData":Landroid/content/ClipData;
    :pswitch_135
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "ACTION_DRAG_ENDED: %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p2 .. p2}, Landroid/view/DragEvent;->getResult()Z

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1324
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v13, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->onDragEntered()V

    .line 1325
    const/4 v13, 0x1

    goto/16 :goto_8

    .line 1257
    nop

    :pswitch_data_15a
    .packed-switch 0x1
        :pswitch_9
        :pswitch_2f
        :pswitch_47
        :pswitch_135
        :pswitch_31
        :pswitch_3c
    .end packed-switch
.end method

.method protected onGenerateResult()V
    .registers 2

    .prologue
    .line 635
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onApplyCurrent()V

    .line 636
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onSendEvents()V

    .line 637
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-super {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onGenerateResult(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 638
    return-void
.end method

.method public onItemClick(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/view/View;)V
    .registers 21
    .param p1, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 735
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->hideOverlay()V

    .line 737
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_c1

    .line 738
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    .line 739
    .local v4, "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemViewType()I

    move-result v12

    .line 740
    .local v12, "type":I
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getPosition()I

    move-result v10

    .line 741
    .local v10, "position":I
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemId()J

    move-result-wide v6

    .line 743
    .local v6, "id":J
    const/4 v14, 0x2

    if-ne v12, v14, :cond_31

    move-object v5, v4

    .line 744
    check-cast v5, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;

    .line 745
    .local v5, "internalViewHolder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;
    iget-object v14, v5, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;->identifier:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v6, v7, v14}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onStickerPackSelected(JLjava/lang/String;)V

    .line 780
    .end local v4    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v5    # "internalViewHolder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;
    .end local v6    # "id":J
    .end local v10    # "position":I
    .end local v12    # "type":I
    .end local p1    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    :cond_30
    :goto_30
    return-void

    .line 747
    .restart local v4    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .restart local v6    # "id":J
    .restart local v10    # "position":I
    .restart local v12    # "type":I
    .restart local p1    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    :cond_31
    const/4 v14, 0x5

    if-eq v12, v14, :cond_37

    const/4 v14, 0x6

    if-ne v12, v14, :cond_74

    .line 748
    :cond_37
    const/4 v14, 0x6

    if-ne v12, v14, :cond_71

    const-string v11, "right"

    .line 749
    .local v11, "side":Ljava/lang/String;
    :goto_3c
    new-instance v14, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    invoke-direct {v14}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;-><init>()V

    sget-object v15, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 750
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    const-string v15, "shop_list: opened"

    .line 751
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setEvent(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    const-string v15, "from"

    .line 752
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v16

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    const-string v15, "side"

    .line 753
    invoke-virtual {v14, v15, v11}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    .line 754
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->build()Landroid/os/Bundle;

    move-result-object v14

    .line 749
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->displayIAPDialog(Landroid/os/Bundle;)V

    goto :goto_30

    .line 748
    .end local v11    # "side":Ljava/lang/String;
    :cond_71
    const-string v11, "left"

    goto :goto_3c

    .line 756
    :cond_74
    const/4 v14, 0x1

    if-ne v12, v14, :cond_30

    .line 757
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemId()J

    move-result-wide v8

    .line 759
    .local v8, "packId":J
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 760
    .local v3, "extras":Landroid/os/Bundle;
    const-string v14, "extra-click-from-position"

    invoke-virtual {v3, v14, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 762
    new-instance v14, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    invoke-direct {v14}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;-><init>()V

    sget-object v15, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 764
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    .line 765
    invoke-virtual {v14, v8, v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    .line 766
    invoke-virtual {v14, v8, v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setFeaturedPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    const-string v15, "shop_details: opened"

    .line 767
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setEvent(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    const-string v15, "pack"

    check-cast v4, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    .end local v4    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    iget-object v0, v4, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->identifier:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 768
    invoke-virtual/range {v14 .. v16}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    const-string v15, "from"

    const-string v16, "featured"

    .line 769
    invoke-virtual/range {v14 .. v16}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    .line 770
    invoke-virtual {v14, v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setExtras(Landroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v14

    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->build()Landroid/os/Bundle;

    move-result-object v2

    .line 772
    .local v2, "builder":Landroid/os/Bundle;
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->displayIAPDialog(Landroid/os/Bundle;)V

    goto/16 :goto_30

    .line 775
    .end local v2    # "builder":Landroid/os/Bundle;
    .end local v3    # "extras":Landroid/os/Bundle;
    .end local v6    # "id":J
    .end local v8    # "packId":J
    .end local v10    # "position":I
    .end local v12    # "type":I
    :cond_c1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_30

    .line 776
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListStickers:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v13

    check-cast v13, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    .line 777
    .local v13, "viewHolder":Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->removeIapDialog()Z

    .line 778
    check-cast p1, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    .end local p1    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->getContentPath()Ljava/lang/String;

    move-result-object v14

    iget-object v15, v13, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->identifier:Ljava/lang/String;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v14, v15, v1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->addSticker(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/RectF;)V

    goto/16 :goto_30
.end method

.method public onLoadComplete(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .registers 35
    .param p2, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 163
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v27, v0

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "onLoadComplete: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, ", currentStatus: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-interface/range {v27 .. v28}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 165
    const/4 v15, 0x1

    .line 166
    .local v15, "newStatus":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v5

    .line 167
    .local v5, "currentstatus":I
    const/4 v6, 0x0

    .line 169
    .local v6, "cursorSize":I
    const-wide/16 v24, -0x1

    .line 170
    .local v24, "storeFeaturedPackId":J
    const/4 v14, -0x1

    .line 171
    .local v14, "lastInstalledPackIndex":I
    const/4 v7, -0x1

    .line 172
    .local v7, "firstValidIndex":I
    const-wide/16 v18, -0x1

    .line 174
    .local v18, "optionsPackId":J
    const/16 v22, 0x0

    .line 175
    .local v22, "smoothSelection":Z
    const/4 v10, 0x0

    .line 177
    .local v10, "forceUpdate":Z
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v27

    if-nez v27, :cond_50

    .line 287
    :cond_4f
    :goto_4f
    return-void

    .line 181
    :cond_50
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getStoreFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    move-result-object v11

    .line 182
    .local v11, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mFirstTime:Z

    move/from16 v27, v0

    if-nez v27, :cond_272

    if-eqz v11, :cond_272

    const/4 v4, 0x1

    .line 184
    .local v4, "checkFromIap":Z
    :goto_63
    if-eqz v4, :cond_92

    .line 185
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v27

    if-eqz v27, :cond_92

    .line 186
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v27

    const-string v28, "featured_pack_id"

    invoke-virtual/range {v27 .. v28}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 187
    .local v8, "featuredPackId":J
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v27

    const-string v28, "extra-pack-id"

    invoke-virtual/range {v27 .. v28}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v20

    .line 189
    .local v20, "packId":J
    cmp-long v27, v8, v20

    if-nez v27, :cond_92

    const-wide/16 v28, -0x1

    cmp-long v27, v8, v28

    if-lez v27, :cond_92

    .line 190
    move-wide/from16 v24, v8

    .line 191
    const-wide/16 v28, -0x1

    cmp-long v27, v24, v28

    if-lez v27, :cond_275

    const/4 v4, 0x1

    .line 196
    .end local v8    # "featuredPackId":J
    .end local v20    # "packId":J
    :cond_92
    :goto_92
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->hasOptions()Z

    move-result v27

    if-eqz v27, :cond_c6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mFirstTime:Z

    move/from16 v27, v0

    if-eqz v27, :cond_c6

    if-nez v4, :cond_c6

    .line 197
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getOptions()Landroid/os/Bundle;

    move-result-object v16

    .line 198
    .local v16, "options":Landroid/os/Bundle;
    const-string v27, "quick-packId"

    const-wide/16 v28, -0x1

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    move-wide/from16 v2, v28

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v18

    .line 199
    const-string v27, "quick-packId"

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 200
    const-string v27, "quick-contentId"

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 203
    .end local v16    # "options":Landroid/os/Bundle;
    :cond_c6
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v23, "tmpList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    if-eqz p2, :cond_194

    .line 206
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getPosition()I

    move-result v13

    .line 207
    .local v13, "index":I
    :cond_d1
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v27

    if-eqz v27, :cond_18b

    .line 208
    const/16 v27, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v26

    .line 210
    .local v26, "type":I
    const/16 v27, 0x2

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_d1

    .line 211
    const/16 v27, 0x9

    move-object/from16 v0, p2

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 212
    .restart local v20    # "packId":J
    const/16 v27, 0x3

    move-object/from16 v0, p2

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 214
    .local v12, "identifier":Ljava/lang/String;
    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mFirstTime:Z

    move/from16 v27, v0

    if-nez v27, :cond_278

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mInstalledPacks:Ljava/util/List;

    move-object/from16 v27, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v28

    invoke-interface/range {v27 .. v28}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_d1

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v27, v0

    const-string v28, "adding %d (%s) to new packs"

    const/16 v29, 0x2

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    aput-object v31, v29, v30

    const/16 v30, 0x1

    aput-object v12, v29, v30

    invoke-interface/range {v27 .. v29}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v27, v0

    const-string v28, "iapDialogFeaturedId: %d, pack_id: %d"

    const/16 v29, 0x2

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    aput-object v31, v29, v30

    const/16 v30, 0x1

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    aput-object v31, v29, v30

    invoke-interface/range {v27 .. v29}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 221
    if-eqz v4, :cond_d1

    cmp-long v27, v24, v20

    if-nez v27, :cond_d1

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v27, v0

    const-string v28, "setting new position based on featured: %d"

    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    aput-object v31, v29, v30

    invoke-interface/range {v27 .. v29}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 223
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getPosition()I

    move-result v27

    add-int/lit8 v14, v27, 0x1

    .line 224
    const/16 v22, 0x1

    .line 234
    .end local v12    # "identifier":Ljava/lang/String;
    .end local v20    # "packId":J
    .end local v26    # "type":I
    :cond_18b
    :goto_18b
    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 235
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getCount()I

    move-result v6

    .line 238
    .end local v13    # "index":I
    :cond_194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mInstalledPacks:Ljava/util/List;

    move-object/from16 v27, v0

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->clear()V

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mInstalledPacks:Ljava/util/List;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 241
    if-nez v7, :cond_1fa

    const/16 v27, 0x1

    move/from16 v0, v27

    if-ne v6, v0, :cond_1fa

    const/16 v27, 0x2

    move/from16 v0, v27

    if-eq v5, v0, :cond_1fa

    .line 244
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getPosition()I

    move-result v13

    .line 246
    .restart local v13    # "index":I
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v27

    if-eqz v27, :cond_1f4

    .line 247
    const/16 v27, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v17

    .line 249
    .local v17, "packType":I
    const/16 v27, 0x2

    move/from16 v0, v17

    move/from16 v1, v27

    if-ne v0, v1, :cond_1f4

    .line 250
    new-instance v27, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    const/16 v28, 0x0

    .line 251
    move-object/from16 v0, p2

    move/from16 v1, v28

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v28

    const/16 v30, 0x3

    .line 252
    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    invoke-direct/range {v27 .. v30}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;-><init>(JLjava/lang/String;)V

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPackInfo:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;

    .line 253
    const/4 v15, 0x2

    .line 256
    .end local v17    # "packType":I
    :cond_1f4
    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 257
    const/4 v14, -0x1

    .line 263
    .end local v13    # "index":I
    :cond_1fa
    const/16 v27, 0x2

    move/from16 v0, v27

    if-eq v5, v0, :cond_20b

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v0, v15}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    .line 267
    :cond_20b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 269
    if-ltz v14, :cond_21f

    .line 270
    const/4 v10, 0x1

    .line 271
    move v7, v14

    .line 272
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->removeIapDialog()Z

    .line 275
    :cond_21f
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v7, v10, v1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onStickersPackListUpdated(IZZ)V

    .line 278
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->openStorePanelIfRequired(J)Z

    move-result v27

    if-nez v27, :cond_4f

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v27, v0

    const-string v28, "cursorSize: %d, firstValidIndex: %d"

    const/16 v29, 0x2

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    aput-object v31, v29, v30

    const/16 v30, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    aput-object v31, v29, v30

    invoke-interface/range {v27 .. v29}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 284
    const/16 v27, 0x1

    move/from16 v0, v27

    if-le v6, v0, :cond_4f

    const/16 v27, -0x1

    move/from16 v0, v27

    if-ne v7, v0, :cond_4f

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v27

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v7, v1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->createTutorialOverlayIfNecessary(II)V

    goto/16 :goto_4f

    .line 182
    .end local v4    # "checkFromIap":Z
    .end local v23    # "tmpList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    :cond_272
    const/4 v4, 0x0

    goto/16 :goto_63

    .line 191
    .restart local v4    # "checkFromIap":Z
    .restart local v8    # "featuredPackId":J
    .restart local v20    # "packId":J
    :cond_275
    const/4 v4, 0x0

    goto/16 :goto_92

    .line 229
    .end local v8    # "featuredPackId":J
    .restart local v12    # "identifier":Ljava/lang/String;
    .restart local v13    # "index":I
    .restart local v23    # "tmpList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .restart local v26    # "type":I
    :cond_278
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getPosition()I

    move-result v7

    .line 230
    goto/16 :goto_18b
.end method

.method public bridge synthetic onLoadComplete(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 88
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onLoadComplete(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLockOpacity()V
    .registers 3

    .prologue
    .line 1221
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onLockOpacity"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1222
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getCurrentStatus()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1b

    .line 1223
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStatus:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->getPreviousStatus()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->setStatus(I)V

    .line 1225
    :cond_1b
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 16
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 1231
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v8, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v1

    .line 1232
    .local v1, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-eqz v1, :cond_30

    .line 1233
    int-to-double v6, p2

    .line 1234
    .local v6, "v":D
    const-wide v4, 0x3fb999999999999aL

    .line 1235
    .local v4, "minAlpha":D
    const-wide/high16 v8, 0x3ff0000000000000L

    sub-double v2, v8, v4

    .line 1236
    .local v2, "maxAlpha":D
    mul-double v8, v6, v2

    const-wide/high16 v10, 0x4059000000000000L

    div-double/2addr v8, v10

    add-double/2addr v8, v4

    const-wide v10, 0x406fe00000000000L

    mul-double/2addr v8, v10

    double-to-int v0, v8

    .line 1237
    .local v0, "alpha":I
    const/16 v8, 0xff

    invoke-static {v0, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    const/4 v9, 0x0

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    invoke-virtual {v1, v8}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOpacity(I)V

    .line 1240
    .end local v0    # "alpha":I
    .end local v2    # "maxAlpha":D
    .end local v4    # "minAlpha":D
    .end local v6    # "v":D
    :cond_30
    return-void
.end method

.method protected onSetupUiTint(I)V
    .registers 5
    .param p1, "accentColor"    # I

    .prologue
    .line 657
    if-eqz p1, :cond_14

    .line 658
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ViewFlipper;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 659
    .local v0, "loaderView":Landroid/view/View;
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    invoke-static {v1, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setIndeterminateProgressBarTint(Landroid/widget/ProgressBar;I)Z

    .line 661
    .end local v0    # "loaderView":Landroid/view/View;
    :cond_14
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 1245
    return-void
.end method

.method public onStatusChanged(II)V
    .registers 11
    .param p1, "oldStatus"    # I
    .param p2, "newStatus"    # I

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x2

    .line 668
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OnStatusChange: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " >> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 671
    if-eq p2, v5, :cond_29

    if-ne p1, v5, :cond_6d

    .line 672
    :cond_29
    sget v0, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_bottombar_in:I

    .line 673
    .local v0, "inAnimation":I
    sget v1, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_bottombar_out:I

    .line 678
    .local v1, "outAnimation":I
    :goto_2d
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 679
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 681
    packed-switch p2, :pswitch_data_ae

    .line 715
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unmanaged status change: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " >> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 718
    :cond_6c
    :goto_6c
    return-void

    .line 675
    .end local v0    # "inAnimation":I
    .end local v1    # "outAnimation":I
    :cond_6d
    sget v0, Lcom/aviary/android/feather/sdk/R$anim;->abc_fade_in:I

    .line 676
    .restart local v0    # "inAnimation":I
    sget v1, Lcom/aviary/android/feather/sdk/R$anim;->abc_fade_out:I

    .restart local v1    # "outAnimation":I
    goto :goto_2d

    .line 685
    :pswitch_72
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v2

    if-eq v2, v6, :cond_7f

    .line 686
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v6}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 692
    :cond_7f
    if-ne p1, v5, :cond_6c

    .line 693
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->restoreToolbarTitle()V

    .line 694
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    if-eqz v2, :cond_6c

    .line 695
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterStickers:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_6c

    .line 701
    :pswitch_8f
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->loadStickers()V

    .line 703
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v2

    if-eq v2, v5, :cond_6c

    .line 704
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v5}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    goto :goto_6c

    .line 709
    :pswitch_a0
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v2

    if-eq v2, v7, :cond_6c

    .line 710
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v7}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    goto :goto_6c

    .line 681
    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_72
        :pswitch_8f
        :pswitch_a0
    .end packed-switch
.end method

.method public onStatusUpdated(I)V
    .registers 2
    .param p1, "status"    # I

    .prologue
    .line 722
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 5
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 1249
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 1250
    .local v0, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1251
    return-void
.end method

.method protected updateInstalledPacks()V
    .registers 13

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 841
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "updateInstalledPacks"

    invoke-interface {v0, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 844
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    if-eqz v0, :cond_18

    .line 845
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v9}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 848
    :cond_18
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, v3}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->createPacksAdapter(Landroid/content/Context;Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .line 849
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mListPacks:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mAdapterPacks:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 850
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    .line 852
    .local v1, "context":Landroid/content/Context;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    if-nez v0, :cond_8b

    .line 854
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "packTray/%d/%d/%d/%d/%d/%s"

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    .line 855
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v10

    const/4 v6, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v11

    const/4 v6, 0x4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    const/4 v6, 0x5

    const-string v8, "sticker"

    aput-object v8, v5, v6

    .line 854
    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 857
    .local v7, "uri":Ljava/lang/String;
    invoke-static {v1, v7}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 858
    .local v2, "baseUri":Landroid/net/Uri;
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    .line 859
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0, v10, p0}, Landroid/support/v4/content/CursorLoader;->registerListener(ILandroid/support/v4/content/Loader$OnLoadCompleteListener;)V

    .line 861
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "packTray/sticker"

    .line 863
    invoke-static {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mContentObserver:Landroid/database/ContentObserver;

    .line 862
    invoke-virtual {v0, v3, v9, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 870
    .end local v2    # "baseUri":Landroid/net/Uri;
    .end local v7    # "uri":Ljava/lang/String;
    :cond_8b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mCursorLoaderPacks:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0}, Landroid/support/v4/content/CursorLoader;->startLoading()V

    .line 871
    return-void
.end method
