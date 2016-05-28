.class Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "CropPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/CropPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GenerateResultTask"
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
.field mActionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

.field mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/CropPanel;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/CropPanel;
    .param p2, "rect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .prologue
    .line 200
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 201
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 202
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 16
    .param p1, "arg0"    # [Landroid/graphics/Bitmap;

    .prologue
    .line 212
    const/4 v9, 0x0

    aget-object v0, p1, v9

    .line 214
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    int-to-double v4, v9

    .line 215
    .local v4, "bitmapWidth":D
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-double v2, v9

    .line 217
    .local v2, "bitmapHeight":D
    new-instance v8, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v8}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>()V

    .line 218
    .local v8, "topLeft":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v10, v9, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    double-to-int v9, v10

    int-to-float v9, v9

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v10, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    double-to-int v10, v10

    int-to-float v10, v10

    invoke-virtual {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;->setValue(FF)V

    .line 220
    new-instance v7, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v7}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>()V

    .line 221
    .local v7, "size":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v10

    double-to-int v9, v10

    int-to-float v9, v9

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v10

    double-to-int v10, v10

    int-to-float v10, v10

    invoke-virtual {v7, v9, v10}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;->setValue(FF)V

    .line 223
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v6, v4, v5, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(DD)V

    .line 225
    .local v6, "previewSize":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v9, v9, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;

    invoke-virtual {v9, v8}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->setTopLeft(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V

    .line 226
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v9, v9, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;

    invoke-virtual {v9, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->setSize(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V

    .line 227
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v9, v9, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;

    invoke-virtual {v9, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->setPreviewSize(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V

    .line 229
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v9, v9, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v9

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->clone()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    iput-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->mActionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 232
    :try_start_6b
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v9, v9, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;

    const/4 v10, 0x0

    aget-object v10, p1, v10

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x1

    invoke-virtual {v9, v10, v11, v12, v13}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->execute(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    :try_end_7a
    .catch Lorg/json/JSONException; {:try_start_6b .. :try_end_7a} :catch_7c

    move-result-object v9

    .line 236
    :goto_7b
    return-object v9

    .line 233
    :catch_7c
    move-exception v1

    .line 234
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 236
    const/4 v9, 0x0

    aget-object v9, p1, v9

    goto :goto_7b
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 196
    check-cast p1, [Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->onProgressEnd()V

    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .line 245
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getAspectRatio()D

    move-result-wide v2

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .line 246
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getAspectRatioIsFixed()Z

    move-result v1

    .line 243
    invoke-virtual {v0, p1, v2, v3, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;DZ)V

    .line 247
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setHighlightView(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)V

    .line 249
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->mActionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 250
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 251
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 252
    return-void
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 196
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->doPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->onProgressStart()V

    .line 207
    return-void
.end method
