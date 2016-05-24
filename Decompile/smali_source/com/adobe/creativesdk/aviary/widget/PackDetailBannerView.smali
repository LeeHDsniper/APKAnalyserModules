.class public Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;
.super Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;
.source "PackDetailBannerView.java"

# interfaces
.implements Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
.implements Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mAttached:Z

.field private mDetailIconView:Landroid/widget/ImageView;

.field private mDetailImageView:Landroid/widget/ImageView;

.field private mFadeDetailImage:Z

.field private mIconLoaded:Z

.field private mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

.field private mPackDetailPath:Ljava/lang/String;

.field private mPackId:J

.field private mPalette:Landroid/support/v7/graphics/Palette;

.field private mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

.field mTotalAttempts:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-string v0, "PackDetailBannerView"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 131
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mTotalAttempts:I

    .line 54
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->init(Landroid/content/Context;)V

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->isValidContext()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)J
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 33
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mIconLoaded:Z

    return v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mFadeDetailImage:Z

    return v0
.end method

.method static synthetic access$400()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-object v0
.end method

.method static synthetic access$502(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;
    .param p1, "x1"    # Z

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadDetailImage(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadPackIcon()V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->onIconLoaded()V

    return-void
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Landroid/support/v7/graphics/Palette;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPalette:Landroid/support/v7/graphics/Palette;

    return-object v0
.end method

.method private init(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Picasso;->with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 59
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e0002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setAnimationDuration(I)V

    .line 60
    return-void
.end method

.method private isValidContext()Z
    .registers 2

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mAttached:Z

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private loadDetailImage(Z)V
    .registers 14
    .param p1, "loadPalette"    # Z

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 134
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "loadDetailImage(%b)"

    new-array v5, v11, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v5, v10

    invoke-interface {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 136
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->isValidContext()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 137
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "invalid context"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 140
    :cond_1e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    if-nez v0, :cond_2a

    .line 141
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "pack is null"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 221
    :goto_29
    return-void

    .line 145
    :cond_2a
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "detail path: %s"

    new-array v5, v11, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    aput-object v9, v5, v10

    invoke-interface {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 147
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mTotalAttempts:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mTotalAttempts:I

    const/4 v1, 0x4

    if-le v0, v1, :cond_48

    .line 148
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "too many attempts"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_29

    .line 152
    :cond_48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_bf

    .line 153
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    .line 154
    .local v2, "packId":J
    new-instance v4, Ljava/io/File;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 156
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_a4

    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v7

    .line 161
    .local v7, "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    invoke-virtual {v7}, Lit/sephiroth/android/library/picasso/RequestCreator;->noFade()Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 162
    invoke-virtual {v7}, Lit/sephiroth/android/library/picasso/RequestCreator;->skipMemoryCache()Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 163
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v7, v0}, Lit/sephiroth/android/library/picasso/RequestCreator;->config(Landroid/graphics/Bitmap$Config;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 164
    invoke-virtual {v7, v11}, Lit/sephiroth/android/library/picasso/RequestCreator;->fit(Z)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 168
    if-eqz p1, :cond_97

    .line 169
    new-instance v8, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;

    invoke-direct {v8, p0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;-><init>(Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)V

    .line 170
    .local v8, "transformation":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_store_detail_icon_size:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->resize(I)V

    .line 171
    invoke-virtual {v7, v8}, Lit/sephiroth/android/library/picasso/RequestCreator;->transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 174
    .end local v8    # "transformation":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;
    :cond_97
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailImageView:Landroid/widget/ImageView;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;

    move-object v1, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;JLjava/io/File;Z)V

    invoke-virtual {v7, v9, v0}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    goto :goto_29

    .line 204
    .end local v7    # "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    :cond_a4
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "file does not exists!"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 205
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    .line 206
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 208
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mIconLoaded:Z

    if-eqz v0, :cond_ba

    .line 209
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadDetailImage(Z)V

    goto/16 :goto_29

    .line 211
    :cond_ba
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadPackIcon()V

    goto/16 :goto_29

    .line 216
    .end local v2    # "packId":J
    .end local v4    # "file":Ljava/io/File;
    :cond_bf
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "need to download the detail image..."

    new-array v5, v10, [Ljava/lang/Object;

    invoke-interface {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 217
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->DETAIL_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    .line 218
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v6

    .line 219
    .local v6, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-wide v10, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    invoke-virtual {v6, v0, v10, v11, p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->downloadAsync(Landroid/content/Context;JLcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DownloaderAsyncListener;)V

    goto/16 :goto_29
.end method

.method private loadPackIcon()V
    .registers 6

    .prologue
    .line 224
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "loadPackIcon"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 226
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->isValidContext()Z

    move-result v3

    if-nez v3, :cond_15

    .line 227
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "invalid context"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 257
    :goto_14
    return-void

    .line 231
    :cond_15
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    .line 232
    .local v0, "packId":J
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getIconPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v2

    .line 233
    .local v2, "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/RequestCreator;->noFade()Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 234
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/RequestCreator;->skipMemoryCache()Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 235
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lit/sephiroth/android/library/picasso/RequestCreator;->fit(Z)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 237
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailIconView:Landroid/widget/ImageView;

    new-instance v4, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;

    invoke-direct {v4, p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;J)V

    invoke-virtual {v2, v3, v4}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    goto :goto_14
.end method

.method private onIconLoaded()V
    .registers 5

    .prologue
    .line 260
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mIconLoaded:Z

    .line 261
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$3;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)V

    const-wide/16 v2, 0x258

    invoke-virtual {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 269
    return-void
.end method

.method private onPaletteAvailable(Landroid/support/v7/graphics/Palette;)V
    .registers 6
    .param p1, "palette"    # Landroid/support/v7/graphics/Palette;

    .prologue
    .line 284
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->isValidContext()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 285
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPalette:Landroid/support/v7/graphics/Palette;

    .line 286
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    invoke-direct {v1, p1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;-><init>(Landroid/support/v7/graphics/Palette;J)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 288
    :cond_16
    return-void
.end method


# virtual methods
.method public clearAll()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 91
    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mTotalAttempts:I

    .line 92
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPalette:Landroid/support/v7/graphics/Palette;

    .line 93
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mIconLoaded:Z

    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 98
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    if-eqz v0, :cond_29

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 103
    :cond_29
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .line 104
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    .line 105
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    .line 107
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getDisplayedChild()I

    move-result v0

    if-eqz v0, :cond_3a

    .line 108
    invoke-virtual {p0, v3, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setDisplayedChild(IZ)V

    .line 110
    :cond_3a
    return-void
.end method

.method public load(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V
    .registers 8
    .param p1, "pack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 113
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "load: %s"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 114
    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mTotalAttempts:I

    .line 115
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .line 116
    if-eqz p1, :cond_3b

    .line 117
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    .line 118
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDetailImageLocalPath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    .line 120
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3c

    .line 121
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 122
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 123
    invoke-direct {p0, v5}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadDetailImage(Z)V

    .line 129
    .end local v0    # "file":Ljava/io/File;
    :cond_3b
    :goto_3b
    return-void

    .line 127
    :cond_3c
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadPackIcon()V

    goto :goto_3b
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 71
    invoke-super {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAttachedToWindow()V

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mAttached:Z

    .line 73
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 77
    invoke-super {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onDetachedFromWindow()V

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mAttached:Z

    .line 79
    return-void
.end method

.method public onDownloadComplete(JLjava/lang/String;)V
    .registers 7
    .param p1, "packId"    # J
    .param p3, "path"    # Ljava/lang/String;

    .prologue
    .line 292
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->isValidContext()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_1c

    .line 293
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 294
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;

    .line 295
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPalette:Landroid/support/v7/graphics/Palette;

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    :goto_19
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadDetailImage(Z)V

    .line 298
    :cond_1c
    return-void

    .line 295
    :cond_1d
    const/4 v0, 0x0

    goto :goto_19
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 64
    invoke-super {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onFinishInflate()V

    .line 65
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image1:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailIconView:Landroid/widget/ImageView;

    .line 66
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image2:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mDetailImageView:Landroid/widget/ImageView;

    .line 67
    return-void
.end method

.method public onGenerated(Landroid/support/v7/graphics/Palette;)V
    .registers 4
    .param p1, "palette"    # Landroid/support/v7/graphics/Palette;

    .prologue
    .line 302
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onGenerated"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 303
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->onPaletteAvailable(Landroid/support/v7/graphics/Palette;)V

    .line 304
    return-void
.end method

.method public setFadeDetailImage(Z)V
    .registers 7
    .param p1, "value"    # Z

    .prologue
    .line 86
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "setFadeDetailImage: %b"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 87
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mFadeDetailImage:Z

    .line 88
    return-void
.end method
