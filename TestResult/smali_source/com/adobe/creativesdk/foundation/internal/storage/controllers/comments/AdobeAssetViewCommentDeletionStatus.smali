.class public final enum Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;
.super Ljava/lang/Enum;
.source "AdobeAssetViewCommentDeletionStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

.field public static final enum ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

.field public static final enum ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

.field public static final enum ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_IN_PROGRESS:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    const-string v1, "ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    const-string v1, "ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_ERROR"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    .line 9
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    const-string v1, "ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_IN_PROGRESS"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_IN_PROGRESS:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    .line 6
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_IN_PROGRESS:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    return-object v0
.end method
