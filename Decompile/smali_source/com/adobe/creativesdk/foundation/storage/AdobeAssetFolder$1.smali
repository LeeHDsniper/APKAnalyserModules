.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;
.super Ljava/lang/Object;
.source "AdobeAssetFolder.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getNextPage(ILcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

.field final synthetic val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 11
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 138
    if-eqz p1, :cond_75

    .line 140
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    iput-object p1, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .line 141
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    const/4 v7, 0x1

    iput-boolean v7, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->firstPageLoaded:Z

    .line 143
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .local v5, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getChildren()Ljava/util/ArrayList;

    move-result-object v1

    .line 145
    .local v1, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    if-eqz v1, :cond_6c

    .line 146
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1a
    :goto_1a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;

    .line 150
    .local v0, "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    instance-of v6, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    if-eqz v6, :cond_39

    .line 151
    new-instance v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .end local v0    # "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    iget-object v6, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-direct {v3, v0, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 152
    .local v3, "folder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 153
    .end local v3    # "folder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .restart local v0    # "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    :cond_39
    instance-of v6, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    if-eqz v6, :cond_1a

    move-object v6, v0

    .line 155
    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    iget-object v6, v6, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PHOTOSHOP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->getMimeType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5d

    .line 157
    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    .end local v0    # "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    iget-object v6, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-direct {v4, v0, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 158
    .local v4, "psdFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 161
    .end local v4    # "psdFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;
    .restart local v0    # "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    :cond_5d
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    .end local v0    # "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    iget-object v6, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-direct {v2, v0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 162
    .local v2, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 170
    .end local v2    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :cond_6c
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getNumChildren()I

    move-result v7

    invoke-interface {v6, v5, v7}, Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;->onCompletion(Ljava/util/ArrayList;I)V

    .line 174
    .end local v1    # "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    .end local v5    # "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_75
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 179
    if-eqz p1, :cond_7

    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;->onError(Ljava/lang/Object;)V

    .line 182
    :cond_7
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 133
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method
