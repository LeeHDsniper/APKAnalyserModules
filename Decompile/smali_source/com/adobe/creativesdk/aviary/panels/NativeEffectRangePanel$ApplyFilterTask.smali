.class Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "NativeEffectRangePanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;
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

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;FZZ)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;
    .param p2, "value"    # F
    .param p3, "showProgress"    # Z
    .param p4, "isPreview"    # Z

    .prologue
    .line 205
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 206
    iput-boolean p4, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isPreview:Z

    .line 207
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mShowProgress:Z

    .line 208
    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    if-eqz v0, :cond_22

    .line 209
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;->setValue(Ljava/lang/Float;)V

    .line 212
    :cond_22
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 9
    .param p1, "arg0"    # [Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 239
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_b

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    if-nez v1, :cond_d

    :cond_b
    move-object v1, v2

    .line 270
    :goto_c
    return-object v1

    .line 244
    :cond_d
    :try_start_d
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isPreview:Z

    if-eqz v1, :cond_67

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_67

    .line 245
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    .line 246
    # getter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    .line 247
    # getter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    .line 248
    # getter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    .line 245
    invoke-static {v1, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    .line 249
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-interface {v1, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;->prepare(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    .line 253
    :goto_51
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->execute()V

    .line 255
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_82

    .line 256
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "isCancelled... return null"

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    move-object v1, v2

    .line 257
    goto :goto_c

    .line 251
    :cond_67
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-interface {v1, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;->prepare(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    :try_end_7b
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_7b} :catch_7c

    goto :goto_51

    .line 262
    :catch_7c
    move-exception v0

    .line 263
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    move-object v1, v2

    .line 264
    goto :goto_c

    .line 260
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_82
    :try_start_82
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$100(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    move-result-object v3

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;->getValue()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setValue(Ljava/lang/Object;)V

    .line 261
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v1

    # setter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    invoke-static {v3, v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$202(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    :try_end_a4
    .catch Ljava/lang/Throwable; {:try_start_82 .. :try_end_a4} :catch_7c

    .line 267
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_ad

    move-object v1, v2

    .line 268
    goto/16 :goto_c

    .line 270
    :cond_ad
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->outputBitmap:Landroid/graphics/Bitmap;

    goto/16 :goto_c
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 198
    check-cast p1, [Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Landroid/graphics/Bitmap;)V
    .registers 9
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 275
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onPostExecute, isPreview: %b, result: %s"

    new-array v2, v6, [Ljava/lang/Object;

    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isPreview:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v4

    aput-object p1, v2, v5

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 276
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->isActive()Z

    move-result v0

    if-nez v0, :cond_21

    .line 300
    :goto_20
    return-void

    .line 280
    :cond_21
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mShowProgress:Z

    if-eqz v0, :cond_2a

    .line 281
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onProgressEnd()V

    .line 284
    :cond_2a
    if-eqz p1, :cond_87

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_87

    .line 285
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "result size: %dx%d"

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 287
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallDrawable:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$300(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->updateBitmap(Landroid/graphics/Bitmap;II)V

    .line 288
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onPreviewUpdated()V

    .line 289
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isPreview:Z

    if-nez v0, :cond_78

    .line 290
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->setIsChanged(Z)V

    .line 296
    :cond_78
    :goto_78
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->isPreview:Z

    if-nez v0, :cond_80

    .line 297
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iput-boolean v4, v0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    .line 299
    :cond_80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->access$402(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;)Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    goto :goto_20

    .line 293
    :cond_87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "result == null || isCancelled"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_78
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 198
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->doPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    if-eqz v0, :cond_d

    .line 217
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mShowProgress:Z

    if-eqz v0, :cond_d

    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onProgressStart()V

    .line 221
    :cond_d
    return-void
.end method

.method protected onCancelled()V
    .registers 2

    .prologue
    .line 225
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->onCancelled()V

    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    if-eqz v0, :cond_c

    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->cancel()V

    .line 230
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1d

    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 235
    :cond_1d
    return-void
.end method
