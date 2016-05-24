.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeAssetBrowserActionBarController;
.super Ljava/lang/Object;
.source "AdobeAssetBrowserActionBarController.java"


# direct methods
.method public static setActionBarDropDownDetails(ZLjava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 4
    .param p0, "isInRootCollection"    # Z
    .param p1, "titleIfAny"    # Ljava/lang/String;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 12
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 13
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->setDropDownDetails(ZLjava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 14
    :cond_d
    return-void
.end method

.method public static setTitle(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 3
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 17
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeAssetBrowserActionBarController;->setActionBarDropDownDetails(ZLjava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 18
    return-void
.end method
