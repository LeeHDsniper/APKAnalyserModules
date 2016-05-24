.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;
.super Ljava/lang/Object;
.source "AdobeCSDKAdobeIdAuthenticatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SharedAccountRequestResultData"
.end annotation


# instance fields
.field isRequestCancelled:Z

.field tokenDetails:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$SharedAccountRequestResultData;->isRequestCancelled:Z

    .line 65
    return-void
.end method
