.class public Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
.super Landroid/widget/RelativeLayout;
.source "PackDetailPreviews.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;,
        Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;,
        Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;,
        Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewStickerViewHolder;,
        Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;
    }
.end annotation


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field detector:Landroid/view/GestureDetector;

.field listener:Landroid/view/GestureDetector$OnGestureListener;

.field private mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

.field private mAttached:Z

.field private mDividerWidth:I

.field private mErrorView:Landroid/view/View;

.field private mGridColumns:I

.field private mGridHiddenHeight:I

.field private mHeadBottom:I

.field private mHeadPaddingBottom:I

.field private mInterceptTouchEvents:Z

.field private mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

.field private mLoadTask:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

.field private mPackId:J

.field private mPackIdentifier:Ljava/lang/String;

.field private mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field private mProgressBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

.field private mRecyclerScrolled:Z

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mShopBackgroundColor:Ljava/lang/String;

.field private scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 54
    const-string v0, "PackDetailPreviews"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 113
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 116
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 77
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->listener:Landroid/view/GestureDetector$OnGestureListener;

    .line 117
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->init(Landroid/content/Context;)V

    .line 118
    new-instance v0, Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->listener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->detector:Landroid/view/GestureDetector;

    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->detector:Landroid/view/GestureDetector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 120
    return-void
.end method

.method static synthetic access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 1

    .prologue
    .line 53
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerScrolled:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->isValidContext()Z

    move-result v0

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
    .param p1, "x1"    # Z

    .prologue
    .line 53
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerScrolled:Z

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Landroid/database/Cursor;DLjava/lang/String;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
    .param p1, "x1"    # Landroid/database/Cursor;
    .param p2, "x2"    # D
    .param p4, "x3"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->showPreviews(Landroid/database/Cursor;DLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridHiddenHeight:I

    return v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    return v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)J
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackId:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->hideError()V

    return-void
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->showProgress()V

    return-void
.end method

.method private hideError()V
    .registers 4

    .prologue
    .line 278
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "hideError"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 279
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mErrorView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 280
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mErrorView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    return-void
.end method

.method private hideProgress()V
    .registers 2

    .prologue
    .line 288
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mProgressBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->hide()V

    .line 289
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 123
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Landroid/content/Context;Landroid/database/Cursor;Z)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    .line 124
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager;

    const/4 v1, 0x3

    const/4 v2, 0x1

    invoke-direct {v0, p1, v1, v2, v3}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    .line 125
    return-void
.end method

