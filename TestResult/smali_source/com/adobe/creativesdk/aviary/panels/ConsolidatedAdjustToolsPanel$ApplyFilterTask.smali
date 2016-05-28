.class Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "ConsolidatedAdjustToolsPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ApplyFilterTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Landroid/graphics/Bitmap;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

.field isPreview:Z

.field mCurrentBitmap:Landroid/graphics/Bitmap;

.field mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

.field mShowProgress:Z

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;ZZ)V
    .registers 12
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;
    .param p2, "showProgress"    # Z
    .param p3, "isPreview"    # Z

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 376
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 377
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isPreview:Z

    .line 378
    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mShowProgress:Z

    .line 379
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    .line 381
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    if-eqz v0, :cond_63

    .line 382
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->convertValue(F)D

    move-result-wide v2

    invoke-virtual {v0, v4, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;->setAdjustTool(ID)V

    .line 383
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v5}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->convertValue(F)D

    move-result-wide v2

    invoke-virtual {v0, v5, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;->setAdjustTool(ID)V

    .line 384
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v6}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->convertValue(F)D

    move-result-wide v2

    invoke-virtual {v0, v6, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;->setAdjustTool(ID)V

    .line 385
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v7}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->convertValue(F)D

    move-result-wide v2

    invoke-virtual {v0, v7, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;->setAdjustTool(ID)V

    .line 387
    :cond_63
    return-void
.end method

.method private acquireBitmap(Z)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "fake"    # Z

    .prologue
    .line 413
    if-eqz p1, :cond_2a

    .line 414
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    .line 415
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x3

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    .line 416
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    .line 417
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    .line 414
    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 419
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 423
    :goto_29
    return-object v0

    .line 421
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_29
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 9
    .param p1, "arg0"    # [Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 428
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_b

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    if-nez v1, :cond_d

    :cond_b
    move-object v1, v2

    .line 459
    :goto_c
    return-object v1

    .line 432
    :cond_d
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isPreview:Z

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->acquireBitmap(Z)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    .line 434
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1d

    move-object v1, v2

    .line 435
    goto :goto_c

    .line 439
    :cond_1d
    :try_start_1d
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isPreview:Z

    if-eqz v1, :cond_3e

    .line 440
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-interface {v1, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;->prepare(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    .line 444
    :goto_31
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->execute()V

    .line 446
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_57

    move-object v1, v2

    .line 447
    goto :goto_c

    .line 442
    :cond_3e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-interface {v1, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;->prepare(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    :try_end_50
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_50} :catch_51

    goto :goto_31

    .line 451
    :catch_51
    move-exception v0

    .line 452
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    move-object v1, v2

    .line 453
    goto :goto_c

    .line 450
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_57
    :try_start_57
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v1

    iput-object v1, v3, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    :try_end_63
    .catch Ljava/lang/Throwable; {:try_start_57 .. :try_end_63} :catch_51

    .line 456
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_6b

    move-object v1, v2

    .line 457
    goto :goto_c

    .line 459
    :cond_6b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    goto :goto_c
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 369
    check-cast p1, [Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Landroid/graphics/Bitmap;)V
    .registers 9
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 464
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onPostExecute, isPreview: %b"

    new-array v3, v6, [Ljava/lang/Object;

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isPreview:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 465
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->isActive()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 492
    :goto_1d
    return-void

    .line 469
    :cond_1e
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mShowProgress:Z

    if-eqz v1, :cond_27

    .line 470
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onProgressEnd()V

    .line 473
    :cond_27
    if-eqz p1, :cond_6a

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_6a

    .line 474
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isPreview:Z

    if-eqz v1, :cond_64

    .line 475
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-direct {v0, p1, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;-><init>(Landroid/graphics/Bitmap;II)V

    .line 476
    .local v0, "drawable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1, v0, v5, v6}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onPreviewChanged(Landroid/graphics/drawable/Drawable;ZZ)V

    .line 480
    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;
    :goto_4d
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setIsChanged(Z)V

    .line 481
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iput-object p1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 488
    :goto_56
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->isPreview:Z

    if-nez v1, :cond_5e

    .line 489
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iput-boolean v5, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    .line 491
    :cond_5e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

    goto :goto_1d

    .line 478
    :cond_64
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1, p1, v5, v6}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V

    goto :goto_4d

    .line 483
    :cond_6a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 484
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2, v5, v6}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V

    .line 485
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v1, v5}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setIsChanged(Z)V

    goto :goto_56
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 369
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->doPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 2

    .prologue
    .line 391
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    if-eqz v0, :cond_d

    .line 392
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mShowProgress:Z

    if-eqz v0, :cond_d

    .line 393
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onProgressStart()V

    .line 396
    :cond_d
    return-void
.end method

.method protected onCancelled()V
    .registers 2

    .prologue
    .line 400
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->onCancelled()V

    .line 401
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    if-eqz v0, :cond_c

    .line 402
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->cancel()V

    .line 404
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1d

    .line 405
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 406
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 409
    :cond_1d
    return-void
.end method
