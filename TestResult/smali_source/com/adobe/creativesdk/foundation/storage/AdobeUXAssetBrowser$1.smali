.class Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;
.super Ljava/lang/Object;
.source "AdobeUXAssetBrowser.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->popupFileBrowser(Landroid/app/Activity;ILcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V
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
        "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$configuration:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;

.field final synthetic val$op:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;Landroid/app/Activity;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;I)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$configuration:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$op:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;

    iput p5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 179
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->onCompletion(Ljava/util/ArrayList;)V

    return-void
.end method

.method public onCompletion(Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 183
    .local p1, "requestResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$activity:Landroid/app/Activity;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 186
    .local v1, "intent":Landroid/content/Intent;
    :try_start_9
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$configuration:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->setBrowserConfigurationDetails(Landroid/content/Intent;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V
    invoke-static {v2, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->access$000(Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;Landroid/content/Intent;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V
    :try_end_10
    .catch Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException; {:try_start_9 .. :try_end_10} :catch_18

    .line 190
    :goto_10
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$activity:Landroid/app/Activity;

    iget v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$requestCode:I

    invoke-virtual {v2, v1, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 191
    return-void

    .line 187
    :catch_18
    move-exception v0

    .line 188
    .local v0, "e":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;->val$op:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;

    iput-object v0, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;->_error:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    goto :goto_10
.end method
