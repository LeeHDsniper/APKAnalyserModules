.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr$ObservableWrapper;
.super Ljava/lang/Object;
.source "AdobeAssetBrowserCommandMgr.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ObservableWrapper"
.end annotation


# instance fields
.field private _handlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;)V
    .registers 3

    .prologue
    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr$ObservableWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr$ObservableWrapper;->_handlers:Ljava/util/ArrayList;

    .line 38
    return-void
.end method


# virtual methods
.method public add(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;)V
    .registers 3
    .param p1, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr$ObservableWrapper;->_handlers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    return-void
.end method

.method public notify(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 47
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr$ObservableWrapper;->_handlers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;

    .line 48
    .local v0, "handler":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;
    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;->handle(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_6

    .line 50
    .end local v0    # "handler":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;
    :cond_16
    return-void
.end method

.method public remove(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;)V
    .registers 3
    .param p1, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr$ObservableWrapper;->_handlers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method
