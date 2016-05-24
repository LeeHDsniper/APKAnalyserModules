.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;
.super Ljava/lang/Enum;
.source "AdobeCloudServiceType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypeClipBoard:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypeEntitlement:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypeImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypeMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypeNotification:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

.field public static final enum AdobeCloudServiceTypeUnknown:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;


# instance fields
.field private _val:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypeUnknown"

    invoke-direct {v0, v1, v4, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeUnknown:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 28
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypeImage"

    invoke-direct {v0, v1, v5, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypeMarket"

    invoke-direct {v0, v1, v6, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypePhoto"

    invoke-direct {v0, v1, v7, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypeStorage"

    invoke-direct {v0, v1, v8, v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypeEntitlement"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeEntitlement:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypeNotification"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeNotification:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 34
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v1, "AdobeCloudServiceTypeClipBoard"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeClipBoard:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .line 25
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeUnknown:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeEntitlement:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeNotification:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeClipBoard:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "val"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 39
    iput p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->_val:I

    .line 40
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->_val:I

    return v0
.end method
