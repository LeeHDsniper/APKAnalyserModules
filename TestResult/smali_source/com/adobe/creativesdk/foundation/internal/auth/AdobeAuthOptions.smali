.class public final enum Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;
.super Ljava/lang/Enum;
.source "AdobeAuthOptions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

.field public static final enum AdobeAuthOptionsHideSignUpOnSignIn:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

.field public static final enum AdobeAuthOptionsShowSignInOnSignUp:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

.field public static final enum AdobeAuthOptionsUnset:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

.field public static final enum AdobeAuthOptionsUseEmbedded:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    const-string v1, "AdobeAuthOptionsUnset"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsUnset:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    const-string v1, "AdobeAuthOptionsHideSignUpOnSignIn"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsHideSignUpOnSignIn:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    const-string v1, "AdobeAuthOptionsUseEmbedded"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsUseEmbedded:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    .line 35
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    const-string v1, "AdobeAuthOptionsShowSignInOnSignUp"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsShowSignInOnSignUp:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    .line 24
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsUnset:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsHideSignUpOnSignIn:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsUseEmbedded:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsShowSignInOnSignUp:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    aput-object v1, v0, v5

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

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
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    return-object v0
.end method
