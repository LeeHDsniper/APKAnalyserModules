.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsKeys.java"


# static fields
.field public static ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS_KEY:Ljava/lang/String;

.field public static ADOBE_ASSET_VIEW_ADD_COMMENTS_URL_KEY:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 7
    const-string v0, "ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys;->ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS_KEY:Ljava/lang/String;

    .line 8
    const-string v0, "ADOBE_ASSET_VIEW_ADD_COMMENTS_URL"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys;->ADOBE_ASSET_VIEW_ADD_COMMENTS_URL_KEY:Ljava/lang/String;

    return-void
.end method
