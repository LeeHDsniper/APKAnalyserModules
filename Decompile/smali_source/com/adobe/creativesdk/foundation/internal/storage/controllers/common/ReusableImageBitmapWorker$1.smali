.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;
.super Ljava/lang/Object;
.source "ReusableImageBitmapWorker.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->loadImageWithData(Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

.field final synthetic val$callback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

.field final synthetic val$dataKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->val$dataKey:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->val$callback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "bitmapResult"    # Landroid/graphics/Bitmap;

    .prologue
    .line 91
    const/4 v0, 0x0

    .line 92
    .local v0, "drawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz p1, :cond_26

    .line 94
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .end local v0    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mResources:Landroid/content/res/Resources;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 96
    .restart local v0    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    move-result-object v1

    if-eqz v1, :cond_21

    .line 97
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->val$dataKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->addBitmapToCache(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;)V

    .line 100
    :cond_21
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->val$callback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 102
    :cond_26
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 88
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;->onCompletion(Landroid/graphics/Bitmap;)V

    return-void
.end method
