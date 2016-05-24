.class public final enum Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;
.super Ljava/lang/Enum;
.source "AdobeAuthInteraction.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

.field public static final enum AdobeAuthInteractionHeadless:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

.field public static final enum AdobeAuthInteractionInteractive:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    const-string v1, "AdobeAuthInteractionHeadless"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->AdobeAuthInteractionHeadless:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    const-string v1, "AdobeAuthInteractionInteractive"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->AdobeAuthInteractionInteractive:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    .line 23
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->AdobeAuthInteractionHeadless:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->AdobeAuthInteractionInteractive:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;
    .registers 1

    .prologue
    .line 23
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    return-object v0
.end method
