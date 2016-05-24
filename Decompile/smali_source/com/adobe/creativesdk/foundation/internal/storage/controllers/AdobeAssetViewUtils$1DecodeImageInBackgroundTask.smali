.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;
.super Landroid/os/AsyncTask;
.source "AdobeAssetViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getBitmapFromData([BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DecodeImageInBackgroundTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<[B",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$onCompleteCallBack:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 271
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;->val$onCompleteCallBack:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([[B)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "dateBytes"    # [[B

    .prologue
    const/4 v3, 0x0

    .line 275
    aget-object v1, p1, v3

    .line 276
    .local v1, "data":[B
    if-eqz v1, :cond_b

    .line 277
    array-length v2, v1

    invoke-static {v1, v3, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 280
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 271
    check-cast p1, [[B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;->doInBackground([[B)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 284
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;->val$onCompleteCallBack:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 285
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 271
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
