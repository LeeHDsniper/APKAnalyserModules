.class public final enum Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;
.super Ljava/lang/Enum;
.source "AdobeAssetViewAddCommentOperationStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

.field public static final enum ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

.field public static final enum ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    const-string v1, "ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_COMPLETED"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    const-string v1, "ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_ERROR"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    .line 6
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    return-object v0
.end method
