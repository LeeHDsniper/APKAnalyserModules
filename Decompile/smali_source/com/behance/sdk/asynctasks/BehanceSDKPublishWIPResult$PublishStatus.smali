.class public final enum Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;
.super Ljava/lang/Enum;
.source "BehanceSDKPublishWIPResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PublishStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

.field public static final enum PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

.field public static final enum SUCCESS:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 29
    new-instance v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    new-instance v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    const-string v1, "PUBLISH_FAILED"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    .line 28
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    sget-object v1, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    aput-object v1, v0, v3

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->$VALUES:[Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

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
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;
    .registers 1

    .prologue
    .line 28
    sget-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->$VALUES:[Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    invoke-virtual {v0}, [Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    return-object v0
.end method
