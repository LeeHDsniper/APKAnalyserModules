.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler$1;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommandsHandler.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/IAdobeAssetViewCommandHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;->RegisterCommandHandlers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V
    .registers 4
    .param p1, "command"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;->HandleCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    .line 52
    return-void
.end method
