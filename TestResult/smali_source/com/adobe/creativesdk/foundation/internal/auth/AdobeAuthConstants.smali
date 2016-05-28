.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;
.super Ljava/lang/Object;
.source "AdobeAuthConstants.java"


# static fields
.field static AUTH_SESSION_TYPE_SIGN_IN:I

.field static AUTH_SESSION_TYPE_SIGN_UP:I

.field public static DEFAULT_SIGN_IN_REQUEST_CODE:I

.field static SIGN_IN_UI_TYPE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const/16 v0, 0x7d2

    sput v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->DEFAULT_SIGN_IN_REQUEST_CODE:I

    .line 28
    const/4 v0, 0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_IN:I

    .line 29
    const/4 v0, 0x2

    sput v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_UP:I

    .line 31
    const-string v0, "SIGN_IN_UI_TYPE"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->SIGN_IN_UI_TYPE:Ljava/lang/String;

    return-void
.end method
