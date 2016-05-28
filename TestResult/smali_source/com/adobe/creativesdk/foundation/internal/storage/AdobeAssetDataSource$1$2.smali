.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;
.super Ljava/lang/Object;
.source "AdobeAssetDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->onCompletion(Ljava/util/ArrayList;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

.field final synthetic val$itemArray:Ljava/util/ArrayList;

.field final synthetic val$packageObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Ljava/util/ArrayList;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    .prologue
    .line 282
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->val$packageObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->val$itemArray:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 285
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->newData:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->val$packageObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->numberProcessed:[I

    aget v1, v0, v2

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, v2

    .line 289
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->val$itemArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->numberProcessed:[I

    aget v1, v1, v2

    if-ne v0, v1, :cond_27

    .line 290
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->allItemsLoaded()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;)V

    .line 291
    :cond_27
    return-void
.end method
