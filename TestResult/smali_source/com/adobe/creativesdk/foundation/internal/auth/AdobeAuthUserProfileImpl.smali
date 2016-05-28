.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;
.super Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
.source "AdobeAuthUserProfileImpl.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;-><init>()V

    return-void
.end method


# virtual methods
.method public setAdobeID(Ljava/lang/String;)V
    .registers 2
    .param p1, "adobeID"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->adobeID:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .registers 2
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->displayName:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .registers 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->email:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setEnterprise(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->isEnterprise:Z

    .line 60
    return-void
.end method

.method public setFirstName(Ljava/lang/String;)V
    .registers 2
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->firstName:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .registers 2
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->lastName:Ljava/lang/String;

    .line 44
    return-void
.end method
