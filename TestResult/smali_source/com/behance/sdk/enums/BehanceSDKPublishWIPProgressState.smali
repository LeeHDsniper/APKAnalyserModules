.class public final enum Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;
.super Ljava/lang/Enum;
.source "BehanceSDKPublishWIPProgressState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum CANCEL_PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum IMAGE_UPLOAD_IN_PROGRESS:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum IMAGE_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum SHARE_ON_FACEBOOK_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field public static final enum SHARE_ON_TWITTER_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 28
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "PUBLISH_STARTED"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 29
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "IMAGE_UPLOAD_IN_PROGRESS"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_IN_PROGRESS:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 30
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "IMAGE_UPLOAD_SUCCESSFUL"

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 31
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "SHARE_ON_FACEBOOK_SUCCESSFUL"

    invoke-direct {v0, v1, v6}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 32
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "SHARE_ON_TWITTER_SUCCESSFUL"

    invoke-direct {v0, v1, v7}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 33
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "SHARE_ON_FACEBOOK_FAILED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 34
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "SHARE_ON_TWITTER_FAILED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 35
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "PUBLISH_SUCCESSFUL"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 36
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "CANCEL_PUBLISH_SUCCESSFUL"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 37
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "CANCEL_PUBLISH_FAILED"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 38
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const-string v1, "PUBLISH_FAILED"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 27
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_IN_PROGRESS:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    aput-object v2, v0, v1

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

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
    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;
    .registers 1

    .prologue
    .line 27
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    return-object v0
.end method
