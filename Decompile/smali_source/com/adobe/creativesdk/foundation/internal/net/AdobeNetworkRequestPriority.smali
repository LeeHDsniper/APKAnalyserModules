.class public final enum Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;
.super Ljava/lang/Enum;
.source "AdobeNetworkRequestPriority.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

.field public static final enum HIGH:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

.field public static final enum LOW:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

.field public static final enum NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 21
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    const-string v1, "LOW"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->LOW:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    .line 22
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    const-string v1, "NORMAL"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    .line 23
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    const-string v1, "HIGH"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->HIGH:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    .line 20
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->LOW:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->HIGH:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

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
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;
    .registers 1

    .prologue
    .line 20
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    return-object v0
.end method
