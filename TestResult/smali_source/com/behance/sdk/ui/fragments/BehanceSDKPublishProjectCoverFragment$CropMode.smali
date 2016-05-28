.class public final enum Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;
.super Ljava/lang/Enum;
.source "BehanceSDKPublishProjectCoverFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CropMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

.field public static final enum DONE:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

.field public static final enum INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 92
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    const-string v1, "INPROGRESS"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    const-string v1, "DONE"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->DONE:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .line 91
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    sget-object v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->DONE:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->$VALUES:[Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

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
    .line 91
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 91
    const-class v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;
    .registers 1

    .prologue
    .line 91
    sget-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->$VALUES:[Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    invoke-virtual {v0}, [Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    return-object v0
.end method
