.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;
.super Ljava/lang/Enum;
.source "AdobeEntitlementServices.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AdobeCloudServicePrerequisite"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisiteImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisiteMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisitePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisiteStorageArchive:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisiteStorageAsset:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

.field public static final enum AdobeCloudServicePrerequisiteStorageLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 121
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisiteNone"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 122
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisiteStorageFile"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 123
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisiteStorageAsset"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageAsset:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 124
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisiteStorageLibrary"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 125
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisiteStorageArchive"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageArchive:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 126
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisitePhoto"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisitePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 127
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisiteMarket"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 128
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    const-string v1, "AdobeCloudServicePrerequisiteImage"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 120
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageAsset:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageArchive:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisitePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

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
    .line 120
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 120
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;
    .registers 1

    .prologue
    .line 120
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    return-object v0
.end method
