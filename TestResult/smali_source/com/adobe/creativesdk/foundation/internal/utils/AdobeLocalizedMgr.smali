.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;
.super Ljava/lang/Object;
.source "AdobeLocalizedMgr.java"


# direct methods
.method public static getLocalizedString(I)Ljava/lang/String;
    .registers 4
    .param p0, "id"    # I

    .prologue
    .line 29
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 30
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 31
    .local v1, "res":Landroid/content/res/Resources;
    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
