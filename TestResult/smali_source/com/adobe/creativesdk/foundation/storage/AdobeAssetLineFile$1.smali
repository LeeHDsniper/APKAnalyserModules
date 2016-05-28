.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;
.super Ljava/lang/Object;
.source "AdobeAssetLineFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

.field final synthetic val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

.field final synthetic val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 16

    .prologue
    .line 48
    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    invoke-virtual {v11}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v11

    if-eqz v11, :cond_7d

    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    invoke-virtual {v11}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getAllChildren()Ljava/util/LinkedHashMap;

    move-result-object v6

    .line 49
    .local v6, "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    :goto_12
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v9, "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    const/4 v8, 0x0

    .line 53
    .local v8, "pageNumber":I
    const-string v7, ""

    .line 55
    .local v7, "pageName":Ljava/lang/String;
    if-eqz v6, :cond_7f

    .line 56
    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_24
    :goto_24
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7f

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 57
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 58
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 59
    .local v5, "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getName()Ljava/lang/String;

    move-result-object v7

    .line 60
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v12

    invoke-virtual {v12, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getComponentsOfChild(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v1

    .line 62
    .local v1, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    const/4 v10, 0x0

    .line 64
    .local v10, "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_4f
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6e

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    .line 65
    .local v0, "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_4f

    .line 66
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v13

    const-string v14, "rendition"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4f

    .line 67
    move-object v10, v0

    .line 72
    .end local v0    # "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_6e
    if-eqz v10, :cond_24

    .line 73
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLinePage;

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    invoke-direct {v4, v7, v8, v10, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLinePage;-><init>(Ljava/lang/String;ILcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 74
    .local v4, "linePage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLinePage;
    add-int/lit8 v8, v8, 0x1

    .line 75
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    .line 48
    .end local v1    # "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "linePage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLinePage;
    .end local v5    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v6    # "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v7    # "pageName":Ljava/lang/String;
    .end local v8    # "pageNumber":I
    .end local v9    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    .end local v10    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_7d
    const/4 v6, 0x0

    goto :goto_12

    .line 83
    .restart local v6    # "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .restart local v7    # "pageName":Ljava/lang/String;
    .restart local v8    # "pageNumber":I
    .restart local v9    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    :cond_7f
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_a5

    .line 85
    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    iput-object v9, v11, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;->pages:Ljava/util/ArrayList;

    .line 89
    if-eqz v6, :cond_a5

    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->size()I

    move-result v11

    const/4 v12, 0x2

    if-gt v11, v12, :cond_a5

    .line 91
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    iget-object v11, v11, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;->pages:Ljava/util/ArrayList;

    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v11}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getName()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v12, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;->name:Ljava/lang/String;

    .line 95
    :cond_a5
    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    if-eqz v11, :cond_ae

    .line 96
    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-interface {v11}, Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;->onCompletion()V

    .line 98
    :cond_ae
    return-void
.end method
