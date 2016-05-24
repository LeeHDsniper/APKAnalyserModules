.class Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$2;
.super Ljava/lang/Object;
.source "AdobeUXAssetBrowser.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


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
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

.field final synthetic val$op:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    .prologue
    .line 192
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$2;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$2;->val$op:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$2;->val$op:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;

    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;->_error:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .line 196
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 192
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$2;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
