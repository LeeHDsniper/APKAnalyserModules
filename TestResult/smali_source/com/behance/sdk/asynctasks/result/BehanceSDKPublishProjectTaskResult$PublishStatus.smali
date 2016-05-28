.class public final enum Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;
.super Ljava/lang/Enum;
.source "BehanceSDKPublishProjectTaskResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PublishStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

.field public static final enum CANCELLED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

.field public static final enum CREATION_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

.field public static final enum EXCEPTION:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

.field public static final enum MODULE_ADD_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

.field public static final enum PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

.field public static final enum SUCCESS:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 30
    new-instance v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    new-instance v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    const-string v1, "PUBLISH_FAILED"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    new-instance v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    const-string v1, "CREATION_FAILED"

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CREATION_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    new-instance v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    const-string v1, "MODULE_ADD_FAILED"

    invoke-direct {v0, v1, v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->MODULE_ADD_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    new-instance v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    const-string v1, "EXCEPTION"

    invoke-direct {v0, v1, v7}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->EXCEPTION:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    new-instance v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    const-string v1, "CANCELLED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CANCELLED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    .line 29
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    sget-object v1, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CREATION_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    aput-object v1, v0, v5

    sget-object v1, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->MODULE_ADD_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    aput-object v1, v0, v6

    sget-object v1, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->EXCEPTION:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CANCELLED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    aput-object v2, v0, v1

    sput-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->$VALUES:[Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->$VALUES:[Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    invoke-virtual {v0}, [Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    return-object v0
.end method
