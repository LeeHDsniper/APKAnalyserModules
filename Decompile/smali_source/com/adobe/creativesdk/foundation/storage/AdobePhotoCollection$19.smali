.class Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$19;
.super Ljava/lang/Object;
.source "AdobePhotoCollection.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->listAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;ILcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .prologue
    .line 482
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$19;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$19;->val$completionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)V
    .registers 5
    .param p2, "previousPage"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .param p3, "nextPage"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            ")V"
        }
    .end annotation

    .prologue
    .line 485
    .local p1, "assets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$19;->val$completionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;

    if-eqz v0, :cond_9

    .line 486
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$19;->val$completionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;

    invoke-interface {v0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;->onCompletion(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)V

    .line 488
    :cond_9
    return-void
.end method
