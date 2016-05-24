.class public final enum Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;
.super Ljava/lang/Enum;
.source "AdobeAuthIMSInfoNeeded.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

.field public static final enum AdobeAuthIMSInfoNeededAgeVerification:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

.field public static final enum AdobeAuthIMSInfoNeededEmailVerification:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

.field public static final enum AdobeAuthIMSInfoNeededMultipleInformation:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

.field public static final enum AdobeAuthIMSInfoNeededTermsOfUse:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

.field public static final enum AdobeAuthIMSInfoNeededUnknownError:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

.field public static final enum AdobeAuthIMSInfoNeededUsernameAndPassword:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;


# instance fields
.field private description:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    const-string v1, "AdobeAuthIMSInfoNeededUnknownError"

    const-string v2, "Unknown Error"

    invoke-direct {v0, v1, v4, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededUnknownError:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .line 26
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    const-string v1, "AdobeAuthIMSInfoNeededUsernameAndPassword"

    const-string v2, "Username And Password Needed"

    invoke-direct {v0, v1, v5, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededUsernameAndPassword:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    const-string v1, "AdobeAuthIMSInfoNeededAgeVerification"

    const-string v2, "Age Verification Needed"

    invoke-direct {v0, v1, v6, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededAgeVerification:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .line 28
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    const-string v1, "AdobeAuthIMSInfoNeededTermsOfUse"

    const-string v2, "Terms Of Use Needed"

    invoke-direct {v0, v1, v7, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededTermsOfUse:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    const-string v1, "AdobeAuthIMSInfoNeededEmailVerification"

    const-string v2, "Email verification Needed"

    invoke-direct {v0, v1, v8, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededEmailVerification:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    const-string v1, "AdobeAuthIMSInfoNeededMultipleInformation"

    const/4 v2, 0x5

    const-string v3, "Multiple Information Needed"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededMultipleInformation:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .line 23
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededUnknownError:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededUsernameAndPassword:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededAgeVerification:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededTermsOfUse:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    aput-object v1, v0, v7

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededEmailVerification:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededMultipleInformation:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 35
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->description:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;
    .registers 1

    .prologue
    .line 23
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    return-object v0
.end method
