.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;
.super Landroid/os/AsyncTask;
.source "ReusableImageBitmapWorker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;
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
.field private final _dataKey:Ljava/lang/String;

.field private final _onCompleteCallBack:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;
    .param p2, "dataKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p3, "onCompleteCallBack":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Landroid/graphics/Bitmap;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 139
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->_onCompleteCallBack:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    .line 140
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->_dataKey:Ljava/lang/String;

    .line 141
    return-void
.end method

.method private removeTaskFromMap()V
    .registers 4

    .prologue
    .line 144
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->_dataKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;

    .line 145
    .local v0, "task":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;
    if-ne v0, p0, :cond_1b

    .line 147
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->_dataKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :cond_1b
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([[B)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "dateBytes"    # [[B

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 152
    aget-object v0, p1, v3

    .line 153
    .local v0, "imageData":[B
    if-eqz v0, :cond_c

    .line 155
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 172
    :cond_c
    :goto_c
    return-object v1

    .line 170
    :cond_d
    array-length v1, v0

    invoke-static {v0, v3, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_c
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 133
    check-cast p1, [[B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->doInBackground([[B)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onCancelled(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 183
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->removeTaskFromMap()V

    .line 184
    if-eqz p1, :cond_a

    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->_onCompleteCallBack:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 186
    :cond_a
    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 133
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->onCancelled(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 176
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->removeTaskFromMap()V

    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->_onCompleteCallBack:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 178
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 133
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
