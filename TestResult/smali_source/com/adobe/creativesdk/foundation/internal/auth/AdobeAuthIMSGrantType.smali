.class public final enum Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;
.super Ljava/lang/Enum;
.source "AdobeAuthIMSGrantType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

.field public static final enum AdobeAuthIMSGrantTypeAuthorization:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

.field public static final enum AdobeAuthIMSGrantTypeDevice:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

.field public static final enum AdobeAuthIMSGrantTypeRefresh:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    const-string v1, "AdobeAuthIMSGrantTypeDevice"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeDevice:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    const-string v1, "AdobeAuthIMSGrantTypeAuthorization"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeAuthorization:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    const-string v1, "AdobeAuthIMSGrantTypeRefresh"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeRefresh:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    .line 23
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeDevice:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeAuthorization:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeRefresh:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

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
    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;
    .registers 1

    .prologue
    .line 23
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    return-object v0
.end method