.method private isValidContext()Z
    .registers 2

    .prologue
    .line 195
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAttached:Z

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private loadPreviewsInternal()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 229
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->isValidContext()Z

    move-result v0

    if-eqz v0, :cond_97

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_97

    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackIdentifier:Ljava/lang/String;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 231
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "RecyclerView tag is the same. skipping load"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 257
    :goto_2d
    return-void

    .line 235
    :cond_2e
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-ne v0, v1, :cond_73

    .line 236
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_store_preview_columns_effects:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    .line 237
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_store_preview_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mDividerWidth:I

    .line 246
    :goto_4c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 248
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLoadTask:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

    if-eqz v0, :cond_5c

    .line 249
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLoadTask:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->cancel(Z)Z

    .line 252
    :cond_5c
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLoadTask:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

    .line 253
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLoadTask:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

    new-array v1, v5, [Ljava/lang/Long;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->executeInParallel([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_2d

    .line 238
    :cond_73
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-ne v0, v1, :cond_88

    .line 239
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_store_preview_columns_frames:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    .line 240
    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mDividerWidth:I

    goto :goto_4c

    .line 242
    :cond_88
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_store_preview_columns_stickers:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    .line 243
    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mDividerWidth:I

    goto :goto_4c

    .line 255
    :cond_97
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "invalid context"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_2d
.end method

.method private reload()V
    .registers 3

    .prologue
    .line 223
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "reload"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    .line 225
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->loadPreviewsInternal()V

    .line 226
    return-void
.end method

.method private showError()V
    .registers 3

    .prologue
    .line 272
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "showError"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 273
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mErrorView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 274
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mErrorView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 275
    return-void
.end method

.method private showPreviews(Landroid/database/Cursor;DLjava/lang/String;)V
    .registers 31
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "aspectRatio"    # D
    .param p4, "previewPath"    # Ljava/lang/String;

    .prologue
    .line 293
    if-nez p1, :cond_10

    .line 294
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "cursor is null"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 295
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->showError()V

    .line 296
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->hideProgress()V

    .line 417
    :goto_f
    return-void

    .line 300
    :cond_10
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cursor size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 302
    const/4 v13, 0x0

    .line 303
    .local v13, "previewHeight":I
    const/16 v16, 0x0

    .line 305
    .local v16, "previewWidth":I
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->hideProgress()V

    .line 306
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerScrolled:Z

    .line 308
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_ba

    .line 309
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v23

    .line 310
    .local v23, "width":I
    if-lez v23, :cond_155

    .line 311
    move/from16 v22, v23

    .line 312
    .local v22, "totalWidth":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mDividerWidth:I

    if-lez v3, :cond_5f

    .line 313
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mDividerWidth:I

    mul-int/2addr v3, v4

    sub-int v22, v23, v3

    .line 316
    :cond_5f
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    div-int v16, v22, v3

    .line 317
    move/from16 v0, v16

    int-to-double v4, v0

    div-double v4, v4, p2

    double-to-int v13, v4

    .line 319
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "width: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 320
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "dividerWidth: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mDividerWidth:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 321
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "totalWidth: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 322
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "previewSize:%dx%d "

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 343
    .end local v22    # "totalWidth":I
    .end local v23    # "width":I
    :cond_ba
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mDividerWidth:I

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->setDividerSize(I)V

    .line 344
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    move/from16 v0, v16

    invoke-virtual {v3, v0, v13}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->setPreviewSize(II)V

    .line 345
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->setPreviewPath(Ljava/lang/String;)V

    .line 346
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getPreviewItemExt(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->setFileExt(Ljava/lang/String;)V

    .line 347
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    .line 349
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mShopBackgroundColor:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_178

    .line 350
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mShopBackgroundColor:Ljava/lang/String;

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->setBackgroundColor(I)V

    .line 355
    :goto_10a
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mHeadBottom:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mHeadPaddingBottom:I

    sub-int/2addr v3, v4

    move-object/from16 v0, p0

    iput v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridHiddenHeight:I

    .line 361
    new-instance v9, Landroid/database/MatrixCursor;

    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    invoke-direct {v9, v3, v4}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    .line 362
    .local v9, "cursor1":Landroid/database/MatrixCursor;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_125
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    if-ge v12, v3, :cond_18a

    .line 363
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    add-int/lit8 v5, v12, 0x1

    neg-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, ""

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/4 v5, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, ""

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, ""

    aput-object v5, v3, v4

    invoke-virtual {v9, v3}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 362
    add-int/lit8 v12, v12, 0x1

    goto :goto_125

    .line 325
    .end local v9    # "cursor1":Landroid/database/MatrixCursor;
    .end local v12    # "i":I
    .restart local v23    # "width":I
    :cond_155
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "need to wait for recycler view measurements..."

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 327
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v24

    new-instance v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-wide/from16 v6, p2

    move-object/from16 v8, p4

    invoke-direct/range {v3 .. v8}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Landroid/database/Cursor;DLjava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto/16 :goto_f

    .line 352
    .end local v23    # "width":I
    :cond_178
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/aviary/android/feather/sdk/R$color;->com_adobe_image_store_preview_default_background:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->setBackgroundColor(I)V

    goto :goto_10a

    .line 366
    .restart local v9    # "cursor1":Landroid/database/MatrixCursor;
    .restart local v12    # "i":I
    :cond_18a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-eq v3, v4, :cond_306

    .line 367
    new-instance v10, Landroid/database/MatrixCursor;

    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    invoke-direct {v10, v3, v4}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    .line 369
    .local v10, "cursor2":Landroid/database/MatrixCursor;
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-virtual {v9}, Landroid/database/MatrixCursor;->getCount()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    int-to-long v14, v3

    .line 370
    .local v14, "index":J
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->moveToLast()Z

    move-result v3

    if-eqz v3, :cond_1c2

    .line 371
    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    const-wide/16 v6, 0x64

    add-long v14, v4, v6

    .line 372
    const/4 v3, -0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 375
    :cond_1c2
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    rem-int/2addr v3, v4

    if-eqz v3, :cond_20b

    .line 376
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    rem-int/2addr v4, v5

    sub-int v20, v3, v4

    .line 377
    .local v20, "toAdd":I
    const/4 v12, 0x0

    :goto_1dd
    move/from16 v0, v20

    if-ge v12, v0, :cond_20b

    .line 378
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-wide/16 v6, 0x1

    add-long/2addr v14, v6

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, ""

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/4 v5, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, ""

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, ""

    aput-object v5, v3, v4

    invoke-virtual {v10, v3}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 377
    add-int/lit8 v12, v12, 0x1

    goto :goto_1dd

    .line 382
    .end local v20    # "toAdd":I
    :cond_20b
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-virtual {v10}, Landroid/database/MatrixCursor;->getCount()I

    move-result v4

    add-int/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    div-int v17, v3, v4

    .line 383
    .local v17, "rows":I
    mul-int v18, v17, v13

    .line 384
    .local v18, "rowsHeight":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridHiddenHeight:I

    add-int v21, v3, v18

    .line 385
    .local v21, "totalGridHeight":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v0, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v19, v0

    .line 388
    .local v19, "screenHeight":I
    move/from16 v0, v21

    move/from16 v1, v19

    if-ge v0, v1, :cond_2c8

    .line 389
    :goto_234
    move/from16 v0, v21

    move/from16 v1, v19

    if-ge v0, v1, :cond_2c8

    .line 390
    const/4 v12, 0x0

    :goto_23b
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    if-ge v12, v3, :cond_26b

    .line 391
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-wide/16 v6, 0x1

    add-long/2addr v14, v6

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, ""

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/4 v5, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, ""

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, ""

    aput-object v5, v3, v4

    invoke-virtual {v10, v3}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 390
    add-int/lit8 v12, v12, 0x1

    goto :goto_23b

    .line 393
    :cond_26b
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-virtual {v10}, Landroid/database/MatrixCursor;->getCount()I

    move-result v4

    add-int/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    div-int v17, v3, v4

    .line 394
    mul-int v18, v17, v13

    .line 395
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridHiddenHeight:I

    add-int v21, v3, v18

    .line 397
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "rows: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 398
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "rowsHeigth: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 399
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "totalGridHeight: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 400
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "screenHeight: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_234

    .line 404
    :cond_2c8
    new-instance v11, Landroid/database/MergeCursor;

    const/4 v3, 0x3

    new-array v3, v3, [Landroid/database/Cursor;

    const/4 v4, 0x0

    aput-object v9, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    aput-object v10, v3, v4

    invoke-direct {v11, v3}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    .line 409
    .end local v10    # "cursor2":Landroid/database/MatrixCursor;
    .end local v14    # "index":J
    .end local v17    # "rows":I
    .end local v18    # "rowsHeight":I
    .end local v19    # "screenHeight":I
    .end local v21    # "totalGridHeight":I
    .local v11, "finalCursor":Landroid/database/Cursor;
    :goto_2d9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    invoke-virtual {v3, v11}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 411
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-eq v3, v4, :cond_2f9

    .line 413
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_slide_in_bottom_preview_stickers:I

    invoke-static {v3, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v2

    .line 414
    .local v2, "animation":Landroid/view/animation/Animation;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/RecyclerView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 416
    .end local v2    # "animation":Landroid/view/animation/Animation;
    :cond_2f9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackIdentifier:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_f

    .line 406
    .end local v11    # "finalCursor":Landroid/database/Cursor;
    :cond_306
    new-instance v11, Landroid/database/MergeCursor;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/database/Cursor;

    const/4 v4, 0x0

    aput-object v9, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    invoke-direct {v11, v3}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    .restart local v11    # "finalCursor":Landroid/database/Cursor;
    goto :goto_2d9
.end method

.method private showProgress()V
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mProgressBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->show()V

    .line 285
    return-void
.end method


# virtual methods
.method public clearAll()V
    .registers 6

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 260
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLoadTask:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

    if-eqz v0, :cond_b

    .line 261
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLoadTask:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->cancel(Z)Z

    .line 263
    :cond_b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    .line 264
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 266
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v4, v3}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 268
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->hideError()V

    .line 269
    return-void
.end method

.method public getInterceptTouchEventEnabled()Z
    .registers 2

    .prologue
    .line 133
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mInterceptTouchEvents:Z

    return v0
.end method

.method public loadPreviews(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;ZLandroid/view/View;)V
    .registers 6
    .param p1, "pack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .param p2, "forceReload"    # Z
    .param p3, "headView"    # Landroid/view/View;

    .prologue
    .line 203
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "loadPreviews"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 205
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackId:J

    .line 206
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 207
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackIdentifier:Ljava/lang/String;

    .line 208
    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mHeadBottom:I

    .line 209
    invoke-virtual {p3}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mHeadPaddingBottom:I

    .line 211
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getShopBackgroundColor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mShopBackgroundColor:Ljava/lang/String;

    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mProgressBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mHeadBottom:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->setTranslationY(F)V

    .line 214
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mErrorView:Landroid/view/View;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mHeadBottom:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 216
    if-eqz p2, :cond_4b

    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    .line 219
    :cond_4b
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->loadPreviewsInternal()V

    .line 220
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 180
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onAttachedToWindow"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAttached:Z

    .line 182
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    .line 183
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->loadPreviewsInternal()V

    .line 184
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 421
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mErrorView:Landroid/view/View;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 422
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->reload()V

    .line 424
    :cond_b
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 188
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 189
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 190
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackId:J

    .line 191
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAttached:Z

    .line 192
    return-void
.end method

.method protected onFinishInflate()V
    .registers 3

    .prologue
    .line 151
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 152
    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 153
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mProgressBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    .line 154
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->error:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mErrorView:Landroid/view/View;

    .line 156
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mAdapter:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 176
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 138
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v2, :cond_24

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mInterceptTouchEvents:Z

    if-eqz v2, :cond_24

    .line 139
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object v1

    .line 140
    .local v1, "view":Landroid/view/View;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    .line 141
    .local v0, "position":I
    if-ltz v0, :cond_24

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I

    if-ge v0, v2, :cond_24

    .line 142
    const/4 v2, 0x1

    .line 146
    .end local v0    # "position":I
    .end local v1    # "view":Landroid/view/View;
    :goto_23
    return v2

    :cond_24
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_23
.end method

.method public resetPositions()V
    .registers 3

    .prologue
    .line 427
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 428
    return-void
.end method

.method public setInterceptTouchEventEnabled(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 128
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mInterceptTouchEvents:Z

    .line 129
    return-void
.end method

.method public setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .registers 2
    .param p1, "scrollListener"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 199
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->scrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 200
    return-void
.end method
