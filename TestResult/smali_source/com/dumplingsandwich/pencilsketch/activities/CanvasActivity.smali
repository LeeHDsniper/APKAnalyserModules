.class public Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "CanvasActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;,
        Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;
    }
.end annotation


# static fields
.field public static final imageResIds:[Ljava/lang/Integer;


# instance fields
.field private final ACTION_REQUEST_DOODLE_BOARD:I

.field private files_to_delete:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private mAdapter:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;

.field private mMemoryCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mPager:Landroid/support/v4/view/ViewPager;

.field private radioGroup:Landroid/widget/RadioGroup;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 50
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    const v2, 0x7f0200c7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const v2, 0x7f0200ce

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const v2, 0x7f0200cf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const v2, 0x7f0200d0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const v2, 0x7f0200d1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const v2, 0x7f0200d2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const v2, 0x7f0200d3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const v2, 0x7f0200d4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const v2, 0x7f0200d5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const v2, 0x7f0200c8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const v2, 0x7f0200c9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const v2, 0x7f0200ca

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const v2, 0x7f0200cb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const v2, 0x7f0200cc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const v2, 0x7f0200cd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    sput-object v0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->imageResIds:[Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 42
    const/16 v0, 0x64

    iput v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->ACTION_REQUEST_DOODLE_BOARD:I

    .line 192
    return-void
.end method

.method static synthetic access$000(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;)Landroid/widget/RadioGroup;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->radioGroup:Landroid/widget/RadioGroup;

    return-object v0
.end method

.method private displayProperResult(Z)V
    .registers 5
    .param p1, "shouldSaveImage"    # Z

    .prologue
    .line 275
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->isAdmobInterstitialReady()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 276
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->displayAdmobInterstitial()V

    .line 281
    :cond_9
    :goto_9
    return-void

    .line 277
    :cond_a
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->isFacebookInterstitialReady()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 278
    invoke-static {}, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->displayFacebookInterstitialAd()V

    goto :goto_9

    .line 279
    :cond_14
    if-eqz p1, :cond_9

    .line 280
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Image Saved in \"Pencil_Sketch\" Folder!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_9
.end method

.method private initializeMemCache()V
    .registers 7

    .prologue
    .line 104
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v2

    const-wide/16 v4, 0x400

    div-long/2addr v2, v4

    long-to-int v1, v2

    .line 107
    .local v1, "maxMemory":I
    div-int/lit8 v0, v1, 0x8

    .line 108
    .local v0, "cacheSize":I
    new-instance v2, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$2;

    invoke-direct {v2, p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$2;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;I)V

    iput-object v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mMemoryCache:Landroid/support/v4/util/LruCache;

    .line 115
    return-void
.end method

.method private initializePager()V
    .registers 4

    .prologue
    .line 69
    new-instance v0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;

    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    sget-object v2, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->imageResIds:[Ljava/lang/Integer;

    array-length v2, v2

    invoke-direct {v0, p0, v1, v2}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;Landroid/support/v4/app/FragmentManager;I)V

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mAdapter:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;

    .line 70
    const v0, 0x7f0f0093

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mPager:Landroid/support/v4/view/ViewPager;

    .line 71
    const v0, 0x7f0f0094

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->radioGroup:Landroid/widget/RadioGroup;

    .line 72
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mPager:Landroid/support/v4/view/ViewPager;

    new-instance v1, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;

    invoke-direct {v1, p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$1;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 99
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mAdapter:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 100
    return-void
.end method

.method private launchDoodleBoard(Landroid/net/Uri;)V
    .registers 15
    .param p1, "imageUri"    # Landroid/net/Uri;

    .prologue
    const/16 v12, 0x64

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 229
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "extStorageDirectory":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    const-string v6, "Pencil_Sketch"

    invoke-direct {v2, v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    .local v2, "imageFolder":Ljava/io/File;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Pencil_Sketch"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".jpg"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, "fileName":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 234
    .local v4, "output_file":Ljava/io/File;
    const/4 v6, 0x5

    new-array v5, v6, [Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v6, v5, v10

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v6, v5, v11

    const/4 v6, 0x2

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v7, v5, v6

    const/4 v6, 0x3

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v7, v5, v6

    const/4 v6, 0x4

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    aput-object v7, v5, v6

    .line 239
    .local v5, "tools":[Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    new-instance v6, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    invoke-direct {v6, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->setData(Landroid/net/Uri;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "file://"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutput(Landroid/net/Uri;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutputFormat(Landroid/graphics/Bitmap$CompressFormat;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp5:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutputSize(Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withNoExitConfirmation(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->saveWithNoChanges(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    invoke-virtual {v6, v11}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withAutoColorEnabled(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    invoke-virtual {v6, v12}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withOutputQuality(I)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    invoke-virtual {v6, v11}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withVibrationEnabled(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->withToolList([Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->build()Landroid/content/Intent;

    move-result-object v3

    .line 253
    .local v3, "newIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v3, v12}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 254
    return-void
.end method


# virtual methods
.method public addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 152
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_b

    .line 153
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    :cond_b
    return-void
.end method

.method public getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public loadBitmap(ILandroid/widget/ImageView;)V
    .registers 9
    .param p1, "resId"    # I
    .param p2, "mImageView"    # Landroid/widget/ImageView;

    .prologue
    .line 162
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 164
    .local v1, "imageKey":Ljava/lang/String;
    iget-object v3, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v3, v1}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 165
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_12

    .line 166
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 171
    :goto_11
    return-void

    .line 168
    :cond_12
    new-instance v2, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;

    invoke-direct {v2, p0, p2}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;Landroid/widget/ImageView;)V

    .line 169
    .local v2, "task":Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Integer;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_11
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 11
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 258
    packed-switch p1, :pswitch_data_28

    .line 272
    :goto_5
    return-void

    .line 261
    :pswitch_6
    const/4 v5, -0x1

    if-ne p2, v5, :cond_26

    move v2, v3

    .line 262
    .local v2, "shouldSaveImage":Z
    :goto_a
    if-eqz v2, :cond_22

    .line 264
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 265
    .local v0, "aviaryImageUri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 266
    .local v1, "aviaryPath":Ljava/lang/String;
    new-array v5, v3, [Ljava/lang/String;

    aput-object v1, v5, v4

    new-array v3, v3, [Ljava/lang/String;

    const-string v6, "image/jpeg"

    aput-object v6, v3, v4

    const/4 v4, 0x0

    invoke-static {p0, v5, v3, v4}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 269
    .end local v0    # "aviaryImageUri":Landroid/net/Uri;
    .end local v1    # "aviaryPath":Ljava/lang/String;
    :cond_22
    invoke-direct {p0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->displayProperResult(Z)V

    goto :goto_5

    .end local v2    # "shouldSaveImage":Z
    :cond_26
    move v2, v4

    .line 261
    goto :goto_a

    .line 258
    :pswitch_data_28
    .packed-switch 0x64
        :pswitch_6
    .end packed-switch
.end method

.method public onBackPressed()V
    .registers 3

    .prologue
    .line 286
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 288
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 286
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 292
    :cond_17
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v1}, Landroid/support/v4/util/LruCache;->evictAll()V

    .line 294
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V

    .line 295
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 59
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 60
    const v0, 0x7f03001d

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->setContentView(I)V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->files_to_delete:Ljava/util/ArrayList;

    .line 64
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->initializePager()V

    .line 65
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->initializeMemCache()V

    .line 66
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 121
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f10000c

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 122
    const/4 v1, 0x1

    return v1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 12
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 128
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v7

    packed-switch v7, :pswitch_data_56

    .line 148
    :goto_7
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v7

    return v7

    .line 131
    :pswitch_c
    iget-object v7, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v7}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v3

    .line 132
    .local v3, "position":I
    sget-object v7, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->imageResIds:[Ljava/lang/Integer;

    aget-object v7, v7, v3

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 133
    .local v4, "resId":I
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 134
    .local v2, "imageKey":Ljava/lang/String;
    iget-object v7, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v7, v2}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 135
    .local v0, "canvas":Landroid/graphics/Bitmap;
    if-nez v0, :cond_44

    .line 136
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 137
    .local v1, "display":Landroid/view/Display;
    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    .line 138
    .local v5, "size":Landroid/graphics/Point;
    invoke-virtual {v1, v5}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 140
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    iget v8, v5, Landroid/graphics/Point;->x:I

    iget v9, v5, Landroid/graphics/Point;->y:I

    invoke-static {v7, v4, v8, v9}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->decodeResource(Landroid/content/res/Resources;III)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 143
    .end local v1    # "display":Landroid/view/Display;
    .end local v5    # "size":Landroid/graphics/Point;
    :cond_44
    const/4 v7, 0x0

    invoke-static {p0, v0, v7}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->saveImageOnPhone(Landroid/content/Context;Landroid/graphics/Bitmap;Z)Ljava/io/File;

    move-result-object v6

    .line 144
    .local v6, "temporaryEditFile":Ljava/io/File;
    iget-object v7, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->launchDoodleBoard(Landroid/net/Uri;)V

    goto :goto_7

    .line 128
    :pswitch_data_56
    .packed-switch 0x7f0f031c
        :pswitch_c
    .end packed-switch
.end method
