.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;
.super Ljava/lang/Object;
.source "AdobePhotoCollectionsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->loadCatalog()V
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
        "Ljava/util/ArrayList",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 92
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->onCompletion(Ljava/util/ArrayList;)V

    return-void
.end method

.method public onCompletion(Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "requestResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;>;"
    const/4 v3, 0x1

    .line 95
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v3, :cond_42

    .line 96
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "More than one catalog was unexpected."

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    :goto_14
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->access$002(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalogLoaded:Z
    invoke-static {v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->access$102(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Z)Z

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    move-result-object v0

    if-eqz v0, :cond_3c

    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;->loadCatalogSucceeded(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V

    .line 105
    :cond_3c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->loadFirstPage()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    .line 106
    return-void

    .line 98
    :cond_42
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Loaded photo catalog."

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_14
.end method
