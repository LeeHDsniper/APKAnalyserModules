.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
.super Ljava/lang/Object;
.source "AdobeCSDKAdobeIdAuthenticatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TokenDetails"
.end annotation


# instance fields
.field public adobeId:Ljava/lang/String;

.field public deviceExpirationTime:Ljava/util/Date;

.field public deviceToken:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
