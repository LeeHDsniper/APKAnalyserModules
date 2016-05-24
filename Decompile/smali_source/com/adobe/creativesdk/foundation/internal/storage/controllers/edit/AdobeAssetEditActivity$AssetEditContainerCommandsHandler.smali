.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$AssetEditContainerCommandsHandler;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;
.source "AdobeAssetEditActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AssetEditContainerCommandsHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;)V
    .registers 2

    .prologue
    .line 402
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$AssetEditContainerCommandsHandler;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandsHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$1;

    .prologue
    .line 402
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$AssetEditContainerCommandsHandler;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;)V

    return-void
.end method


# virtual methods
.method protected HandleCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V
    .registers 4
    .param p1, "command"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 411
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSET_EDIT_MOVE_OPERATION:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    if-ne p1, v0, :cond_b

    .line 413
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$AssetEditContainerCommandsHandler;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "data":Ljava/lang/Object;
    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->handleMoveOperation(Ljava/lang/String;)V
    invoke-static {v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;Ljava/lang/String;)V

    .line 415
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSET_EDIT_OPEN_MOVE_CCFILES_BROWSER:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    if-ne p1, v0, :cond_14

    .line 418
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$AssetEditContainerCommandsHandler;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->OpenMoveFileBrowser()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;)V

    .line 420
    :cond_14
    return-void
.end method

.method protected getCommandsListToRegister()Ljava/util/EnumSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;",
            ">;"
        }
    .end annotation

    .prologue
    .line 407
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSET_EDIT_MOVE_OPERATION:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSET_EDIT_OPEN_MOVE_CCFILES_BROWSER:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method
