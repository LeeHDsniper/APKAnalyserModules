.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;
.super Ljava/lang/Object;
.source "AdobeAssetPSMixFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

.field final synthetic val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

.field final synthetic val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 10

    .prologue
    .line 46
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v6

    if-eqz v6, :cond_60

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getComponents()Ljava/util/ArrayList;

    move-result-object v1

    .line 47
    .local v1, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    :goto_12
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v4, "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    const/4 v2, 0x0

    .line 50
    .local v2, "i":I
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    .line 51
    .local v0, "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const/4 v5, 0x0

    .line 52
    .local v5, "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_62

    .line 53
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v7

    const-string v8, "rendition"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_62

    .line 54
    move-object v5, v0

    .line 55
    if-eqz v5, :cond_62

    .line 56
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixPage;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    invoke-direct {v3, v6, v2, v5, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixPage;-><init>(Ljava/lang/String;ILcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 57
    .local v3, "mixPage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixPage;
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .end local v0    # "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .end local v3    # "mixPage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixPage;
    .end local v5    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_4c
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_56

    .line 65
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    iput-object v4, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;->pages:Ljava/util/ArrayList;

    .line 68
    :cond_56
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    if-eqz v6, :cond_5f

    .line 69
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-interface {v6}, Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;->onCompletion()V

    .line 70
    :cond_5f
    return-void

    .line 46
    .end local v1    # "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    .end local v2    # "i":I
    .end local v4    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    :cond_60
    const/4 v1, 0x0

    goto :goto_12

    .line 61
    .restart local v0    # "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .restart local v1    # "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    .restart local v2    # "i":I
    .restart local v4    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    .restart local v5    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_62
    add-int/lit8 v2, v2, 0x1

    .line 62
    goto :goto_1c
.end method
