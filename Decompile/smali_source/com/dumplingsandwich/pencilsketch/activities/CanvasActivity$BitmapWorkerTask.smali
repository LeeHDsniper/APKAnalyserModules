.class Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;
.super Landroid/os/AsyncTask;
.source "CanvasActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BitmapWorkerTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private data:I

.field private final imageViewReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;


# direct methods
.method public constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;Landroid/widget/ImageView;)V
    .registers 4
    .param p2, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 194
    const/4 v0, 0x0

    iput v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->data:I

    .line 198
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    .line 199
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Integer;)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "params"    # [Ljava/lang/Integer;

    .prologue
    .line 203
    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->data:I

    .line 205
    iget-object v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    invoke-virtual {v2}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 206
    .local v0, "display":Landroid/view/Display;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 207
    .local v1, "size":Landroid/graphics/Point;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 209
    iget-object v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    invoke-virtual {v2}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v3, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->data:I

    iget v4, v1, Landroid/graphics/Point;->x:I

    iget v5, v1, Landroid/graphics/Point;->y:I

    invoke-static {v2, v3, v4, v5}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->decodeResource(Landroid/content/res/Resources;III)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 192
    check-cast p1, [Ljava/lang/Integer;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->doInBackground([Ljava/lang/Integer;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 215
    if-eqz p1, :cond_1a

    .line 216
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 217
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_1a

    .line 218
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 221
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    iget v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->data:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->addBitmapToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 224
    .end local v0    # "imageView":Landroid/widget/ImageView;
    :cond_1a
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 192
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$BitmapWorkerTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
