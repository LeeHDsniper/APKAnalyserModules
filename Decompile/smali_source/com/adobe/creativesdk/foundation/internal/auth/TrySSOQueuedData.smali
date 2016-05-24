.class Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;
.super Ljava/lang/Object;
.source "AdobeAuthSignInActivity.java"


# instance fields
.field isRequesUserCancelled:Z

.field tokenDetails:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 276
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;->isRequesUserCancelled:Z

    .line 277
    return-void
.end method
