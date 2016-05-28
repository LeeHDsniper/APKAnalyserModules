.class public Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;
.super Ljava/lang/Object;
.source "AccountResult.java"


# instance fields
.field public final errorMessage:Ljava/lang/String;

.field public final resultCode:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 16
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NO_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;Ljava/lang/String;)V
    .registers 3
    .param p1, "resultCode"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;->resultCode:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 21
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;->errorMessage:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 30
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "AccountResult{resultCode: %s, errorMessage: %s}"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;->resultCode:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;->errorMessage:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
