.class Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "EnhanceEffectPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RenderTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field mError:Ljava/lang/String;

.field volatile renderFilter:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 234
    # getter for: Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;)Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->renderFilter:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    .line 235
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->mError:Ljava/lang/String;

    .line 236
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;)Landroid/graphics/Bitmap;
    .registers 11
    .param p1, "params"    # [Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    .prologue
    const/4 v3, 0x0

    .line 245
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 246
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "cancelled..."

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    move-object v1, v3

    .line 267
    :cond_11
    :goto_11
    return-object v1

    .line 250
    :cond_12
    const/4 v4, 0x0

    aget-object v2, p1, v4

    .line 251
    .local v2, "type":Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->renderFilter:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    invoke-virtual {v4, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;->setType(Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;)V

    .line 254
    :try_start_1a
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->renderFilter:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v7, 0x1

    const/4 v8, 0x1

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;->execute(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 255
    .local v1, "result":Landroid/graphics/Bitmap;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->renderFilter:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 256
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->name()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V
    :try_end_47
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_47} :catch_58

    .line 263
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_11

    .line 264
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "cancelled..."

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    move-object v1, v3

    .line 265
    goto :goto_11

    .line 257
    .end local v1    # "result":Landroid/graphics/Bitmap;
    :catch_58
    move-exception v0

    .line 258
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 259
    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->mError:Ljava/lang/String;

    move-object v1, v3

    .line 260
    goto :goto_11
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 229
    check-cast p1, [Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->doInBackground([Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Landroid/graphics/Bitmap;)V
    .registers 7
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 273
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->isActive()Z

    move-result v0

    if-nez v0, :cond_14

    .line 274
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "not active..."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 296
    :goto_13
    return-void

    .line 278
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onProgressEnd()V

    .line 280
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 281
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cancelled..."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_13

    .line 285
    :cond_29
    if-eqz p1, :cond_46

    .line 286
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->notifyPixelsChanged(Landroid/graphics/Bitmap;)V

    .line 287
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v3, v2}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V

    .line 294
    :cond_3c
    :goto_3c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iput-boolean v3, v0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mIsRendering:Z

    .line 295
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    # setter for: Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;
    invoke-static {v0, v4}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->access$102(Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;)Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    goto :goto_13

    .line 289
    :cond_46
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->mError:Ljava/lang/String;

    if-eqz v0, :cond_3c

    .line 290
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->mError:Ljava/lang/String;

    const v2, 0x104000a

    invoke-virtual {v0, v1, v2, v4}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onGenericError(Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)V

    goto :goto_3c
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 229
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->doPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onProgressStart()V

    .line 241
    return-void
.end method

.method protected onCancelled()V
    .registers 2

    .prologue
    .line 300
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->renderFilter:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;->stop()Z

    .line 301
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->onCancelled()V

    .line 302
    return-void
.end method
